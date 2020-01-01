title_loop:
	jsr animate_that_smeg
	lda control_pad1
	eor control_old1
	and control_pad1
	and #up_punch
	beq @no_up
		lda left_selector
		cmp #$76
		bne :+
			lda #$a6
			sta left_selector
			sta right_selector
			jmp @no_a
:		sec
		sbc #$10
		sta left_selector
		sta right_selector
		jmp @no_a
@no_up:
	lda control_pad1
	eor control_old1
	and control_pad1
	and #down_punch
	beq @no_down
		lda left_selector
		cmp #$a6
		bne :+
			lda #$76
			sta left_selector
			sta right_selector
			jmp @no_a
:		clc
		adc #$10
		sta left_selector
		sta right_selector
		jmp @no_a
@no_down:
	lda control_pad1
	eor control_old1
	and control_pad1
	and #select_punch
	beq @no_select
		lda left_selector
		cmp #$a6
		bne :+
			lda #$76
			sta left_selector
			sta right_selector
			jmp @no_a
:		clc
		adc #$10
		sta left_selector
		sta right_selector
		jmp @no_a
@no_select:
	lda control_pad1
	eor control_old1
	and control_pad1
	and #a_punch
	beq @no_a
		lda left_selector
		cmp #$76
		bne :+
			jsr clear_palette
			lda #$00
			jsr music_loadsong
			lda #$ff
			sta left_selector
			sta right_selector
			jsr wait_for_nmi
			jsr PPU_off
			jmp gameplay_intro
:		cmp #$86
		bne :+
			jsr clear_palette
			lda #$00
			jsr music_loadsong
			lda #$ff
			sta left_selector
			sta right_selector
			jsr wait_for_nmi
			jsr PPU_off
			jmp story_intro
:		cmp #$96
		bne :+
			jsr clear_palette
			lda #$00
			jsr music_loadsong
			lda #$ff
			sta left_selector
			sta right_selector
			jsr wait_for_nmi
			jsr PPU_off
			jmp controls_intro
:		cmp #$a6
		bne :+
			jsr clear_palette
			lda #$00
			jsr music_loadsong
			lda #$ff
			sta left_selector
			sta right_selector
			jsr wait_for_nmi
			jsr PPU_off
			jmp credits_intro
:
@no_a:
	jsr wait_for_nmi
	jmp title_loop

controls_intro:
	ldy #$00					; load title screen
	ldx #$04
	lda #<controls_nt
	sta $f0
	lda #>controls_nt
	sta $f1
	lda #$20
	sta $2006
	lda #$00
	sta $2006
:	lda ($f0),y
	sta $2007
	iny
	bne :-
	inc $f1
	dex
	bne :-

	jsr stabilize
	jsr PPU_with_sprites
	jsr wait_for_nmi

	ldx #$00
:	lda palette_title, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-
	jsr wait_for_nmi

	lda #$04
	jsr music_loadsong
	jmp story_loop

credits_intro:
	ldy #$00					; load title screen
	ldx #$04
	lda #<credits_nt
	sta $f0
	lda #>credits_nt
	sta $f1
	lda #$20
	sta $2006
	lda #$00
	sta $2006
:	lda ($f0),y
	sta $2007
	iny
	bne :-
	inc $f1
	dex
	bne :-

	jsr stabilize
	jsr PPU_with_sprites
	jsr wait_for_nmi

	ldx #$00
:	lda palette_title, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-
	jsr wait_for_nmi

	lda #$05
	jsr music_loadsong

	jmp story_loop

story_intro:
	ldy #$00					; load title screen
	ldx #$04
	lda #<story_nt
	sta $f0
	lda #>story_nt
	sta $f1
	lda #$20
	sta $2006
	lda #$00
	sta $2006
:	lda ($f0),y
	sta $2007
	iny
	bne :-
	inc $f1
	dex
	bne :-

	jsr stabilize
	jsr PPU_with_sprites
	jsr wait_for_nmi

	ldx #$00
:	lda palette_title, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-
	jsr wait_for_nmi

	lda #$03
	jsr music_loadsong

story_loop:
	lda control_pad1
	eor control_old1
	and control_pad1
	and #start_punch
	beq @no_start
		ldx #$00
		lda #$0f
:		sta pal_address, x
		inx
		cpx #$20
		bne :-
		jsr wait_for_nmi
		jmp reset
@no_start:
	jmp story_loop

gameplay_intro:
	ldy #$00					; load title screen
	ldx #$04
	lda #<gameplay_nt
	sta $f0
	lda #>gameplay_nt
	sta $f1
	lda #$20
	sta $2006
	lda #$00
	sta $2006
:	lda ($f0),y
	sta $2007
	iny
	bne :-
	inc $f1
	dex
	bne :-

	ldx #$00						; Pull in bytes for sprites and their
:	lda the_sprites,x				; attributes which are stored in the
	sta p1_top_left,x				; 'the_sprites' table. Use X as an index
	inx								; to load and store each byte, which
	cpx #$d0						; get stored starting in $200, where
	bne :-							; 'top_left_cursor' is located at.

	lda #$40
	sta p1_xpos
	lda #$40
	sta p1_ypos
	sta p1_zpos
	lda #$3d
	sta p1_zpos_t
	sta p3_zpos_t
	lda #$43
	sta p1_zpos_b
	sta p3_zpos_b
	lda #$40
	sta p2_xpos
	lda #$90
	sta p2_ypos
	sta p2_zpos
	lda #$8d
	sta p2_zpos_t
	sta p4_zpos_t
	lda #$93
	sta p2_zpos_b
	sta p4_zpos_b
	lda #$b0
	sta p3_xpos
	lda #$40
	sta p3_ypos
	sta p3_zpos
	lda #$b0
	sta p4_xpos
	lda #$90
	sta p4_ypos
	sta p4_zpos

	lda #$02
	sta p1_anim
	lda #$02
	sta p2_anim
	lda #$01
	sta p3_anim
	lda #$01
	sta p4_anim
	lda #$01
	sta p3_direction
	sta p4_direction

	ldx #$00
	lda #$f9
:	sta p1_life1, x
	inx
	cpx #$18
	bne :-

	lda #$05
	sta p1_life_offset
	sta p2_life_offset
	sta p3_life_offset
	sta p4_life_offset

	lda #<gameplay_nmi
	sta nmi_addy
	lda #>gameplay_nmi
	sta nmi_addy+1

	jsr stabilize
	jsr PPU_with_sprites
	jsr wait_for_nmi

	lda #$02
	sta anim_ticker
	lda #$00
	sta anim_offset
	ldx #$00
:	lda palette_gp, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-
	lda #$01
	jsr music_loadsong
	jmp loop
gameplay_loop:

	jmp gameplay_loop

win_loop:
	lda one_second					; This loop is just a delay to allow
	sec                             ;  the music to play out before setting
	sbc #$01						;  the reset flag (reset_game) to allow
	sta one_second					;  for a reset to happen (snail.asm).
	bne @end						;
		lda #$3c					;
		sta one_second				;
		lda big_seconds				;
		sec							;
		sbc #$01					;
		sta big_seconds				;
		bne @end					;
			jsr clear_palette
			jsr wait_for_nmi
			jmp reset
@end:
	jsr wait_for_nmi
	jmp win_loop
	
clear_palette:
	ldx #$00
	lda #$0f
:	sta pal_address, x
	inx
	cpx #$20
	bne :-
	rts
	
p1_pause:
	jsr wait_for_nmi
	lda control_pad1
	eor control_old1
	and control_pad1
	and #start_punch
	beq @no_start1
		lda #$01
		jsr music_loadsfx
		jsr wait_for_nmi
		jmp loop
@no_start1:
	jmp p1_pause
p2_pause:
	jsr wait_for_nmi
	lda control_pad2
	eor control_old2
	and control_pad2
	and #start_punch
	beq @no_start2
		lda #$01
		jsr music_loadsfx
		jsr wait_for_nmi
		jmp loop
@no_start2:
	jmp p2_pause
p3_pause:
	jsr wait_for_nmi
	lda control_pad3
	eor control_old3
	and control_pad3
	and #start_punch
	beq @no_start3
		lda #$01
		jsr music_loadsfx
		jsr wait_for_nmi
		jmp loop
@no_start3:
	jmp p3_pause
p4_pause:
	jsr wait_for_nmi
	lda control_pad4
	eor control_old4
	and control_pad4
	and #start_punch
	beq @no_start4
		lda #$01
		jsr music_loadsfx
		jsr wait_for_nmi
		jmp loop
@no_start4:
	jmp p4_pause
