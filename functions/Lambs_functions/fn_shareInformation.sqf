// Share information
// version 1.43
// by nkenny

/*
    Design
        Rank increases range information is shared
    
    Arguments 
        0, unit in question 		[Object]
        1, target being reported	[Object]
        2, default range 			[Number] (default 1000m)
        3, override range and rank?	[Boolean] (default false)
*/

// init
params ["_unit",["_target",ObjNull],["_range",1000],["_override",false]];

// nil or captured
if (_unit distance _target > 3000) exitWith {false};
if ((_unit getVariable ["ace_captives_isHandcuffed",false]) || {_unit getVariable ["ace_captives_issurrendering",false]}) exitWith {false};

// range
private _radio = [_unit,_range,_override] call lambs_danger_fnc_shareInformationRange;
_unit = _radio select 0;
_range = _radio select 1;

// find units
private _grp = allGroups select {
    local _x
    && {side _x isEqualTo side _unit}
    && {leader _x distance2d _unit < _range}
    && {!(behaviour leader _x isEqualTo "CARELESS")}
    && {_x != group _unit}
};

// share information
{
    if (!isNull _target) then {_x reveal [_target,_unit knowsAbout _target];};
    if (leader _x distance _unit < (250 min _range)) then {_x setBehaviour "COMBAT";_x setFormDir ((leader _x) getDir _unit);};
    true
} count _grp;

// debug
if (lambs_danger_debug_functions) then {systemchat format ["%1 share information (knows %2 to %3 groups at %4m range)",side _unit,_unit knowsAbout _target,count _grp,round _range];}; 

// end
true