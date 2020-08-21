params ["_id","_start","_end","_code","_params","_time"];

(_params + [_id]) spawn _code;
_this set [5,time];