private _name = _this;
if(_name isEqualTo "Factory") exitWith {[OT_factoryPos,"Factory",[],OT_factoryXP,OT_factoryLevel]};
_data = [];
{
    if((_x select 1) isEqualTo _name) exitWith {
		_data = _x;
		_xp = server getvariable [format["%1xp",_name],0];
		_level = server getvariable [format["%1level",_name],0];
		_nextlevel = _level call {
			if (_this isEqualTo 0) exitWith { 500 };
			if (_this isEqualTo 1) exitWith { 1000 };
			if (_this isEqualTo 2) exitWith { 2000 };
			if (_this isEqualTo 3) exitWith { 5000 };
			if (_this isEqualTo 4) exitWith { 10000 };
			"Achieved Maximum"
		};
		_data set [3, _xp];
		_data set [4, _level];
		_data set [5, _nextlevel];
	};
}foreach(OT_economicData);
_data