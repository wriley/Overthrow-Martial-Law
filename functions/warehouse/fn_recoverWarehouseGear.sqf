_itemVars = (allVariables warehouse) select {((toLower _x select [0,5]) isEqualTo "item_")};
if (count _itemVars isEqualTo 0) exitWith {};
params ["_pos"];
private _id = _pos call OT_fnc_nearestWarehouse select 1;

tempWarehouse = true call CBA_fnc_createNamespace;
publicVariable "tempWarehouse";


{
	_item = warehouse getVariable _x;
	_cls = _item select 0;
	_num = _item select 1;
	tempWarehouse setVariable [ format ["warehouse-%1_%2", _id, _cls], [_cls, _num], true];

}foreach _itemVars;
warehouse = tempWarehouse;
tempWarehouse = nil;
publicVariable "warehouse";
publicVariable "tempWarehouse";
"Your old magical warehouse gear has been recovered to this warehouse." call OT_fnc_notifyMinor;
