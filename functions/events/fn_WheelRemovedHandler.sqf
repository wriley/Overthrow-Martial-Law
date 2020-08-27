params ["_vehicle", "_hitPointIndex", "_hitPointDamage", ["_useEffects", true]];
//"wheelRemovedHandler: params: [B Alpha 3-1:2,""hitrf2wheel"",1]"
diag_log format ["wheelRemovedHandler: params: %1", _this];
private _side = side _vehicle;
if ((_side isEqualTo west) && (({alive _x} count crew _vehicle) > 0)) then {
	private _culprit = ([(allPlayers - entities "HeadlessClient_F"),[],{_x distance _vehicle},"ASCEND"] call BIS_fnc_sortBy) select 0; 
	private _culpritID = owner _culprit;
	"NATO caught you tampering with their vehicle!" remoteExec ["OT_fnc_notifyMinor", _culpritID, false];
	_culprit setCaptive false;
	[_culprit,200,4] call OT_fnc_revealToNATO;

	params ["_vehicle","_hitPointIndex","_culprit"];
	private _crew = crew _vehicle;
	private _repairer = objNull;
	private _attackers = [];
	{
		if (_forEachIndex isEqualTo 0) then {
			_repairer = _x;
			//repairer
		};
		if (_forEachIndex > 0) then {
			_attackers pushback _x;
		};
	}foreach _crew;

	[_repairer,_vehicle,_hitPointIndex] spawn {
		params ["_repairer","_vehicle","_hitPointIndex"];
		_repairer setVariable ["NOAI",true,true];
		_repairer setBehaviour "CARELESS";
		unAssignVehicle _repairer;
		doGetOut _repairer;
		private _part = (getpos _repairer) nearEntities [["ACE_Wheel","ACE_Track"], 20] select 0;
		diag_log format ["wheelRemoved: part:%1", _part];
		if !(_part isEqualTo objNull) then {
			_err = [_repairer, _part, 3] call OT_fnc_orderMove;
			if (_err isEqualTo "Dead") exitWith {};
			_repairer setPos getpos _part;
			_repairer setDir ([_repairer, _vehicle] call BIS_fnc_dirTo);
			_repairer playMoveNow "acts_carfixingwheel";
			sleep 10;
			if (!alive _repairer) exitWith {};
			_repairer playMoveNow "";
			_vehicle setDamage 0;
			deleteVehicle _part;
			_repairer assignAsDriver _vehicle;
			[_repairer] orderGetIn true;
			_vehicle setVariable ["OT_wheelRemovedFixed", true];
		};
		_repairer setVariable ["NOAI",false,true];
		_repairer setBehaviour "COMBAT";
	};

	{
		[_x, _vehicle] spawn {
			private _role = "";
			private _roleindex = -1;
			params ["_unit","_vehicle"];

			if (count assignedVehicleRole _unit > 0) then {
				_role = assignedVehicleRole _unit select 0;
				if (_role == "cargo") then {
					_roleindex = _vehicle getCargoIndex _unit;
				};
				if ((_role == "turret")) then {
					_roleindex = assignedVehicleRole _unit select 1;
				};
				unAssignVehicle _unit;
				_unit action ["Eject", _vehicle];
			};
			private _timeout = time + 20;
			waitUntil {sleep 1;(_vehicle getVariable ["OT_wheelRemovedFixed", false]) || (!alive _vehicle) || (_timeout < time)};
			_vehicle setVariable ["OT_wheelRemovedFixed", nil];

			if (!(_role isEqualTo "") && (!isNull _vehicle && alive _unit) && canMove _vehicle) then {
				_err = [_unit, _vehicle, 8] call OT_fnc_orderMove;
				if (_err isEqualTo "Dead") exitWith {};
				if (_role == "cargo") then {
					_unit assignAsCargo _vehicle;
				};
				if (_role == "gunner") then {
					_unit assignAsGunner _vehicle;
				};
				if (_role == "turret") then {
					_unit assignAsTurret [_vehicle, _roleindex];
				};
			};
			[_unit] orderGetIn true;
		};
	} foreach _attackers;
};