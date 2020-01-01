onom_xpos_table:
	.byte $20,$50,$80,$b0,$20,$50,$80,$b0,$20,$50,$80,$b0,$20,$50,$80,$b0
	.byte $20,$50,$80,$b0,$20,$50,$80,$b0,$20,$50,$80,$b0,$20,$50,$80,$b0
onom_ypos_table:
	.byte $30,$30,$30,$30,$40,$40,$40,$40,$50,$50,$50,$50,$60,$60,$60,$60
	.byte $70,$70,$70,$70,$80,$80,$80,$80,$90,$90,$90,$90,$a0,$a0,$a0,$a0

onom_inc:
	lda onom_random
	clc
	adc #$01
	sta onom_random
	cmp #$06
	bne :+
		lda #$01
		sta onom_random
:	lda onom_table_random
	clc
	adc #$01
	sta onom_table_random
	cmp #$20
	bne :+
		lda #$00
		sta onom_table_random
:	rts

p1_onom_selection:
	asl a
	tay
	lda p1_onom_table+1, y
	pha
	lda p1_onom_table, y
	pha
	rts
p2_onom_selection:
	asl a
	tay
	lda p2_onom_table+1, y
	pha
	lda p2_onom_table, y
	pha
	rts
p3_onom_selection:
	asl a
	tay
	lda p3_onom_table+1, y
	pha
	lda p3_onom_table, y
	pha
	rts
p4_onom_selection:
	asl a
	tay
	lda p4_onom_table+1, y
	pha
	lda p4_onom_table, y
	pha
	rts

p1_onom_table:
	.addr p1_no_onom-1, p1_wak-1, p1_zok-1, p1_pop-1, p1_bam-1, p1_pow-1
p2_onom_table:
	.addr p2_no_onom-1, p2_wak-1, p2_zok-1, p2_pop-1, p2_bam-1, p2_pow-1
p3_onom_table:
	.addr p3_no_onom-1, p3_wak-1, p3_zok-1, p3_pop-1, p3_bam-1, p3_pow-1
p4_onom_table:
	.addr p4_no_onom-1, p4_wak-1, p4_zok-1, p4_pop-1, p4_bam-1, p4_pow-1

p1_onom_stuff:
	ldy onom_table_random
	lda onom_xpos_table, y
	sta p1_xpos_onom
	lda onom_ypos_table, y
	sta p1_ypos_onom
	lda #$01
	sta p1_onom_switch
	lda #$20
	sta p1_onom_count
	rts
p2_onom_stuff:
	ldy onom_table_random
	lda onom_xpos_table, y
	sta p2_xpos_onom
	lda onom_ypos_table, y
	sta p2_ypos_onom
	lda #$01
	sta p2_onom_switch
	lda #$20
	sta p2_onom_count
	rts
p3_onom_stuff:
	ldy onom_table_random
	lda onom_xpos_table, y
	sta p3_xpos_onom
	lda onom_ypos_table, y
	sta p3_ypos_onom
	lda #$01
	sta p3_onom_switch
	lda #$20
	sta p3_onom_count
	rts
p4_onom_stuff:
	ldy onom_table_random
	lda onom_xpos_table, y
	sta p4_xpos_onom
	lda onom_ypos_table, y
	sta p4_ypos_onom
	lda #$01
	sta p4_onom_switch
	lda #$20
	sta p4_onom_count
	rts
p1_no_onom:
	ldy #$00
	lda #$ff
:	sta p1_onom_ram, y
	iny
	cpy #$06
	bne :-
	sta p1_ypos_onom
	rts
p1_wak:
	ldy #$00
:	lda wak_onom, y
	sta p1_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p1_onom_stuff
	rts
p1_zok:
	ldy #$00
:	lda zok_onom, y
	sta p1_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p1_onom_stuff
	rts
p1_pop:
	ldy #$00
:	lda pop_onom, y
	sta p1_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p1_onom_stuff
	rts
p1_bam:
	ldy #$00
:	lda bam_onom, y
	sta p1_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p1_onom_stuff
	rts
p1_pow:
	ldy #$00
:	lda pow_onom, y
	sta p1_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p1_onom_stuff
	rts
p2_no_onom:
	ldy #$00
	lda #$ff
:	sta p2_onom_ram, y
	iny
	cpy #$06
	bne :-
	sta p2_ypos_onom
	rts
p2_wak:
	ldy #$00
:	lda wak_onom, y
	sta p2_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p2_onom_stuff
	rts
p2_zok:
	ldy #$00
:	lda zok_onom, y
	sta p2_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p2_onom_stuff
	rts
p2_pop:
	ldy #$00
:	lda pop_onom, y
	sta p2_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p2_onom_stuff
	rts
p2_bam:
	ldy #$00
:	lda bam_onom, y
	sta p2_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p2_onom_stuff
	rts
p2_pow:
	ldy #$00
:	lda pow_onom, y
	sta p2_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p2_onom_stuff
	rts
p3_no_onom:
	ldy #$00
	lda #$ff
:	sta p3_onom_ram, y
	iny
	cpy #$06
	bne :-
	sta p3_ypos_onom
	rts
p3_wak:
	ldy #$00
:	lda wak_onom, y
	sta p3_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p3_onom_stuff
	rts
p3_zok:
	ldy #$00
:	lda zok_onom, y
	sta p3_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p3_onom_stuff
	rts
p3_pop:
	ldy #$00
:	lda pop_onom, y
	sta p3_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p3_onom_stuff
	rts
p3_bam:
	ldy #$00
:	lda bam_onom, y
	sta p3_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p3_onom_stuff
	rts
p3_pow:
	ldy #$00
:	lda pow_onom, y
	sta p3_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p3_onom_stuff
	rts
p4_no_onom:
	ldy #$00
	lda #$ff
:	sta p4_onom_ram, y
	iny
	cpy #$06
	bne :-
	sta p4_ypos_onom
	rts
p4_wak:
	ldy #$00
:	lda wak_onom, y
	sta p4_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p4_onom_stuff
	rts
p4_zok:
	ldy #$00
:	lda zok_onom, y
	sta p4_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p4_onom_stuff
	rts
p4_pop:
	ldy #$00
:	lda pop_onom, y
	sta p4_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p4_onom_stuff
	rts
p4_bam:
	ldy #$00
:	lda bam_onom, y
	sta p4_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p4_onom_stuff
	rts
p4_pow:
	ldy #$00
:	lda pow_onom, y
	sta p4_onom_ram, y
	iny
	cpy #$06
	bne :-
	jsr p4_onom_stuff
	rts

wak_onom:
	.byte $e0,$e1,$e2
	.byte $f0,$f1,$f2
zok_onom:
	.byte $e3,$e4,$e5
	.byte $f3,$f4,$f5
pop_onom:
	.byte $e6,$e7,$e8
	.byte $f6,$f7,$f8
bam_onom:
	.byte $e9,$ea,$eb
	.byte $f9,$fa,$fb
pow_onom:
	.byte $ec,$ed,$ee
	.byte $fc,$fd,$fe

onom_ram_to_sprite:
	ldx #$00
	ldy #$00
:	lda p1_onom_ram, x
	sta p1_onom1+1, y
	lda p2_onom_ram, x
	sta p2_onom1+1, y
	lda p3_onom_ram, x
	sta p3_onom1+1, y
	lda p4_onom_ram, x
	sta p4_onom1+1, y
	iny
	iny
	iny
	iny
	inx
	cpx #$06
	bne :-
	rts

onom_sprite_pos:
	lda p1_xpos_onom
	sta p1_onom1+3
	sta p1_onom4+3
	clc
	adc #$08
	sta p1_onom2+3
	sta p1_onom5+3
	clc
	adc #$08
	sta p1_onom3+3
	sta p1_onom6+3
	lda p1_ypos_onom
	sta p1_onom1
	sta p1_onom2
	sta p1_onom3
	clc
	adc #$08
	sta p1_onom4
	sta p1_onom5
	sta p1_onom6

	lda p2_xpos_onom
	sta p2_onom1+3
	sta p2_onom4+3
	clc
	adc #$08
	sta p2_onom2+3
	sta p2_onom5+3
	clc
	adc #$08
	sta p2_onom3+3
	sta p2_onom6+3
	lda p2_ypos_onom
	sta p2_onom1
	sta p2_onom2
	sta p2_onom3
	clc
	adc #$08
	sta p2_onom4
	sta p2_onom5
	sta p2_onom6

	lda p3_xpos_onom
	sta p3_onom1+3
	sta p3_onom4+3
	clc
	adc #$08
	sta p3_onom2+3
	sta p3_onom5+3
	clc
	adc #$08
	sta p3_onom3+3
	sta p3_onom6+3
	lda p3_ypos_onom
	sta p3_onom1
	sta p3_onom2
	sta p3_onom3
	clc
	adc #$08
	sta p3_onom4
	sta p3_onom5
	sta p3_onom6

	lda p4_xpos_onom
	sta p4_onom1+3
	sta p4_onom4+3
	clc
	adc #$08
	sta p4_onom2+3
	sta p4_onom5+3
	clc
	adc #$08
	sta p4_onom3+3
	sta p4_onom6+3
	lda p4_ypos_onom
	sta p4_onom1
	sta p4_onom2
	sta p4_onom3
	clc
	adc #$08
	sta p4_onom4
	sta p4_onom5
	sta p4_onom6
	rts

onom_decrement:
	lda p1_onom_count
	sec
	sbc #$01
	sta p1_onom_count
	bne :+
		lda #$00
		sta p1_onom_switch
		sta onom_random
		jsr p1_onom_selection
:	lda p2_onom_count
	sec
	sbc #$01
	sta p2_onom_count
	bne :+
		lda #$00
		sta p2_onom_switch
		sta onom_random
		jsr p2_onom_selection
:	lda p3_onom_count
	sec
	sbc #$01
	sta p3_onom_count
	bne :+
		lda #$00
		sta p3_onom_switch
		sta onom_random
		jsr p3_onom_selection
:	lda p4_onom_count
	sec
	sbc #$01
	sta p4_onom_count
	bne :+
		lda #$00
		sta p4_onom_switch
		sta onom_random
		jsr p4_onom_selection
:	ldx onom_shake_offset
	lda p1_xpos_onom
	clc
	adc onom_shake_table, x
	sta p1_xpos_onom
	lda p2_xpos_onom
	clc
	adc onom_shake_table, x
	sta p2_xpos_onom
	lda p3_xpos_onom
	clc
	adc onom_shake_table, x
	sta p3_xpos_onom
	lda p4_xpos_onom
	clc
	adc onom_shake_table, x
	sta p4_xpos_onom
	inx
	cpx #$1e
	bne :+
		ldx #$00
:	stx onom_shake_offset
	rts


	

onom_shake_table:
	.byte $01,$00,$00,$ff,$00,$00,$02,$00,$00,$fe,$00,$00,$03,$00,$00
	.byte $fd,$00,$00,$04,$00,$00,$fc,$00,$00,$03,$00,$00,$fd,$00,$00
;	.byte $02,$00,$00,$fe,$00,$00,$01,$00,$00,$ff,$00,$00



; Used for the routine animate_that_smeg, just below.
;  It's yellow, then white, yellow, then white, yellow... etc.
pal_animation1:
	.byte $27,$30

; There is only one place in the game that needs a palette
;  animation, and that is when you lose the game. As such,
;  I have hard-coded certain values instead of using extra
;  RAM.
animate_that_smeg:
	dec anim_ticker					; anim_ticker was set to #$20 towards
	bne :++							;  the beginning of the program.
		lda #$0a					;  When it is zero, reset it to the
		sta anim_ticker				;  same value (it's a delay).
		ldx anim_offset				; If anim_offset is 1, then set it
		cpx #$01					;  back to zero. This is used to find
		bne :+						;  the proper value in pal_animation1.
			ldx #$00				;
			stx anim_offset			;
			jmp @next
:		inx
		stx anim_offset
		jmp @next
:	ldx anim_offset					; Put the data in the proper palette
	lda pal_animation1, x			;  using the value in anim_offset
	sta pal_address+19				;
@next:
	rts

animate_that_smeg2:
	dec anim_ticker					; anim_ticker was set to #$20 towards
	bne :++							;  the beginning of the program.
		lda #$02					;  When it is zero, reset it to the
		sta anim_ticker				;  same value (it's a delay).
		ldx anim_offset				; If anim_offset is 1, then set it
		cpx #$01					;  back to zero. This is used to find
		bne :+						;  the proper value in pal_animation1.
			ldx #$00				;
			stx anim_offset			;
			jmp @next
:		inx
		stx anim_offset
		jmp @next
:	ldx anim_offset

	lda p1_anim
	cmp #$9b
	beq :+
		cmp #$99
		bne :++
:	lda char1_animation1, x	
	sta pal_address+19
	jmp :++
:	lda char1_animation2, x	
	sta pal_address+19		
:
	lda p2_anim
	cmp #$9b
	beq :+
		cmp #$99
		bne :++
:	lda char2_animation1, x	
	sta pal_address+23
	jmp :++
:	lda char2_animation2, x	
	sta pal_address+23
:
	lda p3_anim
	cmp #$9b
	beq :+
		cmp #$99
		bne :++
:	lda char3_animation1, x	
	sta pal_address+27
	jmp :++
:	lda char3_animation2, x	
	sta pal_address+27
:
	lda p4_anim
	cmp #$9b
	beq :+
		cmp #$99
		bne :++
:	lda char4_animation1, x	
	sta pal_address+31
	jmp :++
:	lda char4_animation2, x	
	sta pal_address+31		
:
@next:
	rts

char1_animation1:
	.byte $27,$05
char1_animation2:
	.byte $05,$05
char2_animation1:
	.byte $27,$11
char2_animation2:
	.byte $11,$11
char3_animation1:
	.byte $27,$1b
char3_animation2:
	.byte $1b,$1b
char4_animation1:
	.byte $27,$25
char4_animation2:
	.byte $25,$25



