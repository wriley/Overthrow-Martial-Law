
params ["_building","_source","_damage","_instigator"];

private _totalHit = _building getVariable ["totalHit", 0];
diag_log format ["[fn_buildingHitHandler]: params: %1", _this];
diag_log format ["[fn_buildingHitHandler]: _totalHit: %1", _totalHit];
_totalHit = _totalHit + _damage;
_building setVariable ["totalHit", _totalHit];


private _id = [_building] call OT_fnc_getBuildID;
private _type = typeof _building;
private _town = (getpos _building) call OT_fnc_nearestTown;

_perc = "%";
//if !(_id in _damaged) then {
//	_damaged pushback _id;
//	owners setVariable ["damagedBuildings",_damaged,true];
_lastHit = _building getVariable ["_lastHit", -5];
if (_lastHit + time > 0) then {
	if(_type isEqualTo OT_warehouse) then {
		format ["Your Warehouse at %1 was damaged %2%3", _town, round(_totalHit*100), _perc] remoteExec ["hint",0,false];
	};
	if(_type isEqualTo OT_policeStation) then {
		format ["Your Police station at %1 was damaged %2%3", _town, round(_totalHit*100), _perc] remoteExec ["hint",0,false];
	};
};
//};

_building setVariable ["lastHit", time + 5];
