params ["_jobid"];

private _destinationName = ((position player) call OT_fnc_nearestComms) select 1;
private _params = [_destinationName];
private _markerPos = server getVariable [_destinationName,[]];

private _effect = format["Capturing will passively raise resistance stability and decrease NATO stability in the closest towns.<br/><t size='0.9'>Reward: $10,000 resistance funds</t>"];

//Build a mission description and title
private _description = format["We would greatly benefit if %1 was controlled by the resistance. Kill all the Gendarmerie in the area.<br/><br/>%2",_destinationName,_effect];
private _title = format["Capture %1 for the resistance.",_destinationName];

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    _markerPos,
    {
        //No setup required for this mission
        true
    },
    {
        //Fail check...
        false
    },
    {
        //Success Check
        params ["_destinationName"];

        _destinationName in (server getVariable ["NATOabandoned",[]])
    },
    {
        params ["_destinationName","_wassuccess"];

        //If mission was a success
        if(_wassuccess) then {
            [
                {
                    params ["_destinationName"];

                    [10000] call OT_fnc_resistanceFunds;

                    format ["%1 captured. Donating $10,000 to the resistance. (EFFECT: -/+ 1 Stability/Hr to surrounding towns)",_destinationName] remoteExec ["OT_fnc_notifyMinor",0,false];
                },
                [_destinationName],
                2
            ] call CBA_fnc_waitAndExecute;

        };
    },
    _params
];
