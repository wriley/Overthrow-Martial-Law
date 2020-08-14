private _nearest = [OT_allWarehouses, _this] call BIS_fnc_nearestPosition;
private _warehouse = nearestObjects [_nearest, [OT_warehouse], 5];
private _id = [_warehouse] call OT_fnc_getBuildID;
[_nearest, _id]