params ["_unit"];

//actually a loop
if!(alive _unit) exitWith {};

//check wanted status
private _timer = _unit getVariable ["OT_wantedTimer",0];
private _hiding = _unit getVariable ["OT_hiding",0];
if !(captive _unit) then {
	//CURRENTLY WANTED
	if(_timer >= 0) then {
		_timer = _timer + 2;
		_hiding = 60 - _timer;
		if(_hiding <= 0) then {
			//hidden for 30 seconds
			_unit setCaptive true;
		}else{
			// seen again?
			if (_unit call OT_fnc_unitSeen) then {
				_unit setCaptive false;
				_timer = 0;
				_hiding = 60;
			};
		};
	}else{
		// Wanted state just started, wait for the first time we are not seen
		if !(_unit call OT_fnc_unitSeen) then {
			_hiding = 60;
			_timer = 0;
		};
	};
} else {
	//CURRENTLY NOT WANTED

	// reset vars for next wanted state
	_timer = -1;
	_hiding = 0;

	private _playerpos = getPosATL _unit;
	private _vehicle = vehicle _unit;

	private _gottem = false;
	if (isPlayer _unit) then { _unit setVariable ["OT_wantedReason", ""]; };

	//Enemy radar detection/No-fly zones
	if((typeOf _vehicle isKindOf ["Air",configFile>>"CfgVehicles"]) && (_playerpos select 2) > 30) then {
		private _base = _playerpos call OT_fnc_nearestObjective;
		if !(isNil "_base") then {
			_base params ["_obpos","_obname"];
			if(
				_obname in OT_allAirports
				&& { !(_obname in (server getVariable ["NATOabandoned",[]])) }
				&& { _obpos distance2D _playerpos < 2000 }
			) then {
				if(isPlayer _unit) then {
					"This is a no-fly zone" call OT_fnc_notifyMinor;
					_unit setVariable ["OT_wantedReason", " (NOFLY)"];
				};
				_unit setCaptive false;
				[vehicle _unit] call OT_fnc_revealToNATO;
				_gottem = true;
			};
		};
	};

	if(_unit call OT_fnc_unitSeenCRIM && !_gottem) then {
		//get closest gang member
		private _ents = _unit nearEntities ["Man",1200];
		private _i = _ents findIf {side _x isEqualTo east};
		if !(_i isEqualTo -1) then {
			private _member = _ents select _i;
			private _gangid = _member getVariable ["OT_gangid",-1];
			private _player = _unit;

			if(_gangid > -1) then {
				private _name = "The gang";
				_gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
				if(count _gang > 0) then {
					_name = _gang select 8;
				};
				if(!isPlayer _unit) then {_player = _unit call OT_fnc_getOwnerUnit};
				private _rep = _player getVariable [format["gangrep%1",_gangid],0];

				if(_rep < -9) exitWith {
					//Gang hates you, instant wanted no matter what
					_unit setCaptive false;
					[_unit] call OT_fnc_revealToCRIM;
					if(isPlayer _unit) then {
						format["%1 have recognized you",_name] call OT_fnc_notifyMinor;
						_unit setVariable ["OT_wantedReason", " (WAR)"];
					};
				};
				if(_rep < 10) then {
					// carrying a static weapon
					if (_unit call OT_fnc_carriesStaticWeapon) exitWith {
						_unit setCaptive false;
						[_unit] call OT_fnc_revealToCRIM;
						if(isPlayer _unit) then {
							format["%1 have seen the static weapon",_name] call OT_fnc_notifyMinor;
							_unit setVariable ["OT_wantedReason", " (ARMED)"];
						};
					};

					// driving with weapons, illegal clothing/gear, in illegal vehicles
					if(!(_vehicle isEqualTo _unit) && { _unit call OT_fnc_illegalInCar }) exitWith {
						//Set the whole car wanted
						{
							_x setCaptive false;
						}foreach(crew vehicle _unit);
						[vehicle _unit] call OT_fnc_revealToCRIM;
					};

					// carrying a weapon .. illegal
					if (_unit call OT_fnc_hasWeaponEquipped) exitWith {
						if(isPlayer _unit) then {
							format["%1 have seen your weapon",_name] call OT_fnc_notifyMinor;
							_unit setVariable ["OT_wantedReason", " (ARMED)"];
						};
						_unit setCaptive false;
						[_unit] call OT_fnc_revealToCRIM;
					};
				};
			};
		};
	} else {
		if(_unit call OT_fnc_unitSeenNATO && !_gottem) then {
			// talking to faction dealers
			if(OT_interactingWith getVariable ["factionrep",false]) exitWith {
				_unit setCaptive false;
				[_unit] call OT_fnc_revealToNATO;
				if(isPlayer _unit) then {
					"You've been caught dealing in the Black Market!" call OT_fnc_notifyMinor;
					_unit setVariable ["OT_wantedReason", " (DEALING)"];
				};
			};
			// talking to gun dealers
			if(OT_interactingWith getVariable ["gundealer",false]) exitWith {
				_unit setCaptive false;
				[_unit] call OT_fnc_revealToNATO;
				if(isPlayer _unit) then {
					"You've been caught dealing with a Gun dealer!" call OT_fnc_notifyMinor;
					_unit setVariable ["OT_wantedReason", " (DEALING)"];
				};
			};
			// smoking
			if(_unit getvariable ["ot_isSmoking",false]) exitWith {
				_unit setCaptive false;
				[_unit] call OT_fnc_revealToNATO;
				if(isPlayer _unit) then {
					"NATO has seen your spliff!" call OT_fnc_notifyMinor;
					_unit setVariable ["OT_wantedReason", " (SPLIFF)"];
				};
			};
			if(_unit call OT_fnc_carriesStaticWeapon) exitWith {
				_unit setCaptive false;
				[_unit] call OT_fnc_revealToNATO;
				if(isPlayer _unit) then {
					"NATO has seen the static weapon" call OT_fnc_notifyMinor;
					_unit setVariable ["OT_wantedReason", " (ARMED)"];
				};
			};
			if(!(_vehicle isEqualTo _unit) && { _unit call OT_fnc_illegalInCar }) exitWith {
				//Set the whole car wanted
				_unit setcaptive false;
				{
					_x setcaptive false;
				}forEach(units _vehicle);
				[vehicle _unit] call OT_fnc_revealToNATO;
				if (isPlayer _unit) then {
					_unit setVariable ["OT_wantedReason", " (STOLEN)"];
				};

				//Record any threats as known targets
				(vehicle _unit) call OT_fnc_NATOreportThreat;
			};
			if(_unit call OT_fnc_hasWeaponEquipped) exitWith {
				_unit setVariable ["OT_wantedReason", " (ARMED)"];
				_unit setCaptive false;
				[_unit] call OT_fnc_revealToNATO;
			};
			//added illegal uniforms
		    if (((headgear _unit in OT_illegalHeadgear) || { (vest _unit in OT_illegalVests) }) || { (uniform _unit in OT_illegalUniform) }) exitWith {
				if(isPlayer _unit) then {
					"You are wearing ILLEGAL gear" call OT_fnc_notifyMinor;
					_unit setVariable ["OT_wantedReason", " (ILLEGAL)"];
				};
				_unit setCaptive false;
				[_unit] call OT_fnc_revealToNATO;
			};

			if(vehicle _unit != _unit && vehicle _unit isKindOf "LandVehicle") then {
				private _offroadDist = 75; //Distance you are allowed off road
				private _checkpointOffroadRange = 150; //Distance from a checkpoint for the stricter off road distance
				private _checkpointOffroadDist = 25;
				if(_unit distance getMarkerPos (_unit call OT_fnc_nearestCheckpoint) < _checkpointOffroadRange) then {
						_offroadDist = _checkpointOffroadDist
				};
				if(isNull ([position _unit, _offroadDist] call BIS_fnc_nearestRoad)) then {
					if(isPlayer _unit) then {
						"You are driving offroad" call OT_fnc_notifyMinor;
						_unit setVariable ["OT_wantedReason", " (OFFROAD)"];
					};
					_unit setCaptive false;
					[_unit] call OT_fnc_revealToNATO;
				};
			};

			if !(hmd _unit isEqualTo "") exitWith {
				if(isPlayer _unit) then {
					"NATO has spotted your NV Goggles" call OT_fnc_notifyMinor;
					_unit setVariable ["OT_wantedReason", " (NVGs)"];
				};
				_unit setCaptive false;
				[_unit] call OT_fnc_revealToNATO;
			};
			/* // too buggy to take serious
			if(isPlayer _unit) then { //Who dosn't like a random search
				if (random 1000 < 4) exitWith { //2/1000 chance every second to have chance of being searched
					[_unit] spawn OT_fnc_NATOsearch;
				};
			};
			*/
			// restricted areas
			{
				private _unitpos = getPosATL _unit;
				if ([_unitpos,_x] call SHK_pos_fnc_isInCircle) then {
					if(isPlayer _unit) then {
						"You are in a restricted area" call OT_fnc_notifyMinor;
						_unit setVariable ["OT_wantedReason", " (RESTRICTED)"];
					};
					_unit setCaptive false;
					[_unit] call OT_fnc_revealToNATO;
				};
			} foreach ((allMapMarkers) select {("restrict" in _x)});
			
			//check warehouses with near players
			if (getpos _unit call OT_fnc_positionIsAtWarehouse) then {
				(nearestBuilding ((getpos _unit call OT_fnc_nearestWarehouse) select 0)) call OT_fnc_NATOreportThreat;
			};
		};
	};
};
// NATO attacks
private _attack = server getVariable ["NATOattacking",""];
if!(_attack isEqualTo "") then {
	private _pos = server getVariable [_attack, [-5000,-5000,0]];
	private _playerpos = getPosATL _unit;
	if(_pos distance2D _playerpos < 1000) then {
		//Radar is active here
		if((_playerpos select 2) > 30) then {
			_unit setCaptive false;
			_hiding = 30;
			_timer = 0;
			[vehicle _unit] call OT_fnc_revealToNATO;
		};
	};
};

// save the vars
_unit setVariable ["OT_wantedTimer",_timer,true];
_unit setVariable ["OT_hiding",_hiding,true];

// loop
[
	OT_fnc_wantedLoop,
	_this,
	2
] call CBA_fnc_waitAndExecute;
