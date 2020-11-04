class CfgWeapons {
	class ItemCore;
	class OT_ItemCore: ItemCore {
        type = 4096;//4;
        detectRange = -1;
        simulation = "ItemMineDetector";
    };
	class InventoryItem_Base_F;
    class OT_Ganja: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\ganja_x_ca.paa";
        displayName = "Ganja";
        descriptionShort = "1/2 oz. of the finest bud around.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
	class OT_Blow: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\blow_x_ca.paa";
        displayName = "Blow";
        descriptionShort = "A white powder that turns madmen into world leaders, or world leaders into madmen.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
	class OT_Wood: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\wood_x_ca.paa";
        displayName = "Wood";
        descriptionShort = "A porous and fibrous structural tissue found in the stems and roots of trees and other woody plants.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 100;
        };
    };
	class OT_Lumber: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\wood_x_ca.paa";
        displayName = "Lumber";
        descriptionShort = "Lumber or timber is a type of wood that has been processed into beams and planks, a stage in the process of wood production.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 75;
        };
    };
	class OT_Steel: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\steel_x_ca.paa";
        displayName = "Steel";
        descriptionShort = "An alloy of iron and other elements, primarily carbon, that is widely used in construction and other applications because of its high tensile strength and low cost.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 150;
        };
    };
	class OT_Plastic: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\plastic_x_ca.paa";
        displayName = "Plastic";
        descriptionShort = "A material consisting of any of a wide range of synthetic or semi-synthetic organic compounds that are malleable and can be molded into solid objects.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_Sugarcane: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\cane_x_ca.paa";
        displayName = "Sugarcane";
        descriptionShort = "A perennial grass of the genus Saccharum used to produce Sugar.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };
	class OT_Sugar: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\sugar_x_ca.paa";
        displayName = "Sugar";
        descriptionShort = "The generalized name for sweet, short-chain, soluble carbohydrates, many of which are used in food.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_Grapes: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\cane_x_ca.paa";
        displayName = "Grapes";
        descriptionShort = "A fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis. Can be turned into Wine.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_Wine: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\cane_x_ca.paa";
        displayName = "Wine";
        descriptionShort = "An alcoholic beverage made from grapes, generally Vitis vinifera, fermented without the addition of sugars, acids, enzymes, water, or other nutrients.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };
	class OT_Olives: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\cane_x_ca.paa";
        displayName = "Olives";
        descriptionShort = "A species of small tree in the family Oleaceae, found in the Mediterranean Basin from Portugal to the Levant, the Arabian Peninsula, and southern Asia as far east as China, as well as the Canary Islands, Mauritius, and Altis.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_Fertilizer: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\fertilizer_x_ca.paa";
        displayName = "Fertilizer";
        descriptionShort = "A material of natural or synthetic origin that is applied to soils or to plant tissues (usually leaves) to supply one or more plant nutrients essential to the growth of plants.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_ammo50cal: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\ammo50cal_x_ca.paa";
        displayName = "100 x 50 Cal BMG";
        descriptionShort = "100 Rounds of .50 Calibre 660 grain FMJ xM33 ammunition for use in Static weapons";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
		class OT_Rawsources: OT_ItemCore {
	        scope = 2;
	        picture = "\overthrow_main\ui\items\rawsources_x_ca.paa";
	        displayName = "Raw Sources";
	        descriptionShort = "Raw ores and other natural resources taken from a mining operation.";
	        descriptionUse = "";
	        class ItemInfo: InventoryItem_Base_F {
	            mass = 200;
	        };
	    };
			class OT_Asst_Powder_Chems: OT_ItemCore {
		        scope = 2;
		        picture = "\overthrow_main\ui\items\refinedsources_x_ca.paa";
		        displayName = "Assorted Powder Chems";
		        descriptionShort = "Raw resources mined and reduced to powder form for use in making plastics and explosives.";
		        descriptionUse = "";
		        class ItemInfo: InventoryItem_Base_F {
		            mass = 25;
		        };
		    };
				class OT_Explosivematerials: OT_ItemCore {
			        scope = 2;
			        picture = "\overthrow_main\ui\items\explosivematerial_x_ca.paa";
			        displayName = "Explosive Materials";
			        descriptionShort = "Several different materials used to make explosives";
			        descriptionUse = "";
			        class ItemInfo: InventoryItem_Base_F {
			            mass = 25;
			        };
			    };
					class OT_Coal: OT_ItemCore {
				        scope = 2;
				        picture = "\overthrow_main\ui\items\coal_x_ca.paa";
				        displayName = "Coal";
				        descriptionShort = "Mined from the Earth, coal is primarily used as a fuel.";
				        descriptionUse = "";
				        class ItemInfo: InventoryItem_Base_F {
				            mass = 2;
				        };
				    };


	//Craftable items
	class ACE_ItemCore;
	class ACE_fieldDressing : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 3;
		ot_craftRecipe = "[[""Uniform_Base"",1]]";
	};

	class ACE_packingBandage : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""ACE_fieldDressing"",3]]";
	};

	class ACE_CableTie : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 10;
		ot_craftRecipe = "[[""OT_Plastic"",1]]";
	};

	class ACE_Clacker : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 3;
		ot_craftRecipe = "[[""OT_Steel"",1],[""ACE_Cellphone"",3]]";
	};

	class ACE_DeadManSwitch : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 5;
		ot_craftRecipe = "[[""OT_Steel"",1],[""ACE_Cellphone"",5]]";
	};

	class ACE_EarPlugs : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 5;
		ot_craftRecipe = "[[""OT_Plastic"",1]]";
	};

	class ACE_DefusalKit : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 3;
		ot_craftRecipe = "[[""OT_Steel"",1],[""Toolkit"",1]]";
	};

	class ACE_rope12 : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1]]";
	};

	class ACE_Epinephrine : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 2;
		ot_craftRecipe = "[[""OT_Blow"",1],[""OT_Plastic"",1],[""ACE_SalineIV_500"",1]]";
	};

	class ACE_morphine : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 2;
		ot_craftRecipe = "[[""OT_Ganja"",1],[""OT_Plastic"",1],[""ACE_SalineIV_500"",1]]";
	};

	class ACE_splint : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 3;
		ot_craftRecipe = "[[""OT_Steel"",1],[""Uniform_Base"",1]]";
	};

	class ACE_tourniquet : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 3;
		ot_craftRecipe = "[[""Uniform_Base"",1]]";
	};

//Craftable Vests
	class Vest_NoCamo_Base;
	class FRITH_ruin_vestia_lite_ghm : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_vestia_lite_grn : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_vestia_lite_ltr : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_vestia_lite_nja : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_vestia_lite_tar : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_vestia_ghm : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestia_grn : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestia_ltr : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestia_nja : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestia_tar : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_ghmchk : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_ghm : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_grnmtp : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_grn : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_ltrmtp : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_ltr : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_njadpm : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_nja : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_tartar : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

	class FRITH_ruin_vestiaGL_tar : Vest_NoCamo_Base {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""Uniform_Base"",1],[""Uniform_Base"",1],[""OT_Steel"",2]]";
	};

//Craftable Helmets
	class FRITH_ruin_modhat_fabaaf : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_fabdes : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_fabdpm : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_fabflw : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_fabmtp : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_fabjap : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_fabrus : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_fabtar : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_ltr : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_ltrpntblk : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_ltrpntgrn : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_ltrpntred : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_ltrpntwht : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_metgrn : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class FRITH_ruin_modhat_mettan : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1],[""OT_Steel"",1]]";
	};

	class optic_Hamr : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Binocular"",1],[""ToolKit"",1]]";
	};

	class optic_KHS_old : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Binocular"",1],[""ToolKit"",1]]";
	};

	class optic_Nightstalker : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""rhsusf_ANPVS_14"",1],[""ToolKit"",1],[""Binocular"",1]]";
	};

	class optic_tws : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""ACE_Vector"",1],[""Toolkit"",2]]";
	};
};
