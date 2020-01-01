title_nmi:

	jmp finish_nmi

controls_nmi:

	jmp finish_nmi

credits_nmi:

	jmp finish_nmi

story_nmi:
;	lda hi_addy
;	cmp #$24
;	beq :+
;	sta $2006
;	lda lo_addy
;	sta $2006
;	lda #$00
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	sta $2007
;	lda lo_addy
;	clc
;	adc #$10
;	sta lo_addy
;	bne :+
;		lda hi_addy
;		clc
;		adc #$01
;		sta hi_addy
;:	jmp @done

@done:
	jmp finish_nmi

gameplay_nmi:
		lda #$23
		sta $2006
		lda #$27
		sta $2006
		lda p1_life1
		sta $2007
		lda p1_life2
		sta $2007
		lda p1_life3
		sta $2007
		lda p1_life4
		sta $2007
		lda p1_life5
		sta $2007
		lda p1_life6
		sta $2007

		lda #$23
		sta $2006
		lda #$67
		sta $2006
		lda p2_life1
		sta $2007
		lda p2_life2
		sta $2007
		lda p2_life3
		sta $2007
		lda p2_life4
		sta $2007
		lda p2_life5
		sta $2007
		lda p2_life6
		sta $2007

		lda #$23
		sta $2006
		lda #$33
		sta $2006
		lda p3_life1
		sta $2007
		lda p3_life2
		sta $2007
		lda p3_life3
		sta $2007
		lda p3_life4
		sta $2007
		lda p3_life5
		sta $2007
		lda p3_life6
		sta $2007

		lda #$23
		sta $2006
		lda #$73
		sta $2006
		lda p4_life1
		sta $2007
		lda p4_life2
		sta $2007
		lda p4_life3
		sta $2007
		lda p4_life4
		sta $2007
		lda p4_life5
		sta $2007
		lda p4_life6
		sta $2007
	jmp finish_nmi

win_nmi:
	ldy #$00
	lda #$21
	sta $2006
	lda #$6c
	sta $2006
:	lda (winner_addy), y
	sta $2007
	iny
	cpy #$08
	bne :-
	jmp finish_nmi
