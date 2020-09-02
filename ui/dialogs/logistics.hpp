class OT_dialog_logistics
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.7 * safezoneH;
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
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.301875 * safezoneW;
			h = 0.602 * safezoneH;
			rowHeight = "(((((2560 / safezoneH ) min 1.2) / 1.2) / 25) * (1 + (0.3 / (pixelGrid / 14)))))";
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "_this call OT_fnc_displayLogisticDetails";
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;
			text = "";
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.21 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "Set Waypoint"; //--- ToDo: Localize;
			x = 0.690312 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call OT_fnc_setVehicleWaypoint;";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Clear Waypoint"; //--- ToDo: Localize;
			x = 0.624688 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call OT_fnc_clearPlayerWaypoint;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Delete Vehicle"; //--- ToDo: Localize;
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.1101250‬ * safezoneW;
			h = 0.07 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Completely removes the vehicle without leaving a wreck, only the owner/general can do this."; //--- ToDo: Localize;
			action = "[] call OT_fnc_UnownVehicle;";
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			x = 0.559063 * safezoneW + safezoneX;
			y = 0.458 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.266 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscStructuredText_1101: RscOverthrowStructuredText // title text
		{
			idc = 1101;
			text = "<t align='left' size='1.5'>Resistance Vehicle Garrison</t>";

			x = 0.427812 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.308437 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
            colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1191: RscOverthrowStructuredText // title left filler
		{
			idc = 1102;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
            colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1192: RscOverthrowStructuredText // close bottom filler
		{
			idc = 1103;
			x = 0.729688 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.014 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
            colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1193: RscOverthrowStructuredText // close right filler
		{
			idc = 1104;
			x = 0.755937 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.0065625 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
            colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscButton_1699: RscOverthrowButton
        {
            idc = 1699;
            text = "X"; //--- ToDo: Localize;
			action = "closeDialog 0";
            x = 0.73625 * safezoneW + safezoneX;
            y = 0.15 * safezoneH + safezoneY;
            w = 0.0196875 * safezoneW;
            h = 0.042 * safezoneH;
        };
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



	};
};