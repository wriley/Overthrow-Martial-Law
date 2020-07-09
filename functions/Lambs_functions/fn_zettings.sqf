// Settings
// version 1.41
// by nkenny

// init settings. Z is for flavour

// settings
lambs_danger_CQB_range = 50;                        // Range at which units consider themselves in CQB
lambs_danger_CQB_formations = ["FILE","DIAMOND"];   // Special CQB Formations )
lambs_danger_minSuppression_range = 25;             // Minimum range for suppression
lambs_danger_panic_chance = 15;                     // Chance of panic  1 out of this number.  (i.e., 1 out of 20 is 5%)

// debug
lambs_danger_debug_FSM = false;                     // FSM level debug messages
lambs_danger_debug_functions = false;               // Function level debug messages 
lambs_danger_debug_FSM_civ = false;                 // FSM level debug messages for civilian fsm 

// radioChecks
lambs_danger_radio_shout = 50;                      // Shout range
lambs_danger_radio_WEST = 1000;                     // Shout range
lambs_danger_radio_EAST = 1000;                     // Shout range
lambs_danger_radio_GUER = 1000;                     // Shout range
lambs_danger_radio_backpack = 2000;                 // Shout range

// mod check
lambs_danger_WP = isClass (configfile >> "CfgPatches" >> "lambs_wp");

// end
true
