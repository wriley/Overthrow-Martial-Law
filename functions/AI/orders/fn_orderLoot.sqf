private _sorted = [];
private _myunits = groupSelectedUnits player;

{
    player groupSelectUnit [_x, false];
} forEach (groupSelectedUnits player);

_myunits params ["_tt"];
if(vehicle _tt != _tt) then {
	_sorted = [vehicle _tt];
}else{
	private _objects = _tt nearEntities [["Car","ReammoBox_F","Air","Ship","Tank"],20];
	if(count _objects isEqualTo 0) exitWith {
		"Cannot find any containers or vehicles within 20m of first selected unit" call OT_fnc_notifyMinor;
	};
	_sorted = [_objects,[],{_x distance _tt},"ASCEND"] call BIS_fnc_SortBy;
};

if(count _sorted isEqualTo 0) exitWith {};
private _target = _sorted select 0;

{
    if ((typeOf vehicle _x) == "OT_I_Truck_recovery" && (driver vehicle _x) == _x) exitWith {
        [_x] spawn OT_fnc_recover;
    };
	OT_looters = OT_looters + 1;
	[_x,_target,OT_looters] spawn {
		private _active = true;
		private _unit = _this select 0;
		private _count = _this select 2;

		_unit setVariable ["NOAI",true,true];
		_unit setBehaviour "CARELESS";

		private _role = "";
		private _roleindex = -1;
		private _veh = objNull;

		if (count assignedVehicleRole _unit > 0) then {
			_role = assignedVehicleRole _unit select 0;
			_veh = vehicle _unit;
			if (_role == "cargo") then {
				_roleindex = _veh getCargoIndex _unit;
			};
			if ((_role == "turret")) then {
				_roleindex = assignedVehicleRole _unit select 1;
			};
			_unit action ["Eject", _veh];
		};

		_t = _this select 1;

        if (_count == 1) then { _unit groupchat format["<%1>: Looting bodies within 100m into the %2", name _unit, (typeof _t) call OT_fnc_vehicleGetName]; };

        private _istruck = false;
		_timeout = time + 30;
		waitUntil {(unitReady _unit) || (!alive _unit) || (isNull _t) || (_timeOut < time)};
		_unit doMove getpos _t;
		waitUntil {sleep .1; (!alive _unit) || (isNull _t) || (_unit distance _t < 10) || (unitReady _unit)};
		if(!alive _unit || (isNull _t) || (_timeOut < time)) exitWith {};

		if !([_unit,_t] call OT_fnc_dumpStuff) then {
			_unit groupchat format ["<%1>: This vehicle is full, cancelling loot order", name _unit];
			_active = false;
		};

		while {_active} do {
			private _deadguy = objNull;
			private _deadguys = [];
			waitUntil {(OT_lastlooterorder < time)};
			{
				if !((_x distance _t > 100) || (alive _x) || (_x getVariable ["OT_looted",false])) then {
					_deadguys append [_x];
				};
			}foreach(entities "Man");
			if (count _deadguys == 0) exitWith {
				_active = false;
				_unit groupchat format ["<%1>: I'm done!", name _unit];
			};
			_deadguy = ([_deadguys,[],{_x distance _t},"ASCEND"] call BIS_fnc_SortBy) select 0;

			// Take deadguys weapons
            _unit groupchat format["<%1>: %2 bodies left to loot",name _unit, count _deadguys];
			_deadguy setVariable ["OT_looted",true,true];
			OT_lastlooterorder = time + 2;
			{
				if !(isNull _x) then { //failsafe from objnull unknown reason
					_timeout = time + 30;
					waitUntil {unitReady _unit || !alive _unit || isNull _t || _timeOut < time};
					_unit doMove position _x;
					waitUntil { (unitReady _unit) && ((!alive _unit) || (isNull _t) || (_timeOut < time) || (isNull _deadguy) || (_unit distance2D position _x < 5)) };

					if((!alive _unit) || (isNull _t) || (isNull _x)) exitWith {};

					_unit action ["TakeWeapon", _x, ((weaponsItems _x select 0) select 0)];
				};
			} forEach (_deadguy getVariable ["WeaponHolderSimulated",[]]);

			_timeout = time + 30;
			waitUntil {(unitReady _unit) || (!alive _unit) || (isNull _t) || (_timeOut < time)};
			_unit doMove position _deadguy;
			waitUntil { (unitReady _unit) && ((!alive _unit) || (isNull _t) || (_timeOut < time) || (isNull _deadguy) || (_unit distance2D position _deadguy < 5)) };

			if((!alive _unit) || (_timeOut < time) || (isNull _t) || (isNull _deadguy)) exitWith {
				_unit groupchat format ["<%1>: Cant get to a corpse, cancelling loot order", name _unit];
				if (!isNull _deadguy) then {
					_deadguy setVariable ["OT_looted",false,true];
				};
			};

			// Take deadguy
			[_deadguy,_unit] call OT_fnc_takeStuff;
			_deadguy remoteExecCall ["deleteVehicle",_deadguy];

			_timeout = time + 30;
			waitUntil {(unitReady _unit) || (!alive _unit) || (isNull _t) || (_timeOut < time)};
			_unit doMove getpos _t;
			waitUntil { (unitReady _unit) && ((!alive _unit) || (isNull _t) || (_timeOut < time) || (isNull _deadguy) || (_unit distance2D position _t < 8)) };

			// Dump stuff
			if((!alive _unit) || (isNull _t)) exitWith {};
			[_unit,5] call OT_fnc_experience;
			if !([_unit,_t] call OT_fnc_dumpStuff) exitWith {
				_unit groupchat format ["<%1>: This vehicle is full, cancelling loot order", name _unit];
				_active = false;
			};
		};

		_timeout = time + 30;
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
		OT_looters = OT_looters - 1;
		if (OT_looters == 0) then {
			_unit groupchat format ["<%1>: We're done here! Let's go!", name _unit];
		};
	};
}foreach(_myunits);
