class OT_dialog_resistance
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
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
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Defoki)
        ////////////////////////////////////////////////////////

        class RscListbox_1500: RscOverthrowListbox
        {
            idc = 1500;
			x = 0.493437 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.588 * safezoneH;
			onLBSelChanged = "_this call OT_fnc_showMemberInfo";
        };
		class RscStructuredText_1101: RscOverthrowStructuredText // title text
		{
			idc = 1101;

			text = "<t align='left' size='2'>Resistance Information</t>";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.308437 * safezoneW;
			h = 0.042 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
            colorActive[] = {0.664063,0.164063,0.175781,1};
		};
        class RscStructuredText_1102: RscOverthrowStructuredText // member info
        {
            idc = 1102;

			x = 0.283437 * safezoneW + safezoneX;
            y = 0.234 * safezoneH + safezoneY;
            w = 0.18375 * safezoneW;
            h = 0.168 * safezoneH;
            colorBackground[] = {0,0,0,0.2};
            colorActive[] = {0,0,0,0};
        };
		class RscStructuredText_1106: RscOverthrowStructuredText
		{
			idc = 1106;

			x = 0.283437 * safezoneW + safezoneX;
			y = 0.598 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.224 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			colorActive[] = {0,0,0,0};
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
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "[] call OT_fnc_makeGeneral;";

            text = "Make General"; //--- ToDo: Localize;
			x = 0.289999 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "[] call OT_fnc_transferFunds;";

            text = "Transfer funds"; //--- ToDo: Localize;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "[] call OT_fnc_giveFunds;";

			text = "Give funds"; //--- ToDo: Localize;
			x = 0.289999 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			action = "[] call OT_fnc_takeFunds;";

			text = "Take funds"; //--- ToDo: Localize;
			x = 0.381875 * safezoneW + safezoneX;
			y = 0.514 * safezoneH + safezoneY;
			w = 0.07875 * safezoneW;
			h = 0.056 * safezoneH;
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