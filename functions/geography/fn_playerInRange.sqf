if(typename (_this select 0) == "GROUP") exitWith {false};
(
{
	(alive _x || (_x getVariable ["player_uid",false]) isEqualType "") && ((_this select 0) distance _x) < (_this select 1)
} count ((alldeadmen + (call CBA_fnc_players)) + (allUnits select {!(side _x isEqualTo side player)}) + (spawner getVariable ["track",[]])) > 0
)