CraftingIntro::
	xor a
	ld [wDisableTextAcceleration], a
	ldh [hMapAnims], a
	call BlankCraftingScreen
	call LoadFontsExtra
	call LoadStandardFont
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	call PlaceCraftingHeader
	hlcoord 1, 3
	ld de, CraftingDescriptionText
	call PlaceString
	call CraftingMenuJoypadLoop
	call CloseWindow
	jp nc, SetupCraftingMenu
	ret
	
PlaceCraftingHeader:
	hlcoord 4, 1
	ld de, CraftingHeaderText
	jp PlaceString

CraftingHeaderText:
	db "CRAFTING@"

CraftingHeaderCtrlText:
	db "B:QUIT   START:CRAFT@"
	
CraftingDescriptionText:
	db   "Create healing"
	next "items like POTIONS"
	next "or CRACKERS from"
	next "scratch using the"
	next "items in your BAG.@"
	
BlankCraftingScreen:
	call ClearTilemap
	jp ClearWindowData
	
CraftingMenuJoypadLoop:
	call GetJoypad
	ld a, [hJoyDown]
	cp B_BUTTON
	jr z, .b_btn
	cp A_BUTTON
	jr z, .a_btn
	halt
	jr CraftingMenuJoypadLoop
	
.a_btn:
	and a
	ret
	
.b_btn:
	scf
	ret
	

SetupCraftingMenu::
	call ClearTilemap
	hlcoord 0, 0
	ld de, CraftingHeaderCtrlText
	call PlaceString
	call PlaceCraftingHeader
	call DrawCraftingMenuPlayerItemList
	jr @
	ret
	
DrawCraftingMenuPlayerItemList:
	hlcoord 1, 4
	ld de, wItems
	ld a, [wNumItems]
	cp 7
	jr nc, .capItemAmt
	ld c, a
	jr .loop	
.capItemAmt:
	ld c, 7
.loop:
	call DrawCraftingMenuPlayerItemRow
	dec c
	jr nz, .loop
	ret
	
DrawCraftingMenuPlayerItemRow:
	ld a, ITEM_NAME
	ld [wNamedObjectType], a
	ld a, [de]
	ld [wCurSpecies], a
	call GetName
	push bc
	push de
	ld de, wStringBuffer1
	call PlaceString
	ld bc, SCREEN_WIDTH + 5
	add hl, bc
	ld [hl], "×"
	pop de 
	inc de
	inc hl
	lb bc, 1, 2
	call PrintNum
	pop bc
	ret
	