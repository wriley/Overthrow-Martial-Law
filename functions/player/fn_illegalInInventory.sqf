_target = _this; 
_foundillegal = false;
if(isplayer _target) then { 
	{ 
		_cls = _x select 0; 
		if ((_cls in OT_allWeapons + OT_allMagazines + OT_illegalHeadgear + OT_illegalVests + OT_allStaticBackpacks + OT_allOptics) && {!(_cls in OT_legal)}) then {
			_foundillegal = true; 
		}; 
		if(_cls in OT_illegalItems) then { 
			_count = _x select 1; 
			for "_i" from 1 to _count do { 
				_target removeItem _cls; 
				_cop addItem _cls; 
			}; 
			_foundillegal = true; 
			}; 
	}foreach(_target call OT_fnc_getSearchStock);
};
_foundillegal