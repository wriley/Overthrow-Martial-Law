params ["_building"];
private _allHitPoints = getAllHitPointsDamage _building;
private _totalDamage = 0;
private _partsArray = [];
if (count _allHitPoints isEqualTo 3) exitWith {
	_partsArray = _allHitPoints select 2;
	{_totalDamage = _totalDamage + _x;}foreach _partsArray;
	(100 * (_totalDamage / (count _partsArray)))
};
if ("ruin" in toLower(typeof _building)) exitWith { 100 };
(100 * (damage _building))