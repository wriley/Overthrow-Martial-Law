private _wh = (_this call OT_fnc_nearestWarehouse) select 0;
if (count _wh > 0) exitWith {((_wh distance _this) < 15)};
false