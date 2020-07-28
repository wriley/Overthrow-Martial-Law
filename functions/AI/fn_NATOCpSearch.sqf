params ["_target","_leader"];
private _units = [];
private _items = [];
private ["_items","_foundWeapons","_foundDrugs","_drugsHidden","_foundStatic","_foundStolen"];

_foundWeapons = false;
_foundDrugs = false;
_foundStolen = false;
_foundStatic = false;
//Get all units with invs
if(_target isKindOf "LandVehicle") then {
	_units = [_target] + crew _target;
	{
	  if(typeName _x == "OBJECT") then {
	  	_className = typeOf _x;
		_tb = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxbackpacks");
		_tm = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxmagazines");
		_tw = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxweapons");
		_return = if (_tb > 0  || _tm > 0 || _tw > 0) then {true;} else {false;};
	  	if(_return) then {
	  		_units pushBack _x;
	  	};
	  	if(count weapons _x != 0) then {
	  		_foundStatic = true;
	  		"NATO found a static weapon loaded in your vehicle" remoteExecCall ["hint",crew _target,false];
	  	};
	  };
	} forEach (_target getVariable ["ace_cargo_loaded", []]);
	if(_target getVariable ["stolen", false]) then {
		_foundStolen = true;
		"This is a stolen vehicle" remoteExecCall ["hint",crew _target,false];
	};
} else {
	_units = [_target];
};

if(isPlayer _target) then {
	[_leader, {_this globalchat "You are being searched, stay still!"}] remoteExec ["call",crew _target, false];
};
//Check all units items
if !(_foundWeapons || _foundStolen || _foundStatic) then { //If there is no static weapon in ace cargo
{
	_unit = _x;
	

	//Calculate chance per player unit
	if(isPlayer _unit || _unit isKindOf "LandVehicle") then {
		private _stealth = _target getVariable ["OT_stealth",1];
		_chance = 100;
		if(_stealth > 1) then {
			_chance = 100 - (_stealth * 20);
		};
		if((random 100) < _chance) then {_drugsHidden = false} else {_drugsHidden = true};
	} else {_drugsHidden = false};

	//Get items
	if !(_unit isKindOf "Man") then {		
		_items = (itemCargo _unit) + (weaponCargo _unit) + (magazineCargo _unit) + (backpackCargo _unit);
	} else {
		_items = (items _unit) + (magazines _unit);
	};	
	//Check items
	{
		
		//If weapon found then stop and make wanted
		if(_x in (OT_allWeapons + OT_allMagazines + OT_illegalHeadgear + OT_illegalVests + OT_allStaticBackpacks + OT_allOptics)) exitWith {
				_foundWeapons = true;
		};
		//If illegal items found
		if(_x in OT_illegalItems && ! _drugsHidden) then {			
			_foundDrugs = true;
			if(_unit isKindOf "LandVehicle") then {
				[_unit,_x,1] call CBA_fnc_removeItemCargo;
			} else {
				_unit removeItem _x
			};
		};
	}forEach(_items);
}forEach(_units);
};
if(_foundWeapons || _foundStolen || _foundStatic) then {
	//Set wanted
	if(isPlayer _target) then {
		if(_foundWeapons) then {
			"NATO found military gear" remoteExecCall ["hint",_target,false];
		};
		[_leader, {_this globalchat "OPEN FIRE!"}] remoteExec ["call",crew _target, false];
	};
	if(_target isKindOf "LandVehicle") then {
		{
		  _x setCaptive false;
		  _x call OT_fnc_revealToNATO;
		} forEach crew _target;
	} else {
		_target setCaptive false;
		_target call OT_fnc_revealToNATO;
	};
} else {
	if (isPlayer _target) then {
		if (_foundDrugs) then {
			[_leader, {_this globalchat "We have taken these illegal items"}] remoteExec ["call",crew _target, false];		
		} else {
			[_leader, {_this globalchat (["We found nothing this time.", "You are clean.", "No illegal items"] call BIS_fnc_selectRandom);}] remoteExec ["call",crew _target, false];
		};
	  	[_leader, {_this globalchat (["You are free to go", "Get on your way", "Now get out of my sight", "That's all. Leave the area"] call BIS_fnc_selectRandom);}] remoteExec ["call",crew _target, false];
	};
};

//Return
if (_foundWeapons) exitWith {
	false;
};
true;
