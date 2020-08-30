params ["_group","_vehicle","_altitude","_autoopen","_saveloadout","_chemlight"];
{
	[_x, _altitude, _autoopen, _saveloadout, _chemlight] spawn OT_fnc_halo;
	sleep .5;
} foreach units _group;
_vehicle setVariable ["OT_deployedTroops",true,true];