// Gadget
gadgetType = GadgetType.NONE;
sprGadget = sNone;
gadgetCounter = 0;

/// @func	setGadget({enum.GadgetType} type);
setGadget = function(_type)
{
	if (_type == GadgetType.GRAPPLE)
	{
		gadgetType = GadgetType.GRAPPLE;
		sprGadget = sGrappleHand;
	}
	else
	{
		gadgetType = GadgetType.NONE;
		sprGadget = sNone;
	}
}