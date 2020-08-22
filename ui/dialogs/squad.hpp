class OT_dialog_squad
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

		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Assign Vehicle"; //--- ToDo: Localize;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Assigns vehicle you are looking at to squad"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_squadAssignVehicle;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Get In"; //--- ToDo: Localize;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Orders squad to board assigned vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_squadGetIn;";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Get Out"; //--- ToDo: Localize;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Orders squad to disembark vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_squadGetOut;";
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Get In My Vehicle"; //--- ToDo: Localize;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Orders squad to board your vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_squadGetInMyVehicle;";
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