params ["_frompos","_attackpos","_strength","_delay","_style"];
sleep _delay;

if (_style == 1) then {
	[_attackpos,"Smoke_120mm_AMOS_White", 250, 10, 15] spawn BIS_fnc_fireSupportVirtual;
}else{
	if (_style == 2) then {
		[_attackpos,"Smoke_120mm_AMOS_White", 250, 16, 25] spawn BIS_fnc_fireSupportVirtual;
		sleep 60;
		[_attackpos,"AT_Mine_155mm_AMOS_range", 250, 6, 20] spawn BIS_fnc_fireSupportVirtual;
	};
};