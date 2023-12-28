	; DebugItems
	const_def
	const DEBUG_SAVE	; 0

_DebugMenu::
	xor a
	ld [wDisableTextAcceleration], a
	call ClearTilemapEtc
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld hl, wGameTimerPaused
	res GAME_TIMER_PAUSED_F, [hl]
	call ClearTilemap
	ld hl, .MenuHeader
	call LoadMenuHeader
	call DoNthMenu
.loop:
	halt
	jr .loop
	
.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw DebugItems
	dw PlaceMenuStrings
	dw .Strings
	
.Strings:
	db	 "DEBUG"
	next "CANCEL@"
	
DebugItems:
	db 1
	db DEBUG_SAVE
	db -1 ; cancel
	