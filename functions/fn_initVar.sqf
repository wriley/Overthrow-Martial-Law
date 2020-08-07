//VCOM AI, huge credits to Genesis, without VCOM this campaign would be so much less

OT_ACEremoveAction = [
	"OT_Remove",
	"Remove",
	"",
	{},
	{params ["_target"]; (call OT_fnc_playerIsGeneral) || (_target call OT_fnc_playerIsOwner)},
	{},
	[],
	[0,0,0],
	10
] call ace_interact_menu_fnc_createAction;
OT_ACEremoveActionConfirm = [
	"OT_Remove_Confirm",
	"Confirm",
	"",
	{params ["_target"]; deleteVehicle _target;},
	{true},
	{},
	[],
	[0,0,0],
	10
] call ace_interact_menu_fnc_createAction;

//Find markers
OT_ferryDestinations = [];
OT_NATO_control = [];
OT_regions = [];
{
	if((_x select [0,12]) isEqualTo "destination_") then {OT_ferryDestinations pushback _x};
	if((_x select [0,8]) isEqualTo "control_") then {OT_NATO_control pushback _x};
	if((_x select [0,7]) isEqualTo "island_") then {OT_regions pushback _x};
	if((_x select [0,7]) isEqualTo "region_") then {OT_regions pushback _x};
}foreach(allMapMarkers);

OT_missions = [];
OT_localMissions = [];
{
	_name = configName _x;
	_script = getText (_x >> "script");
	_code = compileFinal preprocessFileLineNumbers _script;
	OT_missions pushback _code;
}foreach("true" configClasses ( configFile >> "CfgOverthrowMissions" ));

OT_tutorialMissions = [];
OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_main\missions\tutorial\tut_NATO.sqf");
//OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_main\missions\tutorial\tut_CRIM.sqf");
OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_main\missions\tutorial\tut_Drugs.sqf");
OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_main\missions\tutorial\tut_Economy.sqf");

OT_NATO_HQ_garrisonPos = [];
OT_NATO_HQ_garrisonDir = 0;

OT_QRFstart = nil;

// Load mission data
call compile preprocessFileLineNumbers "data\names.sqf";
call compile preprocessFileLineNumbers "data\towns.sqf";
call compile preprocessFileLineNumbers "data\airports.sqf";
call compile preprocessFileLineNumbers "data\objectives.sqf";
call compile preprocessFileLineNumbers "data\economy.sqf";
call compile preprocessFileLineNumbers "data\comms.sqf";

//Identity
OT_faces_local = [];
OT_faces_western = [];
OT_faces_eastern = [];
{
    private _types = getArray(_x >> "identityTypes");
	if(OT_identity_local in _types) then {OT_faces_local pushback configName _x};
	if(OT_identity_western in _types) then {OT_faces_western pushback configName _x};
	if(OT_identity_eastern in _types) then {OT_faces_eastern pushback configName _x};
}foreach("getNumber(_x >> 'disabled') isEqualTo 0" configClasses (configfile >> "CfgFaces" >> "Man_A3"));

OT_voices_local = [];
OT_voices_western = [];
OT_voices_eastern = [];
{
    private _types = getArray(_x >> "identityTypes");
	if(OT_language_local in _types) then {OT_voices_local pushback configName _x};
	if(OT_language_western in _types) then {OT_voices_western pushback configName _x};
	if(OT_language_eastern in _types) then {OT_voices_eastern pushback configName _x};
}foreach("getNumber(_x >> 'scope') isEqualTo 2" configClasses (configfile >> "CfgVoice"));

//Find houses
OT_hugePopHouses = ["Land_MultistoryBuilding_01_F","Land_MultistoryBuilding_03_F","Land_MultistoryBuilding_04_F","Land_House_2W04_F","Land_House_2W03_F","Land_Offices_01_V1_F"]; //buildings with potentially lots of people living in them
OT_mansions = ["Land_House_Big_02_F","Land_House_Big_03_F","Land_Hotel_01_F","Land_Hotel_02_F","Land_Hospital_main_F"]; //buildings that rich guys like to live in
OT_lowPopHouses = ["Land_Shed_09_F","Land_Shed_10_F","Land_Shed_12_F","Land_Shed_13_F","Land_Shed_14_F","Land_GarageShelter_01_F","Land_Slum_01_F","Land_Slum_02_F","Land_Slum_03_F","Land_Shed_02_F","Land_Shed_05_F","Land_House_Native_02_F","Land_u_House_Small_01_V1_F","Land_d_House_Small_01_V1_F","Land_u_House_Small_02_V1_F","Land_d_House_Small_02_V1_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_Addon_02_V1_F","Land_u_Addon_02_V1_F","Land_d_Addon_02_V1_F","Land_Slum_House01_F","Land_Slum_House02_F","Land_Slum_House03_F","Land_i_Stone_Shed_V2_F","Land_d_Stone_Shed_V1_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_Shed_V3_F","Land_d_House_Big_02_V1_F","Land_d_House_Big_01_V1_F","Land_Shed_08_brown_F","Land_Shed_08_grey_F","Land_i_Stone_Shed_01_b_clay_F","Land_i_Stone_Shed_01_b_raw_F","Land_i_Stone_Shed_01_b_white_F","Land_i_Stone_Shed_01_c_clay_F","Land_i_Stone_Shed_01_c_raw_F","Land_i_Stone_Shed_01_c_white_F","Land_i_House_Small_02_b_blue_F","Land_i_House_Small_02_b_pink_F","Land_i_House_Small_02_b_whiteblue_F","Land_i_House_Small_02_b_white_F","Land_i_House_Small_02_b_brown_F","Land_i_House_Small_02_b_yellow_F","Land_i_House_Small_02_c_blue_F","Land_i_House_Small_02_c_pink_F","Land_i_House_Small_02_c_whiteblue_F","Land_i_House_Small_02_c_white_F","Land_i_House_Small_02_c_brown_F","Land_i_House_Small_02_c_yellow_F","Land_i_Addon_02_b_white_F"];
OT_medPopHouses = ["Land_i_House_Small_01_b_blue_F","Land_i_House_Small_01_b_pink_F","Land_i_House_Small_01_b_whiteblue_F","Land_i_House_Small_01_b_white_F","Land_i_House_Small_01_b_brown_F","Land_i_House_Small_01_b_yellow_F","Land_i_Stone_House_Big_01_b_clay_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V1_F","Land_i_Stone_HouseBig_V3_F","Land_d_Stone_HouseBig_V1_F","Land_i_Stone_HouseBig_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseSmall_V3_F","Land_d_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_House_Small_03_V1_F","Land_u_House_Big_02_V1_F","Land_u_House_Big_01_V1_F","Land_House_Small_01_F","Land_House_Small_06_F","Land_House_Small_03_F","Land_House_Small_02_F","Land_School_01_F","Land_Barn_03_large_F","Land_Barn_03_small_F","Land_House_2W01_F","Land_House_2W02_F","Land_House_2W03_F","Land_House_2W04_F","Land_House_2W05_F","Land_House_1B01_F","Land_House_1W01_F","Land_House_1W02_F","Land_House_1W03_F","Land_House_1W04_F","Land_House_1W05_F","Land_House_1W06_F","Land_House_1W07_F","Land_House_1W08_F","Land_House_1W09_F","Land_House_1W10_F","Land_House_1W11_F","Land_House_1W12_F","Land_House_1W13_F"];
OT_highPopHouses = ["Land_i_House_Big_02_b_blue_F","Land_i_House_Big_02_b_pink_F","Land_i_House_Big_02_b_whiteblue_F","Land_i_House_Big_02_b_white_F","Land_i_House_Big_02_b_brown_F","Land_i_House_Big_02_b_yellow_F","Land_i_House_Big_01_b_blue_F","Land_i_House_Big_01_b_pink_F","Land_i_House_Big_01_b_whiteblue_F","Land_i_House_Big_01_b_white_F","Land_i_House_Big_01_b_brown_F","Land_i_House_Big_01_b_yellow_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_House_Big_01_F","Land_House_Native_01_F","Land_House_2B01_F","Land_House_2B02_F","Land_House_2B03_F","Land_House_2B04_F"];
{
    private _cost = getNumber(_x >> "cost");
    [_cost,configName _x] call {
		params ["_cost","_name"];
        if(_cost > 70000) then {OT_hugePopHouses pushback _name;};
        if(_cost > 55000) then {OT_highPopHouses pushback _name;};
        if(_cost > 25000) then {OT_medPopHouses pushback _name;};
        OT_lowPopHouses pushback _name;
    };
}foreach("(getNumber (_x >> 'scope') isEqualTo 2) && (configName _x isKindOf 'House') && (configName _x find '_House' > -1)" configClasses (configfile >> "CfgVehicles"));

OT_allBuyableBuildings = OT_lowPopHouses + OT_medPopHouses + OT_highPopHouses + OT_hugePopHouses + OT_mansions + [OT_item_Tent,OT_flag_IND];

OT_allHouses = OT_lowPopHouses + OT_medPopHouses + OT_highPopHouses + OT_hugePopHouses;
OT_allRealEstate = OT_lowPopHouses + OT_medPopHouses + OT_highPopHouses + OT_hugePopHouses + OT_mansions + [OT_warehouse,OT_policeStation,OT_barracks,OT_barracks,OT_workshopBuilding,OT_refugeeCamp,OT_trainingCamp];

OT_allTowns = [];
OT_allTownPositions = [];

{
	_x params ["_pos","_name"];
	OT_allTowns pushBack _name;
	OT_allTownPositions pushBack _pos;
	if(isServer) then {
		server setVariable [_name,_pos,true];
	};
}foreach(OT_townData);

OT_allAirports = OT_airportData apply { _x select 1 };

//Global overthrow variables related to any map

OT_currentMissionFaction = "";
OT_rankXP = [100,250,500,1000,4000,10000,100000];

OT_adminMode = false;
OT_deepDebug = false;
private _GetParam = [0, 1] select (paramsArray select 9);
switch (_GetParam) do {
	case 0: {OT_HCEnabled = false;};
	case 1: {OT_HCEnabled = true;};
};

OT_allIntel = [];
OT_notifies = [];
OT_Looters = 0;
OT_LootersLastOrder = time;
OT_finishedHolster = true;

OT_NATO_HQPos = [0,0,0];

OT_fastTime = true; //When true, 1 day will last 6 hrs real time
OT_spawnDistance = 1000;
if (isNil "OT_spawnCivPercentage") then {
	OT_spawnCivPercentage = 0.01;
};
OT_spawnVehiclePercentage = 0.04;
OT_standardMarkup = 1.2; //Markup in shops is calculated from this
OT_randomSpawnTown = false; //if true, every player will start in a different town, if false, all players start in the same town (Multiplayer only)
OT_distroThreshold = 500; //Size a towns order must be before a truck is sent (in dollars)
OT_saving = false;
OT_activeShops = [];
OT_selling = false;
OT_taking = false;
OT_interactingWith = objNull;
OT_maximumNanoFobs = 5

OT_garrisonBuildings = ["Land_Bunker_01_tall_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V4_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_HQ_V4_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Cargo_Tower_V4_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"]; //Put HMGs in these buildings

OT_ammo_50cal = "OT_ammo50cal";

OT_item_wrecks = ["Land_Wreck_HMMWV_F","Land_Wreck_Skodovka_F","Land_Wreck_Truck_F","Land_Wreck_Car2_F","Land_Wreck_Car_F","Land_Wreck_Hunter_F","Land_Wreck_Offroad_F","Land_Wreck_Offroad2_F","Land_Wreck_UAZ_F","Land_Wreck_Truck_dropside_F"]; //rekt

OT_NATOwait = 300; //Half the Average time between NATO orders
OT_CRIMwait = 500; //Half the Average time between crim changes
OT_jobWait = 60;

OT_Resources = ["OT_Wood","OT_Steel","OT_Plastic","OT_Sugarcane","OT_Sugar","OT_Fertilizer","OT_Lumber","OT_Wine","OT_Grapes","OT_Olives"];

OT_item_CargoContainer = "B_Slingload_01_Cargo_F";

//Shop items
OT_item_ShopRegister = "Land_CashDesk_F";//Cash registers
OT_item_BasicGun = "hgun_P07_F";//Dealers always sell this cheap hgun_P07_F
OT_item_BasicAmmo = "16Rnd_9x21_Mag"; // 16Rnd_9x21_Mag

OT_allDrugs = ["OT_Ganja","OT_Blow"];
OT_illegalItems = OT_allDrugs;

OT_item_UAV = "I_UAV_01_F";
OT_item_UAVterminal = "I_UavTerminal";

OT_item_DefaultBlueprints = [];

OT_itemCategoryDefinitions = [
    ["General",["ACE_fieldDressing","Banana","Map","ToolKit","ACE_EarPlugs","Watch","Radio","Compass","ACE_Spraypaint","Altimiter","MapTools","Binocular","CableTie"]],
    ["Pharmacy",["Dressing","Bandage","morphine","adenosine","atropine","ACE_EarPlugs","epinephrine","bodyBag","quikclot","salineIV","bloodIV","plasmaIV","personalAidKit","surgicalKit","tourniquet","ACE_splint"]],
    ["Electronics",["MineDetector","Rangefinder","Cellphone","Radio","Watch","GPS","monitor","DAGR","ACE_microDAGR","_dagr","Battery","ATragMX","ACE_Flashlight","I_UavTerminal","Rangefinder","Binocular","Compass","ACE_Vector","ACE_Yardage","ACE_NVG_Gen1"]],
    ["Hardware",["Tool","CableTie","ACE_Spraypaint","wirecutter","ACE_rope","ACE_EntrenchingTool"]],
    ["Surplus",[]]
];

OT_items = [];
OT_allItems = [];
OT_craftableItems = [];

call OT_fnc_detectItems;

OT_notifyHistory = [];

OT_staticBackpacks = [
	/*["I_HMG_01_high_weapon_F",26000,1,0,1],
	["I_GMG_01_high_weapon_F",35000,1,0,1],
	["I_HMG_01_support_high_F",150,1,0,0],
	["I_Mortar_01_weapon_F",75000,1,0,1],
	["I_Mortar_01_support_F",100,1,0,0],
	["I_AT_01_weapon_F",75000,1,0,1],
	["I_AA_01_weapon_F",75000,1,0,1],
	["I_HMG_01_support_F",150,1,0,0]
	*/
];

OT_backpacks = [
	["B_AssaultPack_cbr",20,0,0,1],
	["B_AssaultPack_blk",20,0,0,1],
	["B_AssaultPack_khk",20,0,0,1],
	["B_AssaultPack_sgg",20,0,0,1],
	["B_FieldPack_cbr",30,0,0,1],
	["B_FieldPack_blk",30,0,0,1],
	["B_FieldPack_khk",30,0,0,1],
	["B_FieldPack_oli",30,0,0,1],
	["B_Kitbag_cbr",45,0,0,1],
	["B_Kitbag_sgg",45,0,0,1],
	["B_Carryall_cbr",60,0,0,1],
	["B_Carryall_khk",60,0,0,1],
	["B_Carryall_oli",60,0,0,1],
	["B_Parachute",50,0,0,1]
];
if(OT_hasTFAR) then {
	OT_backpacks append [
		["tf_anprc155",1000,0,0,0.1],
		["tf_anarc210",1500,0,0,0.1],
		["tf_anarc164",200,0,0,0.5],
		["tf_anprc155_coyote",100,0,0,0.5]
	];
};
if(OT_hasAPEX) then {
	OT_backpacks append [
		["B_Bergen_dgtl_F",500,0,0,1],
		["B_Bergen_hex_F",500,0,0,1],
		["B_Bergen_mcamo_F",500,0,0,1],
		["B_Bergen_tna_F",500,0,0,1]
	];
};

if (isServer) then {
	cost setVariable ["OT_Wood",[5,0,0,0],true];
	cost setVariable ["OT_Lumber",[8,0,0,0],true];
	cost setVariable ["OT_Steel",[25,0,0,0],true];
	cost setVariable ["OT_Plastic",[40,0,0,0],true];
	cost setVariable ["OT_Sugarcane",[5,0,0,0],true];
	cost setVariable ["OT_Grapes",[5,0,0,0],true];
	cost setVariable ["OT_Sugar",[15,0,0,0],true];
	cost setVariable ["OT_Wine",[25,0,0,0],true];
	cost setVariable ["OT_Olives",[7,0,0,0],true];
	cost setVariable ["OT_Fertilizer",[20,0,0,0],true];
};


//Detecting vehicles && weapons

OT_boats = [
	["C_Scooter_Transport_01_F",500,1,0,1],
	["C_Boat_Civil_01_rescue_F",1000,1,1,1],
	["C_Boat_Transport_02_F",3000,1,0,1]
];
OT_vehicles = [
	["RHS_Ural_Civ_01",7000,2,25,2],
	["RHS_Ural_Open_Civ_01",7000,2,25,2],
	["RHS_Ural_Civ_02",7000,2,25,2],
	["RHS_Ural_Open_Civ_02",7000,2,25,2],
	["RHS_Ural_Civ_03",7000,2,25,2],
	["RHS_Ural_Open_Civ_03",7000,2,25,2]
];
OT_helis = [
	["rhs_uh1h_idap",150000,0,45,10]
];
OT_allVehicles = [];
OT_allBoats = ["B_Boat_Transport_01_F"];
OT_allWeapons = [];
OT_allOptics = [];
OT_allMagazines = [OT_ammo_50cal];
OT_allBackpacks = [];
OT_allStaticBackpacks = [];
OT_vehWeights_civ = [];
OT_mostExpensiveVehicle = "";
OT_allHeliThreats = [];
OT_allPlaneThreats = [];
OT_allVehicleThreats = [];

OT_spawnHouses = [];
{
	private _cls = configName _x;
	OT_spawnHouses pushBack _cls;
	OT_allBuyableBuildings pushBackUnique _cls;
	OT_allRealEstate pushBackUnique _cls;
}foreach( "getNumber ( _x >> ""ot_isPlayerHouse"" ) isEqualTo 1" configClasses ( configFile >> "CfgVehicles" ) );

//Mission house overrides
{
	_x params ["_cls","_template"];
	OT_spawnHouses pushBack _cls;
	OT_allBuyableBuildings pushBackUnique _cls;
	OT_allRealEstate pushBackUnique _cls;
	templates setVariable [_cls,_template,true];
}foreach(OT_spawnHouseBuildings);

OT_gunDealerHouses = OT_spawnHouses;

private _allShops = "getNumber ( _x >> ""ot_isShop"" ) isEqualTo 1" configClasses ( configFile >> "CfgVehicles" );
OT_shops = _allShops apply {configName _x};

//Mission shop overrides
{
	_x params ["_cls","_template"];
	OT_shops pushBack _cls;
	templates setVariable [_cls,_template,true];
}foreach(OT_shopBuildings);

private _allCarShops = "getNumber ( _x >> ""ot_isCarDealer"" ) isEqualTo 1" configClasses ( configFile >> "CfgVehicles" );
OT_carShops = _allCarShops apply {configName _x};

//Mission car shop overrides
{
	_x params ["_cls","_template"];
	OT_carShops pushBack _cls;
	templates setVariable [_cls,_template,true];
}foreach(OT_carShopBuildings);

//Calculate prices
//First, load the hardcoded prices from data/prices.sqf
if(isServer) then {
	OT_loadedPrices = [];
	call compile preprocessFileLineNumbers "\overthrow_main\data\prices.sqf";
	{
		OT_loadedPrices pushback (_x select 0);
		cost setVariable[_x select 0,_x select 1, true];
	}forEach(OT_priceData);
	OT_priceData = []; //free memory

	call compile preprocessFileLineNumbers "\overthrow_main\data\gangnames.sqf";
};

private _allVehs = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
	{ (getArray ( _x >> ""threat"" ) select 0) < 0.5}
	&&
    { (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Car"") || (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Support"")}
	&&
    { (getText ( _x >> ""faction"" ) isEqualTo ""CIV_F"")})

" configClasses ( configFile >> "cfgVehicles" );

private _mostExpensive = 0;
{
	private _cls = configName _x;
	private _clsConfig = configFile >> "cfgVehicles" >> _cls;
	private _cost = round(getNumber (_clsConfig >> "armor") + (getNumber (_clsConfig >> "enginePower") * 2));
	_cost = _cost + round(getNumber (_clsConfig >> "maximumLoad") * 0.1);

	if(_cls isKindOf "Truck_F") then {_cost = _cost * 2};
	if(getText (_clsConfig >> "faction") != "CIV_F") then {_cost = _cost * 1.5};


	OT_vehicles pushback [_cls,_cost,0,getNumber (_clsConfig >> "armor"),2];
	OT_allVehicles pushback _cls;
	if(getText (_clsConfig >> "faction") == "CIV_F") then {
		if(getText(_clsConfig >> "textSingular") != "truck" && getText(_clsConfig >> "driverAction") != "Kart_driver") then {
			OT_vehTypes_civ pushback _cls;

			if(_cost > _mostExpensive)then {
				_mostExpensive = _cost;
				OT_mostExpensiveVehicle = _cls;
			};
		};
	};
}foreach(_allVehs);

//Determine vehicle threats
_allVehs = "
	( getNumber ( _x >> ""scope"" ) > 0
	&&
	{ (getArray ( _x >> ""threat"" ) select 0) > 0}
	&&
	{ (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Car"") or
	 (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Armored"")})

" configClasses ( configFile >> "cfgVehicles" );

{
	OT_allVehicleThreats pushback (configName _x);
}foreach(_allVehs);

private _allHelis = "
    ( getNumber ( _x >> ""scope"" ) > 1
    &&
	{ (getArray ( _x >> ""threat"" ) select 0) < 0.5}
	&&
    { getText ( _x >> ""vehicleClass"" ) isEqualTo ""Air""}
	&&
    { (getText ( _x >> ""faction"" ) isEqualTo ""CIV_F"") or
     (getText ( _x >> ""faction"" ) isEqualTo ""IND_F"")})
" configClasses ( configFile >> "cfgVehicles" );

{
	private _cls = configName _x;
	private _clsConfig = configFile >> "cfgVehicles" >> _cls;
	private _multiply = 3;
	if(_cls isKindOf "Plane") then {_multiply = 6};
	private _cost = (getNumber (_clsConfig >> "armor") + getNumber (_clsConfig >> "enginePower")) * _multiply;
	_cost = _cost + round(getNumber (_clsConfig >> "maximumLoad") * _multiply);
	private _steel = round(getNumber (_clsConfig >> "armor"));
	private _numturrets = count("true" configClasses(_clsConfig >> "Turrets"));
	private _plastic = 2;
	if(_numturrets > 0) then {
		_cost = _cost + (_numturrets * _cost * _multiply);
		_steel = _steel * 3;
		_plastic = 6;
	};

	if(isServer && isNil {cost getVariable _cls}) then {
		cost setVariable [_cls,[_cost,0,_steel,_plastic],true];
	};

	OT_helis pushback [_cls,[_cost,0,_steel,_plastic],true];
	OT_allVehicles pushback _cls;
}foreach(_allHelis);

//Determine aircraft threats
_allHelis = "
    ( getNumber ( _x >> ""scope"" ) > 0
    &&
	{ (getArray ( _x >> ""threat"" ) select 0) >= 0.5}
	&&
    { getText ( _x >> ""vehicleClass"" ) isEqualTo ""Air""})
" configClasses ( configFile >> "cfgVehicles" );

{
	private _cls = configName _x;
	private _clsConfig = configFile >> "cfgVehicles" >> _cls;
	private _numturrets = count("true" configClasses(_clsConfig >> "Turrets"));

	if(_cls isKindOf "Plane") then {
		OT_allPlaneThreats pushback _cls;
	}else{
		OT_allHeliThreats pushback _cls;
	};
}foreach(_allHelis);

//Chinook (unarmed) special case for production logistics
OT_helis pushback ["B_Heli_Transport_03_unarmed_F",[150000,0,110,5],true];
OT_allVehicles pushBackUnique "B_Heli_Transport_03_unarmed_F";
if(isServer) then {
	cost setVariable ["B_Heli_Transport_03_unarmed_F",[150000,0,110,5],true];
};

{
	private _cls = _x select 0;
	if(isServer && isNil {cost getVariable _cls}) then {
		cost setVariable [_cls,[_x select 1,_x select 2,_x select 3,_x select 4],true];
	};
	if(_cls in OT_vehTypes_civ) then {
		OT_vehWeights_civ pushback (_mostExpensive - (_x select 1)) + 1; //This will make whatever is the most expensive car very rare
	};
	OT_allVehicles pushBack _cls;
}foreach(OT_vehicles);

private _allWeapons = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""})
" configClasses ( configFile >> "cfgWeapons" );

private _allAttachments = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { _t = getNumber ( _x >> ""ItemInfo"" >> ""type"" ); _t isEqualTo 301 || _t isEqualTo 302 || _t isEqualTo 101})
" configClasses ( configFile >> "cfgWeapons" );

private _allOptics = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""optics"" ) isEqualTo 1})
" configClasses ( configFile >> "cfgWeapons" );

private _allDetonators = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ace_explosives_Detonator"" ) isEqualTo 1})
" configClasses ( configFile >> "cfgWeapons" );

private _allUniforms = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""type"" ) isEqualTo 801})
" configClasses ( configFile >> "cfgWeapons" );

private _allHelmets = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""type"" ) isEqualTo 605})
" configClasses ( configFile >> "cfgWeapons" );

private _allAmmo = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2 )
" configClasses ( configFile >> "cfgMagazines" );

private _allVehicles = "
    ( getNumber ( _x >> ""scope"" ) > 0 )
" configClasses ( configFile >> "cfgVehicles" );

private _allFactions = "
    ( getNumber ( _x >> ""side"" ) < 3 )
" configClasses ( configFile >> "cfgFactionClasses" );

private _allGlasses = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2 )
" configClasses ( configFile >> "CfgGlasses" );

OT_allFactions = [];
OT_allSubMachineGuns = [];
OT_allAssaultRifles = [];
OT_allMachineGuns = [];
OT_allSniperRifles = [];
OT_allHandGuns = [];
OT_allMissileLaunchers = [];
OT_allRocketLaunchers = [];
OT_allExpensiveRifles = [];
OT_allCheapRifles = [];
OT_allVests = [];
OT_allProtectiveVests = [];
OT_allExpensiveVests = [];
OT_allCheapVests = [];
OT_allClothing = [];
OT_allOptics = [];
OT_allHelmets = [];
OT_allHats = [];
OT_allAttachments = [];
OT_allExplosives = [];
OT_explosives = [];
OT_detonators = [];
OT_allDetonators = [];
OT_allGlasses = [];
OT_allFacewear = [];
OT_allGoggles = [];
OT_allBLURifles = [];
OT_allBLUSMG = [];
OT_allBLUMachineGuns = [];
OT_allBLUSniperRifles = [];
OT_allBLUGLRifles = [];
OT_allBLULaunchers = [];
OT_allBLUPistols = [];
OT_allBLUVehicles = [];
OT_allBLUOffensiveVehicles = [];
OT_allBLURifleMagazines = [];

{
	private _name = configName _x;
	private _title = getText (_x >> "displayname");
	private _m = getNumber(_x >> "mass");
	private _ignore = getNumber(_x >> "ot_shopignore");
	if(_ignore != 1) then {
		if((_name find "Balaclava_TI_") > -1) then {
			_m = _m * 2;
		};

		private _protection = getNumber(_x >> "ACE_Protection");
		if(_protection > 0) then {
			_m = round(_m * 1.5);
		};

		[_name,_title] call {
			params ["_name","_title"];
			if(_name == "None") exitWith {};
			if(_name == "G_Goggles_VR") exitWith {};
			if((_title find "Tactical") > -1 || (_title find "Diving") > -1 || (_title find "Goggles") > -1) exitWith {
				OT_allGoggles pushback _name;
			};
			if((_title find "Balaclava") > -1 || (_title find "Bandana") > -1) exitWith {
				OT_allFacewear pushback _name;
			};
			OT_allGlasses pushback _name;
		};
		if(isServer && _name != "None" && isNil {cost getVariable _name}) then {
			cost setVariable [_name,[_m*3,0,0,ceil(_m*0.5)],true];
		};
	};
}foreach(_allGlasses);

{
	private _name = configName _x;
	private _title = getText (configFile >> "cfgFactionClasses" >> _name >> "displayName");
	private _side = getNumber (configFile >> "cfgFactionClasses" >> _name >> "side");
	private _flag = getText (configFile >> "cfgFactionClasses" >> _name >> "flag");
	private _numblueprints = 0;

	//736

	//Get vehicles && weapons
	private _vehicles = [];
	private _weapons = [];
	private _blacklist = ["Throw","Put","NLAW_F"];

	private _all = format["(getNumber( _x >> ""scope"" ) isEqualTo 2 ) && (getText( _x >> ""faction"" ) isEqualTo '%1')",_name] configClasses ( configFile >> "cfgVehicles" );
	{
		private _cls = configName _x;
		if(_cls isKindOf "CAManBase") then {
			//Get weapons;
			{
				private _base = [_x] call BIS_fnc_baseWeapon;
				if !(_base in _blacklist) then {
					private _muzzleEffect = getText (configFile >> "CfgWeapons" >> _base >> "muzzleEffect");
					if !(_x in _weapons) then {_weapons pushback _base};
					if(_side isEqualTo 1 && !(_muzzleEffect isEqualTo "BIS_fnc_effectFiredFlares")) then {
						if(_base isKindOf ["Rifle", configFile >> "CfgWeapons"]) then {
							private _mass = getNumber (configFile >> "CfgWeapons" >> _base >> "WeaponSlotsInfo" >> "mass");
							_base call {
								_itemType = ([_cls] call BIS_fnc_itemType) select 1;
								if(_itemType isEqualTo "MachineGun") exitWith {OT_allBLUMachineGuns pushBackUnique _base};
								if((_this select [0,7]) == "srifle_" || (_this isKindOf ["Rifle_Long_Base_F", configFile >> "CfgWeapons"])) exitWith {OT_allBLUSniperRifles pushBackUnique _base};
								if((_this find "_GL_") > -1) exitWith {OT_allBLUGLRifles pushBackUnique _base};
								private _events = "" configClasses (configFile >> "CfgWeapons" >> _base >> "Eventhandlers");
								_add = true;
								{
									private _n = configName _x;
									if(_n isEqualTo "RHS_BoltAction") exitWith {_add = false}; //ignore RHS bolt-action rifles
								}foreach(_events);
								if(_add && _mass < 61) exitWith {OT_allBLUSMG pushBackUnique _base};
								if(_add) then {
									OT_allBLURifles pushBackUnique _base;
									OT_allBLURifleMagazines = OT_allBLURifleMagazines + getArray(configFile >> "CfgWeapons" >> _base >> "WeaponSlotsInfo" >> "magazines");
								};
							};
						};
						if(_base isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {OT_allBLULaunchers pushBackUnique _base};
						if(_base isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {OT_allBLUPistols pushBackUnique _base};
					};
					//Get ammo
					{
						if (!(_x in _blacklist) || _x in OT_allExplosives) then {
							_weapons pushbackUnique _x
						};
					}foreach(getArray(configFile >> "CfgWeapons" >> _base >> "magazines"));
				};
			}foreach(getArray(configFile >> "CfgVehicles" >> _cls >> "weapons"));
		}else{
			//It's a vehicle
			if !(_cls isKindOf "Bag_Base" || _cls isKindOf "StaticWeapon") then {
				if(_cls isKindOf "LandVehicle" || _cls isKindOf "Air" || _cls isKindOf "Ship") then {
					_vehicles pushback _cls;
					_numblueprints = _numblueprints + 1;
					if(_side isEqualTo 1) then {
						private _threat = getArray (_x >> "threat");
						if(_threat#0 > 0.5) then {
							OT_allBLUOffensiveVehicles pushBackUnique _cls;
						}else{
							OT_allBLUVehicles pushBackUnique _cls;
						};
					};
				};
			};
		};
	}foreach(_all);
	_weapons = (_weapons arrayIntersect _weapons); //remove duplicates

	if(isServer) then {
		spawner setVariable [format["facweapons%1",_name],_weapons,true];
		spawner setVariable [format["facvehicles%1",_name],_vehicles,true];
	};
	if(_side > -1 && _numblueprints > 0) then {
		OT_allFactions pushback [_name,_title,_side,_flag];
	};
}foreach(_allFactions);

{
	private _name = configName _x;
	_name = [_name] call BIS_fnc_baseWeapon;

	private _short = getText (configFile >> "CfgWeapons" >> _name >> "descriptionShort");

	private _s = _short splitString ":";
	private _caliber = " 5.56";
	private _haslauncher = false;
	if(count _s > 1) then{
		_s = (_s select 1) splitString "x";
		_caliber = _s select 0;
	};

	private _weapon = [_name] call BIS_fnc_itemType;
	private _weaponType = _weapon select 1;

	private _muzzles = getArray (configFile >> "CfgWeapons" >> _name >> "muzzles");
	{
		if((_x find "EGLM") > -1) then {
			_haslauncher = true;
		};
	}foreach(_muzzles);

	([_weaponType,_name,_caliber,_haslauncher,_short] call {
		params ["_weaponType","_name","_caliber","_haslauncher","_short"];

		if (_weaponType == "SubmachineGun") exitWith {
			OT_allSubMachineGuns pushBack _name;
			[250, 0.5];
		};
		if (_weaponType == "AssaultRifle") exitWith {
			private _cost = [_caliber] call {
				params ["_caliber"];
				if(_caliber == " 5.56" || _caliber == "5.56" || _caliber == " 5.45" || _caliber == " 5.8") exitWith {500};
				if(_caliber == " 12 gauge") exitWith {1200};
				if(_caliber == " .408") exitWith {4000};
				if(_caliber == " .338 Lapua Magnum" || _caliber == " .303") exitWith {700};
				if(_caliber == " 9") exitWith {400}; //9x21mm
				if(_caliber == " 6.5") exitWith {1000};
				if(_caliber == " 7.62") exitWith {1500};
				if(_caliber == " 9.3" || _caliber == "9.3") exitWith {1700};
				if(_caliber == " 12.7") exitWith {3000};
				//I dunno what caliber this is
				1500;
			};
			if(_haslauncher) then {_cost = round(_cost * 1.2)};
			OT_allAssaultRifles pushBack _name;
			if(_cost > 1400) then {
				OT_allExpensiveRifles pushback _name;
			} else {
				OT_allCheapRifles pushback _name;
			};
			[_cost]
		};
		if (_weaponType ==  "MachineGun") exitWith {
			OT_allMachineGuns pushBack _name;
			[1500];
		};
		if (_weaponType ==  "SniperRifle") exitWith {
			OT_allSniperRifles pushBack _name;
			[4000];
		};
		if (_weaponType ==  "Handgun") exitWith {
			private _cost = _caliber call {
				if(_this == " .408") exitWith {2000};
				if(_this == " .338 Lapua Magnum" || _this == " .303") exitWith {700};
				100
			};
			if(_short != "Metal Detector") then {
				OT_allHandGuns pushBack _name
			};
			[_cost, 1]
		};
		if (_weaponType ==  "MissileLauncher") exitWith {
			OT_allMissileLaunchers pushBack _name;
			[15000];
		};
		if (_weaponType ==  "RocketLauncher") exitWith {
			OT_allRocketLaunchers pushBack _name;
			private _cost = 1500;
			if(_name == "launch_NLAW_F") then {
				_cost=1000
			};
			[_cost]
		};
		if (_weaponType ==  "Vest") exitWith {
			if !(_name in ["V_RebreatherB","V_RebreatherIA","V_RebreatherIR","V_Rangemaster_belt"]) then {
				private _cost = 40 + (getNumber(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") * 20);
				if !(_name in ["V_Press_F","V_TacVest_blk_POLICE"]) then {
					OT_allVests pushBack _name;
					if(_cost > 40) then {
						OT_allProtectiveVests pushback _name;
					};
					if(_cost > 300) then {
						OT_allExpensiveVests pushback _name;
					};
					if(_cost < 300 && _cost > 40) then {
						OT_allCheapVests pushback _name;
					};
				};
				[_cost]
			} else {
				[]
			};
		};
		[]
	}) params [["_cost", 500], ["_steel", 2]];
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_cost,0,_steel,0],true];
	};
} foreach (_allWeapons);

OT_allLegalClothing = [];
{
	private _name = configName _x;
	private _short = getText (configFile >> "CfgWeapons" >> _name >> "descriptionShort");
	private _supply = getText(configfile >> "CfgWeapons" >> _name >> "ItemInfo" >> "containerClass");
	private _mass = getNumber(configfile >> "CfgWeapons" >> _name >> "ItemInfo" >> "mass");
	private _carry = getNumber(configfile >> "CfgVehicles" >> _supply >> "maximumLoad");
	private _cost = round(_mass * 4);

	private _c = _name splitString "_";
	if(_c select (count _c - 1) != "VR") then {
		OT_allClothing pushback _name;

		private _side = _c select 1;
		if((_name == "V_RebreatherIA" || _side == "C" || _side == "I") && (_c select (count _c - 1) != "VR")) then {
			OT_allLegalClothing pushback _name;
		};
		if (isServer && isNil {cost getVariable _name}) then {
			cost setVariable [_name,[_cost,0,0,1],true];
		};
	};
} foreach (_allUniforms);

{
	private _name = configName _x;
	private _cost = 20 + (getNumber(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") * 30);
	if(_cost > 20) then {
		OT_allHelmets pushback _name;
	}else{
		OT_allHats pushback _name;
	};
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_cost,0,1,0],true];
	};
} foreach (_allHelmets);

{
	private _name = configName _x;
	private _m = getNumber(_x >> "mass");
	if(_name isKindOf ["Default",configFile >> "CfgMagazines"] && (_name != "NLAW_F") && !(_name isKindOf ["VehicleMagazine",configFile >> "CfgMagazines"])) then {
		private _cost = round(_m * 4);
		private _desc = getText(_x >> "descriptionShort");
		if((_desc find ".408") > -1) then {
			_cost = _cost * 4;
		};
		private _exp = false;
		private _steel = 0.1;
		private _plastic = 0;
		if(getNumber(_x >> "ace_explosives_Placeable") == 1) then {
			_exp = true;
		};
		if((_desc find "Smoke") > -1) then {
			_cost = round(_m * 0.5);
		}else{
			if((_desc find "Grenade") > -1) then {
				_cost = round(_m * 2);
				_exp = true;
			};
		};
		if((_desc find "Flare") > -1 || (_desc find "flare") > -1) then {
			_cost = round(_m * 0.6);
			_exp = false;
		};

		if(_name isEqualTo OT_ammo_50cal) then {_cost = 50};

		if(_exp) then {
			_steel = 0;
			_plastic = round(_m * 0.5);
			OT_allExplosives pushback _name;
			OT_explosives pushback [_name,_cost,0,_steel,_plastic];
		}else{
			OT_allMagazines pushback _name;
		};
		if(isServer && isNil {cost getVariable _name}) then {
			cost setVariable [_name,[_cost,0,_steel,_plastic],true];
		};
	};
} foreach (_allAmmo);

{
	private _name = configName _x;
	private _m = getNumber(_x >> "ItemInfo" >> "mass");
	if(getNumber(_x >> "ace_explosives_Range") > 1000) then {
		_m = _m * 10;
	};
	OT_allDetonators pushback _name;
	OT_detonators pushback [_name,_m,0,0.1,0];
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_m,0,0.1,0],true];
	};
} foreach (_allDetonators);

if(isServer) then {
	//Remaining vehicle costs
	private _cfgVeh = configFile >> "cfgVehicles";
	{
		private _name = configName _x;
		if((_name isKindOf "AllVehicles") && !(_name in OT_allVehicles)) then {
			private _multiply = 80;
			if(_name isKindOf "Air") then {_multiply = 700}; //Planes/Helis have less armor

			private _clsCfg = _cfgVeh >> _name;
			private _cost = getNumber (_clsCfg >> "armor") * _multiply;
			private _steel = round(getNumber (_clsCfg >> "armor") * 0.5);
			private _numturrets = count("!((configName _x) select [0,5] == ""Cargo"") && !((count getArray (_x >> ""magazines"")) isEqualTo 0)" configClasses(_clsCfg >> "Turrets"));
			private _plastic = 2;
			if(_numturrets > 0) then {
				_cost = _cost + (_numturrets * _cost * 10);
				_steel = _steel + 50;
				_plastic = 5 * _numturrets;

				if(_name isKindOf "Air") then {_cost = _cost * 2};
			};
			if(isNil {cost getVariable _name}) then {
				cost setVariable [_name,[_cost,0,_steel,_plastic],true];
			};
		};
	} foreach (_allVehicles);
};

OT_attachments = [];
{
	private _name = configName _x;
	private _cost = 75;
	private _t = getNumber(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "type");
	if(_t isEqualTo 302) then {
		//Bipods
		_cost = 150;
	};
	if(_t isEqualTo 101) then {
		//Suppressors
		_cost = 350;
	};
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_cost,0,0,0.25],true];
	};
	OT_allAttachments pushback _name;
	OT_attachments pushback [_name,[_cost,0,0,0.25]];
} foreach (_allAttachments);

{
	private _name = configName _x;
	private _allModes = "true" configClasses ( configFile >> "cfgWeapons" >> _name >> "ItemInfo" >> "OpticsModes" );
	private _cost = 50;
	{
		private _mode = configName _x;
		private _max = getNumber (configFile >> "cfgWeapons" >> _name >> "ItemInfo" >> "OpticsModes" >> _mode >> "distanceZoomMax");
		private _mul = 0.1;
		if(_mode == "NVS") then {_mul = 0.2};
		if(_mode == "TWS") then {_mul = 0.5};
		_cost = _cost + floor(_max * _mul);
	}foreach(_allModes);

	OT_allOptics pushback _name;
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_cost,0,0,0.5],true];
	};
} foreach (_allOptics);

OT_allWeapons = OT_allSubMachineGuns + OT_allAssaultRifles + OT_allMachineGuns + OT_allSniperRifles + OT_allHandGuns + OT_allMissileLaunchers + OT_allRocketLaunchers;

if(isServer) then {
	cost setVariable ["CIV",[80,0,0,0],true];
	cost setVariable ["WAGE",[5,0,0,0],true];
	cost setVariable [OT_item_UAV,[200,0,0,1],true];
	cost setVariable ["FUEL",[5,0,0,0],true];
};
//populate the cost gamelogic with the above data so it can be accessed quickly
{
	if(isServer && isNil {cost getVariable (_x select 0)}) then {
		cost setVariable [_x select 0,_x select [1,4],true];
	};
	OT_allBackpacks pushBack (_x select 0);
}foreach(OT_backpacks);
{
	if(isServer && isNil {cost getVariable (_x select 0)}) then {
		cost setVariable [_x select 0,_x select [1,4],true];
	};
	OT_allStaticBackpacks pushBack (_x select 0);
}foreach(OT_staticBackpacks);

{
	if(isServer && isNil {cost getVariable (_x select 0)}) then {
		cost setVariable [_x select 0,_x select [1,4],true];
	};
	OT_allBoats pushBack (_x select 0);
}foreach(OT_boats);

OT_staticMachineGuns = ["I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","O_HMG_01_F","O_HMG_01_high_F","O_HMG_01_A_F","B_HMG_01_F","B_HMG_01_high_F","B_HMG_01_A_F"];
OT_staticWeapons = ["I_Mortar_01_F","I_static_AA_F","I_static_AT_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","O_static_AA_F","O_static_AT_F","O_Mortar_01_F","O_GMG_01_F","O_GMG_01_high_F","O_GMG_01_A_F","O_HMG_01_F","O_HMG_01_high_F","O_HMG_01_A_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F","B_GMG_01_F","B_GMG_01_high_F","B_GMG_01_A_F","B_HMG_01_F","B_HMG_01_high_F","B_HMG_01_A_F"];


//Stuff you can build: [name,price,array of possible classnames,init function,??,description]
OT_Buildables = [
	["Training Camp",3000,[
	  ["Land_CanvasCover_02_F",[-7.69089,-0.473363,0],0,1,0,[0,0],"","",true,false],
	  ["Land_WoodenTable_02_large_F",[-4.72402,-0.182449,0.0129075],261.38,1,0,[0.000213137,-0.19328],"","",true,false],
    ["Land_Garbage_square5_F",[-4.89414,-0.188629,0],286.632,1,0,[0,0],"","",true,false],
    ["Box_NATO_Grenades_F",[-8.66742,0.682662,-1.43051e-006],22.6307,1,0,[0.000369633,-0.000828827],"","",true,false],
    ["Land_Pallet_MilBoxes_F",[-9.68021,-0.782342,0],324.09,1,0,[0,0],"","",true,false]
	],"OT_fnc_initTrainingCamp",true,"Allows training of recruits && hiring of people with military experience"],
	["Bunkers",5000,["Land_Hangar_F","Land_BagBunker_Tower_F","Land_BagBunker_Small_F","Land_HBarrierTower_F","Land_Bunker_01_blocks_3_F","Land_Bunker_01_blocks_1_f","Land_Bunker_01_big_F","Land_Bunker_01_small_F","Land_Bunker_01_tall_F","Land_Bunker_01_HQ_F","Land_BagBunker_01_small_green_F","Land_HBarrier_01_big_tower_green_F","Land_HBarrier_01_tower_green_F"],"",false,"Small Defensive Structures. CONTAINS TEST OBJECTS. Press space to change type."],
	["Walls",100,["Land_HBarrier_1_F","Land_HBarrier_3_F","Land_HBarrier_5_F","Land_HBarrier_Big_F","Land_HBarrierWall_corner_F","Land_HBarrierWall_corridor_F","Land_HBarrierWall4_F","Land_HBarrierWall6_F","Land_HBarrier_01_line_1_green_F","Land_HBarrier_01_line_3_green_F","Land_HBarrier_01_line_5_green_F","Land_HBarrier_01_big_4_green_F","Land_HBarrier_01_wall_corner_green_F","Land_HBarrier_01_wall_corridor_green_F","Land_HBarrier_01_wall_4_green_F","Land_HBarrier_01_wall_6_green_F"],"",false,"Stop people (or tanks) from getting in. Press space to change type."],
	["Helipad",150,["Land_HelipadCircle_F","Land_HelipadCivil_F","Land_HelipadRescue_F","Land_HelipadSquare_F"],"",false,"Informs helicopter pilots of where might be a nice place to land"],
	["Observation Post",1800,["Land_Cargo_Patrol_V4_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V1_F"],"",false,"A small tower, can garrison a static HMG/GMG in it"],
	["Barracks",50000,[OT_barracks],"",false,"Allows recruiting of squads"],
	["Guard Tower",50000,["Land_Cargo_Tower_V4_F","Land_Cargo_Tower_V3_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V1_F"],"",false,"It's a huge tower, what else do you need?."],
	["Hangar",12000,["Land_Airport_01_hangar_F"],"",false,"A big empty building, could probably fit a plane inside it."],
	["Workshop",5000,[
	  ["Land_cargo_house_slum_F",[-5.28708,1.71423,0],0,1,0,[0,0],"","",true,false],
		["Land_ToolTrolley_02_F",[-0.943165,0.888457,-1.90735e-006],184.978,1,0,[-0.000586218,0.000940886],"","",true,false],
		["Land_WeldingTrolley_01_F",[-2.5792,-1.39631,-4.76837e-007],292.933,1,0,[-0.000260068,1.87621e-005],"","",true,false],
		["Box_NATO_AmmoVeh_F",[-6.28864,-2.78878,0.0305414],9.03579e-005,1,0,[1.25353e-005,-6.98109e-006],"","",true,false]
	],"OT_fnc_initWorkshop",true,"Attach weapons to vehicles"],
	["House",10000,["Land_House_Small_06_F","Land_House_Small_02_F","Land_House_Small_03_F","Land_GarageShelter_01_F","Land_Slum_04_F"],"",false,"4 walls, a roof, && if you're lucky a door that opens."],
	["Police Station",12500,[OT_policeStation],"OT_fnc_initPoliceStation",false,"Allows hiring of policeman to raise stability in a town \& keep the peace. Comes with 2 units."],
	["Warehouse",20000,[OT_warehouse],"OT_fnc_initWarehouse",false,"A house that you put wares in."],
	["Refugee Camp",1600,[OT_refugeeCamp],"",false,"Can recruit civilians here without needing to chase them down"],
	["Radar",250000,[OT_radarBuilding],"OT_fnc_initRadar",false,"Reveals enemy drones, helicopters and planes within 2.5km"]
];

{
	private _istpl = _x select 4;
	if(_istpl) then {
		private _tpl = _x select 2;
		OT_allBuyableBuildings pushback ((_tpl select 0) select 0);
	}else{
		[OT_allBuyableBuildings,(_x select 2)] call BIS_fnc_arrayPushStack;
	}
}foreach(OT_Buildables);

//Stuff you can place: ["Category",[classname, cost, item description],[offset, category description]]
OT_Placeables = [
	["Sandbags",
	[
		["Land_SandbagBarricade_01_F",20,""],
		["Land_SandbagBarricade_01_hole_F",20,""],
		["Land_SandbagBarricade_01_half_F",20,""],
		["Land_BagFence_Short_F",20,""],
		["Land_BagFence_Round_F",20,""],
		["Land_BagFence_Long_F",20,""],
		["Land_BagFence_End_F",20,""],
		["Land_BagFence_Corner_F",20,""],
		["Land_BagFence_01_long_green_F",20,""],
		["Land_BagFence_01_short_green_F",20,""],
		["Land_BagFence_01_round_green_F",20,""],
		["Land_BagFence_01_corner_green_F",20,""],
		["Land_BagFence_01_end_green_F",20,""]
	],
	[0,3,0.8],
	"Bags filled with lots of sand. Apparently this can stop bullets or something?"
	],
	["Camo Nets",
	[
		["CamoNet_INDP_open_F",40,""],
		["CamoNet_INDP_F",40,""],
		["CamoNet_ghex_F",40,""],
		["CamoNet_ghex_open_F",40,""],
		["CamoNet_ghex_big_F",40,""]
	],
	[0,7,2],
	"Large && terribly flimsy structures that may or may not obscure your forces from airborne units."],
	["Barriers",
	[
	  ["Land_Barricade_01_4m_F",10,""],
		["Land_Barricade_01_10m_F",10,""],
		["Land_HBarrier_1_F",50,""],
		["Land_HBarrier_3_F",70,""],
		["Land_HBarrier_5_F",90,""],
		["Land_HBarrier_Big_F",100,""],
		["Land_HBarrierWall_corner_F",120,""],
		["Land_HBarrierWall_corridor_F",90,""],
		["Land_HBarrierWall4_F",150,""],
		["Land_HBarrierWall6_F",170,""],
		["Land_HBarrier_01_line_1_green_F",50,""],
		["Land_HBarrier_01_line_3_green_F",70,""],
		["Land_HBarrier_01_line_5_green_F",90,""],
		["Land_HBarrier_01_big_4_green_F",100,""],
		["Land_HBarrier_01_wall_corner_green_F",120,""],
		["Land_HBarrier_01_wall_corridor_green_F",90,""],
		["Land_HBarrier_01_wall_4_green_F",150,""],
		["Land_HBarrier_01_wall_6_green_F",170,""]
	],
	[0,4,1.2],
	"Really big sandbags, basically."
	],
	["Map",
	[
		[OT_item_Map,30,""]
	],
	[0,2,1.2],
	"Use these to save your game, change options or check town info."
	],
	["Safe",
	[
		[OT_item_Safe,50,""]
	],
	[0,2,0.5],
	"Store && retrieve money"
	],
	["Misc",
	[
		["ACE_Wheel",150,"Spare Wheel"],
		["ACE_Track",15000,"Spare Tank Tracks"],
		["Land_Workbench_01_F",30,"Workbench used to craft items"],
		["Box_Syndicate_Wps_F",100,"Weapons  Supply Box"],
		["Box_Syndicate_Ammo_F",100,"Ammo Supply Box"],
		["Box_Syndicate_WpsLaunch_F",100,"Launchers Supply Box"],
		["Land_PortableLight_double_F",30,""],
		["Land_PortableLight_single_F",30,""],
		["Land_Camping_Light_F",30,""],
		["Land_PortableHelipadLight_01_F",30,""],
		["PortableHelipadLight_01_blue_F",30,""],
		["PortableHelipadLight_01_green_F",30,""],
		["PortableHelipadLight_01_red_F",30,""],
		["PortableHelipadLight_01_white_F",30,""],
		["PortableHelipadLight_01_yellow_F",30,""],
		["Land_Campfire_F",30,""],
		["Land_PortableLight_02_single_yellow_F",30,""],
		["Land_PortableLight_02_double_yellow_F",30,""],
		["Land_PortableLight_02_quad_yellow_F",30,""],
		["Land_PowerPoleWooden_L_F",30,""],
		["RoadBarrier_F",30,""],
		["RoadBarrier_small_F",30,""],
		["RoadCone_F",30,""],
		["RoadCone_L_F",30,""],
		["Land_Sleeping_bag_F",30,""],
		["Land_Sleeping_bag_blue_F",30,""]
	],
	[0,3,1.2],
	"Various other items, including spare wheels && lights"
	]
];

OT_allSquads = OT_Squadables apply { _x params ["_name"]; _name };

OT_workshop = [
	["Static MG","C_Offroad_01_F",51250,"I_HMG_02_high_weapon_F","I_HMG_02_high_F",[[0.25,-2,1]],0],
	["Static GL","C_Offroad_01_F",64750,"I_GMG_01_high_weapon_F","I_GMG_01_high_F",[[0.25,-2,1]],0],
	["Static AT","C_Offroad_01_F",187500,"I_AT_01_weapon_F","I_static_AT_F",[[0,-1.5,0.25],180]],
	["Static AA","C_Offroad_01_F",187500,"I_AA_01_weapon_F","I_static_AA_F",[[0,-1.5,0.25],180]],
	["Mounted HMG","RHS_Ural_Open_Civ_01",69500,"I_HMG_02_high_weapon_F","I_HMG_02_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted HMG","RHS_Ural_Open_Civ_02",69500,"I_HMG_02_high_weapon_F","I_HMG_02_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted HMG","RHS_Ural_Open_Civ_03",69500,"I_HMG_02_high_weapon_F","I_HMG_02_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted GMG","RHS_Ural_Open_Civ_01",83000,"I_GMG_01_high_weapon_F","I_GMG_01_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted GMG","RHS_Ural_Open_Civ_02",83000,"I_GMG_01_high_weapon_F","I_GMG_01_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted GMG","RHS_Ural_Open_Civ_03",83000,"I_GMG_01_high_weapon_F","I_GMG_01_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted Mortar","RHS_Ural_Open_Civ_01",216000,"I_Mortar_01_weapon_F","I_Mortar_01_F",[[-0.064,-1.854,0.5]],0],
	["Mounted Mortar","RHS_Ural_Open_Civ_02",216000,"I_Mortar_01_weapon_F","I_Mortar_01_F",[[-0.064,-1.854,0.5]],0],
	["Mounted Mortar","RHS_Ural_Open_Civ_03",216000,"I_Mortar_01_weapon_F","I_Mortar_01_F",[[-0.064,-1.854,0.5]],0],
	["Cargo Boxes","RHS_Ural_Open_Civ_01",25,"B_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F",[[-0.011,-2.174,0.5]],0],
	["Cargo Boxes","RHS_Ural_Open_Civ_02",25,"B_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F",[[-0.011,-2.174,0.5]],0],
	["Cargo Boxes","RHS_Ural_Open_Civ_03",25,"B_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F",[[-0.011,-2.174,0.5]],0],
	["Cargo Boxes","C_Van_01_transport_F",25,"B_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F",[[-0.01,-1.683,0.2]],0]
];

OT_repairableRuins = [
	["Land_Cargo_Tower_V4_ruins_F","Land_Cargo_Tower_V4_F",2000],
	["Land_Cargo_Tower_V1_ruins_F","Land_Cargo_Tower_V1_F",2000],
	["Land_Cargo_Tower_V2_ruins_F","Land_Cargo_Tower_V2_F",2000],
	["Land_Cargo_Tower_V3_ruins_F","Land_Cargo_Tower_V3_F",2000],
	["Land_Cargo_Patrol_V1_ruins_F","Land_Cargo_Patrol_V1_F",500],
	["Land_Cargo_Patrol_V2_ruins_F","Land_Cargo_Patrol_V2_F",500],
	["Land_Cargo_Patrol_V3_ruins_F","Land_Cargo_Patrol_V3_F",500],
	["Land_Cargo_Patrol_V4_ruins_F","Land_Cargo_Patrol_V4_F",500],
	["Land_Cargo_HQ_V1_ruins_F","Land_Cargo_HQ_V1_F",2500],
	["Land_Cargo_HQ_V2_ruins_F","Land_Cargo_HQ_V2_F",2500],
	["Land_Cargo_HQ_V3_ruins_F","Land_Cargo_HQ_V3_F",2500],
	["Land_Cargo_HQ_V4_ruins_F","Land_Cargo_HQ_V4_F",2500]
];
OT_allRepairableRuins = [];
{
	_x params ["_ruin"];
	OT_allRepairableRuins pushback _ruin;
}foreach(OT_repairableRuins);

OT_loadingMessages = ["Adding Hidden Agendas","Adjusting Bell Curves","Aesthesizing Industrial Areas","Aligning Covariance Matrices","Applying Feng Shui Shaders","Applying Theatre Soda Layer","Asserting Packed Exemplars","Don't answer the phone","Binding Sapling Root System","Breeding Fauna","Building Data Trees","Bureacritizing Bureaucracies","Calculating Inverse Probability Matrices","Calculating Llama Expectoration Trajectory","Calibrating Blue Skies","Charging Ozone Layer","Coalescing Cloud Formations","Please help me","Collecting Meteor Particles","Dad is that you?","Compressing Fish Files","Help I'm trapped in here","Concatenating Sub-Contractors","Please have a seat","Debarking Ark Ramp","Debunching Unionized Commercial Services","Deciding What Message to Display Next","Decomposing Singular Values","Decrementing Tectonic Plates","Deleting Ferry Routes","Depixelating Inner Mountain Surface Back Faces","Depositing Slush Funds","Destabilizing Economic Indicators","Hiding from my Ex","Deunionizing Bulldozers","Dicing Models","Diluting Livestock Nutrition Variables","RUUUUNNNN!!!","Exposing Flash Variables to Streak System","Extracting Resources","Factoring Pay Scale","I can see you","Flood-Filling Ground Water","Flushing Pipe Network","Gathering Particle Sources","Generating Jobs","Gesticulating Mimes","Graphing Whale Migration","Hiding Willio Webnet Mask","Working without sleep","Increasing Accuracy of RCI Simulators","Increasing Magmafacation","Call the cops","Initializing Robotic Click-Path AI","Inserting Sublimated Messages","Integrating Curves","Integrating Illumination Form Factors","Integrating Population Graphs","Beating Devs","Lecturing Errant Subsystems","Waking up AI","Modeling Object Components","Mopping Occupant Leaks","Normalizing Power","Obfuscating Quigley Matrix","Overconstraining Dirty Industry Calculations","Partitioning City Grid Singularities","Perturbing Matrices","Pixellating Nude Patch","Polishing Water Highlights","Populating Lot Templates","Ohhh the colors","Prioritizing Landmarks","Projecting Law Enforcement Pastry Intake","Realigning Alternate Time Frames","Reconfiguring User Mental Processes","Relaxing Splines","Removing Road Network Speed Bumps","Removing Texture Gradients","Removing Vehicle Avoidance Behavior","Resolving GUID Conflict","Looking through help wanted","Retracting Phong Shader","Retrieving from Back Store","Reverse Engineering Image Consultant","Routing Neural Network Infanstructure","Scattering Rhino Food Sources","Turn around, I dare you","Searching for Llamas","Jeffery did not kill himself","Sequencing Particles","Setting Advisor ","Put pants on freak","Setting Universal Physical Constants","Sonically Enhancing Occupant-Free Timber","Speculating Stock Market Indices","Splatting Transforms","Stratifying Ground Layers","Sub-Sampling Water Data","Synthesizing Gravity","Synthesizing Wavelets","Looking in your window","Unable to Reveal Current Activity","Weathering Buildings","Zeroing Crime Network"];

OT_cigsArray = ["EWK_Cigar1", "EWK_Cigar2", "EWK_Cig1", "EWK_Cig2", "EWK_Cig3", "EWK_Cig4", "EWK_Glasses_Cig1", "EWK_Glasses_Cig2", "EWK_Glasses_Cig3", "EWK_Glasses_Cig4", "EWK_Glasses_Shemag_GRE_Cig6", "EWK_Glasses_Shemag_NB_Cig6", "EWK_Glasses_Shemag_tan_Cig6", "EWK_Cig5", "EWK_Glasses_Cig5", "EWK_Cig6", "EWK_Glasses_Cig6", "EWK_Shemag_GRE_Cig6", "EWK_Shemag_NB_Cig6", "EWK_Shemag_tan_Cig6", "murshun_cigs_cig0", "murshun_cigs_cig1", "murshun_cigs_cig2", "murshun_cigs_cig3", "murshun_cigs_cig4"];

// Weapon mags to delete or not copy on transfers.
OT_noCopyMags = ["ACE_PreloadedMissileDummy","rhs_mag_30Rnd_556x45_M200_Stanag"];//added M200

OT_autoSave_time = 0;
OT_autoSave_last_time = (10*60);
OT_cleanup_civilian_loop = (5*60);
zeusToggle = true;

if(isServer) then {
	missionNamespace setVariable ["OT_varInitDone",true,true];
};
