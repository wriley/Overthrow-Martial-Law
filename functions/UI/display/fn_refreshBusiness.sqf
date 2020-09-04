if (isNull(findDisplay 8000) || !hasInterface) exitWith {};
disableSerialization;
private ["_name","_item","_cost","_need","_xp","_level","_nextlevel"];


private _name = lbText [1500,(lbCurSel 1500)];
private _item = lbText [1501,(lbCurSel 1501)];
private _supplyname = lbText [1502,(lbCurSel 1502)];
private _business = _name call OT_fnc_getBusinessData;
private _employees = server getVariable [format["%1employ",_name],0];
private _salary = [OT_nation,"WAGE",0] call OT_fnc_getPrice;
_business params ["_pos","","_production","_xp","_level","_nextlevel"];
lbClear 1501;
{
	private _cls = _x select 0;
	private _longname = _cls call OT_fnc_weaponGetName;

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
	if (_cls == "Money") then { _longname = "Cash!"; };
	private _idx = lbAdd [1501,format["%1",_longname]];
	lbSetPicture [1501,_idx,_pic];
	lbSetData [1501,_idx,_cls];

}foreach _production;

private _wages = _employees * _salary;
// GET PRICES OF OUTPUT AND CALCULATE RESISTANCE INCOME
private _income = 666;

private _nexthr = ((date select 3) + 1);
if(_nexthr < 10) then {_nexthr = format ["0%1",_nexthr]};

// business statistics
private _text = format["<t>%1 Statistics</t><br/>",_name];
_text = _text + format["<t>Employees:  %1</t><br/>",_employees];
_text = _text + format["<t>Wages:      $%1 /hr</t><br/>",_wages];
_text = _text + format["<t>Business Level:      %1</t><br/>",_level];
_text = _text + format["<t>XP:         %1</t><br/>",_xp];
_text = _text + format["<t>Next Level: %1</t><br/>",_nextlevel];
_text = _text + format["<t>Income:     %1</t><br/>",_income];
_text = _text + format["<t>Next cycle: %1:00</t><br/>",_nexthr];
_textctrl = (findDisplay 8000) displayCtrl 1108;
_textctrl ctrlSetStructuredText parseText _text;

// required for production
private _need = format ["<t size='1.2'>Required (in Store)</t><br/><br/>"];

{
	_x params ["_output","_inputs"];
	diag_log str _x;
	if (_output isEqualTo _item) then {
		if (count _inputs > 0) then {
			private _stock = [];
			{
				_container = _x;
				_stock = _container call OT_fnc_unitStock;
			}foreach(_pos nearObjects [OT_businessStorage, 50]);
			private _cost = 0;
			{
				_x params ["_cls", "_qty"];
				if!(_cls isEqualTo "Money") then {
					private _longname = _cls call OT_fnc_weaponGetName;
					private _contqty = 0;
					{
						_contcls = _x select 0;
						if(_contcls isEqualTo _cls) then {_contqty = _x select 1;};
					}foreach(_stock);
					if (_contqty >= _qty) then {_need = _need + format["<t>%1 x %2 </t><t  color='#00CC00'>(%3)</t><br/>",_qty,_longname, _contqty];
					} else {_need = _need + format["<t>%1 x %2 </t><t color='#FF0000'>(%3)</t><br/>",_qty,_longname, _contqty];};
				} else {
					_need = _need + format["<t size='1.2'>Nothing</t><br/>"];
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
if(lbCurSel 1501 isEqualTo -1) then {
	_textctrl = (findDisplay 8000) displayCtrl 1109;
	_textctrl ctrlSetStructuredText parseText "";
} else {
	_textctrl = (findDisplay 8000) displayCtrl 1109;
	_textctrl ctrlSetStructuredText parseText _need;
};
lbClear 1502;
private _queue = server getVariable [format ["%1queue", _name], []];
{
	_x params ["_cls","_qty"];
	private _idx = -1;
	private _producingtext = "";
	if (_forEachIndex == 0) then {
		_producingtext = _producingtext + format["(Producing..)"];
	};
	private _longname = _cls call OT_fnc_weaponGetName;
	private _itemtext = format["%1 x %2",_qty, _longname];
	if (_cls == "Money") then { _itemtext = format["Money"]; };
	_idx = lbAdd [1502,format["%1 %2",_itemtext, _producingtext]];
	lbSetData [1502,_idx,_cls];
}foreach _queue;
