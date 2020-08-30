class OT_dialog_garrison
{
	idd=9000;
	movingenable=false;
	class controlsBackground
	{
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;

			text = ""; //--- ToDo: Localize;
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
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Niwire)
		////////////////////////////////////////////////////////

		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			text = "<t size='1.5' align='center'>Base</t>"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.270 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.48 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscButton_1699: RscOverthrowButton
        {
            idc = 1699;
            text = "X"; //--- ToDo: Localize;
			action = "closeDialog 0";
            x = 0.68 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "Rifleman (Lt.)"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,0,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Autorifleman (Lt.)"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,1,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "AT Rifleman (Lt.)"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,2,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Marksman (Lt.)"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,3,true,3] spawn OT_fnc_addGarrison";
		};

		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Sniper (Lt.)"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,4,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1605: RscOverthrowButton
		{
			idc = 1605;
			text = "Spotter (Lt.)"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,5,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1606: RscOverthrowButton
		{
			idc = 1606;
			text = "Squad Leader (Lt.)"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,6,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1607: RscOverthrowButton
		{
			idc = 1607;
			text = "Medic (Lt.)"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,7,true,3] spawn OT_fnc_addGarrison";
		};

		class RscButton_1608: RscOverthrowButton
		{
			idc = 1608;
			text = "AT (Lt.)"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,8,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1609: RscOverthrowButton
		{
			idc = 1609;
			text = "AA (Lt.)"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,9,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1610: RscOverthrowButton
		{
			idc = 1610;
			text = "Assist AT (Lt.)"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,10,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1611: RscOverthrowButton
		{
			idc = 1611;
			text = "Assist AA (Lt.)"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,11,true,3] spawn OT_fnc_addGarrison";
		};

		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			text = "Grenadier (Lt.)"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,12,true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1613: RscOverthrowButton
		{
			idc = 1613;
			text = "Rifleman (Cpt)"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,0,true,4] spawn OT_fnc_addGarrison";
		};
		class RscButton_1614: RscOverthrowButton
		{
			idc = 1614;
			text = "Marksman (Cpt)"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,3,true,4] spawn OT_fnc_addGarrison";
		};
		class RscButton_1615: RscOverthrowButton
		{
			idc = 1615;
			text = "Sniper (Cpt)"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,4,true,4] spawn OT_fnc_addGarrison";
		};

		class RscButton_1616: RscOverthrowButton
		{
			idc = 1616;
			text = "Spotter (Cpt)"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,5,true,4] spawn OT_fnc_addGarrison";
		};
		class RscButton_1617: RscOverthrowButton
		{
			idc = 1617;
			text = "Grenadier (Cpt)"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,12,true,4] spawn OT_fnc_addGarrison";
		};
		class RscButton_1618: RscOverthrowButton
		{
			idc = 1618;
			text = "+1 HMG"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,'HMG',true,3] spawn OT_fnc_addGarrison";
		};
		class RscButton_1619: RscOverthrowButton
		{
			idc = 1619;
			text = "+1 GMG"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,'GMG',true,3] spawn OT_fnc_addGarrison";
		};

		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};