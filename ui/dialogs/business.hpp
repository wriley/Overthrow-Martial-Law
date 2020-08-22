class OT_dialog_business
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.291172 * safezoneW + safezoneX;
			y = 0.16604 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.462 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Defoki)
        ////////////////////////////////////////////////////////

        class RscStructuredText_1101: RscOverthrowStructuredText
        {
            idc = 1101;
            text = "<t align='center' size='2'>Business Management</t>"; //--- ToDo: Localize;
            x = 0.175 * safezoneW + safezoneX; // 0.242187
            y = 0.181 * safezoneH + safezoneY;
            w = 0.515625 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
        };
        class RscStructuredText_1102: RscOverthrowStructuredText
        {
            idc = 1102;
			text = "";
			x = 0.546406 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.11 * safezoneH;
            colorBackground[] = {0,0,0,0.2};
            colorActive[] = {0,0,0,0};
        };
        class RscStructuredText_1103: RscOverthrowStructuredText
        {
            idc = 1103;
            text = "<t align='center' size='1.2'>Production</t>"; //--- ToDo: Localize;
			x = 0.302773 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.116016 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
        };
        class RscStructuredText_1104: RscOverthrowStructuredText
        {
            idc = 1104;
			text = "";
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.11 * safezoneH;
            colorBackground[] = {0,0,0,0.2};
            colorActive[] = {0,0,0,0};
        };
        class RscStructuredText_1105: RscOverthrowStructuredText
        {
            idc = 1105;
            text = "<t align='center' size='1.2'>Required Inputs</t>"; //--- ToDo: Localize;
            x = 0.550118 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.146953 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
        };
        class RscStructuredText_1106: RscOverthrowStructuredText
        {
            idc = 1106;
			text = "<t align='center' size='1.2'>Supply</t>";
            x = 0.426523 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.116016 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
        };
        class RscStructuredText_1107: RscOverthrowStructuredText
        {
            idc = 1107;
			text = "";
            x = 0.426523 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.116016 * safezoneW;
            h = 0.11 * safezoneH;
            colorBackground[] = {0,0,0,0.2};
            colorActive[] = {0,0,0,0};
        };
        class RscListbox_1500: RscOverthrowListBox
        {
            idc = 1500;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.165 * safezoneH;
			onLBSelChanged = "[_this,0] call OT_fnc_showBusinessInfo";
        };
        class RscListbox_1501: RscOverthrowListBox
        {
            idc = 1501;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.165 * safezoneH;
			onLBSelChanged = "[_this,1] call OT_fnc_showBusinessInfo";
        };
		class RscListbox_1502: RscOverthrowListBox
		{
			idc = 1502;
			x = 0.426523 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.116016 * safezoneW;
			h = 0.165 * safezoneH;
			onLBSelChanged = "[_this,2] call OT_fnc_showBusinessInfo";
		};
        class RscButton_1600: RscOverthrowButton
        {
            idc = 1600;
            text = "Hire"; //--- ToDo: Localize;
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.044 * safezoneH;
			action = "[] call OT_fnc_hireEmployee;";
        };
        class RscButton_1601: RscOverthrowButton
        {
            idc = 1601;
            text = "Fire"; //--- ToDo: Localize;
            x = 0.628906 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.044 * safezoneH;
			action = "[] call OT_fnc_fireEmployee;";
        };
        class RscButton_1606: RscOverthrowButton
        {
            idc = 1606;
            text = "Unlimited Run"; //--- ToDo: Localize;
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0502734 * safezoneW;
            h = 0.044 * safezoneH;
			action = "";
        };
        class RscButton_1602: RscOverthrowButton
        {
            idc = 1602;
            text = "Add to Queue"; //--- ToDo: Localize;
            x = 0.604414 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0425391 * safezoneW;
            h = 0.044 * safezoneH;
			action = "";
        };
        class RscButton_1603: RscOverthrowButton
        {
            idc = 1603;
            text = "Clear Queue"; //--- ToDo: Localize;
            x = 0.654687 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.044 * safezoneH;
			action = "";
        };
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Assign supply"; //--- ToDo: Localize;
			x = 0.426523 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0541406 * safezoneW;
			h = 0.044 * safezoneH;
			action = "";
		};
		class RscButton_1605: RscOverthrowButton
		{
			idc = 1605;
			text = "Something else?"; //--- ToDo: Localize;
			x = 0.487108 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0541406 * safezoneW;
			h = 0.044 * safezoneH;
			action = "";
		};
        class RscButton_1699: RscOverthrowButton
        {
            idc = 1699;
            text = "X"; //--- ToDo: Localize;
			action = "closeDialog 0";
			x = 0.677891 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.0232031 * safezoneW;
			h = 0.033 * safezoneH;
        };

        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////
    };
};