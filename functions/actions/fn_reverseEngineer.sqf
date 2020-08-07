private _idx = lbCurSel 1500;
private _cls = lbData [1500,_idx];
_cost = cost getVariable[_cls,[]];
private _blueprints = server getVariable ["GEURblueprints",[]];
if((count _cost) > 0 && !(_cls in _blueprints)) then {
    closeDialog 0;
	if(_cls isEqualTo "OT_NatoData") then {
	hint "Is Data";
	};
    if(!(_cls isKindOf "Bag_Base") && _cls isKindOf "AllVehicles") then {
		private _veh = OT_factoryPos nearestObject _cls;
		if (!((side _veh isEqualTo blufor) || ({side _veh isEqualTo opfor}))) then {
				deleteVehicle _veh;
				_blueprints pushBack _cls;
				server setVariable ["GEURblueprints",_blueprints,true];
				if (_cls in OT_NATOBluprints) then {
					OT_NATOBluprints deleteAt (OT_NATOBluprints find _cls);
				};	
				"Vehicle is now available for production" call OT_fnc_notifyMinor;
			}else{
				"Cannot reverse-engineer this, make sure the vehicle isn't crewed by an enemy faction" call OT_fnc_notifyMinor;
			};
    }else{
        player removeItem _cls;
		_blueprints pushBack _cls;
		server setVariable ["GEURblueprints",_blueprints,true];
		"Item is now available for production" call OT_fnc_notifyMinor;
    };
}else{
	if(_cls isEqualTo "OT_NatoData") then {
			closeDialog 0;
			if ((count OT_NATOBluprints) > 0) then {
				player removeItem _cls;
				private _rancls = selectRandom OT_NATOBluprints;
				OT_NATOBluprints deleteAt (OT_NATOBluprints find _rancls);
				publicVariable "OT_NATOBluprints";
				_blueprints pushBack _rancls;
				server setVariable ["GEURblueprints",_blueprints,true];
				private _displayName = getText (configFile >>  "CfgVehicles" >> _rancls >> "displayName"); 
				format ["The laptop has been cracked and granted us the neccesary data to construct the %1",_displayName] call OT_fnc_notifyMinor;
		}else{
			format ["We have gained all we can learn from NATO technology"] call OT_fnc_notifyMinor;
		};
	}else{
		"This item cannot be reverse-engineered " call OT_fnc_notifyMinor;
	};
};
