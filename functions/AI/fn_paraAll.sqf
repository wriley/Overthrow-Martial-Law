params ["_vehicle","_saveloadout","_chemlight"];

{
	[_x, _vehicle, _saveloadout, _chemlight] spawn OT_fnc_para;
} foreach (crew _vehicle);