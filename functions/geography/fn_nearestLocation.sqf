private _pos = _this;
private _search = OT_economicData + OT_objectiveData + OT_townData + OT_commsData + OT_airportData + (server getVariable ["bases",[]]);
private _results = ([_search,[],{(_x select 0) distance _pos},"ASCEND"] call BIS_fnc_SortBy);
private _nearest = _results select 0;
private _near = _results select 1;
private _type = "";
_type = _nearest call {
	if(_this in OT_economicData) exitWith {"Business"};
	if(_this in OT_townData) exitWith {"Town"};
	if(_this in OT_commsData) exitWith {"Radio Tower"};
	if(_this in OT_airportData) exitWith {"Airport"};
	if(_this in (server getVariable ["bases",[]])) exitWith {"FOB"};
	"Objective"
};
[_nearest select 1,_type,_nearest]