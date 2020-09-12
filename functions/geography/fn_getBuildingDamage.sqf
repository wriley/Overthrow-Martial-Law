params ["_building"]; 
private _allHitPoints = getAllHitPointsDamage _building; 
private _totalDamage = 0; 
private _partsArray = []; 
private _res = (100 * (damage _building)); 
if ("ruin" in toLower(typeof _building)) then { 
 _res = 100; 
} else { 
 if (count _allHitPoints isEqualTo 3) then { 
  _partsArray = _allHitPoints select 2; 
  if (count _partsArray > 0) then { 
   {_totalDamage = _totalDamage + _x;}foreach _partsArray; 
   _res = ((100 * (_totalDamage / (count _partsArray))) + (damage _building * 100)) /2; 
  }; 
 }; 
}; 
_res