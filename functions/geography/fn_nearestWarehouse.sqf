private _nearest = [OT_allWarehouses, _this] call BIS_fnc_nearestPosition;
private _id = "-1";
if (count _nearest > 0) then {
	_id = format ["%1%2", floor(_nearest select 0), floor(_nearest select 1)];
};
[_nearest,_id]