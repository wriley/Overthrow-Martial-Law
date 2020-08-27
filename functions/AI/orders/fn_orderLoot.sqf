private _sorted = [];
private _myunits = groupSelectedUnits player;

{
    player groupSelectUnit [_x, false];
} forEach (groupSelectedUnits player);

_myunits params ["_tt"];
if(vehicle _tt != _tt) then {
	_sorted = [vehicle _tt];
}else{
	private _objects = _tt nearEntities [["ReammoBox_F","LandVehicle","Air","Ship"],20];

	if(count _objects isEqualTo 0) exitWith {
		"Cannot find any containers or vehicles within 20m of first selected unit" call OT_fnc_notifyMinor;
	};
	_sorted = [_objects,[],{_x distance2D _tt},"ASCEND"] call BIS_fnc_SortBy;
};

if(count _sorted isEqualTo 0) exitWith {};
private _target = _sorted select 0;
if (isPlayer _target) then { _target = vehicle player; };
if ((typeOf vehicle ((_myunits select 0))) == "OT_I_Truck_recovery" && (driver vehicle (_myunits select 0)) == (_myunits select 0)) exitWith {
	[(_myunits select 0)] spawn OT_fnc_recover;
};
if (count _myunits > 1) then {
	(_myunits select 1) globalchat format["<%1>: Looting bodies within 100m into the %2", name (_myunits select 0), (typeof _target) call OT_fnc_vehicleGetName];
};
{
	OT_Looters = OT_Looters + 1;
	[_x,_target] spawn {
		params ["_unit", "_t"];

		private _active = true;
		private _err = "";

		private _role = "";
		private _roleindex = -1;
		private _veh = objNull;
		private _hasSupply = false;
		private _supply = objNull;
		private _veh = vehicle _unit;
		private _vehName = (typeof _t) call OT_fnc_vehicleGetName;

		_unit setVariable ["OT_looter", true];
		_unit setVariable ["NOAI",true,true];
		_unit setBehaviour "CARELESS";

		// Get vehicle positions
		if ((count assignedVehicleRole _unit > 0) || ((driver _veh == _unit) && (vehicle _unit != _unit) && (typeof _veh != "OT_I_Truck_recovery"))) then {
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

		// Initial move to vehicle or crate
		_err = [_unit,_t,10] call OT_fnc_orderMove;
		if (_err isEqualTo "Dead") exitWith {};
		if !([_unit,_t] call OT_fnc_dumpStuff) exitWith {
			_unit globalchat format ["<%1>: This vehicle is full, cancelling loot order", name _unit];
			_active = false;
		};

		while {_active} do {
			private _deadguy = objNull;
			private _deadguys = [];
			waitUntil {(OT_LootersLastOrder < time)};
			{
				if !((_x distance2D _t > 100) || (alive _x) || (_x getVariable ["OT_looted",false])) then {
					_deadguys append [_x];
				};
			}foreach(entities "Man");
			if (count _deadguys == 0) exitWith {
				_active = false;
				_unit globalchat format ["<%1>: I'm done!", name _unit];
			};

			// Claim a body
			_deadguy = ([_deadguys,[],{_x distance2D _t},"ASCEND"] call BIS_fnc_SortBy) select 0;
            _unit globalchat format["<%1>: %2 bodies left to loot",name _unit, count _deadguys];
			_deadguy setVariable ["OT_looted",true,true];

			// Take deadguys weapons
			OT_LootersLastOrder = time + 1;
			private _wpns = _deadguy getVariable ["WeaponHolderSimulated",[]];
			if (count _wpns > 0) then {
				{
					diag_log format ["weaponItems: %1", weaponsItems _x];
					_wpn = ((weaponsItems _x select 0) select 0);
					_err = [_unit,_x,6] call OT_fnc_orderMove;
					if (_err isEqualTo "Dead") exitWith { _active = false; };
					_unit action ["TakeWeapon", _x, _wpn];
				} forEach (_wpns);
			};
			if!(_active) exitWith {};

			// Take deadguy
			_err = [_unit,_deadguy,6] call OT_fnc_orderMove;
			if (_err isEqualTo "Dead") exitWith { };
			if (_err isEqualTo "Stuck") then {
				_unit globalchat format ["<%1>: Can't get to a corpse, skipping it.", name _unit];
				_deadguy setVariable ["OT_looted",false,true];
			} else {
				if!(isNull _deadguy) then {
					[_deadguy,_unit] call OT_fnc_takeStuff;
					_deadguy remoteExecCall ["deleteVehicle",_deadguy];
				};
			};

			// Dump stuff
			_err = [_unit,_t,8] call OT_fnc_orderMove;
			if (_err isEqualTo "Dead") exitWith { };
			if (alive _t) then {
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
			};
			[_unit,5] call OT_fnc_experience;
		};

		// Get back in vehicle
		if (!(_role isEqualTo "") && (!isNull _veh && alive _unit) && canMove _veh) then {
			_err = [_unit, _veh, 8] call OT_fncOT_fnc_orderMove;
			if (_err isEqualTo "Dead") exitWith { };
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
			_err = [_unit, _t, 5] call OT_fnc_orderMove;
		};

		// Finish
		_unit setVariable ["NOAI",true,true];
		_unit setVariable ["OT_looter", nil];
		OT_Looters = OT_Looters - 1;
		if (OT_Looters == 0) then {
			_unit globalchat format ["<%1>: We're done here! Let's go!", name _unit];
		};
	};
}foreach(_myunits);