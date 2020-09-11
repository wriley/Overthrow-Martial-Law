params ["_building"];
private _id = [_building] call OT_fnc_getBuildingId;
private _type = typeof _building;
private _town = (getpos _building) call OT_fnc_nearestTown;
private _damage = _building call OT_fnc_getBuildingDamage;

if !(_damage isEqualTo 100) then {
	private _lastDamage = _building getVariable ["lastDamage", 0];
	IF(OT_DEBUG) then { "warehouse taking damage" remoteExec ["systemChat", 0]; };
	if ((_damage - 5) > _lastDamage) then {
		private _perc = "%";
		_building setVariable ["lastDamage", _damage, true];
		if(_type isEqualTo OT_warehouse) then { format ["Your Warehouse at %1 is taking damage (%2%3)", _town, round(_damage), _perc] remoteExec ["hint",0,false]; };
		if(_type isEqualTo OT_policeStation) then {	format ["Your Police station at %1 is taking damage (%2%3)", _town, round(_damage), _perc] remoteExec ["hint",0,false];	};
	};
} else {
	if (damage _building isEqualTo 1) then {
		_destroyed = owners getVariable ["destroyedBuildings",[]];
		if !(_id in _destroyed) then {
			IF (OT_DEBUG) then { format ["ded %1",_type] remoteExec ["systemChat", 0]; };
			_destroyed pushback _id;
			owners setVariable ["destroyedBuildings",_destroyed,true];

			if(_type in [OT_warehouseRuins, OT_warehouse]) then {
				format ["Warehouse destroyed in %1.", _town] remoteExec ["OT_fnc_notifyBad",0,false];
			};
			if(_type in OT_policeStationRuins) then {
				server setVariable [format["police%1",_town],0,true];
				if(_town in _abandoned) then {
					[_town,-20] call OT_fnc_stability;
					format ["Police Station destroyed in %1",_town] remoteExec ["OT_fnc_notifyBad",0,false];
				};
			};
		};
	};
};
