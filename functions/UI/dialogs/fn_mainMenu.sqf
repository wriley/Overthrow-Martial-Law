closedialog 0;
createDialog "OT_dialog_main";
openMap false;

private _ft = server getVariable ["OT_fastTravelType",1];
if(!OT_adminMode && _ft > 1) then {
	ctrlEnable [1600,false];
};

disableSerialization;
private _buildingtextctrl = (findDisplay 8001) displayCtrl 1102;

private _town = (getposATL player) call OT_fnc_nearestTown;

private _weather = "Clear";
if(overcast > 0.4) then {
	_weather = "Cloudy";
};
if(rain > 0.1) then {
	_weather = "Rain";
};
if(rain > 0.9) then {
	_weather = "Storm";
};

private _ctrl = (findDisplay 8001) displayCtrl 1100;
private _standing = [_town] call OT_fnc_support;
private _townpop = server getVariable format ["population%1",_town];
private _totalpop = call OT_fnc_getControlledPopulation;
private _rep = server getVariable ["rep",0];
private _geurOwned = (server getVariable ["GEURowned",[]]);
private _extra = "";
if (count _geurOwned isEqualTo 0) then {
	ctrlEnable [1603,false];
	findDisplay 8001 displayCtrl 1603 ctrlSetTooltip "Buy a business to access Business Management";
};
private _uiScale = 0.4 + (0.5 / (pixelGrid / 12));

for [{private _i=1600;},{_i==1621;},{_i=_i+1;}] do {
	private _ctrl = findDisplay 8001 displayCtrl _i;
};

if(isMultiplayer && { ((getplayeruid player) in (server getVariable ["generals",[]])) }) then {
	_extra = format["
		<t align='left'>Funds (yours): $%1</t><br/>
		<t align='left'>Resistance: $%2 (Tax Rate %3%4)</t><br/>
		",
		[server getVariable ["money",0], 1, 0, true] call CBA_fnc_formatNumber,
		[player getVariable ["money",0], 1, 0, true] call CBA_fnc_formatNumber,	server getVariable ["taxrate",0], "%"
	];
};

_ctrl ctrlSetStructuredText parseText format[
	"<br/>
		<t align='left'>%1 Population: (%2) Support: (%3%4)</t><br/>
		<t align='left'>Your Population: (%6) %5 Support: (%7%8)</t><br/>
		<t align='left'>Influence Points: %9</t><br/>
		<t align='left'>Weather: %10 (Forecast: %11)</t><br/>
		<t align='left'>Fuel Price: $%12/L</t><br/>
		%13
	",
	_town, _townpop, ["","+"] select (_standing > -1), _standing,
	OT_nation, _totalpop, ["","+"] select (_rep > -1), _rep,
	player getVariable ["influence",0],
	_weather, server getVariable "forecast",
	[OT_nation,"FUEL",100] call OT_fnc_getPrice,
	_extra
];

sleep 0.3;
//Nearest building info
_b = player call OT_fnc_nearestRealEstate;
_buildingTxt = "<br/>";

ctrlEnable [1611,false]; // OT_fnc_buyBuilding
ctrlEnable [1612,false]; // OT_fnc_leaseBuilding
ctrlEnable [1613,false]; // OT_fnc_setHome
ctrlEnable [1614,false]; // OT_fnc_manageArea
ctrlEnable [1615,false]; // OT_fnc_garrisonDialog

private _ctrl1611 = findDisplay 8001 displayCtrl 1611;
private _ctrl1612 = findDisplay 8001 displayCtrl 1612;
private _ctrl1613 = findDisplay 8001 displayCtrl 1613;
private _ctrl1614 = findDisplay 8001 displayCtrl 1614;
private _ctrl1615 = findDisplay 8001 displayCtrl 1615;

if(typename _b isEqualTo "ARRAY") then {
	private _building = _b select 0;
	private _price = _b select 1;
	private _sell = _b select 2;
	private _lease = _b select 3;
	private _totaloccupants = _b select 4;
	private _cls = typeOf _building;
	private _name = _cls call OT_fnc_vehicleGetName;
	private _pic = getText(configFile >>  "CfgVehicles" >>  _cls >> "editorPreview");
	private _damage = _building call OT_fnc_getBuildingDamage;

	private _cost = [(_price * (_damage/100)), 1, 0, true] call CBA_fnc_formatNumber;

	if !(isNil "_pic") then {
		ctrlSetText [1201,_pic];
	};
	_txt = "";

	if(_building call OT_fnc_hasOwner) then {
		_owner = _building call OT_fnc_getOwner;
		_ownername = players_NS getVariable format["name%1",_owner];
		if(isNil "_ownername") then {_ownername = "Someone"};

		if (_damage > 0) then {
			ctrlEnable [1613,true];
			ctrlSetText [1613,"Repair"];
			_ctrl1613 ctrlSetTooltip format ["Repair ($%1)", _cost];
		};


		if(_cls isEqualTo OT_warehouse) exitWith {
			ctrlEnable [1612,true];
			ctrlSetText [1612,"Procurement"];
			_ctrl1612 ctrlSetTooltip "Purchase Vehicles from Warehouse";

			_buildingTxt = format["<br/>
				<t align='left'>Warehouse</t><br/>
				<t align='left'>Owned by %1</t><br/>
				<t align='left'>Damage: %2%3</t>
			",_ownername,_damage,"%"];
		};

		if(_owner isEqualTo getplayerUID player) then {
			// I'm owner
			_leased = player getVariable ["leased",[]];
			_id = [_building] call OT_fnc_getBuildingId;
			if(_id in _leased) then {
				_ownername = format["%1 (Leased)",_ownername];
			};

			if(_cls isEqualTo OT_item_Tent) exitWith {
				_buildingTxt = format["<br/>
					<t align='left'>Camp</t><br/>
					<t align='left'>Owned by %1</t>
				",_ownername];
			};

			if(_id in _leased) then {
				ctrlEnable [1611,true];
				ctrlSetText [1611,format["Sell ($%1)",[_sell, 1, 0, true] call CBA_fnc_formatNumber]];
				_ctrl1611 ctrlSetTooltip "Sell this building";

				ctrlEnable [1612,true];
				ctrlSetText [1612,"Terminate"];
				_ctrl1612 ctrlSetTooltip "Terminate Lease";

				ctrlSetText [1613,"Set as Home"];
				_ctrl1613 ctrlSetTooltip "Leased cannot be set as Home";
			} else {
				if(getpos _building isEqualTo (player getVariable ["home",[]])) then {
					ctrlSetText [1611,format["Sell ($%1)",[_sell, 1, 0, true] call CBA_fnc_formatNumber]];
					_ctrl1611 ctrlSetTooltip "Cannot sell your home";

					ctrlSetText [1612,"Lease"];
					_ctrl1612 ctrlSetTooltip "Cannot lease your home";

					ctrlSetText [1613,"Set as home"];
					_ctrl1613 ctrlSetTooltip "Already your home";
				} else {
				if (_cls in OT_allBuyableBuildings) then {
						ctrlEnable [1611,true];
						ctrlSetText [1611,format["Sell ($%1)",[_sell, 1, 0, true] call CBA_fnc_formatNumber]];
						_ctrl1611 ctrlSetTooltip "Sell this building";

						ctrlEnable [1612,true];
						ctrlSetText [1612,"Lease"];
						_ctrl1612 ctrlSetTooltip "Lease this building";

						ctrlEnable [1613,true];
						ctrlSetText [1613,"Set as home"];
						_ctrl1613 ctrlSetTooltip "Make this your home (respawn point)";
					};
				};
			};
			if(damage _building isEqualTo 1) then {
				_lease = 0;
			};
			_buildingTxt = format["<br/>
				<t align='left'>%1</t><br/>
				<t align='left'>Owned by %2</t><br/>
				<t align='left'>Lease Value: $%3/6hrs</t><br/>
				<t align='left'>Damage: %4%5</t>
			",_name,_ownername,[_lease, 1, 0, true] call CBA_fnc_formatNumber,_damage,"%"];
		} else {
			// I'm not owner
			if(_cls isEqualTo OT_item_Tent) then {
				_name = "Camp";
			};
			if(_cls isEqualTo OT_flag_IND) then {
				_name = _building getVariable "name";
			};
			_buildingTxt = format["<br/>
				<t align='left'>%1</t><br/>
				<t align='left'>Owned by %2</t><br/>
				<t align='left'>Damage: %3%4</t>
			",_name,_ownername,_damage,"%"];
		};

		// Building still has owner
		if(_cls isEqualTo OT_barracks) then {
			_owner = _building call OT_fnc_getOwner;
			_ownername = players_NS getVariable format["name%1",_owner];
			ctrlEnable [1612,true];
			ctrlSetText [1612,"Recruit"];
			_ctrl1612 ctrlSetTooltip "Recruit highly trained soldiers for the resistance";

			_buildingTxt = format["<br/>
				<t align='left'>Barracks</t><br/>
				<t align='left'>Built by %1</t><br/>
				<t align='left'>Damage: %2%3</t>
			",_ownername,round((damage _building) * 100),"%"];
		};
		if(_cls isEqualTo OT_trainingCamp) then {
			_owner = _building call OT_fnc_getOwner;
			_ownername = players_NS getVariable format["name%1",_owner];
			ctrlEnable [1612,true];
			ctrlSetText [1612,"Recruit"];
			_ctrl1612 ctrlSetTooltip "Recruit pretrained army for the resistance";

			_buildingTxt = format["<br/>
				<t align='left'>Training Camp</t><br/>
				<t align='left'>Built by %1</t><br/>
				<t align='left'>Damage: %2%3</t>
			",_ownername,_damage,"%"];
		};

		if(_cls isEqualTo OT_refugeeCamp) then {
			_owner = _building call OT_fnc_getOwner;
			_ownername = players_NS getVariable format["name%1",_owner];
			ctrlEnable [1612,true];
			ctrlSetText [1612,"Recruit"];

			_buildingTxt = format["<br/>
				<t align='left'>Refugee Camp</t><br/>
				<t align='left'>Built by %1</t><br/>
				<t align='left'>Damage: %2%3</t>
			",_ownername,_damage,"%"];
		};

		if(_cls isEqualTo OT_flag_IND) then {
			_base = [];
			{
				if((_x select 0) distance _building < 5) exitWith {_base = _x};
			}foreach(server getvariable ["bases",[]]);

			_ownername = players_NS getVariable format["name%1",_base select 2];
			ctrlEnable [1611,true];
			ctrlSetText [1611,"Garrison"];
			_ctrl1611 ctrlSetTooltip "Garrison this FOB with pre-equipped soldiers";

			_buildingTxt = format["<br/>
				<t align='left'>%1</t><br/>
				<t align='left'>Founded by %2</t>
			",_base select 1,_ownername];
		};

		// Police Station
		if(_cls isEqualTo OT_policeStation) then {
			_ownername = players_NS getVariable format["name%1",_owner];

			ctrlEnable [1612,true];
			ctrlSetText [1612,"Manage"];
			_ctrl1612 ctrlSetTooltip "Manage police station";

			_buildingTxt = format["<br/>
				<t align='left'>Police Station</t><br/>
				<t align='left'>Built by %1</t>
			",_ownername];
		};

		// Workshop
		if(_cls isEqualTo OT_workshopBuilding) then {
			_buildingTxt = format["<br/>
				<t align='left'>Workshop</t><br/>
				<t align='left'>Built by %1</t>
			",_ownername];
		};

		// Fetch the list of buildable houses
		private _buildableHouses = (OT_Buildables param [9, []]) param [2, []];
		if(!((_cls) in OT_allRealEstate + [OT_flag_IND] + [OT_item_Tent]) and {!(_cls in _buildableHouses)}) then {
			_lease = 0;

			_buildingTxt = format["<br/>
				<t align='left'>%1</t><br/>
				<t align='left'>Owned by %2</t><br/>
				<t align='left'>Damage: %3%4</t>
			",_name,_ownername,_damage,"%"];
		};

	}else{
		// Building has no owner
		/*if((_cls) in OT_allRepairableRuins) then {
			private _cost = 0;
			{
				if ((_cls == _x select 0) || (_cls == _x select 1)) then {
					_cost = [(_price * (_damage/100)), 1, 0, true] call CBA_fnc_formatNumber;
				};
			}foreach OT_repairableRuins;
			ctrlEnable [1613,true];
			ctrlSetText [1613,"Repair"];
			_ctrl1613 ctrlSetTooltip format ["Repair ($%1)", _cost];
			_buildingTxt = "<t align='left'>Ruins</t><br/>";
		}else{
		*/
			if(!isNil "_price" && _price > 0 && _cls in OT_allBuyableBuildings) then {
				ctrlEnable [1611,true];
				ctrlSetText [1611,format["Buy ($%1)",[_price, 1, 0, true] call CBA_fnc_formatNumber]];
				_ctrl1611 ctrlSetTooltip "Buy this building";

				_buildingTxt = format["<br/>
					<t align='left'>%1</t><br/>
					<t align='left'>Lease Value: $%2/6hrs</t>
				",_name,[_lease, 1, 0, true] call CBA_fnc_formatNumber];

				if(_cls isEqualTo OT_barracks) then {
					_buildingTxt = format["<br/>
						<t align='left'>Barracks</t><br/>
					",_ownername];
				};
			};
		//};
	};
};
private _areaText = "";
_areatxtctrl = (findDisplay 8001) displayCtrl 1101;
private _ob = (getpos player) call OT_fnc_nearestObjective;
_ob params ["_obpos","_obname"];
if(_obpos distance player < 250) then {
	ctrlSetText [1615,"Garrison"];
	if(_obname in (server getVariable ["NATOabandoned",[]])) then {
		_areaText = format["<br/>
			<t align='left'>%1</t><br/>
			<t align='left'>Under resistance control</t>
		",_obname];
		if!(_obname in OT_allComms) then {
			ctrlEnable [1615,true];
		};
	}else{
		_areaText = format["<br/>
			<t align='left'>%1</t><br/>
			<t align='left'>Under NATO control</t>
		",_obname];
	};
}else{
	private _ob = (getpos player) call OT_fnc_nearestLocation;
	if((_ob select 1) isEqualTo "Business") then {
		_obpos = (_ob select 2) select 0;
		_obname = (_ob select 0);
		if(_obpos distance player < 250) then {
			if(_obname in _geurOwned) then {
				_price = _obname call OT_fnc_getBusinessPrice;
				_level = (_obname call OT_fnc_getBusinessData) select 4;
				ctrlSetText [1201,OT_flagImage];
				_areaText = format["<br/>
					<t align='left'>%1</t><br/>
					<t align='left'>Operational (Level %2)</t>
				",_obname,_level];
			}else{
				_price = _obname call OT_fnc_getBusinessPrice;
				ctrlSetText [1201,"\overthrow_main\ui\closed.paa"];
				_areaText = format["<br/>
					<t align='left'>%1</t><br/>
					<t align='left'>Out Of Operation</t>
				",_obname];
				ctrlSetText [1614,"Buy"];
				if (call OT_fnc_playerIsGeneral) then {
					ctrlEnable [1614,true];
				}else{
					ctrlEnable [1614,false];
				};
			};
		};
	}else{
		if((getpos player) distance OT_factoryPos < 150) then {
			_obname = "Factory";
			if(_obname in _geurOwned) then {
				_areaText = format["<br/>
					<t align='left'>%1</t><br/>
					<t align='left'>Operational</t>
				",_obname];
				ctrlEnable [1614,true];
				ctrlSetText [1614,"Manage"];
				ctrlEnable [1615,false];
			}else{
				_price = _obname call OT_fnc_getBusinessPrice;
				_areaText = format["<br/>
					<t align='left'>%1</t><br/>
					<t align='left'>Out Of Operation</t><br/>
					<t align='left'>$%2</t>
				",_obname,[_price, 1, 0, true] call CBA_fnc_formatNumber];
				ctrlSetText [1614,"Buy"];
				ctrlEnable [1615,false];
				if (call OT_fnc_playerIsGeneral) then {
					ctrlEnable [1614,true];
				}else{
					ctrlEnable [1614,false];
				};
			};
		}else{
			ctrlEnable [1614,false];
			ctrlEnable [1615,false];
		};
	};
};

_areatxtctrl ctrlSetStructuredText parseText _areaText;

_buildingtextctrl ctrlSetStructuredText parseText _buildingTxt;

_notifytxtctrl = (findDisplay 8001) displayCtrl 1150;

_txt = "";
_opacity = "FF";
for "_x" from 0 to (count OT_notifyHistory - 1) do {
	_txt = format["%1<t align='left' color='#%2FFFFFF'>%3</t><br/>",_txt,_opacity,OT_notifyHistory select ((count OT_notifyHistory) - _x - 1)];
	call {
		if(_opacity isEqualTo "FF") exitWith {_opacity = "EF"};
		if(_opacity isEqualTo "EF") exitWith {_opacity = "DF"};
		if(_opacity isEqualTo "DF") exitWith {_opacity = "CF"};
		if(_opacity isEqualTo "CF") exitWith {_opacity = "BF"};
		if(_opacity isEqualTo "BF") exitWith {_opacity = "AF"};
		if(_opacity isEqualTo "AF") exitWith {_opacity = "9F"};
		if(_opacity isEqualTo "9F") exitWith {_opacity = "8F"};
		if(_opacity isEqualTo "8F") exitWith {_opacity = "7F"};
		if(_opacity isEqualTo "7F") exitWith {_opacity = "6F"};
		if(_opacity isEqualTo "6F") exitWith {_opacity = "5F"};
		if(_opacity isEqualTo "5F") exitWith {_opacity = "4F"};
		if(_opacity isEqualTo "4F") exitWith {_opacity = "3F"};
		if(_opacity isEqualTo "3F") exitWith {_opacity = "2F"};
		if(_opacity isEqualTo "2F") exitWith {_opacity = "1F"};
		if(_opacity isEqualTo "1F") exitWith {_opacity = "0F"};
	};
};

_notifytxtctrl ctrlSetStructuredText parseText _txt;
