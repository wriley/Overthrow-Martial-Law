params ["_pos"];

private _mrkid = format["%1-whouse",_pos];
createMarker [_mrkid,_pos];
_mrkid setMarkerShape "ICON";
_mrkid setMarkerType "ot_Warehouse";
_mrkid setMarkerColor "ColorWhite";
_mrkid setMarkerAlpha 1;
OT_allWarehouses pushbackUnique _pos;
publicVariable "OT_allWarehouses";