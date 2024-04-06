; accessible only in the debug builds,
; but I don't see a reason to lock this
; away under "if def(_debug)"

; MinigameTestMenu.Strings & MinigameTestMenu.Jumptable
	const_def
	const MINIGAME_CLRCOINS		; 0
	const MINIGAME_MAXCOINS		; 1
	const MINIGAME_SNAKE		; 2
	const MINIGAME_BLUESPHERE	; 3
DEF MINIGAME_NUMITEMS EQU const_value ; automatic

MinigameTestMenu::
	ld de, MUSIC_MOBILE_ADAPTER
	call PlayMusic
.loop:
	xor a
	ld [wDisableTextAcceleration], a
	ld [wWhichIndexSet], a
	callfar ClearTilemapEtc ; not in bank $83
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld hl, wGameTimerPaused
	res GAME_TIMER_PAUSED_F, [hl]
	ld hl, .MenuHeader
	call LoadMenuHeader
	call MinigameTestMenuJoypadLoop
	call CloseWindow
	ret c
	call ClearTilemap
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, 10
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw MinigameTestMenuItems
	dw PlaceMenuStrings
	dw .Strings
	
.Strings:
	db "CLEAR COINS@"
	db "MAX COINS@"
	db "FLAPPY BIRD C0@"
	db "BLUE SPHERE C0@" ; name is temporary
	
.Jumptable:
	dw ClearCoins
	dw MaxCoins
	dw Snake
	dw BlueSphereClone ; let's find blue balls! :)
	
MinigameTestMenuItems:
	db MINIGAME_NUMITEMS ; 3
	db MINIGAME_CLRCOINS
	db MINIGAME_MAXCOINS
	db MINIGAME_SNAKE
	db MINIGAME_BLUESPHERE
	db -1
	
MinigameTestMenuJoypadLoop:
	call SetUpMenu
	hlcoord 0, SCREEN_HEIGHT - 1
	ld de, CoinsText
	call PlaceString
	hlcoord 7, SCREEN_HEIGHT - 1
	ld de, wMinigameCoins
	lb bc, $82, 5
	call PrintNum
.loop
	ld a, [w2DMenuFlags1]
	set 5, a
	ld [w2DMenuFlags1], a
	;ld a, [wMenuJoypad]
	call GetScrollingMenuJoypad
	ld a, [hJoyDown]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	jr .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button
	scf
	ret
	
CoinsText:
	db "COINS@"
	
NotEnoughCoinsText:
	text "You don't have e-"
	line "nough coins!"
	prompt
	
Snake::
	; ld de, wMinigameCoins
	; ld a, [de]
	; ld h, a
	; inc de
	; ld a, [de]
	; ld l, a
	; ld [hl], a
	; and a
	ret ; nop
	; ld hl, NotEnoughCoinsText
	; jp PrintText
	
ClearCoins::
	xor a
	jr LoadCoinValue
	
MaxCoins::
	ld a, $ff
LoadCoinValue::
	ld [wMinigameCoins], a
	ld [wMinigameCoins+1], a
	ret

BlueSphereClone::
	jp _BlueSphereClone

; TODO: add more opts here:

INCLUDE "engine/minigames/snake.asm"
INCLUDE "engine/minigames/bluesphere.asm"
