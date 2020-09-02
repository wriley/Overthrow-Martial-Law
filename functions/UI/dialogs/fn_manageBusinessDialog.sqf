closedialog 0;
if (count (server getVariable ["GEURowned",[]]) isEqualTo 0) exitWith { "The resistance has no businesses." call OT_fnc_notifyMinor;};
createDialog "OT_dialog_business";
((findDisplay 8000) displayCtrl 1200) ctrlSetAngle [270, 0.5, 0.5];
lbClear 1500;
{
	_idx = lbAdd [1500,_x];
}foreach (server getVariable ["GEURowned",[]]);
lbSort [1500,"ASC"];
lbSetCurSel [1500, 0];
[] spawn {
	while {!isNull (findDisplay 8000)} do {
		[] call OT_fnc_refreshBusiness;
		sleep 1;
	};
};