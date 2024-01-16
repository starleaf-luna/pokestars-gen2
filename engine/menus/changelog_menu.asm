
; CHANGELOG ROOM: accessible by holding START
; and pressing A on the main menu screen

ChangelogRoom::
	call ClearTilemap
	call LoadFontsExtra
	call LoadStandardFont
	call SetPalettes
	call ClearWindowData
	hlcoord 3, 0
	ld de, ChangelogRoom_GameString
	call PlaceString
	hlcoord 1, 1
	ld de, ChangelogRoom_VersionString
	call PlaceString
	hlcoord 1, 2
	ld de, ChangelogRoom_IsFinalisedString
	call PlaceString
	hlcoord 2, 3
	ld de, ChangelogRoom_ChangelogStartString
	call PlaceString
	hlcoord 1, 5
	ld de, ChangelogRoom_Changelog
	call PlaceString
.loop:
	call GetJoypad
	ld a, [hJoyPressed]
	and B_BUTTON | A_BUTTON | START
	jr nz, .ok
	halt
	jr .loop
.ok:
	callfar MainMenu
	
ChangelogRoom_GameString:
	db "{STARS_PRODNAME}@" ; POKéMON STARS
ChangelogRoom_VersionString:
	db "ver {STARS_VERSION} {STARS_STATUS}@" ; ver 1.0 PRE-ALPHA
ChangelogRoom_IsFinalisedString:
	db "is finalised?: {STARS_ISCMPLETE}@" ; is finalised?: NO
ChangelogRoom_ChangelogStartString:
	db "-CHANGELOG START-@"
ChangelogRoom_Changelog:
	db   "- PCM in PRIMARI-<LF>"
	db   "  NUM CITY<LF>"
	db   "- finalised PRIMA-<LF>"
	db   "  RINUM CITY<LF>"
	db   "- edited tileset<LF>"
	db   "- fixed some bugs<LF>"
	db   "- start work on<LF>"
	db   "  R30<LF>"
	db   "- moved to BETA<LF>"
	db   "last upd. 16.01.24<LF>"
	db   "          DD.MM.YY@"		; added 05 jan 24
