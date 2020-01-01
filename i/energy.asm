p1_life_select:
	.byte <p1_life1, <p1_life2, <p1_life3, <p1_life4, <p1_life5, <p1_life6
p2_life_select:
	.byte <p2_life1, <p2_life2, <p2_life3, <p2_life4, <p2_life5, <p2_life6
p3_life_select:
	.byte <p3_life1, <p3_life2, <p3_life3, <p3_life4, <p3_life5, <p3_life6
p4_life_select:
	.byte <p4_life1, <p4_life2, <p4_life3, <p4_life4, <p4_life5, <p4_life6

p1_damages_p2:
	lda p1_attack_str1_p2
	bne :+
		jmp :+++
:
	ldy p2_life_offset
	ldx p2_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p2_life_offset
		beq :++
		sec
		sbc #$01
		sta p2_life_offset
		jmp p1_damages_p2
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p1_attack_str1_p2
	sec
	sbc #$01
	sta p1_attack_str1_p2
	bne p1_damages_p2
:	lda p2_life1
	cmp #$f1
	bne :++
		lda p2_direction
		beq :+
			lda #$11
			sta p2_anim
			jmp :++
:		lda #$12
		sta p2_anim
:	lda p1_onom_switch
	bne :+
		lda onom_random
		jsr p1_onom_selection
		lda #$82
		jsr music_loadsfx
:	rts
p1_damages_p3:
	lda p1_attack_str2_p3
	bne :+

		jmp :+++	
:	ldy p3_life_offset
	ldx p3_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p3_life_offset
		beq :++
		sec
		sbc #$01
		sta p3_life_offset
		jmp p1_damages_p3
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p1_attack_str2_p3
	sec
	sbc #$01
	sta p1_attack_str2_p3
	bne p1_damages_p3
:	lda p3_life1
	cmp #$f1
	bne :++
		lda p3_direction
		beq :+
			lda #$11
			sta p3_anim
			jmp :++
:		lda #$12
		sta p3_anim
:	lda p1_onom_switch
	bne :+
		lda onom_random
		jsr p1_onom_selection
		lda #$82
		jsr music_loadsfx
:	rts
p1_damages_p4:
	lda p1_attack_str3_p4
	bne :+
		jmp :+++
:
	ldy p4_life_offset
	ldx p4_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p4_life_offset
		beq :++
		sec
		sbc #$01
		sta p4_life_offset
		jmp p1_damages_p4
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p1_attack_str3_p4
	sec
	sbc #$01
	sta p1_attack_str3_p4
	bne p1_damages_p4
:	lda p4_life1
	cmp #$f1
	bne :++
		lda p4_direction
		beq :+
			lda #$11
			sta p4_anim
			jmp :++
:		lda #$12
		sta p4_anim
:	lda p1_onom_switch
	bne :+
		lda onom_random
		jsr p1_onom_selection
		lda #$82
		jsr music_loadsfx
:
	rts

p2_damages_p1:
	lda p2_attack_str1_p1
	bne :+
		jmp :+++
:
	ldy p1_life_offset
	ldx p1_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p1_life_offset
		beq :++
		sec
		sbc #$01
		sta p1_life_offset
		jmp p2_damages_p1
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p2_attack_str1_p1
	sec
	sbc #$01
	sta p2_attack_str1_p1
	bne p2_damages_p1
:	lda p1_life1
	cmp #$f1
	bne :++
		lda p1_direction
		beq :+
			lda #$11
			sta p1_anim
			jmp :++
:		lda #$12
		sta p1_anim
:	lda p2_onom_switch
	bne :+
		lda onom_random
		jsr p2_onom_selection
		lda #$82
		jsr music_loadsfx
:	rts
p2_damages_p3:
	lda p2_attack_str2_p3
	bne :+
		jmp :+++	
:	ldy p3_life_offset
	ldx p3_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p3_life_offset
		beq :++
		sec
		sbc #$01
		sta p3_life_offset
		jmp p2_damages_p3
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p2_attack_str2_p3
	sec
	sbc #$01
	sta p2_attack_str2_p3
	bne p2_damages_p3
:	lda p3_life1
	cmp #$f1
	bne :++
		lda p3_direction
		beq :+
			lda #$11
			sta p3_anim
			jmp :++
:		lda #$12
		sta p3_anim
:	lda p2_onom_switch
	bne :+
		lda onom_random
		jsr p2_onom_selection
		lda #$82
		jsr music_loadsfx
:
	rts
p2_damages_p4:
	lda p2_attack_str3_p4
	bne :+
		jmp :+++
:
	ldy p4_life_offset
	ldx p4_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p4_life_offset
		beq :++
		sec
		sbc #$01
		sta p4_life_offset
		jmp p2_damages_p4
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p2_attack_str3_p4
	sec
	sbc #$01
	sta p2_attack_str3_p4
	bne p2_damages_p4
:	lda p4_life1
	cmp #$f1
	bne :++
		lda p4_direction
		beq :+
			lda #$11
			sta p4_anim
			jmp :++
:		lda #$12
		sta p4_anim
:	lda p2_onom_switch
	bne :+
		lda onom_random
		jsr p2_onom_selection
		lda #$82
		jsr music_loadsfx
:
	rts


p3_damages_p1:
	lda p3_attack_str1_p1
	bne :+
		jmp :+++
:
	ldy p1_life_offset
	ldx p1_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p1_life_offset
		beq :++
		sec
		sbc #$01
		sta p1_life_offset
		jmp p3_damages_p1
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p3_attack_str1_p1
	sec
	sbc #$01
	sta p3_attack_str1_p1
	bne p3_damages_p1
:	lda p1_life1
	cmp #$f1
	bne :++
		lda p1_direction
		beq :+
			lda #$11
			sta p1_anim
			jmp :++
:		lda #$12
		sta p1_anim
:	lda p3_onom_switch
	bne :+
		lda onom_random
		jsr p3_onom_selection
		lda #$82
		jsr music_loadsfx
:	rts
p3_damages_p2:
	lda p3_attack_str2_p2
	bne :+
		jmp :+++
:
	ldy p2_life_offset
	ldx p2_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p2_life_offset
		beq :++
		sec
		sbc #$01
		sta p2_life_offset
		jmp p3_damages_p2
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p3_attack_str2_p2
	sec
	sbc #$01
	sta p3_attack_str2_p2
	bne p3_damages_p2
:	lda p2_life1
	cmp #$f1
	bne :++
		lda p2_direction
		beq :+
			lda #$11
			sta p2_anim
			jmp :++
:		lda #$12
		sta p2_anim
:	lda p3_onom_switch
	bne :+
		lda onom_random
		jsr p3_onom_selection
		lda #$82
		jsr music_loadsfx
:	rts
p3_damages_p4:
	lda p3_attack_str3_p4
	bne :+
		jmp :+++
:
	ldy p4_life_offset
	ldx p4_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p4_life_offset
		beq :++
		sec
		sbc #$01
		sta p4_life_offset
		jmp p3_damages_p4
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p3_attack_str3_p4
	sec
	sbc #$01
	sta p3_attack_str3_p4
	bne p3_damages_p4
:	lda p4_life1
	cmp #$f1
	bne :++
		lda p4_direction
		beq :+
			lda #$11
			sta p4_anim
			jmp :++
:		lda #$12
		sta p4_anim
:	lda p3_onom_switch
	bne :+
		lda onom_random
		jsr p3_onom_selection
		lda #$82
		jsr music_loadsfx
:	rts

p4_damages_p1:
	lda p4_attack_str1_p1
	bne :+
		jmp :+++
:
	ldy p1_life_offset
	ldx p1_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p1_life_offset
		beq :++
		sec
		sbc #$01
		sta p1_life_offset
		jmp p4_damages_p1
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p4_attack_str1_p1
	sec
	sbc #$01
	sta p4_attack_str1_p1
	bne p4_damages_p1
:	lda p1_life1
	cmp #$f1
	bne :++
		lda p1_direction
		beq :+
			lda #$11
			sta p1_anim
			jmp :++
:		lda #$12
		sta p1_anim
:	lda p4_onom_switch
	bne :+
		lda onom_random
		jsr p4_onom_selection
		lda #$82
		jsr music_loadsfx
:	rts
p4_damages_p2:
	lda p4_attack_str2_p2
	bne :+
		jmp :+++
:
	ldy p2_life_offset
	ldx p2_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p2_life_offset
		beq :++
		sec
		sbc #$01
		sta p2_life_offset
		jmp p4_damages_p2
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p4_attack_str2_p2
	sec
	sbc #$01
	sta p4_attack_str2_p2
	bne p4_damages_p2
:	lda p2_life1
	cmp #$f1
	bne :++
		lda p2_direction
		beq :+
			lda #$11
			sta p2_anim
			jmp :++
:		lda #$12
		sta p2_anim
:	lda p4_onom_switch
	bne :+
		lda onom_random
		jsr p4_onom_selection
		lda #$82
		jsr music_loadsfx
:	rts
p4_damages_p3:
	lda p4_attack_str3_p3
	bne :+
		jmp :+++	
:	ldy p3_life_offset
	ldx p3_life_select, y
	lda $00, x
	cmp #$f1
	bne :+
		lda p3_life_offset
		beq :++
		sec
		sbc #$01
		sta p3_life_offset
		jmp p4_damages_p3
:	lda $00, x
	sec
	sbc #$01
	sta $00, x
	lda p4_attack_str3_p3
	sec
	sbc #$01
	sta p4_attack_str3_p3
	bne p4_damages_p3
:	lda p3_life1
	cmp #$f1
	bne :++
		lda p3_direction
		beq :+
			lda #$11
			sta p3_anim
			jmp :++
:		lda #$12
		sta p3_anim
:	lda p4_onom_switch
	bne :+
		lda onom_random
		jsr p4_onom_selection
		lda #$82
		jsr music_loadsfx
:
	rts



do_the_jumps:
	lda p1_jumping, x
	bne :+
		jmp @done
:
		lda p1_anim, x
		cmp #$8f
		bne :+
			jmp @jumping_kick_left
:		cmp #$90
		bne :+
			jmp @jumping_kick_right
:		cmp #$97
		bne :+
			jmp @slide_kick_left
:		cmp #$98
		bne :+
			jmp @slide_kick_right
:
		ldy p1_jumping, x
		cpy #$20
		bne :+
			lda #$00
			sta p1_jumping, x
			jmp @done
:		lda p1_ypos, x
		clc
		adc p_jumping_addition_table, y
		sta p1_ypos, x
		iny
		sty p1_jumping, x
		jmp @done
		
@jumping_kick_left:
		ldy p1_jumping, x
		cpy #$20
		bne :+
			lda #$00
			sta p1_jumping, x
			jmp @done
:		lda p1_ypos, x
		clc
		adc p_jumping_addition_table, y
		sta p1_ypos, x
		lda p1_xpos, x
		cmp #$20
		beq :+
		clc
		adc p_jump_left_addition_table, y
		sta p1_xpos, x
:		iny
		sty p1_jumping, x
		jmp @done
@jumping_kick_right:
		ldy p1_jumping, x
		cpy #$20
		bne :+
			lda #$00
			sta p1_jumping, x
			jmp @done
:		lda p1_ypos, x
		clc
		adc p_jumping_addition_table, y
		sta p1_ypos, x
		lda p1_xpos, x
		cmp #$d0
		beq :+
		clc
		adc p_jump_right_addition_table, y
		sta p1_xpos, x
:		iny
		sty p1_jumping, x
		jmp @done
@slide_kick_left:
		ldy p1_jumping, x
		cpy #$20
		bne :+
			lda #$00
			sta p1_jumping, x
			jmp @done
:		lda p1_xpos, x
		cmp #$21
		bcc :+
		clc
		adc p_slide_left_addition_table, y
		sta p1_xpos, x
		jmp :++
:		lda #$20
		sta p1_xpos, x
:		iny
		sty p1_jumping, x
		jmp @done
@slide_kick_right:
		ldy p1_jumping, x
		cpy #$20
		bne :+
			lda #$00
			sta p1_jumping, x
			jmp @done
:		lda p1_xpos, x
		cmp #$d0
		bcs :+
		clc
		adc p_slide_right_addition_table, y
		sta p1_xpos, x
		jmp :++
:		lda #$d0
		sta p1_xpos, x
:		iny
		sty p1_jumping, x
@done:
	rts

player_winner:


p1winner_table:
	.byte "P1 WINS!"
p2winner_table:
	.byte "P2 WINS!"
p3winner_table:
	.byte "P3 WINS!"
p4winner_table:
	.byte "P4 WINS!"
nowinner_table:
	.byte "ALL DIE!"
