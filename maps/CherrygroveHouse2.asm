	object_const_def
	const CHERRYGROVEHOUSE2_POKEFAN_M

CherrygroveHouse2_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveHouse2PokefanMScript:
	jumptextfaceplayer CherrygroveHouse2PokefanMText

; CherrygroveHouse2BugCatcherScript:
	; jumptextfaceplayer CherrygroveHouse2BugCatcherText

CherrygroveHouse2Bookshelf:
	jumpstd PictureBookshelfScript

CherrygroveHouse2PokefanMText:
	text "Nothing's better"
	line "than an exercise"
	cont "in maths!"

	para "…Eh? You aren't"
	line "interested…?"
	
	para "But, but, but<……>"
	line "Aw, fine!"

	para "I have a JIRACHI."
	line "I've raised it to"
	
	para "level 100, and it"
	line "knows its most"
	
	para "powerful attack--"
	line "WISH."
	
	para "…Yeah, you guessed"
	line "it. I don't have a"
	
	para "JIRACHI. Guess you"
	line "can't be fooled<……>"
	;cont "Dang it."
	done

CherrygroveHouse2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, CHERRYGROVE_CITY, 7
	warp_event  4,  9, CHERRYGROVE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveHouse2PokefanMScript, -1
