params ["_pos","_method"];

private _id = str _pos;
private _town = _pos call OT_fnc_nearestTown;	

switch (_method) do {
    case "PLAYER": { format["The resistance has discovered a NATO FOB near %1",_town] remoteExec ["OT_fnc_notifyMinor",0,false]; };
    case "TOWN": { format["Citizens of %1 have revealed intelligence of a nearby NATO FOB",_town] remoteExec ["OT_fnc_notifyMinor",0,false]; };
    case "INIT": {};
    default { format["A FOB has been revealed in %1",_town] remoteExec ["OT_fnc_notifyMinor",0,false]; };
};

//FOB Marker
_mrkid = createMarker [format["natofob%1",_id],_pos];
_mrkid setMarkerShape "ICON";
_mrkid setMarkerType "mil_Flag";
_mrkid setMarkerColor "ColorBLUFOR";
_mrkid setMarkerAlpha 1;
//Warning Marker
_mrkid = createMarker [format["natofobWarning%1",_id],_pos];
_mrkid setMarkerShape "ELLIPSE";
_mrkid setMarkerBrush "BDIAGONAL";
_mrkid setMarkerColor "ColorRed";
_mrkid setMarkerAlpha 1;
_mrkid setMarkerSize [50, 50];

if(_method != "INIT") then {
	_revealed = server getVariable ["revealedFOBs",[]];

	_revealed pushback _id;

	server setVariable ["revealedFOBs",_revealed,false];
}


