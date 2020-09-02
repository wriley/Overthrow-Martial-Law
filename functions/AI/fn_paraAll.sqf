params ["_group","_vehicle","_saveloadout","_chemlight"];
{
	[_x, _vehicle, _saveloadout, _chemlight] spawn OT_fnc_para;
	sleep .5;
} foreach units _group;