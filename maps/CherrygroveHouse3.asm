	object_const_def
	const CHERRYGROVEHOUSE3_POKEFAN_M

CherrygroveHouse3_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveHouse3PokefanMScript:
	jumptextfaceplayer CherrygroveHouse3PokefanMText

; CherrygroveHouse3BugCatcherScript:
	; jumptextfaceplayer CherrygroveHouse3BugCatcherText

CherrygroveHouse3Bookshelf:
	jumpstd PictureBookshelfScript

CherrygroveHouse3PokefanMText:
	text "I'm looking at the"
	line "#MON webpage on"
	cont "my computer."

	para "There's nothing I'd"
	line "like more than to"
	
	para "catch my very"
	line "first JIGGLYPUFF,"
	cont "or PICHU or, or<……>"
	done

CherrygroveHouse3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 8
	warp_event  3,  7, CHERRYGROVE_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveHouse3PokefanMScript, -1
