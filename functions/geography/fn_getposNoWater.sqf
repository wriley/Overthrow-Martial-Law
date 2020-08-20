/*
    Very Rudimentiary way of finding land not near water, improvements are welcome
	Author: Blanks
	Required Parameters:
      0 Object or Position  Anchor point from where the relative position is calculated from.
      1 Number     			Distance from anchor to start looking.
      2 Number              Radius to check for allowable water.
  Usage:
    Actually getting the position:
      _pos = [parameters] call OT_fnc_getposNoWater;
*/
params ["_start","_dist","_area"];
private _res = [];
private _found = false;
private _rand = [-30,30] select round random 1;
for [{private _i = 0}, {_i < 360 && !_found}, {_i = _i + _rand}] do {
	private _checkpos = [_start, _dist, _i] call BIS_fnc_relPos;
	private _water = false;
	for [{private _i = 0}, {_i < 360 && !_water}, {_i = _i + 30}] do {
		private _checkpos2 = [_checkpos, _area/2, _i] call BIS_fnc_relPos;
		if (surfaceIsWater _checkpos2) then { _water = true; };
	};
	if!(_water) then {
		_found = true;
		_res = _checkpos;
	};
};
_res