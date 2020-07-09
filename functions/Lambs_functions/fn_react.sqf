// React to contact 
// version 1.43
// by nkenny 

// init
params ["_unit","_pos","_leader","_range"];

// set range 
_range = linearConversion [0,150,(_unit distance _pos),12,55,true];

// drop down!
_stance = (if (_unit distance2d (nearestBuilding _unit) < (15 + random 20) || {_unit call lambs_danger_fnc_indoor}) then {"MIDDLE"} else {selectRandom ["DOWN","DOWN","MIDDLE"]});
_unit setUnitPos _stance;

// Share information!
[_unit,_dangerCausedBy,lambs_danger_radio_shout + random 100,true] call lambs_danger_fnc_shareInformation;

// leaders gestures
[formationLeader _unit,["GestureCover","GestureCeaseFire"]] call lambs_danger_fnc_gesture;

// leaders tell their subordinates!
if (_leader) then {

    // leaders get their subordinates to hide!
    private _buildings = [_unit,_range,true,true] call lambs_danger_fnc_nearBuildings;
    {
        [_x,_pos,_range,_buildings] call lambs_danger_fnc_hideInside;
        _timeout = _timeout + 3;
    } foreach ((units group _unit) select {_x distance2d _unit < 80 && {unitReady _x} && {isNull objectParent _x}});
} else {
    [_unit,_pos,_range] call lambs_danger_fnc_hideInside;
}; 

// delcare contact!
[_unit,1,_pos] call lambs_danger_fnc_leaderMode;

// end 
true 