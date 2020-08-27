if (!isServer) exitWith {};
waitUntil {!OT_whTransferring;};
OT_whTransferring = true;
diag_log format ["server running addToWarehouse, params:%1", _this];
[format ["server running addToWarehouse, params:%1", _this]] remoteExec ["systemChat", 0, false];
params ["_warehouse","_cls","_num"];
private _d = _warehouse getVariable [format["%1",_cls],[_cls,0,[0]]];
if(_d isEqualType []) then {
	_d params ["","_in"];
	private _newnum = _in + _num;
	_warehouse setVariable [format["warehouse-%1",_cls],[_cls,_newnum],true];
};
[] remoteExec ["OT_fnc_refreshWarehouse", 0, false];
OT_whTransferring = false;