StarsIntro:: ; unused routine
	xor a
	ld [wJumptableIndex], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wGBCPalettes)
	ldh [rSVBK], a
	ldh a, [hInMenu]
	push af
	ldh a, [hVBlank]
	push af
	call .InitRAMAddrs
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .ShutOffMusic
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call StarsIntroSceneJumper
	farcall PlaySpriteAnimations
	call DelayFrame
	jp .loop

.ShutOffMusic
	ld de, MUSIC_NONE
	call PlayMusic

.done
	farcall ClearBGPalettes
	farcall ClearSprites
	farcall ClearTilemap
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	pop af
	ldh [hVBlank], a
	pop af
	ldh [hInMenu], a
	pop af
	ldh [rSVBK], a
	ret

.InitRAMAddrs:
	xor a
	ldh [hVBlank], a
	ld a, $1
	ldh [hInMenu], a
	xor a
	ldh [hMapAnims], a
	ld [wJumptableIndex], a
	ret
	
StarsIntroSceneJumper:
	jumptable StarsIntroScenes, wJumptableIndex
	
StarsIntroScenes:
	dw StarsIntroScene1
	dw StarsIntroScene2
	
NextStarsIntroScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret
	
StarsIntroScene1:
	; Setup the next scene.
	farcall Intro_ClearBGPals
	farcall ClearSprites
	farcall ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ldh [rLCDC], a
	ld a, 1
	ldh [rVBK], a
	ld a, BANK(TitleJirachiGFX)
	ld hl, TitleJirachiGFX
	ld de, vTiles1
	call FarDecompress ; Jirachi is now located in 1:8800
	xor a
	ldh [rVBK], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 8 palettes
	call FarCopyBytes
	pop af
	ldh [rSVBK], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	farcall ClearSpriteAnims
	farcall Intro_SetCGBPalUpdate
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	jp NextStarsIntroScene

StarsIntroScene2:
	; Jirachi appears for 60 frames, then flies up.
	ld a, 1
	ld [rVBK], a
	ld a, 1 | VRAM_BANK_1
	lb bc, 7, 6
	push bc
	hlbgcoord (SCREEN_WIDTH / 2) - 3, (SCREEN_HEIGHT / 2) - 3
	push hl
	call FillBoxWithByte
	pop hl
	pop bc
	lb de, $80, 6
	callfar DrawTitleGraphic
	ld c, 60
	call DelayFrames
	lb bc, 2, -64
.loop
	ldh a, [rSCY]
	add b
	ldh [rSCY], a
	halt
	inc c
	jr nz, .loop
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
