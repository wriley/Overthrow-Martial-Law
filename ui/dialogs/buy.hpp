class OT_dialog_buy
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.406055 * safezoneW;
			h = 0.649 * safezoneH;
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
			x = 0.414922 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "_this call OT_fnc_displayShopPic";
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.302773 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "[false] call OT_fnc_buy;";

			text = "Buy"; //--- ToDo: Localize;
			x = 0.65082 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "[true] call OT_fnc_buy;";

			text = "Buy to Crate"; //--- ToDo: Localize;
			x = 0.65082 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
/*
		class RscCombo_1701: RscOverthrowCombo
		{
			idc = 1701;
			text = "1"; //--- ToDo: Localize;
			x = 0.65082 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
*/
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "[true,10] call OT_fnc_buy;";

			text = "Buy 10 to Crate"; //--- ToDo: Localize;
			x = 0.65082 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			x = 0.302773 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;
			x = 0.414922 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.235898 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
		};
		class RscButton_1699: RscOverthrowButton
        {
            idc = 1699;
			action = "closeDialog 0";
            text = "X"; //--- ToDo: Localize;
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