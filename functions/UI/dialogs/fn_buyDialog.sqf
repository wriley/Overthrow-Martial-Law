params ["_town","_standing","_s",["_multiplier", 1]];

private _sorted = [_s,[],{_x select 0},"ASCEND"] call BIS_fnc_SortBy;
private _canCrateBuy = false;
private _civ = OT_interactingWith;
private _cat = "";
lbClear 1500;
{
	_x params ["_cls", "_num", ["_enabled", true], ["_disabledText", "Not Available"]];

	private _price = [_town,_cls,_standing] call OT_fnc_getPrice;
	_price = _price * _multiplier;
	([_cls] call {
		params ["_cls", ["_name",""], ["_pic",""]];
		if(_cls isKindOf "All") exitWith {
			_name = _cls call OT_fnc_vehicleGetName;
			_pic = _cls call OT_fnc_vehicleGetPic;
			[_name, _pic]
		};
		if(_cls isKindOf ["None",configFile >> "CfgGlasses"]) exitWith {
			_name = _cls call OT_fnc_glassesGetName;
			_pic = _cls call OT_fnc_glassesGetPic;
			[_name, _pic]
		};
		if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
			_name = _cls call OT_fnc_magazineGetName;
			_pic = _cls call OT_fnc_magazineGetPic;
			[_name, _pic]
		};
		_name = _cls call OT_fnc_weaponGetName;
		_pic = _cls call OT_fnc_weaponGetPic;
		[_name, _pic]
	}) params ["_name", "_pic"];

	private _text = format["%1 x %2",_num,_name];
	if(_num isEqualTo -1) then {_text = _name};
	private _idx = lbAdd [1500,_text];
	lbSetPicture [1500,_idx,_pic];
	if !(_enabled) then {
		lbSetColor [1500,_idx,[0.3,0.3,0.3,1]];
		_price = -1;
		_cls = _disabledText;
	};
	lbSetValue [1500,_idx,_price];
	lbSetData [1500,_idx,_cls];
	lbSetCurSel [1500, 0];
}foreach(_sorted);
ctrlEnable [1602, false];
ctrlEnable [1601, false];

if (_civ getvariable ["shop",false]) then { _canCrateBuy=true; _cat = format["<t align='center' size='2'>%1 Shop</t>",(_civ getvariable ["OT_shopCategory", ""])];};
if (_civ getvariable ["gundealer",false]) then { _canCrateBuy=true; _cat = format["<t align='center' size='2'>Gun Dealer</t>"]; };
if (_civ getvariable ["factionrep",false]) then { _canCrateBuy=true; _cat = format["<t align='center' size='2'>Faction Supplies</t>"]; };

_textctrl = (findDisplay 8000) displayCtrl 1101;
_textctrl ctrlSetStructuredText parseText _cat;

if (_canCrateBuy) then {
	{
		private _owner = _x call OT_fnc_getOwner;
		if(!isNil "_owner") then {
			if(_owner == getplayerUID player) exitWith {ctrlEnable [1601, true];ctrlEnable [1602, true];};
		};
	}foreach(nearestObjects [getpos player, [OT_item_Storage],20]);
};
