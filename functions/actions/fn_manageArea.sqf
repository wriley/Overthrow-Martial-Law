closeDialog 0;
_b = (position player) call OT_fnc_nearestLocation;
if((_b select 1) isEqualTo "Business") then {
	[] call OT_fnc_buyBusiness;
}else{
	if((getpos player) distance OT_factoryPos < 150) then {
		if (call OT_fnc_playerIsGeneral) then {
			_name = "Factory";
			_owned = server getVariable ["GEURowned",[]];
			if(_owned find _name isEqualTo -1) then {
				[] call OT_fnc_buyBusiness;
			}else{
				[] call OT_fnc_factoryDialog;
			};
		};
	};
};
