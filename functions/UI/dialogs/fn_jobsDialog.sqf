closedialog 0;
if (count (spawner getVariable ["OT_activeJobs",[]]) isEqualTo 0) exitWith { "You have no jobs yet" call OT_fnc_notifyMinor; };
createDialog "OT_dialog_jobs";

{
    _x params ["_id","_job"];
    _job params ["_info"];
    _info params ["_title","_description"];

    _idx = lbAdd [1500,format["%1",_title]];
    lbSetData [1500,_idx,_id];
}foreach(spawner getVariable ["OT_activeJobs",[]]);
