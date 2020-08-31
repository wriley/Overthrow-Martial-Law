params ["_unit","_wid",["_linkedItems",false]];

if(binocular _unit != "") then {
	[_wid, binocular _unit, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	_unit removeWeapon binocular _unit;
};

if(hmd _unit != "") then {
	[_wid, hmd _unit,1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	_unit unlinkItem hmd _unit;
};

{
	_count = 0;
	_cls = _x select 0;
	while {_count < (_x select 1)} do {
		[_cls] call {
			params ["_cls"];
			if(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
				_unit removeWeapon _cls;
			};
			if(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
				_unit removeWeapon _cls;
			};
			if(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
				_unit removeWeapon _cls;
			};
			if(_cls isKindOf ["Binocular",configFile >> "CfgWeapons"]) exitWith {
				_unit removeItem _cls;
			};
			if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
				_unit removeMagazine _cls;
			};
			_unit removeItem _cls;
		};
		[_wid, _cls, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
		_count = _count + 1;
	};
}foreach(_unit call OT_fnc_unitStock);

if(headgear _unit != "") then {
	[_wid, headgear _unit, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	removeHeadgear _unit;
};

if(backpack _unit != "") then {
	[_wid, backpack _unit, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	removeBackpack _unit;
};

if(vest _unit != "") then {
	[_wid,vest _unit, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	removeVest _unit;
};

if(goggles _unit != "") then {
	[_wid, goggles _unit, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	removeGoggles _unit;
};

if(primaryWeapon _unit != "") then {
	{
		[_wid, _x, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	}foreach(primaryWeaponItems _unit);
	removeAllPrimaryWeaponItems _unit;
	[_wid, (primaryWeapon _unit) call BIS_fnc_baseWeapon,1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	_unit removeWeapon primaryWeapon _unit;
};

if(secondaryWeapon _unit != "") then {
	[_wid, secondaryWeapon _unit,1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	_unit removeWeapon secondaryWeapon _unit;
};


if(handgunWeapon _unit != "") then {
	{
		[_wid, _x, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	}foreach(handgunItems _unit);
	removeAllHandgunItems _unit;
	[_wid, handgunWeapon _unit, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
	_unit removeWeapon handgunWeapon _unit;
};

if(_linkedItems) then {
	{
		if !(_x isEqualTo "ItemMap") then {
			if (([(configFile >> "CfgWeapons" >> _x),"useAsBinocular",0] call BIS_fnc_returnConfigEntry) > 0) then {
				_unit unassignItem _x;
				_unit removeWeapon _x;
			}else{
				_unit unlinkItem _x;
			};
			[_wid, _x, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
		};
	}foreach(assignedItems _unit);
};
true
