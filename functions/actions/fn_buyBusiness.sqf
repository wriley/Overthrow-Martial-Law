private _b = (position player) call OT_fnc_nearestLocation;
if((_b select 1) isEqualTo "Business") then {
    if (call OT_fnc_playerIsGeneral) then {
        private _name = (_b select 0);
        private _pos = (_b select 2) select 0;
        private _price = _name call OT_fnc_getBusinessPrice;
        private _err = true;
		private _owned = server getVariable ["GEURowned",[]];
		if(_owned find _name isEqualTo -1) then {
			private _money = [] call OT_fnc_resistanceFunds;
			if(_money >= _price) then {
				[-_price] call OT_fnc_resistanceFunds;
				server setVariable ["GEURowned",_owned + [_name],true];
				server setVariable [format["%1employ",_name],2,true];
				server setVariable [format["%1xp",_name],0,true];
				server setVariable [format["%1level",_name],1,true];
                _pos remoteExec ["OT_fnc_resetSpawn",2,false];
                format["%1 is now operational",_name] remoteExec ["OT_fnc_notifyMinor",0,false];
                _name setMarkerColor "ColorGUER";
				_contpos = _pos findEmptyPosition [5,100,OT_businessStorage];
				_container = OT_businessStorage createVehicle _contpos;
				[_container,(server getVariable ["generals",[]]) select 0] call OT_fnc_setOwner;
				clearWeaponCargoGlobal _container;
				clearMagazineCargoGlobal _container;
				clearBackpackCargoGlobal _container;
				clearItemCargoGlobal _container;
				{
					_container addItemCargoGlobal [_x, 50];
				} foreach OT_resources;

            } else {
            "The resistance cannot afford this" call OT_fnc_notifyMinor;
			};
        };
    };
}else{
    if((getpos player) distance OT_factoryPos < 100) then {
        if (call OT_fnc_playerIsGeneral) then {
            private _name = "Factory";

            private _owned = server getVariable ["GEURowned",[]];
            if(_owned find _name isEqualTo -1) then {
                private _pos = OT_factoryPos;
                private _price = _name call OT_fnc_getBusinessPrice;
                private _err = true;
                private _money = [] call OT_fnc_resistanceFunds;
                if(_money >= _price) then {
                    [-_price] call OT_fnc_resistanceFunds;
                    server setVariable ["GEURowned",_owned + [_name],true];
                    server setVariable [format["%1employ",_name],2];
					server setVariable [format["%1xp",_name],0];
					server setVariable [format["%1level",_name],1];

                    _pos remoteExec ["OT_fnc_resetSpawn",2,false];
                    format["%1 is now operational",_name] remoteExec ["OT_fnc_notifyMinor",0,false];
                    _name setMarkerColor "ColorGUER";

                    private _veh = OT_factoryPos nearestObject OT_businessStorage;
                    if(_veh isEqualTo objNull) then {
                        private _p = OT_factoryPos findEmptyPosition [5,100,OT_businessStorage];
                        private _veh = OT_businessStorage createVehicle _p;
                        [_veh,(server getVariable ["generals",[]]) select 0] call OT_fnc_setOwner;
                        clearWeaponCargoGlobal _veh;
                        clearMagazineCargoGlobal _veh;
                        clearBackpackCargoGlobal _veh;
                        clearItemCargoGlobal _veh;
                    };
                }else{
                    "The resistance cannot afford this" call OT_fnc_notifyMinor;
                };
            }else{
                //Manage
                [] call OT_fnc_factoryDialog;
            };
        };
    };
};
