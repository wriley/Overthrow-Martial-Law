if (OT_taking) exitWith {};
OT_taking = true;

private _idx = lbCurSel 1500;
private _cls = lbData [1500,_idx];
params ["_qtyout","_pos"];

private _veh = (vehicle player);
private	_iswarehouse = false;
private _id = 0;
if(_veh isEqualTo player) then {
	_b = OT_warehouseTarget call OT_fnc_nearestRealEstate;
	if(typename _b isEqualTo "ARRAY") then {
		_building = _b select 0;
		if((typeof _building) == OT_warehouse && _building call OT_fnc_hasOwner) then {
			_iswarehouse = true;
			_veh = OT_warehouseTarget;
			_id = (_pos call OT_fnc_nearestWarehouse) select 1;
		};
	};
};
if(_veh isEqualTo player) exitWith {
	"No warehouse within range" call OT_fnc_notifyMinor;
};

private _warehouse = warehouse getVariable [format["warehouse-%1_%2",_id,_cls],[_cls,0]];
_warehouse params ["_wCls", ["_in",0,[0]]];

if(_qtyout > _in || _qtyout isEqualTo -1) then {
	_qtyout = _in;
};

for [{private _i=0;},{_i<_qtyout;},{_i=_i+1;}] do {
	if!(_veh canAdd _cls) exitWith {hint "This vehicle is full, use a truck for more storage"; closeDialog 0; _qtyout = _count};
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

private _newnum = _in - _qtyout;
if(_newnum > 0) then {
	warehouse setVariable [format["warehouse-%1_%2",_id,_cls],[_cls,_newnum],true];
}else{
	warehouse setVariable [format["warehouse-%1_%2",_id,_cls],nil,true];
};

[_id] call OT_fnc_refreshWarehouse;

OT_taking = false;
