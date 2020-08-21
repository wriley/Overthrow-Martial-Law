params ["_id","_start","_end","_code","_params","_time"];
private _groups = spawner getVariable [_id,[]];
spawner setVariable [_id,[],false];
{
    if(typename _x isEqualTo "GROUP") then {
        {
            if !(_x call OT_fnc_hasOwner) then {
                _x remoteExecCall ["deleteVehicle",_x];
                sleep 0.3;
            };
        }foreach(units _x);
        deleteGroup _x;
    }else{
        if !(_x call OT_fnc_hasOwner) then {
            _x remoteExecCall ["deleteVehicle",_x];
        };
    };
    sleep 0.3;
}foreach(_groups);
