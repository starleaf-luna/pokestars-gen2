	object_const_def
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd DifficultBookshelfScript

ElmsWifeText:
	text "Hi, <PLAYER>! My"
	line "husband was always"

	para "so busy. It's"
	line "sad to see his"
	
	para "sickness finally"
	line "getting to him..."

	para "When he's caught"
	line "up in his #MON"

	para "research, he even"
	line "forgets to eat."
	
	para "That's probably why"
	line "he fell so sick."
	
	para "What's going on"
	line "in GOLINA has also"
	cont "made him worry."
	done

ElmsSonText:
	text "When I grow up,"
	line "I'm going to help"
	cont "my dad!"

	para "I'm going to be a"
	line "great #MON"
	cont "professor!"
	
	para "What's more? I'll"
	line "even go down in"
	
	para "history as the"
	line "#MON MESSIAH!"
	done

ElmsHouseLabFoodText: ; unreferenced
	text "There's some food"
	line "here. It must be"
	cont "for the LAB."
	done

ElmsHousePokemonFoodText: ; unreferenced
	text "There's some food"
	line "here. This must be"
	cont "for #MON."
	done

ElmsHousePCText:
	text "Mail is open on"
	line "the PC screen."

	para "…"
	line "…"
	
	para "To my wife."
	line "How are you?"

	para "I'm currently in"
	line "KANTO at PROF.OAK's"
	cont "LAB."

	para "I'm talking with"
	line "PROF.OAK. He's so"
	cont "nice!"

	para "I asked him if"
	line "he's ever been"
	cont "here. He said no."
	
	para "Well, how's life"
	line "in GOLINA? I'll"
	cont "see you soon!"
	
	para "      ELM"
	
	para "…"
	line "…"

	para "It's a mail to"
	line "ELM's wife,"
	cont "dated MARCH."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	def_object_events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
