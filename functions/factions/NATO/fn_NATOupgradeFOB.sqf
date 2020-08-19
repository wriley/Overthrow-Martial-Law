params ["_pos","_upgrades"];

{
    if(_x isEqualTo "Barriers") then {
        private _p = [_pos,8,0] call BIS_fnc_relPos;
        private _veh = OT_NATO_Barrier_Small createVehicle [(_p select 0)+0.5, _p select 1, 0];
        _veh setDir 180;
        _veh setVectorUp surfaceNormal position _veh;


        private _p = [_pos,8,180] call BIS_fnc_relPos;
        private _veh = OT_NATO_Barrier_Small createVehicle [(_p select 0)+0.5, _p select 1, 0];
        _veh setDir 0;
        _veh setVectorUp surfaceNormal position _veh;


        private _p = [_pos,7,270] call BIS_fnc_relPos;
        private _veh = OT_NATO_Barrier_Large createVehicle [_p select 0, (_p select 1)+1.5, 0];
        _veh setDir 270;
        _veh setVectorUp surfaceNormal position _veh;


        private _p = [_pos,7,90] call BIS_fnc_relPos;
        private _veh = OT_NATO_Barrier_Large createVehicle [_p select 0, (_p select 1)+2, 0];
        _veh setDir 90;
        _veh setVectorUp surfaceNormal position _veh;
    };
    if(_x isEqualTo "HMG") then {
        private _gun = OT_NATO_StaticGarrison_LevelOne select 0;
        private _p = [_pos,10,45] call BIS_fnc_relPos;
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock enableSimulation false;
		_lock hideObjectGlobal true;
		_lock setPosATL [getPosATL _lock select 0, getPosATL _lock select 1, 0];
        _lock setDir 45;
        _lock setVectorUp surfaceNormal position _lock;
        private _veh = _gun createVehicle _p;
		_veh attachTo [_lock];
        createVehicleCrew _veh;
		{_x addCuratorEditableObjects [[_veh]];}foreach(allCurators);

        _p = [_pos,10,45] call BIS_fnc_relPos;
        _veh = OT_NATO_Sandbag_Curved createVehicle _p;
        _veh setDir 225;
        _veh setVectorUp surfaceNormal position _veh;
        _veh setPos _p;

        private _p = [_pos,10,135] call BIS_fnc_relPos;
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock enableSimulation false;
		_lock hideObjectGlobal true;
		_lock setPosATL [getPosATL _lock select 0, getPosATL _lock select 1, 0];
        _lock setDir 135;
        _lock setVectorUp surfaceNormal position _lock;
        private _veh = _gun createVehicle _p;
		_veh attachTo [_lock];
        createVehicleCrew _veh;
		{_x addCuratorEditableObjects [[_veh]];}foreach(allCurators);

        _p = [_pos,10,135] call BIS_fnc_relPos;
        _veh = OT_NATO_Sandbag_Curved createVehicle _p;
        _veh setDir 315;
        _veh setVectorUp surfaceNormal position _veh;
        _veh setPos _p;

        private _p = [_pos,10,225] call BIS_fnc_relPos;
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock enableSimulation false;
		_lock hideObjectGlobal true;
		_lock setPosATL [getPosATL _lock select 0, getPosATL _lock select 1, 0];
        _lock setDir 225;
        _lock setVectorUp surfaceNormal position _lock;
        private _veh = _gun createVehicle _p;
        createVehicleCrew _veh;
		{_x addCuratorEditableObjects [[_veh]];}foreach(allCurators);

        _p = [_pos,10,225] call BIS_fnc_relPos;
        _veh = OT_NATO_Sandbag_Curved createVehicle _p;
        _veh setDir 45;
        _veh setVectorUp surfaceNormal position _veh;
        _veh setPos _p;

        private _p = [_pos,10,315] call BIS_fnc_relPos;
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock enableSimulation false;
		_lock hideObjectGlobal true;
		_lock setPosATL [getPosATL _lock select 0, getPosATL _lock select 1, 0];
        _lock setDir 315;
        _lock setVectorUp surfaceNormal position _lock;
        private _veh = _gun createVehicle _p;
		_veh attachTo [_lock];
        createVehicleCrew _veh;
		{_x addCuratorEditableObjects [[_veh]];}foreach(allCurators);

        _p_p = [_pos,10,315] call BIS_fnc_relPos;
        _veh = OT_NATO_Sandbag_Curved createVehicle _p;
        _veh setDir 135;
        _veh setVectorUp surfaceNormal position _veh;
        _veh setPos _p;
    };
    if(_x isEqualTo "Mortar") then {
        private _p = _pos findEmptyPosition [5,50,OT_NATO_Mortar];
		private _lock = "Land_Antibiotic_F" createVehicle _p;
		_lock enableSimulation false;
		_lock hideObjectGlobal true;
		_lock setPosATL [getPosATL _lock select 0, getPosATL _lock select 1, 0];
        _lock setVectorUp surfaceNormal position _lock;
        private _veh = OT_NATO_Mortar createVehicle _p;
		_veh attachTo [_lock];
        createVehicleCrew _veh;
		{_x addCuratorEditableObjects [[_veh]];}foreach(allCurators);

        _g = grpNull;
        {
            _x disableAI "AUTOTARGET";
            _x disableAI "FSM";
            _x disableAI "AUTOCOMBAT";
            _x setVariable ["NOAI",true,false];
            _g = group _x;
        }foreach(crew _veh);
        _g setCombatMode "BLUE";
        [_veh,_g] spawn OT_fnc_NATOMortar;
    };

}foreach(_upgrades);
