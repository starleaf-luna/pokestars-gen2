
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
	ld a, [hJoyPressed]
	cp B_BUTTON
	jr z, .ok
	cp A_BUTTON
	jr z, .ok
	cp START
	jr z, .ok
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
	db "- changed title"
	next "- added JIRACHI"
	next "- changed starter"
	next "  event in NEW"
	next "  BARK TOWN"
	next "last upd. 31/12/23@"
