params ["_unit"];

private _b = _unit call OT_fnc_nearestRealEstate;
if(typename _b isEqualTo "ARRAY") then {
	_building = _b select 0;
	if((typeof _building) == OT_warehouse && _building call OT_fnc_hasOwner) then {
		([_building] call OT_fnc_getBuildID)
	};
} else {
	0
};
