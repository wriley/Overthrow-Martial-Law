private _ob = (position player) call OT_fnc_nearestObjectiveOrCommsOrBaseOrFob;
private _pos = _ob select 0;
private _name = _ob select 1;

private _warehouse = (getpos player) call OT_fnc_nearestWarehouse;
_warehouse params ["_whPos"];
if (_pos distance _whPos > OT_spawnDistance) exitWith { hint format ["Cannot garrison %1, no warehouses found within %2m", _name, OT_spawnDistance]; };

createDialog "OT_dialog_garrison";
disableSerialization;

_textctrl = (findDisplay 9000) displayCtrl 1100;
_textctrl ctrlSetStructuredText parseText format["<t size='1.5' align='center'>%1</t>",_name];

// Leutenant ranks
_btn = (findDisplay 9000) displayCtrl 1600;
_soldier = [((OT_Recruitables select 0) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1601;
_soldier = [((OT_Recruitables select 1) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1602;
_soldier = [((OT_Recruitables select 2) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1603;
_soldier = [((OT_Recruitables select 3) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1604;
_soldier = [((OT_Recruitables select 4) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1605;
_soldier = [((OT_Recruitables select 5) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1606;
_soldier = [((OT_Recruitables select 6) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1607;
_soldier = [((OT_Recruitables select 7) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1608;
_soldier = [((OT_Recruitables select 8) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1609;
_soldier = [((OT_Recruitables select 9) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1610;
_soldier = [((OT_Recruitables select 10) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1611;
_soldier = [((OT_Recruitables select 11) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1612;
_soldier = [((OT_Recruitables select 12) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[_soldier select 0, 1, 0, true] call CBA_fnc_formatNumber];

// Captain ranks (2x _cost)
_btn = (findDisplay 9000) displayCtrl 1613;
_soldier = [((OT_Recruitables select 0) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[(_soldier select 0)*2, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1614;
_soldier = [((OT_Recruitables select 3) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[(_soldier select 0)*2, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1615;
_soldier = [((OT_Recruitables select 4) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[(_soldier select 0)*2, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1616;
_soldier = [((OT_Recruitables select 5) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[(_soldier select 0)*2, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1617;
_soldier = [((OT_Recruitables select 12) select 0), _pos] call OT_fnc_getSoldier;
_btn ctrlSetTooltip format["$%1",[(_soldier select 0)*2, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1618;
_cost = [OT_nation,"I_HMG_01_high_weapon_F",0] call OT_fnc_getPrice;
_cost = _cost + ([OT_nation,"CIV",0] call OT_fnc_getPrice);
_cost = _cost + 300;
_btn ctrlSetTooltip format["$%1",[_cost, 1, 0, true] call CBA_fnc_formatNumber];

_btn = (findDisplay 9000) displayCtrl 1619;
_cost = [OT_nation,"I_GMG_01_high_weapon_F",0] call OT_fnc_getPrice;
_cost = _cost + ([OT_nation,"CIV",0] call OT_fnc_getPrice);
_cost = _cost + 300;
_btn ctrlSetTooltip format["$%1",[_cost, 1, 0, true] call CBA_fnc_formatNumber];
