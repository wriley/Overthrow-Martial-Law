closedialog 0;
if (count (server getVariable ["GEURowned",[]]) isEqualTo 0) exitWith { "The resistance has no businesses." call OT_fnc_notifyMinor; };
createDialog "OT_dialog_business";
[] call OT_fnc_refreshBusiness;
lbSetCurSel [1500, 0];