if (!isServer) exitwith {};
params ["_town","_spawnid"];
sleep random 2;

_count = 0;
private _building = objNull;
private _posTown = server getVariable _town;
private _pop = server getVariable format["population%1",_town];

private _groups = [];

private _gundealerpos = server getVariable format["gundealer%1",_town];
if(isNil "_gundealerpos") then {
	_building = [_posTown,OT_gunDealerHouses] call OT_fnc_getRandomBuilding;
	if(typename _building != "BOOL") then {
		_gundealerpos = (_building call BIS_fnc_buildingPositions) call BIS_fnc_selectRandom;
		[_building,"system"] call OT_fnc_setOwner;
	}else{
		_gundealerpos = [[[_posTown,200]]] call BIS_fnc_randomPos;
	};
	server setVariable [format["gundealer%1",_town],_gundealerpos,true];
};
private _group = createGroup civilian;
_groups	pushback _group;

_group setBehaviour "CARELESS";
private _dealer = _group createUnit [OT_civType_gunDealer, _gundealerpos, [],0, "NONE"];

[_dealer] call OT_fnc_initGunDealer;

_dealer setVariable ["gundealer",true,true];
_dealer setVariable ["loc",format["%1",_gundealerpos],true];
spawner setVariable [format ["gundealer%1",_town],_dealer,true];
sleep 0.3;

spawner setvariable [_spawnid,(spawner getvariable [_spawnid,[]]) + _groups,false];
