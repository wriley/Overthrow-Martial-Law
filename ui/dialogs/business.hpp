class OT_dialog_business
{
	idd=8035;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;

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
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;
			text = "<t align='center' size='1.6'>Business</t>"; //--- ToDo: Localize;

			x = 0.276875 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1104: RscOverthrowStructuredText
		{
			idc = 1104;
			text = "<t align='center' size='1.6'>Production</t>"; //--- ToDo: Localize;

			x = 0.434375 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1107: RscOverthrowStructuredText
		{
			idc = 1107;
			text = "<t align='center' size='1.6'>Production Queue</t>"; //--- ToDo: Localize;

			x = 0.591875 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1108: RscOverthrowStructuredText
		{
			idc = 1108; // DETAILS TEXT

			x = 0.276875 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.168 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			colorActive[] = {0,0,0,0.2};
		};
		class RscStructuredText_1109: RscOverthrowStructuredText
		{
			idc = 1109; // REQUIRED TEXT

			x = 0.434375 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.252 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			colorActive[] = {0,0,0,0.2};
		};
		class RscListBox_1500: RscOverthrowListBox
		{
			idc = 1500; // BUSINESS LIST
			onLBSelChanged = "[] call OT_fnc_refreshBusiness";

			x = 0.276875 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.266 * safezoneH;
		};
		class RscListBox_1501: RscOverthrowListBox
		{
			idc = 1501; // PRODUCTION LIST
			onLBSelChanged = "[] call OT_fnc_refreshBusiness";

			x = 0.434375 * safezoneW + safezoneX;
			y = 0.276 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.266 * safezoneH;
		};
		class RscListBox_1502: RscOverthrowListBox
		{
			idc = 1502; // QUEUE LIST

			x = 0.591875 * safezoneW + safezoneX;
			y = 0.612 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.21 * safezoneH;
		};
		class RscButton_1700: RscOverthrowButton
		{
			idc = 1700;
			text = "Hire"; //--- ToDo: Localize;
			action = "[] call OT_fnc_hireEmployee;";

			x = 0.276875 * safezoneW + safezoneX;
			y = 0.766 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1701: RscOverthrowButton
		{
			idc = 1701;
			text = "Fire"; //--- ToDo: Localize;
			action = "[] call OT_fnc_fireEmployee;";

			x = 0.349063 * safezoneW + safezoneX;
			y = 0.766 * safezoneH + safezoneY;
			w = 0.0590625 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1702: RscOverthrowButton
		{
			idc = 1702;
			text = "+1 queue"; //--- ToDo: Localize;
			action = "[1] call OT_fnc_businessQueueAdd;";

			x = 0.605 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1703: RscOverthrowButton
		{
			idc = 1703;
			text = "+10 queue"; //--- ToDo: Localize;
			action = "[10] call OT_fnc_businessQueueAdd;";

			x = 0.605 * safezoneW + safezoneX;
			y = 0.318 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1704: RscOverthrowButton
		{
			idc = 1704;
			text = "Remove from Queue"; //--- ToDo: Localize;
			action = "[-1] call OT_fnc_businessQueueRemove;";

			x = 0.605 * safezoneW + safezoneX;
			y = 0.402 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1705: RscOverthrowButton
		{
			idc = 1705;
			text = "Clear Queue"; //--- ToDo: Localize;
			action = "[] call OT_fnc_businessQueueRemoveAll;";

			x = 0.605 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscStructuredText_1101: RscOverthrowStructuredText // title text
		{
			idc = 1101;
			text = "<t align='left' size='2'>Business Management</t>";

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
			action = "closeDialog 0";
            text = "X"; //--- ToDo: Localize;
            x = 0.73625 * safezoneW + safezoneX;
            y = 0.15 * safezoneH + safezoneY;
            w = 0.0196875 * safezoneW;
            h = 0.042 * safezoneH;
        };
	};
};
