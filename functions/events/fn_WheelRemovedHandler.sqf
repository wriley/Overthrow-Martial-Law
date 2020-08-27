params ["_vehicle", "_hitPointIndex", "_hitPointDamage", ["_useEffects", true]];

private _side = side _vehicle;
if (_side isEqualTo west) then {
	
	//Set nearest person to vehicle wanted
	_target = getpos _vehicle; 
	_players = []; 
  
	{ 
	if (isplayer _x) then{ 
		_players append [_x]; 
	}; 
	}foreach allPlayers; 
 
	_sorted = [_players,[],{_x distance _target},"ASCEND"] call BIS_fnc_sortBy; 
	_nearestunit = _sorted select 0; 
	
	_nearestunit setCaptive false;
	_nearestunit call OT_fnc_revealToNATO;
};