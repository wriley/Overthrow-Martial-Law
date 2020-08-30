class OT_dialog_jobs
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Jeduvu)
		////////////////////////////////////////////////////////

		class RscListbox_1500: RscOverthrowListbox
		{
			idc = 1500;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "_this call OT_fnc_displayJobDetails";
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;
			text = "";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "Set Waypoint"; //--- ToDo: Localize;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call OT_fnc_setJobWaypoint;";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Clear Waypoint"; //--- ToDo: Localize;
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call OT_fnc_clearPlayerWaypoint;";
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.265 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscButton_1699: RscOverthrowButton
        {
            idc = 1699;
            text = "X"; //--- ToDo: Localize;
			action = "closeDialog 0";
            x = 0.732031 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
class OT_dialog_joboffer
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Jeduvu)
		////////////////////////////////////////////////////////
		class RscButton_1600: RscOverthrowGreenButton
		{
			idc = 1600;
			text = "Accept"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
			action = "[] call OT_fnc_acceptJob;";
			tooltip = "Accept this job (will appear in Jobs screen for all players)";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Deny"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
			action = "[] call OT_fnc_denyJob;";
			tooltip = "Deny this job (will be offered another job if available)";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
			action = "closeDialog 0";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};