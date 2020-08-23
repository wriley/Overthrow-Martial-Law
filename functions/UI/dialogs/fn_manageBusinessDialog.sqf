closedialog 0;
createDialog "OT_dialog_business";
((findDisplay 8000) displayCtrl 1200) ctrlSetAngle [270, 0.5, 0.5]; 
lbClear 1500;
{
	_idx = lbAdd [1500,_x];
//	_idx = lbAdd [1502,_x]; // only display if need items from primary business selected
}foreach (server getVariable ["GEURowned",[]]);
lbSort [1500,"ASC"];
lbSetCurSel [1500, 0];
[] spawn {
	while {!isNull (findDisplay 8000)} do {
		[] call OT_fnc_refreshBusiness;
		sleep 1;
	};
};