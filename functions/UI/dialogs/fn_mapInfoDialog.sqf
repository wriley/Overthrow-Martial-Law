
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
			_txt = format [
				"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Status: %7</t><br/><t size='0.5' color='#222222'>Population: %2</t><br/><t size='0.5' color='#222222'>Stability: %3%4</t><br/><t size='0.5' color='#222222'>Resistance Support: %5%6</t>",
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
			_txt = format [
				"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Status: %2</t>",
				_name,
				_status
			];
		};
		if (_type == "Faction") exitWith {
			private _faction = _name;
			private _name = getText (configFile >> "cfgFactionClasses" >> _faction >> "displayName");
			private _standing = server getVariable [format["standing%1",_faction],0];
			_txt = format [
				"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Standing: %2</t>",
				_name,
				_standing
			];
		};
		if (_type == "Business") exitWith {
			_business = _name call OT_fnc_getBusinessData;
			_business params ["_pos","","_production","_xp","_level","_nextlevel"];
			_canmake = "";
			_cancount = 1;
			{
				_x params ["_output"];
				_canmake = _canmake + format ["<t size='0.5' color='#222222'>%1</t></br>", (_output call OT_fnc_weaponGetName)];
			}foreach _production;
			//lbClear 1501;

			private _status = "Inactive";
			if(_name in (server getVariable ["GEURowned",[]])) then {
				_employees = server getVariable [format["%1employ",_name],0];
				_status = format["
					Owned</t><br/>
					<t size='0.5' color='#222222'>Employees: %1</t></br>
					<t size='0.5' color='#222222'>Level: %2</t></br>
					<t size='0.5' color='#222222'>Xp: %3
					",
					_employees,
					_level,
					_xp
				];
			};
			_txt = format ["
				<t size='1.2' color='#222222'>%1</t><br/>
				<t size='0.5' color='#222222'>Status: %2</t><br/>
				<t size='0.65' color='#222222'>Available Production</t><br/>
				%3
				",
				_name,
				_status,
				_canmake
			];
		};
	};
	[_txt, [safeZoneX + (0.7 * safeZoneW), (0.35 * safeZoneW)], 0.5, 10, 0, 0, 2] call OT_fnc_dynamicText;
}];

OT_MapEHId = addMissionEventHandler["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	if (!_mapIsOpened) then {
		diag_log "Removing OT_MapSingleClick";
		if (isNil "OT_MapSingleClickEHId" || isNil "OT_MapEHId") exitWith {};
		removeMissionEventHandler ["MapSingleClick", OT_MapSingleClickEHId];
		removeMissionEventHandler ["Map", OT_MapEHId];
		OT_MapSingleClickEHId = nil;
		OT_MapEHId = nil;
	};
}];

openMap true;
