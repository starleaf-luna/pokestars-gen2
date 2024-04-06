	object_const_def
	const VIOLETHOUSE2_POKEFAN_M

VioletHouse2_MapScripts:
	def_scene_scripts

	def_callbacks

VioletHouse2PokefanMScript:
	jumptextfaceplayer VioletHouse2PokefanMText

; VioletHouse2BugCatcherScript:
	; jumptextfaceplayer VioletHouse2BugCatcherText

VioletHouse2Bookshelf:
	jumpstd PictureBookshelfScript

VioletHouse2PokefanMText:
	text "An exercise in"
	line "futility."
	
	para "That's what stan-"
	line "ding up to Team C."
	cont "is."
	
	para "There's no sugar-"
	line "coating that."
	done

VioletHouse2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, VIOLET_CITY, 3
	warp_event  4,  9, VIOLET_CITY, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletHouse2PokefanMScript, -1
