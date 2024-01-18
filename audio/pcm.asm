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
