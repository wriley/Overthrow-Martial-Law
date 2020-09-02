class OT_dialog_recruits
{
	idd=8004;
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
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Viwapa)
		////////////////////////////////////////////////////////

		class RscListbox_1500: RscOverthrowListbox
		{
			idc = 1500;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.602 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "_this call recruitSelected";
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.35 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscStructuredText_1101: RscOverthrowStructuredText // title text
		{
			idc = 1101;
			text = "<t align='left' size='2'>Manage Recruits</t>";

			x = 0.427812 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.308437 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
            colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1102: RscOverthrowStructuredText // title left filler
		{
			idc = 1102;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
            colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1103: RscOverthrowStructuredText // close bottom filler
		{
			idc = 1103;
			x = 0.729688 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.014 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
            colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1104: RscOverthrowStructuredText // close right filler
		{
			idc = 1104;
			x = 0.755937 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.0065625 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
            colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "Dismiss"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0.5,0,0,1};
			colorActive[] = {0.6,0,0,1};
			action = "_this call dismissRecruit;";
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
