params ["_id","_cls"];
private _ret = 0;
private _d = warehouse getVariable [format["warehouse-%1_%2",_id,_cls],[_cls,0,[0]]];
if(_d isEqualType []) then {
	_d params ["","_in"];
	_ret = _in;
};
_ret
