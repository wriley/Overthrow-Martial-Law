if (isNil "OT_item_Map") then {
	OT_item_Map = "Mapboard_tanoa_F";
};
if (isNil "OT_item_Storage") then {
	OT_item_Storage = "B_CargoNet_01_ammo_F";
};
if (isNil "OT_item_Desk") then {
	OT_item_Desk = "OfficeTable_01_new_F";
};
if (isNil "OT_item_Radio") then {
	OT_item_Radio = "Land_PortableLongRangeRadio_F";
};
if (isNil "OT_item_Tent") then {
	OT_item_Tent = "eo_dome_tent_grn";
};
if (isNil "OT_item_Safe") then {
	OT_item_Safe = "Land_MetalCase_01_small_F";
};
if (isNil "OT_item_Workbench") then {
	OT_item_Workbench = "Land_Workbench_01_F";
};



if(typeof _this isEqualTo OT_item_Map) then {
	_this addAction ["Town Info", OT_fnc_mapInfoDialog,nil,0,false,true,"",""];
	_this addAction ["Reset UI", {
		closedialog 0;
		[] spawn OT_fnc_setupPlayer;
	},nil,0,false,true,"",""];

};
if(typeof _this isEqualTo OT_item_Storage) then {
	_this addAction ["Open Arsenal (This Ammobox)", {
		[_this select 0,player] call OT_fnc_openArsenal
	},nil,0,false,true,"","(!(_target call OT_fnc_positionIsAtWarehouse) && _target distance player < 5)"];

	_this addAction ["Open Arsenal (Warehouse)", {
		["WAREHOUSE",player,_this select 0] call OT_fnc_openArsenal
	},nil,0,false,true,"","(_target call OT_fnc_positionIsAtWarehouse && _target distance player < 5)"];

	_this addAction ["Take From Warehouse", {
		OT_warehouseTarget = _this select 0;
		private _id = ((getpos player) call OT_fnc_nearestWarehouse) select 1;
		[_id] call OT_fnc_warehouseDialog;
	},nil,0,false,true,"","(_target call OT_fnc_positionIsAtWarehouse && _target distance player < 5)"];

	_this addAction ["Store In Warehouse", {
		OT_warehouseTarget = _this select 0;
		call OT_fnc_storeAll;
	},nil,0,false,true,"","(_target call OT_fnc_positionIsAtWarehouse && _target distance player < 5)"];

	_this addAction ["Dump Everything", {
		[player,_this select 0] call OT_fnc_dumpStuff
	},nil,0,false,true,"","(_target distance player < 5)"];

	_this addAction ["Dump Everything into Warehouse", {
		OT_warehouseTarget = _this select 0;
		_warehouse = (getpos OT_warehouseTarget) call OT_fnc_nearestWarehouse;
		_warehouse params ["","_id"];
		[_id, player] call OT_fnc_dumpIntoWarehouse;
	},nil,0,false,true,"","(_target call OT_fnc_positionIsAtWarehouse && _target distance player < 5)"];

	if(_this call OT_fnc_playerIsOwner) then {
		_this addAction ["Lock", {
			(_this select 0) setVariable ["OT_locked",true,true];
			"Ammobox locked" call OT_fnc_notifyMinor;
		},nil,0,false,true,"","(!(_target getVariable ['OT_locked',false]) && (_target distance player < 5))"];

		_this addAction ["Unlock", {
			(_this select 0) setVariable ["OT_locked",false,true];
			"Ammobox unlocked" call OT_fnc_notifyMinor;
		},nil,0,false,true,"","((_target getVariable ['OT_locked',false]) && (_target distance player < 5))"];
	};

	/**** Backwards compatibility for when warehouses had magical links ****/
	private _itemVars = (allVariables warehouse) select {((toLower _x select [0,5]) isEqualTo "item_")};
	private _b = (getpos _this) call OT_fnc_nearestRealEstate;
	if(_b isEqualType []) then {
		private _building = _b select 0;
		private _bpos = getpos _building;
		if ((((getpos _this) distance _bpos) < 15 && (typeof _building) == OT_warehouse && (_building call OT_fnc_hasOwner) && (damage _building) < 1) && ((count _itemVars > 0) || !(_bpos in OT_allWarehouses))) then {
			_this addAction ["Fix warehouse/Recover your gear here.", {
				private _b = player call OT_fnc_nearestRealEstate;
				if(_b isEqualType []) then {
					private _building = _b select 0;
					_bpos = getpos _building;
					if !(_bpos in OT_allWarehouses) then { [_bpos] call OT_fnc_initWarehouse; };
					private _itemVars = (allVariables warehouse) select {((toLower _x select [0,5]) isEqualTo "item_")};
					if !(count _itemVars isEqualTo 0) then { [_bpos] call OT_fnc_recoverWarehouseGear; };
					(_this select 0) setVariable ["OT_legacyWarehouseFixed",true,true];
				};
			},nil,0,false,true,"","(!(_target getVariable ['OT_legacyWarehouseFixed',false]) && (_target distance player < 5) && (_target call OT_fnc_positionIsAtWarehouse))"];
		};
	};
};
if(typeof _this isEqualTo OT_item_Safe) then {
	_this addAction ["Put Money", OT_fnc_safePutMoney,nil,0,false,true,"",""];
	_this addAction ["Take Money", OT_fnc_safeTakeMoney,nil,0,false,true,"",""];
	_this addAction ["Set Password", OT_fnc_safeSetPassword,nil,0,false,true,"","(_target getVariable ['owner','']) isEqualTo getplayeruid _this"];
};

if (typeof _this isEqualTo OT_businessStorage) then {
	_this addAction ["Put Money", OT_fnc_safePutMoney,nil,0,false,true,"",""];
	_this addAction ["Take Money", OT_fnc_safeTakeMoney,nil,0,false,true,"",""];
};

if(typeof _this isEqualTo "Land_Cargo_House_V4_F") then {
	[_this] call ace_repair_fnc_moduleAssignRepairFacility;
};

if(_this isKindOf "Man" || _this isKindOf "FlagCarrier") exitWith {};

[_this, 0, ["ACE_MainActions"], OT_ACEremoveAction] call ace_interact_menu_fnc_addActionToObject;
[_this, 0, ["ACE_MainActions","OT_Remove"], OT_ACEremoveActionConfirm] call ace_interact_menu_fnc_addActionToObject;

if(_this isKindOf "Building" || _this isKindOf "LandVehicle") exitWith{};

_dir = 0;
if(typeof _this isEqualTo "C_Rubberboat") then {
	_dir = 90;
};
[_this, true, [0, 2, 0.4],_dir] call ace_dragging_fnc_setCarryable;
