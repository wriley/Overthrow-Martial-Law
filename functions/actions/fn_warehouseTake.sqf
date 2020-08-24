if (OT_taking) exitWith {};
OT_taking = true;

private _idx = lbCurSel 1500;
private _cls = lbData [1500,_idx];
params ["_qtyout"];
player globalchat format ["taking %1 out", _qtyout];
private _veh = (vehicle player);
private _id = "";

if(_veh isEqualTo player) then {
	if (_veh call OT_fnc_positionIsAtWarehouse) then {
		_veh = OT_warehouseTarget;
	};
};
if(_veh isEqualTo player) exitWith {
	"No warehouse within range" call OT_fnc_notifyMinor;
};

private _warehouse = warehouse getVariable [format["warehouse-%1_%2",OT_currentWarehouse,_cls],[_cls,0]];
_warehouse params ["", ["_currentqty",0,[0]]];
player globalchat format ["_warehouse: %1  id:%2  cls:%3", _warehouse, OT_currentWarehouse, _cls];

if(_qtyout > _currentqty || _qtyout isEqualTo -1) then {
	_qtyout = _currentqty;
};
for [{private _i=0;},{_i<_qtyout;},{_i=_i+1;}] do {
	if!(_veh canAdd _cls) exitWith {hint "This vehicle is full, use a truck for more storage"; closeDialog 0; _qtyout = _i};
	[_cls, _veh] call {
		params ["_cls", "_veh"];
		if(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
			_veh addWeaponCargoGlobal [_cls,1];
		};
		if(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
			_veh addWeaponCargoGlobal [_cls,1];
		};
		if(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
			_veh addWeaponCargoGlobal [_cls,1];
		};
		if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
			_veh addMagazineCargoGlobal [_cls,1];
		};
		if(_cls isKindOf "Bag_Base") exitWith {
			_cls = _cls call BIS_fnc_basicBackpack;
			_veh addBackpackCargoGlobal [_cls,1];
		};
		_veh addItemCargoGlobal [_cls,1];
	};
};
player globalchat format ["setting vars to warehouse %1", OT_currentWarehouse];
private _newqty = _currentqty - _qtyout;
if(_newqty > 0) then {
	warehouse setVariable [format["warehouse-%1_%2",OT_currentWarehouse,_cls],[_cls,_newqty],true];
}else{
	warehouse setVariable [format["warehouse-%1_%2",OT_currentWarehouse,_cls],nil,true];
};
publicVariable "warehouse";
[] remoteExec ["OT_fnc_refreshWarehouse", 0, false];
OT_taking = false;
