closedialog 0;
if (count (server getVariable ["GEURowned",[]]) isEqualTo 0) exitWith { "The resistance has no businesses." call OT_fnc_notifyMinor; };
createDialog "OT_dialog_business";
lbClear 1500;
{
	_idx = lbAdd [1500,_x];
	_queue = server getVariable [format["%1queue", _x], []];
	if (count _queue > 0) then {
		lbSetColor [1500, _idx, [0, .8, 0, 1]];
	};
}foreach (server getVariable ["GEURowned",[]]);
lbSort [1500,"ASC"];
lbSetCurSel [1500, 0];