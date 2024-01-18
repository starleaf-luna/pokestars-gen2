	object_const_def
	const CHERRYGROVEHOUSE4_POKEFAN_M

CherrygroveHouse4_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveHouse4PokefanMScript:
	jumptextfaceplayer CherrygroveHouse4PokefanMText

; CherrygroveHouse4BugCatcherScript:
	; jumptextfaceplayer CherrygroveHouse4BugCatcherText

CherrygroveHouse4Bookshelf:
	jumpstd PictureBookshelfScript

CherrygroveHouse4PokefanMText:
	text "<……>Um, is there"
	line "anything I could"
	cont "help you with?"

	para "Oh, you just"
	line "want to talk…"
	
	para "Well, life's busy,"
	line "so I can't stop to"
	cont "talk, sorry."
	done

CherrygroveHouse4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, CHERRYGROVE_CITY, 9
	warp_event  6,  7, CHERRYGROVE_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveHouse4PokefanMScript, -1
