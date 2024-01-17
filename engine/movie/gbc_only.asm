GBCOnlyScreen:
	ldh a, [hCGB]
	and a
	ret nz
	
.skip
	ld de, MUSIC_KOUKAN
	call PlayMusic

	call ClearTilemap

	; ld hl, GBCOnlyGFX
	; ld de, vTiles1
	; ldh a, [rSVBK]
	; push af
	; ld a, 0 ; this has the same effect as selecting bank 1
	; ldh [rSVBK], a
	; call Decompress
	; pop af
	; ldh [rSVBK], a

	; ld de, GBCOnlyLogo
	; ld hl, vTiles1
	; lb bc, BANK(GBCOnlyLogo), $ff
	; call Get2bpp

	;call LoadStandardFont

	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), $80
	call Get1bpp
	
	ld de, Frames
	ld hl, $8ba0
	lb bc, BANK(Frames), 6
	call Get1bpp

	call DrawGBCOnlyScreen

	call WaitBGMap

; better luck next time
.loop
	halt
	jr .loop

DrawGBCOnlyScreen:
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call Textbox
	
	ld de, GBCOnlyString
	hlcoord 1, 2
	push hl
.loop:
	ld a, [de]
	cp "@"
	ret z
	cp "<NEXT>"
	jp z, .next
	ld [hli], a
	ld c, 3
	call DelayFrames
	inc de
	jr .loop
.next:
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	push hl
	inc de
	jp .loop

GBCOnlyString:
	db   "This GAME PAK is"
	next "only compatible"
	next "with the GAME BOY"
	next "COLOR. Please use"
	next "a GAME BOY COLOR."
	next "       CRYSTALMOON"
	next "@"

GBCOnlyGFX:
INCBIN "gfx/sgb/gbc_only.2bpp"
GBCOnlyGFXEnd:

GBCOnlyLogo:
INCBIN "gfx/sgb/gbc_only_logo.2bpp"
GBCOnlyLogoEnd:
