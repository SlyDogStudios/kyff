players_controls:
	lda p1_anim, x
	and #%01111111
	cmp #$05
	bcc :+
		jmp @no_a
:
;	and #%01111111
;	cmp #$09
;	bne :+
;		jmp @no_a
;:	cmp #$0a
;	bne :+
;		jmp @no_a
;:	cmp #$0d
;	bne :+
;		jmp @no_a
;:	cmp #$0e
;	bne :+
;		jmp @no_a
;:	cmp #$0f
;	bne :+
;		jmp @no_a
;:	cmp #$10
;	bne :+
;		jmp @no_a
;:
	lda control_pad1, x
	bne :++++
		lda p1_direction, x
		beq :++
			lda p1_anim, x
			cmp #$81
			beq :+
				lda #$01
				sta p1_anim, x
:			rts
:		lda p1_anim, x
		cmp #$82
		beq :+
			lda #$02
			sta p1_anim, x
:		rts
:	lda control_pad1, x
	and #up_punch
	beq @no_up
		lda p1_zpos, x
		cmp #$28
		beq :+
			sec
			sbc #$01
			sta p1_ypos, x
			sta p1_zpos, x
			sec
			sbc #$03
			sta p1_zpos_t, x
			lda p1_zpos, x
			clc
			adc #$03
			sta p1_zpos_b, x
:		lda p1_direction, x
		beq :++
			lda p1_anim, x
			cmp #$83
			beq :+
				lda #$03
				sta p1_anim, x
:				jmp :++
:		lda p1_anim, x
		cmp #$84
		beq :+
			lda #$04
			sta p1_anim, x
:

@no_up:
	lda control_pad1, x
	and #down_punch
	beq @no_down
		lda p1_ypos, x
		cmp #$a5
		beq :+
			clc
			adc #$01
			sta p1_ypos, x
			sta p1_zpos, x
			sec
			sbc #$03
			sta p1_zpos_t, x
			lda p1_zpos, x
			clc
			adc #$03
			sta p1_zpos_b, x
:		lda p1_direction, x
		beq :++
			lda p1_anim, x
			cmp #$83
			beq :+
				lda #$03
				sta p1_anim, x
:				jmp :++
:		lda p1_anim, x
		cmp #$84
		beq :+
			lda #$04
			sta p1_anim, x
:
@no_down:
	lda control_pad1, x
	and #left_punch
	beq @no_left
		lda control_pad1
		and #b_punch
		beq :+
			lda #$15
			sta p1_anim, x
			lda #$02
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			jmp @no_a
:		lda #$01
		sta p1_direction, x
		lda p1_anim, x
		cmp #$83
		beq :+
			lda #$03
			sta p1_anim, x
:		lda p1_xpos, x
		cmp #$20
		beq :+
			sec
			sbc #$01
			sta p1_xpos, x
:		jmp @no_right
			
@no_left:
	lda control_pad1, x
	and #right_punch
	beq @no_right
		lda control_pad1
		and #b_punch
		beq :+
			lda #$16
			sta p1_anim, x
			lda #$02
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			jmp @no_a
:		lda #$00
		sta p1_direction, x
		lda p1_anim, x
		cmp #$84
		beq :+
			lda #$04
			sta p1_anim, x
:
		lda p1_xpos, x
		cmp #$d0
		beq :+
			clc
			adc #$01
			sta p1_xpos, x
:
@no_right:
	lda control_pad1, x
	eor control_old1, x
	and control_pad1, x
	and #start_punch
	beq @no_start

@no_start:
	lda control_pad1, x
	eor control_old1, x
	and control_pad1, x
	and #select_punch
	beq @no_select

@no_select:
	lda control_pad1, x
	eor control_old1, x
	and control_pad1, x
	and #b_punch
	beq @no_b
;		txa
;		pha
;		lda #$03
;		jsr music_loadsfx
;		pla
;		tax
		lda control_pad1, x
		and #up_punch
		beq @test_sweep
			lda p1_direction, x
			beq :+
				lda #$0b
				sta p1_anim, x
				jmp :++
:			lda #$0c
			sta p1_anim, x
:			lda #$03
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			jmp @no_a

@test_sweep:
		lda control_pad1, x
		and #down_punch
		beq @test_punch
			lda p1_direction, x
			beq :+
				lda #$07
				sta p1_anim, x
				jmp :++
:			lda #$08
			sta p1_anim, x
:			lda #$02
;			sta p1_attack_strength, x
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			jmp @no_a

@test_punch:
		lda p1_direction, x
		beq :+
			lda #$05
			sta p1_anim, x
			jmp :++
:		lda #$06
		sta p1_anim, x
:		lda #$01
;		sta p1_attack_strength, x
		sta p1_attack_str1_p2, x
		sta p1_attack_str2_p3, x
		sta p1_attack_str3_p4, x
		jmp @no_a

@no_b:
	lda control_pad1, x
	eor control_old1, x
	and control_pad1, x
	and #a_punch
	beq @no_a
		lda control_pad1, x
		and #left_punch
		beq @not_jumpkick_left
			lda #$0f
			sta p1_anim, x
			lda #$01
			sta p1_jumping, x
			lda #$02
;			sta p1_attack_strength, x
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			jmp @no_a

@not_jumpkick_left:
		lda control_pad1, x
		and #right_punch
		beq @not_jumpkick_right
			lda #$10
			sta p1_anim, x
			lda #$01
			sta p1_jumping, x
			lda #$02
;			sta p1_attack_strength, x
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			jmp @no_a

@not_jumpkick_right:
		lda p1_direction, x
		beq :+
			lda #$0e
			sta p1_anim, x
			jmp :++
:		lda #$0d
		sta p1_anim, x
:		lda #$01
		sta p1_jumping, x

@no_a:
	rts
; ************************************************************
; sprite positioning routine                                 *
; ************************************************************
players_sprites_pos:
	lda p1_killed
	bne :+
	lda p1_xpos
	sta p1_top_left+3
	sta p1_mid_left+3
	sta p1_bot_left+3
	clc
	adc #$08
	sta p1_top_right+3
	sta p1_mid_right+3
	sta p1_bot_right+3
	lda p1_ypos
	sta p1_top_left
	sta p1_top_right
	clc
	adc #$08
	sta p1_mid_left
	sta p1_mid_right
	clc
	adc #$08
	sta p1_bot_left
	sta p1_bot_right
	lda p1_top_left
	clc
	adc #$03
	sta p1_top
	clc
	adc #$13
	sta p1_bottom
	lda p1_top_left+3
	clc
	adc #$01
	sta p1_left
	clc
	adc #$0e
	sta p1_right
:
	lda p2_killed
	bne :+
	lda p2_xpos
	sta p2_top_left+3
	sta p2_mid_left+3
	sta p2_bot_left+3
	clc
	adc #$08
	sta p2_top_right+3
	sta p2_mid_right+3
	sta p2_bot_right+3
	lda p2_ypos
	sta p2_top_left
	sta p2_top_right
	clc
	adc #$08
	sta p2_mid_left
	sta p2_mid_right
	clc
	adc #$08
	sta p2_bot_left
	sta p2_bot_right
	lda p2_top_left
	clc
	adc #$03
	sta p2_top
	clc
	adc #$13
	sta p2_bottom
	lda p2_top_left+3
	clc
	adc #$01
	sta p2_left
	clc
	adc #$0e
	sta p2_right
:
	lda p3_killed
	bne :+
	lda p3_xpos
	sta p3_top_left+3
	sta p3_mid_left+3
	sta p3_bot_left+3
	clc
	adc #$08
	sta p3_top_right+3
	sta p3_mid_right+3
	sta p3_bot_right+3
	lda p3_ypos
	sta p3_top_left
	sta p3_top_right
	clc
	adc #$08
	sta p3_mid_left
	sta p3_mid_right
	clc
	adc #$08
	sta p3_bot_left
	sta p3_bot_right

	lda p3_top_left
	clc
	adc #$03
	sta p3_top
	clc
	adc #$13
	sta p3_bottom
	lda p3_top_left+3
	clc
	adc #$01
	sta p3_left
	clc
	adc #$0e
	sta p3_right
:
	lda p4_killed
	bne :+
	lda p4_xpos
	sta p4_top_left+3
	sta p4_mid_left+3
	sta p4_bot_left+3
	clc
	adc #$08
	sta p4_top_right+3
	sta p4_mid_right+3
	sta p4_bot_right+3
	lda p4_ypos
	sta p4_top_left
	sta p4_top_right
	clc
	adc #$08
	sta p4_mid_left
	sta p4_mid_right
	clc
	adc #$08
	sta p4_bot_left
	sta p4_bot_right
	lda p4_top_left
	clc
	adc #$03
	sta p4_top
	clc
	adc #$13
	sta p4_bottom
	lda p4_top_left+3
	clc
	adc #$01
	sta p4_left
	clc
	adc #$0e
	sta p4_right
:	rts

attack_boxes:
	lda p1_attack
	clc
	adc #$03
	sta p1_top_attack
	clc
	adc #$04
	sta p1_bot_attack
	lda p1_attack+3
	clc
	adc #$02
	sta p1_left_attack
	clc
	adc #$04
	sta p1_right_attack

	lda p2_attack
	clc
	adc #$03
	sta p2_top_attack
	clc
	adc #$04
	sta p2_bot_attack
	lda p2_attack+3
	clc
	adc #$02
	sta p2_left_attack
	clc
	adc #$04
	sta p2_right_attack

	lda p3_attack
	clc
	adc #$03
	sta p3_top_attack
	clc
	adc #$04
	sta p3_bot_attack
	lda p3_attack+3
	clc
	adc #$02
	sta p3_left_attack
	clc
	adc #$04
	sta p3_right_attack

	lda p4_attack
	clc
	adc #$03
	sta p4_top_attack
	clc
	adc #$04
	sta p4_bot_attack
	lda p4_attack+3
	clc
	adc #$02
	sta p4_left_attack
	clc
	adc #$04
	sta p4_right_attack
	rts

p1attack_check:
	lda p1_left_attack
	cmp p2_right
	bcs @no_p2hit
	lda p1_right_attack
	cmp p2_left
	bcc @no_p2hit
	lda p1_top_attack
	cmp p2_bottom
	bcs @no_p2hit
	lda p1_bot_attack
	cmp p2_top
	bcc @no_p2hit
		lda p1_zpos_t
		cmp p2_zpos_b
		bcs @no_p2hit
		lda p1_zpos_b
		cmp p2_zpos_t
		bcc @no_p2hit
		lda p2_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p2_killed
			jmp @no_p2hit
:		lda p2_direction
		beq :+
			lda #$09
			sta p2_anim
			jsr p1_damages_p2
			jmp @no_p2hit
:		lda #$0a
		sta p2_anim
		jsr p1_damages_p2
@no_p2hit:
	lda p1_left_attack
	cmp p3_right
	bcs @no_p3hit
	lda p1_right_attack
	cmp p3_left
	bcc @no_p3hit
	lda p1_top_attack
	cmp p3_bottom
	bcs @no_p3hit
	lda p1_bot_attack
	cmp p3_top
	bcc @no_p3hit
		lda p1_zpos_t
		cmp p3_zpos_b
		bcs @no_p3hit
		lda p1_zpos_b
		cmp p3_zpos_t
		bcc @no_p3hit
		lda p3_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p3_killed
			jmp @no_p3hit
:		lda p3_direction
		beq :+
			lda #$09
			sta p3_anim
			jsr p1_damages_p3
			jmp @no_p3hit
:		lda #$0a
		sta p3_anim
		jsr p1_damages_p3
@no_p3hit:
	lda p1_left_attack
	cmp p4_right
	bcs @no_p4hit
	lda p1_right_attack
	cmp p4_left
	bcc @no_p4hit
	lda p1_top_attack
	cmp p4_bottom
	bcs @no_p4hit
	lda p1_bot_attack
	cmp p4_top
	bcc @no_p4hit
		lda p1_zpos_t
		cmp p4_zpos_b
		bcs @no_p4hit
		lda p1_zpos_b
		cmp p4_zpos_t
		bcc @no_p4hit
		lda p4_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p4_killed
			jmp @no_p4hit
:		lda p4_direction
		beq :+
			lda #$09
			sta p4_anim
			jsr p1_damages_p4
			jmp @no_p4hit
:		lda #$0a
		sta p4_anim
		jsr p1_damages_p4
@no_p4hit:
	rts

p2attack_check:
	lda p2_left_attack
	cmp p1_right
	bcs @no_p1hit
	lda p2_right_attack
	cmp p1_left
	bcc @no_p1hit
	lda p2_top_attack
	cmp p1_bottom
	bcs @no_p1hit
	lda p2_bot_attack
	cmp p1_top
	bcc @no_p1hit
		lda p2_zpos_t
		cmp p1_zpos_b
		bcs @no_p1hit
		lda p2_zpos_b
		cmp p1_zpos_t
		bcc @no_p1hit
		lda p1_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p1_killed
			jmp @no_p1hit
:		lda p1_direction
		beq :+
			lda #$09
			sta p1_anim
			jsr p2_damages_p1
			jmp @no_p1hit
:		lda #$0a
		sta p1_anim
		jsr p2_damages_p1
@no_p1hit:
	lda p2_left_attack
	cmp p3_right
	bcs @no_p3hit
	lda p2_right_attack
	cmp p3_left
	bcc @no_p3hit
	lda p2_top_attack
	cmp p3_bottom
	bcs @no_p3hit
	lda p2_bot_attack
	cmp p3_top
	bcc @no_p3hit
		lda p2_zpos_t
		cmp p3_zpos_b
		bcs @no_p3hit
		lda p2_zpos_b
		cmp p3_zpos_t
		bcc @no_p3hit
		lda p3_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p3_killed
			jmp @no_p3hit
:		lda p3_direction
		beq :+
			lda #$09
			sta p3_anim
			jsr p2_damages_p3
			jmp @no_p3hit
:		lda #$0a
		sta p3_anim
		jsr p2_damages_p3
@no_p3hit:
	lda p2_left_attack
	cmp p4_right
	bcs @no_p4hit
	lda p2_right_attack
	cmp p4_left
	bcc @no_p4hit
	lda p2_top_attack
	cmp p4_bottom
	bcs @no_p4hit
	lda p2_bot_attack
	cmp p4_top
	bcc @no_p4hit
		lda p2_zpos_t
		cmp p4_zpos_b
		bcs @no_p4hit
		lda p2_zpos_b
		cmp p4_zpos_t
		bcc @no_p4hit
		lda p4_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p4_killed
			jmp @no_p4hit
:		lda p4_direction
		beq :+
			lda #$09
			sta p4_anim
			jsr p2_damages_p4
			jmp @no_p4hit
:		lda #$0a
		sta p4_anim
		jsr p2_damages_p4
@no_p4hit:
	rts

p3attack_check:
	lda p3_left_attack
	cmp p1_right
	bcs @no_p1hit
	lda p3_right_attack
	cmp p1_left
	bcc @no_p1hit
	lda p3_top_attack
	cmp p1_bottom
	bcs @no_p1hit
	lda p3_bot_attack
	cmp p1_top
	bcc @no_p1hit
		lda p3_zpos_t
		cmp p1_zpos_b
		bcs @no_p1hit
		lda p3_zpos_b
		cmp p1_zpos_t
		bcc @no_p1hit
		lda p1_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p1_killed
			jmp @no_p1hit
:		lda p1_direction
		beq :+
			lda #$09
			sta p1_anim
			jsr p3_damages_p1
			jmp @no_p1hit
:		lda #$0a
		sta p1_anim
		jsr p3_damages_p1
@no_p1hit:
	lda p3_left_attack
	cmp p2_right
	bcs @no_p2hit
	lda p3_right_attack
	cmp p2_left
	bcc @no_p2hit
	lda p3_top_attack
	cmp p2_bottom
	bcs @no_p2hit
	lda p3_bot_attack
	cmp p2_top
	bcc @no_p2hit
		lda p3_zpos_t
		cmp p2_zpos_b
		bcs @no_p2hit
		lda p3_zpos_b
		cmp p2_zpos_t
		bcc @no_p2hit
		lda p2_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p2_killed
			jmp @no_p2hit
:		lda p2_direction
		beq :+
			lda #$09
			sta p2_anim
			jsr p3_damages_p2
			jmp @no_p2hit
:		lda #$0a
		sta p2_anim
		jsr p3_damages_p2
@no_p2hit:
	lda p3_left_attack
	cmp p4_right
	bcs @no_p4hit
	lda p3_right_attack
	cmp p4_left
	bcc @no_p4hit
	lda p3_top_attack
	cmp p4_bottom
	bcs @no_p4hit
	lda p3_bot_attack
	cmp p4_top
	bcc @no_p4hit
		lda p3_zpos_t
		cmp p4_zpos_b
		bcs @no_p4hit
		lda p3_zpos_b
		cmp p4_zpos_t
		bcc @no_p4hit
		lda p4_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p4_killed
			jmp @no_p4hit
:		lda p4_direction
		beq :+
			lda #$09
			sta p4_anim
			jsr p3_damages_p4
			jmp @no_p4hit
:		lda #$0a
		sta p4_anim
		jsr p3_damages_p4
@no_p4hit:
	rts

p4attack_check:
	lda p4_left_attack
	cmp p1_right
	bcs @no_p1hit
	lda p4_right_attack
	cmp p1_left
	bcc @no_p1hit
	lda p4_top_attack
	cmp p1_bottom
	bcs @no_p1hit
	lda p4_bot_attack
	cmp p1_top
	bcc @no_p1hit
		lda p4_zpos_t
		cmp p1_zpos_b
		bcs @no_p1hit
		lda p4_zpos_b
		cmp p1_zpos_t
		bcc @no_p1hit
		lda p1_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p1_killed
			jmp @no_p1hit
:		lda p1_direction
		beq :+
			lda #$09
			sta p1_anim
			jsr p4_damages_p1
			jmp @no_p1hit
:		lda #$0a
		sta p1_anim
		jsr p4_damages_p1
@no_p1hit:
	lda p4_left_attack
	cmp p2_right
	bcs @no_p2hit
	lda p4_right_attack
	cmp p2_left
	bcc @no_p2hit
	lda p4_top_attack
	cmp p2_bottom
	bcs @no_p2hit
	lda p4_bot_attack
	cmp p2_top
	bcc @no_p2hit
		lda p4_zpos_t
		cmp p2_zpos_b
		bcs @no_p2hit
		lda p4_zpos_b
		cmp p2_zpos_t
		bcc @no_p2hit
		lda p2_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p2_killed
			jmp @no_p2hit
:		lda p2_direction
		beq :+
			lda #$09
			sta p2_anim
			jsr p4_damages_p2
			jmp @no_p2hit
:		lda #$0a
		sta p2_anim
		jsr p4_damages_p2
@no_p2hit:
	lda p4_left_attack
	cmp p3_right
	bcs @no_p3hit
	lda p4_right_attack
	cmp p3_left
	bcc @no_p3hit
	lda p4_top_attack
	cmp p3_bottom
	bcs @no_p3hit
	lda p4_bot_attack
	cmp p3_top
	bcc @no_p3hit
		lda p4_zpos_t
		cmp p3_zpos_b
		bcs @no_p3hit
		lda p4_zpos_b
		cmp p3_zpos_t
		bcc @no_p3hit
		lda p3_life1
		cmp #$f1
		bne :+
			lda #$01
			sta p3_killed
			jmp @no_p3hit
:		lda p3_direction
		beq :+
			lda #$09
			sta p3_anim
			jsr p4_damages_p3
			jmp @no_p3hit
:		lda #$0a
		sta p3_anim
		jsr p4_damages_p3
@no_p3hit:
	rts

loopers:
	jmp loopers

code_quickkick:
	ldy code_offset, x
	lda control_pad1, x
	eor control_old1, x
	and control_pad1, x
	and code_check, y
	beq :+++
		lda #$10
		sta code_count, x
		lda code_offset, x
		clc
		adc #$01
		sta code_offset, x
		cmp #$04
		bne :+++
			lda p1_direction, x
			beq :+
				lda #$13
				sta p1_anim, x
				jmp :++
:			lda #$14
			sta p1_anim, x
:			lda #$06
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			lda #$01
			sta p1_jumping, x
			lda #$00
			sta code_count, x
			sta code_offset, x
			rts
				
:	lda code_count, x
	beq :+
		sec
		sbc #$01
		sta code_count, x
		rts
:	lda #$00
	sta code_offset, x
	rts

code_slidekick:
	ldy code_offset2, x
	lda control_pad1, x
	eor control_old1, x
	and control_pad1, x
	and code_check2, y
	beq :+++
		lda #$10
		sta code_count2, x
		lda code_offset2, x
		clc
		adc #$01
		sta code_offset2, x
		cmp #$04
		bne :+++
			lda p1_direction, x
			beq :+
				lda #$17
				sta p1_anim, x
				jmp :++
:			lda #$18
			sta p1_anim, x
:			lda #$04
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			lda #$01
			sta p1_jumping, x
			lda #$00
			sta code_count2, x
			sta code_offset2, x
			rts
				
:	lda code_count2, x
	beq :+
		sec
		sbc #$01
		sta code_count2, x
		rts
:	lda #$00
	sta code_offset2, x
	rts

code_shoot_left:
	ldy code_offset3, x
	lda control_pad1, x
	eor control_old1, x
	and control_pad1, x
	and code_check3, y
	beq :+
		lda #$10
		sta code_count3, x
		lda code_offset3, x
		clc
		adc #$01
		sta code_offset3, x
		cmp #$04
		bne :+
			lda #$19
			sta p1_anim, x
			lda #$08
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			lda #$00
			sta code_count3, x
			sta code_offset3, x
			rts
				
:	lda code_count3, x
	beq :+
		sec
		sbc #$01
		sta code_count3, x
		rts
:	lda #$00
	sta code_offset3, x
	rts
code_shoot_right:
	ldy code_offset4, x
	lda control_pad1, x
	eor control_old1, x
	and control_pad1, x
	and code_check4, y
	beq :+
		lda #$10
		sta code_count4, x
		lda code_offset4, x
		clc
		adc #$01
		sta code_offset4, x
		cmp #$04
		bne :+
			lda #$1b
			sta p1_anim, x
			lda #$08
			sta p1_attack_str1_p2, x
			sta p1_attack_str2_p3, x
			sta p1_attack_str3_p4, x
			lda #$00
			sta code_count4, x
			sta code_offset4, x
			rts
				
:	lda code_count4, x
	beq :+
		sec
		sbc #$01
		sta code_count4, x
		rts
:	lda #$00
	sta code_offset4, x
	rts
