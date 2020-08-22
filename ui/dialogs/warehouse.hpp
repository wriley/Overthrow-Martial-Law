class OT_dialog_warehouse
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
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Wivoti)
		////////////////////////////////////////////////////////
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
			text = "<t align='right' size='1.2'>Filter:</t>";

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
		class RscListbox_1500: RscOverthrowListBox
		{
			idc = 1500;
			onLBSelChanged = "_this call OT_fnc_displayWarehousePic";
			onMouseButtonDblClick = "[1,(getpos player)] call OT_fnc_warehouseTake;";

			x = 0.414922 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.302773 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.308 * safezoneH;
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "[-1,(getpos player)] call OT_fnc_warehouseTake;";
			text = "Take All"; //--- ToDo: Localize;

			x = 0.65082 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "[100,(getpos player)] call OT_fnc_warehouseTake;";
			text = "Take 100"; //--- ToDo: Localize;


			x = 0.65082 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "[10,(getpos player)] call OT_fnc_warehouseTake;";
			text = "Take 10"; //--- ToDo: Localize;

			x = 0.65082 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			action = "[1,(getpos player)] call OT_fnc_warehouseTake;";
			text = "Take 1"; //--- ToDo: Localize;

			x = 0.65082 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0502734 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
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
		class RscEdit_1700: RscEditOverthrow
		{
			idc = 1700;

			x = 0.47293 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.174023 * safezoneW;
			h = 0.044 * safezoneH;
			
			onKeyUp = "_id = ((getpos player) call OT_fnc_nearestWarehouse) select 1;[_id] call OT_fnc_refreshWarehouse;";
		};
	};
};