disableSerialization;
private _sel = lbCurSel 1500;
if(_sel isEqualTo -1) exitWith {};

private _id = lbData [1500, _sel];
private _veh = _id call BIS_fnc_objectFromNetId;

if (((_veh call OT_fnc_getOwner) != (getplayeruid player)) && !(call OT_fnc_playerIsGeneral)) exitWith {"You do not own this vehicle" call OT_fnc_notifyMinor};

if(!isNil "_veh") then {
	private _var = _veh getVariable ["CanDelete",false];
	if({alive _x} count crew _veh == 0) then {
		if (_var isEqualTo false) then {
			deleteVehicle _veh;
		}else{
			"This vehicle cannot be deleted" call OT_fnc_notifyMinor;
		};
	}else{
		"The vehicle must be empty" call OT_fnc_notifyMinor;
	};
};
