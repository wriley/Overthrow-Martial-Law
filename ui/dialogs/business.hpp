class OT_dialog_business
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;

			x = 0.296562 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.406875 * safezoneW;
			h = 0.7 * safezoneH;

			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Blanks, v1.063, #Rugaxy)
		////////////////////////////////////////////////////////
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;
			text = "<t align='left' size='2'>Martial Law Business Management v1.0</t>"; //--- ToDo: Localize;

			x = 0.381875 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.321562 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
			colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1102: RscOverthrowStructuredText
		{
			idc = 1102;
			text = ""; //--- ToDo: Localize; TITLE LEFT FILLER

			x = 0.296562 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
			colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;
			text = "<t align='center' size='1.2'>Business</t>"; //--- ToDo: Localize;

			x = 0.303125 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1104: RscOverthrowStructuredText
		{
			idc = 1104;
			text = "<t align='center' size='1.2'>Production</t>"; //--- ToDo: Localize;

			x = 0.440937 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1105: RscOverthrowStructuredText
		{
			idc = 1105;
			text = "<t align='center' size='1.2'>Business Details</t>"; //--- ToDo: Localize;

			x = 0.217813 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.137812 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1106: RscOverthrowStructuredText
		{
			idc = 1106;
			text = "<t align='center' size='1.2'>Required</t>"; //--- ToDo: Localize;

			x = 0.440937 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1107: RscOverthrowStructuredText
		{
			idc = 1107;
			text = "<t align='center' size='1.2'>Queue</t>"; //--- ToDo: Localize;

			x = 0.57875 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1108: RscOverthrowStructuredText
		{
			idc = 1108; // DETAILS TEXT

			x = 0.303125 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.21 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			colorActive[] = {0,0,0,0.2};
		};
		class RscStructuredText_1109: RscOverthrowStructuredText
		{
			idc = 1109; // REQUIRED TEXT

			x = 0.440937 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.28 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			colorActive[] = {0,0,0,0.2};
		};
		class RscListBox_1500: RscOverthrowListBox
		{
			idc = 1500; // BUSINESS LIST
			onLBSelChanged = "[] call OT_fnc_refreshBusiness";

			x = 0.303124 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class RscListBox_1501: RscOverthrowListBox
		{
			idc = 1501; // PRODUCTION LIST
			onLBSelChanged = "[] call OT_fnc_refreshBusiness";

			x = 0.440937 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.13125 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class RscListBox_1502: RscOverthrowListBox
		{
			idc = 1502; // QUEUE LIST

			x = 0.57875 * safezoneW + safezoneX;
			y = 0.556 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class RscButton_1700: RscOverthrowButton
		{
			idc = 1700;
			text = "Hire"; //--- ToDo: Localize;
			action = "[] call OT_fnc_hireEmployee;";

			x = 0.303125 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
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

			x = 0.375312 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
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

			x = 0.591875 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1703: RscOverthrowButton
		{
			idc = 1703;
			text = "+10 queue"; //--- ToDo: Localize;
			action = "[10] call OT_fnc_businessQueueAdd;";

			x = 0.591875 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1704: RscOverthrowButton
		{
			idc = 1704;
			text = "Clear Queue"; //--- ToDo: Localize;
			action = "[] call OT_fnc_businessRemoveQueueAll;";

			x = 0.591875 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1705: RscOverthrowButton
		{
			idc = 1705;
			text = "x"; //--- ToDo: Localize;
			action = "closeDialog 0";

			x = 0.670625 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.02625 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;

			text = "\overthrow_main\ui\tags\papagee.paa";
			x = 0.31625 * safezoneW + safezoneX;
			y = 0.122 * safezoneH + safezoneY;
			w = 0.0525 * safezoneW;
			h = 0.084 * safezoneH;
		};
	};
};
