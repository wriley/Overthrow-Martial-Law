params ["_town",["_rep",nil],["_reason",""],["_player", objNull]];
if (isNil "_town") exitWith {};

private _townrep = (server getVariable [format ["rep%1", _town], 0]);

if !(isNil "_rep") then {
    private _townrep = _townrep + _rep;
    private _totalrep = (server getVariable ["rep",0]) + _rep;
    server setVariable [format ["rep%1",_town], _townrep, true];
    server setVariable ["rep", _totalrep, true];
};

if (_reason != "") then {
    _plus = "+";
    if(_rep < 0) then {_plus = ""};
    if!(_player isEqualTo objNull) then {
        format["%1 (%4%2 %3)", _this select 2, _this select 1, _town, _plus] remoteExec ["OT_fnc_notifyMinor", _player,false];
    }else{
        format["%1 (%4%2 %3)", _this select 2, _this select 1, _town, _plus] remoteExec ["OT_fnc_notifyMinor", 0,false];
    };
};
_townrep;