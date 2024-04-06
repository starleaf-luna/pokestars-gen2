_TitleScreen:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a
	ld [hSCX], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wTitleScreenSelectedOption
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

; Turn LCD off
	call DisableLCD

; VRAM bank 1
	ld a, 1
	ldh [rVBK], a

; init Jirachi
	ld hl, TitleJirachiGFX
	ld de, vTiles1
	call Decompress
	
IF TITLE_SHOWVER
	lb bc, BANK(TitleVersionFontGFX), 27
	ld de, TitleVersionFontGFX
	ld hl, $8a40
	call Get1bpp
ENDC

; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, 20 * BG_MAP_WIDTH
	xor a
	call ByteFill
	
	hlbgcoord 0, $a
	ld bc, BG_MAP_WIDTH
	ld a, 0 | VRAM_BANK_1
	call ByteFill

; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, vBGMap1
	ld bc, BG_MAP_WIDTH
	ld a, 7 ; palette
	call ByteFill
	
	; ld c, 1
	; ld de, TitleStarGFX
	; ld b, BANK(TitleStarGFX)
	; ld hl, $8b30
	; call Get1bpp

; BG Map 0:

; Apply logo gradient:

; lines 3-4
	hlbgcoord 0, 3
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 2
	call ByteFill
; line 5
	hlbgcoord 0, 5
	ld bc, BG_MAP_WIDTH
	ld a, 3
	call ByteFill
; line 6
	hlbgcoord 0, 6
	ld bc, BG_MAP_WIDTH
	ld a, 4
	call ByteFill
; line 7
	hlbgcoord 0, 7
	ld bc, BG_MAP_WIDTH
	ld a, 5
	call ByteFill
; lines 8-9
	hlbgcoord 0, 8
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 6
	call ByteFill

; 'CRYSTAL VERSION'
	hlbgcoord 5, 9
	ld bc, 11 ; length of version text
	ld a, 1
	call ByteFill

; Jirachi gfx
	hlbgcoord 0, 12
	ld bc, 6 * BG_MAP_WIDTH ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill
	
	hlbgcoord 0, $13
	ld bc, BG_MAP_WIDTH
	ld a, 0 | VRAM_BANK_1
	call ByteFill
	
; Back to VRAM bank 0
	ld a, 0
	ldh [rVBK], a

; Decompress logo
	ld hl, TitleLogoGFX
	ld de, vTiles1
	call Decompress

; Decompress background crystal
	ld hl, TitleCrystalGFX
	ld de, vTiles0
	call Decompress

; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 * BG_MAP_WIDTH
	ld a, " "
	call ByteFill
	
	; di
	; call PlaceStars
	; ei

; Draw Pokemon logo
	hlcoord 0, 3
	lb bc, 7, 20
	ld d, $80
	ld e, 20
	call DrawTitleGraphic

; Initialize running Suicune?
	ld d, $0
	call LoadSuicuneFrame
	call LoadCopyrightGfx

; Initialize background crystal
	;call InitializeBackground

; Update palette colors
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, TitleScreenPalettes
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	
	di
	call DisplayVersionText
	ei

	pop af
	ldh [rSVBK], a

; LY/SCX trickery starts here

	; ldh a, [rSVBK]
	; push af
	; ld a, BANK(wLYOverrides)
	; ldh [rSVBK], a

; Make alternating lines come in from opposite sides

; (This part is actually totally pointless, you can't
;  see anything until these values are overwritten!)

	; ld b, 80 / 2 ; alternate for 80 lines
	; ld hl, wLYOverrides
; .loop
; $00 is the middle position
	; ld [hl], +112 ; coming from the left
	; inc hl
	; ld [hl], -112 ; coming from the right
	; inc hl
	; dec b
	; jr nz, .loop

; Make sure the rest of the buffer is empty
	; ld hl, wLYOverrides + 80
	; xor a
	; ld bc, wLYOverridesEnd - (wLYOverrides + 80)
	; call ByteFill

; Let LCD Stat know we're messing around with SCX
	; ld a, LOW(rSCX)
	; ldh [hLCDCPointer], a

	; pop af
	; ldh [rSVBK], a

; Reset audio
	call ChannelsOff
	call EnableLCD

; Set sprite size to 8x16
	ldh a, [rLCDC]
	set rLCDC_SPRITE_SIZE, a
	ldh [rLCDC], a

	;ld a, +112
	;ldh [hSCX], a
	ld a, -104
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, -112
	ldh [hWY], a

	ld a, TRUE
	ldh [hCGBPalUpdate], a
	
	;ld a, [rLCDC]
	;res 6, a ; window 9800-9bff
	;set 5, a ; window on
	;ld [rLCDC], a

; Update BG Map 0 (bank 0)
	ldh [hBGMapMode], a
	;xor a
	;ld [wSuicuneFrame], a
	
; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	call PlaySFX
	
	; initialise Jirachi
	hlcoord 7, $c ; location
	ld bc, $0706 ; width, height
	ld de, $8006 ; start tile, how many to advance
	call DrawTitleGraphic
	
	xor a
	ld [wTitleScrollCounter], a
	ld b, 4
.loopScrollLogo:
	ld c, 1
	call DelayFrames
	ld a, [hSCY]
	add b
	ld [hSCY], a
	ld a, [wTitleScrollCounter]
	inc a
	ld [wTitleScrollCounter], a
	cp 20
	jr z, .setSpeed1
	cp 38
	jr z, .setSpeed2
	cp 50
	jr nz, .loopScrollLogo
	xor a
	ld [wTitleScrollCounter], a
	ret
.setSpeed1:
	ld b, 2
	jr .loopScrollLogo
.setSpeed2:
	ld b, 1
	jr .loopScrollLogo
	
LoadCopyrightGfx:
	; Draw copyright text
	hlbgcoord 2, 0, vBGMap1
	ld de, GameFreakText
.loop:
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	cp "@"
	jr nz, .loop
	ret
	
PlaceStars:
	ld a, $b3 ; temporary
	hlcoord 3, $d
	ld [hl], a
	hlcoord $f, $b
	ld [hl], a
	hlcoord $d, $12
	ld [hl], a
	hlcoord $13, $13
	ld [hl], a
	ld a, 1
	ld [rVBK], a
	ld a, 0 | VRAM_BANK_1
	hlcoord 3, $d
	ld [hl], a
	hlcoord $f, $b
	ld [hl], a
	hlcoord $d, $12
	ld [hl], a
	hlcoord $13, $13
	ld [hl], a
	ld a, 0
	ld [rVBK], a
	ret
	
GameFreakText:
	db $c, $d, $e, $f, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, "@"

SuicuneFrameIterator:
	ret
	ld hl, wSuicuneFrame
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every eight frames
	and %111
	ret nz

	ld a, c
	and %11000
	sla a
	swap a
	ld e, a
	ld d, 0
	ld hl, .Frames
	add hl, de
	ld d, [hl]
	xor a
	ldh [hBGMapMode], a
	call LoadSuicuneFrame
	ld a, $1
	ldh [hBGMapMode], a
	ld a, $3
	ldh [hBGMapThird], a
	ret

.Frames:
	db $80 ; vTiles3 tile $80
	db $88 ; vTiles3 tile $88
	db $00 ; vTiles5 tile $00
	db $08 ; vTiles5 tile $08

LoadSuicuneFrame:
	hlcoord 6, 12
	ld b, 6
.bgrows
	ld c, 8
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	ld a, SCREEN_WIDTH - 8
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

DrawTitleGraphic::
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

InitializeBackground:
	ld hl, wShadowOAMSprite00
	ld d, -$22
	ld e, $0
	ld c, 5
.loop
	push bc
	call .InitColumn
	pop bc
	ld a, $10
	add d
	ld d, a
	dec c
	jr nz, .loop
	ret

.InitColumn:
	ld c, $6
	ld b, $40
.loop2
	ld a, d
	ld [hli], a ; y
	ld a, b
	ld [hli], a ; x
	add $8
	ld b, a
	ld a, e
	ld [hli], a ; tile id
	inc e
	inc e
	ld a, 0 | PRIORITY
	ld [hli], a ; attributes
	dec c
	jr nz, .loop2
	ret

AnimateTitleCrystal:
; Move the title screen crystal downward until it's fully visible

; Stop at y=6
; y is really from the bottom of the sprite, which is two tiles high
	ld hl, wShadowOAMSprite00YCoord
	ld a, [hl]
	cp 6 + 2 * TILE_WIDTH
	ret z

; Move all 30 parts of the crystal down by 2
	ld c, 30
.loop
	ld a, [hl]
	add 2
	ld [hli], a ; y
rept SPRITEOAMSTRUCT_LENGTH - 1
	inc hl
endr
	dec c
	jr nz, .loop

	ret
	
IF TITLE_SHOWVER
DisplayVersionText:
	hlbgcoord 2, $13, vBGMap0
	ld de, VersionText
.loop:
	ld a, [de]
	cp "@"
	jr z, .done
	ld [hli], a
	inc de
	ld a, [de]
	jr .loop
.done
	ret

pushc
	newcharmap vertext
	charmap "A",	$a4
	charmap "B",	$a5
	charmap "C",	$a6
	charmap "D",	$a7
	charmap "E",	$a8
	charmap "H",	$a9
	charmap "I",	$aa
	charmap "L",	$ab
	charmap "M",	$ac
	charmap "N",	$ad
	charmap "O",	$ae
	charmap "P",	$af
	charmap "R",	$b0
	charmap "S",	$b1
	charmap "T",	$b2
	charmap "V",	$b3
	charmap "0",	$b4
	charmap "1",	$b5
	charmap "2",	$b6
	charmap "3",	$b7
	charmap "4",	$b8
	charmap "5",	$b9
	charmap "6",	$ba
	charmap "7",	$bb
	charmap "8",	$bc
	charmap "9",	$bd
	charmap ".",	$be
	charmap " ",	$bf
	charmap "@",	$50
	
VersionText:
IF STARS_ISDEMO
	db "DEMO {STARS_DEMONUM}@"
ELSE
	db "{STARS_STATUS} VER {STARS_VERSION}@"
ENDC
popc
ENDC

TitleJirachiGFX:
INCBIN "gfx/title/suicune.2bpp.lz"

TitleLogoGFX:
INCBIN "gfx/title/logo.2bpp.lz"

TitleCrystalGFX:
INCBIN "gfx/title/crystal.2bpp.lz"

IF TITLE_SHOWVER
TitleVersionFontGFX:
INCBIN "gfx/title/version_font.1bpp"
ENDC

TitleScreenPalettes:
INCLUDE "gfx/title/title.pal"

; TitleStarGFX:
; INCBIN "gfx/title/star.1bpp"