params ["_building","_sel","_dmg"];
private _totalDamage = _building getVariable ["totalDamage", 0];
diag_log format ["[fn_buildingDamagedHandler]: params: %1", _this];
diag_log format ["[fn_buildingDamagedHandler]: _totalDamage: %1", _totalDamage];
_totalDamage = _totalDamage + _dmg;
_building setVariable ["totalDamage", _totalDamage];

private _id = [_building] call OT_fnc_getBuildID;
private _ty = typeof _building;
private _town = (getpos _building) call OT_fnc_nearestTown;
private _abandoned = server getVariable ["NATOabandoned",[]];

if(damage _building isEqualTo 1) then {
    _destroyed = owners getVariable ["destroyedBuildings",[]];
    if !(_id in _destroyed) then {
        _destroyed pushback _id;
        owners setVariable ["destroyedBuildings",_destroyed,true];

        if(_ty isEqualTo OT_warehouse) then {
            format ["Warehouse destroyed in %1.", _town] remoteExec ["OT_fnc_notifyBad",0,false];
        };
        if(_ty isEqualTo OT_policeStation) then {
            server setVariable [format["police%1",_town],0,true];
            if(_town in _abandoned) then {
                [_town,-20] call OT_fnc_stability;
                format ["Police Station destroyed in %1",_town] remoteExec ["OT_fnc_notifyBad",0,false];
            };
        };
    };
};