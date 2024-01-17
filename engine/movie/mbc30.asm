MBC30Screen::
	ld c, 13
	ld hl, MBC30CompatTestData
	; ld de, MBC30CompatTestDataDuplicate
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "C"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "R"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "Y"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "S"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "T"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "A"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "L"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "M"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "O"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "O"
	jr nz, .mismatch
	inc hl
	ld a, BANK(MBC30CompatTestData)
	call GetFarByte ; get byte at 80:hl
	cp "N"
	ret z
; .innerLoop:
	; ld a, BANK(MBC30CompatTestData)
	; call GetFarByte ; get byte at 80:hl
	; push af
	; ld a, [de]
	; ld b, a ; load b with the corresponding copy in this bank
	; pop af
	; cp b
	; jr nz, .mismatch ; if mismatch at any point, branch
	; inc de
	; inc hl
	; dec c
	; ret z ; return if counter runs out and no mismatch found
	; jr .innerLoop
.mismatch:
	ld de, MUSIC_KOUKAN
	call PlayMusic

	call ClearTilemap
	
	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), $80
	call Get1bpp
	
	ld de, Frames
	ld hl, $8ba0
	lb bc, BANK(Frames), 6
	call Get1bpp

	call DrawMBC30Screen

	call WaitBGMap

; better luck next time
.loop
	halt
	jr .loop
	
DrawMBC30Screen:
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call Textbox
	
	ld de, MBC30IncompatibleString
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
	
MBC30CompatTestDataDuplicate:
	db "CRYSTALMOON"
	
MBC30IncompatibleString:
	db   "This GAME PAK is"
	next "incompatible with"
	next "this emulator."
	next "Please use an emu"
	next "that supports the"
	next "MBC30 mapper."
	next "       CRYSTALMOON"
	next "@"
	