params ["_pos","_upgrades"];

{
    if(_x isEqualTo "Barriers") then {
        private _p = [_pos,8,0] call BIS_fnc_relPos;
        private _v = OT_NATO_Barrier_Small createVehicle _p;
        _v setDir 180;
        _v setVectorUp surfaceNormal position _v;

        sleep 0.3;

        private _p = [_pos,8,180] call BIS_fnc_relPos;
        private _v = OT_NATO_Barrier_Small createVehicle _p;
        _v setDir 0;
        _v setVectorUp surfaceNormal position _v;

        sleep 0.3;

        private _p = [_pos,7,270] call BIS_fnc_relPos;
        private _v = OT_NATO_Barrier_Large createVehicle _p;
        _v setDir 270;
        _v setVectorUp surfaceNormal position _v;

        sleep 0.3;

        private _p = [_pos,7,90] call BIS_fnc_relPos;
        private _v = OT_NATO_Barrier_Large createVehicle _p;
        _v setDir 90;
        _v setVectorUp surfaceNormal position _v;
    };
    if(_x isEqualTo "HMG") then {
        private _gun = OT_NATO_StaticGarrison_LevelOne select 0;
        private _p = [_pos,10,45] call BIS_fnc_relPos;
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock hideObjectGlobal true;
        _lock setVectorUp surfaceNormal position _lock;
        _lock setDir 45;
        private _v = _gun createVehicle _p;
		_v attachTo [_lock];
        createVehicleCrew _v;

        sleep 0.3;

        _p = [_pos,10,45] call BIS_fnc_relPos;
        _v = OT_NATO_Sandbag_Curved createVehicle _p;
        _v setDir 225;
        _v setVectorUp surfaceNormal position _v;
        _v setPos _p;

        private _p = [_pos,10,135] call BIS_fnc_relPos;
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock hideObjectGlobal true;
        _lock setVectorUp surfaceNormal position _lock;
        _lock setDir 135;
        private _v = _gun createVehicle _p;
		_v attachTo [_lock];
        createVehicleCrew _v;

        sleep 0.3;

        _p = [_pos,10,135] call BIS_fnc_relPos;
        _v = OT_NATO_Sandbag_Curved createVehicle _p;
        _v setDir 315;
        _v setVectorUp surfaceNormal position _v;
        _v setPos _p;

        private _p = [_pos,10,225] call BIS_fnc_relPos;
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock hideObjectGlobal true;
        _lock setVectorUp surfaceNormal position _lock;
        _lock setDir 225;
        private _v = _gun createVehicle _p;
        createVehicleCrew _v;

        sleep 0.3;

        _p = [_pos,10,225] call BIS_fnc_relPos;
        _v = OT_NATO_Sandbag_Curved createVehicle _p;
        _v setDir 45;
        _v setVectorUp surfaceNormal position _v;
        _v setPos _p;

        private _p = [_pos,10,315] call BIS_fnc_relPos;
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock hideObjectGlobal true;
        _lock setVectorUp surfaceNormal position _lock;
        _lock setDir 315;
        private _v = _gun createVehicle _p;
		_v attachTo [_lock];
        createVehicleCrew _v;

        sleep 0.3;

        _p = [_pos,10,315] call BIS_fnc_relPos;
        _v = OT_NATO_Sandbag_Curved createVehicle _p;
        _v setDir 135;
        _v setVectorUp surfaceNormal position _v;
        _v setPos _p;
    };
    if(_x isEqualTo "Mortar") then {
        private _p = _pos findEmptyPosition [5,50,OT_NATO_Mortar];
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock hideObjectGlobal true;
        _lock setVectorUp surfaceNormal position _lock;
        private _v = OT_NATO_Mortar createVehicle _p;
		_v attachTo [_lock];
        createVehicleCrew _v;

        _g = grpNull;
        {
            _x disableAI "AUTOTARGET";
            _x disableAI "FSM";
            _x disableAI "AUTOCOMBAT";
            _x setVariable ["NOAI",true,false];
            _g = group _x;
        }foreach(crew _v);
        _g setCombatMode "BLUE";
        [_v,_g] spawn OT_fnc_NATOMortar;
    };

    sleep 0.3;
}foreach(_upgrades);
