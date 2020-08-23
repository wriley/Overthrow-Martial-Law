private _name = lbText [1500,(lbCurSel 1500)];
server setVariable [format["%1producing",_name],[],true];

[] call OT_fnc_refreshBusiness;
