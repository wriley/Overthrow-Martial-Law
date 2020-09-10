class CfgFunctions
{
	class OT
	{
		class Base
		{
			file = "\overthrow_main\functions";
			class initVar {};
			class initOverthrow {};
			class initBaseVar {};
		};

        class Cleanup
		{
			file = "\overthrow_main\functions\cleanup";
			class cleanup {};
			class cleanDead {};
		};

		class Factions
		{
			file = "\overthrow_main\functions\factions";
			class factionNATO {};
			class factionGUER {};
			class factionCIV {};
			class factionCRIM {};
			class unitSeen {};
			class unitSeenNATO {};
			class unitSeenCRIM {};
			class unitSeenCIV {};
			class unitSeenPlayer {};
			class unitSeenAny {};
			class revealToNATO {};
			class revealToCRIM {};
			class revealToResistance {};
			class revealNATOFOB {};
		};

		/* Persistent Save */
		class Save
		{
			file = "\overthrow_main\functions\save";
			class saveGame {};
			class loadGame {};
			class setOfflinePlayerAttribute {};
			class getOfflinePlayerAttribute {};
			class loadPlayerData {};
			class savePlayerData {};
			class autoSaveToggle {};
			class autoloadToggle {};
		};

		class sleep
		{
			file = "\overthrow_main\functions\sleep";
			class startSleeping {};
		};

		class admin
		{
			file = "\overthrow_main\functions\admin";
			class toggleZeus {};
		};

		class Loop
		{
			file = "\overthrow_main\functions\loop";
			class initActionLoop {};
			class addActionLoop {};
			class removeActionLoop {};
		};

		class Player
		{
			file = "\overthrow_main\functions\player";
			class initPlayerLocal {};
			class mapSystem {};
			class mapHandler {};
			class notificationLoop {};
			class townCheckLoop {};
			class perkSystem {};
			class setupPlayer {};
			class statsSystem {};
			class statsSystemLoop {};
			class wantedSystem {};
			class wantedLoop {};
			class unconsciousNoHelpPossible {};
			class playerIsOwner {};
			class playerIsGeneral {};
			class playerIsAtWarehouse {};
			class playerIsAtHardwareStore {};
			class playerIsAtStore {};
			class tutorial {};
			class influence {};
			class influenceSilent {};
			class rewardMoney {};
			class money {};
			class getPlayerHome {};
			class generalIsOnline {};
			class doConversation {};
			class givePlayerWaypoint {};
			class clearPlayerWaypoint {};
			class hasWeaponEquipped {};
			class carriesStaticWeapon {};
			class illegalInCar {};
			class illegalInInventory {};
			class detectedByReputation {};
			class detectedByReputationNATO {};
			class gangRep {};
			class holsterHandGun {};
		};

		class Interaction
		{
			file = "\overthrow_main\functions\interaction";
			class mountAttached {};
			class initAttached {};
			class updateAttached {};
			class initObjectLocal {};
			class initStaticMGLocal {};
		};

		class Events
		{
			file = "\overthrow_main\functions\events";
			class deathHandler {};
			class buildingDamagedHandler {};
			class buildingHitHandler {};
			class cargoLoadedHandler {};
			class explosivesPlacedHandler {};
			class playerConnectHandler {};
			class playerDisconnectHandler {};
			class refuelHandler {};
			class respawnHandler {};
			class keyHandler {};
			class taggedHandler {};
			class wheelRemovedHandler {};
			class enemyDamagedHandler {};
			class QRFStartHandler {};
			class QRFEndHandler {};
		};

		class UI
		{
			file = "\overthrow_main\functions\UI";
			class notifyMinor {};
			class notifyBig {};
			class notifyGood {};
			class notifyBad {};
			class notifySilent {};
			class notifyVehicle {};
			class playerDecision {};
			class choiceMade {};
			class notifyStart {};
			class progressBar {};
			class getAssignedKey {};
			class formatTime {};
			class notifyAndLog {};
			class dynamicText {};
			class topMessage {};
			class dialogFadeIn {};
		};

		class Dialogs
		{
			file = "\overthrow_main\functions\UI\dialogs";

			class mainMenu {};
			class buyDialog {};
			class sellDialog {};
			class buyDialogVehicle {};
			class sellDialogVehicle {};
			class workshopDialog {};
			class policeDialog {};
			class warehouseDialog {};
			class inputDialog {};
			class importDialog {};
			class recruitDialog {};
			class buyClothesDialog {};
			class buyVehicleDialog {};
			class gunDealerDialog {};
			class factoryDialog {};
			class garrisonDialog {};
			class newGameDialog {};
			class optionsDialog {};
			class resistanceDialog {};
			class reverseEngineerDialog {};
			class vehicleDialog {};
			class mapInfoDialog {};
			class characterSheetDialog {};
			class manageRecruitsDialog {};
			class loadoutDialog {};
			class buyHardwareDialog {};
			class sellHardwareDialog {};
			class jobsDialog {};
			class craftDialog {};
			class uploadData {};
			class logisticsDialog {};
			class manageBusinessDialog {};
		};

		class Display
		{
			file = "\overthrow_main\functions\UI\display";
			class displayShopPic {};
			class displayWarehousePic {};
			class showMemberInfo {};
			class refreshEmployees {};
			class displayJobDetails {};
			class displayCraftItem {};
			class refreshFactory {};
			class refreshBusiness {};
			class refreshWarehouse {};
			class displayLogisticDetails {};
		};

		/*
		* User actions
		*/
		class Actions
		{
			file = "\overthrow_main\functions\actions";

			class newGame {};

			/* Main Menu */
			class salvageWreck {};
			class buyBuilding {};
			class buyBusiness {};
			class manageArea {};
			class fastTravel {};
			class talkToCiv {};
			class recruitCiv {};
			class recruitSpawnCiv {};
			class leaseBuilding {};
			class place {};
			class onNameDone {};
			class onNameKeyDown {};
			class setHome {};
			class build {};

			/* Options */
			class increaseTax {};
			class decreaseTax {};

			/* Vehicle */
			class transferTo {};
			class transferFrom {};
			class transferHelper {};
			class transferLegit {};
			class takeLegit {};
			class recover {};
			class UnownVehicle {};

			/* Warehouse */
			class storeAll {};
			class warehouseTake {};
			class warehouseTransfer {};

			/* Port */
			class exportAll {};
			class import {};

			/* Workshop */
			class workshopAdd {};

			/* Shop */
			class buy {};
			class sell {};
			class sellAll {};

			/* Factory */
			class factoryQueueAdd {};
			class factoryQueueRemove {};
			class factoryQueueRemoveAll {};
			class businessQueueAdd {};
			class businessQueueRemove {};
			class businessQueueRemoveAll {};

			/* Resistance Screen */
			class makeGeneral {};
			class giveFunds {};
			class takeFunds {};
			class transferFunds {};
			class hireEmployee {};
			class fireEmployee {};
			class setVehicleWaypoint {};

			/* Jobs */
			class setJobWaypoint {};
			class requestJobResistance {};
			class requestJobGang {};
			class requestJobShop {};
			class requestJobFaction {};

			/* Safe */
			class safePutMoney {};
			class safeTakeMoney {};
			class safeSetPassword {};

			/* Ammobox */
			class removeLoadout {};
			class restoreLoadout {};
			class saveLoadout {};
			class dumpStuff {};
			class dumpIntoWarehouse {};
			class takeStuff {};
			class openArsenal {};

			/* Other */
			class craft {};
			class recruitSoldier {};
			class recruitSquad {};
			class editLoadout {};
			class editPoliceLoadout {};
			class addGarrison {};
			class addPolice {};
			class lockVehicle {};
			class reverseEngineer {};
			class playSound {};
            class canPlace {};
			class vehicleCanMove {};
			class unflipVehicle {};
			class triggerBattle {};

		};

		class SelfActions
    	{
        	file = "\overthrow_main\functions\actions\self";
			/* Spliffs */
			class startSpliff {};
			class stopSpliff {};
			class smokeAnimation {};
			class smokePuffs {};
		};

		/*
		* Locations, positions etc.
		*/
		class Geography
		{
			file = "\overthrow_main\functions\geography";
			class getRandomBuilding {};
			class nearestBase {};
			class nearestCheckpoint {};
			class nearestComms {};
			class nearestLocation {};
			class nearestMobster {};
			class nearestObjective {};
			class nearestObjectiveNoComms {};
			class nearestObjectiveOrFOB {};
			class nearestObjectiveOrBase {};
			class nearestObjectiveOrCommsOrBaseOrFob {};
			class nearestPositionRegion {};
			class nearestTown {};
			class getRegion {};
			class townsInRegion {};
			class regionIsConnected {};
			class getAO {};
			class getBuildingId {};
			class getBuildingDamage {};
			class weatherSystem {};
			class getRandomRoadPosition {};
			class isRadarInRange {};
			class positionIsAtWarehouse {};
			class nearestWarehouse {};
			class getposNoWater {};
			class playerInRange {};
		};

		/*
		* The spawner
		*/
		class Virtualization
		{
			file = "\overthrow_main\functions\virtualization";
			class initVirtualization {};
			class runVirtualization {};
			class spawn {};
			class despawn {};
			class inSpawnDistance {};
			class registerSpawner {};
			class deregisterSpawner {};
			class updateSpawnerPosition {};
			class resetSpawn {};
		};

		class Spawners
		{
			file = "\overthrow_main\functions\virtualization\spawners";

			class spawnAmbientVehicles {};
			class spawnBoatDealers {};
			class spawnBusinessEmployees {};
			class spawnCarDealers {};
			class spawnCivilians {};
			class spawnFactionRep {};
			class spawnGendarmerie {};
			class spawnGunDealer {};
			class spawnNATOCheckpoint {};
			class spawnNATOObjective {};
			class spawnPolice {};
			class spawnShops {};
		};

		/*
		* The economy, trade and real estate
		*/
		class Economy
		{
			file = "\overthrow_main\functions\economy";
			class initEconomy {};
			class initEconomyLoad {};
			class setupTownEconomy {};
			class support {};
			class getPrice {};
			class getSellPrice {};
			class getDrugPrice {};
			class nearestRealEstate {};
			class getRealEstateData {};
			class getBusinessData {};
			class getBusinessPrice {};
			class getTaxIncome {};
			class resistanceFunds {};
			class incomeSystem {};
			class propagandaSystem {};
			class stability {};
			class getControlledPopulation {};
		};

		/*
		* Inventory transfer and manegement
		*/
		class Inventory
		{
			file = "\overthrow_main\functions\inventory";
			class takeFromCargoContainers {};
			class hasFromCargoContainers {};
			class anythingGetName {};
			class weaponGetName {};
			class magazineGetName {};
			class vehicleGetName {};
			class glassesGetName {};
			class weaponGetPic {};
			class magazineGetPic {};
			class vehicleGetPic {};
			class glassesGetPic {};
			class magazineGetDescription {};
			class vehicleGetDescription {};
			class getSearchStock {};
		};

		/*
		* The warehouse
		*/
		class Warehouse
		{
			file = "\overthrow_main\functions\warehouse";
			class addToWarehouse {};
			class removeFromWarehouse {};
			//class findHelmetInWarehouse {};
			//class findScopeInWarehouse {};
			//class findWeaponInWarehouse {};
			//class findVestInWarehouse {};
			class verifyLoadoutFromWarehouse {};
			//class applyLoadoutFromWarehouse {};
			class qtyInWarehouse {};
			class isInWarehouse {};
		};

		/*
		* AI and recruits
		*/
		class AI
		{
			file = "\overthrow_main\functions\AI";
			class createSoldier {};
			class getSoldier {};
			class getSquad {};
			class NATOsearch {};
			class NATOCpSearch {};
			class createSquad {};
			class experience {};
			class dangerCaused {};
			class randomizeLoadout {};
			class getRandomLoadout {};
			class paraAll {};
			class para {};
			class haloAll {};
			class halo {};
		};

		/*
		* AI orders
		*/
		class Orders
		{
			file = "\overthrow_main\functions\AI\orders";
			class orderMove {};
			class orderLoot {};
			class orderOpenInventory {};
			class orderOpenArsenal {};
			class orderRevivePlayer {};
			class squadAssignVehicle {};
			class squadGetIn {};
			class squadGetOut {};
			class squadGetInMyVehicle {};
			class orderStopAndFace {};
		};

		/*
		* NPCs
		*/
		class NPC
		{
			file = "\overthrow_main\functions\AI\NPC";
			class randomLocalIdentity {};
			class applyIdentity {};
			class initCarDealer {};
			class initCivilian {};
			class initCivilianGroup {};
			class initCriminal {};
			class initCriminalGroup {};
			class initCrimLeader {};
			class initGendarm {};
			class initGendarmPatrol {};
			class initGunDealer {};
			class initHarbor {};
			class initMilitary {};
			class initMilitaryVeh {};
			class initMilitaryPatrol {};
			class initMobBoss {};
			class initMobster {};
			class initNATOCheckpoint {};
			class initPolice {};
			class initPolicePatrol {};
			class initPriest {};
			class initShopkeeper {};
			class initSniper {};
			class initRecruit {};
		};

		/*
		* Math.. how does it work?
		*/
		class Math
		{
			file = "\overthrow_main\functions\math";
			class rotationMatrix {};
			class matrixMultiply {};
			class matrixRotate {};
		};

		/*
		* NATO
		*/
		class NATO
		{
			file = "\overthrow_main\functions\factions\NATO";
			class initNATO {};

			class NATOQRF {};
			class NATOGroundForces {};
			class NATOGroundReinforcements {};
			class NATOArtySupport {};
			class CTRGSupport {};
			class NATOAirSupport {};
			class NATOGroundSupport {};
			class NATOTankSupport {};
			class NATOSeaSupport {};
			class NATOScrambleJet {};
			class NATOAPCInsertion {};
			class NATOScrambleHelicopter {};
			class NATOGroundPatrol {};
			class NATOAirPatrol {};

			class NATOResponseObjective {};
			class NATOResponseTown {};
			class NATOCounterTown {};
			class NATOCounterObjective {};

			class NATOSupportSniper {};
			class NATOSupportRecon {};
			class NATOConvoy {};
			class NATODeployFOB {};
			class NATOMissionDeployFOB {};
			class NATOMissionReconDestroy {};
			class NATOSetExplosives {};
			class NATOupgradeFOB {};
			class NATOsendGendarmerie {};
			class NATOreportThreat {};
			class NATOGetAttackVectors {};
			class landAndCleanupHelicopter {};
		};

		class NATOAI
		{
			file = "\overthrow_main\functions\factions\NATO\AI";
			class NATODrone {};
			class NATOMortar {};
		};

		class CRIM
		{
			file = "\overthrow_main\functions\factions\CRIM";
			class CRIMLoop {};
			class formOrJoinGang {};
			class formGang {};
			class addToGang {};
			class gangJoinResistance {};
		};

		class GUER
		{
			file = "\overthrow_main\functions\factions\GUER";
			class jobSystem {};
			class assignJob {};
			class acceptJob {};
			class denyJob {};
			class startJob {};
			class jobLoop {};
			class GUERLoop {};
		};

		class Buildings
		{
			file = "\overthrow_main\functions\buildings";
			class initBuilding {};
			class initObservationPost {};
			class initPoliceStation {};
			class initWorkshop {};
			class initTrainingCamp {};
			class initWarehouse {};
			class initRadar {};
		};

        class Util
		{
			file = "\overthrow_main\functions\util";
			class getOwner {};
			class getOwnerUnit {};
      		class hasOwner {};
			class setOwner {};
			class unitStock {};
      		class spawnTemplate {};
			class sortBy {};
			class sortByInplace {};
			class findReplace {};
			class exportPrices {};
			class datestamp {};
			class logVerbose {};
		};

		/*
		* Mod integration
		*/
		class Integration
		{
			file = "\overthrow_main\functions\integration";
			class advancedTowingInit {};
			class detectItems {};
		};
	};

	class SHK_pos {
		class Functions {
			file="\overthrow_main\functions\geography\SHK_pos";

			class findClosestPosition {};
			class getMarkerCorners {};
			class getMarkerShape {};
			class getPos {};
			class getPosFromCircle {};
			class getPosFromEllipse {};
			class getPosFromRectangle {};
			class getPosFromSquare {};
			class isBlacklisted {};
			class isInCircle {};
			class isInEllipse {};
			class isInRectangle {};
			class isSamePosition {};
			class rotatePosition {};

			class getPosWrapper {};
			class getPosMarkerWrapper {};
			class pos {};
		};
	};

	class VCOM
	{
		tag = "VCM";

		class FSM
		{
			file = "\overthrow_main\functions\AI\Vcom\FSMS";

			// group spawn VCM_fnc_SQUADBEH
			class SQUADBEH
			{
				ext = ".fsm";
			};

			// [] spawn VCM_fnc_AIDRIVEBEHAVIOR
			class AIDRIVEBEHAVIOR
			{
				ext = ".fsm";
			};

			// [] spawn VCM_fnc_PLAYERSQUAD
			class PLAYERSQUAD
			{
				ext = ".fsm";
			};

		};

		class Functions
		{
			file = "\overthrow_main\functions\AI\Vcom\Functions\VCM_Functions";

			//[] spawn VCM_fnc_VcomInit;
			class VcomInit {};

			// [unitToRearm, rearmLocation] spawn VCM_fnc_ActRearm
			class ActRearm {};

			// [unit, source, damage, instigator] call VCM_fnc_AIHIT;
			class AIHIT {};

			// [group] call VCM_fnc_ArmStatics;
			class ArmStatics {};

			// [callGroup, enemyGroup] call VCM_fnc_ArtyCall;
			class ArtyCall {};

			// group call VCM_fnc_ArtyManage;
			class ArtyManage {};

			// [entity, unit] call VCM_fnc_BoxNrst;
			class BoxNrst {};

			// unit call VCM_fnc_CheckArty;
			class CheckArty {};

			// [string] call VCM_fnc_Classname;
			class Classname {};

			// [group, enemy] call VCM_fnc_ClearBuilding;
			class ClearBuilding {};

			// unit call VCM_fnc_ClstEmy;
			class ClstEmy {};

			// [list, object, order, script] call VCM_fnc_ClstObj;
			class ClstObj {};

			// [unit, killer] call VCM_fnc_ClstWarn;
			class ClstWarn {};

			// [group, searchDistance] call VCM_fnc_EmptyStatic;
			class EmptyStatic {};

			// unit call VCM_fnc_EnemyArray;
			class EnemyArray {};

			// [groupLeader] call VCM_fnc_FindCover;
			class FindCover {};

			// [groupLeader] spawn VCM_fnc_FlankMove;
			class FlankMove {};

			// [groupLeader] call VCM_fnc_ForceMove;
			class ForceMove {};

			// unit call VCM_fnc_FriendlyArray;
			class FriendlyArray {};

			// unit call VCM_fnc_FrmChnge;
			class FrmChnge {};

			// group spawn VCM_fnc_Garrison;
			class Garrison {};

			// group call VCM_fnc_GarrisonLight;
			class GarrisonLight {};

			// unit call VCM_fnc_HasMine;
			class HasMine {};

			// unit call VCM_fnc_HealSelf;
			class HealSelf {};

			// [unit, weapon, muzzle, mode, ammo, magazine, bullet, gunner] call VCM_fnc_HearingAids;
			class HearingAids {};

			// [object, searchRadius, precision, sortingOrder] call VCM_fnc_Heights;
			class Heights {};

			// [] call VCM_fnc_IRCHECK;
			class IRCHECK {};

			// group call VCM_fnc_KitChk;
			class KitChk {};

			// [array, unitToReveal, revealAmount] call VCM_fnc_KnowAbout;
			class KnowAbout {};

			// group call VCM_fnc_MedicalHandler
			class MedicalHandler {};

			//[medic, injuredUnit] spawn VCM_fnc_MedicHeal;
			class MedicHeal {};

			// [] spawn VCM_fnc_MineMonitor;
			class MineMonitor {};

			// [unit, mineArray] spawn VCM_fnc_MinePlant;
			class MinePlant {};

			// [gunner, backpackClassname, staticWeapon] call VCM_fnc_PackStatic;
			class PackStatic {};

			// group call VCM_fnc_RearmSelf;
			class RearmSelf {};

			// group call VCM_fnc_RMedics;
			class RMedics {};

			// group call VCM_fnc_RStatics;
			class RStatics {};

			// [unit, satchelArray] spawn VCM_fnc_SatchelPlant;
			class SatchelPlant {};

			// group call VCM_fnc_SquadExc;
			class SquadExc {};

			// group call VCM_fnc_WyptChk;
			class WyptChk {};

			//group call VCM_fnc_VehicleCommandeer;
			class vehiclecommandeer {};

			//group call VCM_fnc_VehicleCheck;
			class VehicleCheck {};

			//group call VCM_fnc_VehicleMove;
			class VehicleMove {};

			//group call VCM_fnc_IsTransport;
			class IsTransport {};

			//[_pos,_dist,_params] call VCM_fnc_isFlatEmpty;
			class isFlatEmpty {};

			//[] call VCM_fnc_CBASettings;
			class CBASettings {};

			//[] call VCM_fnc_SniperList
			class SniperList {};

			//[] spawn VCM_fnc_SniperEngage;
			class SniperEngage;

			//[] spawn VCM_fnc_RangeEngage;
			class RangeEngage;

			//[] call VCM_fnc_ClstKnwnEnmy;
			class ClstKnwnEnmy;

			// unit call VCM_fnc_IsDriver;
			class IsDriver {};

			//unit call VCM_fnc_VehicleDetection;
			class VehicleDetection {};

			//[unit,4] call VCM_fnc_MovePrediction;
			class MovePrediction {};

			//[] call VCM_fnc_UpdateDrivers;
			class UpdateDrivers {};

			//[] call VCM_fnc_IdleAnimations;
			class IdleAnimations {};

			//[] call VCM_fnc_CoverDetect;
			class CoverDetect {};

			//[] call VCM_fnc_CoverControl;
			class CoverControl {};

			//[] call VCM_fnc_Scheduler;
			class Scheduler {};

			//[AIArray] call VCM_fnc_ResetAnimation;
			class ResetAnimation {};

			//[AI,TRUE] call VCM_fnc_ForceGrenadeFire; //0 = Unit to throw the grenade 1=true, throw grenade, false, throw smoke
			class ForceGrenadeFire {};

			//[Unit,"Text"] call VCM_fnc_DebugText;
			class DebugText {};

			//[squadleader] call VCM_fnc_AISpeed;
			class AISpeed {};

			//[_StaticList] call VCM_fnc_StaticCheck;
			class StaticCheck {};

			//[_Unit,_Pos OR Obj] spawn VCM_fnc_DebugLine;
			class DebugLine {};

			//[_unit, true] spawn VCM_fnc_BabeOver;
			class BabeOver {};

			//_Group spawn VCM_fnc_UseEM;
			class UseEM {};

			//["_Unit","_Array"] spawn VCM_fnc_3DPathDebug;
			class 3DPathDebug {};
		};

	};

    class lambs_danger{
		//lambs danger fsm
		class functions
		{
            file = "\overthrow_main\functions\Lambs_functions";
            class assault{};
            class assaultBuilding{};
            //class assaultCQB;
            class checkBody{};
            class coward{};
            class debugDangerType{};
            class debugMarkerColor{};
            class dotMarker{};
            class gesture{};
            class hideInside{};
            class immediateAction{};
            class immediateActionEH{};
			class indoor{};
            class leaderArtillery{};
            class leaderAssess{};
            class leaderBuildings{};
            class leaderCQC{};
            class leaderHide{};
            class leaderManoeuvre{};
            class leaderMode{};
            class leaderModeUpdate{};
            class nearBuildings{};
            class panic{};
            class react{};
            class shareInformation{};
            class shareInformationRange{};
            class suppress{};
            class vehicleAssault{};
            class vehicleJink{};
            class vehicleRotate{};
            class vehicleSuppress{};
            class zoneMarker{};
            class zettings {preinit = 1;};
        };
    };

	class lambs_wp {
        class functionsAI {
            file = "overthrow_main\functions\lambs_dangerWP\ai";
            class taskArtillery;
            class taskArtilleryRegister;
            class taskAttack;
            class taskCamp;
            class taskCQB;
            class taskCreep;
            class taskGarrison;
            class taskHunt;
            class taskPatrol;
            class taskRush;
        };
    };

	class LAMBS_DangerAI {
		displayName = "Advanced AI [LAMBS]";
        class LAMBS_Danger_Attack {
            displayName = "0 TASK ATTACK [Enters buildings]";
            displayNameDebug = "LAMBS_Danger_Attack";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskAttack.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\SeekAndDestroy_ca.paa";
			tooltip = "Units assault position and check buildings around waypoint out to WP completion radius (default 25m)";
        };
        class LAMBS_Danger_Garrison {
            displayName = "1 TASK GARRISON";
            displayNameDebug = "LAMBS_Danger_Garrison";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskGarrison.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Guard_ca.paa";
			tooltip = "Garrisons units in buildings around waypoint out to WP completion radius (default 50m)";
        };
        class LAMBS_Danger_Patrol {
            displayName = "2 TASK PATROL";
            displayNameDebug = "LAMBS_Danger_Patrol";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskPatrol.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Loiter_ca.paa";
			tooltip = "Randomised patrol within WP completion radius (Default 200m)";
        };
        class LAMBS_Danger_Rush {
            displayName = "3 TASK RUSH";
            displayNameDebug = "LAMBS_Danger_Rush";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskRush.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Sentry_ca.paa";
			tooltip = "Rushes players within WP completion radius (Default 1000m)\nOnly targets players!";
        };
        class LAMBS_Danger_Hunt {
            displayName = "4 TASK HUNT";
            displayNameDebug = "LAMBS_Danger_Hunt";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskHunt.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Sentry_ca.paa";
			tooltip = "Hunts players within WP completion radius (Default 1000m)\nOnly targets players!";
        };
        class LAMBS_Danger_Creep {
            displayName = "5 TASK CREEP";
            displayNameDebug = "LAMBS_Danger_Creep";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskCreep.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Sentry_ca.paa";
			tooltip = "Stalks players within WP completion radius (Default 1000m)\nOnly targets players!";
        };
        class LAMBS_Danger_CQB {
            displayName = "6 TASK CQB [Experimental]";
            displayNameDebug = "LAMBS_Danger_CQB";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskCQB.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\SeekAndDestroy_ca.paa";
			tooltip = "Clears buildings around the waypoint out to WP completion radius (Default 50m)";
        };
        class LAMBS_Danger_Artillery {
            displayName = "9 REGISTER ARTILLERY";
            displayNameDebug = "LAMBS_Register_Artillery";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskArtilleryRegister.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Scripted_ca.paa";
			tooltip = "Registers artillery for dynamic use";
        };
    };
};
