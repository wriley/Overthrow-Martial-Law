class OT_dialog_start
{
	idd=2164;
	movingenable=false;
	onKeyDown = "true";

	class controlsBackground {
		class Background: RscOverthrowStructuredText
		{
			idc = 1100;
			x = 0.3425 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.315 * safezoneW;
			h = 0.56 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "closeDialog 0;createDialog ""OT_dialog_newgame"";call OT_fnc_newGameDialog;";
			text = "New Game"; //--- ToDo: Localize;
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.112 * safezoneH;
			tooltip = "Starts a new game (Please note, saving will overwrite any previous games)"; //--- ToDo: Localize;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "closeDialog 0;[] remoteExec ['OT_fnc_loadGame',2,false];";
			text = "Load Previous Save"; //--- ToDo: Localize;
			x = 0.506562 * safezoneW + safezoneX;
			y = 0.542 * safezoneH + safezoneY;
			w = 0.118125 * safezoneW;
			h = 0.112 * safezoneH;
			tooltip = "Continue previous save"; //--- ToDo: Localize;
		};
		class background_picture: RscOverthrowPicture
		{
			idc = 1200;
			text = "\overthrow_main\ui\logo_overthrow_ml.paa";
			x = 0.375312 * safezoneW + safezoneX;
			y = 0.206 * safezoneH + safezoneY;
			w = 0.249375 * safezoneW;
			h = 0.294 * safezoneH;
		};
	};
};