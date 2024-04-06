; GAMEMODE_BIRD_* constants
	const_def
	const GAMEMODE_BIRD_TITLE
	const GAMEMODE_BIRD_DEAD
	const GAMEMODE_BIRD_PLAY
	const GAMEMODE_BIRD_WON

_Snake: ; actually Flappy Bird lol
	; now unused
	ld hl, MinigameIncompleteText1
	call PrintText
	call ClearTilemap
	lb bc, BANK(FlappyBG), $50
	ld de, FlappyBG
	ld hl, $8800
	call Get2bpp
	lb bc, BANK(FlappyOBJ), 8
	ld de, FlappyOBJ
	ld hl, $8000
	call Get2bpp
	xor a ; GAMEMODE_BIRD_TITLE
	ld [wBirdGamemode], a
.loop:
	ld a, [wBirdGamemode]
	ld hl, .jumptable
	rst JumpTable
	halt
	jr nc, .loop
.quit:
	and a
	ret
.jumptable:
	dw FlapTitle
	dw FlapDead
	dw FlapEngine
	dw FlapDead2

FlapTitle::
	hlcoord 2, 3
	lb bc, 2, 16
	lb de, $80, 16
	call DrawTitleGraphic_Copy1
.loop
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
FlapDead:
FlapEngine:
FlapDead2:
	scf
	ret
	
MinigameIncompleteText1:
	text "This minigame is"
	line "still unfinished!"
	prompt
	
FlappyBG:
	INCBIN "gfx/minigames/flap/flapbg.2bpp"
FlappyOBJ:
	INCBIN "gfx/minigames/flap/flaobj.2bpp"
FlappyGFXEnd:
	
DrawTitleGraphic_Copy1:
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
	