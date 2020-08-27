params ["_warehouse","_cls"];
private _ret = 0;
private _d = _warehouse getVariable [format["%1",_cls],[_cls,0,[0]]];
if(_d isEqualType []) then {
	_d params ["","_in"];
	_ret = _in;
};
_ret
