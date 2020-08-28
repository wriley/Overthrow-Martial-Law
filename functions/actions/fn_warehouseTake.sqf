private _idx = lbCurSel 1500;
private _cls = lbData [1500,_idx];
if (_cls isEqualTo "") exitWith {};
params ["_warehouse","_dest","_qtyout"];
player globalchat format ["warehouseTake calling transfer: [%1, %2, %3, %4]", _warehouse , _cls, _dest, _qtyout];
_warehouse setVariable ["clientOwnerTaking", clientOwner, true];
[_warehouse, _cls, _dest, _qtyout] remoteExecCall ["OT_fnc_warehouseTransfer", 2, false];
