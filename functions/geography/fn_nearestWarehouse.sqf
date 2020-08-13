private _closest = ([OT_allWarehouses,[],{_x distance _this},"ASCEND"] call BIS_fnc_SortBy) select 0;
private _warehouse = nearestObjects [_closest, [OT_warehouse], 200];
private _id = [_warehouse] call OT_fnc_getBuildID;
[_closest, _id]