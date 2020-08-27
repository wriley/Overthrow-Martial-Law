params ["_unit","_warehouse"];
private _from = vehicle _unit;

if (_from isEqualTo player) then {
	_from = OT_warehouseTarget;
};

if (isNull _from || isNil "_from") exitWith {};

[_from, _warehouse] call OT_fnc_transferHelper;