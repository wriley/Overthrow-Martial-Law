params ["_group", "_dirOff"];
private _xStart = 0;
private _yStart = 0;
private _numStatic = 0;
{
	if (vehicle _x != _x) then {
		_numStatic = _numStatic + 1;
		_xStart = _xStart + (getPos _x select 0); 
		_yStart = _yStart + (getPos _x select 1);
	}
}foreach units _group;

private _start = [(_xStart / _numStatic),(_yStart / _numStatic)];

private _avoidCheckRange = 175;
private _outerRange = 70;
private _innerRange = 30;
private _searchingRange = 5;
private _aSide = [];
private _bSide = [];
private _inrange = [];
private _searching = [];
private _searched = [];
private _gone = [];
private _vehs = [];
private _warned = [];
private _leaving = [];

private _bargates = _start nearobjects ["Land_BarGate_F",50];
private _abargates = [];
private _bbargates = [];
private _coneDir1 = 90+_dirOff;
private _coneDir2 = 270+_dirOff;

	if(_coneDir1 > 360) then {
		_coneDir1 = _coneDir1 - 360;
	};
	if(_coneDir2 > 360) then {
		_coneDir2 = _coneDir2 - 360;
	};
{
	private _dir = [_x, _start] call BIS_fnc_dirTo;
	if(_dir >= _coneDir1 && _dir < _coneDir2) then {
		if(!(_x in _abargates)) then {
			_abargates pushback _x;
		};
	} else {
		if(!(_x in _bbargates)) then {
			_bbargates pushback _x;				
		};
	};

}forEach _bargates;

[_group,_start,50,4] call CBA_fnc_taskPatrol;

while {!(isNil "_group") && count (units _group) > 0} do {

	_group setVariable ["VCM_NORESCUE",true];
	_group setVariable ["VCM_TOUGHSQUAD",true];

	_vehs = [];
	_friendly = [];
	
	private _leader = leader _group;
	//For each thing comming to the checkpoint
	{
		_unit = _x;
		_iscar = false;
		if(_unit isKindOf "LandVehicle" && !(side _x isEqualTo west)) then {
			_unit = driver _unit;
			_iscar = true;
			_f = false;

			if (_vehs find _x isEqualTo -1 && _x distance _start < _innerRange && captive _unit) then {
				_vehs pushBack _x;
			};
		};
		if(_unit isKindOf "LandVehicle" && (side _x isEqualTo west) && group _x != _group) then {
			_friendly pushback _x;
		};
		if !(_unit in _inrange || _unit in _searching || _unit in _searched) then {
			if(_unit call OT_fnc_unitSeenNATO) then {

				if((isPlayer _unit) && (captive _unit)) then {
					if(_iscar) then {
						if(_unit distance _start <= _innerRange) then {
							[_leader, {_this globalchat "Please drive into the search area and STAY in your vehicle!"}] remoteExec ["call", _unit, false];
							
							_inrange pushback _unit;
						} else {
							if(!(_unit in _warned) && _unit distance _start <= _outerRange) then {
								[_leader, {_this globalchat "WARNING! You are approching a checkpoint. SLOW DOWN!"}] remoteExec ["call", _unit, false];
								_warned pushback _unit;
								
							};
						}
					}else{
						if(_unit distance _start < _searchingRange) then {
							[_unit] spawn OT_fnc_NATOsearch;
							_searching pushback _unit;
						};
					};
				};
			};
		};

		//Subject direction watch
		//Two sides A and B, a search is needed to cross sides
		if((isPlayer _unit) && (captive _unit) && _unit distance _start > _searchingRange) then { //Dont cont units in the middle as they are crossing over
		 	if(_unit call OT_fnc_unitSeenNATO) then {
				private _dir = [_unit, _start] call BIS_fnc_dirTo;

				if(_dir >= _coneDir1 && _dir < _coneDir2) then {
					if(!(_unit in _aSide)) then {
						_aSide pushback _unit;
					};
				} else {
					if(!(_unit in _bSide)) then {
						_bSide pushback _unit;				
					};
				};
			};
		};
		if(_unit in _aSide && _x distance _start > _outerRange) then {
			_aSide deleteAt (_aSide find _unit);
		};
		if(_unit in _bSide && _x distance _start > _outerRange) then {
			_bSide deleteAt (_bSide find _unit);
		};
		
	}foreach(_start nearentities [["CaManBase","LandVehicle"],_outerRange]);

	//Gates
	if((count _vehs) > 0 || (count _friendly) > 0) then {
		if((count _aSide) > 0) then {
			{
				_x animate ["Door_1_rot",1];
			}foreach(_abargates);
		};
		if((count _bSide) > 0) then {
			{
				_x animate ["Door_1_rot",1];
			}foreach(_bbargates);
		};
		if((count _friendly) > 0 || (count _searched) > 0) then {
			{
				_x animate ["Door_1_rot",1];
			}foreach(_bargates);
		};
	}else{
		
		if((count _friendly) == 0 && (count _vehs) == 0) then {
			{
				_x animate ["Door_1_rot",0];
			}foreach(_bargates);
		} else {
			if((count _aSide) == 0) then {
				{
					_x animate ["Door_1_rot",0];
				}foreach(_abargates);
			};
			if((count _bSide) == 0) then {
				{
					_x animate ["Door_1_rot",0];
				}foreach(_bbargates);
			};
		};
	};

	//For each thing that enters the checkpoint
	_gone = [];
	
	{
		private _foundillegal = false;
		private _foundweapons = false;
		
		//Leaving
		if(_x distance _start > _innerRange && isPlayer _x && !(_x in _searched) && !(_x in _leaving)) then {
			//Unit is leaving without a search
			_leaving pushback _x;
			[_leader, {_this globalchat "Get back here or we WILL open fire!"}] remoteExec ["call", _x, false];
		};
		if(_x distance _start > _outerRange) then {
			//Unit has left the area
			_gone pushback _x;
			if(isPlayer _x && !(_x in _searched)) then {
				_x setCaptive false;
				[_x] call OT_fnc_revealToNATO;
			};
		}else{
			_iscar = false;
			_veh = false;

			if(_x distance _start < _searchingRange) then {
				if !(_x in _searching || _x in _searched) then {
					if(isPlayer _x) then {
						_searching pushback _x;
						[_leader, {_this globalchat "Please wait... personal items will be stored in your vehicle"}] remoteExec ["call", _x, false];
						if(vehicle _x != _x) then {
							_v = vehicle _x;
							_v setVelocity [0,0,0];
							{
								[_x,_v,true] call OT_fnc_dumpStuff;
							}foreach(units _v);
						};
					};
				}else{
					if(isPlayer _x && !(_x in _searched)) then {
						_msg = "Search complete, be on your way";
						_items = [];
						_unit = _x;
						if(vehicle _x != _x) then {
							_v = vehicle _x;
							_v setVelocity [0,0,0];
						};

						_items = (vehicle _x) call OT_fnc_unitStock;

						{
                            _cls = _x select 0;
                            if ((_cls in OT_allWeapons + OT_allMagazines + OT_illegalHeadgear + OT_illegalVests + OT_allStaticBackpacks + OT_allOptics) && {!(_cls in OT_legal)}) then {  //changed to allow legal credit MaxP
                                _foundweapons = true;
                            };
							if(_cls in OT_illegalItems) then {
								_count = _x select 1;
								if(vehicle _unit != _unit) then {
									[_unit,_cls,_count] call CBA_fnc_removeItemCargo;
								}else{
									for "_i" from 1 to _count do {
										_unit removeItem _cls;
									};
								};
								_foundillegal = true;
							};
						}foreach(_items);

						if(primaryWeapon _unit != "") then {_foundweapons = true};
						if(secondaryWeapon _unit != "") then {_foundweapons = true};
						if(handgunWeapon _unit != "") then {_foundweapons = true};

						if(_foundillegal || _foundweapons) then {
							if(_foundweapons) then {
								_msg = "What's this??!?";
								{
									_x setCaptive false;
									[_x] call OT_fnc_revealToNATO;
								}foreach(units vehicle _unit);
							}else{
								_msg = "We found some illegal items and confiscated them, be on your way";
							};
						}else {
							if((vehicle _x) getVariable ["stolen",false]) then {
								_msg = "This vehicle has been reported stolen!";
								{
									_x setCaptive false;
									[_x] call OT_fnc_revealToNATO;
								}foreach(units vehicle _unit);
							};
						};
						[[_leader,_msg], {(_this select 0) globalchat (_this select 1)}] remoteExec ["call", _x, false];
						_searched pushback _x;
						_searching deleteAt(_searching find _x);
					};
				};
			}else{
				if (_x in _searching && isPlayer _x) then {
					[_leader, {_this globalchat "Return to the checkpoint immediately and wait while you are searched"}] remoteExec ["call", _x, false];
					_searching deleteAt(_searching find _x);
				}
			};
		};
	}foreach(_inrange);

	//For every thing that has left the checkpoint area
	{
		_inrange deleteAt (_inrange find _x);
		if(_x in _searched) then {
			_searched deleteAt (_searched find _x);
			if(_x in _aSide) then {_aSide deleteAt (_aSide find _x);};
			if(_x in _bSide) then {_bSide deleteAt (_bSide find _x);};
		};
		if(_x in _leaving) then {
			_leaving deleteAt (_leaving find _x);
		};
		if(_x in _warned) then {
			_warned deleteAt (_warned find _x);
		};
		
	}foreach(_gone);
	sleep 2;
};
