private _idx = lbCurSel 1500;
private _name = lbText [1500,_idx];
private _employees = server getVariable [format["%1employ",_name],0];

// temporary increase in level per 10 employees
private _level = server getVariable [format["%1level",_name],0];
_employees = _employees - 1;
if(_employees < 0) exitWith {};

if(_employees <= (10*_level)-10) then {
	_level = (_level - 1) max 1;
	server setVariable [format["%1level",_name],_level, true];
};

server setVariable [format["%1employ",_name],_employees,true];
_name remoteExec ["OT_fnc_refreshEmployees",2,false];
lbSetValue [1500,0,-1];
[] call OT_fnc_refreshBusiness;