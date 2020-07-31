params ["_unit","_target","_found","_IsAirport"];
//For garrisoned vehicles
[_unit, _unit] call ace_common_fnc_claim;

if !(_target isEqualTo "") then {
	_unit setVariable ["UnitTarget",_target,false];
	_unit setVariable ["UnitFound",_found,false];
	_unit setVariable ["IsAirport",_IsAirport,false];

	_unit addEventHandler ["Killed", {
		private _me = (_this select 0);
		private _target = _me getVariable "UnitTarget";
		private _found = _me getVariable "UnitFound";
		private _IsAirport = _me getVariable "IsAirport";
		private _vehgarrison = (_target select 3);
		private _type = TypeOf _me;
		private _ListNum = _vehgarrison find _type;
		private _rem = _vehgarrison deleteAt _ListNum;
		if !(_IsAirport) then {
			OT_objectiveData set [_found,[_target select 0,_target select 1,_target select 2,_vehgarrison]];
		}else{
			OT_airportData set [_found,[_target select 0,_target select 1,_target select 2,_vehgarrison]];
		};
	}];

	_unit addEventHandler ["GetOut", {
		private _me = (_this select 0);
		if (!(side _me IsEqualTo blufor) && {(alive _me)}) then {
			[objnull, _unit] call ace_common_fnc_claim;
			//To Do: Remove from garrison
		};
	}];
};
	
_unit addEventHandler ["GetIn", {
	private _me = (_this select 0);
	if (!(side _me IsEqualTo blufor) && {(alive _me)}) then {
		[objnull, _me] call ace_common_fnc_claim;
	};
}];