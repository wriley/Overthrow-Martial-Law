_res = _this call OT_fnc_nearestLocation;
_locpos = _res select 2 select 0;
_atwarehouse = (_this distance _locpos < 15);
_atwarehouse