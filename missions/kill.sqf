//This code is called by the gun dealer or faction rep to retrieve the description and parameters of the mission
private _title = "Kill NATO";

private _groups = [allGroups,[],{(leader _x) distance2D player},"ASCEND",{(side leader _x) isEqualTo west && (count units _x) > 0 && ((leader _x) distance2D player) < 300}] call BIS_fnc_SortBy;
if(count _groups isEqualTo 0) exitWith {[]};

private _unitsInArea = 0;
{
	_unitsInArea = _unitsInArea + count units _x;
}foreach _groups;

private _bluKillsStart = player getVariable ["BLUkills", 0];
private _numToKill = player getVariable ["NATOKillOffer",0];
if (_numToKill == 0) then {
	private _diff = random 100;
	if (_diff < 50) 				then { _numToKill = 1+ceil(random 2) };
	if (_diff >= 50 && _diff < 70) 	then { _numToKill = 2+ceil(random 2) };
	if (_diff >= 70 && _diff < 85)	then { _numToKill = 4+ceil(random 4) };
	if (_diff >= 85 && _diff < 95)	then { _numToKill = 8+ceil(random 4) };
	if (_diff >= 95) 				then { _numToKill = 16+ceil(random 8) };
	_numToKill = _numToKill min (_unitsInArea max 1);
	player setVariable ["NATOKillOffer", _numToKill]; // prevent spamming decline to get more to kill
};
private _reward = _numToKill * 550;//changed from 25

//Build a mission description
private _description = format["Nothing spurs on the resistance more than just killing some blues. Go find %1 NATO scumbags and take care of them.<br/><br/>Reward: $%2",_numToKill,_reward];
private _params = [_reward,_numToKill, _bluKillsStart];

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    position player,
    {
        //No setup
        true
    },
    {
        //No fail
        false
    },
    {
        //Success Check
        params ["","_numToKill","_bluKillsStart"];
		private _bluKills = (player getVariable ["BLUkills", 0]) - _bluKillsStart;
		hint format["Kills %1/%2",_bluKills,_numToKill];
		if (_bluKills > _numToKill) then { _bluKills = _numToKill; };
        _bluKills isEqualTo _numToKill;
    },
    {
        params ["_reward","_numToKill","","_wassuccess"];
        if(_wassuccess) then {
			player setVariable ["NATOKillOffer", 0, true];
            [_reward] call OT_fnc_money;
        };
    },
    _params
];
