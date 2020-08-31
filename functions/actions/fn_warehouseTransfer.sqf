diag_log str _this;
if (!isServer) exitWith {};
waitUntil {!OT_whTransferring;};
OT_whTransferring = true;
params ["_wid","_cls","_dest","_qtyout"];
/*private _veh = (vehicle _dest);

if (_veh isEqualTo _dest) then {
	if (getpos _veh call OT_fnc_positionIsAtWarehouse) then {
		_veh = warehouses getVariable ["OT_warehouseTarget", objNull];
	};
};
*/
private _take = warehouses getVariable [format["warehouse-%1_%2",_wid,_cls],[_cls,0]];
_take params ["", ["_currentqty",0,[0]]];

if(_qtyout > _currentqty || _qtyout isEqualTo -1) then {
	_qtyout = _currentqty;
};
for [{private _i=0;},{_i<_qtyout;},{_i=_i+1;}] do {
	if!(_dest canAdd _cls) exitWith {
		"This vehicle is full, use a truck for more storage" remoteExec ["hint", (warehouses getVariable ["clientOwnerTaking", 2]), false];
		warehouses setVariable ["clientOwnerTaking", nil, true];
		_qtyout = _i
	};
	[_cls, _dest] call {
		params ["_cls", "_dest"];
		if(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
			_dest addWeaponCargoGlobal [_cls,1];
		};
		if(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
			_dest addWeaponCargoGlobal [_cls,1];
		};
		if(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
			_dest addWeaponCargoGlobal [_cls,1];
		};
		if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
			_dest addMagazineCargoGlobal [_cls,1];
		};
		if(_cls isKindOf "Bag_Base") exitWith {
			_cls = _cls call BIS_fnc_basicBackpack;
			_dest addBackpackCargoGlobal [_cls,1];
		};
		_dest addItemCargoGlobal [_cls,1];
	};
};
private _newqty = _currentqty - _qtyout;
if(_newqty > 0) then {
	warehouses setVariable [format["warehouse-%1_%2",_wid,_cls],[_cls,_newqty],true];
}else{
	warehouses setVariable [format["warehouse-%1_%2",_wid,_cls],nil,true];
};
[] remoteExec ["OT_fnc_refreshWarehouse", 0, false];
OT_whTransferring = false;
