	object_const_def
	const CHERRYGROVEHOUSE1_POKEFAN_M
	const CHERRYGROVEHOUSE1_BUG_CATCHER

CherrygroveHouse1_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveHouse1PokefanMScript:
	jumptextfaceplayer CherrygroveHouse1PokefanMText

CherrygroveHouse1BugCatcherScript:
	jumptextfaceplayer CherrygroveHouse1BugCatcherText

CherrygroveHouse1Bookshelf:
	jumpstd PictureBookshelfScript

CherrygroveHouse1PokefanMText:
	text "On ROUTE 30, there"
	line "is an abandoned"
	cont "house."

	para "Some say that it's"
	line "the home of a"
	
	para "#MON called"
	line "JIRACHI."

	para "Others say it used"
	line "to be a facility"

	para "where TEAM C. used"
	line "to experiment with"
	cont "combining #MON."
	
	para "I personally be-"
	line "lieve the latter."
	
	para "…What do you"
	line "think?"
	done

CherrygroveHouse1BugCatcherText:
	text "#MON all over"
	line "the world wait for"
	
	para "me. That's what I"
	line "like to believe!"

	para "I have a dream"
	line "of catching the"

	para "WISH #MON,"
	line "JIRACHI!"
	
	para "Although I know"
	line "it may not exist…"
	done

CherrygroveHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, CHERRYGROVE_CITY, 6
	warp_event  5,  7, CHERRYGROVE_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CherrygroveHouse1Bookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveHouse1Bookshelf

	def_object_events
	object_event  4,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveHouse1PokefanMScript, -1
	object_event  8,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveHouse1BugCatcherScript, -1
