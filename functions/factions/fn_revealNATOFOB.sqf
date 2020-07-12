params ["_id"];

_revealed = server getVariable ["revealedFOBs",[]];
_revealed pushback _id;
_pos = server getVariable ["NATOfobs",[]] select _id _select 0;
//FOB Marker
_mrkid = createMarker [format["natofob%1",_id],_pos];
_mrkid setMarkerShape "ICON";
_mrkid setMarkerType "mil_Flag";
_mrkid setMarkerColor "ColorBLUFOR";
_mrkid setMarkerAlpha 1;
//Warning Marker
_mrkid = createMarker [format["natofob%1area",_id],_pos];
_mrkid setMarkerShape "ELLIPSE";
_mrkid setMarkerSize [50,50]];
_mrkid setMarkerColor "ColorRed";
_mrkid setMarkerAlpha 1;
_mrkid setMarkerBrush "BDIAGONAL";

server setVariable ["revealedFOBs",_revealed,false];