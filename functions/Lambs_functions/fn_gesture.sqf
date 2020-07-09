// Do Gesture
// version 1.42
// by nkenny

// init
params ["_unit",["_gesture",["gestureFreeze"]]];

// check player
if (isPlayer _unit) exitWith {false};

// do it
_unit playActionNow selectRandom _gesture;

// end
true