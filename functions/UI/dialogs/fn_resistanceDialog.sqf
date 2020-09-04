createDialog 'OT_dialog_resistance';

ctrlEnable [1600,false];
ctrlEnable [1601,false];

private _amgen = (getPlayerUID player) in (server getVariable ["generals",[]]);
if(!isMultiplayer) then {_amgen = true};

if(!_amgen) then {
    ctrlEnable [1605,false];
    ctrlEnable [1602,false];
    ctrlEnable [1603,false];
};

if(!isMultiplayer) then {
    ctrlEnable [1604,false];
    ctrlEnable [1605,false];
};

lbClear 1500;
{
    _uid = _x;
    _name = players_NS getVariable [format["name%1",_uid],"Player"];
    _idx = lbAdd [1500,_name];
    _pic = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
    if(_uid in (server getVariable ["generals",[]])) then {
        _pic = "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa";
    };
    _col = [0.8,0.8,0.8,1];
    {
        if(getplayeruid _x isEqualTo _uid) exitWith {_col = [1,1,1,1]};
    }foreach(allplayers);

    lbSetColor [1500, _idx, _col]
    lbSetPicture [1500,_idx,_pic];
    lbSetData [1500,_idx,_uid];
}foreach(players_NS getVariable ["OT_allplayers",[]]);
lbSetCurSel [1500,0];
_tax = server getVariable ["taxrate",0];
_damaged = owners getVariable ["damagedBuildings",[]];
private _lease = 0;
{
    _x params ["_id","_cls","_pos","_town"];
    if !(_id in _damaged) then {
        private _data = [_cls,_town] call OT_fnc_getRealEstateData;
        _tl = (_data select 2);
        _lease = _lease + _tl;
    };
}foreach(player getVariable ["leasedata",[]]);

if(_lease > 0) then {
    _tt = 0;
    if(_tax > 0) then {
        _tt = round(_lease * (_tax / 100));
    };
    _lease = _lease - _tt;
};

_t = call OT_fnc_getTaxIncome;
_taxtotal = _t select 0;
_totax = 0;

if(_tax > 0) then {
    _totax = round(_taxtotal * (_tax / 100));
};
_numPlayers = count([] call CBA_fnc_players);
_taxper = round(_taxtotal / _numPlayers);
_totaxper = round(_totax / _numPlayers);

private _perhr = ([OT_nation,"WAGE",0] call OT_fnc_getPrice)*6;
private _wages = 0;
private _income = 0;
{
    if(_x != "Factory") then {
        _employees = server getVariable [format["%1employ",_x],0];
        _wages = _wages + (_employees * _perhr);
        _data = _x call OT_fnc_getBusinessData;
        if(count _data isEqualTo 2) then { // not correct anymore
            _income = _income + ((_employees * 200) * 6);
        };
    };
}foreach(server getVariable ["GEURowned",[]]);

_balance = _totax - _wages;
_text = "<br/><t align='center' size='1.1'>Balance Sheet (per 6 hrs)</t><br/><br/>";

if(isMultiplayer) then {
	if((getplayeruid player) in (server getVariable ["generals",[]])) then {
		_text = _text + format["<t align='left' size='1.05'>Resistance Funds: $%1</t><br/>",[server getVariable ["money",0], 1, 0, true] call CBA_fnc_formatNumber];
	};
};

_text = _text + format["<t size='1.05'>Lease Income: $%1</t><br/>",[_lease, 1, 0, true] call CBA_fnc_formatNumber];

if(isMultiplayer) then {
    _text = _text + format["<t size='1.05'>Civilian Income: $%1 ($%2 per player)</t><br/>",[_taxtotal-_totax, 1, 0, true] call CBA_fnc_formatNumber,[_taxper-_totaxper, 1, 0, true] call CBA_fnc_formatNumber];
    if((getplayeruid player) in (server getVariable ["generals",[]])) then {
        _text = _text + format["<t size='1.05'>Resistance Tax (%1%2): $%3 ($%4 per player)</t><br/>",_tax,"%",[_totax, 1, 0, true] call CBA_fnc_formatNumber,[_totaxper, 1, 0, true] call CBA_fnc_formatNumber];
    };
}else{
    _text = _text + format["<t size='1.05'>Tax Income: $%1</t><br/>",[_taxtotal, 1, 0, true] call CBA_fnc_formatNumber];
};
_text = _text + format["<t size='1.05'>Business Income: $%1 (6 hrs)</t><br/>",[_income, 1, 0, true] call CBA_fnc_formatNumber];

private _minus = "";
if(_wages > 0) then {_minus = "-"};
_text = _text + format["<t size='1.05'>Wages: $%1%2 (6 hrs)</t><br/><br/>",_minus,[_wages, 1, 0, true] call CBA_fnc_formatNumber];
if(isMultiplayer) then {
    _text = _text + format["<t size='1.2'>Balance (Resistance): $%1</t><br/>",[_balance+_income, 1, 0, true] call CBA_fnc_formatNumber];
    _text = _text + format["<t size='1.2'>Balance (You): $%1</t><br/>",[_lease + (_taxper-_totaxper), 1, 0, true] call CBA_fnc_formatNumber];
}else{
    _text = _text + format["<t size='1.2'>Balance: $%1</t><br/>",[_lease + (_taxper-_totaxper) + _balance + _income, 1, 0, true] call CBA_fnc_formatNumber];
};

disableSerialization;
_textctrl = (findDisplay 8000) displayCtrl 1106;
_textctrl ctrlSetStructuredText parseText _text;
