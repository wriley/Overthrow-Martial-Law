class CfgMagazines {
    class DemoCharge_Remote_Mag;
    class IEDUrbanSmall_Remote_Mag: DemoCharge_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 4;
        ot_craftRecipe = "[[""OT_Explosivematerials"",1],[""OT_Steel"",1],[""ACE_Cellphone"",2]]";
    };
    class IEDLandSmall_Remote_Mag: IEDUrbanSmall_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 2;
        ot_craftRecipe = "[[""HandGrenade"",1],[""HandGrenade"",1],[""HandGrenade"",1],[""HandGrenade"",1],[""ACE_Cellphone"",2]]";
    };
    class IEDUrbanBig_Remote_Mag: DemoCharge_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 2;
        ot_craftRecipe = "[[""CA_LauncherMagazine"",1],[""CA_LauncherMagazine"",1],[""ACE_Cellphone"",2]]";
    };
    class IEDLandBig_Remote_Mag: IEDUrbanBig_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 2;
        ot_craftRecipe = "[[""OT_Explosivematerials"",1],[""OT_Steel"",1],[""ACE_Cellphone"",2]]";
    };

    class ATMine_Range_Mag;
    class APERSMine_Range_Mag: ATMine_Range_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 4;
        ot_craftRecipe = "[[""OT_Explosivematerials"",1],[""OT_Steel"",1]]";
    };
    class APERSTripMine_Wire_Mag: ATMine_Range_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 4;
        ot_craftRecipe = "[[""HandGrenade"",1],[""HandGrenade"",1],[""HandGrenade"",1],[""HandGrenade"",1],[""ACE_rope12"",1]]";
    };
    class APERSBoundingMine_Range_Mag: ATMine_Range_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 4;
        ot_craftRecipe = "[[""OT_Explosivematerials"",1],[""OT_Steel"",1]]";
    };
};
