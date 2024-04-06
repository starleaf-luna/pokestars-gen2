; GAMEMODE_BIRD_* constants
	const_def
	const GAMEMODE_SPHERE_TITLE
	const GAMEMODE_SPHERE_PLAY
	const GAMEMODE_SPHERE_DEAD
	const GAMEMODE_SPHERE_WON
	const GAMEMODE_SPHERE_INSTRUCT

; _BlueSphereClone
; A simple Blue Sphere clone
; from S3K/S3/S&K
; Adapt to fit POKÉMON STARS
; STARTED 04 feb 2024
; LAST    04 feb 2024

_BlueSphereClone:
	ld hl, MinigameIncompleteText2
	call PrintText
	call ClearTilemap
	lb bc, BANK(Sphere_TitleGFX), $20
	ld de, Sphere_TitleGFX
	ld hl, $9000
	call Get2bpp
	;call LoadStandardFont ; done already
	xor a ; GAMEMODE_SPHERE_TITLE
	ld [wSphereGamemode], a
.loop:
	ld a, [wSphereGamemode]
	ld hl, .jumptable
	rst JumpTable
	halt
	jr nc, .loop
.quit:
	and a
	ret
.jumptable:
	dw SphereTitle
	dw SphereEngine
	dw SphereWon
	dw SphereDied
	dw SphereInstruct

SphereTitle::
	hlcoord 2, 3
	lb bc, 2, 16
	lb de, 0, 16
	call DrawTitleGraphic_Copy2
	hlcoord 2, 9
	ld de, Sphere_PressStartText
	call PlaceString
.loop
	halt
	call GetJoypad
	ld a, [hJoyDown]
	cp A_BUTTON
	jr z, .start
	cp START
	jr z, .start
	cp B_BUTTON
	jr nz, .loop
	scf
	ret
.start
	call ClearTilemap
	call DelayUntilNoBtnPressed
	ld a, GAMEMODE_SPHERE_INSTRUCT
	ld [wSphereGamemode], a
	ret
SphereEngine:
SphereWon:
SphereDied:
	scf
	ret
	
SphereInstruct:
	hlcoord 1, 1
	ld de, Sphere_InstructText
	call PlaceString
.loop
	halt
	call GetJoypad
	ld a, [hJoyDown]
	cp A_BUTTON
	jr z, .start
	cp START
	jr nz, .loop
.start
	call DelayUntilNoBtnPressed
	call SphereInit
	ld a, GAMEMODE_SPHERE_PLAY
	ld [wSphereGamemode], a
	ret
	
MinigameIncompleteText2:
	text "This minigame is"
	line "still unfinished!"
	prompt
	
SphereInit:
	call RandomiseMap
	lb bc, BANK(Sphere_BGGFX), 1
	ld de, Sphere_BGGFX
	ld hl, $9200
	call Get2bpp
	lb bc, BANK(Sphere_PlayerGFX), $20
	ld de, Sphere_PlayerGFX
	ld hl, $8000
	call Get2bpp
	ret
	
DelayUntilNoBtnPressed::
	halt
	call GetJoypad
	ld a, [hJoyDown]
	and a
	jr nz, DelayUntilNoBtnPressed
	ret

RandomiseMap:
	call Random
	and 15
	add a
	ld c, a
	ld de, SphereMapTable
	ld a, e
	add c
	ld e, a
	ld a, [de]
	ld h, a
	inc de
	ld a, [de]
	ld l, a
	; hl = pointer to map now
	ld bc, 256
	ld de, wSphereMapBuffer
	jp CopyBytes
	
SphereMapTable:
	dw SphereMap0
	dw SphereMap1
	dw SphereMap2
	dw SphereMap3
	dw SphereMap4
	dw SphereMap5
	dw SphereMap6
	dw SphereMap7
	dw SphereMap8
	dw SphereMap9
	dw SphereMapA
	dw SphereMapB
	dw SphereMapC
	dw SphereMapD
	dw SphereMapE
	dw SphereMapF
	
SphereMap0:
SphereMap1:
SphereMap2:
SphereMap3:
SphereMap4:
SphereMap5:
SphereMap6:
SphereMap7:
SphereMap8:
SphereMap9:
SphereMapA:
SphereMapB:
SphereMapC:
SphereMapD:
SphereMapE:
SphereMapF:
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0
	db 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0
	db 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0
	db 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0
	db 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0
	db 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	
DrawTitleGraphic_Copy2:
	; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret
	
; also ball gfx
Sphere_PlayerGFX: INCBIN "gfx/minigames/sphere/player.2bpp"
Sphere_BGGFX: INCBIN "gfx/minigames/sphere/bg.2bpp"
Sphere_TitleGFX: INCBIN "gfx/minigames/sphere/title.2bpp"

Sphere_PressStartText:
	db "-PRESS START-@"
	
Sphere_InstructText:
	db   "Change direction"
	next "with the D-PAD."
	next "Run and grab the"
	next "# BALLS and the"
	next "#MON within!"
	next "PUSH A OR START@"
	