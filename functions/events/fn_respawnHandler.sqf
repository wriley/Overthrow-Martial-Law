if (isDedicated) exitWith {};
_new = _this select 0;
_old = _this select 1;

if(isNull(_old)) exitWith {};

[0,true] call OT_fnc_progressBar;
player setVariable ["COMMSCapturing", false, false];

//remove last body from spawn distance check
{
	if (!(_x isEqualTo _old) && (getplayeruid player) isEqualTo (_x getVariable ["player_uid",false])) then {
		_x setVariable ["player_uid",false,true];
	};
}foreach(alldeadmen);

titleText ["", "BLACK FADED", 0];

waitUntil {alive player};
player setCaptive true;
player allowDamage false;

_group = creategroup resistance;
[player] joinSilent nil;
[player] joinSilent _group;
_recruits = server getVariable ["recruits",[]];
_newrecruits = [];
{
	_owner = _x select 0;
	_name = _x select 1;
	_civ = _x select 2;
	if(_owner isEqualTo (getplayeruid player)) then {
		if(typename _civ isEqualTo "OBJECT") then {
			if(_civ call OT_fnc_playerIsOwner) then {
				[_civ] joinSilent (group player);
				commandStop _civ;
			};
		};
	};
}foreach (_recruits);

removeHeadgear player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;
removeBackpack player;
removeVest player;

player setVariable ["ot_isSmoking", false];
player setVariable ["BeingSearched",nil,true];
player addWeaponGlobal "ItemMap";

_housepos = _old getVariable "home";
_town = _housepos call OT_fnc_nearestTown;
player setPos (_housepos findEmptyPosition [1,20,typeof _new]);
if (uniform _old in OT_illegalUniform) then {
	player forceAddUniform (OT_clothes_guerilla call BIS_fnc_selectRandom);
} else {
	player forceAddUniform uniform _old;
};

for "_i" from 1 to 10 do {player removeEventHandler["InventoryOpened",_i]}; //Saftey measure for search

[] spawn OT_fnc_setupPlayer;

call {
	disableSerialization;
	_display = uiNameSpace getVariable "OT_statsHUD";
	if(isNil "_display") exitWith{};
	_setText = _display displayCtrl 1001;
	_setText ctrlSetStructuredText (parseText "");
	_setText ctrlCommit 0;
};

titleText ["", "BLACK IN", 5];


[] spawn {
	sleep 1;
	if (!zeusToggle) then {
		zeusToggle = !zeusToggle;
		call OT_fnc_toggleZeus;
	};
	sleep 4;
	player allowDamage true;
};
