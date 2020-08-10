if (dialog or !OT_finishedHolster) exitWith {};

if (!(handgunWeapon player isEqualTo "") && (currentWeapon player isEqualTo handgunWeapon player)) then {
	//holster weapon
	waitUntil {OT_finishedHolster};
	OT_finishedHolster = false;
	private _handgunState = weaponState player;
	private _handgunItems = handgunItems player;
	player setVariable ["handgunState", _handgunState, true];
	player setVariable ["handgunItems", _handgunItems, true];
	player action ["SwitchWeapon",player,player,100];
	_handgunState spawn { sleep 1.2; player removeWeaponGlobal (_this select 0); OT_finishedHolster = true; sleep 0.6};
} else {
	// reveal weapon
	waitUntil {OT_finishedHolster};
	OT_finishedHolster = false;
	private _handgunState = player getVariable ["handgunState", []];
	private _handgunItems = player getVariable ["handgunItems", []];
	if (count _handgunState > 0) then {
		if!(_handgunState select 0 isEqualTo "") then {
			_handgunState params ["_handgun", "_muzzle", "_firemode", "_magazine", "_magcount"];
			_handgunItems params ["_silencer", "_laser", "_optics", "_bipod"];
			if!(_magazine isEqualTo "") then {player addMagazine [_magazine, _magcount];};
			if!(_handgun isEqualTo "") then {player addWeaponGlobal _handgun;};
			if!(_silencer isEqualTo "") then {player addHandgunItem _silencer;};
			if!(_laser isEqualTo "") then {player addHandgunItem _laser;};
			if!(_optics isEqualTo "") then {player addHandgunItem _optics;};
			if!(_bipod isEqualTo "") then {player addHandgunItem _bipod;};

			player setVariable ["handgunState", [], true];
			player setVariable ["handgunItems", [], true];
		};
		[] spawn { sleep 1.5; OT_finishedHolster = true; };
	} else {
		hint "You don't have a weapon holstered";
	};
};