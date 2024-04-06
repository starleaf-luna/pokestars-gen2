	object_const_def
	const VIOLETHOUSE1_POKEFAN_M
	const VIOLETHOUSE1_BUG_CATCHER

VioletHouse1_MapScripts:
	def_scene_scripts

	def_callbacks

VioletHouse1PokefanMScript:
	jumptextfaceplayer VioletHouse1PokefanMText

VioletHouse1BugCatcherScript:
	jumptextfaceplayer VioletHouse1BugCatcherText

VioletHouse1Bookshelf:
	jumpstd PictureBookshelfScript

VioletHouse1PokefanMText:
	text "What is your fa-"
	line "vorite #MON?"

	para "My favorite #-"
	line "MON is LITTEN."
	
	para "It's from ALOLA,"
	line "but I still love"
	cont "it to bits."
	done

VioletHouse1BugCatcherText:
	text "Every #MON has"
	line "a rare form."
	
	para "It's different for"
	line "each one, but the"
	
	para "only difference is"
	line "color."
	done

VioletHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, VIOLET_CITY, 8
	warp_event  5,  7, VIOLET_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, VioletHouse1Bookshelf
	bg_event  1,  1, BGEVENT_READ, VioletHouse1Bookshelf

	def_object_events
	object_event  4,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletHouse1PokefanMScript, -1
	object_event  8,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletHouse1BugCatcherScript, -1
