diag_log format ["buildingDamagedHandler: %1", _this];

params ["_obj","_sel","_dmg","","","_attacker"];
private _damaged = owners getVariable ["damagedBuildings",[]];
if !(_obj in _damaged) then {
	_damaged pushback _obj;
	owners setVariable ["damagedBuildings",_damaged,true];
};

private _destroyed = owners getVariable ["destroyedBuildings",[]];
if (((_obj getVariable ["damagedAt", 0]) > time) || (_obj in _destroyed)) exitWith {};

private _type = typeof _obj;
private _perc = "%";
private _town = (getpos _obj) call OT_fnc_nearestTown;

if (_type isEqualTo OT_warehouse) then {
	if (damage _obj isEqualTo 1) then {
		if !(_obj in _destroyed) then {
			format ["Your Warehouse at %1 was destroyed, the contents go up in smoke!", _town] remoteExec ["OT_fnc_notifyMinor",0,false];
			
			//ToDo: heh heh - _warehouse call OT_fnc_doWarehouseGoBoom;

			_destroyed pushback _obj;
			owners setVariable ["destroyedBuildings",_destroyed,true];

			{
				_obj setVariable [_x, nil, true];
			}foreach ((allVariables _obj) select {((toLower _x select [0,10]) isEqualTo "warehouse-")});
		};
	} else {
		if !(_obj in _destroyed) then {
			format ["Your Warehouse at %1 was damaged %2%3", _town, damage _obj, _perc] remoteExec ["OT_fnc_notifyMinor",0,false];
		};
	};
};

if(_type isEqualTo OT_policeStation && !(_obj in _destroyed)) then {
	_abandoned = server getVariable ["NATOabandoned",[]];
	server setVariable [format["police%1",_town],0,true];
	if (damage _obj isEqualTo 1) then {
		if !(_obj in _destroyed) then {
			format ["Police station in %1 was destroyed ",_town] remoteExec ["OT_fnc_notifyMinor",0,false];
			_destroyed pushback _obj;
			owners setVariable ["destroyedBuildings",_destroyed,true];
			if(_town in _abandoned) then {
				[_town,-20] call OT_fnc_stability;
			};
		};
	} else {
		if !(_obj in _destroyed) then {
			format ["Police station in %1 was damaged %2%3",_town, _dmg] remoteExec ["OT_fnc_notifyMinor",0,false];
		};
	};
};

_obj setVariable ["damagedAt", (time+2), true];