class OT_dialog_warehouse
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
			x = 0.434375 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.602 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "_this call OT_fnc_displayWarehousePic";
			onMouseButtonDblClick = "[OT_currentWarehouse, player, 1] call OT_fnc_warehouseTake;";
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
			action = "[OT_currentWarehouse, vehicle player, 1] call OT_fnc_warehouseTake;";

			text = "Take 1"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "[OT_currentWarehouse, vehicle player, 10] call OT_fnc_warehouseTake;";

			text = "Take 10"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "[OT_currentWarehouse, vehicle player, 100] call OT_fnc_warehouseTake;";

			text = "Take 100"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.0853125 * safezoneW;
			h = 0.056 * safezoneH;
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			action = "[OT_currentWarehouse, vehicle player, -1] call OT_fnc_warehouseTake;";

			text = "Take All"; //--- ToDo: Localize;
			x = 0.670625 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
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
		class RscStructuredText_1101: RscOverthrowStructuredText // title left filler
		{
			idc = 1101;
			text = "<t align='right' size='1.3'>Search Filter:</t>";

			x = 0.2375 * safezoneW + safezoneX;
			y = 0.168 * safezoneH + safezoneY;
			w = 0.190312 * safezoneW;
			h = 0.042 * safezoneH;
		};
		class RscEdit_1700: RscEditOverthrow
		{
			idc = 1700;

			x = 0.434375 * safezoneW + safezoneX;
			y = 0.164 * safezoneH + safezoneY;
			w = 0.229687 * safezoneW;
			h = 0.042 * safezoneH;

			onKeyUp = "[] call OT_fnc_refreshWarehouse;";
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
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



	};
};