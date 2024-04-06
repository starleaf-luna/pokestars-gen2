	object_const_def
	const VIOLETCITY_EARL
	const VIOLETCITY_LASS
	const VIOLETCITY_SUPER_NERD
	const VIOLETCITY_GRAMPS
	const VIOLETCITY_YOUNGSTER
	const VIOLETCITY_FRUIT_TREE
	const VIOLETCITY_POKE_BALL1
	const VIOLETCITY_POKE_BALL2
	const VIOLETCITY_DEMO_GUARD1
	const VIOLETCITY_DEMO_GUARD2
	const VIOLETCITY_DEMO_GUARD3
	const VIOLETCITY_DEMO_GUARD4

VioletCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VioletCityFlypointCallback

VioletCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIOLET
	endcallback

VioletCityEarlScript:
	faceplayer
	opentext
	writetext Text_EarlAsksIfYouBeatFalkner
	waitbutton
	closetext
	end

.FollowEarl:
	writetext Text_FollowEarl
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow VIOLETCITY_EARL, PLAYER
	applymovement VIOLETCITY_EARL, VioletCityFollowEarl_MovementData
	turnobject PLAYER, UP
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	stopfollow
	special RestartMapMusic
	opentext
	writetext Text_HereTeacherIAm
	waitbutton
	closetext
	applymovement VIOLETCITY_EARL, VioletCitySpinningEarl_MovementData
	applymovement VIOLETCITY_EARL, VioletCityFinishFollowEarl_MovementData
	playsound SFX_ENTER_DOOR
	disappear VIOLETCITY_EARL
	clearevent EVENT_EARLS_ACADEMY_EARL
	waitsfx
	end
	
VioletCityDemoGuardScript:
	jumptextfaceplayer VioletCityDemoGuardText
	
VioletCityBuildingClosedScript:
	jumptextfaceplayer VioletCityBuildingClosedText

VioletCityLassScript:
	jumptextfaceplayer VioletCityLassText

VioletCitySuperNerdScript:
	jumptextfaceplayer VioletCitySuperNerdText

VioletCityGrampsScript:
	jumptextfaceplayer VioletCityGrampsText

VioletCityYoungsterScript:
	jumptextfaceplayer VioletCityYoungsterText

VioletCitySign:
	jumptext VioletCitySignText

VioletGymSign:
	jumptext VioletGymSignText

SproutTowerSign:
	jumptext SproutTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

VioletCityPokecenterSign:
	jumpstd PokecenterSignScript

VioletCityMartSign:
	jumpstd MartSignScript

VioletCityPPUp:
	itemball PP_UP

VioletCityRareCandy:
	itemball RARE_CANDY

VioletCityFruitTree:
	fruittree FRUITTREE_VIOLET_CITY

VioletCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION

VioletCityFollowEarl_MovementData:
	big_step DOWN
	big_step DOWN
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	big_step DOWN
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	big_step UP
	turn_head DOWN
	step_end

VioletCityFinishFollowEarl_MovementData:
	step UP
	step_end

VioletCitySpinningEarl_MovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

Text_EarlAsksIfYouBeatFalkner:
	text "My CHANSEY died…"
	line "I'm grieving her…"

	para "She is in the"
	line "grave site out"
	cont "east…"
	
	para "But, I can't visit"
	line "her grave… Sob…"
	cont "It's too dangerous…"
	done

Text_VeryNiceIndeed:
	text "Ooh, la la!"
	line "Very indeed nice!"
	done

Text_FollowEarl:
	text "Is that so? Then"
	line "study shall you!"
	cont "Follow me!"
	done

Text_HereTeacherIAm:
	text "Here, teacher I"
	line "am. Good it is"
	cont "you study here!"
	done

VioletCityLassText:
	text "The Game Center on"
	line "the west is what"
	
	para "makes Silbernium"
	line "so famous."

	para "Well, except for"
	line "the Old City…"

	para "It's dangerous to"
	line "visit there, but"	
	cont "lots of people do."
	done

VioletCitySuperNerdText:
	text "So, you're a"
	line "#MON trainer?"

	para "If you beat the"
	line "GYM LEADER here,"

	para "you will prove"
	line "your worthiness!"
	
	para "Team C. will glad-"
	line "ly take you in!"
	done

VioletCityGrampsText:
	text "SOPHIA, from the"
	line "Silbernium Gym…"

	para "She's a really"
	line "good trainer!"

	para "She has started"
	line "just recently,"

	para "but everyone is"
	line "talking about her"
	cont "pure skill!"
	done

VioletCityYoungsterText:
	text "Whatever you do…"
	line "DON'T visit the"
	cont "Old City!"

	para "It's dangerous to"
	line "do so. Trust me!"
	done

VioletCitySignText:
	text "SILBERNIUM CITY"

	para "The City of Silver"
	line "and Prosperity"
	done

VioletGymSignText:
	text "SILBERNIUM CITY"
	line "#MON GYM"
	cont "LEADER: SOPHIA"

	para "The Playful Ghost"
	line "#MON Leader"
	done

SproutTowerSignText:
	text "SILBERNIUM CITY"
	line "GAME CENTER"
	done

EarlsPokemonAcademySignText:
	text "EAST: SILBERNIUM"
	line "#MON GRAVE SITE"
	cont "SILBERN. OLD CITY"
	
	para "KEEP OUT! DANGER"
	line "RISK!"
	done
	
VioletCityDemoGuardText:
	text "Oh… You want to"
	line "continue…?"
	
	para "Well…"
	
	para "See you next demo!"
	line "Love,  CRYSTALMOON"
	
	para "PS. Did you replay"
	line "the beginning?"
	done
	
VioletCityBuildingClosedText:
	text "This building is"
	line "closed."
	done

VioletCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 18,  7, VIOLET_MART, 2
	warp_event 27, 22, VIOLET_GYM, 1
	warp_event 27, 15, VIOLET_HOUSE2, 1
	warp_event 23, 15, VIOLET_NICKNAME_SPEECH_HOUSE, 1
	warp_event 22,  7, VIOLET_POKECENTER_1F, 1
	warp_event 31, 15, VIOLET_KYLES_HOUSE, 1
	warp_event  6, 23, SPROUT_TOWER_1F, 1
	warp_event 35, 15, VIOLET_HOUSE1, 1
	warp_event 11, 31, ROUTE_31_VIOLET_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, VioletCitySign
	bg_event 32, 22, BGEVENT_READ, VioletGymSign
	bg_event 10, 23, BGEVENT_READ, SproutTowerSign
	bg_event 37,  5, BGEVENT_READ, EarlsPokemonAcademySign
	bg_event -1,  0, BGEVENT_READ, VioletCityPokecenterSign
	bg_event -1,  0, BGEVENT_READ, VioletCityMartSign
	bg_event 35, 11, BGEVENT_ITEM, VioletCityHiddenHyperPotion

	def_object_events
	object_event 13, 16, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityEarlScript, EVENT_VIOLET_CITY_EARL
	object_event 28, 28, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityLassScript, -1
	object_event 27, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletCitySuperNerdScript, -1
	object_event 17, 20, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityGrampsScript, -1
	object_event 13,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletCityYoungsterScript, -1
	object_event 15, 32, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityFruitTree, -1
	object_event 14,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VioletCityPPUp, EVENT_VIOLET_CITY_PP_UP
	object_event 35,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VioletCityRareCandy, EVENT_VIOLET_CITY_RARE_CANDY
	object_event 38,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityDemoGuardScript, -1
	object_event 38,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityDemoGuardScript, -1
	object_event 38,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityDemoGuardScript, -1
IF !DEF(_DEBUG)
	object_event 38,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityDemoGuardScript, -1
ENDC
	object_event  6, 24, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityBuildingClosedScript, -1
	; object_event 27, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityBuildingClosedScript, -1
	; object_event 35, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletCityBuildingClosedScript, -1
	