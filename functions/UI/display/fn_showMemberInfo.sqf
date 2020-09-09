params ["_ctrl","_index"];

disableSerialization;

private _uid = _ctrl lbData _index;
private _generals = _generals;
_amgen = (getPlayerUID player) in _generals;

_isonline = false;
_on = "Offline";
_player = objNull;
{
    if(getplayeruid _x isEqualTo _uid) exitWith {_isonline = true;_on = "Online";_player = _x};
}foreach(allplayers);

_money = 0;
if(_isonline) then {
    _money = _player getVariable["money",0];
}else{
    _money = [_uid,"money"] call OT_fnc_getOfflinePlayerAttribute;
};

if(_uid in _generals) then {
    _on = _on + " (General)";
};

_text = format["<t size='1.5'>%1</t><br/>",_ctrl lbText _index];
_text = _text + format["<t size='1.05'>%1</t><br/>",_on];

if(_amgen) then {
    _text = _text + format["<t size='1.05'>Funds(general privelage): $%1</t>",[_money, 1, 0, true] call CBA_fnc_formatNumber];
};

_textctrl = (findDisplay 8000) displayCtrl 1102;
_textctrl ctrlSetStructuredText parseText _text;

if (_amgen) then {
	// i'm general
	if (_uid != (getplayeruid player)) then {
		// not me selected
		if !(_uid in _generals) then {
			// not already a general
			ctrlEnable [1600,true];
		} else {
			ctrlEnable [1600,false];
		};
	};
} else {
    ctrlShow [1600,false];
	if (_uid isEqualTo (getplayeruid player)) then {
		// me selected
		//ctrlShow [1601,false];
	};
};