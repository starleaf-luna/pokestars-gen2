SplashScreen:
; Play the copyright screen and GameFreak Presents sequence.
; Return carry if user cancels animation by pressing a button.

; Reinitialize everything
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTilemap
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ldh [hJoyDown], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call WaitBGMap
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames

; Draw copyright screen
	callfar Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTilemap

; Stop here if not in GBC mode
	farcall GBCOnlyScreen
	
; Check emulator MBC30 compatibility
	farcall MBC30Screen

; Play GameFreak logo animation
	call GameFreakPresentsInit
.joy_loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	call GameFreakPresentsScene
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .joy_loop

.pressed_button
	call GameFreakPresentsEnd
	scf
	ret

.finish
	call GameFreakPresentsEnd
	and a
	ret

GameFreakPresentsInit:
	ld de, GameFreakLogoGFX
	ld hl, vTiles1
	lb bc, BANK(GameFreakLogoGFX), 28
	call Get1bpp

	ld de, GameFreakLogoStarsGFX
	ld hl, vTiles1 tile 28
	lb bc, BANK(GameFreakLogoStarsGFX), 5
	call Request2bpp

	farcall ClearSpriteAnims

	ld hl, wSpriteAnimDict
	ld a, SPRITE_ANIM_DICT_GS_SPLASH
	ld [hli], a
	ld a, $8d
	ld [hl], a
	xor a
	ld [wJumptableIndex], a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 1
	ldh [hBGMapMode], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	lb de, %00100100, %11111000
	call DmgToCgbObjPals

GameFreakPresentsFrame:
; Play one frame of GameFreakPresents sequence.
; Return carry when the sequence completes or is canceled.

	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button

; high bits of wJumptableIndex are recycled for some flags
; this is set when the sequence finished
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish

	farcall PlaySpriteAnimations

	call GameFreakPresentsScene
	call DelayFrame

; ensure carry is cleared
	and a
	ret

.pressed_button
; high bits of wJumptableIndex are recycled for some flags
	ld hl, wJumptableIndex
	set 6, [hl]

.finish
	callfar ClearSpriteAnims
	call ClearTilemap
	call ClearSprites

	ld c, 16
	call DelayFrames

	scf
	ret

GameFreakPresentsScene:
	jumptable .scenes, wJumptableIndex

.scenes
	dw GameFreakPresents_Star
	dw GameFreakPresents_PlaceLogo
	dw GameFreakPresents_LogoSparkles
	dw GameFreakPresents_PlacePresents
	dw GameFreakPresents_WaitForTimer
	dw GameFreakPresents_SetDoneFlag

GameFreakPresents_NextScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret

GameFreakPresents_Wait64Frames: ; unreferenced
	ld c, 64
	call DelayFrames
	call GameFreakPresents_NextScene
	ret

GameFreakPresents_Star:
; tell GameFreakPresents_PlaceLogo we haven't finished yet
	xor a
	ld [wIntroSceneFrameCounter], a

	ld hl, GameFreakLogoPals
	ld de, wOBPals1
	ld bc, 1 palettes
	call CopyBytes

	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_OBJ_GS_GAMEFREAK_LOGO_STAR
	call InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], $80

	ld de, SFX_GAME_FREAK_LOGO_GS
	call PlaySFX

	call GameFreakPresents_NextScene
	ret

GameFreakPresents_PlaceLogo:
; Draw the Game Freak logo (may be initially invisible due to palette)

; wait until the star animation completed
; this counter is set in DoSpriteAnimFrame.GSIntroStar in engine/sprite_anims/functions.asm
	ld a, [wIntroSceneFrameCounter]
	and a
	ret z

	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_OBJ_GAMEFREAK_LOGO
	call InitSpriteAnimStruct

	call GameFreakPresents_NextScene

; set timer for GameFreakPresents_LogoSparkles
	ld a, 128
	ld [wIntroSceneTimer], a
	ret

GameFreakPresents_LogoSparkles:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]

; add first text when timer passes half
	cp 63
	call z, GameFreakPresents_PlaceGameFreak

; add sparkles continuously
	call GameFreakPresents_Sparkle
	ret

.done
; go to the next scene
	ld [hl], 128
	call GameFreakPresents_NextScene
	ret

GameFreakPresents_PlaceGameFreak:
	hlcoord 5, 12
	ld de, .game_freak
	call PlaceString
	ret

.game_freak
	db $80, $81, $82, $83, $8d, $84, $85, $83, $81, $86
	db "@"

GameFreakPresents_PlacePresents:
	hlcoord 7, 13
	ld de, .presents
	call PlaceString

	call GameFreakPresents_NextScene

; set timer for GameFreakPresents_WaitForTimer
	ld a, 128
	ld [wIntroSceneTimer], a
	ret

.presents
	db $87, $88, $89, $8a, $8b, $8c
	db "@"

GameFreakPresents_SetDoneFlag:
; Tell GameFreakPresents_PlayFrame and TitleScreenFrame that we're finished.

	ld hl, wJumptableIndex
	set 7, [hl]
	ret

GameFreakPresents_WaitForTimer:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret
.done
	call GameFreakPresents_NextScene
	ret

GameFreakPresents_UpdateLogoPal:
; called from DoSpriteAnimFrame.GameFreakLogo
; OBP1 was initialized at end of GameFreakPresents_Init

; once we reached the final state, leave it alone
	ldh a, [rOBP1]
	cp %10010000
	ret z

; wait 16 frames before next change
	ld a, [wIntroSceneTimer]
	and $f
	ret nz

; rotate OBP1 by one color slot (2 bits)
; DMG: logo is white, then light gray, then dark gray
; CGB: logo is white, then yellow
	ldh a, [rOBP1]
	rrca
	rrca
	call DmgToCgbObjPal1
	ret

GameFreakPresents_Sparkle:
; Initialize and configure a sparkle sprite.

; run only every second frame
	ld d, a
	and 1
	ret nz

; shift over so our index is still changing by 1 each time
	ld a, d
	srl a

; set up a new sparkle sprite
	push af
	depixel 11, 11
	ld a, SPRITE_ANIM_OBJ_GS_GAMEFREAK_LOGO_SPARKLE
	call InitSpriteAnimStruct
	pop af

; take the bottom 4 bits of a as an index into
; sparkle_vectors (16 entries)
	and %00001111
	ld e, a
	ld d, 0
	ld hl, .sparkle_vectors
	add hl, de
	add hl, de

; set the angle and distance for this sprite
	ld e, l
	ld d, h
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [de]
	ld [hl], a ; angle
	inc de
	inc de
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], 0
	inc hl ; SPRITEANIMSTRUCT_VAR2
	ld a, [de]
	ld [hl], a ; distance
	ret
	
.sparkle_vectors
; values control final position of each sparkle
; position is automatically animated along the vector
; each entry emits two sparkles in opposite directions
; angle (6 bits) and distance (tiles?)
	db $00, $03
	db $08, $04
	db $04, $03
	db $0c, $02
	db $10, $02
	db $18, $03
	db $14, $04
	db $1c, $03
	db $20, $02
	db $28, $02
	db $24, $03
	db $2c, $04
	db $30, $04
	db $38, $03
	db $34, $02
	db $3c, $04

GameFreakLogoGFX:
INCBIN "gfx/splash/gamefreak_presents.1bpp"
INCBIN "gfx/splash/gamefreak_logo.1bpp"

GameFreakLogoStarsGFX:
INCBIN "gfx/splash/logo_star.2bpp"
INCBIN "gfx/splash/logo_sparkle.2bpp"

	; ld de, GameFreakLogoGFX
	; ld hl, vTiles2
	; lb bc, BANK(GameFreakLogoGFX), 28
	; call Get1bpp

	; ldh a, [rSVBK]
	; push af
	; ld a, BANK(wDecompressScratch)
	; ldh [rSVBK], a

	; ld hl, GameFreakDittoGFX
	; ld de, wDecompressScratch
	; ld a, BANK(GameFreakDittoGFX)
	; call FarDecompress

	; ld hl, vTiles0
	; ld de, wDecompressScratch
	; lb bc, 1, 8 tiles
	; call Request2bpp

	; ld hl, vTiles1
	; ld de, wDecompressScratch + $80 tiles
	; lb bc, 1, 8 tiles
	; call Request2bpp

	; pop af
	; ldh [rSVBK], a

	; farcall ClearSpriteAnims
	; depixel 10, 11, 4, 0
	; ld a, SPRITE_ANIM_OBJ_GAMEFREAK_LOGO
	; call InitSpriteAnimStruct
	; ld hl, SPRITEANIMSTRUCT_YOFFSET
	; add hl, bc
	; ld [hl], 160
	; ld hl, SPRITEANIMSTRUCT_VAR1
	; add hl, bc
	; ld [hl], 96
	; ld hl, SPRITEANIMSTRUCT_VAR2
	; add hl, bc
	; ld [hl], 48
	; xor a
	; ld [wJumptableIndex], a
	; ld [wIntroSceneFrameCounter], a
	; ld [wIntroSceneTimer], a
	; ldh [hSCX], a
	; ldh [hSCY], a
	; ld a, 1
	; ldh [hBGMapMode], a
	; ld a, 144
	; ldh [hWY], a
	; lb de, %11100100, %11100100
	; call DmgToCgbObjPals
	; ret

GameFreakPresentsEnd:
	farcall ClearSpriteAnims
	call ClearTilemap
	call ClearSprites
	ld c, 16
	call DelayFrames
GameFreakLogoSpriteAnim:
	ret

; GameFreakPresentsScene:
	; jumptable .scenes, wJumptableIndex

; .scenes
	; dw GameFreakPresents_WaitSpriteAnim
	; dw GameFreakPresents_PlaceGameFreak
	; dw GameFreakPresents_PlacePresents
	; dw GameFreakPresents_WaitForTimer

; GameFreakPresents_NextScene:
	; ld hl, wJumptableIndex
	; inc [hl]
	; ret

; GameFreakPresents_WaitSpriteAnim:
	; ret

; GameFreakPresents_PlaceGameFreak:
	; ld hl, wIntroSceneTimer
	; ld a, [hl]
	; cp 32
	; jr nc, .PlaceGameFreak
	; inc [hl]
	; ret

; .PlaceGameFreak:
	; ld [hl], 0
	; ld hl, .game_freak
	; decoord 5, 10
	; ld bc, .end - .game_freak
	; call CopyBytes
	; call GameFreakPresents_NextScene
	; ld de, SFX_GAME_FREAK_PRESENTS
	; call PlaySFX
	; ret

; .game_freak
	; db $00, $01, $02, $03, $0d, $04, $05, $03, $01, $06
; .end
	; db "@"

; GameFreakPresents_PlacePresents:
	; ld hl, wIntroSceneTimer
	; ld a, [hl]
	; cp 64
	; jr nc, .place_presents
	; inc [hl]
	; ret

; .place_presents
	; ld [hl], 0
	; ld hl, .presents
	; decoord 7, 11
	; ld bc, .end - .presents
	; call CopyBytes
	; call GameFreakPresents_NextScene
	; ret

; .presents
	; db $07, $08, $09, $0a, $0b, $0c
; .end
	; db "@"

; GameFreakPresents_WaitForTimer:
	; ld hl, wIntroSceneTimer
	; ld a, [hl]
	; cp 128
	; jr nc, .finish
	; inc [hl]
	; ret

; .finish
	; ld hl, wJumptableIndex
	; set 7, [hl]
	; ret

; GameFreakLogoSpriteAnim:
	; ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	; add hl, bc
	; ld e, [hl]
	; ld d, 0
	; ld hl, .scenes
	; add hl, de
	; add hl, de
	; ld a, [hli]
	; ld h, [hl]
	; ld l, a
	; jp hl

; .scenes:
	; dw GameFreakLogo_Init
	; dw GameFreakLogo_Bounce
	; dw GameFreakLogo_Ditto
	; dw GameFreakLogo_Transform
	; dw GameFreakLogo_Done

; GameFreakLogo_Init:
	; ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	; add hl, bc
	; inc [hl]
	; ret

; GameFreakLogo_Bounce:
; ; Bounce with a height of 0C, 0C / 48 times.
; ; By default, this is twice, with a height of 96 pixels and 48 pixels.
; ; Sine offset starts at 48 (32+32/2, or pi+pi/2), so it starts at the maximum
; ; value of the sine wave (i.e. the top of the screen).

	; ld hl, SPRITEANIMSTRUCT_VAR1 ; jump height
	; add hl, bc
	; ld a, [hl]
	; and a
	; jr z, .done

; ; Load the sine offset, make sure it doesn't reach the negative part of the wave
	; ld d, a
	; ld hl, SPRITEANIMSTRUCT_VAR2 ; sine offset
	; add hl, bc
	; ld a, [hl]
	; and $3f ; full circle = 2*pi = 2*32
	; cp 32
	; jr nc, .no_negative
	; add 32
; .no_negative

	; ld e, a
	; farcall BattleAnim_Sine_e ; e = d * sin(e * pi/32)
	; ld hl, SPRITEANIMSTRUCT_YOFFSET
	; add hl, bc
	; ld [hl], e

; ; Decrement the sine offset
	; ld hl, SPRITEANIMSTRUCT_VAR2 ; sine offset
	; add hl, bc
	; ld a, [hl]
	; dec [hl]
	; and $1f ; a%32 == 0
	; ret nz

; ; If the ditto's reached the ground, decrement the jump height and play the sfx
	; ld hl, SPRITEANIMSTRUCT_VAR1 ; jump height
	; add hl, bc
	; ld a, [hl]
	; sub 48
	; ld [hl], a
	; ld de, SFX_DITTO_BOUNCE
	; call PlaySFX
	; ret

; .done
	; ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	; add hl, bc
	; inc [hl]
	; ld hl, SPRITEANIMSTRUCT_VAR2
	; add hl, bc
	; ld [hl], 0
	; ld de, SFX_DITTO_POP_UP
	; call PlaySFX
	; ret

; GameFreakLogo_Ditto:
; ; Wait a little, then start transforming
	; ld hl, SPRITEANIMSTRUCT_VAR2 ; frame count
	; add hl, bc
	; ld a, [hl]
	; cp 32
	; jr nc, .start_transform
	; inc [hl]
	; ret

; .start_transform
	; ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	; add hl, bc
	; inc [hl]
	; ld hl, SPRITEANIMSTRUCT_VAR2
	; add hl, bc
	; ld [hl], 0
	; ld de, SFX_DITTO_TRANSFORM
	; call PlaySFX
	; ret

; GameFreakLogo_Transform:
	; ld hl, SPRITEANIMSTRUCT_VAR2 ; frame count
	; add hl, bc
	; ld a, [hl]
	; cp 64
	; jr z, .done
	; inc [hl]

; ; Fade ditto's palettes while it's transforming
	; srl a
	; srl a
	; ld e, a
	; ld d, 0
	; ld hl, GameFreakDittoPaletteFade
	; add hl, de
	; add hl, de
	; ldh a, [rSVBK]
	; push af
	; ld a, BANK(wOBPals2)
	; ldh [rSVBK], a
	; ld a, [hli]
	; ld [wOBPals2 + 12], a
	; ld a, [hli]
	; ld [wOBPals2 + 13], a
	; pop af
	; ldh [rSVBK], a
	; ld a, TRUE
	; ldh [hCGBPalUpdate], a
	; ret

; .done
	; ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	; add hl, bc
	; inc [hl]
	; call GameFreakPresents_NextScene
; GameFreakLogo_Done:
	; ret

; GameFreakDittoPaletteFade:
; INCLUDE "gfx/splash/ditto_fade.pal"

; GameFreakLogoGFX:
; INCBIN "gfx/splash/gamefreak_presents.1bpp"
; INCBIN "gfx/splash/gamefreak_logo.1bpp"

GameFreakLogoPals:
	dw $0000, $03ff, $03ff, $03ff
