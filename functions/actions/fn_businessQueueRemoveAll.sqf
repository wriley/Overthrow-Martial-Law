private _name = lbText [1500,(lbCurSel 1500)];
server setVariable [format["%1queue",_name],[],true];

[] call OT_fnc_refreshBusiness;
