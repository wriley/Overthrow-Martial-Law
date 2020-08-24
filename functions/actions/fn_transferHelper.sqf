_this spawn {
	params ["_source", "_dest"];

	private _supplycache = _source getVariable ["NATOsupply",false];
	if(_supplycache isEqualType "") then {
		private _me = driver _dest;
		if (_me call OT_fnc_unitSeenNATO) then {
			_me setCaptive false;
			[_me] call OT_fnc_revealToNATO;
		};
		//Make sure box doesnt spawn at this base again (this session)
		spawner setVariable [format["NATOsupply%1",_supplycache],false,true];
	};

	private _toname = (typeof _dest) call OT_fnc_vehicleGetName;
	private _iswarehouse = false;
	private _id = "-1";

	if((typeof _dest) == OT_warehouse) then {
		_toname = "Warehouse";
		_iswarehouse = true;
		_id = (getpos _dest) call OT_fnc_nearestWarehouse select 1;
	};

	private _target = _source;
	if(_target isEqualTo player) then {
		_target = OT_warehouseTarget;
	};

	disableUserInput true;
	[] spawn {
		sleep 10;
		disableUserInput false;
		//Fail safe for user input disabled.
	};
	format["Transferring inventory to %1...",_toname] call OT_fnc_notifyMinor;
	[5,false] call OT_fnc_progressBar;
	private _end = time + 5;

	// Dummy CBA remove calls to strip weapons and replace with non-preset types
	[_target, "Bag_Base"] call CBA_fnc_removeBackpackCargo;
	[_target, "FakeWeapon"] call CBA_fnc_removeWeaponCargo;

	// Strip out preloaded missile dummies from inventory.
	// Only way to really clear them is a full magazine clear.
	private _mags = magazineCargo _target;
	_mags = _mags - OT_noCopyMags;
	clearMagazineCargoGlobal _target;
	{
		_target addMagazineCargoGlobal[_x, 1];
	}foreach(_mags);

	if(_iswarehouse) then {
		{
			_itemArr = _x;
			_itemArr params ["_cls", "_qtyIn"];
			_warehouse = warehouse getVariable [format["warehouse-%1_%2",_id,_cls],[_cls,0]];
			if(_warehouse isEqualType []) then {
				_warehouse params ["",["_qty",0]];
				warehouse setVariable[format["warehouse-%1_%2",_id,_cls],[_cls,_qty + _qtyIn],true];
			};
		}foreach(_target call OT_fnc_unitStock);
		clearMagazineCargoGlobal _target;
		clearWeaponCargoGlobal _target;
		clearBackpackCargoGlobal _target;
		clearItemCargoGlobal _target;
		publicVariable "warehouse";
		[_id] remoteExec ["OT_fnc_refreshWarehouse", 0, false];
	}else{
		{
			_x params [["_cls",""], ["_max",0]];
			private _count = 0;
			private _full = false;
			private _OverFill = (_dest isKindOf "B_Slingload_01_Cargo_F");
			while {_count < _max} do {
				if( !(_dest canAdd [_cls,1]) && {(!_OverFill)}) exitWith {_full = true};
				_count = _count + 1;
				call {
					if(_cls isKindOf "Bag_Base") exitWith {
						_cls = _cls call BIS_fnc_basicBackpack;
						_dest addBackpackCargoGlobal [_cls,1];
					};
					if(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
						_dest addWeaponCargoGlobal [_cls,1];
					};
					if(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
						_dest addWeaponCargoGlobal [_cls,1];
					};
					if(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
						_dest addWeaponCargoGlobal [_cls,1];
					};
					if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
						_dest addMagazineCargoGlobal [_cls,1];
					};
					_dest addItemCargoGlobal [_cls,1];
				};
			};
			call {
				if(_cls isKindOf "Bag_Base") exitWith {
					[_target, _cls, _count] call CBA_fnc_removeBackpackCargo;
				};
				if(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
					[_target, _cls, _count] call CBA_fnc_removeWeaponCargo;
				};
				if(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
					[_target, _cls, _count] call CBA_fnc_removeWeaponCargo;
				};
				if(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
					[_target, _cls, _count] call CBA_fnc_removeWeaponCargo;
				};
				if(_cls isKindOf ["NVGoggles",configFile >> "CfgWeapons"]) exitWith {
					[_target, _cls, _count] call CBA_fnc_removeItemCargo;
				};
				if(_cls isKindOf ["Binocular",configFile >> "CfgWeapons"]) exitWith {
					[_target, _cls, _count] call CBA_fnc_removeWeaponCargo;
				};
				if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
					[_target, _cls, _count] call CBA_fnc_removeMagazineCargo;
				};
				[_target, _cls, _count] call CBA_fnc_removeItemCargo;
			};
			if(_full) exitWith {hint "The vehicle is full, use a truck or ammobox for more storage"};
		}foreach(_target call OT_fnc_unitStock);
	};

	waitUntil {time > _end};
	disableUserInput false;
	"Inventory Transfer done" call OT_fnc_notifyMinor;
};
