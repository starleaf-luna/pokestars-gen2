
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
	db "ver {STARS_VERSION} {STARS_STATUS}/{STARS_DEMONUM}@" ; ver 1.0 PRE-ALPHA
ChangelogRoom_IsFinalisedString:
	db "is finalised?: {STARS_ISCMPLETE}@" ; is finalised?: NO
ChangelogRoom_ChangelogStartString:
	db "-CHANGELOG START-@"
ChangelogRoom_Changelog:
	db "- update tilesets<LF>"
	db "- update palettes<LF>"
	db "- update scripts<LF>"
	db "- remove intro mo-<LF>"
	db "  vie<LF>"
	db "- add MBC30<LF>"
	db "  detection<LF>"
	db "- add surprise on<LF>"
	db "  the title screen<LF>"
	db "last upd. 18.01.24<LF>"
	db "          DD.MM.YY@"		; added 05 jan 24
