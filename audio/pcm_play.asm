; code adapted from {pokeyellow}/engine/pikachu/pikachu_pcm.asm
; also adapted from {pokeyellow}/home/pikachu_cries.asm
; pcm_def: from {pokeyellow}/constants/pikachu_emotion_constants.asm

PlayPCMSoundClip::
	ld a, e
	ld e, a
	ld d, $0
	ld hl, PCMPointerTable
	add hl, de
	add hl, de
	add hl, de
	ld b, [hl] ; bank of data
	inc hl
	ld a, [hli] ; data pointer
	ld h, [hl]
	ld l, a
	ld c, $4
.loop
	dec c
	jr z, .done_delay
	call DelayFrame
	jr .loop

.done_delay
	di
	push bc
	push hl
	ld a, $80
	ldh [rNR52], a
	ld a, $77
	ldh [rNR50], a
	xor a
	ldh [rNR30], a
	ld hl, rWave_0 ; wave data
	ld de, wc800
.saveWaveDataLoop
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $ff
	ld [hli], a
	ld a, l
	cp $40 ; end of wave data
	jr nz, .saveWaveDataLoop
	ld a, $80
	ldh [rNR30], a
	ldh a, [rNR51]
	or $44
	ldh [rNR51], a
	ld a, $ff
	ldh [rNR31], a
	ld a, $20
	ldh [rNR32], a
	ld a, $ff
	ldh [rNR33], a
	ld a, $87
	ldh [rNR34], a
	pop hl
	pop bc
	call PlayPCM
	xor a
	ld [wTileRight], a
	ld [wTilePermissions], a
	ld a, $80
	ldh [rNR52], a
	xor a
	ldh [rNR30], a
	ld hl, rWave_0
	ld de, wc800
.reloadWaveDataLoop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, l
	cp $40 ; end of wave data
	jr nz, .reloadWaveDataLoop
	ld a, $80
	ldh [rNR30], a
	ldh a, [rNR51]
	and $bb
	ldh [rNR51], a
	; xor a
	; ld [wAudio + CHAN5], a
	; ld [wAudio + CHAN6], a
	; ld [wAudio + CHAN7], a
	; ld [wAudio + CHAN8], a
	ldh a, [hROMBankBackup]
	ei
	ret



PCMPointerTable::
; format:
; db bank
; dw pointer to cry

MACRO pcm_def
\1_id::
	dba \1
ENDM

	pcm_def JirachiCry1

MACRO pcm
; All of the pcm data has one trailing byte that is never processed.
	dw .End - .Start - 1
.Start
	\1
.End
ENDM

SECTION "PCM Data 1", ROMX

JirachiCry1::
	pcm INCBIN "audio/pcm/jiracry1.pcm"
