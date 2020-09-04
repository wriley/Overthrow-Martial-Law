class OT_dialog_input
{
	idd=8001;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Fuxuza)
		////////////////////////////////////////////////////////

		class RscEdit_1400: RscOverthrowEdit
		{
			idc = 1400;

			onKeyDown = "_key = _this select 1;_name = ctrltext 1400;if(_key == 28 && _name != """") then {[] call inputHandler;closeDialog 0;}";
			text = ""; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;

			text = ""; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "_this call OT_inputHandler;closeDialog 0;";
			text = "OK"; //--- ToDo: Localize;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};