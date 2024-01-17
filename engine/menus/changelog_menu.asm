
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
	db "- updated tilesets<LF>"
	db "- updated palettes<LF>"
	db "- updated scripts<LF>"
	db "- begin work on<LF>"
	db "  new intro movie<LF>"
	db "- add MBC30<LF>"
	db "  detection<LF>"
	db "last upd. 17.01.24<LF>"
	db "          DD.MM.YY@"		; added 05 jan 24
