if (isNull findDisplay 46) exitWith {};
params ["_id"];
private _cursel = lbCurSel 1500;
lbClear 1500;
_SearchTerm = ctrlText 1700;

_count = 0;
diag_log format ["[fn_refreshWarehouse]: warehouse ID:%1", _id];
player globalchat format ["[fn_refreshWarehouse]: warehouse ID:%1", _id];
private _itemVars = allVariables warehouse select {((toLower _x select [0,(11+count _id)]) isEqualTo (format["warehouse-%1_",_id]))};
diag_log format ["[fn_refreshWarehouse]: _itemVars:%1", _itemVars];
_itemVars sort true;
diag_log format ["[fn_refreshWarehouse]: _itemVars:%1", _itemVars];
private _numitems = 0;

private _rifles = [];
private _launchers = [];
private _pistols = [];
private _default = [];
private _bags = [];
private _unsorted = [];
{
	private _d = warehouse getVariable [_x,["",0]];
	diag_log format ["[fn_refreshWarehouse]: _x: %1 _d:%2", _x, _d];
	_d params [["_cls","",[""]], ["_num",0,[0]]];
	_handled = false;
	if(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"]) then {
		_rifles pushback [_cls,_num];
		_handled = true;
	};
	if(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"]) then {
		_launchers pushback [_cls,_num];
		_handled = true;
	};
	if(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"]) then {
		_pistols pushback [_cls,_num];
		_handled = true;
	};
	if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) then {
		_default pushback [_cls,_num];
		_handled = true;
	};
	if(_cls isKindOf "Bag_Base") then {
		_bags pushback [_cls,_num];
		_handled = true;
	};
	if!(_handled) then {
		_unsorted pushback [_cls,_num];
	};
}foreach _itemVars;
private _sorted = _rifles + _launchers + _pistols + _default + _bags + _unsorted;
diag_log format ["[fn_refreshWarehouse]: _rifles:%1", _rifles];
diag_log format ["[fn_refreshWarehouse]: _launchers:%1", _launchers];
diag_log format ["[fn_refreshWarehouse]: _pistols:%1", _pistols];
diag_log format ["[fn_refreshWarehouse]: _default:%1", _default];
diag_log format ["[fn_refreshWarehouse]: _bags:%1", _bags];
diag_log format ["[fn_refreshWarehouse]: _unsorted:%1", _unsorted];
diag_log format ["[fn_refreshWarehouse]: _sorted:%1", _sorted];
{
//	private _d = warehouse getVariable [_x,1];
	diag_log format ["[fn_refreshWarehouse]: _x%1 [%2]", _forEachIndex, _x];
//	if(_d isEqualType []) then {
	_x params ["_cls","_num"];
//	if(tolower(_cls) find _SearchTerm > -1) then {
	if ((_cls isEqualType "") && _num > 0) then {
//		_numitems = _numitems + 1;
		([_cls] call {
			params ["_cls"];
			private _numitems = 0;
			if(_cls isKindOf ["Default",configFile >> "CfgWeapons"]) exitWith {
				_name = _cls call OT_fnc_weaponGetName;
				if(tolower(_name) find tolower(_SearchTerm) > -1) then {
					_numitems = 1;
					_pic = _cls call OT_fnc_weaponGetPic;
					[_name,_pic,_numitems]
				};
			};
			if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
				_name = _cls call OT_fnc_magazineGetName;
				if(tolower(_name) find tolower(_SearchTerm) > -1) then {
					_numitems = 1;
					_pic = _cls call OT_fnc_magazineGetPic;
					[_name,_pic,_numitems]
				};
			};
			if(_cls isKindOf "Bag_Base") exitWith {
				_name = _cls call OT_fnc_vehicleGetName;
				if(tolower(_name) find tolower(_SearchTerm) > -1) then {
					_numitems = 1;
					_pic = _cls call OT_fnc_vehicleGetPic;
					[_name,_pic,_numitems]
				};
			};
			if(isClass (configFile >> "CfgGlasses" >> _cls)) exitWith {
				_name = gettext(configFile >> "CfgGlasses" >> _cls >> "displayName");
				if(tolower(_name) find tolower(_SearchTerm) > -1) then {
					_numitems = 1;
					_pic = gettext(configFile >> "CfgGlasses" >> _cls >> "picture");
					[_name,_pic,_numitems]
				};
			};
			_name = _cls call OT_fnc_vehicleGetName;
			if(tolower(_name) find tolower(_SearchTerm) > -1) then {
				_numitems = 1;
				_pic = _cls call OT_fnc_vehicleGetPic;
				[_name,_pic,_numitems]
			};
		}) params ["_name","_pic","_searchnum"];
		if (_searchnum > 0) then {
			_numitems = _numitems + _searchnum;
			private _idx = lbAdd [1500,format["%1 x %2",_num,_name]];
			lbSetPicture [1500,_idx,_pic];
			lbSetValue [1500,_idx,_num];
			lbSetData [1500,_idx,_cls];
		};
	};
	//};
	//};
}foreach(_sorted);

if(_cursel >= _numitems) then {_cursel = 0};
lbSetCurSel [1500, _cursel];
