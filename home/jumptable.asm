ShortJumpTable::
	call IndexByteTable
	jp hl

IndexByteTable::
	ld e, a
	ld d, 0
	add hl, de
	ld e, [hl]
	add hl, de
	ret
	