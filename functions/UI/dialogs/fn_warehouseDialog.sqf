params [["_vehicle",false]];
closeDialog 0;
if (_vehicle) then {
	private _vehpos = getpos vehicle player;
	private _warehouse = _vehpos call OT_fnc_nearestWarehouse;
	private _wpos = _warehouse select 0;
	private _wid = _warehouse select 1;
	if(((_wpos distance _vehpos) < 30) && !(_wid isEqualTo "-1")) then {
		OT_currentWarehouse = _wid;
		createDialog "OT_dialog_warehouse";
		player globalchat format ["I opened up warehouse ID: %1", OT_currentWarehouse];
		[_wid] call OT_fnc_refreshWarehouse;		
	} else {
		player globalchat format ["No warehouse within 30m"];
		//no warehouse within 30m
	};
} else {
	createDialog "OT_dialog_warehouse";
	player globalchat format ["I opened up warehouse ID: %1", OT_currentWarehouse];
	[OT_currentWarehouse] call OT_fnc_refreshWarehouse;
};
lbSetCurSel [1500, 0];