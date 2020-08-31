if (!isServer) exitWith {};
_this spawn {
	waitUntil {!OT_whTransferring;};
	OT_whTransferring = true;
	params ["_wid","_cls","_num"];
	private _d = warehouses getVariable [format["warehouse-%1_%2",_wid,_cls],[_cls,0,[0]]];
	if(_d isEqualType []) then {
		_d params ["","_in"];
		private _newnum = _in + _num;
		warehouses setVariable [format["warehouse-%1_%2",_wid,_cls],[_cls,_newnum],true];
	};
	[] remoteExec ["OT_fnc_refreshWarehouse", 0, false];
	OT_whTransferring = false;
};