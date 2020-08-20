params ["_atpos","_attackdir"];
_attackdir = (_attackdir-45) + random 90; //randomize direction a little;

private _range = 500;
private _lowrange = _range - 300;
private _ao = [_atpos,[_lowrange,_range],_attackdir] call SHK_pos_fnc_pos;
private _res = [];

if(surfaceIsWater _ao) then {
	_attackdir = _attackdir + 90;if(_attackdir > 359) then {_attackdir = 360 - _attackdir};
	_ao = [_atpos,[_lowrange,_range],_attackdir] call SHK_pos_fnc_pos;

	if(surfaceIsWater _ao) then {
		_attackdir = _attackdir + 180;if(_attackdir > 359) then {_attackdir = 360 - _attackdir};
		_ao = [_atpos,[_lowrange,_range],_attackdir] call SHK_pos_fnc_pos;

		if(surfaceIsWater _ao) then {
			_attackdir = _attackdir - 90;if(_attackdir > 359) then {_attackdir = 360 - _attackdir};
			_ao = [_atpos,[_lowrange,_range],_attackdir] call SHK_pos_fnc_pos;
		};
	};
};
_res = [_ao, 200, 150] call OT_fnc_getposNoWater;
if (count _res > 0) then { _res } else { _ao };