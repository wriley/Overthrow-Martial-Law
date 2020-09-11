if (!isServer) exitWith {};
waitUntil {sleep 1.;(!OT_whTransferring)};
OT_whTransferring = true;
diag_log format ["verifyLoadoutFromWarehouse: params: %1", _this];
params ["_wid","_unit",["_correct",true]];
private _ignore = [];
private _missing = [];
{
    _x params [["_cls",""], ["_count",0]];
    if !(_cls in _ignore) then {
        private _boxAmount = (warehouses getVariable [format["warehouse-%1_%2",_wid,_cls],[_cls,0]]) select 1;
        if(_boxAmount < _count) then {
            //take off the difference
            call {
                if(binocular _unit isEqualTo _cls) exitWith {
                    if(_correct) then {_unit removeWeapon _cls};
                    _count = 0;
                    _missing pushback _cls;
                };
                if(primaryWeapon _unit isEqualTo _cls) exitWith {
                    if(_correct) then {
                        _ignore append primaryWeaponItems _unit;
                        _unit removeWeapon _cls;_unit removeWeapon _cls;
                    };
                    _count = 0;
                    _missing pushback _cls;
                };
                if(secondaryWeapon _unit isEqualTo _cls) exitWith {
                    if(_correct) then {
                        _ignore append secondaryWeaponItems _unit;
                        _unit removeWeapon _cls;
                    };
                    _count = 0;
                    _missing pushback _cls;
                };
                if(handgunWeapon _unit isEqualTo _cls) exitWith {
                    if(_correct) then {_unit removeWeapon _cls};
                    _count = 0;
                    _missing pushback _cls;
                };
                _totake = _count - _boxAmount;
                if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
                    while{_count > _boxAmount} do {
                        _count = _count - 1;
                        if(_correct) then {_unit removeMagazine _cls};
                        _missing pushback _cls;
                    };
                };
                while{_count > _boxAmount} do {
                    _count = _count - 1;
                    if(_correct) then {_unit removeItem _cls};
                    _missing pushback _cls;
                };
            }
        };

        if(_count > 0) then {
            [_wid, _cls, _count] call OT_fnc_removeFromWarehouse;
        };
    };
}foreach(_unit call OT_fnc_unitStock);

{
    if !(_x isEqualTo "ItemMap") then {
        if !([_wid, _x, 1] call OT_fnc_removeFromWarehouse) then {
            if(_correct) then {_unit unlinkItem _x};
            _missing pushback _x;
        };
    };
}foreach(assignedItems _unit);

private _backpack = backpack _unit;
if !(_backpack isEqualTo "") then {
    if !([_wid, _backpack, 1] call OT_fnc_removeFromWarehouse) then {
        _missing pushback _backpack;
        if(_correct) then {
            //Put the items from the backpack back in the warehouse
            {
                [_wid, _x, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
            }foreach(backpackItems _unit);
            removeBackpack _unit;
        };
    };
};

private _vest = vest _unit;
if !(_vest isEqualTo "") then {
    if !([_wid, _vest, 1] call OT_fnc_removeFromWarehouse) then {
        _missing pushback _vest;
        if(_correct) then {
            //Put the items from the vest back in the warehouse
            {
                [_wid, _x, 1] remoteExec ["OT_fnc_addToWarehouse", 2, false];
            }foreach(vestItems _unit);
            removeVest _unit;
        };
    };
};

private _helmet = headgear _unit;
if !(_helmet isEqualTo "") then {
    if !([_warehouse, _helmet, 1] call OT_fnc_removeFromWarehouse) then {
        _missing pushback _helmet;
        if(_correct) then {removeHeadgear _unit};
    };
};

private _goggles = goggles _unit;
if !(_goggles isEqualTo "") then {
    if !([_wid, _goggles, 1] call OT_fnc_removeFromWarehouse) then {
        _missing pushback _goggles;
        if(_correct) then {removeGoggles _unit};
    };
};
diag_log format ["verifyLoadoutFromWarehouse RETURNED missing:%1", _missing];
warehouses setVariable ["verifiedLoadout", _missing, true];
OT_whTransferring = false;
