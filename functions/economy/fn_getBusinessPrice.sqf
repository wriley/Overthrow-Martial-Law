private _name = _this;
private _data = _name call OT_fnc_getBusinessData;
diag_log str _data;
_data params ["","","_production","_xp","_level"];
private _baseprice = 100000;
if (count _production > 0) then {
	_baseprice = 100000 * 1 + ((count _production) / 10);
	{
		if (_x select 0 == "OT_Steel") then { _baseprice = _baseprice * 1.5; };
	}foreach _production;
};

private _stability = 1.0 - ((server getVariable [format["stability%1",OT_nation],100]) / 100);
_baseprice + (_baseprice * _stability) + (_baseprice * (_level*_level/20))
