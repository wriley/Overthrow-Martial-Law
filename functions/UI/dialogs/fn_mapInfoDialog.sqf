
if (visibleMap) exitWith {};
if (!isNil "OT_MapSingleClickEHId" || !isNil "OT_MapEHId") exitWith {};

hint "Click on a location";

OT_MapSingleClickEHId = addMissionEventHandler["MapSingleClick", {
	params ["", "_pos", "_alt", "_shift"];
	private _loc = _pos call OT_fnc_nearestLocation;
	private _txt = "";
	_loc call {
		params ["_name","_type","_data"];
		if (_type == "Town") exitWith {
			private _town = _name;
			private _pop = server getVariable format["population%1",_town];
			private _stability = server getVariable format["stability%1",_town];
			private _status = "Under NATO Control";
			if(_town in (server getVariable ["NATOabandoned",[]])) then {
				if(_stability < 50) then {
					_status = "Anarchy";
				}else{
					_status = "Under Resistance Control";
				};
			};
			private _rep = [_town] call OT_fnc_support;
			private _plusmin = "";
			if(_rep > -1) then {
				_plusmin = "+";
			};
			_txt = format ["
				<t align='left' size='0.8' color='#222222'>%1</t><br/>
				<t align='left' size='0.5' color='#222222'>Status: %7</t><br/><br/>
				<t align='left' size='0.5' color='#222222'>Population: %2</t><br/>
				<t align='left' size='0.5' color='#222222'>Stability: %3%4</t><br/>
				<t align='left' size='0.5' color='#222222'>Resistance Support: %5%6</t>
				",
				_town,
				[_pop, 1, 0, true] call CBA_fnc_formatNumber,
				_stability,
				"%",
				_plusmin,
				_rep,
				_status
			];
		};
		if (_type in ["Objective","Radio Tower","Airport"]) exitWith {
			private _status = "Under NATO Control";
			if(_name in (server getVariable ["NATOabandoned",[]])) then {
				_status = "Under Resistance Control";
			};
			_txt = format ["
				<t align='left' size='0.8' color='#222222'>%1</t><br/>
				<t align='left' size='0.5' color='#222222'>Status: %2</t>
				",
				_name,
				_status
			];
		};
		if (_type == "Faction") exitWith {
			private _faction = _name;
			private _name = getText (configFile >> "cfgFactionClasses" >> _faction >> "displayName");
			private _standing = server getVariable [format["standing%1",_faction],0];
			_txt = format ["
				<t align='left' size='0.8' color='#222222'>%1</t><br/>
				<t align='left' size='0.5' color='#222222'>Standing: %2</t>
				",
				_name,
				_standing
			];
		};
		if (_type == "Business") exitWith {
			_business = _name call OT_fnc_getBusinessData;
			_business params ["_pos","","_production","_xp","_level","_nextlevel"];
			_canmake = "<br/>";
			{
				_x params ["_output"];
				if !(_output in ["Money","Support"]) then {
					_canmake = _canmake + format ["<t align='left' size='0.5' color='#222222'>%1</t><br/>", (_output call OT_fnc_weaponGetName)];
				} else {
					_canmake = _canmake + format ["<t align='left' size='0.5' color='#222222'>%1</t><br/>", _output];
				};
			}foreach _production;

			private _status = "Inactive";
			if(_name in (server getVariable ["GEURowned",[]])) then {
				_employees = server getVariable [format["%1employ",_name],0];
				_queue = server getVariable [format["%1queue", _name], []];
				if (count _queue > 0) then {
					private _producing = "";
					if !((_queue select 0 select 0) in ["Money"]) then {
						_producing = (_queue select 0 select 0) call OT_fnc_weaponGetName;
					} else {
						_producing = _queue select 0 select 0;
					};
					_status = format["Producing %1</t><br/>
						<t align='left' size='0.5' color='#222222'>Employees: %2</t><br/>
						<t align='left' size='0.5' color='#222222'>Level: %3</t><br/>
						<t align='left' size='0.5' color='#222222'>Xp: %4
						",
						_producing,
						_employees,
						_level,
						_xp
					];
				} else {
					_status = format["Owned (Inactive)</t><br/>
						<t align='left' size='0.5' color='#222222'>Employees: %1</t><br/>
						<t align='left' size='0.5' color='#222222'>Level: %2</t><br/>
						<t align='left' size='0.5' color='#222222'>Xp: %3
						",
						_employees,
						_level,
						_xp
					];
				};
			};
			_txt = format ["
				<t align='left' size='0.8' color='#222222'>%1</t><br/>
				<t align='left' size='0.5' color='#222222'>Status: %2</t><br/><br/>
				<t align='left' size='0.5' color='#222222'>Available Production</t>
				%3
				",
				_name,
				_status,
				_canmake
			];
		};
	};
	[_txt, [0.819692 * safezoneW + safezoneX,0.165 * safezoneW], 0.5, 10, 0, 0, 2] call OT_fnc_dynamicText;
}];

OT_MapEHId = addMissionEventHandler["Map", {
	params ["_mapIsOpened"];
	if (!_mapIsOpened) then {
		if (isNil "OT_MapSingleClickEHId" || isNil "OT_MapEHId") exitWith {};
		removeMissionEventHandler ["MapSingleClick", OT_MapSingleClickEHId];
		removeMissionEventHandler ["Map", OT_MapEHId];
		OT_MapSingleClickEHId = nil;
		OT_MapEHId = nil;
	};
}];

openMap true;
