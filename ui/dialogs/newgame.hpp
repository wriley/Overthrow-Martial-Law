class OT_dialog_newgame
{
	idd=8099;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1100: RscOverthrowStructuredText
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
            text = "Easy"; //--- ToDo: Localize;
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.22 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.07 * safezoneH;
			action = "server setvariable ['OT_difficulty',0,true];call OT_fnc_newGameDialog;";
			tooltip = "Recommended for beginners playing solo";
        };
        class RscButton_1601: RscOverthrowButton
        {
            idc = 1601;
            text = "Normal"; //--- ToDo: Localize;
            x = 0.454062 * safezoneW + safezoneX;
            y = 0.22 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.07 * safezoneH;
			action = "server setvariable ['OT_difficulty',1,true];call OT_fnc_newGameDialog;";
            color[] = {0,0.8,0,1};
			tooltip = "Recommended for beginners playing in groups or experienced players solo";
        };
        class RscButton_1602: RscOverthrowButton
        {
            idc = 1602;
            text = "Hard"; //--- ToDo: Localize;
            x = 0.5525 * safezoneW + safezoneX;
            y = 0.22 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.07 * safezoneH;
			action = "server setvariable ['OT_difficulty',2,true];call OT_fnc_newGameDialog;";
			tooltip = "For the hardcore";
        };
        class RscButton_1603: RscOverthrowButton
        {
            idc = 1603;
            text = "Free"; //--- ToDo: Localize;
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.374 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.07 * safezoneH;
			action = "server setvariable ['OT_fastTravelType',0,true];call OT_fnc_newGameDialog;";
			tooltip = "Fast travel will not cost anything";
        };
        class RscButton_1604: RscOverthrowButton
        {
            idc = 1604;
            text = "Costs"; //--- ToDo: Localize;
            x = 0.454062 * safezoneW + safezoneX;
            y = 0.374 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.07 * safezoneH;
			color[] = {0,0.8,0,1};
			action = "server setvariable ['OT_fastTravelType',1,true];call OT_fnc_newGameDialog;";
			tooltip = "Fast travel will cost money";
        };
        class RscButton_1605: RscOverthrowButton
        {
            idc = 1605;
            text = "Disabled"; //--- ToDo: Localize;
            x = 0.5525 * safezoneW + safezoneX;
            y = 0.374 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.07 * safezoneH;
			action = "server setvariable ['OT_fastTravelType',2,true];call OT_fnc_newGameDialog;";
			tooltip = "Fast travel will be disabled";
        };
        class RscButton_1607: RscOverthrowButton
        {
            idc = 1607;
            text = "Open"; //--- ToDo: Localize;
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.528 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.07 * safezoneH;
			action = "server setvariable ['OT_fastTravelRules',0,true];call OT_fnc_newGameDialog;";
			tooltip = "No rules for fast travel";
        };
        class RscButton_1608: RscOverthrowButton
        {
            idc = 1608;
            text = "No weapons"; //--- ToDo: Localize;
            x = 0.454062 * safezoneW + safezoneX;
            y = 0.528 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.07 * safezoneH;
			color[] = {0,0.8,0,1};
			action = "server setvariable ['OT_fastTravelRules',1,true];call OT_fnc_newGameDialog;";
			tooltip = "Cannot fast travel while holding a weapon";
        };
        class RscButton_1609: RscOverthrowButton
        {
            idc = 1609;
            text = "Restricted"; //--- ToDo: Localize;
            x = 0.5525 * safezoneW + safezoneX;
            y = 0.528 * safezoneH + safezoneY;
            w = 0.091875 * safezoneW;
            h = 0.07 * safezoneH;
			action = "server setvariable ['OT_fastTravelRules',2,true];call OT_fnc_newGameDialog;";
			tooltip = "Cannot fast travel with anything illegal";
        };
        class RscButton_1606: RscOverthrowButton
        {
            idc = 1606;
            text = "Start Game"; //--- ToDo: Localize;
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.612 * safezoneH + safezoneY;
            w = 0.28875 * safezoneW;
            h = 0.07 * safezoneH;
			action = "closeDialog 0;[] remoteExec ['OT_fnc_newGame',2,false]";
        };
        class RscStructuredText_1101: RscOverthrowStructuredText
        {
            idc = 1101;
            text = "<t size='1.6' align='center'>Difficulty</t>"; //--- ToDo: Localize;
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.164 * safezoneH + safezoneY;
            w = 0.28875 * safezoneW;
            h = 0.042 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class RscStructuredText_1102: RscOverthrowStructuredText
        {
            idc = 1102;
            text = "<t size='1.6' align='center'>Fast Travel</t>"; //--- ToDo: Localize;
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.28875 * safezoneW;
            h = 0.042 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
		class RscStructuredText_1103: RscOverthrowStructuredText
        {
            idc = 1103;
            text = "<t size='1.6' align='center'>Fast Travel Rules</t>"; //--- ToDo: Localize;
            x = 0.355625 * safezoneW + safezoneX;
            y = 0.472 * safezoneH + safezoneY;
            w = 0.28875 * safezoneW;
            h = 0.042 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
    };
};