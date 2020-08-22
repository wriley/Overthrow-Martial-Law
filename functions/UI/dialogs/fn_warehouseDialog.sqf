params ["_id"];
closeDialog 0;
createDialog "OT_dialog_warehouse";
[_id] call OT_fnc_refreshWarehouse;
lbSetCurSel [1500, 0];