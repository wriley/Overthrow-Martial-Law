params ["_pos","_shop"];

private _mrkid = format["%1-whouse",_pos];
createMarker [_mrkid,_pos];
_mrkid setMarkerShape "ICON";
_mrkid setMarkerType "ot_Warehouse";
_mrkid setMarkerColor "ColorWhite";
_mrkid setMarkerAlpha 1;
OT_allWarehouses pushback _pos;
publicVariable "OT_allWarehouses";