private _wh = _this call OT_fnc_nearestWarehouse;
if (count _wh > 0) exitWith {(((_wh select 0) distance _this) < 15)};
false