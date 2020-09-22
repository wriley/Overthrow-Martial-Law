if (isNull(findDisplay 8000) || !(player call OT_fnc_positionIsAtWarehouse)) exitWith {};
params ["_refreshID"];
private _wid = getpos player call OT_fnc_nearestWarehouse select 1;
if (_refreshID != _wid) exitWith {};
if !(isNil "_refreshID") then {
	_wid = _refreshID;
};

private _itemVars = allVariables warehouses select {((toLower _x select [0,21]) isEqualTo (format["warehouse-%1_",_wid]))};
private _listbox = (findDisplay 8000) displayCtrl 1500;
private _numitems = 0;
private _rifles = [];
private _launchers = [];
private _pistols = [];
private _default = [];
private _bags = [];
private _unsorted = [];
{
	private _itemArr = warehouses getVariable [_x,["",0]];
	_itemArr params [["_cls","",[""]], ["_qty",0,[0]]];
	_handled = false;
	if(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"]) then {
		_rifles pushback [_cls,_qty];
		_handled = true;
	};
	if(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"]) then {
		_launchers pushback [_cls,_qty];
		_handled = true;
	};
	if(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"]) then {
		_pistols pushback [_cls,_qty];
		_handled = true;
	};
	if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) then {
		_default pushback [_cls,_qty];
		_handled = true;
	};
	if(_cls isKindOf "Bag_Base") then {
		_bags pushback [_cls,_qty];
		_handled = true;
	};
	if!(_handled) then {
		_unsorted pushback [_cls,_qty];
	};
}foreach _itemVars;

private _sorted = _rifles + _launchers + _pistols + _default + _unsorted + _bags;
private _list = [];
{
	_x params ["_cls","_qty"];
	if ((_cls isEqualType "") && _qty > 0) then {
		private _searchnum = 0;
		([_cls] call {
			params ["_cls"];
			private _numitems = 0;
			private _SearchTerm = ctrlText 1700;
			if(_cls isKindOf ["Default",configFile >> "CfgWeapons"]) exitWith {
				_name = _cls call OT_fnc_weaponGetName;
				_searchtext = _cls + _name + format["%1<br/>%2",getText(configFile >> "CfgWeapons" >> _cls >> "descriptionShort"),_cls call OT_fnc_magazineGetDescription];
				if(tolower(_searchtext) find tolower(_SearchTerm) > -1) then {
					_numitems = 1;
					_pic = _cls call OT_fnc_weaponGetPic;
					[_name,_pic,_numitems]
				};
			};
			if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
				_name = _cls call OT_fnc_magazineGetName;
				_searchtext = _cls + _name + (_cls call OT_fnc_magazineGetDescription);
				if(tolower(_searchtext) find tolower(_SearchTerm) > -1) then {
					_numitems = 1;
					_pic = _cls call OT_fnc_magazineGetPic;
					[_name,_pic,_numitems]
				};
			};
			if(_cls isKindOf "Bag_Base") exitWith {
				_name = _cls call OT_fnc_vehicleGetName;
				_searchtext = _cls + _name + (_cls call OT_fnc_vehicleGetDescription);
				if(tolower(_searchtext) find tolower(_SearchTerm) > -1) then {
					_numitems = 1;
					_pic = _cls call OT_fnc_vehicleGetPic;
					[_name,_pic,_numitems]
				};
			};
			if(isClass (configFile >> "CfgGlasses" >> _cls)) exitWith {
				_name = gettext(configFile >> "CfgGlasses" >> _cls >> "displayName");
				_searchtext = _cls + _name;
				if(tolower(_searchtext) find tolower(_SearchTerm) > -1) then {
					_numitems = 1;
					_pic = gettext(configFile >> "CfgGlasses" >> _cls >> "picture");
					[_name,_pic,_numitems]
				};
			};
			_name = _cls call OT_fnc_vehicleGetName;
			_searchtext = _cls + _name;
			if(tolower(_searchtext) find tolower(_SearchTerm) > -1) then {
				_numitems = 1;
				_pic = _cls call OT_fnc_vehicleGetPic;
				[_name,_pic,_numitems]
			};
		}) params ["_name","_pic","_searchnum"];
		if (_searchnum > 0) then {
			_numitems = _numitems + _searchnum;
			_list pushback [_name, _cls, _qty, _pic];
		};
	};
}foreach(_sorted);

if (lbSize 1500 != _numitems) then { lbClear 1500; };
{
	_x params ["_name", "_cls", "_qty", "_pic"];
	private _lbCls = lbData [1500, _forEachIndex];
	private _lbQty = lbValue [1500, _forEachIndex];
	if ((_lbCls != _cls) || (_lbQty != _qty)) then {
		if (_forEachIndex >= (lbSize 1500)) then {
			lbAdd [1500,format["%1 x %2",_qty,_name]];
		} else {
			_listbox lbSetText [_forEachIndex, format["%1 x %2",_qty,_name]];
		};
		if (_lbCls != _cls) then {
			lbSetPicture [1500,_forEachIndex,_pic];
			lbSetData [1500,_forEachIndex,_cls];
		};
		if (_lbQty != _qty) then {
			lbSetValue [1500,_forEachIndex,_qty];
		};
	};
} foreach _list;

private _cursel = lbCurSel 1500;
if(_cursel >= _numitems) then {_cursel = 0};
lbSetCurSel [1500, _cursel];