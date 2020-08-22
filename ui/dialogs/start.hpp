class OT_dialog_start
{
	idd=2164;
	movingenable=false;

	class controlsBackground {
		class Background: RscOverthrowStructuredText
		{
			idc = 1100;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.407 * safezoneH;
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
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Starts a new game (Please note, saving will overwrite any previous games)"; //--- ToDo: Localize;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "closeDialog 0;[] remoteExec ['OT_fnc_loadGame',2,false];";
			text = "Load Previous Save"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Continue previous save"; //--- ToDo: Localize;
		};
		class background_picture: RscOverthrowPicture
		{
			idc = 1200;
			text = "\overthrow_main\ui\logo_overthrow.paa";
			x = 0.399969 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
};
/*
class OT_dialog_load
{
	idd=15150;
	movingenable=false;

	class controlsBackground {
		class background1: RscOverthrowStructuredText
		{
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.137 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		class EditBox: RscEditMulti
		{
			idc = 1400;
			text = "";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.231 * safezoneH;
		};
		class LoadNormal: RscOverthrowButton
		{
			idc = -1;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Continue previous save"; //--- ToDo: Localize;
			action = "closeDialog 0;[] remoteExec ['OT_fnc_loadGame',2,false];";
			text = "Load Save (Original)"; //--- ToDo: Localize;
		};
		class LoadString: RscOverthrowButton
		{
			idc = -1;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Load string as a save"; //--- ToDo: Localize;
			action = "closeDialog 0; private _data = parseSimpleArray ctrlText ((findDisplay 15150) displayCtrl 1400);  [_data] remoteExec ['OT_fnc_loadGame',2,false];";
			text = "Import Save"; //--- ToDo: Localize;
		};
		class Logo_Picture: RscOverthrowPicture
		{
			idc = -1;
			text = "\overthrow_main\ui\logo_overthrow.paa";
			x = 0.399969 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.363 * safezoneH;
		};
	};
};
*/