class OT_dialog_police
{
	idd=9000;
	movingenable=false;
	class controlsBackground
	{
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;

			text = "<t size=""2"" align=""center"">Blah Police Station</t>"; //--- ToDo: Localize;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.422812 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};
	class controls
	{
				////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Pikulu)
		////////////////////////////////////////////////////////

		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;

			text = "<t size=""1.5"" align=""center"">Police: 2</t>"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
			colorActive[] = {0,0,0,1};
		};
		/*
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;

			text = "Transfer 1"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class RscStructuredText_1102: RscOverthrowStructuredText
		{
			idc = 1102;

			text = "<t align=""center"">Transfer to another station</t>"; //--- ToDo: Localize;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.422812 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};*/
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "<t align=""center"">Hire police</t>"; //--- ToDo: Localize;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.422812 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
		class RscStructuredText_1104: RscOverthrowStructuredText
		{
			idc = 1104;

			text = "<t size=""1.2"" align=""center"">Effects</t><br/><br/><t size=""0.8"" align=""center"">+1 Stability/10 mins</t>"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {0,0,0,0.1};
			colorActive[] = {0,0,0,1};
		};
		class RscButton_1608: RscOverthrowButton
		{
			idc = 1608;

			text = "Edit Loadout"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.73 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.033 * safezoneH;
			action = "[] call OT_fnc_editPoliceLoadout";
		};
		/*
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;

			text = "Transfer 2"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;

			text = "Transfer 4"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;

			text = "Transfer All"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.077 * safezoneH;
		};
		*/
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;

			text = "+1"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.077 * safezoneH;
			action = "1 call OT_fnc_addPolice;";
		};
		class RscButton_1605: RscOverthrowButton
		{
			idc = 1605;

			text = "+2"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.077 * safezoneH;
			action = "2 call OT_fnc_addPolice;";
		};
		class RscButton_1606: RscOverthrowButton
		{
			idc = 1606;

			text = "+4"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.077 * safezoneH;
			action = "4 call OT_fnc_addPolice;";
		};
		class RscButton_1607: RscOverthrowButton
		{
			idc = 1607;

			text = "+8"; //--- ToDo: Localize;
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.077 * safezoneH;
			action = "8 call OT_fnc_addPolice;";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



	};
};