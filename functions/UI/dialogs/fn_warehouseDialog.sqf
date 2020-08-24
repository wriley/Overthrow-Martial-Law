closeDialog 0;
if (vehicle player != player) then {
	private _vehpos = getpos vehicle player;
	private _warehouse = _vehpos call OT_fnc_nearestLocation;
	private _wpos = _warehouse select 2 select 0;
	private _wid = _warehouse select 0;
	if ((_wpos distance _vehpos) < 30) then {
		OT_currentWarehouse = _wid;
		private _name = _wpos call OT_fnc_nearestTown;
		createDialog "OT_dialog_warehouse";
		private _idx = lbAdd [2100,format["%1 - %2", _name, _wid]];
		lbSetData [2100,0,_wid];
		player globalchat format ["I opened up warehouse ID: %1", OT_currentWarehouse];
		[] call OT_fnc_refreshWarehouse;
	} else {
		player globalchat format ["No warehouse within 30m"];
		//no warehouse within 30m
	};
} else {
	createDialog "OT_dialog_warehouse";
	player globalchat format ["I opened up warehouse ID: %1", OT_currentWarehouse];
	[] call OT_fnc_refreshWarehouse;
};
lbSetCurSel [1500, 0];
