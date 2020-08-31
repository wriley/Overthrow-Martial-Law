if (!isServer || !OT_whTransferring) exitWith {};
OT_whTransferring = true;
params ["_wid","_cls","_out"];
private _ret = true;
private _d = warehouses getVariable [format["warehouse-%1_%2",_wid,_cls],[_cls,0,[0]]];
if(_d isEqualType []) then {
	_d params ["","_in"];

	if(_out > _in || _out isEqualTo -1) then {
		_out = _in;
	};
	if(_out isEqualTo 0) then {_ret = false};

	private _newnum = _in - _out;
	if(_newnum > 0) then {
		warehouses setVariable [format["warehouse-%1_%2",_wid,_cls],[_cls,_newnum],true];
	}else{
		warehouses setVariable [format["warehouse-%1_%2",_wid,_cls],nil,true];
	};
}else{
	_ret = false;
	warehouses setVariable [format["warehouse-%1_%2",_wid,_cls],nil,true];
};
OT_whTransferring = false;
_ret
