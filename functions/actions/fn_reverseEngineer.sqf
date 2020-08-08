private _idx = lbCurSel 1500;
private _cls = lbData [1500,_idx];
_cost = cost getVariable[_cls,[]];
private _blueprints = server getVariable ["GEURblueprints",[]];
if((count _cost) > 0 && !(_cls in _blueprints)) then {
    closeDialog 0;
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
	"This is too complex for you to reverge engineer." call OT_fnc_notifyMinor;
};
