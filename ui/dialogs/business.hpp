class OT_dialog_business
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			x = 0.267968 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.46793 * safezoneW;
			h = 0.55 * safezoneH;
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
			x = 0.302772 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.197227 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
			colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1102: RscOverthrowStructuredText
		{
			idc = 1102; // business details

			x = 0.271836 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			colorActive[] = {0,0,0,0.2};
		};
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;
			text = "<t align='center' size='1.2'>Production</t>"; //--- ToDo: Localize;

			x = 0.387852 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1104: RscOverthrowStructuredText
		{
			idc = 1104;

			x = 0.387852 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			colorActive[] = {0,0,0,0.2};
		};
		class RscStructuredText_1105: RscOverthrowStructuredText
		{
			idc = 1105;
			text = "<t align='center' size='1.2'>Required</t>"; //--- ToDo: Localize;

			x = 0.387852 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1106: RscOverthrowStructuredText
		{
			idc = 1106;
			text = "<t align='center' size='1.2'>Supply with</t>"; //--- ToDo: Localize;

			x = 0.619883 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1107: RscOverthrowStructuredText
		{
			idc = 1107;

			x = 0.619883 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			colorActive[] = {0,0,0,0.2};
		};
		class RscStructuredText_1108: RscOverthrowStructuredText
		{
			idc = 1108;
			text = "<t align='center' size='1.2'>Business</t>"; //--- ToDo: Localize;

			x = 0.271836 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1109: RscOverthrowStructuredText
		{
			idc = 1109;
			text = "<t align='center' size='1.2'>Supply</t>"; //--- ToDo: Localize;

			x = 0.619883 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1110: RscOverthrowStructuredText
		{
			idc = 1110;
			text = "<t align='center' size='1.2'>Business Stats</t>"; //--- ToDo: Localize;

			x = 0.271836 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1111: RscOverthrowStructuredText
		{
			idc = 1111;
			text = "<t align='center' size='1.2'>Queue</t>"; //--- ToDo: Localize;

			x = 0.503867 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,0.5};
			colorActive[] = {0.664063,0.164063,0.175781,0.5};
		};
		class RscStructuredText_1112: RscOverthrowStructuredText
		{
			idc = 1112;
			text = "<t align='left' size='.8'>Currently producing: </t>"; //--- ToDo: Localize;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.135352 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
			colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1113: RscOverthrowStructuredText
		{
			idc = 1113;

			x = 0.697227 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0386719 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0.664063,0.164063,0.175781,1};
			colorBackground[] = {0.664063,0.164063,0.175781,1};
			colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1114: RscOverthrowStructuredText
		{
			idc = 1114;
			text = "<t align='left' size='.8'>Time left: </t>"; //--- ToDo: Localize;

			x = 0.635352 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
			colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1115: RscOverthrowStructuredText
		{
			idc = 1115;
			text = "<t align='left' size='.8'>Supplying: </t>"; //--- ToDo: Localize;

			x = 0.635352 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.023 * safezoneH;
			colorBackground[] = {0.664063,0.164063,0.175781,1};
			colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1116: RscOverthrowStructuredText
		{
			idc = 1116;

			x = 0.5 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.135352 * safezoneW;
			h = 0.023 * safezoneH;
			colorText[] = {0.664063,0.164063,0.175781,1};
			colorBackground[] = {0.664063,0.164063,0.175781,1};
			colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscStructuredText_1117: RscOverthrowStructuredText
		{
			idc = 1117;

			x = 0.267969 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0348047 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0.664063,0.164063,0.175781,1};
			colorBackground[] = {0.664063,0.164063,0.175781,1};
			colorActive[] = {0.664063,0.164063,0.175781,1};
		};
		class RscListBox_1500: RscOverthrowListBox
		{
			idc = 1500; // BUSINESS LIST
			onLBSelChanged = "[] call OT_fnc_refreshBusiness";

			x = 0.271836 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class RscListBox_1501: RscOverthrowListBox
		{
			idc = 1501; // PRODUCTION LIST
			onLBSelChanged = "[] call OT_fnc_refreshBusiness";

			x = 0.387852 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class RscListBox_1502: RscOverthrowListBox
		{
			idc = 1502; // CAN SUPPLY BUSINESSES LIST
			onLBSelChanged = "[] call OT_fnc_refreshBusiness";

			x = 0.619883 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class RscListBox_1503: RscOverthrowListBox
		{
			idc = 1503; // QUEUE LIST

			x = 0.503867 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class RscButton_1700: RscOverthrowButton
		{
			idc = 1700;
			text = "Hire"; //--- ToDo: Localize;
			action = "[] call OT_fnc_hireEmployee;";

			x = 0.275703 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1701: RscOverthrowButton
		{
			idc = 1701;
			text = "Fire"; //--- ToDo: Localize;
			action = "[] call OT_fnc_fireEmployee;";

			x = 0.329844 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1702: RscOverthrowButton
		{
			idc = 1702;
			text = "-1 queue"; //--- ToDo: Localize;
			action = "[] call OT_fnc_businessQueueRemove;";

			x = 0.546406 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1703: RscOverthrowButton
		{
			idc = 1703;
			text = "+1 queue"; //--- ToDo: Localize;
			action = "[] call OT_fnc_businessQueueAdd;";

			x = 0.503867 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0386719 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1704: RscOverthrowButton
		{
			idc = 1704;
			text = "0 queue"; //--- ToDo: Localize;
			action = "[] call OT_fnc_businessRemoveQueueAll;";

			x = 0.581211 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0348047 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1705: RscOverthrowButton
		{
			idc = 1705;
			text = ">>> Assign to supply >>>"; //--- ToDo: Localize;

			x = 0.503867 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.112148 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1706: RscOverthrowButton
		{
			idc = 1706;
			text = "x"; //--- ToDo: Localize;
			action = "closeDialog 0";

			x = 0.72043 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.0116016 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;

			text = "\overthrow_main\ui\tags\papagee.paa";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.435058 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscCheckbox_2800: RscOverthrowCheckbox
		{
			idc = 2800;
			text = "Unlimited production"; //--- ToDo: Localize;

			x = 0.503867 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.00773438 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
