if(!isServer) exitWith{};
if(!isMultiplayer) exitWith{};
if(!HCEnabled) exitWith{};
params ["_unit", "_HC"];
if(isNull _HC) exitWith{};

waitUntil{time > 2};


_HCID = owner _HC;
_unitGroup = group _unit;

{_x setOwner _HCid;}forEach(units _unitGroup);

_unitGroup setGroupOwner _HCid;