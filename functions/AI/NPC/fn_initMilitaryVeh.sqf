params ["_unit"];

[_unit, _unit] call ace_common_fnc_claim;

_unit addEventHandler ["GetIn", {
	private _me = (_this select 0);
	if (!(side _me IsEqualTo blufor) && {(alive _me)}) then {
		[objnull, _me] call ace_common_fnc_claim;
	};
}];
