/*
* Whatever props or items we feel the setting could use.
*/

//FOOD!

/obj/item/food/walnuts
	name = "walnuts"
	icon = 'modular_palisade/icons/props.dmi'
	icon_state = "walnuts"
	onflooricon = 'modular_palisade/icons/onfloor.dmi'
	desc = "Nuts can be munched down, but they do little to sate hunger. Why then do the local kids' eyes light up when they see one? "
	food_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("nuts" = 1)
	foodtypes = GRAIN
	custom_price = PAYCHECK_ASSISTANT * 0.7
	w_class = WEIGHT_CLASS_TINY

/obj/item/food/cheese_curds
	name = "cheese curds"
	icon = 'modular_palisade/icons/props.dmi'
	icon_state = "cheese_curds"
	onflooricon = 'modular_palisade/icons/onfloor.dmi'
	desc = "The ideal snack for health freaks."
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/milk = 3)
	junkiness = 10
	tastes = list("cheese" = 1)
	foodtypes = JUNKFOOD | DAIRY
	custom_price = PAYCHECK_ASSISTANT * 0.7
	w_class = WEIGHT_CLASS_TINY


//ITEMS:

/obj/item/melee/vampirearms/baseball/wiimote
	name = "Wii Remote"
	desc = "Be sure to put the wrist strap on!"
	icon = 'modular_palisade/icons/props.dmi'
	icon_state = "wiimote"
	onflooricon = 'modular_palisade/icons/onfloor.dmi'
	force = 10
	wound_bonus = 1
	throwforce = 25
	attack_verb_continuous = list("beats", "smacks", "maces")
	attack_verb_simple = list("beat", "smack")
	w_class = WEIGHT_CLASS_SMALL


//STRUCTURES:

/obj/structure/showcase/machinery/wii
	name = "Wii"
	desc = "A Nintendo Wii, complete with a cd player."
	icon = 'modular_palisade/icons/props.dmi'
	icon_state = "wii"
	var/wii_on = FALSE
	var/wii_chime = 'modular_palisade/sounds/wii_startup.ogg'

/obj/structure/showcase/machinery/wii/attack_hand(mob/user)
	if(!isliving(user))
		return

	var/mob/living/H = user

	if(wii_on)
		wii_on = FALSE
		to_chat(H, "You turn off the Wii.")
	else
		wii_on = TRUE
		flick("wii_on", src)
		to_chat(H, "You turn on the Wii.")
		playsound(loc, wii_chime, 80, FALSE)


//VENDOR MODIFICATION:

/obj/machinery/mineral/equipment_vendor/fastfood/products
	desc = "Purchase junkfood and crap."
	prize_list = list(new /datum/data/mining_equipment("chocolate bar",	/obj/item/food/vampire/bar,	3),
		new /datum/data/mining_equipment("chips",	/obj/item/food/vampire/crisps,	5),
		new /datum/data/mining_equipment("water bottle",	/obj/item/reagent_containers/food/drinks/bottle/vampirewater,	3),
		new /datum/data/mining_equipment("soda can",	/obj/item/reagent_containers/food/drinks/soda_cans/vampiresoda,	3),
		new /datum/data/mining_equipment("two liter cola bottle",	/obj/item/reagent_containers/food/drinks/bottle/vampirecola,	7),
		new /datum/data/mining_equipment("cola can",	/obj/item/reagent_containers/food/drinks/soda_cans/vampirecola,	5),
		new /datum/data/mining_equipment("summer thaw", /obj/item/reagent_containers/food/drinks/bottle/vampirecola/summer_thaw, 5),
		new /datum/data/mining_equipment("milk",	/obj/item/reagent_containers/food/condiment/vampiremilk,	5),
		new /datum/data/mining_equipment("beer bottle",	/obj/item/reagent_containers/food/drinks/beer/vampire,	10),
		new /datum/data/mining_equipment("blue stripe", /obj/item/reagent_containers/food/drinks/beer/vampire/blue_stripe, 8),
		new /datum/data/mining_equipment("candle pack",	/obj/item/storage/fancy/candle_box,	12),
		new /datum/data/mining_equipment("bruise pack", /obj/item/stack/medical/bruise_pack, 100),
		new /datum/data/mining_equipment("respirator",	/obj/item/clothing/mask/vampire,	35),
		new /datum/data/mining_equipment("walnuts",	/obj/item/food/walnuts,	1),						//Palisade Addition
		new /datum/data/mining_equipment("cheese curds",	/obj/item/food/cheese_curds,	5)		//Palisade Addition
	)
