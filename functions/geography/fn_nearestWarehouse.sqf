private _pos = _this;
private _nearest = [];
private _result = ([OT_allWarehouses,[],{(_x select 0) distance _pos},"ASCEND"] call BIS_fnc_SortBy);
if (count _result > 0) then {
	_nearest = _result select 0;
	private _wpos = _nearest select 0;
	private _building = _nearest select 1;
	private _dist = _pos distance _wpos;

	[_wpos,_building,_dist]
} else {
	[]
};