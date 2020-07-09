/*
    Experiment from 2.0 -- Using EH instead of FSM for now.
    -nkenny 
*/

// EH Immediate reaction on explosion
// version 1.5
// by nkenny

// init
params ["_unit", "_damage"];

// Standing or recent explosions ignored or undamaged
if (
    isplayer _unit 
    || {stance _unit isEqualTo "PRONE"}
    || {_unit getVariable ["lambs_danger_isExploded",0] > time}
) exitWith {false};

// settings
private _pos = _unit getPos [4,random 360];
private _dir = 360 - (_unit getRelDir _pos);
_unit setVariable ["lambs_danger_isExploded", time + 12];

// standing to Right prone
if (_dir > 330 && {random 1 > 0.2}) exitWith {
    _unit switchMove "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft";
    _unit spawn {sleep (3 + random 2);if (alive _this) then {_this switchMove "AadjPpneMstpSrasWrflDleft_AmovPercMstpSrasWrflDnon"};_this doWatch objNull;};
    //[{if (alive _this) then {_this switchMove "AadjPpneMstpSrasWrflDleft_AmovPercMstpSrasWrflDnon"};}, _unit, 3 + random 2] call CBA_fnc_waitAndExecute;
};

// standing to Left prone
if (_dir < 30 && {random 1 > 0.2}) exitWith {
    _unit switchMove "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright";
    _unit spawn {sleep (3 + random 2);if (alive _this) then {_this switchMove "AadjPpneMstpSrasWrflDright_AmovPercMstpSrasWrflDnon"};_this doWatch objNull;};
    //[{if (alive _this) then {_this switchMove "AadjPpneMstpSrasWrflDright_AmovPercMstpSrasWrflDnon"};}, _unit, 3 + random 2] call CBA_fnc_waitAndExecute;
};

// update pos
_pos = (_unit getPos [3,_pos getDir _unit]);

// Execute move
_unit doMove _pos;
_unit doWatch _pos;

// all others
_unit switchMove "AmovPercMsprSlowWrflDf_AmovPpneMstpSrasWrflDnon";// straight 
_unit setUnitPos "DOWN";

// get back
//[{if (alive _this) then {_this setUnitPos "AUTO"};}, _unit, 3 + random 2] call CBA_fnc_waitAndExecute;
_unit spawn {
    sleep (4 + random 3);
    if (alive _this) then {_this setUnitPos "AUTO";_this doWatch objNull;};
};

// end
true
