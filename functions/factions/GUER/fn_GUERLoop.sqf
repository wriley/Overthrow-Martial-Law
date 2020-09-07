GUER_faction_loop_data params ["_lastmin","_lasthr","_currentProduction","_stabcounter","_trackcounter"];
diag_log format ["[GUERLoop] - GUER_faction_loop_data params: %1", GUER_faction_loop_data];
private _numplayers = count([] call CBA_fnc_players);
if(_numplayers isEqualTo 0) exitWith {};

_trackcounter = _trackcounter + 1;
if(_trackcounter > 5) then {
	if(fog > 0.001) then {0 setFog 0};
	_trackcounter = 0;
	//save online player data, in case they crash
	{
		if(_x getVariable ["OT_newplayer",false]) then {
			_x setVariable ["OT_newplayer",false,true];
		};
		[_x] call OT_fnc_savePlayerData;
	}foreach([] call CBA_fnc_players);

	_track = [];
	{
		if(_x getVariable ["OT_spawntrack",false]) then {
			_track pushback _x;
		};
	}foreach(allunits);
	{
		if(_x getVariable ["OT_spawntrack",false]) then {
			_track pushback _x;
		};
	}foreach(vehicles);
	spawner setVariable ["track",_track,false];
};

//Stop civilians from fleeing after 20 seconds
{
	if(_x getVariable ["fleeing",false]) then {
		if((time - (_x getVariable ["fleeingstart",0])) > 20) then {
			_x setVariable ["fleeing",false];
			_x setBehaviour "SAFE";
		};
	};
}foreach(allGroups select {(side _x) isEqualTo civilian});

private _dead = count alldeadmen;
if(_dead > 150) then {
	format["There are %1 dead bodies, loot them or clean via options",_dead] remoteExec ["OT_fnc_notifyMinor",0,false];
};

{
	if (typename _x isEqualTo "GROUP") then {
		{
			deleteVehicle _x;
		}foreach(units _x);
		deleteGroup _x;
	};
	if (typename _x isEqualTo "OBJECT") then {
		deleteVehicle _x;
	};
}foreach(spawner getVariable ["_noid_",[]]);

{
	if((_x isKindOf "Air") && {(alive _x)} && ((side _x) isEqualTo west) && (_x call OT_fnc_isRadarInRange) && {(count crew _x > 0)}) then {
		[_x,2500] call OT_fnc_revealToResistance;
	};
}foreach(vehicles);

if ((date select 3) != _lasthr) then {
	_lasthr = date select 3;
};

if (dateToNumber date > _lastmin) then {
	private _oneMinute = 0.0000019;
	_lastmin = dateToNumber date + _oneMinute;
	{
		private _name = _x;
		if(_name != "Factory") then {
			private _queue = server getvariable [format["%1queue",_name],[]];
			if (count _queue != 0) then {
				private _business = _name call OT_fnc_getBusinessData;
				_business params ["_pos","","_production","_xp","_level","_nextlevel"];
				private _employees = server getVariable [format["%1employ",_name],0];
				private _lastMakeDateNumber = server getVariable [format["%1lastMakeDateNumber", _name], -1];
				if ((dateToNumber date) > (_lastMakeDateNumber  + (60 * _oneMinute) - (_employees * _oneMinute))) then {
					private _salary = [OT_nation,"WAGE",0] call OT_fnc_getPrice;
					private _funds = [] call OT_fnc_resistanceFunds;
					private _wages = (_employees * _salary);
					private _income = 0;
					private _costprice = 0;

					if(_funds >= _wages) then {
						_producing = _queue select 0 select 0;
						[-_wages] call OT_fnc_resistanceFunds;
						if(_employees > 0) then {
							private _success = false;
							private _needArr = [];
							{
								if (_x select 0 == _producing) exitWith {
									_needArr = _x select 1;
								};
							}foreach _production;
							if(count _needArr isEqualTo 0) then {
								_success = true;
							} else {
								{
									_x params ["_inputClass",["_inputQty",1]];
									switch (_inputClass) do {
										case "Money": {
											_success = true;
											_costprice = 100 * _inputQty;
										};
										default {
											{
												_container = _x;
												_stock = _container call OT_fnc_unitStock;
												{
													_x params ["_cls","_amt"];
													if(_cls isEqualTo _inputClass) exitWith {
														if(_amt >= _inputQty) then {
															_success = true;
														};
													};
												}foreach(_stock);
											}foreach(_pos nearObjects [OT_businessStorage, 50]);
										};
									};
								}foreach _needArr;
								_income = _income - _costprice;
							};
							if (_success) then {
								server setVariable [format["%1lastMakeDateNumber", _name], dateToNumber date, true];
								switch (_producing) do {
									case "Money": {
										_income = _income + (round(_wages * (1.5 + (_level/10)))); // (150% to 200% profitability on wages)
										[_income] call OT_fnc_resistanceFunds;
										format["Resistance earned $%1 in revenues from %2.",_income, _name] remoteExec ["OT_fnc_notifyMinor",0,false];
									};
									case "Support": {
										[_income*10] call OT_fnc_resistanceFunds;
										_town = _pos call OT_fnc_nearestTown;
										[_town,abs(round(_income/100))] call OT_fnc_support;
										format["Resistance gained %1 support from %2 through %3.",abs(round(_income/100)), _town, _name] remoteExec ["OT_fnc_notifyMinor",0,false];
									};
									default {
										format["Resistance produced %1 at %2.", (_producing call OT_fnc_weaponGetName), _name] remoteExec ["OT_fnc_notifyMinor",0,false];
										if ((_queue select 0 select 1) == 1) then {
											_queue deleteAt 0;
										} else {
											(_queue select 0) set [1, ((_queue select 0 select 1)-1)];
										};
										server setvariable [format["%1queue",_name],_queue,true];
									};
								};

								if (count _needArr > 0) then {
									private _container = _pos nearestObject OT_businessStorage;
									{
										_x params ["_inputClass","_inputQty"];
										call {
											if(_inputClass isKindOf "Bag_Base") exitWith {
												[_container, _inputClass, _inputQty] call CBA_fnc_removeBackpackCargo;
											};
											if(_inputClass isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
												[_container, _inputClass, _inputQty] call CBA_fnc_removeWeaponCargo;
											};
											if(_inputClass isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
												[_container, _inputClass, _inputQty] call CBA_fnc_removeWeaponCargo;
											};
											if(_inputClass isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
												[_container, _inputClass, _inputQty] call CBA_fnc_removeWeaponCargo;
											};
											if(_inputClass isKindOf ["NVGoggles",configFile >> "CfgWeapons"]) exitWith {
												[_container, _inputClass, _inputQty] call CBA_fnc_removeItemCargo;
											};
											if(_inputClass isKindOf ["Binocular",configFile >> "CfgWeapons"]) exitWith {
												[_container, _inputClass, _inputQty] call CBA_fnc_removeWeaponCargo;
											};
											if(_inputClass isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
												[_container, _inputClass, _inputQty] call CBA_fnc_removeMagazineCargo;
											};
											[_container, _inputClass, _inputQty] call CBA_fnc_removeItemCargo;
										};
									}foreach _needArr;
									call {
										if(_producing isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
											_container addWeaponCargoGlobal [_producing, round(1 * (1 + (_employees/50)))];
										};
										if(_producing isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
											_container addWeaponCargoGlobal [_producing, round(1 * (1 + (_employees/50)))];
										};
										if(_producing isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
											_container addWeaponCargoGlobal [_producing, round(1 * (1 + (_employees/50)))];
										};
										if(_producing isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
											_container addMagazineCargoGlobal [_producing, round(1 * (1 + (_employees/50)))];
										};
										_container addItemCargoGlobal [_producing, round(1 * (1 + (_employees/50)))];
									};
								};

								if !(_nextlevel isEqualType "") then {
									_xp = _xp + abs(round(_income/5));
									//_xp = _xp + round(_income/100);
									if (_xp >= _nextlevel) then {
										format["%1 is now more advanced and can employ more workers", _name] remoteExec ["OT_fnc_notifyMinor",0,false];
										server setVariable [format["%1level",_name], (_level + 1), true];
										server setVariable [format["%1xp",_name], (_xp - _nextlevel), true];
									} else {
										server setVariable [format["%1xp",_name], _xp, true];
									};
								} else {
									server setVariable [format["%1xp",_name], 10000, true];
								};
								[] remoteExecCall ["OT_fnc_refreshBusiness", 0];
							} else {
								format["%1 is missing resources.",_name] remoteExec ["OT_fnc_notifyMinor",0,false];
							};
						};
					}else{
						format["Resistance was unable to pay wages at %1",_x] remoteExec ["OT_fnc_notifyMinor",0,false];
					};
				};
			};
		};
	}foreach(server getVariable ["GEURowned",[]]);
	[] remoteExecCall ["OT_fnc_refreshBusiness", 0];

	if(!(call OT_fnc_generalIsOnline) && _dead > 300) then {
		format["There are %1 dead bodies, initiating auto-cleanup",_dead] remoteExec ["OT_fnc_notifyMinor",0,false];
		call OT_fnc_cleanDead;
	};

	//chance to reveal a FOB
	_revealed = server getVariable ["revealedFOBs",[]];
	{
		_x params ["_pos"];
		private _id = str _pos;
		private _town = _pos call OT_fnc_nearestTown;
		_support = [_town] call OT_fnc_support;
		if (!(_id in _revealed) && (_support > 200+(random 1800))) then {// was random 0-2000 now 200-2000 (0 support shouldn't reveal a fob)
			[_pos] call OT_fnc_revealNATOFOB;
		};
	}foreach(server getVariable ["NATOfobs",[]]);

	_stabcounter = _stabcounter + 1;
	private _abandoned = server getVariable ["NATOabandoned",[]];

	// Resistance police stability effects
	if(_stabcounter >= 10) then {
		_stabcounter = 0;
		{
			_town = _x;
			_townpos = server getvariable _x;
			if !(_town in _abandoned) then {
				if(_townpos call OT_fnc_inSpawnDistance) then {
					private _numcops = {side _x isEqualTo west} count (_townpos nearObjects ["CAManBase",600]);
					if(_numcops isEqualTo 0) then {
						[_town,-1] call OT_fnc_stability;
					};
				};
			}else{
				_stabchange = 0;
				private _numcops = {side _x isEqualTo west} count (_townpos nearObjects ["CAManBase",600]);
				if(_numcops > 0) then {
					_stabchange = _stabchange - _numcops;
				};
				_police = server getVariable [format["police%1",_town],0];
				if (_police > 0) then {
					_stabchange = _stabchange + floor(_police / 2);
				};
				if(_stabchange != 0) then {
					[_town,_stabchange] call OT_fnc_stability;
				};
			};
		}foreach(OT_allTowns);
	};

	if("Chemical Plant" in _abandoned) then {
		private _chems = server getVariable ["reschems",0];
		server setVariable ["reschems",_chems + 1,true];
	};

	if("Factory" in (server getVariable ["GEURowned",[]])) then {
		private _currentCls = server getVariable ["GEURproducing",""];
		if(_currentCls != "") then {
			_queue = server getVariable ["factoryQueue",[]];
			_changed = false;
			if(count _queue > 0) then {
				_item = _queue select 0;
				if((_item select 0) != _currentCls) then {
					server setVariable ["GEURproducetime",0,true];
					server setVariable ["GEURproducing","",true];
					_changed = true;
				};
			};
			if(_changed) exitWith {
				_queue = server getVariable ["factoryQueue",[]];
				if(count _queue > 0) then {
					_item = _queue select 0;
					server setVariable ["GEURproducing",_item select 0,true];
				};
			};

			_cost = cost getVariable[_currentCls,[]];
			if(count _cost > 0) then {
				_cost params ["_base","_wood","_steel","_plastic"];
				if(isNil "_plastic") then {
					_plastic = 0;
				};
				_b = 1;
				if(_base > 240) then {
							_b = 10;
					};
					if(_base > 10000) then {
							_b = 20;
					};
					if(_base > 20000) then {
							_b = 30;
					};
					if(_base > 50000) then {
							_b = 60;
					};
				_timetoproduce = _b + (round (_wood+1)) + (round(_steel * 0.2)) + (round (_plastic * 5));
				if(_timetoproduce > 120) then {_timetoproduce = 120};
				if(_timetoproduce < 5) then {_timetoproduce = 5};
				_timespent = server getVariable ["GEURproducetime",0];

				_numtoproduce = 1;
				if(_wood < 1 && _wood > 0) then {
					_numtoproduce = round (1 / _wood);
				};
				if(_steel < 1 && _steel > 0) then {
					_numtoproduce = round (1 / _steel);
				};
				if(_plastic < 1 && _plastic > 0) then {
					_numtoproduce = round (1 / _plastic);
				};
				_costtoproduce = round((_base * _numtoproduce) * 0.6);

				if(_timespent isEqualTo 0) then {
					private _veh = OT_factoryPos nearestObject OT_businessStorage;
					if(_veh isEqualTo objNull) then {
						_contpos = OT_factoryPos findEmptyPosition [5,100,OT_businessStorage];
						if(count _contpos > 0) then {
							_veh = OT_businessStorage createVehicle _contpos;
							_veh setVariable ["CanOverFill", true, true];
							[_veh,(server getVariable ["generals",[]]) select 0] call OT_fnc_setOwner;
							clearWeaponCargoGlobal _veh;
							clearMagazineCargoGlobal _veh;
							clearBackpackCargoGlobal _veh;
							clearItemCargoGlobal _veh;
						}else{
							format["Factory has no room to place container, please clear marker area"] remoteExec["OT_fnc_notifyMinor",0,false];
							spawner setVariable ["GEURproduceerror","Factory has no room to place container, please clear marker area",true];
						};
					};
					private _dowood = ["OT_wood",_wood,OT_factoryPos] call OT_fnc_hasFromCargoContainers;
					private _dosteel = ["OT_steel",_steel,OT_factoryPos] call OT_fnc_hasFromCargoContainers;
					private _doplastic = ["OT_plastic",_plastic,OT_factoryPos] call OT_fnc_hasFromCargoContainers;
					private _domoney = ([] call OT_fnc_resistanceFunds >= _costtoproduce);
					if(_dowood && _dosteel && _doplastic && _domoney) then {
						["OT_wood",_wood,OT_factoryPos] call OT_fnc_takeFromCargoContainers;
						["OT_steel",_steel,OT_factoryPos] call OT_fnc_takeFromCargoContainers;
						["OT_plastic",_plastic,OT_factoryPos] call OT_fnc_takeFromCargoContainers;
						[-_costtoproduce] call OT_fnc_resistanceFunds;
						_timespent = _timespent + 1;
					}else{
                        			_need = "";
			                        if !(_dowood) then {_need = _need + format["%1 x wood ",_wood]};
			                        if !(_dosteel) then {_need = _need + format["%1 x steel ",_steel]};
			                        if !(_doplastic) then {_need = _need + format["%1 x plastic ",_plastic]};
			                        if !(_domoney) then {_need = _need + format["$%1 resistance funds",_costtoproduce]};
						format["Factory has insufficient resources to produce item (need: %1)",_need] remoteExec["OT_fnc_notifyMinor",0,false];
						spawner setVariable ["GEURproduceerror",format["Factory has insufficient resources to produce item (need: %1)",_need],true];
					};
				}else{
					_timespent = _timespent + 1;
				};
				if(_timespent >= _timetoproduce) then {
					_timespent = 0;

					_queue = server getVariable ["factoryQueue",[]];
					if(count _queue > 0) then {
						_item = _queue select 0;
						if(_item select 1 > 1) then {
							_item set [1,(_item select 1)-1];
						}else{
							_queue deleteat 0;
						};
						server setVariable ["factoryQueue",_queue,true];
					};

					server setVariable ["GEURproducing",""];

					if(!(_currentCls isKindOf "Bag_Base") && _currentCls isKindOf "AllVehicles") then {
						_contpos = OT_factoryVehicleSpawn findEmptyPosition [5,100,_currentCls];
						if(count _contpos > 0) then {
							_veh = _currentCls createVehicle _contpos;
							//[_veh,(server getVariable ["generals",[]]) select 0] call OT_fnc_setOwner;
							_veh setVariable ["OT_forceSaveUnowned", true, true];		// Save this vehicle even if it is unowned (we know somebody must have requested it at the factory, so they'll come back and claim it... eventually)
							clearWeaponCargoGlobal _veh;
							clearMagazineCargoGlobal _veh;
							clearBackpackCargoGlobal _veh;
							clearItemCargoGlobal _veh;
							_veh setDir OT_factoryVehicleDir;
							OT_factoryXP = OT_factoryXP + _timetoproduce;
							format["Factory has produced %1 x %2",_numtoproduce,_currentCls call OT_fnc_vehicleGetName] remoteExec["OT_fnc_notifyMinor",0,false];
						}else{
							format["Factory has no room to produce %1, please clear the road",_currentCls call OT_fnc_vehicleGetName] remoteExec["OT_fnc_notifyMinor",0,false];
							_timespent = _timetoproduce;
						};
					}else{
						private _veh = OT_factoryPos nearestObject OT_businessStorage;
						if(_veh isEqualTo objNull) then {
							_contpos = OT_factoryPos findEmptyPosition [5,100,OT_businessStorage];
							_veh = OT_businessStorage createVehicle _contpos;
							[_veh,(server getVariable ["generals",[]]) select 0] call OT_fnc_setOwner;
							clearWeaponCargoGlobal _veh;
							clearMagazineCargoGlobal _veh;
							clearBackpackCargoGlobal _veh;
							clearItemCargoGlobal _veh;
						};
						[_veh,_currentCls,_numtoproduce] call {
							params ["_veh","_currentCls","_numtoproduce"];
							if(_currentCls isKindOf "Bag_Base") exitWith {
								_currentCls = _currentCls call BIS_fnc_basicBackpack;
								_veh addBackpackCargoGlobal [_currentCls,_numtoproduce];
							};
							if(_currentCls isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
								_veh addWeaponCargoGlobal [_currentCls,_numtoproduce];
							};
							if(_currentCls isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
								_veh addWeaponCargoGlobal [_currentCls,_numtoproduce];
							};
							if(_currentCls isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
								_veh addWeaponCargoGlobal [_currentCls,_numtoproduce];
							};
							if(_currentCls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
								_veh addMagazineCargoGlobal [_currentCls,_numtoproduce];
							};
							_veh addItemCargoGlobal [_currentCls,_numtoproduce];
						};
						if (OT_factoryXP > 1000) then { OT_factoryXP=0;OT_factoryLevel = (OT_factoryLevel + 1) min 5; };
					}
				};
				server setVariable ["GEURproducetime",_timespent,true];
			};
		}else{
			_queue = server getVariable ["factoryQueue",[]];
			if(count _queue > 0) then {
				_item = _queue select 0;
				server setVariable ["GEURproducing",_item select 0,true];
			};
		};
	};

	{
		_x params ["_owner","_name","_unit","_rank"];
		if(typename _unit isEqualTo "OBJECT") then {
			_xp = _unit getVariable ["OT_xp",0];
			_player = spawner getvariable [_owner,objNULL];
			if(_rank == "PRIVATE" && _xp > (OT_rankXP select 0)) then {
				_x set [3,"CORPORAL"];
				_unit setRank "CORPORAL";
				format["%1 has been promoted to Corporal",_name select 0] remoteExec ["OT_fnc_notifyMinor",_player,false];
				_unit setSkill 0.3 + (random 0.3);
			};
			if(_rank == "CORPORAL" && _xp > (OT_rankXP select 1)) then {
				_x set [3,"SERGEANT"];
				_unit setRank "SERGEANT";
				format["%1 has been promoted to Sergeant",_name select 0] remoteExec ["OT_fnc_notifyMinor",_player,false];
				_unit setSkill 0.4 + (random 0.3);
			};
			if(_rank == "SERGEANT" && _xp > (OT_rankXP select 2)) then {
				_x set [3,"LIEUTENANT"];
				_unit setRank "LIEUTENANT";
				format["%1 has been promoted to Lieutenant",_name select 0] remoteExec ["OT_fnc_notifyMinor",_player,false];
				_unit setSkill 0.6 + (random 0.3);
			};
			if(_rank == "LIEUTENANT" && _xp > (OT_rankXP select 3)) then {
				_x set [3,"CAPTAIN"];
				_unit setRank "CAPTAIN";
				format["%1 has been promoted to Captain",_name select 0] remoteExec ["OT_fnc_notifyMinor",_player,false];
				_unit setSkill 0.7 + (random 0.3);
			};
			if(_rank == "CAPTAIN" && _xp > (OT_rankXP select 4)) then {
				_x set [3,"MAJOR"];
				_unit setRank "MAJOR";
				format["%1 has been promoted to Major",_name select 0] remoteExec ["OT_fnc_notifyMinor",_player,false];
				_unit setSkill 0.8 + (random 0.2);
			};
		};
	}foreach(server getVariable ["recruits",[]]);
};
GUER_faction_loop_data = [_lastmin,_lasthr,_currentProduction,_stabcounter,_trackcounter];
