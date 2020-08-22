class OT_dialog_command
{
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Xeqozy)
		////////////////////////////////////////////////////////
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Open Arsenal"; //--- ToDo: Localize;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Commands first unit selected to walk to and open the closest ammobox arsenal, uses warehouse if ammobox is at a warehouse"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_orderOpenArsenal;";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Loot"; //--- ToDo: Localize;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Commands all selected units to loot bodies and fill closest container to them"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_orderLoot;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Open Inventory"; //--- ToDo: Localize;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Commands first unit selected to open inventory"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_orderOpenInventory;";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Create Squad"; //--- ToDo: Localize;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Splits selected units off into a new squad"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_createSquad;";
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "call OT_fnc_optionsDialog";

			text = "Options"; //--- ToDo: Localize;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};