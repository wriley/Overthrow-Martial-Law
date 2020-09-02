class OT_dialog_main
{
	idd=8001;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;
			text = "";

			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class RscStructuredText_1104: RscOverthrowStructuredText
		{
			idc = 1104;
			text = "";

			x = 0.84 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Mucomo)
		////////////////////////////////////////////////////////
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "closeDialog 0;[] spawn OT_fnc_mapInfoDialog";

			text = "Map Info"; //--- ToDo: Localize;
			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Retrieve information on town stability and more"; //--- ToDo: Localize;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "closeDialog 0;[] spawn OT_fnc_fastTravel";
			text = "Fast Travel"; //--- ToDo: Localize;

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.432 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Instantly travel to various controlled locations"; //--- ToDo: Localize;
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "closeDialog 0;[] spawn OT_fnc_resistanceDialog";
			text = "Resistance"; //--- ToDo: Localize;

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Manage resistance and it's funds"; //--- ToDo: Localize;
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			action = "[] call OT_fnc_manageBusinessDialog";
			text = "Business"; //--- ToDo: Localize;

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Manage businesses owned by the resistance"; //--- ToDo: Localize;
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			action = "call OT_fnc_logisticsDialog";
			text = "Vehicles"; //--- ToDo: Localize;

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "List of all military vehicles and their state"; //--- ToDo: Localize;
		};
		class RscButton_1605: RscOverthrowButton
		{
			idc = 1605;
			action = "closeDialog 0;[] spawn OT_fnc_jobsDialog";
			text = "Jobs"; //--- ToDo: Localize;

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Jobs and tasks currently available"; //--- ToDo: Localize;
		};
		class RscButton_1606: RscOverthrowButton
		{
			idc = 1606;
			action = "closeDialog 0;[] spawn OT_fnc_manageRecruitsDialog;";
			text = "Manage Recruits"; //--- ToDo: Localize;

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Manage recruits in your group"; //--- ToDo: Localize;
		};
		class RscButton_1607: RscOverthrowButton
		{
			idc = 1607;
			action = "closeDialog 0;[] spawn OT_fnc_characterSheetDialog;";
			text = "Character Sheet"; //--- ToDo: Localize;

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.766 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Upgrade your character"; //--- ToDo: Localize;
		};
		class RscButton_1608: RscOverthrowButton
		{
			idc = 1608;
			action = "call OT_fnc_optionsDialog";
			text = "Options"; //--- ToDo: Localize;

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.822 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Persistent save, clear bodies/fog and more"; //--- ToDo: Localize;
		};
		class RscButton_1609: RscOverthrowButton
		{
			idc = 1609;
			action = "closeDialog 0;createDialog 'OT_dialog_place'";
			text = "Place"; //--- ToDo: Localize;

			x = 0.847812 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Place smaller items around houses you own or at friendly bases"; //--- ToDo: Localize;
		};
		class RscButton_1610: RscOverthrowButton
		{
			idc = 1610;
			action = "closeDialog 0;[] spawn OT_fnc_build";
			text = "Build"; //--- ToDo: Localize;

			x = 0.847812 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = "Build structures in towns and at bases"; //--- ToDo: Localize;
		};
		class RscButton_1611: RscOverthrowButton
		{
			idc = 1611;
			action = "[] call OT_fnc_buyBuilding";
			text = ""; //--- ToDo: Localize;

			x = 0.847812 * safezoneW + safezoneX;
			y = 0.822 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "[] call OT_fnc_leaseBuilding";
			text = ""; //--- ToDo: Localize;

			x = 0.847812 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
		};
		class RscButton_1613: RscOverthrowButton
		{
			idc = 1613;
			action = "[] call OT_fnc_setHome";
			text = ""; //--- ToDo: Localize;

			x = 0.926562 * safezoneW + safezoneX;
			y = 0.878 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.042 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
		};
		class RscButton_1614: RscOverthrowButton
		{
			idc = 1614;
			action = "[] spawn OT_fnc_manageArea";
			text = ""; //--- ToDo: Localize;

			x = 0.847812 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscButton_1615: RscOverthrowButton
		{
			idc = 1615;
			action = "(getpos player) call OT_fnc_garrisonDialog";
			text = ""; //--- ToDo: Localize;

			x = 0.926562 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscPicture_1201: RscOverthrowPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.849687 * safezoneW + safezoneX;
			y = 0.488 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.168 * safezoneH;
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.14 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;

			x = 0.847811 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.14 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class RscStructuredText_1102: RscOverthrowStructuredText
		{
			idc = 1102;

			x = 0.847813 * safezoneW + safezoneX;
			y = 0.668 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.14 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class RscStructuredText_1106: RscOverthrowStructuredText
		{
			idc = 1106;
			x = 0.847813 * safezoneW + safezoneX;
			y = 0.108 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
		class RscStructuredText_1150: RscOverthrowStructuredText
		{
			idc = 1150;

			x = 0.185 * safezoneW + safezoneX;
			y = 0.094 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.3 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;
			text = "\overthrow_main\ui\logo_overthrow_ml.paa";

			x = 0.0078125 * safezoneW + safezoneX;
			y = 0.001 * safezoneH + safezoneY;
			w = 0.164062 * safezoneW;
			h = 0.196 * safezoneW;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
	};
};