private _pos = _this;
private _search = OT_allWarehouses + OT_economicData + OT_objectiveData + OT_townData + OT_commsData + OT_airportData;
private _closests = ([_search,[],{(_x select 0) distance _pos},"ASCEND"] call BIS_fnc_SortBy);
private _closest = _closests select 0;
private _closester = _closests select 1;
private _type = "";
if ((_closest in OT_townData) && (_closester in OT_allWarehouses)) then {
	_type = "Warehouse";
	_closest = _closester;
} else {
	_type = _closest call {
		if(_this in OT_allWarehouses) exitWith {"Warehouse"};
		if(_this in OT_economicData) exitWith {"Business"};
		if(_this in OT_townData) exitWith {"Town"};
		if(_this in OT_commsData) exitWith {"Radio Tower"};
		if(_this in OT_airportData) exitWith {"Airport"};
		"Objective"
	};
};
[_closest select 1,_type,_closest]