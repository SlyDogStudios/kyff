;players_walking:
;	lda p1_movement
;	bne :+
;		lda p1_direction
;:	lda p1_anim_count









player_movement:
		lda p4_movement
		beq @player_3
			cmp #$01
			bne :+
				lda p4_ypos
				sec
				sbc #$01
				sta p4_ypos
:			lda p4_movement
			cmp #$02
			bne :+
				lda p4_ypos
				clc
				adc #$01
				sta p4_ypos
:			lda p4_movement
			cmp #$03
			bne :+
				lda p4_xpos
				sec
				sbc #$01
				sta p4_xpos
:			lda p4_movement
			cmp #$04
			bne @player_3
			lda p4_xpos
			clc
			adc #$01
			sta p4_xpos
@player_3:
		lda p3_movement
		beq @player_2
			cmp #$01
			bne :+
				lda p3_ypos
				sec
				sbc #$01
				sta p3_ypos
:			lda p3_movement
			cmp #$02
			bne :+
				lda p3_ypos
				clc
				adc #$01
				sta p3_ypos
:			lda p3_movement
			cmp #$03
			bne :+
				lda p3_xpos
				sec
				sbc #$01
				sta p3_xpos
:			lda p3_movement
			cmp #$04
			bne @player_2
			lda p3_xpos
			clc
			adc #$01
			sta p3_xpos
@player_2:
		lda p2_movement
		beq @player_1
			cmp #$01
			bne :+
				lda p2_ypos
				sec
				sbc #$01
				sta p2_ypos
:			lda p2_movement
			cmp #$02
			bne :+
				lda p2_ypos
				clc
				adc #$01
				sta p2_ypos
:			lda p2_movement
			cmp #$03
			bne :+
				lda p2_xpos
				sec
				sbc #$01
				sta p2_xpos
:			lda p2_movement
			cmp #$04
			bne @player_1
			lda p2_xpos
			clc
			adc #$01
			sta p2_xpos
@player_1:
		lda p1_movement
		beq @done
			cmp #$01
			bne :+
				lda p1_ypos
				sec
				sbc #$01
				sta p1_ypos
:			lda p1_movement
			cmp #$02
			bne :+
				lda p1_ypos
				clc
				adc #$01
				sta p1_ypos
:			lda p1_movement
			cmp #$03
			bne :+
				lda p1_xpos
				sec
				sbc #$01
				sta p1_xpos
:			lda p1_movement
			cmp #$04
			bne @done
			lda p1_xpos
			clc
			adc #$01
			sta p1_xpos
@done:
		rts