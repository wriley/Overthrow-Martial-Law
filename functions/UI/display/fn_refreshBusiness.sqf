disableSerialization;
private ["_name","_item","_cost","_need","_xp","_level","_nextlevel"];


private _name = lbText [1500,(lbCurSel 1500)];
private _item = lbText [1501,(lbCurSel 1501)];
private _supplyname = lbText [1502,(lbCurSel 1502)];
private _business = _name call OT_fnc_getBusinessData; 
_business params ["_pos","","_production","_xp","_level","_nextlevel"];
private _employees = server getVariable [format["%1employ",_name],0];
private _salary = [OT_nation,"WAGE",0] call OT_fnc_getPrice;

lbClear 1501;
{
	private _clsname = _x select 0;
	private _cls = _x select 1;

	([_cls] call {
		params ["_cls"];
		if(_cls isKindOf ["Default",configFile >> "CfgWeapons"]) exitWith {
			_pic = _cls call OT_fnc_weaponGetPic;
			[_pic]
		};
		if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
			_pic = _cls call OT_fnc_magazineGetPic;
			[_pic]
		};
		if(_cls isKindOf "Bag_Base") exitWith {
			_pic = _cls call OT_fnc_vehicleGetPic;
			[_pic]
		};
		if(isClass (configFile >> "CfgGlasses" >> _cls)) exitWith {
			_pic = gettext(configFile >> "CfgGlasses" >> _cls >> "picture");
			[_pic]
		};
		_pic = _cls call OT_fnc_vehicleGetPic;
		[_pic]
	}) params ["_pic"];
	private _idx = lbAdd [1501,format["%1",_clsname]];
	lbSetPicture [1501,_idx,_pic];
	lbSetData [1501,_idx,_cls];
	
}foreach _production;
//lbSetCurSel [1501,0];
if(_name isEqualTo "Factory") then {_salary = _salary * 2};

private _wages = _employees * _salary;
// GET PRICES OF OUTPUT AND CALCULATE RESISTANCE INCOME
private _income = 666;

private _nexthr = ((date select 3) + 1);
if(_nexthr < 10) then {_nexthr = format ["0%1",_nexthr]};

// business statistics
private _text = format["<t size='1.4'>%1</t><br/>",_name];
_text = _text + format["<t size='1.2'>Employees:  %1</t><br/>",_employees];
_text = _text + format["<t size='1.2'>Wages:      $%1 /hr</t><br/>",_wages];
_text = _text + format["<t size='1.2'>XP:         %1</t><br/>",_xp];
_text = _text + format["<t size='1.2'>Level:      %1</t><br/>",_level];
_text = _text + format["<t size='1.2'>Next Level: %1</t><br/><br/>",_nextlevel];
_text = _text + format["<t size='1.2'>Income:     %1</t><br/>",_income];
_text = _text + format["<t size='1.2'>Next cycle: %1:00</t><br/>",_nexthr];
_textctrl = (findDisplay 8000) displayCtrl 1108;
_textctrl ctrlSetStructuredText parseText _text;

// required for production
private _need = "";
{
	_x params ["_output","","_inputs"];
	diag_log str _x;
	if (_output isEqualTo _item) then {
		if (count _inputs > 0) then {
			private _cost = 0;
			{
				_x params ["_cls", "_qty"];
				if!(_cls isEqualTo "Money") then {
					private _longname = _cls call OT_fnc_weaponGetName;
					_need = _need + format["<t size='1'>%2 x %1</t><br/>",_longname,_qty];
				} else {
					for [{private _i=0},{_i<_qty},{_i=_i+1}] do {
						_cost = _cost + round((([OT_nation,_cls,0]) call OT_fnc_getPrice) * (1-(_level/10)));
					};
				};
			}foreach _inputs;
			if (_cost > 0) then {
				_cost = [_cost, 1, 0, true] call CBA_fnc_formatNumber;
				_need = _need + format["<t size='1.2'>$%1</t><br/>",_cost];
			};
		} else {
			_need = _need + format["<t size='1.2'>None</t><br/>"];
		};
	};
}foreach _production;
_textctrl = (findDisplay 8000) displayCtrl 1109;
_textctrl ctrlSetStructuredText parseText _need;

if(lbCurSel 1501 isEqualTo -1) then {
	_textctrl = (findDisplay 8000) displayCtrl 1109;
	_textctrl ctrlSetStructuredText parseText "";
};