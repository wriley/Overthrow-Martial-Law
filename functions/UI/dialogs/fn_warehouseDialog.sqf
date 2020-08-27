closeDialog 0;
private ["_wpos","_building","_dist"];
if (vehicle player != player) then {
	private _vehpos = getpos vehicle player;
	private _warehouse = _vehpos call OT_fnc_nearestWarehouse;
	_warehouse params ["_wpos","_building","_dist"];
	OT_currentWarehouse = _building;
	//private _name = _wpos call OT_fnc_nearestTown;
	createDialog "OT_dialog_warehouse";
	player globalchat format ["My vehicle opened up warehouse ID: %1", OT_currentWarehouse];
} else {
	createDialog "OT_dialog_warehouse";
	player globalchat format ["I opened up warehouse ID: %1", OT_currentWarehouse];
};
[] remoteExec ["OT_fnc_refreshWarehouse", 0, false];