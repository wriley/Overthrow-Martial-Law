private _sorted = [];
private _myunits = groupSelectedUnits player;

{
    player groupSelectUnit [_x, false];
} forEach (groupSelectedUnits player);

_myunits params ["_tt"];
if(vehicle _tt != _tt) then {
	_sorted = [vehicle _tt];
}else{
	private _objects = _tt nearEntities [["ReammoBox_F","Land","Air","Ship"],20];
	if(count _objects isEqualTo 0) exitWith {
		"Cannot find any containers or vehicles within 20m of first selected unit" call OT_fnc_notifyMinor;
	};
	_sorted = [_objects,[],{_x distance _tt},"ASCEND"] call BIS_fnc_SortBy;
};

if(count _sorted isEqualTo 0) exitWith {};
private _target = _sorted select 0;
if ((typeOf vehicle ((_myunits select 0))) == "OT_I_Truck_recovery" && (driver vehicle _x) == _x) exitWith {
	[_x] spawn OT_fnc_recover;
};
if (count _myunits > 1) then {
	(_myunits select 1) globalchat format["<%1>: Looting bodies within 100m into the %2", name (_myunits select 0), (typeof _target) call OT_fnc_vehicleGetName];
};
{
	OT_Looters = OT_Looters + 1;
	[_x,_target,OT_Looters] spawn {
		private _active = true;
		private _unit = _this select 0;
		private _t = _this select 1;
		private _count = _this select 2;


		if !([_unit,_t] call OT_fnc_dumpStuff) exitWith {
			_unit globalchat format ["<%1>: This vehicle is full, cancelling loot order", name _unit];
			_active = false;
		};

		_unit setVariable ["OT_looter", true];
		_unit setVariable ["NOAI",true,true];
		_unit setBehaviour "CARELESS";

		private _role = "";
		private _roleindex = -1;
		private _veh = objNull;
		private _hasSupply = false;
		private _supply = objNull;
		private _veh = vehicle _unit;

		if ((count assignedVehicleRole _unit > 0) || ((driver _veh == _unit) && (typeof _veh != "OT_I_Truck_recovery"))) then {
			_role = assignedVehicleRole _unit select 0;
			_hasSupply = ((_veh getVariable ["OT_attachedClass",""]) in ["B_CargoNet_01_ammo_F"]);
			if (_hasSupply) then {
				_unit globalchat format["<%1>: Using supply box as additional storage, sir!", name _unit];
				_supply = _t getVariable ["OT_attachedWeapon",objNull];
			};
			if (_role == "cargo") then {
				_roleindex = _veh getCargoIndex _unit;
			};
			if ((_role == "turret")) then {
				_roleindex = assignedVehicleRole _unit select 1;
			};
			_unit action ["Eject", _veh];
		};

		_timeOut = time + 30;
		waitUntil {(unitReady _unit) || (!alive _unit) || (isNull _t) || (_timeOut < time)};
		_unit doMove getpos _t;
		waitUntil {sleep .1; (!alive _unit) || (isNull _t) || (_unit distance _t < 10) || (unitReady _unit)};
		if(!alive _unit || (isNull _t) || (_timeOut < time)) exitWith {};

		while {_active} do {
			private _deadguy = objNull;
			private _deadguys = [];
			waitUntil {(OT_LootersLastOrder < time)};
			{
				if !((_x distance _t > 100) || (alive _x) || (_x getVariable ["OT_looted",false])) then {
					_deadguys append [_x];
				};
			}foreach(entities "Man");
			if (count _deadguys == 0) exitWith {
				_active = false;
				_unit globalchat format ["<%1>: I'm done!", name _unit];
			};
			_deadguy = ([_deadguys,[],{_x distance _t},"ASCEND"] call BIS_fnc_SortBy) select 0;

			// Take deadguys weapons
            _unit globalchat format["<%1>: %2 bodies left to loot",name _unit, count _deadguys];
			_deadguy setVariable ["OT_looted",true,true];
			OT_LootersLastOrder = time + 2;
			{
				if !(isNull _x) then { //failsafe from objnull unknown reason
					_timeOut = time + 30;
					waitUntil {unitReady _unit || !alive _unit || isNull _t || _timeOut < time};
					_unit doMove position _x;
					waitUntil { (unitReady _unit) && ((!alive _unit) || (isNull _t) || (_timeOut < time) || (isNull _deadguy) || (_unit distance2D position _x < 5)) };

					if((!alive _unit) || (isNull _t) || (isNull _x)) exitWith {};

					_unit action ["TakeWeapon", _x, ((weaponsItems _x select 0) select 0)];
				};
			} forEach (_deadguy getVariable ["WeaponHolderSimulated",[]]);

			_timeOut = time + 30;
			waitUntil {(unitReady _unit) || (!alive _unit) || (isNull _t) || (_timeOut < time)};
			_unit doMove position _deadguy;
			waitUntil { (unitReady _unit) && ((!alive _unit) || (isNull _t) || (_timeOut < time) || (isNull _deadguy) || (_unit distance2D position _deadguy < 5)) };

			if((!alive _unit) || (_timeOut < time) || (isNull _t) || (isNull _deadguy)) exitWith {
				_unit globalchat format ["<%1>: Cant get to a corpse, cancelling loot order", name _unit];
				if (!isNull _deadguy) then {
					_deadguy setVariable ["OT_looted",false,true];
				};
			};

			// Take deadguy
			[_deadguy,_unit] call OT_fnc_takeStuff;
			_deadguy remoteExecCall ["deleteVehicle",_deadguy];

			_timeOut = time + 30;
			waitUntil {(unitReady _unit) || (!alive _unit) || (isNull _t) || (_timeOut < time)};
			_unit doMove getpos _t;
			waitUntil { (unitReady _unit) && ((!alive _unit) || (isNull _t) || (_timeOut < time) || (isNull _deadguy) || (_unit distance2D position _t < 8)) };

			// Dump stuff
			if((!alive _unit) || (isNull _t)) exitWith {};
			if !([_unit,_t] call OT_fnc_dumpStuff) then {
				if (_hasSupply) then {
					if!(_supply isEqualTo objNull) then {
						if !([_unit,_supply] call OT_fnc_dumpStuff) exitWith {
							_unit globalchat format ["<%1>: This supply box is full, cancelling loot order", name _unit];
							_active = false;
						};
					};
				} else {
					_unit globalchat format ["<%1>: This vehicle is full, cancelling loot order", name _unit];
					_active = false;
				};
			};
			[_unit,5] call OT_fnc_experience;
		};

		_timeOut = time + 30;
		if (_role != "" &&  !isNull _veh) then {
			//waitUntil {(unitReady _unit) || (!alive _unit) || (_timeOut < time)};
			_unit doMove getpos _veh;
			waitUntil {((unitReady _unit) && (_unit distance _veh < 8)) || (_timeOut < time)};
			if (_role == "driver") then {
				_unit moveInDriver _veh;
			};
			if (_role == "cargo") then {
				_unit moveInCargo [_veh, _roleindex];
			};
			if (_role == "gunner") then {
				_unit moveInGunner _veh;
			};
			if (_role == "turret") then {
				_unit assignAsTurret [_veh, _roleindex];
				_unit moveInTurret [_veh, _roleindex];
			};
		} else {
			waitUntil {(unitReady _unit) || (_timeOut < time)};
			_unit doMove getpos _t;
		};
		_unit setVariable ["NOAI",true,true];
		_unit setVariable ["OT_looter", nil];
		OT_Looters = OT_Looters - 1;
		if (OT_Looters == 0) then {
			_unit globalchat format ["<%1>: We're done here! Let's go!", name _unit];
		};
	};
}foreach(_myunits);