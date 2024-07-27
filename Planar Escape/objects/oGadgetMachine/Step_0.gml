// Rotate gadget
gadgetCounter += 0.05;

// If colliding with a player
if (place_meeting(x, y, oPlayer))
{
	// Player scope
	with (instance_place(x, y, oPlayer))
	{	
		// If a gadget switch
		if (is_undefined(gadget) || gadget.type != other.gadgetType)
		{
			// Switch to the correct gadget
			if (other.gadgetType == GadgetType.GRAPPLE) gadget = new Grapple();
			else delete gadget;
			
			// Gadget sound
			audio_play_sound(sfxGadgetEquipped, 20, false);
		}
	}
}