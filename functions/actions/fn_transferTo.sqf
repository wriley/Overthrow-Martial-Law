private _target = vehicle player;
private _notvehicle = false;
if (_target isEqualTo player) then {
	_target = OT_warehouseTarget;
	_notvehicle = true;
};

if (player call OT_fnc_unitSeenNATO) exitWith {"Cannot transfer while the enemy is seeing you" call OT_fnc_notifyMinor;};
//if (player getvariable ["OT_inrestrictedzone",false]) exitWith {"Cannot transfer in the restricted zone" call OT_fnc_notifyMinor;};

if (isNull _target || isNil "_target") exitWith {};

private _objects = [];
private _b = player call OT_fnc_nearestRealEstate;
private _iswarehouse = false;

if (!_notvehicle) then {
	{
		if (!(_x isEqualTo _target) && {(_x isKindOf "ReammoBox_F" || _x isKindOf "Land" || _x isKindOf "Air" || _x isKindOf "Ship") && !(side _x isEqualTo west) && !({alive _x} count crew _x > 0)}) then {_objects pushback _x};
	} foreach (player nearEntities [["ReammoBox_F","Land","Air","Ship","B_Slingload_01_Cargo_F"],20]);
};

if (!_notvehicle  && _objects isEqualTo []) exitWith {
	"Cannot find any containers or other vehicles within 20m of this vehicle" call OT_fnc_notifyMinor;
};

if (count _objects isEqualTo 1) then {
	[vehicle player, (_objects select 0)] call OT_fnc_transferHelper;
} else {
	private _options = [];
	{
		_options pushback [
			format[
				"%1 (%2m)",
				(typeof _x) call OT_fnc_vehicleGetName,
				round (_x distance player)
			],
			OT_fnc_transferHelper,
			[vehicle player, _x]
		];
	} foreach (_objects);
	"Transfer to which container?" call OT_fnc_notifyBig;
	_options call OT_fnc_playerDecision;
};
