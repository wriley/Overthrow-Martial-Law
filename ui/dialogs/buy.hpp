class OT_dialog_buy
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
		class RscStructuredText_1101: RscOverthrowStructuredText // title text
		{
			idc = 1101;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.334687 * safezoneW;
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
	};

	class controls
	{
		class RscListbox_1500: RscOverthrowListbox
		{
			idc = 1500;
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.602 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "_this call OT_fnc_displayShopPic";
			onMouseButtonDblClick = "[false] call OT_fnc_buy;";
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;

			x = 0.244062 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.238 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "[false] call OT_fnc_buy;";

			text = "Buy"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "[true,1] call OT_fnc_buy;";

			text = "1 to Veh/Box"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "[true,10] call OT_fnc_buy;";

			text = "10 to Veh/Box"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class RscStructuredText_1100: RscOverthrowStructuredText // item description
		{
			idc = 1100;
			x = 0.244062 * safezoneW + safezoneX;
			y = 0.472 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.35 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
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