class OT_dialog_newgame
{
	idd=8099;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.345469 * safezoneW;
            h = 0.495 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Zosiwi)
        ////////////////////////////////////////////////////////

        class RscButton_1600: RscOverthrowButton
        {
            idc = 1600;
            text = "Easy"; //--- ToDo: Localize;
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.077 * safezoneH;
			action = "server setvariable [""OT_difficulty"",0,true];call OT_fnc_newGameDialog;";
			tooltip = "Recommended for beginners playing solo";
        };
        class RscButton_1601: RscOverthrowButton
        {
            idc = 1601;
            text = "Normal"; //--- ToDo: Localize;
            x = 0.453594 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.077 * safezoneH;
			action = "server setvariable [""OT_difficulty"",1,true];call OT_fnc_newGameDialog;";
            color[] = {0,0.8,0,1};
			tooltip = "Recommended for beginners playing in groups or experienced players solo";
        };
        class RscButton_1602: RscOverthrowButton
        {
            idc = 1602;
            text = "Hard"; //--- ToDo: Localize;
            x = 0.577344 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.077 * safezoneH;
			action = "server setvariable [""OT_difficulty"",2,true];call OT_fnc_newGameDialog;";
			tooltip = "For the hardcore";
        };
        class RscStructuredText_1101: RscOverthrowStructuredText
        {
            idc = 1101;
            text = "<t size=""1.5"">Difficulty</t>"; //--- ToDo: Localize;
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class RscStructuredText_1102: RscOverthrowStructuredText
        {
            idc = 1102;
            text = "<t size=""1.5"">Fast Travel</t>"; //--- ToDo: Localize;
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class RscButton_1603: RscOverthrowButton
        {
            idc = 1603;
            text = "Free"; //--- ToDo: Localize;
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.077 * safezoneH;
			action = "server setvariable [""OT_fastTravelType"",0,true];call OT_fnc_newGameDialog;";
			tooltip = "Fast travel will not cost anything";
        };
        class RscButton_1604: RscOverthrowButton
        {
            idc = 1604;
            text = "Costs"; //--- ToDo: Localize;
            x = 0.453594 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.077 * safezoneH;
			color[] = {0,0.8,0,1};
			action = "server setvariable [""OT_fastTravelType"",1,true];call OT_fnc_newGameDialog;";
			tooltip = "Fast travel will cost money";
        };
        class RscButton_1605: RscOverthrowButton
        {
            idc = 1605;
            text = "Disabled"; //--- ToDo: Localize;
            x = 0.577344 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.077 * safezoneH;
			action = "server setvariable [""OT_fastTravelType"",2,true];call OT_fnc_newGameDialog;";
			tooltip = "Fast travel will be disabled";
        };
		class RscStructuredText_1103: RscOverthrowStructuredText
        {
            idc = 1103;
            text = "<t size=""1.5"">Fast Travel Rules</t>"; //--- ToDo: Localize;
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class RscButton_1607: RscOverthrowButton
        {
            idc = 1607;
            text = "Open"; //--- ToDo: Localize;
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.077 * safezoneH;
			action = "server setvariable [""OT_fastTravelRules"",0,true];call OT_fnc_newGameDialog;";
			tooltip = "No rules for fast travel";
        };
        class RscButton_1608: RscOverthrowButton
        {
            idc = 1608;
            text = "No weapons"; //--- ToDo: Localize;
            x = 0.453594 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.077 * safezoneH;
			color[] = {0,0.8,0,1};
			action = "server setvariable [""OT_fastTravelRules"",1,true];call OT_fnc_newGameDialog;";
			tooltip = "Cannot fast travel while holding a weapon";
        };
        class RscButton_1609: RscOverthrowButton
        {
            idc = 1609;
            text = "Restricted"; //--- ToDo: Localize;
            x = 0.577344 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.077 * safezoneH;
			action = "server setvariable [""OT_fastTravelRules"",2,true];call OT_fnc_newGameDialog;";
			tooltip = "Cannot fast travel with anything illegal";
        };
        class RscButton_1606: RscOverthrowButton
        {
            idc = 1606;
            text = "Start Game"; //--- ToDo: Localize;
            x = 0.577344 * safezoneW + safezoneX;
            y = 0.708 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.045 * safezoneH;
			action = "closeDialog 0;[] remoteExec [""OT_fnc_newGame"",2,false]";
        };
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////
    };
};