if !(visibleMap || visibleGPS) exitWith {};

disableSerialization;
params ["_mapCtrl"];

private _vehs = [];
private _cfgVeh = configFile >> "CfgVehicles";
if(isMultiplayer && OT_showPlayerMarkers) then {
	{
		private _veh = vehicle _x;
		if(_veh isEqualTo _x) then {
			_mapCtrl drawIcon [
				"iconMan",
				[[0,0.2,0,1], [0,0.5,0,1]] select captive _x,
				getPosASL _x,
				24,
				24,
				getdir _x,
				name _x
			];
		}else{
			_vehs pushBackUnique _veh;
		};
	}foreach([] call CBA_fnc_players);
};

private _grpUnits = groupSelectedUnits player;
{
	if (!(isPlayer _x) && {(side _x isEqualTo resistance) || captive _x} && {(_x getVariable ["polgarrison",""]) isEqualTo ""}) then {
		private _veh = vehicle _x;
		if(_veh isEqualTo _x) then {
			private _color = [[0,0.2,0,1],[0,0.5,0,1]] select captive _x;
			private _visPos = visiblePosition _x;
			private _txt = "";
			if(leader _x isEqualTo player) then {
				expectedDestination _x params ["_destpos","_planning"];
				if (_planning == "LEADER PLANNED") then {
					_mapCtrl drawLine [
						_visPos,
						_destpos,
						_color
					];
					_mapCtrl drawIcon [
						"\A3\ui_f\data\map\groupicons\waypoint.paa",
						_color,
						_destpos,
						24,
						24,
						0
					];
				};

				_mapCtrl drawIcon [
					"iconMan",
					_color,
					_visPos,
					24,
					24,
					getDir _x
				];

				if(_x in _grpUnits) then {
					_mapCtrl drawIcon [
						"\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
						_color,
						_visPos,
						24,
						24,
						0
					];
				};
			}else {

				_mapCtrl drawIcon [
					"iconMan",
					_color,
					_visPos,
					24,
					24,
					getDir _x
				];
			};

		}else{
			_vehs pushBackUnique _veh;
		};
	};
}foreach(allunits);

private _mortars = spawner getVariable ["NATOmortars",[]];
{
	_mapCtrl drawIcon [
		"\A3\ui_f\data\map\markers\nato\b_mortar.paa",
		[0,0.3,0.59,(2000 - (_x select 1)) / 2000],
		_x select 2,
		24,
		24,
		0,
		""
	];
}foreach(_mortars);

if(((getposatl player) select 2) > 30) then {
	//Show no-fly zones
	private _abandoned = server getVariable ["NATOabandoned",[]];
	{
		if !(_x in _abandoned) then {
			_mapCtrl drawEllipse [
				server getvariable _x,
				2000,
				2000,
				0,
				[1, 0, 0, 1],
				"\A3\ui_f\data\map\markerbrushes\bdiagonal_ca.paa"
			];
		};
	}foreach(OT_allAirports);
	private _attack = server getVariable ["NATOattacking",""];
	if(_attack != "") then {
		_mapCtrl drawEllipse [
			server getvariable [_attack, [0,0]],
			2000,
			2000,
			0,
			[1, 0, 0, 1],
			"\A3\ui_f\data\map\markerbrushes\bdiagonal_ca.paa"
		];
	};
};

{
	private _pos = getPosASL _x;
	if (_pos distance2D player < 1200 ) then {
		private _passengers = "";
		private _color = [0,0.5,0,1];
		{
			if(isPlayer _x && !(_x isEqualTo player)) then {
				_passengers = format["%1 %2",_passengers,name _x];
			};
			if !(captive _x) then {_color = [0,0.2,0,1];};
		}foreach(crew _x);

		_mapCtrl drawIcon [
			getText(_cfgVeh >> (typeof _x) >> "icon"),
			_color,
			_pos,
			24,
			24,
			getdir _x,
			_passengers
		];
	};
}foreach(_vehs);

if(OT_showEnemyGroups) then {
	{
		if(side _x isEqualTo west) then {
			private _u = leader _x;
			private _alive = alive _u;
			if(!_alive) then {
				{
					if(alive _x) exitWith {
						_u = _x;
						_alive=true;
					};
				}foreach(units _x);
			};
			if(_alive) then {
				private _ka = resistance knowsabout _u;
				if(_ka > 1.4) then {
					_mapCtrl drawIcon [
						"\A3\ui_f\data\map\markers\nato\b_inf.paa",
						[0,0.3,0.59,((_ka-1.4) / 1) min 1],
						visiblePosition _u,
						30,
						30,
						0
					];
				};
			};
		};

		if(side _x isEqualTo east) then {
			private _u = leader _x;
			private _alive = alive _u;
			if(!_alive) then {
				{
					if(alive _x) exitWith {
						_u = _x;
						_alive=true;
					};
				}foreach(units _x);
			};
			if(_alive) then {
				private _ka = resistance knowsabout _u;
				if(_ka > 1.4) then {
					_mapCtrl drawIcon [
						"\A3\ui_f\data\map\markers\nato\b_inf.paa",
						[0.5,0,0,((_ka-1.4) / 1) min 1],
						visiblePosition _u,
						30,
						30,
						0
					];
				};
			}
		};
	}foreach(allGroups);
};

private _scale = ctrlMapScale _mapCtrl;
if(_scale <= 0.1) then {
	private _mousepos = [0,0,0];
	if !(visibleMap) then {
		_mousepos = getpos player;
	}else{
		_mousepos = _mapCtrl ctrlMapScreenToWorld getMousePosition;
	};

	private _leased = player getvariable ["leased",[]];
	{
		private _buildingPos = buildingpositions getVariable _x;
		if!(isNil "_buildingPos") then {
			if((_buildingPos distance2D _mousepos) < 3000) then {
				_mapCtrl drawIcon [
					"\A3\ui_f\data\map\mapcontrol\Tourism_CA.paa",
					[1,1,1,[1,0.3] select (_x in _leased)],
					_buildingPos,
					0.3/_scale,
					0.3/_scale,
					0
				];
			};
		};
	}foreach(player getvariable ["owned",[]]);

	{
		_x params ["_cls","","","_flag"];
		private _factionPos = server getVariable format["factionrep%1",_cls];
		_mapCtrl drawIcon [
			_flag,
			[1,1,1,1],
			_factionPos,
			0.7/(_scale max 0.03),
			0.7/(_scale max 0.03),
			0
		];
	}foreach(OT_knownFactions);
/*
	{	// revealing shops and gundealers to player
		_x params ["_tpos","_town"];
		private _shops = server getVariable [format["activeshopsin%1",_town],[]];
		private _carshops = server getVariable [format["activecarshopsin%1",_town],[]];
		private _piers = server getVariable [format["activepiersin%1",_town],[]];
		private _hardwares = server getVariable [format["activehardwarein%1",_town],[]];
		if ([_tpos, 500] call OT_fnc_playerInRange) then {
			{
				private _pos = _x select 0;
				private _cat = _x select 1;
				if !([format["shop%1%2", _pos, _cat]] in allMapMarkers) then {
					_mrk = createMarker [format["shop%1%2", _pos, _cat], _pos];
					_mrk setMarkerShape "ICON";
					_mrk setMarkerType format["ot_Shop_%1", _cat];
					OT_lastMapDrawScale = -1;
				};
			}foreach _shops;

			{
				private _pos = _x;
				if !([format["carshop%1", _pos]] in allMapMarkers) then {
					_mrk = createMarker [format["carshop%1", _pos], _pos];
					_mrk setMarkerShape "ICON";
					_mrk setMarkerType "ot_Shop_CarStore";
					OT_lastMapDrawScale = -1;
				};
			}foreach _carshops;

			{
				private _pos = _x;
				if !([format["piershop%1", _pos]] in allMapMarkers) then {
					_mrk = createMarker [format["piershop%1", _pos], _pos];
					_mrk setMarkerShape "ICON";
					_mrk setMarkerType "ot_Shop_Pier";
					OT_lastMapDrawScale = -1;
				};
			}foreach _piers;

			{
				private _pos = _x select 0;
				if !([format["hardware%1%2", _pos]] in allMapMarkers) then {
					_mrk = createMarker [format["hardware%1", _pos], _pos];
					_mrk setMarkerShape "ICON";
					_mrk setMarkerType "ot_Shop_Hardware";
					OT_lastMapDrawScale = -1;
				};
			}foreach _hardwares;

		};
	}foreach OT_townData;
*/
	// Create known Gun dealer markers
	{
		_x params ["","_town"];
		private _gundealerpos = server getVariable format["gundealer%1",_town];
		if !([format["gundealer%1", _town]] in allMapMarkers) then {
			_mrk = createMarker [format["gundealer%1", _town], _gundealerpos];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType "ot_Shop_Gundealer";
			OT_lastMapDrawScale = -1;
		};		
	}foreach OT_knownGundealers;

	// Create known shop markers
	{
		private _pos = _x select 0;
		private _cat = _x select 1;
		if !([format["shop%1%2", _pos, _cat]] in allMapMarkers) then {
			_mrk = createMarker [format["shop%1%2", _pos, _cat], _pos];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType format["ot_Shop_%1", _cat];
			OT_lastMapDrawScale = -1;
		};
	}foreach OT_knownShops;

	{
		private _pos = _x;
		if !([format["carshop%1", _pos]] in allMapMarkers) then {
			_mrk = createMarker [format["carshop%1", _pos], _pos];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType "ot_Shop_CarStore";
			OT_lastMapDrawScale = -1;
		};
	}foreach OT_knownCarShops;

	{
		private _pos = _x;
		if !([format["piershop%1", _pos]] in allMapMarkers) then {
			_mrk = createMarker [format["piershop%1", _pos], _pos];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType "ot_Shop_Pier";
			OT_lastMapDrawScale = -1;
		};
	}foreach OT_knownPiers;

	{
		private _pos = _x select 0;
		if !([format["hardware%1", _pos]] in allMapMarkers) then {
			_mrk = createMarker [format["hardware%1", _pos], _pos];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType "ot_Shop_Hardware";
			OT_lastMapDrawScale = -1;
		};
	}foreach OT_knownHardwares;

	if (OT_showEnemyCorpses) then {
		{
			if (typeof _x != "B_UAV_AI") then {
				_p = getPosASL _x;
				if((_p distance2D _mousepos) < 3000) then {
					_mapCtrl drawIcon [
						"\overthrow_main\ui\markers\death.paa",
						[1,1,1,0.5],
						_p,
						0.2/_scale,
						0.2/_scale,
						0
					];
				};
			};
		}foreach(alldeadmen);
	};

	{
		if(((_x select 2) distance2D _mousepos) < 3000) then {
			private _icon = +_x;
			if((_icon select 3) < 1) then {
				_icon set [3,(_icon select 3) / _scale];
				_icon set [4,(_icon select 4) / _scale];
			};
			_mapCtrl drawIcon _icon;
		};
	}foreach(OT_mapcache_vehicles);

};
private _qrf = server getVariable "QRFpos";
if(!isNil "_qrf") then {
	private _progress = server getVariable ["QRFprogress",0];
	if(_progress != 0) then {
		_mapCtrl drawEllipse [
			_qrf,
			100,
			100,
			0,
			[
				parseNumber(_progress > 0),
				parseNumber(_progress < 0),
				1,
				abs _progress
			],
			"\A3\ui_f\data\map\markerbrushes\fdiagonal_ca.paa"
		];
	};
};

private _qrf = server getVariable "QRFpos";
if(!isNil "_qrf") then {
	private _progress = server getVariable ["QRFprogress",0];
	_col = [];
	if(_progress > 0) then {_col = [0,0,1,_progress]};
	if(_progress < 0) then {_col = [0,1,0,abs _progress]};
	if(_progress != 0) then {
		_mapCtrl drawEllipse [
			_qrf,
			200,
			200,
			0,
			_col,
			"\A3\ui_f\data\map\markerbrushes\bdiagonal_ca.paa"
		];
	};
};

//Radar
{
	private _i = "\A3\ui_f\data\map\markers\nato\b_air.paa";
	if(_x isKindOf "Plane") then {_i = "\A3\ui_f\data\map\markers\nato\b_plane.paa"};
	if((_x isKindOf "UAV") || (typeof _x isEqualTo OT_NATO_Vehicles_ReconDrone)) then {_i = "\A3\ui_f\data\map\markers\nato\b_uav.paa"};
	_mapCtrl drawIcon [
		_i,
		[0,0.3,0.59,1],
		position _x,
		30,
		30,
		0
	];
}foreach(OT_mapcache_radar);

//Draw resistance radar coverage
if(_scale > 0.16) then {
	{
		_mapCtrl drawEllipse [
			_x,
			2500,
			2500,
			0,
			[0,0.8,0,0.8],
			"\A3\ui_f\data\map\markerbrushes\fdiagonal_ca.paa"
		];
	}foreach(spawner getVariable ["GUERradarPositions",[]]);
};

//Scale shop markers
if (_scale != OT_lastMapDrawScale) then {
	{
		if ("ot_Shop" in getMarkerType _x && !("ot_Shop_Gundealer" in getMarkerType _x)) then {
			if (_scale > 0.015) then { _x setMarkerSizeLocal [0.01/(_scale*0.7),	0.01/(_scale*0.7)];};
			if (_scale > 0.15) then { _x setMarkerSizeLocal[0,0]; };
		};
		if ("ot_Shop_Gundealer" in getMarkerType _x) then {
			if (_scale > 0.015) then { _x setMarkerSizeLocal [0.01/(_scale*0.3),	0.01/(_scale*0.3)];};
			if (_scale > 0.2) then { _x setMarkerSizeLocal[0,0]; };
		};
	} forEach allMapMarkers;
};
OT_lastMapDrawScale = _scale;