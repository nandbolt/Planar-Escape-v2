/// @func   getLevelName({room} room);
/// @desc   Returns the name of the level.
function getLevelName(_room)
{
	switch (_room)
	{
		case rLevelMainCreation1:
			return "on the brink";
			break;
		case rLevelMainCreation2:
			return "ice cold";
			break;
		case rLevelMainCreation3:
			return "pressing on";
			break;
		case rLevelMainCreation4:
			return "grasping flames";
			break;
		case rLevelMainRadiation1:
			return "laser grid";
			break;
		case rLevelMainRadiation2:
			return "powered optics";
			break;
		case rLevelMainRadiation3:
			return "glassware";
			break;
		case rLevelMainRadiation4:
			return "portalaser";
			break;
		case rLevelMainZombification1:
			return "zombification";
			break;
		case rLevelMainZombification2:
			return "zombeams";
			break;
		case rLevelMainZombification3:
			return "growing pains";
			break;
		case rLevelMainZombification4:
			return "portazombie";
			break;
		case rLevelMainPopulation1:
			return "city limits";
			break;
		case rLevelMainPopulation2:
			return "unfree town";
			break;
		case rLevelMainPopulation3:
			return "locked in";
			break;
		case rLevelMainPopulation4:
			return "outta the city";
			break;
		case rLevelMainElectrification1:
			return "zippity zap";
			break;
		case rLevelMainElectrification2:
			return "forces";
			break;
		case rLevelMainElectrification3:
			return "super fried";
			break;
		case rLevelMainElectrification4:
			return "semi circuitry";
			break;
		case rLevelMainMachination1:
			return "robos";
			break;
		case rLevelMainMachination2:
			return "belted";
			break;
		case rLevelMainMachination3:
			return "gadgetry";
			break;
		case rLevelMainMachination4:
			return "logitronics";
			break;
		case rLevelMainTeleportation1:
			return "linked";
			break;
		case rLevelMainTeleportation2:
			return "laserportation";
			break;
		case rLevelMainTeleportation3:
			return "multidimensional";
			break;
		case rLevelMainTeleportation4:
			return "portal logic";
			break;
		case rLevelMainSalvation1:
			return "entity realize";
			break;
		case rLevelMainSalvation2:
			return "entity fight";
			break;
		case rLevelMainSalvation3:
			return "entity accept";
			break;
		case rLevelMainSalvation4:
			return "entity farewell";
			break;
	}
	return "???";
}