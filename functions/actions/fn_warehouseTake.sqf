private _idx = lbCurSel 1500;
private _cls = lbData [1500,_idx];
if (_cls isEqualTo "") exitWith {};
params ["_wid","_dest","_qtyout"];
if (_dest isEqualTo player) then {
	_dest = OT_warehouseTarget;
};
player globalchat format ["warehouseTake calling transfer: [%1, %2, %3, %4]", _wid , _cls, _dest, _qtyout];
warehouses setVariable ["clientOwnerTaking", clientOwner, true];
[_wid, _cls, _dest, _qtyout] remoteExecCall ["OT_fnc_warehouseTransfer", 2, false];
