class OT_dialog_options
{
	idd=-1;
	movingenable=false;

	class controls
	{
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "closeDialog 0;[player] remoteExec ['OT_fnc_saveGame',2,false];";

			text = "Persistent Save"; //--- ToDo: Localize;
			x = 0.386563 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "A more secure save than default, this will work across updates of both Arma and Overthrow. To load this just restart the mission and choose ""load persistent""."; //--- ToDo: Localize;
		};
		class RscButton_1607: RscOverthrowButton
		{
			idc = 1607;
			action = "[] remoteExec [""OT_fnc_autoSaveToggle"",2];";
			text = "Autosave Toggle"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Toggle between (0/5/10/15/30/45/60) minute autosaves.\n0 will disable autosaving!"; //--- ToDo: Localize;
		};
		class RscButton_1608: RscOverthrowButton
		{
			idc = 1608;
			action = "[] remoteExec [""OT_fnc_autoloadToggle"",2]";
			text = "Toggle Autoloading"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Autoload mission if on a dedicated server";
		};

		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "OT_spawnCivPercentage = OT_spawnCivPercentage - 0.01; if(OT_spawnCivPercentage < 0) then {OT_spawnCivPercentage = 0};publicVariable 'OT_spawnCivPercentage';hint format['Civilian spawn now at %1%2',OT_spawnCivPercentage*100,'%'];";

			text = "Civ % --"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Decreases the amount of civilians that spawn in towns"; //--- ToDo: Localize;
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "OT_spawnCivPercentage = OT_spawnCivPercentage + 0.01; if(OT_spawnCivPercentage < 0) then {OT_spawnCivPercentage = 0};publicVariable 'OT_spawnCivPercentage';hint format['Civilian spawn now at %1%2',OT_spawnCivPercentage*100,'%'];";

			text = "Civ % ++"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Increases the amount of civilians that spawn in towns"; //--- ToDo: Localize;
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			action = "call OT_fnc_decreaseTax";

			text = "Tax % --"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Decreases the resistance tax rate"; //--- ToDo: Localize;
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			action = "call OT_fnc_increaseTax";

			text = "Tax % ++"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Increases the resistance tax rate"; //--- ToDo: Localize;
		};
		class RscButton_1605: RscOverthrowButton
		{
			idc = 1605;
			action = "call OT_fnc_cleanDead;";
			text = "Clean bodies/wrecks"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Will completely destroy all dead bodies, wrecks and vehicles that cannot move"; //--- ToDo: Localize;
		};
		class RscButton_1606: RscOverthrowButton
		{
			idc = 1606;
			action = "[0,0] remoteExecCall ['setFog',0,false]";

			text = "Clean fog"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Clears fog"; //--- ToDo: Localize;
		};
		class RscText_1009: RscOverthrowButton
		{
			idc = 1609;
			action = "call OT_fnc_toggleZeus;";
			text = "Toggle Zeus"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Toggle between zeus access as the host"; //--- ToDo: Localize;
		};
	};
};
class OT_dialog_upload
{
	idd=49558;
	movingenable=false;
	onLoad = "params [""_display""]; _display displayAddEventHandler [""KeyDown"", ""if ((_this select 1) == 1) then { true }""];";

	class controlsBackground
	{
		class background1: RscOverthrowText
		{
			idc = -1;
			text = "OVERTHROW MISSION EXPORT"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
		};
		class background2: RscOverthrowText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.528 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class background3: RscOverthrowText
		{
			idc = -1;
			x = 0.298905 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
	};
	class controls
	{
		class EditBox: RscEdit
		{
			idc = 1;
			style= 16;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.308 * safezoneH;
			canModify = 0;
			font="EtelkaMonospacePro";
			colorBackground[] = {-1,-1,-1,0.75};
		};
		class LegalControlGroup: RscControlsGroup
		{
			idc = -1;
			x = 0.298905 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.143 * safezoneH;
			class Controls
			{
				class LegalText: RscOverthrowStructuredText
				{
					idc = 5;
					x = 0 * safezoneW;
					y = 0 * safezoneH;
					w = 0.397031 * safezoneW;
					h = 0.143 * safezoneH;
					text = "";
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};
		class CancelButton: RscOverthrowStructuredText
		{
			idc = -1;
			text = "<t align='center' font='PuristaBold' color='#FFFFFF'>CLOSE MENU</t>"; //--- ToDo: Localize;
			onMouseButtonClick = "playSound ""click""; closeDialog 0;";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.033 * safezoneH;
			onMouseEnter = "(_this select 0) ctrlSetStructuredText parseText ""<t align='center' font='PuristaBold' color='#00FF00'>CLOSE MENU</t>""; (_this select 0) ctrlCommit 0.5; ";
			onMouseExit = "(_this select 0) ctrlSetStructuredText parseText ""<t align='center' font='PuristaBold' color='#FFFFFF'>CLOSE MENU</t>""; (_this select 0) ctrlCommit 0.5; ";
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};
};