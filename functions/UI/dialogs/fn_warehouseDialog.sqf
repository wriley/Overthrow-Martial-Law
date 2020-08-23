params ["_id"];
closeDialog 0;
createDialog "OT_dialog_warehouse";
lbSetCurSel [1500, 0];
[_id] call OT_fnc_refreshWarehouse;
player globalchat format ["I opened up warehouse ID: %1", _id];