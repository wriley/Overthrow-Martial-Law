params ["_unit", "_to", ["_dis",6]];

_unit globalchat format ["<%1>: moving to %2 of distance %3/%4", name _unit, _to, getpos _unit distance2D getpos _to, _dis];
diag_log format ["<%1>: moving to %2 of distance %3/%4", name _unit, _to, getpos _unit distance2D getpos _to, _dis];
private _moving = true;
private _time = 3;
private _fail = 0;
private _err = "";
private _oldpos = getpos _unit;
private _newpos = getpos _unit;

while {_moving} do {
	_oldpos = getpos _unit;
	private _distance = getpos _unit distance2D getpos _to;
	private _moveDistance = _newpos distance2D _oldpos;
	if (_distance < _dis) then {
		_moving = false;
	};
	if (_moveDistance isEqualTo 0) then { _time = _time +1; };
	if (_moveDistance isEqualTo 0 && alive _unit && _distance > _dis && _time > 3) then {
		//_unit globalchat format ["<%1>: Stuck? sending move order", name _unit];
		_unit doMove getpos _to;
		_fail = _fail + 1;
		_time = 0;
	};
	if (!alive _unit) then {
		_err = "Dead";
		_moving = false;
	};
	if (isNull _to) then {
		_err = "NullObj";
		_moving = false;
	};
	if (_fail > 5) then {
		_err = "Stuck";
		_moving = false;
	};
	sleep 1;
	_newpos = getpos _unit;
};
_err