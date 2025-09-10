/*
* Whatever stuff is missing that I feel would be convenient.
*/

// Defines
#define COMSIG_KB_MOB_MOVEUP_DOWN "keybinding_mob_moveup_down"
#define COMSIG_KB_MOB_MOVEDOWN_DOWN "keybinding_mob_movedown_down"


/datum/keybinding/mob/moveup
	hotkey_keys = list("Northeast") //Page up
	name = "moveup"
	full_name = "Move up"
	description = "Move up a Z level, if possible"
	keybind_signal = COMSIG_KB_MOB_MOVEUP_DOWN

/datum/keybinding/mob/moveup/down(client/user)
	. = ..()
	if(.)
		return
	var/mob/M = user.mob
	M.up()
	return TRUE

/datum/keybinding/mob/movedown
	hotkey_keys = list("Southeast") //Page down
	name = "movedown"
	full_name = "Move down"
	description = "Move down a Z level, if possible"
	keybind_signal = COMSIG_KB_MOB_MOVEDOWN_DOWN

/datum/keybinding/mob/movedown/down(client/user)
	. = ..()
	if(.)
		return
	var/mob/M = user.mob
	M.down()
	return TRUE


