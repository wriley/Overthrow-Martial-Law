closedialog 0;
createDialog "OT_dialog_business";
private _isGeneral = (getPlayerUID player) in (server getVariable ["generals",[]]);
if(!isMultiplayer) then {_isGeneral = true};
lbClear 1500;
{
	_idx = lbAdd [1500,_x];
	_idx = lbAdd [1502,_x];
}foreach (server getVariable ["GEURowned",[]]);
lbSort [1500,"ASC"];
lbSort [1502,"ASC"];