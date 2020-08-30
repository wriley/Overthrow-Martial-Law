params ["_wid","_cls"];
private _ret = 0;
private _d = warehouses getVariable [format["warehouse-%1_2",_wid,_cls],[_cls,0,[0]]];
if(_d isEqualType []) then {
	_d params ["","_in"];
	_ret = _in;
};
_ret
