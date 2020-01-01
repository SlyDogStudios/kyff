players_anim:
	lda p1_anim, x
	and #%01111111
	asl a
	tay
	lda players_anim_table_init+1, y
	pha
	lda players_anim_table_init, y
	pha
	rts

players_anim_table_init:
	.addr nothing-1
	.addr standing_left-1, standing_right-1, walking_left-1, walking_right-1
	.addr punching_left-1, punching_right-1, sweeping_left-1, sweeping_right-1
	.addr hurting_left-1, hurting_right-1, backhanding_left-1, backhanding_right-1
	.addr jumping_right-1, jumping_left-1, jumpkicking_left-1, jumpkicking_right-1
	.addr breathing_left-1, breathing_right-1, quickkicking_left-1, quickkicking_right-1
	.addr elbowing_left-1, elbowing_right-1, slidekicking_left-1, slidekicking_right-1
	.addr shooting_left-1, stilling_left-1, shooting_right-1, stilling_right-1


;***********************************
; stand still facing left
;***********************************
standing_left:
	lda p1_anim, x
	cmp #$81
	beq :+
		lda #$01
		sta p1_anim, x
		txa
		jsr standing_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
standing_left1:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $00,$00,$00		; attack- 00 no, anything else yes; addY; addX
	.byte $f0		; #frames
	.byte <standing_left2, >standing_left2
	.byte $ff
standing_left2:
	.byte $d8,$d9
	.byte $11,$12
	.byte $21,$22
	.byte $00,$00,$00		; attack- 00 no, anything else yes
	.byte $05		; #frames
	.byte <standing_left1, >standing_left1
	.byte $ff
standing_left_choice:
	asl a
	tay
	lda standing_left_table+1,y
	pha
	lda standing_left_table,y
	pha
	rts
standing_left_table:
	.addr p1_stand_left-1, p2_stand_left-1, p3_stand_left-1, p4_stand_left-1
p1_stand_left:
		lda #<standing_left1
		sta p1_anim_addy
		lda #>standing_left1
		sta p1_anim_addy+1
		rts
p2_stand_left:
		lda #<standing_left1
		sta p2_anim_addy
		lda #>standing_left1
		sta p2_anim_addy+1
		rts
p3_stand_left:
		lda #<standing_left1
		sta p3_anim_addy
		lda #>standing_left1
		sta p3_anim_addy+1
		rts
p4_stand_left:
		lda #<standing_left1
		sta p4_anim_addy
		lda #>standing_left1
		sta p4_anim_addy+1
		rts

;*********************************
; stand still facing right
;*********************************
standing_right:
	lda p1_anim, x
	cmp #$82
	beq :+
		lda #$02
		sta p1_anim, x
		txa
		jsr standing_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
standing_right1:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $00,$00,$00		; attack- 00 no, anything else yes
	.byte $f0		; #frames
	.byte <standing_right2, >standing_right2
	.byte $ff
standing_right2:
	.byte $c8,$c9
	.byte $41,$42
	.byte $51,$52
	.byte $00,$00,$00		; attack- 00 no, anything else yes
	.byte $05		; #frames
	.byte <standing_right1, >standing_right1
	.byte $ff
standing_right_choice:
	asl a
	tay
	lda standing_right_table+1,y
	pha
	lda standing_right_table,y
	pha
	rts
standing_right_table:
	.addr p1_stand_right-1, p2_stand_right-1, p3_stand_right-1, p4_stand_right-1
p1_stand_right:
		lda #<standing_right1
		sta p1_anim_addy
		lda #>standing_right1
		sta p1_anim_addy+1
		rts
p2_stand_right:
		lda #<standing_right1
		sta p2_anim_addy
		lda #>standing_right1
		sta p2_anim_addy+1
		rts
p3_stand_right:
		lda #<standing_right1
		sta p3_anim_addy
		lda #>standing_right1
		sta p3_anim_addy+1
		rts
p4_stand_right:
		lda #<standing_right1
		sta p4_anim_addy
		lda #>standing_right1
		sta p4_anim_addy+1
		rts

;*********************************
; walking left
;*********************************
walking_left:
	lda p1_anim, x
	cmp #$83
	beq :+
		lda #$03
		sta p1_anim, x
		txa
		jsr walking_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
walking_left1:
	.byte $60,$61
	.byte $70,$71
	.byte $80,$81
	.byte $00,$00,$00		; attack- 00 no, anything else yes
	.byte $06		; #frames
	.byte <walking_left2, >walking_left2
	.byte $ff
walking_left2:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $00,$00,$00		; attack- 00 no, anything else yes
	.byte $06		; #frames
	.byte <walking_left1, >walking_left1
	.byte $ff
walking_left_choice:
	asl a
	tay
	lda walking_left_table+1,y
	pha
	lda walking_left_table,y
	pha
	rts
walking_left_table:
	.addr p1_walk_left-1, p2_walk_left-1, p3_walk_left-1, p4_walk_left-1
p1_walk_left:
		lda #<walking_left1
		sta p1_anim_addy
		lda #>walking_left1
		sta p1_anim_addy+1
		rts
p2_walk_left:
		lda #<walking_left1
		sta p2_anim_addy
		lda #>walking_left1
		sta p2_anim_addy+1
		rts
p3_walk_left:
		lda #<walking_left1
		sta p3_anim_addy
		lda #>walking_left1
		sta p3_anim_addy+1
		rts
p4_walk_left:
		lda #<walking_left1
		sta p4_anim_addy
		lda #>walking_left1
		sta p4_anim_addy+1
		rts

;*********************************
; walking right
;*********************************
walking_right:
	lda p1_anim, x
	cmp #$84
	beq :+
		lda #$04
		sta p1_anim, x
		txa
		jsr walking_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
walking_right1:
	.byte $90,$91
	.byte $a0,$a1
	.byte $b0,$b1
	.byte $00,$00,$00		; attack- 00 no, anything else yes
	.byte $06		; #frames
	.byte <walking_right2, >walking_right2
	.byte $ff
walking_right2:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $00,$00,$00		; attack- 00 no, anything else yes
	.byte $06		; #frames
	.byte <walking_right1, >walking_right1
	.byte $ff
walking_right_choice:
	asl a
	tay
	lda walking_right_table+1,y
	pha
	lda walking_right_table,y
	pha
	rts
walking_right_table:
	.addr p1_walk_right-1, p2_walk_right-1, p3_walk_right-1, p4_walk_right-1
p1_walk_right:
		lda #<walking_right1
		sta p1_anim_addy
		lda #>walking_right1
		sta p1_anim_addy+1
		rts
p2_walk_right:
		lda #<walking_right1
		sta p2_anim_addy
		lda #>walking_right1
		sta p2_anim_addy+1
		rts
p3_walk_right:
		lda #<walking_right1
		sta p3_anim_addy
		lda #>walking_right1
		sta p3_anim_addy+1
		rts
p4_walk_right:
		lda #<walking_right1
		sta p4_anim_addy
		lda #>walking_right1
		sta p4_anim_addy+1
		rts

;***********************************
; punching left
;***********************************
punching_left:
	lda p1_anim, x
	cmp #$85
	beq :+
		lda #$05
		sta p1_anim, x
		txa
		jsr punching_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
punching_left1:
	.byte $05,$06
	.byte $15,$16
	.byte $25,$26
	.byte $10,$00,$f8
	.byte $10
	.byte <punching_left2, >punching_left2
	.byte $ff
punching_left2:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $00,$00,$00
	.byte $10
	.byte <punching_left3, >punching_left3
	.byte $ff
punching_left3:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $00,$00,$00
	.byte $01
	.byte <standing_left, >standing_left
	.byte $01
punching_left_choice:
	asl a
	tay
	lda punching_left_table+1,y
	pha
	lda punching_left_table,y
	pha
	rts
punching_left_table:
	.addr p1_punch_left-1, p2_punch_left-1, p3_punch_left-1, p4_punch_left-1
p1_punch_left:
		lda #<punching_left1
		sta p1_anim_addy
		lda #>punching_left1
		sta p1_anim_addy+1
		rts
p2_punch_left:
		lda #<punching_left1
		sta p2_anim_addy
		lda #>punching_left1
		sta p2_anim_addy+1
		rts
p3_punch_left:
		lda #<punching_left1
		sta p3_anim_addy
		lda #>punching_left1
		sta p3_anim_addy+1
		rts
p4_punch_left:
		lda #<punching_left1
		sta p4_anim_addy
		lda #>punching_left1
		sta p4_anim_addy+1
		rts

;*********************************
; punching right
;*********************************
punching_right:
	lda p1_anim, x
	cmp #$86
	beq :+
		lda #$06
		sta p1_anim, x
		txa
		jsr punching_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
punching_right1:
	.byte $35,$36
	.byte $45,$46
	.byte $55,$56
	.byte $40,$00,$10
	.byte $10
	.byte <punching_right2, >punching_right2
	.byte $ff
punching_right2:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $00,$00,$00
	.byte $10
	.byte <punching_right3, >punching_right3
	.byte $ff
punching_right3:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $00,$00,$00
	.byte $01
	.byte <standing_right, >standing_right
	.byte $02
punching_right_choice:
	asl a
	tay
	lda punching_right_table+1,y
	pha
	lda punching_right_table,y
	pha
	rts
punching_right_table:
	.addr p1_punch_right-1, p2_punch_right-1, p3_punch_right-1, p4_punch_right-1
p1_punch_right:
		lda #<punching_right1
		sta p1_anim_addy
		lda #>punching_right1
		sta p1_anim_addy+1
		rts
p2_punch_right:
		lda #<punching_right1
		sta p2_anim_addy
		lda #>punching_right1
		sta p2_anim_addy+1
		rts
p3_punch_right:
		lda #<punching_right1
		sta p3_anim_addy
		lda #>punching_right1
		sta p3_anim_addy+1
		rts
p4_punch_right:
		lda #<punching_right1
		sta p4_anim_addy
		lda #>punching_right1
		sta p4_anim_addy+1
		rts

;***********************************
; sweep kick left
;***********************************
sweeping_left:
	lda p1_anim, x
	cmp #$87
	beq :+
		lda #$07
		sta p1_anim, x
		txa
		jsr sweeping_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
sweeping_left1:
	.byte $0b,$0c
	.byte $1b,$1c
	.byte $2b,$2c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $10
	.byte <sweeping_left2, >sweeping_left2
	.byte $ff
sweeping_left2:
	.byte $0d,$0e
	.byte $1d,$1e
	.byte $2d,$2e
	.byte $2f,$08,$f8
	.byte $10
	.byte <sweeping_left3, >sweeping_left3
	.byte $ff
sweeping_left3:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $00,$00,$00
	.byte $01
	.byte <standing_left, >standing_left
	.byte $01
sweeping_left_choice:
	asl a
	tay
	lda sweeping_left_table+1,y
	pha
	lda sweeping_left_table,y
	pha
	rts
sweeping_left_table:
	.addr p1_sweep_left-1, p2_sweep_left-1, p3_sweep_left-1, p4_sweep_left-1
p1_sweep_left:
		lda #<sweeping_left1
		sta p1_anim_addy
		lda #>sweeping_left1
		sta p1_anim_addy+1
		rts
p2_sweep_left:
		lda #<sweeping_left1
		sta p2_anim_addy
		lda #>sweeping_left1
		sta p2_anim_addy+1
		rts
p3_sweep_left:
		lda #<sweeping_left1
		sta p3_anim_addy
		lda #>sweeping_left1
		sta p3_anim_addy+1
		rts
p4_sweep_left:
		lda #<sweeping_left1
		sta p4_anim_addy
		lda #>sweeping_left1
		sta p4_anim_addy+1
		rts

;***********************************
; sweep kick right
;***********************************
sweeping_right:
	lda p1_anim, x
	cmp #$88
	beq :+
		lda #$08
		sta p1_anim, x
		txa
		jsr sweeping_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
sweeping_right1:
	.byte $3b,$3c
	.byte $4b,$4c
	.byte $5b,$5c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $10
	.byte <sweeping_right2, >sweeping_right2
	.byte $ff
sweeping_right2:
	.byte $3d,$3e
	.byte $4d,$4e
	.byte $5d,$5e
	.byte $5f,$08,$10
	.byte $10
	.byte <sweeping_right3, >sweeping_right3
	.byte $ff
sweeping_right3:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $00,$00,$00
	.byte $01
	.byte <standing_right, >standing_right
	.byte $02
sweeping_right_choice:
	asl a
	tay
	lda sweeping_right_table+1,y
	pha
	lda sweeping_right_table,y
	pha
	rts
sweeping_right_table:
	.addr p1_sweep_right-1, p2_sweep_right-1, p3_sweep_right-1, p4_sweep_right-1
p1_sweep_right:
		lda #<sweeping_right1
		sta p1_anim_addy
		lda #>sweeping_right1
		sta p1_anim_addy+1
		rts
p2_sweep_right:
		lda #<sweeping_right1
		sta p2_anim_addy
		lda #>sweeping_right1
		sta p2_anim_addy+1
		rts
p3_sweep_right:
		lda #<sweeping_right1
		sta p3_anim_addy
		lda #>sweeping_right1
		sta p3_anim_addy+1
		rts
p4_sweep_right:
		lda #<sweeping_right1
		sta p4_anim_addy
		lda #>sweeping_right1
		sta p4_anim_addy+1
		rts

;**********************************
; player hurt facing left
;**********************************
hurting_left:
	lda p1_anim, x
	cmp #$89
	beq :+
		lda #$09
		sta p1_anim, x
		txa
		jsr hurting_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
hurting_left1:
	.byte $09,$0a
	.byte $19,$1a
	.byte $29,$2a
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $08
	.byte <hurting_left2, >hurting_left2
	.byte $ff
hurting_left2:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $ff,$00,$00
	.byte $01
	.byte <standing_left1, >standing_left1
	.byte $01
hurting_left_choice:
	asl a
	tay
	lda hurting_left_table+1,y
	pha
	lda hurting_left_table,y
	pha
	rts
hurting_left_table:
	.addr p1_hurt_left-1, p2_hurt_left-1, p3_hurt_left-1, p4_hurt_left-1
p1_hurt_left:
		lda #<hurting_left1
		sta p1_anim_addy
		lda #>hurting_left1
		sta p1_anim_addy+1
		rts
p2_hurt_left:
		lda #<hurting_left1
		sta p2_anim_addy
		lda #>hurting_left1
		sta p2_anim_addy+1
		rts
p3_hurt_left:
		lda #<hurting_left1
		sta p3_anim_addy
		lda #>hurting_left1
		sta p3_anim_addy+1
		rts
p4_hurt_left:
		lda #<hurting_left1
		sta p4_anim_addy
		lda #>hurting_left1
		sta p4_anim_addy+1
		rts

;**********************************
; player hurt facing right
;**********************************
hurting_right:
	lda p1_anim, x
	cmp #$8a
	beq :+
		lda #$0a
		sta p1_anim, x
		txa
		jsr hurting_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
hurting_right1:
	.byte $39,$3a
	.byte $49,$4a
	.byte $59,$5a
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $08
	.byte <hurting_right2, >hurting_right2
	.byte $ff
hurting_right2:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $ff,$00,$00
	.byte $01
	.byte <standing_right1, >standing_right1
	.byte $02
hurting_right_choice:
	asl a
	tay
	lda hurting_right_table+1,y
	pha
	lda hurting_right_table,y
	pha
	rts
hurting_right_table:
	.addr p1_hurt_right-1, p2_hurt_right-1, p3_hurt_right-1, p4_hurt_right-1
p1_hurt_right:
		lda #<hurting_right1
		sta p1_anim_addy
		lda #>hurting_right1
		sta p1_anim_addy+1
		rts
p2_hurt_right:
		lda #<hurting_right1
		sta p2_anim_addy
		lda #>hurting_right1
		sta p2_anim_addy+1
		rts
p3_hurt_right:
		lda #<hurting_right1
		sta p3_anim_addy
		lda #>hurting_right1
		sta p3_anim_addy+1
		rts
p4_hurt_right:
		lda #<hurting_right1
		sta p4_anim_addy
		lda #>hurting_right1
		sta p4_anim_addy+1
		rts

;***********************************
; backhand to the left
;***********************************
backhanding_left:
	lda p1_anim, x
	cmp #$8b
	beq :+
		lda #$0b
		sta p1_anim, x
		txa
		jsr backhanding_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
backhanding_left1:
	.byte $60,$61
	.byte $70,$71
	.byte $80,$81
	.byte $ff,$00,$00		; attack- 00 no, anything else yes; addY; addX
	.byte $06		; #frames
	.byte <backhanding_left2, >backhanding_left2
	.byte $ff
backhanding_left2:
	.byte $66,$67
	.byte $76,$77
	.byte $86,$87
	.byte $ff,$00,$00		; attack- 00 no, anything else yes
	.byte $06		; #frames
	.byte <backhanding_left3, >backhanding_left3
	.byte $ff
backhanding_left3:
	.byte $62,$63
	.byte $72,$73
	.byte $82,$83
	.byte $ff,$00,$00		; attack- 00 no, anything else yes
	.byte $06		; #frames
	.byte <backhanding_left4, >backhanding_left4
	.byte $ff
backhanding_left4:
	.byte $64,$65
	.byte $74,$75
	.byte $84,$85
	.byte $d7,$00,$f8		; attack- 00 no, anything else yes
	.byte $08		; #frames
	.byte <backhanding_left5, >backhanding_left5
	.byte $ff
backhanding_left5:
	.byte $60,$61
	.byte $70,$71
	.byte $80,$81
	.byte $ff,$00,$00		; attack- 00 no, anything else yes; addY; addX
	.byte $06		; #frames
	.byte <backhanding_left6, >backhanding_left6
	.byte $ff
backhanding_left6:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $ff,$00,$00		; attack- 00 no, anything else yes; addY; addX
	.byte $01		; #frames
	.byte <standing_left1, >standing_left1
	.byte $01
backhanding_left_choice:
	asl a
	tay
	lda backhanding_left_table+1,y
	pha
	lda backhanding_left_table,y
	pha
	rts
backhanding_left_table:
	.addr p1_backhand_left-1, p2_backhand_left-1, p3_backhand_left-1, p4_backhand_left-1
p1_backhand_left:
		lda #<backhanding_left1
		sta p1_anim_addy
		lda #>backhanding_left1
		sta p1_anim_addy+1
		rts
p2_backhand_left:
		lda #<backhanding_left1
		sta p2_anim_addy
		lda #>backhanding_left1
		sta p2_anim_addy+1
		rts
p3_backhand_left:
		lda #<backhanding_left1
		sta p3_anim_addy
		lda #>backhanding_left1
		sta p3_anim_addy+1
		rts
p4_backhand_left:
		lda #<backhanding_left1
		sta p4_anim_addy
		lda #>backhanding_left1
		sta p4_anim_addy+1
		rts

;***********************************
; backhand to the right
;***********************************
backhanding_right:
	lda p1_anim, x
	cmp #$8c
	beq :+
		lda #$0c
		sta p1_anim, x
		txa
		jsr backhanding_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
backhanding_right1:
	.byte $90,$91
	.byte $a0,$a1
	.byte $b0,$b1
	.byte $ff,$00,$00		; attack- 00 no, anything else yes; addY; addX
	.byte $06		; #frames
	.byte <backhanding_right2, >backhanding_right2
	.byte $ff
backhanding_right2:
	.byte $96,$97
	.byte $a6,$a7
	.byte $b6,$b7
	.byte $ff,$00,$00		; attack- 00 no, anything else yes
	.byte $06		; #frames
	.byte <backhanding_right3, >backhanding_right3
	.byte $ff
backhanding_right3:
	.byte $92,$93
	.byte $a2,$a3
	.byte $b2,$b3
	.byte $ff,$00,$00		; attack- 00 no, anything else yes
	.byte $06		; #frames
	.byte <backhanding_right4, >backhanding_right4
	.byte $ff
backhanding_right4:
	.byte $94,$95
	.byte $a4,$a5
	.byte $b4,$b5
	.byte $c7,$00,$10		; attack- 00 no, anything else yes
	.byte $08		; #frames
	.byte <backhanding_right5, >backhanding_right5
	.byte $ff
backhanding_right5:
	.byte $90,$91
	.byte $a0,$a1
	.byte $b0,$b1
	.byte $ff,$00,$00		; attack- 00 no, anything else yes; addY; addX
	.byte $06		; #frames
	.byte <backhanding_right6, >backhanding_right6
	.byte $ff
backhanding_right6:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $ff,$00,$00		; attack- 00 no, anything else yes; addY; addX
	.byte $01		; #frames
	.byte <standing_right1, >standing_right1
	.byte $02
backhanding_right_choice:
	asl a
	tay
	lda backhanding_right_table+1,y
	pha
	lda backhanding_right_table,y
	pha
	rts
backhanding_right_table:
	.addr p1_backhand_right-1, p2_backhand_right-1, p3_backhand_right-1, p4_backhand_right-1
p1_backhand_right:
		lda #<backhanding_right1
		sta p1_anim_addy
		lda #>backhanding_right1
		sta p1_anim_addy+1
		rts
p2_backhand_right:
		lda #<backhanding_right1
		sta p2_anim_addy
		lda #>backhanding_right1
		sta p2_anim_addy+1
		rts
p3_backhand_right:
		lda #<backhanding_right1
		sta p3_anim_addy
		lda #>backhanding_right1
		sta p3_anim_addy+1
		rts
p4_backhand_right:
		lda #<backhanding_right1
		sta p4_anim_addy
		lda #>backhanding_right1
		sta p4_anim_addy+1
		rts

;**********************************
; jump in place facing right
;**********************************
jumping_right:
	lda p1_anim, x
	cmp #$8d
	beq :+
		lda #$0d
		sta p1_anim, x
		txa
		jsr jumping_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
jumping_right1:
	.byte $3b,$3c
	.byte $4b,$4c
	.byte $5b,$5c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $04
	.byte <jumping_right2, >jumping_right2
	.byte $ff
jumping_right2:
	.byte $33,$34
	.byte $43,$44
	.byte $53,$54
	.byte $00,$00,$00
	.byte $1b
	.byte <jumping_right3, >jumping_right3
	.byte $ff
jumping_right3:
	.byte $3b,$3c
	.byte $4b,$4c
	.byte $5b,$5c
	.byte $ff,$00,$00
	.byte $10
	.byte <jumping_right4, >jumping_right4
	.byte $ff
jumping_right4:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $ff,$00,$00
	.byte $01
	.byte <standing_right1, >jumping_right1
	.byte $02
jumping_right_choice:
	asl a
	tay
	lda jumping_right_table+1,y
	pha
	lda jumping_right_table,y
	pha
	rts
jumping_right_table:
	.addr p1_jump_right-1, p2_jump_right-1, p3_jump_right-1, p4_jump_right-1
p1_jump_right:
		lda #<jumping_right1
		sta p1_anim_addy
		lda #>jumping_right1
		sta p1_anim_addy+1
		rts
p2_jump_right:
		lda #<jumping_right1
		sta p2_anim_addy
		lda #>jumping_right1
		sta p2_anim_addy+1
		rts
p3_jump_right:
		lda #<jumping_right1
		sta p3_anim_addy
		lda #>jumping_right1
		sta p3_anim_addy+1
		rts
p4_jump_right:
		lda #<jumping_right1
		sta p4_anim_addy
		lda #>jumping_right1
		sta p4_anim_addy+1
		rts

;***********************************
; jump in place facing left
;***********************************
jumping_left:
	lda p1_anim, x
	cmp #$8e
	beq :+
		lda #$0e
		sta p1_anim, x
		txa
		jsr jumping_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
jumping_left1:
	.byte $0b,$0c
	.byte $1b,$1c
	.byte $2b,$2c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $04
	.byte <jumping_left2, >jumping_left2
	.byte $ff
jumping_left2:
	.byte $03,$04
	.byte $13,$14
	.byte $23,$24
	.byte $00,$00,$00
	.byte $1b
	.byte <jumping_left3, >jumping_left3
	.byte $ff
jumping_left3:
	.byte $0b,$0c
	.byte $1b,$1c
	.byte $2b,$2c
	.byte $ff,$00,$00
	.byte $10
	.byte <jumping_left4, >jumping_left4
	.byte $ff
jumping_left4:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $ff,$00,$00
	.byte $01
	.byte <standing_left1, >standing_left1
	.byte $01
jumping_left_choice:
	asl a
	tay
	lda jumping_left_table+1,y
	pha
	lda jumping_left_table,y
	pha
	rts
jumping_left_table:
	.addr p1_jump_left-1, p2_jump_left-1, p3_jump_left-1, p4_jump_left-1
p1_jump_left:
		lda #<jumping_left1
		sta p1_anim_addy
		lda #>jumping_left1
		sta p1_anim_addy+1
		rts
p2_jump_left:
		lda #<jumping_left1
		sta p2_anim_addy
		lda #>jumping_left1
		sta p2_anim_addy+1
		rts
p3_jump_left:
		lda #<jumping_left1
		sta p3_anim_addy
		lda #>jumping_left1
		sta p3_anim_addy+1
		rts
p4_jump_left:
		lda #<jumping_left1
		sta p4_anim_addy
		lda #>jumping_left1
		sta p4_anim_addy+1
		rts

;***********************************
; jump in place facing left
;***********************************
jumpkicking_left:
	lda p1_anim, x
	cmp #$8f
	beq :+
		lda #$0f
		sta p1_anim, x
		txa
		jsr jumpkicking_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
jumpkicking_left1:
	.byte $0b,$0c
	.byte $1b,$1c
	.byte $2b,$2c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $04
	.byte <jumpkicking_left2, >jumpkicking_left2
	.byte $ff
jumpkicking_left2:
	.byte $03,$04
	.byte $13,$14
	.byte $23,$24
	.byte $00,$00,$00
	.byte $08
	.byte <jumpkicking_left3, >jumpkicking_left3
	.byte $ff
jumpkicking_left3:
	.byte $0d,$0e
	.byte $1d,$1e
	.byte $2d,$2e
	.byte $2f,$08,$f8
	.byte $13
	.byte <jumpkicking_left4, >jumpkicking_left4
	.byte $ff
jumpkicking_left4:
	.byte $0b,$0c
	.byte $1b,$1c
	.byte $2b,$2c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $10
	.byte <jumpkicking_left5, >jumpkicking_left5
	.byte $ff
jumpkicking_left5:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $ff,$00,$00
	.byte $01
	.byte <standing_left1, >standing_left1
	.byte $01
jumpkicking_left_choice:
	asl a
	tay
	lda jumpkicking_left_table+1,y
	pha
	lda jumpkicking_left_table,y
	pha
	rts
jumpkicking_left_table:
	.addr p1_jumpkick_left-1, p2_jumpkick_left-1, p3_jumpkick_left-1, p4_jumpkick_left-1
p1_jumpkick_left:
		lda #<jumpkicking_left1
		sta p1_anim_addy
		lda #>jumpkicking_left1
		sta p1_anim_addy+1
		rts
p2_jumpkick_left:
		lda #<jumpkicking_left1
		sta p2_anim_addy
		lda #>jumpkicking_left1
		sta p2_anim_addy+1
		rts
p3_jumpkick_left:
		lda #<jumpkicking_left1
		sta p3_anim_addy
		lda #>jumpkicking_left1
		sta p3_anim_addy+1
		rts
p4_jumpkick_left:
		lda #<jumpkicking_left1
		sta p4_anim_addy
		lda #>jumpkicking_left1
		sta p4_anim_addy+1
		rts

;***********************************
; jump in place facing right
;***********************************
jumpkicking_right:
	lda p1_anim, x
	cmp #$90
	beq :+
		lda #$10
		sta p1_anim, x
		txa
		jsr jumpkicking_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
jumpkicking_right1:
	.byte $3b,$3c
	.byte $4b,$4c
	.byte $5b,$5c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $04
	.byte <jumpkicking_right2, >jumpkicking_right2
	.byte $ff
jumpkicking_right2:
	.byte $33,$34
	.byte $43,$44
	.byte $53,$54
	.byte $00,$00,$00
	.byte $08
	.byte <jumpkicking_right3, >jumpkicking_right3
	.byte $ff
jumpkicking_right3:
	.byte $3d,$3e
	.byte $4d,$4e
	.byte $5d,$5e
	.byte $5f,$08,$10
	.byte $13
	.byte <jumpkicking_right4, >jumpkicking_right4
	.byte $ff
jumpkicking_right4:
	.byte $3b,$3c
	.byte $4b,$4c
	.byte $5b,$5c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $10
	.byte <jumpkicking_right5, >jumpkicking_right5
	.byte $ff
jumpkicking_right5:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $ff,$00,$00
	.byte $01
	.byte <standing_right1, >standing_right1
	.byte $02
jumpkicking_right_choice:
	asl a
	tay
	lda jumpkicking_right_table+1,y
	pha
	lda jumpkicking_right_table,y
	pha
	rts
jumpkicking_right_table:
	.addr p1_jumpkick_right-1, p2_jumpkick_right-1, p3_jumpkick_right-1, p4_jumpkick_right-1
p1_jumpkick_right:
		lda #<jumpkicking_right1
		sta p1_anim_addy
		lda #>jumpkicking_right1
		sta p1_anim_addy+1
		rts
p2_jumpkick_right:
		lda #<jumpkicking_right1
		sta p2_anim_addy
		lda #>jumpkicking_right1
		sta p2_anim_addy+1
		rts
p3_jumpkick_right:
		lda #<jumpkicking_right1
		sta p3_anim_addy
		lda #>jumpkicking_right1
		sta p3_anim_addy+1
		rts
p4_jumpkick_right:
		lda #<jumpkicking_right1
		sta p4_anim_addy
		lda #>jumpkicking_right1
		sta p4_anim_addy+1
		rts

;****************************************
; heavy breathing from damage facing left
;****************************************
breathing_left:
	lda p1_anim, x
	cmp #$91
	beq :+
		lda #$11
		sta p1_anim, x
		txa
		jsr breathing_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
breathing_left1:
	.byte $0b,$0c
	.byte $c5,$c6
	.byte $2b,$2c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $60
	.byte <breathing_left2, >breathing_left2
	.byte $ff
breathing_left2:
	.byte $68,$69
	.byte $78,$79
	.byte $88,$89
	.byte $ff,$00,$00
	.byte $20
	.byte <breathing_left1, >breathing_left1
	.byte $ff
breathing_left_choice:
	asl a
	tay
	lda breathing_left_table+1,y
	pha
	lda breathing_left_table,y
	pha
	rts
breathing_left_table:
	.addr p1_breathe_left-1, p2_breathe_left-1, p3_breathe_left-1, p4_breathe_left-1
p1_breathe_left:
		lda #<breathing_left1
		sta p1_anim_addy
		lda #>breathing_left1
		sta p1_anim_addy+1
		rts
p2_breathe_left:
		lda #<breathing_left1
		sta p2_anim_addy
		lda #>breathing_left1
		sta p2_anim_addy+1
		rts
p3_breathe_left:
		lda #<breathing_left1
		sta p3_anim_addy
		lda #>breathing_left1
		sta p3_anim_addy+1
		rts
p4_breathe_left:
		lda #<breathing_left1
		sta p4_anim_addy
		lda #>breathing_left1
		sta p4_anim_addy+1
		rts

;*****************************************
; heavy breathing from damage facing right
;*****************************************
breathing_right:
	lda p1_anim, x
	cmp #$92
	beq :+
		lda #$12
		sta p1_anim, x
		txa
		jsr breathing_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
breathing_right1:
	.byte $3b,$3c
	.byte $d5,$d6
	.byte $5b,$5c
	.byte $00,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $60
	.byte <breathing_right2, >breathing_right2
	.byte $ff
breathing_right2:
	.byte $98,$99
	.byte $a8,$a9
	.byte $b8,$b9
	.byte $00,$00,$00
	.byte $20
	.byte <breathing_right1, >breathing_right1
	.byte $ff
breathing_right_choice:
	asl a
	tay
	lda breathing_right_table+1,y
	pha
	lda breathing_right_table,y
	pha
	rts
breathing_right_table:
	.addr p1_breathe_right-1, p2_breathe_right-1, p3_breathe_right-1, p4_breathe_right-1
p1_breathe_right:
		lda #<breathing_right1
		sta p1_anim_addy
		lda #>breathing_right1
		sta p1_anim_addy+1
		rts
p2_breathe_right:
		lda #<breathing_right1
		sta p2_anim_addy
		lda #>breathing_right1
		sta p2_anim_addy+1
		rts
p3_breathe_right:
		lda #<breathing_right1
		sta p3_anim_addy
		lda #>breathing_right1
		sta p3_anim_addy+1
		rts
p4_breathe_right:
		lda #<breathing_right1
		sta p4_anim_addy
		lda #>breathing_right1
		sta p4_anim_addy+1
		rts

;**********************************
; triple face kick left
;**********************************
quickkicking_left:
	lda p1_anim, x
	cmp #$93
	beq :+
		lda #$13
		sta p1_anim, x
		txa
		jsr quickkicking_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
quickkicking_left1:
	.byte $0b,$0c
	.byte $1b,$1c
	.byte $2b,$2c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $04
	.byte <quickkicking_left2, >quickkicking_left2
	.byte $ff
quickkicking_left2:
	.byte $03,$04
	.byte $13,$14
	.byte $23,$24
	.byte $00,$00,$00
	.byte $06
	.byte <quickkicking_left3, >quickkicking_left3
	.byte $ff
quickkicking_left3:
	.byte $0d,$0e
	.byte $1d,$1e
	.byte $2d,$2e
	.byte $2f,$08,$f8
	.byte $02
	.byte <quickkicking_left4, >quickkicking_left4
	.byte $ff
quickkicking_left4:
	.byte $03,$04
	.byte $13,$14
	.byte $23,$24
	.byte $00,$00,$00
	.byte $06
	.byte <quickkicking_left5, >quickkicking_left5
	.byte $ff
quickkicking_left5:
	.byte $0d,$0e
	.byte $1d,$1e
	.byte $2d,$2e
	.byte $2f,$08,$f8
	.byte $02
	.byte <quickkicking_left6, >quickkicking_left6
	.byte $ff
quickkicking_left6:
	.byte $03,$04
	.byte $13,$14
	.byte $23,$24
	.byte $00,$00,$00
	.byte $06
	.byte <quickkicking_left7, >quickkicking_left7
	.byte $ff
quickkicking_left7:
	.byte $0d,$0e
	.byte $1d,$1e
	.byte $2d,$2e
	.byte $2f,$08,$f8
	.byte $02
	.byte <quickkicking_left8, >quickkicking_left8
	.byte $ff
quickkicking_left8:
	.byte $0b,$0c
	.byte $1b,$1c
	.byte $2b,$2c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $10
	.byte <quickkicking_left9, >quickkicking_left9
	.byte $ff
quickkicking_left9:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $ff,$00,$00
	.byte $01
	.byte <standing_left1, >standing_left1
	.byte $01
quickkicking_left_choice:
	asl a
	tay
	lda quickkicking_left_table+1,y
	pha
	lda quickkicking_left_table,y
	pha
	rts
quickkicking_left_table:
	.addr p1_quickkick_left-1, p2_quickkick_left-1, p3_quickkick_left-1, p4_quickkick_left-1
p1_quickkick_left:
		lda #<quickkicking_left1
		sta p1_anim_addy
		lda #>quickkicking_left1
		sta p1_anim_addy+1
		rts
p2_quickkick_left:
		lda #<quickkicking_left1
		sta p2_anim_addy
		lda #>quickkicking_left1
		sta p2_anim_addy+1
		rts
p3_quickkick_left:
		lda #<quickkicking_left1
		sta p3_anim_addy
		lda #>quickkicking_left1
		sta p3_anim_addy+1
		rts
p4_quickkick_left:
		lda #<quickkicking_left1
		sta p4_anim_addy
		lda #>quickkicking_left1
		sta p4_anim_addy+1
		rts


;**********************************
; triple face kick right
;**********************************
quickkicking_right:
	lda p1_anim, x
	cmp #$94
	beq :+
		lda #$14
		sta p1_anim, x
		txa
		jsr quickkicking_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
quickkicking_right1:
	.byte $3b,$3c
	.byte $4b,$4c
	.byte $5b,$5c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $04
	.byte <quickkicking_right2, >quickkicking_right2
	.byte $ff
quickkicking_right2:
	.byte $33,$34
	.byte $43,$44
	.byte $53,$54
	.byte $00,$00,$00
	.byte $06
	.byte <quickkicking_right3, >quickkicking_right3
	.byte $ff
quickkicking_right3:
	.byte $3d,$3e
	.byte $4d,$4e
	.byte $5d,$5e
	.byte $5f,$08,$10
	.byte $02
	.byte <quickkicking_right4, >quickkicking_right4
	.byte $ff
quickkicking_right4:
	.byte $33,$34
	.byte $43,$44
	.byte $53,$54
	.byte $00,$00,$00
	.byte $06
	.byte <quickkicking_right5, >quickkicking_right5
	.byte $ff
quickkicking_right5:
	.byte $3d,$3e
	.byte $4d,$4e
	.byte $5d,$5e
	.byte $5f,$08,$10
	.byte $02
	.byte <quickkicking_right6, >quickkicking_right6
	.byte $ff
quickkicking_right6:
	.byte $33,$34
	.byte $43,$44
	.byte $53,$54
	.byte $00,$00,$00
	.byte $06
	.byte <quickkicking_right7, >quickkicking_right7
	.byte $ff
quickkicking_right7:
	.byte $3d,$3e
	.byte $4d,$4e
	.byte $5d,$5e
	.byte $5f,$08,$10
	.byte $02
	.byte <quickkicking_right8, >quickkicking_right8
	.byte $ff
quickkicking_right8:
	.byte $3b,$3c
	.byte $4b,$4c
	.byte $5b,$5c
	.byte $ff,$00,$00	; $FF TO TEST FOR NOT CHECKING FOR STANDING STILL ("LOCKED")
	.byte $10
	.byte <quickkicking_right9, >quickkicking_right9
	.byte $ff
quickkicking_right9:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $ff,$00,$00
	.byte $01
	.byte <standing_right1, >standing_right1
	.byte $02
quickkicking_right_choice:
	asl a
	tay
	lda quickkicking_right_table+1,y
	pha
	lda quickkicking_right_table,y
	pha
	rts
quickkicking_right_table:
	.addr p1_quickkick_right-1, p2_quickkick_right-1, p3_quickkick_right-1, p4_quickkick_right-1
p1_quickkick_right:
		lda #<quickkicking_right1
		sta p1_anim_addy
		lda #>quickkicking_right1
		sta p1_anim_addy+1
		rts
p2_quickkick_right:
		lda #<quickkicking_right1
		sta p2_anim_addy
		lda #>quickkicking_right1
		sta p2_anim_addy+1
		rts
p3_quickkick_right:
		lda #<quickkicking_right1
		sta p3_anim_addy
		lda #>quickkicking_right1
		sta p3_anim_addy+1
		rts
p4_quickkick_right:
		lda #<quickkicking_right1
		sta p4_anim_addy
		lda #>quickkicking_right1
		sta p4_anim_addy+1
		rts

;***********************************
; elbowing left
;***********************************
elbowing_left:
	lda p1_anim, x
	cmp #$95
	beq :+
		lda #$15
		sta p1_anim, x
		txa
		jsr elbowing_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
elbowing_left1:
	.byte $37,$38
	.byte $47,$48
	.byte $57,$58
	.byte $30,$00,$f8
	.byte $10
	.byte <elbowing_left2, >elbowing_left2
	.byte $ff
elbowing_left2:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $00,$00,$00
	.byte $10
	.byte <elbowing_left3, >elbowing_left3
	.byte $ff
elbowing_left3:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $00,$00,$00
	.byte $01
	.byte <standing_right, >standing_right
	.byte $02
elbowing_left_choice:
	asl a
	tay
	lda elbowing_left_table+1,y
	pha
	lda elbowing_left_table,y
	pha
	rts
elbowing_left_table:
	.addr p1_elbow_left-1, p2_elbow_left-1, p3_elbow_left-1, p4_elbow_left-1
p1_elbow_left:
		lda #<elbowing_left1
		sta p1_anim_addy
		lda #>elbowing_left1
		sta p1_anim_addy+1
		rts
p2_elbow_left:
		lda #<elbowing_left1
		sta p2_anim_addy
		lda #>elbowing_left1
		sta p2_anim_addy+1
		rts
p3_elbow_left:
		lda #<elbowing_left1
		sta p3_anim_addy
		lda #>elbowing_left1
		sta p3_anim_addy+1
		rts
p4_elbow_left:
		lda #<elbowing_left1
		sta p4_anim_addy
		lda #>elbowing_left1
		sta p4_anim_addy+1
		rts

;***********************************
; elbowing right
;***********************************
elbowing_right:
	lda p1_anim, x
	cmp #$96
	beq :+
		lda #$16
		sta p1_anim, x
		txa
		jsr elbowing_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
elbowing_right1:
	.byte $07,$08
	.byte $17,$18
	.byte $27,$28
	.byte $20,$00,$10
	.byte $10
	.byte <elbowing_right2, >elbowing_right2
	.byte $ff
elbowing_right2:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $00,$00,$00
	.byte $10
	.byte <elbowing_right3, >elbowing_right3
	.byte $ff
elbowing_right3:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $00,$00,$00
	.byte $01
	.byte <standing_left, >standing_left
	.byte $01
elbowing_right_choice:
	asl a
	tay
	lda elbowing_right_table+1,y
	pha
	lda elbowing_right_table,y
	pha
	rts
elbowing_right_table:
	.addr p1_elbow_right-1, p2_elbow_right-1, p3_elbow_right-1, p4_elbow_right-1
p1_elbow_right:
		lda #<elbowing_right1
		sta p1_anim_addy
		lda #>elbowing_right1
		sta p1_anim_addy+1
		rts
p2_elbow_right:
		lda #<elbowing_right1
		sta p2_anim_addy
		lda #>elbowing_right1
		sta p2_anim_addy+1
		rts
p3_elbow_right:
		lda #<elbowing_right1
		sta p3_anim_addy
		lda #>elbowing_right1
		sta p3_anim_addy+1
		rts
p4_elbow_right:
		lda #<elbowing_right1
		sta p4_anim_addy
		lda #>elbowing_right1
		sta p4_anim_addy+1
		rts

;***************************************
; Sub Zero style slide kick to the left
;***************************************
slidekicking_left:
	lda p1_anim, x
	cmp #$97
	beq :+
		lda #$17
		sta p1_anim, x
		txa
		jsr slidekicking_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
slidekicking_left1:
	.byte $0d,$0e
	.byte $1d,$1e
	.byte $2d,$2e
	.byte $2f,$08,$f8
	.byte $25
	.byte <slidekicking_left2, >slidekicking_left2
	.byte $ff
slidekicking_left2:
	.byte $01,$02
	.byte $11,$12
	.byte $21,$22
	.byte $00,$00,$00
	.byte $01
	.byte <standing_left, >standing_left
	.byte $01
slidekicking_left_choice:
	asl a
	tay
	lda slidekicking_left_table+1,y
	pha
	lda slidekicking_left_table,y
	pha
	rts
slidekicking_left_table:
	.addr p1_slidekick_left-1, p2_slidekick_left-1, p3_slidekick_left-1, p4_slidekick_left-1
p1_slidekick_left:
		lda #<slidekicking_left1
		sta p1_anim_addy
		lda #>slidekicking_left1
		sta p1_anim_addy+1
		rts
p2_slidekick_left:
		lda #<slidekicking_left1
		sta p2_anim_addy
		lda #>slidekicking_left1
		sta p2_anim_addy+1
		rts
p3_slidekick_left:
		lda #<slidekicking_left1
		sta p3_anim_addy
		lda #>slidekicking_left1
		sta p3_anim_addy+1
		rts
p4_slidekick_left:
		lda #<slidekicking_left1
		sta p4_anim_addy
		lda #>slidekicking_left1
		sta p4_anim_addy+1
		rts

;*********************************
; Sub Zero style slide kick to the right
;*****************************************
slidekicking_right:
	lda p1_anim, x
	cmp #$98
	beq :+
		lda #$18
		sta p1_anim, x
		txa
		jsr slidekicking_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
slidekicking_right1:
	.byte $3d,$3e
	.byte $4d,$4e
	.byte $5d,$5e
	.byte $5f,$08,$10
	.byte $25
	.byte <slidekicking_right2, >slidekicking_right2
	.byte $ff
slidekicking_right2:
	.byte $31,$32
	.byte $41,$42
	.byte $51,$52
	.byte $00,$00,$00
	.byte $01
	.byte <standing_right, >standing_right
	.byte $01
slidekicking_right_choice:
	asl a
	tay
	lda slidekicking_right_table+1,y
	pha
	lda slidekicking_right_table,y
	pha
	rts
slidekicking_right_table:
	.addr p1_slidekick_right-1, p2_slidekick_right-1, p3_slidekick_right-1, p4_slidekick_right-1
p1_slidekick_right:
		lda #<slidekicking_right1
		sta p1_anim_addy
		lda #>slidekicking_right1
		sta p1_anim_addy+1
		rts
p2_slidekick_right:
		lda #<slidekicking_right1
		sta p2_anim_addy
		lda #>slidekicking_right1
		sta p2_anim_addy+1
		rts
p3_slidekick_right:
		lda #<slidekicking_right1
		sta p3_anim_addy
		lda #>slidekicking_right1
		sta p3_anim_addy+1
		rts
p4_slidekick_right:
		lda #<slidekicking_right1
		sta p4_anim_addy
		lda #>slidekicking_right1
		sta p4_anim_addy+1
		rts




shooting_left:
	lda p1_anim, x
	cmp #$99
	beq :+
		lda #$19
		sta p1_anim, x
		txa
		jsr shooting_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
shooting_left1:
	.byte $c0,$c1
	.byte $d0,$d1
	.byte $29,$2a
	.byte $00,$00,$00
	.byte $25
	.byte <shooting_left2, >shooting_left2
	.byte $ff
shooting_left2:
	.byte $03,$04
	.byte $13,$14
	.byte $23,$24
	.byte $c4,$00,$00
	.byte $01
	.byte <stilling_left, >stilling_left
	.byte $1a
shooting_left_choice:
	asl a
	tay
	lda shooting_left_table+1,y
	pha
	lda shooting_left_table,y
	pha
	rts
shooting_left_table:
	.addr p1_shoot_left-1, p2_shoot_left-1, p3_shoot_left-1, p4_shoot_left-1
p1_shoot_left:
		lda #<shooting_left1
		sta p1_anim_addy
		lda #>shooting_left1
		sta p1_anim_addy+1
		rts
p2_shoot_left:
		lda #<shooting_left1
		sta p2_anim_addy
		lda #>shooting_left1
		sta p2_anim_addy+1
		rts
p3_shoot_left:
		lda #<shooting_left1
		sta p3_anim_addy
		lda #>shooting_left1
		sta p3_anim_addy+1
		rts
p4_shoot_left:
		lda #<shooting_left1
		sta p4_anim_addy
		lda #>shooting_left1
		sta p4_anim_addy+1
		rts

stilling_left:
	lda p1_anim, x
	cmp #$9a
	beq :+
		lda #$1a
		sta p1_anim, x
		txa
		jsr stilling_left_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
stilling_left1:
	.byte $03,$04
	.byte $13,$14
	.byte $23,$24
	.byte $c4,$00,$00
	.byte $01
	.byte <stilling_left1, >stilling_left1
	.byte $9a
stilling_left_choice:
	asl a
	tay
	lda stilling_left_table+1,y
	pha
	lda stilling_left_table,y
	pha
	rts
stilling_left_table:
	.addr p1_still_left-1, p2_still_left-1, p3_still_left-1, p4_still_left-1
p1_still_left:
		lda #<stilling_left1
		sta p1_anim_addy
		lda #>stilling_left1
		sta p1_anim_addy+1
		rts
p2_still_left:
		lda #<stilling_left1
		sta p2_anim_addy
		lda #>stilling_left1
		sta p2_anim_addy+1
		rts
p3_still_left:
		lda #<stilling_left1
		sta p3_anim_addy
		lda #>stilling_left1
		sta p3_anim_addy+1
		rts
p4_still_left:
		lda #<stilling_left1
		sta p4_anim_addy
		lda #>stilling_left1
		sta p4_anim_addy+1
		rts

shooting_right:
	lda p1_anim, x
	cmp #$9b
	beq :+
		lda #$1b
		sta p1_anim, x
		txa
		jsr shooting_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
shooting_right1:
	.byte $c2,$c3
	.byte $d2,$d3
	.byte $59,$5a
	.byte $00,$00,$00
	.byte $25
	.byte <shooting_right2, >shooting_right2
	.byte $ff
shooting_right2:
	.byte $33,$34
	.byte $43,$44
	.byte $53,$54
	.byte $d4,$00,$08
	.byte $01
	.byte <stilling_right, >stilling_right
	.byte $1c
shooting_right_choice:
	asl a
	tay
	lda shooting_right_table+1,y
	pha
	lda shooting_right_table,y
	pha
	rts
shooting_right_table:
	.addr p1_shoot_right-1, p2_shoot_right-1, p3_shoot_right-1, p4_shoot_right-1
p1_shoot_right:
		lda #<shooting_right1
		sta p1_anim_addy
		lda #>shooting_right1
		sta p1_anim_addy+1
		rts
p2_shoot_right:
		lda #<shooting_right1
		sta p2_anim_addy
		lda #>shooting_right1
		sta p2_anim_addy+1
		rts
p3_shoot_right:
		lda #<shooting_right1
		sta p3_anim_addy
		lda #>shooting_right1
		sta p3_anim_addy+1
		rts
p4_shoot_right:
		lda #<shooting_right1
		sta p4_anim_addy
		lda #>shooting_right1
		sta p4_anim_addy+1
		rts

stilling_right:
	lda p1_anim, x
	cmp #$9c
	beq :+
		lda #$1c
		sta p1_anim, x
		txa
		jsr stilling_right_choice
		jsr p_anim_load
		lda p1_anim, x
;		eor #%10000000
		clc
		adc #$80
		sta p1_anim, x
:	dec p1_anim_count, x
	beq :+
		rts
:	jsr p_anim_load
	rts
stilling_right1:
	.byte $33,$34
	.byte $43,$44
	.byte $53,$54
	.byte $d4,$00,$00
	.byte $01
	.byte <stilling_right1, >stilling_right1
	.byte $9c
stilling_right_choice:
	asl a
	tay
	lda stilling_right_table+1,y
	pha
	lda stilling_right_table,y
	pha
	rts
stilling_right_table:
	.addr p1_still_right-1, p2_still_right-1, p3_still_right-1, p4_still_right-1
p1_still_right:
		lda #<stilling_right1
		sta p1_anim_addy
		lda #>stilling_right1
		sta p1_anim_addy+1
		rts
p2_still_right:
		lda #<stilling_right1
		sta p2_anim_addy
		lda #>stilling_right1
		sta p2_anim_addy+1
		rts
p3_still_right:
		lda #<stilling_right1
		sta p3_anim_addy
		lda #>stilling_right1
		sta p3_anim_addy+1
		rts
p4_still_right:
		lda #<stilling_right1
		sta p4_anim_addy
		lda #>stilling_right1
		sta p4_anim_addy+1
		rts


p_anim_load:
	cpx #$00
	bne :+
		jsr p1_anim_load
		rts
:	cpx #$01
	bne :+
		jsr p2_anim_load
		rts
:	cpx #$02
	bne :+
		jsr p3_anim_load
		rts
:	jsr p4_anim_load
	rts
p1_anim_load:
	ldy #$00
	lda (p1_anim_addy), y
	sta p1_top_left+1
	iny
	lda (p1_anim_addy), y
	sta p1_top_right+1
	iny
	lda (p1_anim_addy), y
	sta p1_mid_left+1
	iny
	lda (p1_anim_addy), y
	sta p1_mid_right+1
	iny
	lda (p1_anim_addy), y
	sta p1_bot_left+1
	iny
	lda (p1_anim_addy), y
	sta p1_bot_right+1
	iny
	lda (p1_anim_addy), y
	sta p1_attack+1
	sta p1_attack_num
	beq :+
	iny
	lda (p1_anim_addy), y
	sta p1_attack_y
	iny
	lda (p1_anim_addy), y
	sta p1_attack_x
	iny
	jmp :++
:	iny
	iny
	iny
:	lda (p1_anim_addy), y
	sta p1_anim_count
	iny
	lda (p1_anim_addy), y
	sta temp_addy
	iny
	lda (p1_anim_addy), y
	sta temp_addy+1
	iny
	lda (p1_anim_addy), y
	cmp #$ff
	beq :+
		sta p1_anim
:
	lda temp_addy
	sta p1_anim_addy
	lda temp_addy+1
	sta p1_anim_addy+1
	rts
p2_anim_load:
	ldy #$00
	lda (p2_anim_addy), y
	sta p2_top_left+1
	iny
	lda (p2_anim_addy), y
	sta p2_top_right+1
	iny
	lda (p2_anim_addy), y
	sta p2_mid_left+1
	iny
	lda (p2_anim_addy), y
	sta p2_mid_right+1
	iny
	lda (p2_anim_addy), y
	sta p2_bot_left+1
	iny
	lda (p2_anim_addy), y
	sta p2_bot_right+1
	iny
	lda (p2_anim_addy), y
	sta p2_attack+1
	sta p2_attack_num
	beq :+
	iny
	lda (p2_anim_addy), y
	sta p2_attack_y
	iny
	lda (p2_anim_addy), y
	sta p2_attack_x
	iny
	jmp :++
:	iny
	iny
	iny
:

	lda (p2_anim_addy), y
	sta p2_anim_count
	iny
	lda (p2_anim_addy), y
	sta temp_addy
	iny
	lda (p2_anim_addy), y
	sta temp_addy+1
	iny
	lda (p2_anim_addy), y
	cmp #$ff
	beq :+
		sta p2_anim
:
	lda temp_addy
	sta p2_anim_addy
	lda temp_addy+1
	sta p2_anim_addy+1
	rts
p3_anim_load:
	ldy #$00
	lda (p3_anim_addy), y
	sta p3_top_left+1
	iny
	lda (p3_anim_addy), y
	sta p3_top_right+1
	iny
	lda (p3_anim_addy), y
	sta p3_mid_left+1
	iny
	lda (p3_anim_addy), y
	sta p3_mid_right+1
	iny
	lda (p3_anim_addy), y
	sta p3_bot_left+1
	iny
	lda (p3_anim_addy), y
	sta p3_bot_right+1
	iny
	lda (p3_anim_addy), y
	sta p3_attack+1
	sta p3_attack_num
	beq :+
	iny
	lda (p3_anim_addy), y
	sta p3_attack_y
	iny
	lda (p3_anim_addy), y
	sta p3_attack_x
	iny
	jmp :++
:	iny
	iny
	iny
:

	lda (p3_anim_addy), y
	sta p3_anim_count
	iny
	lda (p3_anim_addy), y
	sta temp_addy
	iny
	lda (p3_anim_addy), y
	sta temp_addy+1
	iny
	lda (p3_anim_addy), y
	cmp #$ff
	beq :+
		sta p3_anim
:
	lda temp_addy
	sta p3_anim_addy
	lda temp_addy+1
	sta p3_anim_addy+1
	rts
p4_anim_load:
	ldy #$00
	lda (p4_anim_addy), y
	sta p4_top_left+1
	iny
	lda (p4_anim_addy), y
	sta p4_top_right+1
	iny
	lda (p4_anim_addy), y
	sta p4_mid_left+1
	iny
	lda (p4_anim_addy), y
	sta p4_mid_right+1
	iny
	lda (p4_anim_addy), y
	sta p4_bot_left+1
	iny
	lda (p4_anim_addy), y
	sta p4_bot_right+1
	iny
	lda (p4_anim_addy), y
	sta p4_attack+1
	sta p4_attack_num
	beq :+
	iny
	lda (p4_anim_addy), y
	sta p4_attack_y
	iny
	lda (p4_anim_addy), y
	sta p4_attack_x
	iny
	jmp :++
:	iny
	iny
	iny
:
	lda (p4_anim_addy), y
	sta p4_anim_count
	iny
	lda (p4_anim_addy), y
	sta temp_addy
	iny
	lda (p4_anim_addy), y
	sta temp_addy+1
	iny
	lda (p4_anim_addy), y
	cmp #$ff
	beq :+
		sta p4_anim
:
	lda temp_addy
	sta p4_anim_addy
	lda temp_addy+1
	sta p4_anim_addy+1
	rts

nothing:
	rts

attack_boxes_offscreen:
	lda p1_attack+1
	cmp #$ff
	bne :+
		lda #$ff
		sta p1_attack
		jmp @test_p2
:	lda p1_attack+1
	bne @p1_add_attack
		lda #$ff
		sta p1_attack
		jmp @test_p2
@p1_add_attack:
	lda p1_attack_num
	beq @test_p2
		lda p1_anim
		cmp #$9a
		beq @p1_shoot_left
		cmp #$9c
		beq @p1_shoot_right
	lda p1_mid_left
	clc
	adc p1_attack_y
	sta p1_attack
	lda p1_mid_left+3
	clc
	adc p1_attack_x
	sta p1_attack+3
	jmp @test_p2
@p1_shoot_left:
	jsr player1_shoot_left
	jmp @test_p2
@p1_shoot_right:
	jsr player1_shoot_right
@test_p2:
	lda p2_attack+1
	cmp #$ff
	bne :+
		lda #$ff
		sta p2_attack
		jmp @test_p3
:	lda p2_attack+1
	bne @p2_add_attack
		lda #$ff
		sta p2_attack
@p2_add_attack:
	lda p2_attack_num
	beq @test_p3
		lda p2_anim
		cmp #$9a
		beq @p2_shoot_left
		cmp #$9c
		beq @p2_shoot_right
	lda p2_mid_left
	clc
	adc p2_attack_y
	sta p2_attack
	lda p2_mid_left+3
	clc
	adc p2_attack_x
	sta p2_attack+3
	jmp @test_p3
@p2_shoot_left:
	jsr player2_shoot_left
	jmp @test_p3
@p2_shoot_right:
	jsr player2_shoot_right
@test_p3:
	lda p3_attack+1
	cmp #$ff
	bne :+
		lda #$ff
		sta p3_attack
		jmp @test_p4
:	lda p3_attack+1
	bne @p3_add_attack
		lda #$ff
		sta p3_attack
@p3_add_attack:
	lda p3_attack_num
	beq @test_p4
		lda p3_anim
		cmp #$9a
		beq @p3_shoot_left
		cmp #$9c
		beq @p3_shoot_right
	lda p3_mid_left
	clc
	adc p3_attack_y
	sta p3_attack
	lda p3_mid_left+3
	clc
	adc p3_attack_x
	sta p3_attack+3
	jmp @test_p4
@p3_shoot_left:
	jsr player3_shoot_left
	jmp @test_p4
@p3_shoot_right:
	jsr player3_shoot_right
@test_p4:
	lda p4_attack+1
	cmp #$ff
	bne :+
		lda #$ff
		sta p4_attack
		jmp @test_done
:	lda p4_attack+1
	bne @p4_add_attack
		lda #$ff
		sta p4_attack
@p4_add_attack:
	lda p4_attack_num
	beq @test_done
		lda p4_anim
		cmp #$9a
		beq @p4_shoot_left
		cmp #$9c
		beq @p4_shoot_right
	lda p4_mid_left
	clc
	adc p4_attack_y
	sta p4_attack
	lda p4_mid_left+3
	clc
	adc p4_attack_x
	sta p4_attack+3
	jmp @test_done
@p4_shoot_left:
	jsr player4_shoot_left
	jmp @test_done
@p4_shoot_right:
	jsr player4_shoot_right
@test_done:
	rts

player1_shoot_left:
	lda p1_attack+3
	cmp #$20
	bcs :+
		lda #$01
		sta p1_anim
		jmp :++
:	sec
	sbc #$02
	sta p1_attack+3
:	rts
player1_shoot_right:
	lda p1_attack+3
	cmp #$d8
	bcc :+
		lda #$02
		sta p1_anim
		jmp :++
:	clc
	adc #$02
	sta p1_attack+3
:	rts
player2_shoot_left:
	lda p2_attack+3
	cmp #$20
	bcs :+
		lda #$01
		sta p2_anim
		jmp :++
:	sec
	sbc #$02
	sta p2_attack+3
:	rts
player2_shoot_right:
	lda p2_attack+3
	cmp #$d8
	bcc :+
		lda #$02
		sta p2_anim
		jmp :++
:	clc
	adc #$02
	sta p2_attack+3
:	rts
player3_shoot_left:
	lda p3_attack+3
	cmp #$20
	bcs :+
		lda #$01
		sta p3_anim
		jmp :++
:	sec
	sbc #$02
	sta p3_attack+3
:	rts
player3_shoot_right:
	lda p3_attack+3
	cmp #$d8
	bcc :+
		lda #$02
		sta p3_anim
		jmp :++
:	clc
	adc #$02
	sta p3_attack+3
:	rts
player4_shoot_left:
	lda p4_attack+3
	cmp #$20
	bcs :+
		lda #$01
		sta p4_anim
		jmp :++
:	sec
	sbc #$02
	sta p4_attack+3
:	rts
player4_shoot_right:
	lda p4_attack+3
	cmp #$d8
	bcc :+
		lda #$02
		sta p4_anim
		jmp :++
:	clc
	adc #$02
	sta p4_attack+3
:	rts
p_jumping_addition_table: ; for the ypos
	.byte $00,$00,$00,$00,$00,$fc,$00,$fc,$00,$fc,$00,$fc,$00,$fd,$00,$fe,$00,$ff,$00
	.byte $01,$00,$02,$00,$03,$00,$04,$00,$04,$00,$04,$00,$04
p_jump_left_addition_table: ; for the xpos
	.byte $00,$00,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff,$00
	.byte $ff,$00,$ff,$ff,$ff,$00,$ff,$00,$ff,$00,$ff,$00,$ff
p_jump_right_addition_table: ; for the xpos
	.byte $00,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00
	.byte $01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01
p_slide_left_addition_table: ; for the xpos
	.byte $00,$fe,$fe,$fe,$00,$fe,$fe,$fe,$00,$ff,$ff,$ff,$00,$ff,$ff,$ff,$00,$ff,$ff
	.byte $ff,$00,$ff,$ff,$ff,$00,$ff,$ff,$ff,$00,$ff,$ff,$ff
p_slide_right_addition_table: ; for the xpos
	.byte $00,$02,$02,$02,$00,$02,$02,$02,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01
	.byte $01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01

p1_dying:
	lda p1_stopper
	cmp #$ff
	bne :+
		rts
:	lda p1_killed
	bne :+
		rts
:	lda p1_stopper
	bne :+
		lda p1_top_left
		sec
		sbc #$15
		sta p1_stopper
		txa
		pha
		lda #$83
		jsr music_loadsfx
		pla
		tax
:	lda p1_top_left
	cmp p1_stopper
	bcs :+
		lda #$ff
		sta p1_top_left
		sta p1_top_right
		sta p1_mid_left
		sta p1_mid_right
		sta p1_bot_left
		sta p1_bot_right
		sta p1_attack
		sta p1_top
		sta p1_bottom
		sta p1_left
		sta p1_right
		sta p1_left_attack
		sta p1_top_attack
		sta p1_right_attack
		sta p1_bot_attack
		sta p1_stopper
		lda #$01
		sta p1_attack_num
		lda players_dead
		eor #%00001000
		sta players_dead
		rts
:	lda p1_top_left
	sec
	sbc #$03
	sta p1_top_left
	lda p1_top_left+3
	sec
	sbc #$03
	sta p1_top_left+3
	lda p1_top_right
	sec
	sbc #$03
	sta p1_top_right
	lda p1_top_right+3
	clc
	adc #$03
	sta p1_top_right+3
	lda p1_mid_left+3
	sec
	sbc #$03
	sta p1_mid_left+3
	lda p1_mid_right+3
	clc
	adc #$03
	sta p1_mid_right+3
	lda p1_bot_left
	clc
	adc #$03
	sta p1_bot_left
	lda p1_bot_left+3
	sec
	sbc #$03
	sta p1_bot_left+3
	lda p1_bot_right
	clc
	adc #$03
	sta p1_bot_right
	lda p1_bot_right+3
	clc
	adc #$03
	sta p1_bot_right+3
	lda #$ff
	sta p1_attack
	rts
p2_dying:
	lda p2_stopper
	cmp #$ff
	bne :+
		rts
:	lda p2_killed
	bne :+
		rts
:	lda p2_stopper
	bne :+
		lda p2_top_left
		sec
		sbc #$15
		sta p2_stopper
		txa
		pha
		lda #$83
		jsr music_loadsfx
		pla
		tax
:	lda p2_top_left
	cmp p2_stopper
	bcs :+
		lda #$ff
		sta p2_top_left
		sta p2_top_right
		sta p2_mid_left
		sta p2_mid_right
		sta p2_bot_left
		sta p2_bot_right
		sta p2_attack
		sta p2_top
		sta p2_bottom
		sta p2_left
		sta p2_right
		sta p2_left_attack
		sta p2_top_attack
		sta p2_right_attack
		sta p2_bot_attack
		sta p2_stopper
		lda #$01
		sta p2_attack_num
		lda players_dead
		eor #%00000100
		sta players_dead
		rts
:	lda p2_top_left
	sec
	sbc #$03
	sta p2_top_left
	lda p2_top_left+3
	sec
	sbc #$03
	sta p2_top_left+3
	lda p2_top_right
	sec
	sbc #$03
	sta p2_top_right
	lda p2_top_right+3
	clc
	adc #$03
	sta p2_top_right+3
	lda p2_mid_left+3
	sec
	sbc #$03
	sta p2_mid_left+3
	lda p2_mid_right+3
	clc
	adc #$03
	sta p2_mid_right+3
	lda p2_bot_left
	clc
	adc #$03
	sta p2_bot_left
	lda p2_bot_left+3
	sec
	sbc #$03
	sta p2_bot_left+3
	lda p2_bot_right
	clc
	adc #$03
	sta p2_bot_right
	lda p2_bot_right+3
	clc
	adc #$03
	sta p2_bot_right+3
	lda #$ff
	sta p2_attack
	rts

p3_dying:
	lda p3_stopper
	cmp #$ff
	bne :+
		rts
:	lda p3_killed
	bne :+
		rts
:	lda p3_stopper
	bne :+
		lda p3_top_left
		sec
		sbc #$15
		sta p3_stopper
		txa
		pha
		lda #$83
		jsr music_loadsfx
		pla
		tax
:	lda p3_top_left
	cmp p3_stopper
	bcs :+
		lda #$ff
		sta p3_top_left
		sta p3_top_right
		sta p3_mid_left
		sta p3_mid_right
		sta p3_bot_left
		sta p3_bot_right
		sta p3_attack
		sta p3_top
		sta p3_bottom
		sta p3_left
		sta p3_right
		sta p3_left_attack
		sta p3_top_attack
		sta p3_right_attack
		sta p3_bot_attack
		sta p3_stopper
		lda #$01
		sta p3_attack_num
		lda players_dead
		eor #%00000010
		sta players_dead
		rts
:	lda p3_top_left
	sec
	sbc #$03
	sta p3_top_left
	lda p3_top_left+3
	sec
	sbc #$03
	sta p3_top_left+3
	lda p3_top_right
	sec
	sbc #$03
	sta p3_top_right
	lda p3_top_right+3
	clc
	adc #$03
	sta p3_top_right+3
	lda p3_mid_left+3
	sec
	sbc #$03
	sta p3_mid_left+3
	lda p3_mid_right+3
	clc
	adc #$03
	sta p3_mid_right+3
	lda p3_bot_left
	clc
	adc #$03
	sta p3_bot_left
	lda p3_bot_left+3
	sec
	sbc #$03
	sta p3_bot_left+3
	lda p3_bot_right
	clc
	adc #$03
	sta p3_bot_right
	lda p3_bot_right+3
	clc
	adc #$03
	sta p3_bot_right+3
	lda #$ff
	sta p3_attack
	rts
p4_dying:
	lda p4_stopper
	cmp #$ff
	bne :+
		rts
:	lda p4_killed
	bne :+
		rts
:	lda p4_stopper
	bne :+
		lda p4_top_left
		sec
		sbc #$15
		sta p4_stopper
		txa
		pha
		lda #$83
		jsr music_loadsfx
		pla
		tax
:	lda p4_top_left
	cmp p4_stopper
	bcs :+
		lda #$ff
		sta p4_top_left
		sta p4_top_right
		sta p4_mid_left
		sta p4_mid_right
		sta p4_bot_left
		sta p4_bot_right
		sta p4_attack
		sta p4_top
		sta p4_bottom
		sta p4_left
		sta p4_right
		sta p4_left_attack
		sta p4_top_attack
		sta p4_right_attack
		sta p4_bot_attack
		sta p4_stopper
		lda #$01
		sta p1_attack_num
		lda players_dead
		eor #%00000001
		sta players_dead
		rts
:	lda p4_top_left
	sec
	sbc #$03
	sta p4_top_left
	lda p4_top_left+3
	sec
	sbc #$03
	sta p4_top_left+3
	lda p4_top_right
	sec
	sbc #$03
	sta p4_top_right
	lda p4_top_right+3
	clc
	adc #$03
	sta p4_top_right+3
	lda p4_mid_left+3
	sec
	sbc #$03
	sta p4_mid_left+3
	lda p4_mid_right+3
	clc
	adc #$03
	sta p4_mid_right+3
	lda p4_bot_left
	clc
	adc #$03
	sta p4_bot_left
	lda p4_bot_left+3
	sec
	sbc #$03
	sta p4_bot_left+3
	lda p4_bot_right
	clc
	adc #$03
	sta p4_bot_right
	lda p4_bot_right+3
	clc
	adc #$03
	sta p4_bot_right+3
	lda #$ff
	sta p4_attack
	rts
