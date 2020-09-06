if (isNull(findDisplay 8035) || !hasInterface) exitWith {};
disableSerialization;
private ["_selBusiness","_selProduct","_cost","_need","_xp","_level","_nextlevel"];
lbClear 1500;
lbClear 1501;
lbClear 1502;

{
	_idx = lbAdd [1500,_x];
	_queue = server getVariable [format["%1queue", _x], []];
	if (count _queue > 0) then {
		lbSetColor [1500, _idx, [0, .8, 0, 1]];
	};
}foreach (server getVariable ["GEURowned",[]]);
lbSort [1500,"ASC"];

private _selBusiness = lbText [1500,(lbCurSel 1500)];
private _business = _selBusiness call OT_fnc_getBusinessData;
_business params ["_pos","","_production","_xp","_level","_nextlevel"];
private _employees = server getVariable [format["%1employ",_selBusiness],0];
private _salary = [OT_nation,"WAGE",0] call OT_fnc_getPrice;
private _wages = _employees * _salary;
private _income = round(_wages * (1.5 + (_level/10)));
private _productText = "Nothing"; // currently producing text

{
	_x params ["_product","_inputs"];
	private _longname = _product call OT_fnc_weaponGetName;

	([_product] call {
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
	if (_product == "Money") then { _longname = "Cash!"; };
	if (_product == "Support") then { _longname = "Town Support!"; };
	private _idx = lbAdd [1501,format["%1",_longname]];
	lbSetPicture [1501,_idx,_pic];
	lbSetData [1501,_idx,_product];
}foreach _production;



// required for production
private _selProduct = lbData [1501,(lbCurSel 1501)];
private _selProductText = lbText [1501,(lbCurSel 1501)];
private _need = format ["<t size='1.2'>Required (in Store)</t><br/><br/>"];
{
	_x params ["_product","_inputs"];
	private _longname = _product call OT_fnc_weaponGetName;
	//format ["[refreshBusiness] - inputs:%1", _inputs] remoteExec ["systemChat", 0];
	if (_product isEqualTo _selProduct) then {
		if (count _inputs > 0) then {
			private _stock = [];
			{
				_container = _x;
				_stock = _container call OT_fnc_unitStock;
			}foreach(_pos nearObjects [OT_businessStorage, 50]);
			private _cost = 0;
			{
				_x params ["_cls", "_qty"];
				//format ["[refreshBusiness] - input:%1", _x] remoteExec ["systemChat", 0];
				switch (_cls) do {
					case "Money": {
						_need = _need + format["<t size='1.2'>$%1</t><br/>", 100*_qty];
					};
					default {
						private _longname = _cls call OT_fnc_weaponGetName;
						private _contqty = 0;
						{
							_contcls = _x select 0;
							if(_contcls isEqualTo _cls) then {_contqty = _x select 1;};
						}foreach(_stock);
						if (_contqty >= _qty) then {_need = _need + format["<t>%1 x %2 </t><t  color='#00CC00'>(%3)</t><br/>",_qty,_longname, _contqty];
						} else {_need = _need + format["<t>%1 x %2 </t><t color='#FF0000'>(%3)</t><br/>",_qty,_longname, _contqty];};
					};
				};
			}foreach _inputs;
		} else {
			_need = _need + format["<t size='1.2'>None</t><br/>"];
		};
	};
}foreach _production;


if(lbCurSel 1501 isEqualTo -1) then {
	_textctrl = (findDisplay 8035) displayCtrl 1109;
	_textctrl ctrlSetStructuredText parseText "";
} else {
	_textctrl = (findDisplay 8035) displayCtrl 1109;
	_textctrl ctrlSetStructuredText parseText _need;
};
private _queue = server getVariable [format ["%1queue", _selBusiness], []];
private _producingText = "";
{
	_x params ["_cls","_qty"];
	private _longname = _cls call OT_fnc_weaponGetName;
	private _productText = format["%1 x %2",_qty, _longname];

	switch (_cls) do {
		case "Money": {
			//_producingText = format["Cash! ($%1 Net/Hr)",[(_income-_wages), 1, 0, true] call CBA_fnc_formatNumber]; // (110% to 150% profitability on wages)
			_productText = format["Cash! ($%1 Net/Hr)",[(_income-_wages), 1, 0, true] call CBA_fnc_formatNumber]; // (110% to 150% profitability on wages)
		};
		case "Support": {
			_productText = format["Town Support!"]; // (110% to 150% profitability on wages)
		};
	};
	if (_forEachIndex == 0) then {
		_producingText = _productText;
		_productText =  format["%1 (Producing)",_productText];
	};
	_idx = lbAdd [1502,format["%1", _productText]];
	lbSetData [1502,_idx,_cls];
}foreach _queue;

// business statistics
private _text = format["<t>%1 Statistics</t><br/>",_selBusiness];
_text = _text + format["<t>Employees: %1/%2</t><br/>",_employees,_level*10];
_text = _text + format["<t>Wages: $%1 /hr</t><br/>",_wages];
_text = _text + format["<t>Business Level: %1</t><br/>",_level];
_text = _text + format["<t>XP: %1</t><br/>",_xp];
_text = _text + format["<t>Next Level: %1</t><br/>",_nextlevel];
_text = _text + format["<t>Producing: %1</t><br/>",_producingText];
private _nextMakeDate = numberToDate [date select 0,(server getVariable [format["%1lastMakeDateNumber", _selBusiness], -1])  + (60 * 0.0000019) - (_employees * 0.0000019)];
if (_nextMakeDate isEqualType []) then {
	if (_nextMakeDate select 4 < 10) then {
		_nextMakeDate set [4, format["0%1", _nextMakeDate select 4]];
	};
	_text = _text + format["<t>Next cycle: %1:%2</t><br/>",_nextMakeDate select 3, _nextMakeDate select 4];
} else {
	_text = _text + format["<t>Next cycle: Not producing</t><br/>"];
};
_textctrl = (findDisplay 8035) displayCtrl 1108;
_textctrl ctrlSetStructuredText parseText _text;
