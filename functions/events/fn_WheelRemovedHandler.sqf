params ["_vehicle", "_hitPointIndex", "_hitPointDamage", ["_useEffects", true]];

private _side = side _vehicle;
if (_side isEqualTo west) then {
	player setCaptive false;
	player call OT_fnc_revealToNATO;
	player call OT_fnc_wantedLoop;
};