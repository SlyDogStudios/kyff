; Kill Your Fucking Friends... The Rambunctious Bastards (To Hell With Their Hyperbolic Onomatopoeia)!

.include "i/constants.asm"
.include "s/music_declarations.asm"
.segment "ZEROPAGE"
.include "i/zp.asm"

.segment "CODE"

reset:
	sei
	ldx #$00
	stx $4015
	ldx #$40
	stx $4017
	ldx #$ff
	txs
	inx
	stx $2000
	stx $2001

	jsr vblank_wait


clrmem:
	lda #$00
	sta $000, x
	sta $100, x
	sta $300, x
	sta $400, x
	sta $500, x
	sta $600, x
	sta $700, x
	lda #$ff
	sta $200, x
	inx
	bne clrmem
	lda #<title_nmi
	sta nmi_addy
	lda #>title_nmi
	sta nmi_addy+1
	jsr vblank_wait

	ldx #$ff
	txa
	ldx #$00
:	sta $200,x
	dex
	bne :-

	ldy #$00					; load title screen
	ldx #$04
	lda #<title_nt
	sta $f0
	lda #>title_nt
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

	ldx #$d0						; Pull in bytes for sprites and their
:	lda the_sprites, x				; attributes which are stored in the
	sta p1_top_left, x				; 'the_sprites' table. Use X as an index
	inx								; to load and store each byte, which
	cpx #$d8						; get stored starting in $200, where
	bne :-							; 'top_left_cursor' is located at.

	ldx #$00
:	lda palette_title, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-

	jsr stabilize
	jsr PPU_with_sprites
	lda #$0a
	sta anim_ticker
	lda #$06
	jsr music_loadsong
	jmp title_loop
loop:
	lda players_dead
	and #%00001000
	bne @no_start1
	lda control_pad1
	eor control_old1
	and control_pad1
	and #start_punch
	beq @no_start1
		lda #$01
		jsr music_loadsfx
		jmp p1_pause
@no_start1:
	lda players_dead
	and #%00000100
	bne @no_start2
	lda control_pad2
	eor control_old2
	and control_pad2
	and #start_punch
	beq @no_start2
		lda #$01
		jsr music_loadsfx
		jmp p2_pause
@no_start2:
	lda players_dead
	and #%00000010
	bne @no_start3
	lda control_pad3
	eor control_old3
	and control_pad3
	and #start_punch
	beq @no_start3
		lda #$01
		jsr music_loadsfx
		jmp p3_pause
@no_start3:
	lda players_dead
	and #%00000001
	bne @no_start4
	lda control_pad4
	eor control_old4
	and control_pad4
	and #start_punch
	beq @no_start4
		lda #$01
		jsr music_loadsfx
		jmp p4_pause
@no_start4:
	lda players_dead
	cmp #%00000111
	bne :+
		lda #<p1winner_table
		sta winner_addy
		lda #>p1winner_table
		sta winner_addy+1
		lda #<win_nmi
		sta nmi_addy
		lda #>win_nmi
		sta nmi_addy+1
		lda #$07
		sta big_seconds
		lda #$3c
		sta one_second
		lda #$02
		jsr music_loadsong
		jmp win_loop
:	cmp #%00001011
	bne :+
		lda #<p2winner_table
		sta winner_addy
		lda #>p2winner_table
		sta winner_addy+1
		lda #<win_nmi
		sta nmi_addy
		lda #>win_nmi
		sta nmi_addy+1
		lda #$07
		sta big_seconds
		lda #$3c
		sta one_second
		lda #$02
		jsr music_loadsong
		jmp win_loop
:	cmp #%00001101
	bne :+
		lda #<p3winner_table
		sta winner_addy
		lda #>p3winner_table
		sta winner_addy+1
		lda #<win_nmi
		sta nmi_addy
		lda #>win_nmi
		sta nmi_addy+1
		lda #$07
		sta big_seconds
		lda #$3c
		sta one_second
		lda #$02
		jsr music_loadsong
		jmp win_loop
:	cmp #%00001110
	bne :+
		lda #<p4winner_table
		sta winner_addy
		lda #>p4winner_table
		sta winner_addy+1
		lda #<win_nmi
		sta nmi_addy
		lda #>win_nmi
		sta nmi_addy+1
		lda #$07
		sta big_seconds
		lda #$3c
		sta one_second
		lda #$02
		jsr music_loadsong
		jmp win_loop
:	cmp #%00001111
	bne :+
		lda #<nowinner_table
		sta winner_addy
		lda #>nowinner_table
		sta winner_addy+1
		lda #<win_nmi
		sta nmi_addy
		lda #>win_nmi
		sta nmi_addy+1
		lda #$07
		sta big_seconds
		lda #$3c
		sta one_second
		lda #$07
		jsr music_loadsong
		jmp win_loop
:
	jsr p1_dying
	jsr p2_dying
	jsr p3_dying
	jsr p4_dying
	jsr players_sprites_pos
	jsr attack_boxes
	jsr attack_boxes_offscreen
	ldx #$00
	stx player_offset
:	ldx player_offset
	lda p1_attack_num, x
	bne :+
		jsr players_controls
		jsr code_quickkick
		jsr code_slidekick
		jsr code_shoot_left
		jsr code_shoot_right
:	jsr players_anim
	jsr do_the_jumps
	inx
	stx player_offset
	cpx #$04
	bne :--
	jsr animate_that_smeg2
	jsr p1attack_check
	jsr p2attack_check
	jsr p3attack_check
	jsr p4attack_check

	jsr onom_inc
	jsr onom_sprite_pos
	jsr onom_ram_to_sprite
	jsr onom_decrement


	jsr wait_for_nmi
	jmp loop

code_check:
	.byte down_punch, down_punch, up_punch, a_punch
code_check2:
	.byte down_punch, up_punch, down_punch, b_punch
code_check3:
	.byte down_punch, left_punch, left_punch, b_punch
code_check4:
	.byte down_punch, right_punch, right_punch, b_punch

PPU_off:
	lda #$00
	sta $2000
	sta $2001
	rts

PPU_with_sprites:
	lda #%10001000
	sta $2000
	lda #%00011110
	sta $2001
	sta reg2001save
	rts

PPU_no_sprites:
	lda #%10001000
	sta $2000
	lda #%00001110
	sta $2001
	sta reg2001save
	rts

stabilize:
	lda #$00
	sta $2006
	sta $2006
	sta $2005
	sta $2005
	rts

wait_for_nmi:
	lda nmi_num
@check:
	cmp nmi_num
	beq @check
	rts

vblank_wait:
:	bit $2002
	bpl :-
	rts
fill_nametable:
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
	rts

.include "i/controls.asm"
.include "i/animations.asm"
.include "i/energy.asm"
.include "i/onomatopoeia.asm"
.include "i/main_loops.asm"
.include "i/nmi_loops.asm"
.include "s/music_engine.asm"
.include "s/music_data.asm"

; *********************************************************
; The control routine called in NMI                       *
; *********************************************************
controller_strobe:
@controller1:
	lda #$01
	sta $4016
	lda #$00
	sta $4016
	lda control_pad1
	sta control_old1
	ldx #$08
:	lda $4016
	lsr A
	ror control_pad1
	dex
	bne :-

	lda control_pad3
	sta control_old3
	ldx #$08
:	lda $4016
	lsr A
	ror control_pad3
	dex
	bne :-

@controller2:
	lda control_pad2
	sta control_old2
	ldx #$08
:	lda $4017
	lsr A
	ror control_pad2
	dex
	bne :-

	lda control_pad4
	sta control_old4
	ldx #$08
:	lda $4017
	lsr A
	ror control_pad4
	dex
	bne :-

	rts

nmi:
	pha
	txa
	pha
	tya
	pha
	inc nmi_num
	lda $2002

	lda #$02						; Do sprite transfer
	sta $4014						;
	lda #$00						;
	sta $2003						;

	lda #$3f
	sta $2006
	ldx #$00
	stx $2006
:	lda pal_address,x
	sta $2007
	inx
	cpx #$20
	bne :-

	jmp (nmi_addy)


finish_nmi:
	lda #$00
	sta $2006
	sta $2006
	sta $2005
	sta $2005

	jsr music_play
	jsr controller_strobe

	pla
	tay
	pla
	tax
	pla
irq:
	rti

palette_title:
.incbin "g\kill_title.pal"
palette_gp:
.incbin "g\kill_gameplay.pal"

title_nt:
.incbin "g\kill_title.nam"
gameplay_nt:
.incbin "g\kill_gameplay.nam"
story_nt:
.incbin "g\kill_story.nam"
controls_nt:
.incbin "g\kill_controls.nam"
credits_nt:
.incbin "g\kill_credits.nam"
; *********************************************************
; The .bytes below are setup for the sprites to be used   *
; .byte (Y-Pos),(Tile Number),(Attributes),(X-Pos)        *
; *********************************************************
the_sprites:
	.byte $80,$01,$00,$80			; p1_top_left
	.byte $80,$02,$00,$88			; p1_top_right
	.byte $88,$11,$00,$80			; p1_mid_left
	.byte $88,$12,$00,$88			; p1_mid_right
	.byte $90,$21,$00,$80			; p1_bot_left
	.byte $90,$22,$00,$88			; p1_bot_right
	.byte $ff,$10,$00,$90			; p1_attack
	
	.byte $80,$01,$01,$80			; p2_top_left
	.byte $80,$02,$01,$88			; p2_top_right
	.byte $88,$11,$01,$80			; p2_mid_left
	.byte $88,$12,$01,$88			; p2_mid_right
	.byte $90,$21,$01,$80			; p2_bot_left
	.byte $90,$22,$01,$88			; p2_bot_right
	.byte $ff,$10,$01,$ff			; p2_attack
	
	.byte $80,$01,$02,$80			; p3_top_left
	.byte $80,$02,$02,$88			; p3_top_right
	.byte $88,$11,$02,$80			; p3_mid_left
	.byte $88,$12,$02,$88			; p3_mid_right
	.byte $90,$21,$02,$80			; p3_bot_left
	.byte $90,$22,$02,$88			; p3_bot_right
	.byte $ff,$10,$02,$ff			; p3_attack
	
	.byte $80,$01,$03,$80			; p4_top_left
	.byte $80,$02,$03,$88			; p4_top_right
	.byte $88,$11,$03,$80			; p4_mid_left
	.byte $88,$12,$03,$88			; p4_mid_right
	.byte $90,$21,$03,$80			; p4_bot_left
	.byte $90,$22,$03,$88			; p4_bot_right
	.byte $ff,$10,$03,$ff			; p4_attack

	.byte $ff,$00,$00,$ff			; p1_onom
	.byte $ff,$00,$00,$ff			; 
	.byte $ff,$00,$00,$ff			; 
	.byte $ff,$00,$00,$ff			; 
	.byte $ff,$00,$00,$ff			; 
	.byte $ff,$00,$00,$ff			; 

	.byte $ff,$00,$01,$ff			; p2_onom
	.byte $ff,$00,$01,$ff			; 
	.byte $ff,$00,$01,$ff			; 
	.byte $ff,$00,$01,$ff			; 
	.byte $ff,$00,$01,$ff			; 
	.byte $ff,$00,$01,$ff			; 

	.byte $ff,$00,$02,$ff			; p3_onom
	.byte $ff,$00,$02,$ff			; 
	.byte $ff,$00,$02,$ff			; 
	.byte $ff,$00,$02,$ff			; 
	.byte $ff,$00,$02,$ff			; 
	.byte $ff,$00,$02,$ff			; 

	.byte $ff,$00,$03,$ff			; p4_onom
	.byte $ff,$00,$03,$ff			; 
	.byte $ff,$00,$03,$ff			; 
	.byte $ff,$00,$03,$ff			; 
	.byte $ff,$00,$03,$ff			; 
	.byte $ff,$00,$03,$ff			; 

	.byte $76,$8e,$00,$50			; left_selector
	.byte $76,$8f,$00,$a0			; right_selector

; *********************************************************
; Include all of the nametables for the game below        *
; *********************************************************

.segment "SAMPLES"

.segment "VECTORS"
	.addr nmi
	.addr reset
	.addr irq
