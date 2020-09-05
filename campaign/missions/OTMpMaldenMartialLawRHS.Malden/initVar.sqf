OT_nation = "Malden";
OT_saveName = "Overthrow.maldenmartiallawRHS.001";

OT_connectedRegions = [];
OT_tutorial_backstoryText = "Welcome to Malden, called the “Gibraltar of the North Sea” by many. This group of islands has been occupied by the French since the 19th century and has become one of NATO's primary strongholds in the North Sea. Never considered a sovereign part of France by the government, Malden has never had any representation in French politics. Since the global financial crisis of 2008 this remote island has experienced great hardship and rising unemployment levels which lately has erupted into civil unrest and protests, especially in the less populated western towns.";
OT_startDate = [2035,7,14,8,00];

OT_startCameraPos = [2717.66,7298.14,15];
OT_startCameraTarget = [3016.03,7171.53,0];

sleep 5; enableDynamicSimulationSystem false;

OT_faction_NATO = "BLU_F";
OT_spawnFaction = "IND_G_F"; //This faction will have a rep in spawn town

OT_flag_NATO = "Flag_NATO_F";
OT_flag_CRIM = "Flag_Syndikat_F";
OT_flag_IND = "Flag_Green_F";
OT_flagImage = "\overthrow_main\ui\flags\flag_malden.paa";
OT_flagMarker = "flag_Malden";

OT_populationMultiplier = 1.5; //Used to tweak populations per map

//Building templates
//To generate these templates:
//1. Open Arma editor, choose VR map
//2. Add the building you want to make a template for, set its location and rotation to 0,0,0
//3. Add furniture objects
//4. Add a player (any unit), Play the Scenario
//5. Run this in console: [getPos player, 50, true] call BIS_fnc_ObjectsGrabber
//6. Copy the results, paste them here and remove any extraneous items (ie the building, Logic, babe_helper, Signs)

OT_shopBuildings = [
	["Land_FuelStation_01_shop_F",[]],
	["Land_Supermarket_01_malden_F",[]],
	["Land_i_Shop_02_b_whiteblue_F",[]],
	["Land_i_Shop_02_b_blue_F",[]],
	["Land_i_Shop_02_b_white_F",[]],
	["Land_i_Shop_02_b_yellow_F",[]],
	["Land_i_Shop_02_b_brown_F",[]],
	["Land_i_Shop_02_b_pink_F",[]],
	["Land_i_Shop_01_V1_F",[]],
	["Land_i_Shop_01_V2_F",[]],
	["Land_i_Shop_01_V3_F",[]],
	["Land_i_Shop_02_V1_F",[]],
	["Land_i_Shop_02_V2_F",[]],
	["Land_i_Shop_02_V3_F",[]],
	["Land_u_Shop_01_V1_F",[]]
];
OT_carShopBuildings = [
	["Land_CarService_F",[]],
	["Land_FuelStation_01_workshop_F",[]]
];

OT_spawnHouseBuildings = [
	["Land_i_House_Small_02_V3_F",[
		["Land_Workbench_01_F",[0.422365,-2.93311,1.33514e-005],89.1796,1,0,[0.0707555,-0.045636],"","",true,false],
		["B_CargoNet_01_ammo_F",[2.96868,-3.4149,-0.000998974],274.319,1,0,[-0.0734381,-0.00559268],"","",true,false],
		["Land_CampingChair_V2_F",[6.42002,0.930474,-0.00055027],306.773,1,0,[0.0259758,-0.0438728],"","",true,false],
		["OfficeTable_01_new_F",[7.29855,0.671871,-0.000957489],90.8264,1,0,[0.0732282,0.00350965],"","",true,false],
		["Land_MetalCase_01_small_F",[7.55139,-0.896939,-0.000999928],180.336,1,0,[-0.000593387,0.0740168],"","",true,false],
		["MapBoard_Malden_F",[6.96861,-3.35597,-0.00204754],124.136,1,0,[-0.432052,0.0141808],"","",true,false]
	]],
	["Land_i_House_Small_01_V1_F",[
		["Land_CampingChair_V2_F",[-2.00791,-0.211978,-0.00100136],75.8503,1,0,[0.022539,-0.0114463],"","",true,false],
		["Land_Workbench_01_F",[1.65763,-1.24741,-0.000997543],91.3756,1,0,[0.0229665,-0.00433881],"","",true,false],
		["Land_MetalCase_01_small_F",[-0.306345,-2.43122,-0.000999928],273.431,1,0,[-0.023886,0.00338747],"","",true,false],
		["OfficeTable_01_new_F",[-3.08169,-0.384802,-0.000931263],272.791,1,0,[-0.014387,0.00257657],"","",true,false],
		["B_CargoNet_01_ammo_F",[-2.57652,1.60605,-0.000860691],178.671,1,0,[0.00422383,0.014867],"","",true,false],
		["MapBoard_Malden_F",[-2.27482,-2.02853,-0.00323391],186.099,1,0,[-0.32275,0.0238763],"","",true,false]
	]],
	["Land_i_House_Small_02_V1_F",[
		["Land_CampingChair_V2_F",[2.72735,-0.895135,-0.00100136],302.103,1,0,[-0.0617418,-0.0404584],"","",true,false],
		["B_CargoNet_01_ammo_F",[-0.714056,-3.07988,-0.000998974],178.671,1,0,[0.00188926,0.0737346],"","",true,false],
		["MapBoard_Malden_F",[3.50028,0.874905,-0.00322294],37.1437,1,0,[-0.279863,-0.0596738],"","",true,false],
		["Land_MetalCase_01_small_F",[0.982029,-3.79341,-0.000999928],273.431,1,0,[-0.0738068,-0.00428971],"","",true,false],
		["Land_Workbench_01_F",[-2.92792,-2.7105,0.000536442],91.3753,1,0,[0.0736082,-0.0652566],"","",true,false],
		["OfficeTable_01_new_F",[3.90667,-1.18242,-0.000998497],90.3396,1,0,[0.073833,0.00039788],"","",true,false]
	]],
	["Land_i_Stone_Shed_01_c_raw_F",[
		["Land_Workbench_01_F",[0.968353,1.35952,-0.0010004],359.863,1,0,[8.03237e-005,8.29454e-006],"","",true,false],
		["Land_CampingChair_V2_F",[-1.62816,-1.49349,-0.00100231],302.103,1,0,[0.000843664,-0.00114803],"","",true,false],
		["Land_MetalCase_01_small_F",[-0.33441,-2.31198,-0.0010004],358.071,1,0,[-0.00013816,0.000140726],"","",true,false],
		["MapBoard_Malden_F",[2.10242,-0.642465,-0.00120115],89.6873,1,0,[-0.287063,-0.0553665],"","",true,false],
		["OfficeTable_01_new_F",[-1.43929,-2.27635,-0.0010004],178.44,1,0,[-3.35184e-005,-0.000104592],"","",true,false],
		["B_CargoNet_01_ammo_F",[-3.19192,1.25919,-0.0010004],178.671,1,0,[0.000205842,-5.3443e-005],"","",true,false]
	]],
	["Land_i_House_Small_02_b_pink_F",[
		["Land_CampingChair_V2_F",[1.72455,-0.0298837,-0.00100136],302.103,1,0,[-0.0617344,-0.0404361],"","",true,false],
		["OfficeTable_01_new_F",[2.9727,-0.416259,-0.000999928],90.5124,1,0,[0.0738427,0.000563688],"","",true,false],
		["MapBoard_Malden_F",[2.58588,1.49394,-0.00262403],50.5513,1,0,[-0.354544,0.062951],"","",true,false],
		["B_CargoNet_01_ammo_F",[-1.80542,-2.49787,-0.000999451],178.671,1,0,[0.00191379,0.0737812],"","",true,false],
		["Land_MetalCase_01_small_F",[2.0748,-3.03065,-0.0010004],268.88,1,0,[-0.0738829,0.00152898],"","",true,false],
		["Land_Workbench_01_F",[-3.98405,-1.62702,-0.000986099],90.17,1,0,[0.0722691,0.000653508],"","",true,false]
	]],
	["Land_i_House_Small_02_b_yellow_F",[
		["B_CargoNet_01_ammo_F",[-0.964324,-1.91721,-0.000999451],178.671,1,0,[0.00191379,0.0737812],"","",true,false],
		["Land_CampingChair_V2_F",[2.56565,0.550778,-0.00100183],302.103,1,0,[-0.0617346,-0.0404546],"","",true,false],
		["Land_Workbench_01_F",[-3.14295,-1.04636,-0.000986099],90.17,1,0,[0.0722691,0.000653508],"","",true,false],
		["Land_MetalCase_01_small_F",[2.91589,-2.44999,-0.0010004],268.88,1,0,[-0.0739227,0.00156035],"","",true,false],
		["OfficeTable_01_new_F",[3.8138,0.164404,-0.000999928],90.5124,1,0,[0.073847,0.000565327],"","",true,false],
		["MapBoard_Malden_F",[3.42698,2.07461,-0.00262403],50.5513,1,0,[-0.354544,0.062951],"","",true,false]
	]],
	["Land_i_House_Small_01_b_yellow_F",[
		["Land_CampingChair_V2_F",[0.63229,-2.12329,-0.00100183],302.104,1,0,[-0.021655,-0.00971956],"","",true,false],
		["OfficeTable_01_new_F",[0.85961,-3.03564,-0.000998974],179.455,1,0,[0.0050481,0.0236674],"","",true,false],
		["Land_MetalCase_01_small_F",[-0.94163,-3.13796,-0.0010004],268.88,1,0,[-0.0235406,0.00526238],"","",true,false],
		["MapBoard_Malden_F",[-2.91395,1.0081,-0.00321293],314.351,1,0,[-0.342398,-0.0130663],"","",true,false],
		["B_CargoNet_01_ammo_F",[-3.16059,-2.50339,-0.000973225],178.671,1,0,[0.00403157,0.0230836],"","",true,false],
		["Land_Workbench_01_F",[3.3632,4.90751,-0.00218058],359.006,1,0,[0.28369,-0.0320319],"","",true,false]
	]],
	["Land_i_House_Small_01_V3_F",[
		["Land_CampingChair_V2_F",[0.4172,-2.35178,-0.00100183],302.104,1,0,[-0.021655,-0.00971956],"","",true,false],
		["OfficeTable_01_new_F",[0.644521,-3.26412,-0.000999451],179.455,1,0,[0.00487344,0.0235223],"","",true,false],
		["MapBoard_Malden_F",[-3.12907,0.779639,-0.00321102],314.351,1,0,[-0.344706,-0.0132965],"","",true,false],
		["Land_MetalCase_01_small_F",[-1.15672,-3.36645,-0.0010004],268.88,1,0,[-0.0235469,0.00527448],"","",true,false],
		["B_CargoNet_01_ammo_F",[-3.37566,-2.7319,-0.000956535],178.671,1,0,[0.00282558,0.0214067],"","",true,false],
		["Land_Workbench_01_F",[3.14664,4.64755,0.0714483],359.196,1,0,[-0.959254,0.265599],"","",true,false]
	]]
];

//Interactable items that spawn in your house
OT_item_Storage = "B_CargoNet_01_ammo_F"; //Your spawn ammobox
OT_item_Map = "Mapboard_Malden_F";
OT_item_Tent = "eo_dome_tent_grn";
OT_item_Safe = "Land_MetalCase_01_small_F";
OT_item_Workbench = "Land_Workbench_01_F"; //Crafting Table
OT_item_Desk = "OfficeTable_01_new_F";
//OT_item_Radio = "Land_PortableLongRangeRadio_F";


//Animals to spawn (@todo: spawn animals)
OT_allLowAnimals = [""];
OT_allHighAnimals = [""];
OT_allFarmAnimals = [""];
OT_allVillageAnimals = [""];
OT_allTownAnimals = [""];

OT_fuelPumps = ["Land_FuelStation_02_pump_F","Land_FuelStation_01_pump_F","Land_fs_feed_F","Land_FuelStation_Feed_F","Land_FuelStation_01_pump_malevil_F"];

OT_churches = ["Land_Church_03_F","Land_Church_01_F","Land_Church_02_F","Land_Temple_Native_01_F"];

OT_language_local = "LanguageENGFRE_F";
OT_identity_local = "Head_Euro";

OT_language_western = "LanguageENG_F";
OT_identity_western = "Head_Euro";

OT_language_eastern = "LanguageCHI_F";
OT_identity_eastern = "Head_Asian";

OT_face_localBoss = "TanoanBossHead";


OT_civType_gunDealer = "C_man_p_fugitive_F";
OT_civType_local = "C_man_1";
OT_civType_carDealer = "C_man_w_worker_F";
OT_civType_shopkeeper = "C_man_w_worker_F";
OT_civType_worker = "C_man_UtilityWorker_01_F";
OT_civType_priest = "C_man_w_worker_F";
OT_vehTypes_civ = [""]; //populated automatically, but you can add more here and they will appear in streets
OT_vehType_distro = "C_Van_01_box_F";
OT_vehType_ferry = "C_Boat_Transport_02_F";
OT_vehType_service = "C_Offroad_01_repair_F";
OT_vehTypes_civignore = ["C_Hatchback_01_F","C_Hatchback_01_sport_F",OT_vehType_service]; //Civs cannot drive these vehicles for whatever reason

OT_legal = ["ACE_FakePrimaryWeapon","eo_flashlight","rhs_weap_rsp30_white","rhs_weap_rsp30_green","rhs_weap_rsp30_red","rhs_weap_tr8","ACE_VMH3","ACE_VMM3","ACE_Flashlight_Maglite_ML300L",""];//Gear made legal

OT_illegalHeadgear = ["rhs_6b26_green","rhs_6b26_bala_green","rhs_6b26_ess_green","rhs_6b26_ess_bala_green","rhs_6b26","rhs_6b26_bala","rhs_6b26_ess","rhs_6b26_ess_bala","rhs_6b27m_green","rhs_6b27m_green_bala","rhs_6b27m_green_ess","rhs_6b27m_green_ess_bala","rhs_6b27m_digi","rhs_6b27m_digi_bala","rhs_6b27m_digi_ess","rhs_6b27m_digi_ess_bala","rhs_6b27m","rhs_6b27m_bala","rhs_6b27m_ess","rhs_6b27m_ess_bala","rhs_6b27m_ml","rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ML_ess_bala","rhs_6b28_green","rhs_6b28_green_bala","rhs_6b28_green_ess","rhs_6b28_green_ess_bala","rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala","rhs_6b28_flora","rhs_6b28_flora_bala","rhs_6b28_flora_ess","rhs_6b28_flora_ess_bala","rhs_6b47","rhs_6b47_bala","rhs_6b47_ess","rhs_6b47_ess_bala","rhs_6b7_1m","rhs_6b7_1m_bala2","rhs_6b7_1m_bala1","rhs_6b7_1m_emr","rhs_6b7_1m_bala2_emr","rhs_6b7_1m_bala1_emr","rhs_6b7_1m_emr_ess","rhs_6b7_1m_emr_ess_bala","rhs_6b7_1m_ess","rhs_6b7_1m_ess_bala","rhs_6b7_1m_flora","rhs_6b7_1m_bala1_flora","rhs_6b7_1m_bala2_flora","rhs_6b7_1m_flora_ns3","rhs_6b7_1m_olive","rhs_6b7_1m_bala1_olive","rhs_6b7_1m_bala2_olive","rhsusf_ach_bare","rhsusf_ach_bare_des","rhsusf_ach_bare_des_ess","rhsusf_ach_bare_des_headset","rhsusf_ach_bare_des_headset_ess","rhsusf_ach_bare_ess","rhsusf_ach_bare_headset","rhsusf_ach_bare_headset_ess","rhsusf_ach_bare_semi","rhsusf_ach_bare_semi_ess","rhsusf_ach_bare_semi_headset","rhsusf_ach_bare_semi_headset_ess","rhsusf_ach_bare_tan","rhsusf_ach_bare_tan_ess","rhsusf_ach_bare_tan_headset","rhsusf_ach_bare_tan_headset_ess","rhsusf_ach_bare_wood","rhsusf_ach_bare_wood_ess","rhsusf_ach_bare_wood_headset","rhsusf_ach_bare_wood_headset_ess","rhsusf_ach_helmet_DCU","rhsusf_ach_helmet_DCU_early","rhsusf_ach_helmet_DCU_early_rhino","rhsusf_ach_helmet_M81","rhsusf_ach_helmet_ocp","rhsusf_ach_helmet_ocp_alt","rhsusf_ach_helmet_ESS_ocp","rhsusf_ach_helmet_ESS_ocp_alt","rhsusf_ach_helmet_headset_ocp","rhsusf_ach_helmet_headset_ocp_alt","rhsusf_ach_helmet_headset_ess_ocp","rhsusf_ach_helmet_headset_ess_ocp_alt","rhsusf_ach_helmet_camo_ocp","rhsusf_ach_helmet_ocp_norotos","rhsusf_ach_helmet_ucp","rhsusf_ach_helmet_ucp_alt","rhsusf_ach_helmet_ESS_ucp","rhsusf_ach_helmet_ESS_ucp_alt","rhsusf_ach_helmet_headset_ucp","rhsusf_ach_helmet_headset_ucp_alt","rhsusf_ach_helmet_headset_ess_ucp","rhsusf_ach_helmet_headset_ess_ucp_alt","rhsusf_ach_helmet_ucp_norotos","rhsusf_cvc_green_helmet","rhsusf_cvc_green_alt_helmet","rhsusf_cvc_green_ess","rhsusf_cvc_helmet","rhsusf_cvc_alt_helmet","rhsusf_cvc_ess","H_HelmetHBK_headset_F","H_HelmetHBK_chops_F","H_HelmetHBK_ear_F","H_HelmetHBK_F","rhs_altyn_novisor","rhs_altyn_novisor_bala","rhs_altyn_novisor_ess_bala","rhs_altyn_novisor_ess","rhs_altyn_visordown","rhs_altyn","rhs_altyn_bala","H_HelmetSpecO_blk","H_HelmetSpecO_ghex_F","H_HelmetSpecO_ocamo","H_HelmetAggressor_F","H_HelmetAggressor_cover_F","H_HelmetAggressor_cover_taiga_F","H_Beret_gen_F","rhs_beret_mp2","rhs_beret_mp1","rhsgref_un_beret","rhs_beret_vdv3","rhs_beret_vdv2","rhs_beret_vdv1","rhs_beret_milp","H_Beret_EAF_01_F","H_Beret_02","H_Beret_Colonel","H_HelmetB","H_HelmetB_black","H_HelmetB_camo","H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_sand","H_HelmetB_snakeskin","H_HelmetB_tna_F","H_HelmetB_plain_wdl","H_HelmetCrew_O_ghex_F","H_Tank_black_F","H_Tank_eaf_F","H_HelmetCrew_I","H_HelmetCrew_O","H_HelmetCrew_I_E","H_HelmetCrew_B","H_HelmetLeaderO_ghex_F","H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo","H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint2","H_HelmetSpecB_paint1","H_HelmetSpecB_sand","H_HelmetSpecB_snakeskin","H_HelmetB_Enh_tna_F","H_HelmetSpecB_wdl","rhsusf_opscore_aor1","rhsusf_opscore_aor1_pelt","rhsusf_opscore_aor1_pelt_nsw","rhsusf_opscore_aor2","rhsusf_opscore_aor2_pelt","rhsusf_opscore_aor2_pelt_nsw","rhsusf_opscore_bk","rhsusf_opscore_bk_pelt","rhsusf_opscore_coy_cover","rhsusf_opscore_coy_cover_pelt","rhsusf_opscore_fg","rhsusf_opscore_fg_pelt","rhsusf_opscore_fg_pelt_cam","rhsusf_opscore_fg_pelt_nsw","rhsusf_opscore_mc_cover","rhsusf_opscore_mc_cover_pelt","rhsusf_opscore_mc_cover_pelt_nsw","rhsusf_opscore_mc_cover_pelt_cam","rhsusf_opscore_mc","rhsusf_opscore_mc_pelt","rhsusf_opscore_mc_pelt_nsw","rhsusf_opscore_paint","rhsusf_opscore_paint_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_paint_pelt_nsw_cam","rhsusf_opscore_rg_cover","rhsusf_opscore_rg_cover_pelt","rhsusf_opscore_ut","rhsusf_opscore_ut_pelt","rhsusf_opscore_ut_pelt_cam","rhsusf_opscore_ut_pelt_nsw","rhsusf_opscore_ut_pelt_nsw_cam","rhsusf_opscore_mar_fg","rhsusf_opscore_mar_fg_pelt","rhsusf_opscore_mar_ut","rhsusf_opscore_mar_ut_pelt","H_CrewHelmetHeli_I","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I_E","H_CrewHelmetHeli_B","H_PilotHelmetHeli_I","H_PilotHelmetHeli_O","H_PilotHelmetHeli_I_E","H_PilotHelmetHeli_B","rhsusf_hgu56p_black","rhsusf_hgu56p_mask_black","rhsusf_hgu56p_mask_black_skull","rhsusf_hgu56p_visor_black","rhsusf_hgu56p_visor_mask_black","rhsusf_hgu56p_visor_mask_Empire_black","rhsusf_hgu56p_visor_mask_black_skull","rhsusf_hgu56p_green","rhsusf_hgu56p_mask_green","rhsusf_hgu56p_mask_green_mo","rhsusf_hgu56p_visor_green","rhsusf_hgu56p_visor_mask_green","rhsusf_hgu56p_visor_mask_green_mo","rhsusf_hgu56p","rhsusf_hgu56p_mask","rhsusf_hgu56p_mask_mo","rhsusf_hgu56p_mask_skull","rhsusf_hgu56p_visor","rhsusf_hgu56p_visor_mask","rhsusf_hgu56p_visor_mask_mo","rhsusf_hgu56p_visor_mask_skull","rhsusf_hgu56p_pink","rhsusf_hgu56p_mask_pink","rhsusf_hgu56p_visor_pink","rhsusf_hgu56p_visor_mask_pink","rhsusf_hgu56p_saf","rhsusf_hgu56p_mask_saf","rhsusf_hgu56p_visor_saf","rhsusf_hgu56p_visor_mask_saf","rhsusf_hgu56p_mask_smiley","rhsusf_hgu56p_visor_mask_smiley","rhsusf_hgu56p_tan","rhsusf_hgu56p_mask_tan","rhsusf_hgu56p_visor_tan","rhsusf_hgu56p_visor_mask_tan","rhsusf_hgu56p_usa","rhsusf_hgu56p_visor_usa","rhsusf_hgu56p_white","rhsusf_hgu56p_visor_white","rhsusf_ihadss","RHS_jetpilot_usaf","rhsgref_6b27m_ttsko_digi","rhsgref_6b27m_ttsko_forest","rhsgref_6b27m_ttsko_mountain","rhsgref_6b27m_ttsko_urban","H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass","H_HelmetB_light_sand","H_HelmetB_light_snakeskin","H_HelmetB_Light_tna_F","H_HelmetB_light_wdl","rhsusf_lwh_helmet_M1942","rhsusf_lwh_helmet_marpatd","rhsusf_lwh_helmet_marpatd_ess","rhsusf_lwh_helmet_marpatd_headset","rhsusf_lwh_helmet_marpatwd","rhsusf_lwh_helmet_marpatwd_blk_ess","rhsusf_lwh_helmet_marpatwd_headset_blk2","rhsusf_lwh_helmet_marpatwd_headset_blk","rhsusf_lwh_helmet_marpatwd_headset","rhsusf_lwh_helmet_marpatwd_ess","rhsgref_helmet_M1_liner","rhsgref_helmet_M1_bare","rhsgref_helmet_M1_bare_alt01","rhsgref_helmet_M1_painted","rhsgref_helmet_M1_painted_alt01","rhsgref_helmet_m1940","rhsgref_helmet_m1940_camo01","rhsgref_helmet_m1940_alt1","rhsgref_helmet_m1940_camo01_alt1","rhsgref_helmet_m1940_winter_alt1","rhsgref_helmet_m1940_winter","rhsgref_helmet_m1942","rhsgref_helmet_m1942_camo01","rhsgref_helmet_m1942_alt1","rhsgref_helmet_m1942_camo01_alt1","rhsgref_helmet_m1942_winter_alt1","rhsgref_helmet_m1942_winter","rhsgref_helmet_m1942_heergreycover","rhsgref_helmet_m1942_heersplintercover","rhsgref_helmet_m1942_heermarshcover","rhsgref_helmet_m1942_heerwintercover","rhsgref_M56","rhsusf_mich_bare","rhsusf_mich_bare_alt","rhsusf_mich_bare_headset","rhsusf_mich_bare_norotos","rhsusf_mich_bare_norotos_alt","rhsusf_mich_bare_norotos_alt_headset","rhsusf_mich_bare_norotos_arc","rhsusf_mich_bare_norotos_arc_alt","rhsusf_mich_bare_norotos_arc_alt_headset","rhsusf_mich_bare_norotos_arc_headset","rhsusf_mich_bare_norotos_headset","rhsusf_mich_bare_semi","rhsusf_mich_bare_alt_semi","rhsusf_mich_bare_semi_headset","rhsusf_mich_bare_norotos_semi","rhsusf_mich_bare_norotos_alt_semi","rhsusf_mich_bare_norotos_alt_semi_headset","rhsusf_mich_bare_norotos_arc_semi","rhsusf_mich_bare_norotos_arc_alt_semi","rhsusf_mich_bare_norotos_arc_alt_semi_headset","rhsusf_mich_bare_norotos_arc_semi_headset","rhsusf_mich_bare_norotos_semi_headset","rhsusf_mich_bare_tan","rhsusf_mich_bare_alt_tan","rhsusf_mich_bare_tan_headset","rhsusf_mich_bare_norotos_tan","rhsusf_mich_bare_norotos_alt_tan","rhsusf_mich_bare_norotos_alt_tan_headset","rhsusf_mich_bare_norotos_arc_tan","rhsusf_mich_bare_norotos_arc_alt_tan","rhsusf_mich_bare_norotos_arc_alt_tan_headset","rhsusf_mich_bare_norotos_tan_headset","rhsusf_mich_helmet_marpatd","rhsusf_mich_helmet_marpatd_alt","rhsusf_mich_helmet_marpatd_alt_headset","rhsusf_mich_helmet_marpatd_headset","rhsusf_mich_helmet_marpatd_norotos","rhsusf_mich_helmet_marpatd_norotos_arc","rhsusf_mich_helmet_marpatd_norotos_arc_headset","rhsusf_mich_helmet_marpatd_norotos_headset","rhsusf_mich_helmet_marpatwd","rhsusf_mich_helmet_marpatwd_alt","rhsusf_mich_helmet_marpatwd_alt_headset","rhsusf_mich_helmet_marpatwd_headset","rhsusf_mich_helmet_marpatwd_norotos","rhsusf_mich_helmet_marpatwd_norotos_arc","rhsusf_mich_helmet_marpatwd_norotos_arc_headset","rhsusf_mich_helmet_marpatwd_norotos_headset","H_MilCap_gen_F","H_HelmetIA","rhsgref_helmet_pasgt_3color_desert","rhsgref_helmet_pasgt_3color_desert_rhino","rhsgref_helmet_pasgt_altis_lizard","rhsgref_helmet_pasgt_erdl","rhsgref_helmet_pasgt_erdl_rhino","rhsgref_helmet_pasgt_flecktarn","rhsgref_helmet_pasgt_olive","rhsgref_helmet_pasgt_woodland","rhsgref_helmet_pasgt_un","rhsgref_helmet_pasgt_woodland_rhino","H_PilotHelmetFighter_I","H_PilotHelmetFighter_O","H_PilotHelmetFighter_I_E","H_PilotHelmetFighter_B","rhsusf_protech_helmet","rhsusf_protech_helmet_ess","rhsusf_protech_helmet_rhino","rhsusf_protech_helmet_rhino_ess","H_HelmetO_ghex_F","H_HelmetO_ocamo","H_HelmetO_oucamo","H_HelmetO_ViperSP_ghex_F","H_HelmetO_ViperSP_hex_F","rhs_ssh68","rhsgref_ssh68_emr","rhsgref_ssh68_ttsko_digi","rhsgref_ssh68_ttsko_forest","rhsgref_ssh68_ttsko_mountain","rhsgref_ssh68_ttsko_dark","rhsgref_ssh68_un","rhsgref_ssh68_vsr","H_HelmetB_TI_tna_F","rhs_zsh7a_mike","rhs_zsh7a_mike_green","rhs_zsh7a_mike_alt","rhs_zsh7a_mike_green_alt","rhs_zsh7a","rhs_zsh7a_alt","FRITH_ruin_modhat_fabaaf","FRITH_ruin_modhat_fabdes","FRITH_ruin_modhat_fabdpm","FRITH_ruin_modhat_fabflw","FRITH_ruin_modhat_fabmtp","FRITH_ruin_modhat_fabjap","FRITH_ruin_modhat_fabrus","FRITH_ruin_modhat_fabtar","FRITH_ruin_modhat_ltr","FRITH_ruin_modhat_ltrpntblk","FRITH_ruin_modhat_ltrpntgrn","FRITH_ruin_modhat_ltrpntred","FRITH_ruin_modhat_ltrpntwht","FRITH_ruin_modhat_metgrn","FRITH_ruin_modhat_mettan"];

OT_illegalUniform = ["rhs_uniform_abu","rhs_uniform_acu_ocp","rhs_uniform_acu_oefcp","rhs_uniform_acu_ucp","rhs_uniform_acu_ucpd","rhs_uniform_bdu_erdl","U_C_CBRN_Suit_01_Blue_F","U_B_CBRN_Suit_01_MTP_F","U_B_CBRN_Suit_01_Tropic_F","U_C_CBRN_Suit_01_White_F","U_B_CBRN_Suit_01_Wdl_F","U_I_CBRN_Suit_01_AAF_F","U_I_E_CBRN_Suit_01_EAF_F","U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_I_E_Uniform_01_officer_F","U_I_E_Uniform_01_shortsleeve_F","U_I_G_resistanceLeader_F","U_I_E_Uniform_01_sweater_F","U_I_E_Uniform_01_tanktop_F","U_B_T_Soldier_F","U_B_T_Soldier_AR_F","U_B_CombatUniform_mcam_wdl_f","U_B_CombatUniform_tshirt_mcam_wdL_f","U_I_CombatUniform","U_I_OfficerUniform","U_I_CombatUniform_shortsleeve","U_I_E_Uniform_01_F","rhs_uniform_cu_ocp","rhs_uniform_cu_ocp_101st","rhs_uniform_cu_ocp_10th","rhs_uniform_cu_ocp_1stcav","rhs_uniform_cu_ocp_82nd","rhs_uniform_cu_ucp","rhs_uniform_cu_ucp_101st","rhs_uniform_cu_ucp_10th","rhs_uniform_cu_ucp_1stcav","rhs_uniform_cu_ucp_82nd","U_B_CTRG_1","U_B_CTRG_3","U_B_CTRG_2","U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_3_F","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_urb_1_F","U_B_CTRG_Soldier_urb_3_F","U_B_CTRG_Soldier_urb_2_F","rhs_uniform_emr_des_patchless","rhs_uniform_vdv_emr_des","rhs_uniform_emr_patchless","rhs_uniform_msv_emr","rhs_uniform_vdv_emr","U_O_T_Soldier_F","U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo","rhs_uniform_flora_patchless","rhs_uniform_flora_patchless_alt","rhs_uniform_flora","rhs_uniform_rva_flora","rhs_uniform_vdv_flora","rhs_uniform_vmf_flora","rhs_uniform_vmf_flora_subdued","rhs_uniform_FROG01_d","rhs_uniform_FROG01_wd","U_I_FullGhillie_ard","U_O_FullGhillie_ard","U_B_FullGhillie_ard","U_O_T_FullGhillie_tna_F","U_B_T_FullGhillie_tna_F","U_I_FullGhillie_lsh","U_O_FullGhillie_lsh","U_B_FullGhillie_lsh","U_I_FullGhillie_sard","U_O_FullGhillie_sard","U_B_FullGhillie_sard","rhs_uniform_g3_aor2","rhs_uniform_g3_blk","rhs_uniform_g3_m81","rhs_uniform_g3_mc","rhs_uniform_g3_rgr","rhs_uniform_g3_tan","U_B_GEN_Commander_F","U_B_GEN_Soldier_F","U_O_T_Sniper_F","U_B_T_Sniper_F","U_I_GhillieSuit","U_O_GhillieSuit","U_B_GhillieSuit","rhs_uniform_gorka_1_a","rhs_uniform_gorka_1_b","rhsgref_uniform_gorka_1_f","rhs_uniform_gorka_r_g","rhs_uniform_gorka_r_y","U_I_HeliPilotCoveralls","U_I_E_Uniform_01_coveralls_F","U_B_HeliPilotCoveralls","rhs_uniform_mvd_izlom","U_O_officer_noInsignia_hex_F","rhsgref_uniform_para_ttsko_mountain","rhsgref_uniform_para_ttsko_oxblood","rhsgref_uniform_para_ttsko_urban","rhs_uniform_m88_patchless","rhsgref_uniform_vsr","rhsgref_uniform_ttsko_forest","rhsgref_uniform_ttsko_mountain","rhsgref_uniform_ttsko_urban","rhsgref_uniform_3color_desert","rhsgref_uniform_alpenflage","rhsgref_uniform_altis_lizard","rhsgref_uniform_altis_lizard_olive","rhsgref_uniform_dpm","rhsgref_uniform_dpm_olive","rhsgref_uniform_ERDL","rhsgref_uniform_flecktarn","rhsgref_uniform_flecktarn_full","rhsgref_uniform_og107","rhsgref_uniform_og107_erdl","rhsgref_uniform_olive","rhsgref_uniform_tigerstripe","rhsgref_uniform_reed","rhsgref_uniform_woodland","rhsgref_uniform_woodland_olive","rhs_uniform_mflora_patchless","rhs_uniform_vdv_mflora","U_O_T_Officer_F","U_O_OfficerUniform_ocamo","U_I_pilotCoveralls","U_O_PilotCoveralls","U_B_PilotCoveralls","U_O_SpecopsUniform_ocamo","U_B_CombatUniform_mcam_vest","U_B_T_Soldier_SL_F","U_B_CombatUniform_vest_mcam_wdl_f","U_O_V_Soldier_Viper_F","U_O_V_Soldier_Viper_hex_F","rhsgref_uniform_specter","U_I_C_Soldier_Camo_F","U_Tank_green_F"];

OT_illegalVests = ["rhs_6b13_Flora","rhs_6b13_Flora_6sh92","rhs_6b13_Flora_6sh92_headset_mapcase","rhs_6b13_Flora_6sh92_radio","rhs_6b13_Flora_6sh92_vog","rhs_6b13_Flora_crewofficer","rhs_6b13_EMR_6sh92","rhs_6b13_EMR_6sh92_radio","rhs_6b13_EMR_6sh92_vog","rhs_6b13_EMR_6sh92_headset_mapcase","rhs_6b13_EMR","rhs_6b13","rhs_6b13_6sh92","rhs_6b13_6sh92_headset_mapcase","rhs_6b13_6sh92_radio","rhs_6b13_6sh92_vog","rhs_6b13_crewofficer","rhs_6b23","rhs_6b23_6sh116_od","rhs_6b23_6sh116_vog_od","rhs_6b23_6sh92","rhs_6b23_6sh92_headset","rhs_6b23_6sh92_headset_mapcase","rhs_6b23_6sh92_radio","rhs_6b23_6sh92_vog","rhs_6b23_6sh92_vog_headset","rhs_6b23_crewofficer","rhs_6b23_crew","rhs_6b23_engineer","rhs_6b23_medic","rhs_6b23_rifleman","rhs_6b23_sniper","rhs_6b23_vydra_3m","rhs_6b23_digi","rhs_6b23_6sh116","rhs_6b23_6sh116_vog","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92_spetsnaz2","rhs_6b23_digi_6sh92_headset","rhs_6b23_digi_6sh92_headset_spetsnaz","rhs_6b23_digi_6sh92_headset_mapcase","rhs_6b23_digi_6sh92_radio","rhs_6b23_digi_6sh92_Spetsnaz","rhs_6b23_digi_6sh92_vog","rhs_6b23_digi_6sh92_Vog_Spetsnaz","rhs_6b23_digi_6sh92_vog_headset","rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz","rhs_6b23_digi_crewofficer","rhs_6b23_digi_crew","rhs_6b23_digi_engineer","rhs_6b23_digi_medic","rhs_6b23_digi_rifleman","rhs_6b23_digi_sniper","rhs_6b23_digi_vydra_3m","rhs_6b23_6sh116_flora","rhs_6b23_6sh116_vog_flora","rhsgref_6b23_khaki_medic","rhsgref_6b23_khaki_nco","rhsgref_6b23_khaki_officer","rhsgref_6b23_khaki_rifleman","rhsgref_6b23_khaki_sniper","rhsgref_6b23_khaki","rhs_6b23_ML","rhs_6b23_ML_6sh92","rhs_6b23_ML_6sh92_headset","rhs_6b23_ML_6sh92_headset_mapcase","rhs_6b23_ML_6sh92_radio","rhs_6b23_ML_6sh92_vog","rhs_6b23_ML_6sh92_vog_headset","rhs_6b23_ML_crewofficer","rhs_6b23_ML_crew","rhs_6b23_ML_engineer","rhs_6b23_ML_medic","rhs_6b23_ML_rifleman","rhs_6b23_ML_sniper","rhs_6b23_ML_vydra_3m","rhsgref_6b23_ttsko_digi_medic","rhsgref_6b23_ttsko_digi_nco","rhsgref_6b23_ttsko_digi_officer","rhsgref_6b23_ttsko_digi_rifleman","rhsgref_6b23_ttsko_digi_sniper","rhsgref_6b23_ttsko_digi","rhsgref_6b23_ttsko_forest_rifleman","rhsgref_6b23_ttsko_forest","rhsgref_6b23_ttsko_mountain_medic","rhsgref_6b23_ttsko_mountain_nco","rhsgref_6b23_ttsko_mountain_officer","rhsgref_6b23_ttsko_mountain_rifleman","rhsgref_6b23_ttsko_mountain_sniper","rhsgref_6b23_ttsko_mountain","rhs_6b43","rhs_6b5_khaki","rhs_6b5_rifleman_khaki","rhs_6b5_medic_khaki","rhs_6b5_officer_khaki","rhs_6b5_sniper_khaki","rhs_6b5","rhs_6b5_rifleman","rhs_6b5_medic","rhs_6b5_officer","rhs_6b5_sniper","rhs_6b5_ttsko","rhs_6b5_rifleman_ttsko","rhs_6b5_medic_ttsko","rhs_6b5_officer_ttsko","rhs_6b5_sniper_ttsko","rhs_6b5_vsr","rhs_6b5_rifleman_vsr","rhs_6b5_medic_vsr","rhs_6b5_officer_vsr","rhs_6b5_sniper_vsr","rhs_6sh46","rhs_6sh92","rhs_6sh92_headset","rhs_6sh92_radio","rhs_6sh92_vog","rhs_6sh92_vog_headset","rhs_6sh92_digi","rhs_6sh92_digi_headset","rhs_6sh92_digi_radio","rhs_6sh92_digi_vog","rhs_6sh92_digi_vog_headset","rhs_6sh92_vsr","rhs_6sh92_vsr_headset","rhs_6sh92_vsr_radio","rhs_6sh92_vsr_vog","rhs_6sh92_vsr_vog_headset","V_PlateCarrierGL_blk","V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrierGL_tna_F","V_PlateCarrierGL_wdl","V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier1_tna_F","V_PlateCarrier1_wdl","V_PlateCarrier2_blk","V_PlateCarrier2_rgr","V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_tna_F","V_PlateCarrier2_wdl","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_tna_F","V_PlateCarrierSpec_wdl","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_DeckCrew_blue_F","V_DeckCrew_brown_F","V_DeckCrew_green_F","V_DeckCrew_red_F","V_DeckCrew_violet_F","V_DeckCrew_white_F","V_DeckCrew_yellow_F","eo_deckvest_1","eo_deckvest_2","eo_eodvest_3","eo_eodvest_2","eo_eodvest_1","eo_platecarrier_1","eo_platecarrier_4","eo_platecarrier_2","eo_platecarrier_5","eo_platecarrier_3","eo_ravenvest_1","eo_tacvest_4","eo_tacvest_2","eo_tacvest_1","eo_tacvest_3","V_EOD_blue_F","V_EOD_IDAP_blue_F","V_EOD_coyote_F","V_EOD_olive_F","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_TacVest_gen_F","rhsusf_iotv_ocp_Grenadier","rhsusf_iotv_ucp_Grenadier","rhsusf_iotv_ocp_Medic","rhsusf_iotv_ucp_Medic","rhsusf_iotv_ocp","rhsusf_iotv_ocp_Repair","rhsusf_iotv_ucp_Repair","rhsusf_iotv_ocp_Rifleman","rhsusf_iotv_ucp_Rifleman","rhsusf_iotv_ocp_SAW","rhsusf_iotv_ucp_SAW","rhsusf_iotv_ocp_Squadleader","rhsusf_iotv_ucp_Squadleader","rhsusf_iotv_ocp_Teamleader","rhsusf_iotv_ucp_Teamleader","rhsusf_iotv_ucp","rhsusf_mbav","rhsusf_mbav_grenadier","rhsusf_mbav_light","rhsusf_mbav_mg","rhsusf_mbav_medic","rhsusf_mbav_rifleman","V_CarrierRigKBT_01_heavy_EAF_F","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_light_EAF_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_Olive_F","rhsgref_otv_digi","rhsgref_otv_khaki","rhsusf_plateframe_sapi","rhsusf_plateframe_grenadier","rhsusf_plateframe_light","rhsusf_plateframe_machinegunner","rhsusf_plateframe_marksman","rhsusf_plateframe_medic","rhsusf_plateframe_rifleman","rhsusf_plateframe_teamleader","rhsusf_spc","rhsusf_spc_corpsman","rhsusf_spc_crewman","rhsusf_spc_iar","rhsusf_spc_light","rhsusf_spc_mg","rhsusf_spc_marksman","rhsusf_spc_patchless","rhsusf_spc_patchless_radio","rhsusf_spc_rifleman","rhsusf_spc_sniper","rhsusf_spc_squadleader","rhsusf_spc_teamleader","rhsusf_spcs_ocp_crewman","rhsusf_spcs_ucp_crewman","rhsusf_spcs_ocp_grenadier","rhsusf_spcs_ucp_grenadier","rhsusf_spcs_ocp_machinegunner","rhsusf_spcs_ucp_machinegunner","rhsusf_spcs_ocp_medic","rhsusf_spcs_ucp_medic","rhsusf_spcs_ocp","rhsusf_spcs_ocp_rifleman_alt","rhsusf_spcs_ucp_rifleman_alt","rhsusf_spcs_ocp_rifleman","rhsusf_spcs_ucp_rifleman","rhsusf_spcs_ocp_saw","rhsusf_spcs_ucp_saw","rhsusf_spcs_ocp_sniper","rhsusf_spcs_ucp_sniper","rhsusf_spcs_ocp_squadleader","rhsusf_spcs_ucp_squadleader","rhsusf_spcs_ocp_teamleader_alt","rhsusf_spcs_ucp_teamleader_alt","rhsusf_spcs_ocp_teamleader","rhsusf_spcs_ucp_teamleader","rhsusf_spcs_ucp","V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","rhsgref_TacVest_ERDL","V_TacVest_khk","V_TacVest_oli","V_TacVest_blk_POLICE","V_I_G_resistanceLeader_F","V_PlateCarrier_Kerry","rhs_vydra_3m","FRITH_ruin_vestia_lite_ghm","FRITH_ruin_vestia_lite_grn","FRITH_ruin_vestia_lite_ltr","FRITH_ruin_vestia_lite_nja","FRITH_ruin_vestia_lite_tar","FRITH_ruin_vestia_ghm","FRITH_ruin_vestia_grn","FRITH_ruin_vestia_ltr","FRITH_ruin_vestia_nja","FRITH_ruin_vestia_tar","FRITH_ruin_vestiaGL_ghmchk","FRITH_ruin_vestiaGL_ghm","FRITH_ruin_vestiaGL_grnmtp","FRITH_ruin_vestiaGL_grn","FRITH_ruin_vestiaGL_ltrmtp","FRITH_ruin_vestiaGL_ltr","FRITH_ruin_vestiaGL_njadpm","FRITH_ruin_vestiaGL_nja","FRITH_ruin_vestiaGL_tartar","FRITH_ruin_vestiaGL_tar"];

OT_clothes_locals = ["U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_C_Poor_1","U_C_Poor_2","eo_bandit","eo_bandit_1","eo_survivor","eo_survivor_1","eo_hoodie_red","eo_hoodie_grey","eo_hoodie_blue","eo_hoodie_bandit","eo_hoodie_kabeiroi","eo_retro_red","eo_retro_grey","eo_retro_blue","eo_retro_bandit","eo_retro_kabeiroi","eo_shirt_bandit","eo_shirt_kabeiroi","eo_shirt_stripe","eo_shirt_check","eo_shirt_plainblu","eo_shirt_plainblk","eo_shirt_checkbrn","eo_shirt_checkblk","U_FRITH_RUIN_SDR_Tshirt_blk_cyp","U_FRITH_RUIN_SDR_Tshirt_blk_boy","U_FRITH_RUIN_SDR_Tshirt_blk_drj","U_FRITH_RUIN_SDR_Tshirt_oli","U_FRITH_RUIN_SDR_Tshirt_oli_bet","U_FRITH_RUIN_SDR_Tshirt_cry","U_FRITH_RUIN_SDR_Tshirt_wht","U_FRITH_RUIN_SDR_Tshirt_wht_zap","U_FRITH_RUIN_SDR_Tshirt_wht_stk","U_FRITH_RUIN_SDR_Tshirt_wht_fpk","U_FRITH_RUIN_TSH_blk_cyp","U_FRITH_RUIN_TSH_blk_boy","U_FRITH_RUIN_TSH_blk_drj","U_FRITH_RUIN_TSH_oli","U_FRITH_RUIN_TSH_oli_bet","U_FRITH_RUIN_TSH_cry","U_FRITH_RUIN_TSH_wht","U_FRITH_RUIN_TSH_wht_zap","U_FRITH_RUIN_TSH_wht_stk","U_FRITH_RUIN_TSH_wht_fpk","U_FRITH_RUIN_WKR_dark","U_FRITH_RUIN_WKR_tan","U_FRITH_RUIN_WKR_lite"];
OT_clothes_expats = ["U_I_C_Soldier_Bandit_5_F","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Man_casual_6_F","U_C_Man_casual_4_F","U_C_Man_casual_5_F"];
OT_clothes_tourists = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_stripped","U_C_E_LooterJacket_01_F","U_I_G_Story_Protagonist_F"];
OT_clothes_priest = "U_C_Man_casual_2_F";
OT_clothes_port = "U_Marshal";
OT_clothes_shops = ["U_C_Man_casual_2_F","U_C_Man_casual_3_F","U_C_Man_casual_1_F","U_C_E_LooterJacket_01_F"];
OT_clothes_carDealers = ["U_Marshal","U_C_Mechanic_01_F"];
OT_clothes_harbor = ["U_C_man_sport_1_F","U_C_man_sport_2_F","U_C_man_sport_3_F"];
OT_clothes_guerilla = ["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_FRITH_RUIN_coffdpm","U_FRITH_RUIN_coffgrn","U_FRITH_RUIN_cofftan","U_FRITH_RUIN_sdr_fab_rs","U_FRITH_RUIN_sdr_fab","U_FRITH_RUIN_sdr_fabbrn_rs","U_FRITH_RUIN_sdr_fabbrn","U_FRITH_RUIN_sdr_fabdpm_rs","U_FRITH_RUIN_sdr_fabdpm","U_FRITH_RUIN_sdr_fabgrn_rs","U_FRITH_RUIN_sdr_fabgrn","U_FRITH_RUIN_sdr_fabkak_rs","U_FRITH_RUIN_sdr_fabkak","U_FRITH_RUIN_sdr_fabmtp_rs","U_FRITH_RUIN_sdr_fabmtp","U_FRITH_RUIN_sdr_faboli_rs","U_FRITH_RUIN_sdr_faboli","U_FRITH_RUIN_sdr_fabrus_rs","U_FRITH_RUIN_sdr_fabrus","U_FRITH_RUIN_sdr_fabtan_rs","U_FRITH_RUIN_sdr_fabtan","U_FRITH_RUIN_sdr_ltrdrk_rs","U_FRITH_RUIN_sdr_ltrdrk","U_FRITH_RUIN_sdr_ltrred_rs","U_FRITH_RUIN_sdr_ltrred","U_FRITH_RUIN_sdr_ltr_rs","U_FRITH_RUIN_sdr_ltr","eo_camo","eo_camo_1","eo_diamond","eo_diamond_1","eo_independant","eo_independant_1","eo_paramilitary_1","eo_shirt_tigerblu","eo_shirt_tigerblk","U_FRITH_RUIN_SDR_snip_crow","U_FRITH_RUIN_SDR_snip_hawk","U_FRITH_RUIN_offdpm","U_FRITH_RUIN_offgrn","U_FRITH_RUIN_offtan"];
OT_clothes_police = ["U_I_G_resistanceLeader_F","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_I_C_Soldier_Para_4_F"];
OT_vest_police = "V_TacVest_blk_POLICE";
OT_hat_police = "H_Cap_police";
OT_clothes_mob = "U_I_C_Soldier_Camo_F";

//NATO stuff
OT_NATO_HMG = "B_HMG_01_high_F";
OT_NATO_Vehicles_AirGarrison = [
	["B_VTOL_01_vehicle_F",1],
	["B_VTOL_01_infantry_F",1],
	["B_Heli_Light_01_armed_F",1],
	["B_Heli_Transport_03_unarmed_F",2],
	["B_Heli_Light_01_F",3],
	["B_Heli_Attack_01_F",1],
	["B_Heli_Transport_01_F",2],
	["RHS_AH64D_wd",1],
	["RHS_AH1Z",1],
  ["rhsgref_cdf_b_Mi24D",1],
  ["RHS_AH64D",1],
  ["rhsusf_CH53E_USMC",2],
  ["rhsgref_b_mi24g_CAS",1],
  ["RHS_AH64DGrey",1],
  ["RHS_UH1Y",1],
  ["RHS_A10",1],
  ["RHS_UH60M_d",2],
  ["rhs_uh1h_hidf_gunship",2]
];

OT_NATO_Vehicles_JetGarrison = [
	["B_Plane_CAS_01_F",1],
	["rhsgref_cdf_b_su25",1],
	["rhsgref_cdf_b_mig29s",1],
	["rhs_l39_cdf_b_cdf",1],
	["rhs_l159_cdf_b_CDF",1]
];

OT_NATO_Vehicles_StaticAAGarrison = [
	"B_static_AA_F",
	"B_static_AA_F"
]; //Added to every airfield

if(OT_hasJetsDLC) then {
	OT_NATO_Vehicles_JetGarrison pushback ["B_Plane_Fighter_01_F",1];
	OT_NATO_Vehicles_JetGarrison pushback ["B_Plane_Fighter_01_Stealth_F",1];
	OT_NATO_Vehicles_StaticAAGarrison pushback "B_Radar_System_01_F";
	OT_NATO_Vehicles_StaticAAGarrison pushback "B_SAM_System_03_F";
};

OT_NATO_StaticGarrison_LevelOne = ["B_HMG_01_high_F","rhsgref_hidf_m113a3_m2","rhsgref_hidf_m113a3_mk19"];
OT_NATO_StaticGarrison_LevelTwo = ["B_HMG_01_high_F","B_HMG_01_high_F","B_GMG_01_high_F","B_MRAP_01_hmg_F","rhsgref_hidf_m113a3_m2","rhsgref_hidf_m113a3_mk19","RHS_M252_D"];
OT_NATO_StaticGarrison_LevelThree = ["B_Static_AT_F","B_Static_AA_F","B_HMG_01_high_F","B_HMG_01_high_F","B_GMG_01_high_F","B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_LSV_01_armed_F","RHS_M119_D"];

OT_NATO_CommTowers = ["Land_TTowerBig_1_F","Land_TTowerBig_2_F"];

OT_NATO_Unit_Sniper = ["B_T_Sniper_F","rhsusf_usmc_marpat_d_sniper_m110","rhsusf_usmc_marpat_d_sniper","rhsusf_usmc_marpat_d_sniper_m107"];OT_NATO_Unit_Sniper = selectRandom OT_NATO_Unit_Sniper;
OT_NATO_Unit_Spotter = ["B_T_Spotter_F","rhsusf_usmc_marpat_d_spotter","rhsusf_usmc_marpat_d_jfo","rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_d_grenadier"];OT_NATO_Unit_Spotter = selectRandom OT_NATO_Unit_Spotter;
OT_NATO_Unit_AA_spec = ["B_T_Soldier_AA_F","rhsusf_usmc_marpat_d_stinger","rhsusf_usmc_marpat_d_javelin","rhsusf_usmc_marpat_d_smaw"];OT_NATO_Unit_AA_spec = selectRandom OT_NATO_Unit_AA_spec;
OT_NATO_Unit_AA_ass = ["B_T_Soldier_AAA_F","rhsusf_usmc_marpat_d_javelin_asssistant"];OT_NATO_Unit_AA_ass = selectRandom OT_NATO_Unit_AA_ass;
OT_NATO_Unit_HVT = ["B_T_Officer_F","rhsusf_usmc_marpat_d_officer","rhsusf_usmc_marpat_d_fso"];OT_NATO_Unit_HVT = selectRandom OT_NATO_Unit_HVT;
OT_NATO_Unit_TeamLeader = ["B_T_Soldier_TL_F","rhsusf_usmc_marpat_d_teamleader"];OT_NATO_Unit_TeamLeader = selectRandom OT_NATO_Unit_TeamLeader;
OT_NATO_Unit_SquadLeader = ["B_T_Soldier_SL_F","rhsusf_usmc_marpat_d_squadleader"];OT_NATO_Unit_SquadLeader = selectRandom OT_NATO_Unit_SquadLeader;

OT_NATO_Unit_PoliceCommander = "B_Gen_Commander_F";
OT_NATO_Unit_Police = ["B_Gen_Soldier_F","rhsgref_hidf_teamleader","rhsgref_hidf_autorifleman","rhsgref_hidf_medic","rhsgref_hidf_grenadier","rhsgref_hidf_marksman","rhsgref_hidf_rifleman","rhsgref_hidf_sniper"];OT_NATO_Unit_Police = selectrandom OT_NATO_Unit_Police;
OT_NATO_Vehicle_PoliceHeli = ["RHS_MELB_MH6M","B_Heli_Light_01_F","rhs_uh1h_hidf_unarmed","rhs_uh1h_hidf"];OT_NATO_Vehicle_PoliceHeli = selectRandom OT_NATO_Vehicle_PoliceHeli;
OT_NATO_Vehicle_Quad = "B_Quadbike_01_F";
OT_NATO_Vehicle_Police = ["B_GEN_Offroad_01_gen_F","B_GEN_Offroad_01_covered_F","rhsgref_hidf_m113a3_unarmed","rhsgref_hidf_M998_2dr","rhsgref_hidf_M998_2dr_fulltop","rhsgref_hidf_M998_2dr_halftop"];OT_NATO_Vehicle_Police = selectRandom OT_NATO_Vehicle_Police;
OT_NATO_Vehicle_Transport = ["B_Truck_01_transport_F","B_Truck_01_covered_F","rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy"];
OT_NATO_Vehicle_Transport_Light = "B_LSV_01_unarmed_F";
OT_NATO_Vehicles_PoliceSupport = ["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_LSV_01_armed_F","rhsusf_m1043_w_m2","rhsusf_m1043_w_s_m2","rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025_mk19","rhsgref_hidf_m113a3_m2","rhsgref_hidf_m113a3_mk19"];OT_NATO_Vehicles_PoliceSupport =selectRandom OT_NATO_Vehicles_PoliceSupport;
OT_NATO_Vehicles_ReconDrone = "B_UAV_01_F";
OT_NATO_Vehicles_CASDrone = "B_UAV_02_CAS_F";
OT_NATO_Vehicles_AirSupport = ["B_Heli_Attack_01_F","RHS_AH64D_wd","RHS_AH1Z"];
OT_NATO_Vehicles_AirSupport_Small = ["B_Heli_Light_01_armed_F","RHS_MELB_AH6M","rhs_uh1h_hidf_gunship"];
OT_NATO_Vehicles_GroundSupport = ["B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_LSV_01_armed_F","rhsusf_CGRCAT1A2_M2_usmc_wd","rhsusf_m109_usarmy","rhsusf_M1220_M2_usarmy_wd"];
OT_NATO_Vehicles_TankSupport = ["B_MBT_01_TUSK_F","B_MBT_01_cannon_F","rhsusf_M1238A1_M2_socom_d"];
OT_NATO_Vehicles_Convoy = ["B_UGV_01_rcws_F","B_MRAP_01_hmg_F","B_LSV_01_armed_F","B_LSV_01_armed_F","B_LSV_01_armed_F"];
OT_NATO_Vehicles_AirWingedSupport = ["B_Plane_CAS_01_F","RHS_A10","rhsgref_cdf_b_su25"];
OT_NATO_Vehicle_AirTransport_Small = "B_Heli_Transport_01_camo_F";
OT_NATO_Vehicle_AirTransport = ["B_Heli_Transport_03_F","B_Heli_Transport_01_F","B_Heli_Transport_01_F","RHS_UH60M","RHS_UH60M_d"];
OT_NATO_Vehicle_AirTransport_Large = "B_Heli_Transport_03_F";
OT_NATO_Vehicle_Boat_Small = "B_Boat_Armed_01_minigun_F";
OT_NATO_Vehicles_APC = ["B_APC_Wheeled_01_cannon_F"];

OT_NATO_Sandbag_Curved = "Land_BagFence_01_round_green_F";
OT_NATO_Barrier_Small = "Land_HBarrier_01_line_5_green_F";
OT_NATO_Barrier_Large = "Land_HBarrier_01_wall_6_green_F";

OT_NATO_Mortar = "B_Mortar_01_F";

OT_NATO_Vehicle_HVT = "B_MRAP_01_F";

OT_NATO_Vehicle_CTRGTransport = "B_CTRG_Heli_Transport_01_tropic_F";

OT_NATO_weapons_Police = [];
OT_NATO_weapons_Pistols = ["hgun_Pistol_heavy_01_F","hgun_ACPC2_F","hgun_P07_F","hgun_Rook40_F"];

//Criminal stuff
OT_CRIM_Unit = "C_man_p_fugitive_F";
OT_CRIM_Clothes = ["U_I_C_Soldier_Bandit_3_F","U_BG_Guerilla3_1","U_C_HunterBody_grn","U_I_G_Story_Protagonist_F","eo_camo","eo_camo_1","eo_diamond","eo_diamond_1","eo_independant","eo_independant_1","eo_paramilitary_1","eo_shirt_tigerblu","eo_shirt_tigerblk","U_FRITH_RUIN_SDR_snip_bld"];
OT_CRIM_Goggles = ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"];
OT_CRIM_Weapons = ["arifle_AK12_F","arifle_AKM_F","arifle_AKM_F","arifle_AKM_F"];
OT_CRIM_Pistols = ["hgun_Pistol_heavy_01_F","hgun_ACPC2_F","hgun_P07_F","hgun_Rook40_F"];
OT_CRIM_Launchers = ["launch_RPG32_F","launch_RPG7_F","launch_RPG7_F","launch_RPG7_F"];

OT_piers = ["Land_PierConcrete_01_4m_ladders_F","Land_PierWooden_01_platform_F","Land_PierWooden_01_hut_F","Land_PierWooden_02_hut_F"]; //spawns dudes that sell boats n stuff
OT_offices = ["Land_MultistoryBuilding_01_F","Land_MultistoryBuilding_04_F"];
OT_portBuildings = ["Land_Warehouse_01_F","Land_Warehouse_02_F","Land_ContainerLine_01_F","Land_ContainerLine_02_F","Land_ContainerLine_03_F"];
OT_airportTerminals = ["Land_Airport_01_controlTower_F"];
OT_portBuilding = "Land_WarehouseShelter_01_F";
OT_policeStation = "Land_Cargo_House_V3_F";
OT_policeStationRuins = ["Land_Cargo_House_V3_ruins_F"];
OT_warehouse = "Land_Warehouse_03_F";
OT_warehouseRuins = ["Land_Warehouse_03_ruins_F"];
OT_barracks = "Land_Barracks_01_grey_F";
OT_workshopBuilding = "Land_cargo_house_slum_F";
OT_refugeeCamp = "Land_Caravan_01_green_F";//changed by Gerhart aka PapaGee
OT_trainingCamp = "Land_CanvasCover_02_F";
OT_hardwareStore = "Land_dp_smallFactory_F";
OT_radarBuilding = "Land_Radar_Small_F";

//Custom recruitables per mission
OT_Recruitables = [
    //Rifleman
	["I_soldier_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Holosight_lush_F",["10Rnd_Mk14_762x51_Mag",10],[],""],
        [],
        ["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
        ["eo_bandit",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2]]],
        ["FRITH_ruin_vestia_lite_ltr",[["HandGrenade",2,1],["11Rnd_45ACP_Mag",4,11],["MiniGrenade",4,1]]],
        ["eo_legstrappack_2",[["10Rnd_Mk14_762x51_Mag",6,10]]],
        "FRITH_ruin_modhat_ltr","eo_bandana_2",
        [],
        ["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Autorifleman
	["I_Soldier_AR_F",[
        ["rhs_weap_MP44","","","",["rhsgref_30Rnd_792x33_SmE_StG",30],[],""],
        [],
        ["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
        ["eo_diamond_1",[["FirstAidKit",1],["ACE_fieldDressing",5],["ACE_epinephrine",2],["ACE_morphine",2],["SmokeShell",2,1],
        ["rhs_mag_rgn",2,1],["rhsgref_25Rnd_792x33_SmE_StG",3,25],["11Rnd_45ACP_Mag",1,11]]],
		["FRITH_ruin_vestia_lite_grn",[["HandGrenade",2,1],["11Rnd_45ACP_Mag",4,11],["MiniGrenade",4,1]]],
		["eo_messengerbag_1",[["rhsgref_25Rnd_792x33_SmE_StG",3,25],["rhs_grenade_nbhgr39_mag",1,1],["rhs_grenade_nbhgr39B_mag",1,1]]],
		"FRITH_ruin_modhat_ltrpntred","eo_balaclava_1",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Rifleman (AT)
	["I_Soldier_LAT_F",[
        ["rhsusf_weap_MP7A2_desert","","","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		["rhs_weap_rpg7","","","",["rhs_rpg7_PG7V_mag",1],[],""],
		["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
		["eo_paramilitary_1",[["FirstAidKit",1],["ACE_fieldDressing",5],["ACE_epinephrine",2],["ACE_morphine",2],["SmokeShell",2,1],["11Rnd_45ACP_Mag",2,11],["rhsusf_mag_40Rnd_46x30_FMJ",1,40]]],
		["FRITH_ruin_vestiaGL_ltr",[["11Rnd_45ACP_Mag",2,11],["rhsusf_mag_40Rnd_46x30_FMJ",9,40]]],
		["eo_field",[["rhs_grenade_nbhgr39_mag",1,1],["rhs_grenade_nbhgr39B_mag",1,1],["RPG7_F",2,1],["rhs_rpg7_OG7V_mag",3,1]]],
		"FRITH_ruin_modhat_mettan","eo_balaclava_1",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Marksman
	["I_Soldier_M_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Hamr",["10Rnd_Mk14_762x51_Mag",10],[],""],
		[],
		["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
		["eo_shirt_tigerblk",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["11Rnd_45ACP_Mag",5,11]]],
		["FRITH_ruin_vestia_lite_tar",[["20Rnd_762x51_Mag",6,20]]],
		["eo_legstrappack_4",[["20Rnd_762x51_Mag",2,20],["HandGrenade",1,1],["SmokeShell",1,1]]],
		"FRITH_ruin_modhat_fabrus","eo_balaclavaLow_3",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Sniper
	["I_Sniper_F",[
        ["rhs_weap_m38_rail","","","optic_KHS_old",["rhsgref_5Rnd_762x54_m38",5],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["U_FRITH_RUIN_SDR_snip_hawk",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],
		["FRITH_ruin_vestia_lite_ghm",[["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["rhsgref_5Rnd_762x54_m38",15,5],["SmokeShell",2,1],["HandGrenade",2,1]]],
		["eo_legstrappack_2",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhsgref_5Rnd_762x54_m38",5,5]]],
		"FRITH_ruin_modhat_fabrus","eo_balaclavaLow_3",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Spotter
	["I_Spotter_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Holosight_blk_F",["10Rnd_Mk14_762x51_Mag",10],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_camo",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["10Rnd_Mk14_762x51_Mag",7,10]]],
		["FRITH_ruin_vestia_lite_grn",[["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["SmokeShell",2,1],["HandGrenade",2,1],["10Rnd_Mk14_762x51_Mag",3,10]]],
		["eo_legstrappack_4",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",4,1]]],
		"FRITH_ruin_modhat_ltrpntgrn","eo_bandana_3",
		["Binocular","","","",[],[],""],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Squad Leader
	["I_Soldier_SL_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Holosight_blk_F",["10Rnd_Mk14_762x51_Mag",10],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_independant_1",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["10Rnd_Mk14_762x51_Mag",7,10]]],
		["FRITH_ruin_vestia_lite_grn",[["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["SmokeShell",2,1],["HandGrenade",2,1],["10Rnd_Mk14_762x51_Mag",3,10]]],
		["eo_legstrappack_4",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",4,1]]],
		"FRITH_ruin_modhat_ltrpntwht","eo_bandana_3",
		["Binocular","","","",[],[],""],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Medic
	["I_Medic_F",[
        ["rhsusf_weap_MP7A2_desert","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_hoodie_blue",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		["FRITH_ruin_vestia_lite_grn",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",4,1],["rhsusf_mag_40Rnd_46x30_FMJ",5,40]]],
		["eo_field",[["ACE_bloodIV",4],["ACE_epinephrine",8],["ACE_fieldDressing",10]]],
		"FRITH_ruin_modhat_fabjap","eo_respirator_1",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //AT
	["I_Soldier_AT_F",[
        ["rhsusf_weap_MP7A2_desert","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		["rhs_weap_rpg7","","","",["rhs_rpg7_PG7V_mag",1],[],""],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_survivor_1",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["rhsusf_mag_40Rnd_46x30_FMJ",5,40]]],
		["FRITH_ruin_vestiaGL_ltr",[["rhsusf_mag_40Rnd_46x30_FMJ",5,40],["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",4,1],["rhs_rpg7_TBG7V_mag",2,1]]],
		"FRITH_ruin_modhat_mettan","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //AA
	["I_Soldier_AA_F",[
        ["rhsusf_weap_MP7A2_desert","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		["rhs_weap_rpg7","","","",["rhs_rpg7_PG7V_mag",1],[],""],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_shirt_stripe",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["rhsusf_mag_40Rnd_46x30_FMJ",2,40]]],
		["FRITH_ruin_vestiaGL_ltr",[["rhsusf_mag_40Rnd_46x30_FMJ",5,40],["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",2,1],["rhs_rpg7_PG7VR_mag",2,1],["rhs_rpg7_type69_airburst_mag",3,1]]],
		"FRITH_ruin_modhat_metgrn","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Assistant AT
	["I_Soldier_AAT_F",[
        ["rhsusf_weap_MP7A2_aor1","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_hoodie_grey",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17]]],
		["FRITH_ruin_vestiaGL_ltr",[["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",8,1]]],
		"FRITH_ruin_modhat_fabtar","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Assistant AA
	["I_Soldier_AAA_F",[
        ["rhsusf_weap_MP7A2_aor1","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_shirt_plainblk",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17]]],
		["FRITH_ruin_vestiaGL_ltr",[["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",2,1]]],
		"FRITH_ruin_modhat_fabrus","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Grenadier
	["I_Soldier_GL_F",[
        ["rhsusf_weap_MP7A2_aor1","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhs_weap_M320","","","",["rhs_mag_M441_HE",1],[],""],
		["eo_hoodie_kabeiroi",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_40Rnd_46x30_FMJ",4,40]]],
		["FRITH_ruin_vestia_lite_nja",[["rhsusf_mag_40Rnd_46x30_FMJ",9,40]]],
		["eo_field",[["rhs_mag_M397_HET",12,1],["rhs_mag_M433_HEDP",10,1],["rhs_mag_m714_White",5,1]]],
		"FRITH_ruin_modhat_mettan","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ]
];
