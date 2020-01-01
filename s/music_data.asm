; This relies on the ability of the assembler to read labels and put data bytes
; and all that other good stuff. No actual assembly is used here, just data.

;;;;;;;;;;;;;;;;;
;;  envelopes  ;;
;;;;;;;;;;;;;;;;;
;; 10 - Jump to position XX
;; FF - Stop envelope

; Each byte is just simply written to register 0 of whatever channel is using the
; envelope, after one of the useless bits being masked out so commands (yep, all
; two of them) could exist. Triangle channel completely ignores envelopes.
; It's *highly* recommended that the first envelope is a silent one.

envelopes:
 .addr	env_blank, env_lead1, env_nse_hat, env_nse_hat2, env_nse_snare, env_lead2
 .addr sq4sound, sq4sound_cont
env_blank:
 .byte	$00,$FF
env_lead1:
 .byte	$0F,$0D,$0B,$09,$07,$05,$04,$04,$04,$04,$05,$05,$06,$06,$06,$06,$05,$05,$10,$06
env_nse_hat:
 .byte	$0F,$0C,$00,$FF
env_nse_hat2:
 .byte	$0F,$0B,$07,$03,$FF
env_nse_snare:
 .byte	$0F,$08,$0C,$06,$04,$03,$02,$02,$01,$01,$00,$FF
env_lead2:
 .byte	$8C,$8E,$8F,$8E,$8C,$8A,$89,$88,$87,$86,$85,$84,$FF
sq4sound:
	.byte $41,$4a,$4d,$4d,$4d,$4a,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$ff
sq4sound_cont:
	.byte $41,$4a,$4d,$4d,$4d,$4a,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43
	.byte $46,$46,$46,$46,$46,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$10,$00
;;;;;;;;;;;;;;;;;;
;;  song table  ;;
;;;;;;;;;;;;;;;;;;
; This determines what song is assigned to what value when loading songs
songs:
	.addr silence, gp_song, win_song, story_song, controls_song, credits_song
	.addr title_song, all_song;, gameplay_tune, intros


;;;;;;;;;;;;;
;;  songs  ;;
;;;;;;;;;;;;;
;; C8 XX - silent rest for XX cycles
;; C0 XX - do nothing (just extend the note for another XX cycles)
;; C1 XX - precut (cut the note XX cycles before it ends)
;; C2 XX - set envelope to XX
;; C3 YY XX ZZ - jump to YYXX, ZZ times
;; C4 YY XX - jump to YYXX
;; C5 XX - set detune to XX (01-7F up, 80-FF down, 00 none)
;; C6 XX - decrease envelope volume by XX
;; C7 XX - set pitch bend to XX (01-7F down, 80-FE up, 00 none)
;; C9 XX - set tempo-independent pitch bend (functions the same as C7)
;; FF - Track end (the track stops playing here)

; The first 4 words in the list are the pointer for square 1, square 2, tri, noise
; in that order, followed by a byte that defines the tempo. Lower values are
; slower, higher are faster, 00 is infinitely slow, making the song stop.
; If you don't use a particular channel for a song, just put $0000 as the pointer.
; All four channels can be used at once. It's *highly* recommended that you reserve
; one song in your playlist to be a silent song.

silence:
	.word $0000, $0000, $0000, $0000
	.byte $00
gp_song:
	.addr gp_song_sq1, gp_song_sq2, gp_song_tri, gp_song_nse
	.byte $f0
win_song:
	.addr win_song_sq1, win_song_sq2, win_song_tri, win_song_nse
	.byte $f0
story_song:
	.addr story_song_sq1, story_song_sq2, story_song_tri, story_song_nse
	.byte $80
controls_song:
	.addr controls_song_sq1, controls_song_sq2, controls_song_tri, controls_song_nse
	.byte $c0
credits_song:
	.addr credits_song_sq1, credits_song_sq2, credits_song_tri, credits_song_nse
	.byte $f0
title_song:
	.addr title_song_sq1, title_song_sq2, title_song_tri, title_song_nse
	.byte $f0
all_song:
	.addr all_song_sq1, all_song_sq2, all_song_tri, all_song_nse
	.byte $c0
;gameplay_tune:
;	.addr gameplay_sq1, gameplay_sq2, gameplay_tri, gameplay_nse
;	.byte $b0
;intros:
;	.addr intros_sq1, intros_sq2, intros_tri, intros_nse
;	.byte $70

; Song data is just <note> <duration> for each note, or <command> <data>... for
; commands (see table above). For <note>, the higher nybble is the actual note
; (the scale begins with A, so 0x is A, 1x is A#, 2x is B, etc), and the lower
; nybble is the octave. The tracks are state machines, so whatever commands you
; apply (like envelope, detune, pitch bend, etc) will stick until you change them,
; or until a new song is loaded.

gp_song_sq1:
	.byte $c8,$80
gp_song_sq1_1:
	.byte $c2,$06
	.byte $20,$10, $20,$10, $20,$08, $40,$08, $c8,$08
	.byte $20,$10, $20,$10, $20,$08, $40,$08, $50,$08, $70,$08, $90,$08
	.byte $c3,<gp_song_sq1_1,>gp_song_sq1_1,$04
	.byte $c8,$80
gp_song_sq1_2:
	.byte $c2,$06
	.byte $20,$08,$20,$08,$20,$08,$c8,$08,$50,$08,$c8,$08,$20,$08,$c8,$18
	.byte $20,$08,$c8,$08,$50,$08,$40,$08,$30,$08,$c8,$08
	.byte $c3,<gp_song_sq1_2,>gp_song_sq1_2,$03
gp_song_sq1_3:
;	.byte $c2,$01
	.byte $22,$18,$52,$18,$92,$10,$23,$18,$92,$18,$52,$10
	.byte $22,$18,$52,$18,$92,$10,$52,$10,$c8,$10,$c2,$05,$50,$08,$40,$08,$30,$08,$c8,$08
	.byte $c2,$06
	.byte $22,$18,$52,$18,$92,$10,$23,$18,$92,$18,$92,$10
	.byte $52,$18,$92,$18,$52,$10,$22,$10,$c8,$10,$50,$08,$40,$08,$30,$08,$c8,$08
	.byte $c3,<gp_song_sq1_3,>gp_song_sq1_3,$01
gp_song_sq1_4:
	.byte $c2,$05
	.byte $20,$08,$20,$08,$20,$08,$c8,$08,$50,$08,$c8,$08,$20,$08,$c8,$18
	.byte $20,$08,$c8,$08,$50,$08,$40,$08,$30,$08,$c8,$08
	.byte $c3,<gp_song_sq1_4,>gp_song_sq1_4,$03
gp_song_sq1_5:
	.byte $50,$08,$50,$08,$50,$08,$50,$08,$50,$10,$90,$10,$b0,$18,$90,$18
	.byte $50,$10
	.byte $c3,<gp_song_sq1_5,>gp_song_sq1_5,$03
	.byte $c4,<gp_song_sq1,>gp_song_sq1
	.byte $ff

gp_song_sq2:
	.byte $c8,$80,$c8,$80
gp_song_sq2_1:
	.byte $c2,$01
	.byte $60,$10, $60,$10, $60,$08, $80,$08, $c8,$08
	.byte $60,$10, $60,$10, $60,$08, $80,$08, $90,$08, $b0,$08, $11,$08
	.byte $c3,<gp_song_sq2_1,>gp_song_sq2_1,$03
	.byte $c8,$80
gp_song_sq2_2:
	.byte $c2,$06
	.byte $90,$08,$90,$08,$90,$08,$c8,$08,$01,$08,$c8,$08,$90,$08,$c8,$18
	.byte $90,$08,$c8,$08,$01,$08,$b0,$08,$a0,$08,$c8,$08
	.byte $c3,<gp_song_sq2_2,>gp_song_sq2_2,$0f
gp_song_sq2_3:
	.byte $90,$08,$90,$08,$90,$08,$90,$08,$90,$10,$01,$10,$31,$18,$01,$18
	.byte $90,$10
	.byte $c3,<gp_song_sq2_3,>gp_song_sq2_3,$03
	.byte $c4,<gp_song_sq2,>gp_song_sq2
	.byte $ff

gp_song_tri:
	.byte $c8,$80,$c0,$80
gp_song_tri1:
	.byte $c1,$01
	.byte $22,$08,$22,$08,$22,$08,$22,$08, $22,$08, $43,$08,$42,$08
	.byte $22,$08,$22,$08,$22,$08,$22,$08, $22,$08, $42,$08,$52,$08,$72,$08,$92,$08
	.byte $c3,<gp_song_tri1,>gp_song_tri1,$04
gp_song_tri2:
	.byte $c1,$00
	.byte $22,$20,$52,$10,$22,$30,$52,$08,$42,$08,$32,$10
	.byte $c3,<gp_song_tri2,>gp_song_tri2,$0f
gp_song_tri3:
	.byte $52,$08,$52,$08,$52,$08,$52,$08,$52,$10,$92,$10,$b2,$18,$92,$18
	.byte $52,$10
	.byte $c3,<gp_song_tri3,>gp_song_tri3,$03
	.byte $c4,<gp_song_tri,>gp_song_tri
	.byte $ff

gp_song_nse:
	.byte $c2,$04
	.byte $0d,$08, $00,$08, $0d,$08, $00,$08, $0e,$08, $00,$08, $00,$08
	.byte $0d,$08, $00,$08, $0d,$08, $00,$08, $00,$08, $0e,$08, $00,$08, $00,$08, $00,$08
	.byte $c3,<gp_song_nse,>gp_song_nse,$05
	.byte $c8,$80
gp_song_nse1:
	.byte $0e,$08,$0e,$08,$0e,$08,$00,$08, $0d,$08,$00,$08,$0e,$08,$00,$08
	.byte $00,$08,$00,$08,$0e,$08,$00,$08, $0d,$08,$00,$08,$00,$08,$00,$08
	.byte $c3,<gp_song_nse1,>gp_song_nse1,$0f
gp_song_nse2:
	.byte $0e,$08,$0e,$08,$0e,$08,$0e,$08,$0d,$08,$0e,$08,$0e,$08,$0e,$08
	.byte $0e,$08,$0e,$08,$0e,$08,$0e,$08,$0d,$08,$0e,$08,$0e,$08,$0e,$08
	.byte $c3,<gp_song_nse2,>gp_song_nse2,$03
	.byte $c4,<gp_song_nse,>gp_song_nse
	.byte $ff


win_song_sq1:
	.byte $c8,$30
	.byte $c2,$06
	.byte $02,$10, $72,$10, $22,$10, $92,$20, $52,$10, $03,$30
	.byte $ff
win_song_sq2:
	.byte $c8,$30
	.byte $c2,$06
	.byte $42,$10, $b2,$10, $62,$10, $13,$20, $92,$10, $43,$30
	.byte $ff
win_song_tri:
	.byte $c8,$30
	.byte $02,$10, $72,$10, $22,$10, $92,$20, $52,$10, $03,$30
	.byte $ff
win_song_nse:
	.byte $c8,$30
	.byte $c2,$04
	.byte $0e,$10, $0d,$10, $0e,$10, $0d,$20, $0e,$10, $0d,$38, $00,$10,$00,$10,$00,$10
	.byte $ff



story_song_sq1:
	.byte $c2,$06
	.byte $51,$08, $c8,$08, $81,$08, $51,$08, $c8,$08, $81,$08, $71,$08, $51,$08
	.byte $81,$08, $71,$08, $51,$08, $10,$08, $10,$08, $10,$08, $00,$10
	.byte $c4,<story_song_sq1,>story_song_sq1
story_song_sq2:
	.byte $c2,$07
	.byte $53,$80, $23,$80, $83,$80, $23,$80
	.byte $c4,<story_song_sq2,>story_song_sq2
story_song_tri:
	.byte $51,$80, $21,$80, $81,$80, $91,$80
	.byte $c4,<story_song_tri,>story_song_tri
story_song_nse:
	.byte $c2,$02, $00,$10, $c2,$05,$00,$10
	.byte $c4,<story_song_nse,>story_song_nse



controls_song_sq1:
	.byte $c2,$06
;	.byte $c8,$80
	.byte $50,$04,$50,$04,$50,$04,$50,$04,$50,$04,$50,$04
	.byte $72,$01,$72,$01,$72,$01,$72,$01,$72,$01,$72,$01,$72,$01,$72,$01
	.byte $50,$04,$50,$04,$50,$04,$50,$04, $60,$04,$60,$04,$60,$04,$60,$04,$60,$04,$60,$04
	.byte $82,$01,$82,$01,$82,$01,$82,$01,$82,$01,$82,$01,$82,$01,$82,$01
	.byte $60,$04,$60,$04,$60,$04,$60,$04, $70,$04,$70,$04,$70,$04,$70,$04,$70,$04,$70,$04
	.byte $92,$01,$92,$01,$92,$01,$92,$01,$92,$01,$92,$01,$92,$01,$92,$01
	.byte $c4,<controls_song_sq1,>controls_song_sq1
controls_song_sq2:
	.byte $c2,$06
	.byte $52,$18, $73,$08, $52,$10, $62,$18, $83,$08, $62,$10
	.byte $72,$18, $93,$08
	.byte $c4,<controls_song_sq2,>controls_song_sq2
controls_song_tri:
	.byte $52,$10, $53,$08, $73,$08, $52,$10, $62,$10, $63,$08, $83,$08, $62,$10
	.byte $72,$10, $73,$08, $93,$08
	.byte $c4,<controls_song_tri,>controls_song_tri
controls_song_nse:
	.byte $c2,$05
	.byte $00,$10,$0e,$08,$0e,$08,$00,$10, $00,$10,$0e,$08,$0e,$08,$00,$10
	.byte $00,$10,$0e,$08,$0e,$08
	.byte $c4,<controls_song_nse,>controls_song_nse



credits_song_sq1:
	.byte $c2,$06
	.byte $30,$08,$20,$08,$30,$08,$c8,$18
	.byte $50,$08,$40,$08,$50,$08,$c8,$18
	.byte $60,$08,$50,$08,$50,$08,$40,$08
	.byte $c4,<credits_song_sq1,>credits_song_sq1
credits_song_sq2:
	.byte $c2,$06
	.byte $31,$08,$21,$08,$31,$08,$c8,$18
	.byte $51,$08,$41,$08,$51,$08,$c8,$18
	.byte $61,$08,$51,$08,$51,$08,$41,$08
	.byte $c4,<credits_song_sq2,>credits_song_sq2
credits_song_tri:
	.byte $c8,$80,$c8,$80
credits_song_tri1:
	.byte $c1,$07
	.byte $34,$08
	.byte $c3,<credits_song_tri1,>credits_song_tri1,$1f
	.byte $c4,<credits_song_tri,>credits_song_tri
credits_song_nse:
	.byte $c8,$80
credits_song_nse1:
	.byte $c2,$04
	.byte $0e,$08, $00,$08, $00,$08, $00,$08, $0d,$08, $00,$08, $00,$08, $00,$08
	.byte $c4,<credits_song_nse1,>credits_song_nse1


; cheat sheet:
; A=0 #=1 B=2 C=3 #=4 D=5 #=6 E=7 F=8 #=9 G=a #=b
title_song_sq1:
	.byte $c2,$06
	.byte $50,$08,$00,$08,$40,$08,$00,$08,$20,$08,$00,$08,$40,$08,$00,$08
	.byte $60,$08,$50,$08,$40,$08,$20,$08,$50,$08,$40,$08,$20,$08,$00,$08
	.byte $50,$08,$00,$08,$40,$08,$00,$08,$20,$08,$00,$08,$40,$08,$00,$08
	.byte $60,$08,$50,$08,$40,$08,$20,$08,$20,$08,$40,$08,$00,$10
;	.byte $20,$10,$90,$08,$70,$08, $90,$10,$50,$08,$40,$08, $50,$10
	.byte $c4,<title_song_sq1,>title_song_sq1
	.byte $ff
title_song_sq2:
	.byte $c2,$06
	.byte $21,$40, $51,$40, $41,$40
	.byte $61,$08,$51,$08,$41,$08,$21,$08,$21,$08,$41,$08,$01,$10
	.byte $51,$40, $41,$40, $21,$40
	.byte $a1,$08,$91,$08,$81,$08,$61,$08,$61,$08,$81,$08,$41,$08,$40,$08
	.byte $c4,<title_song_sq2,>title_song_sq2
;	.byte $20,$04,$20,$04,$20,$04,$20,$04, $90,$04,$90,$04,$70,$04,$70,$04
;	.byte $90,$04,$90,$04,$90,$04,$90,$04, $50,$04,$50,$04,$40,$04,$40,$04
;	.byte $50,$04,$50,$04,$50,$04,$50,$04
;	.byte $ff
title_song_tri:
	.byte $c1,$04
	.byte $21,$10,$22,$10,$21,$10,$22,$10
	.byte $c4,<title_song_tri,>title_song_tri
	.byte $ff
title_song_nse:
	.byte $c2,$04
	.byte $0e,$08,$00,$08,$00,$08,$00,$08, $0d,$08,$00,$08,$00,$08,$00,$08
	.byte $c4,<title_song_nse,>title_song_nse
;	.byte $0e,$08,$00,$08,$00,$08,$00,$08, $0d,$08,$00,$08,$00,$08,$00,$08
	.byte $ff


all_song_sq1:
	.byte $c8,$30
	.byte $c2,$06
	.byte $50,$10, $30,$10, $00,$20
	.byte $ff
all_song_sq2:
	.byte $c8,$30
	.byte $c2,$06
	.byte $80,$10, $60,$10, $30,$20
	.byte $ff
all_song_tri:
	.byte $c8,$30
	.byte $52,$10, $32,$10, $02,$20
	.byte $ff
all_song_nse:
	.byte $c8,$30
	.byte $c2,$04
	.byte $00,$10,$00,$10,$00,$10
	.byte $ff


;gameplay_sq1:
;	.byte $c8,$f8,$c0,$08
;gameplay_sq1_1:
;	.byte $c2,$06
;	.byte $80,$08,$a0,$10, $c8,$08, $70,$08,$c8,$10, $a0,$10,$01,$10, $c8,$20
;	.byte $80,$10,$a0,$10, $c8,$10, $a0,$08,$a0,$08, $10,$20,$00,$08, $a0,$20
;	.byte $c3,<gameplay_sq1_1,>gameplay_sq1_1,$03
;	.byte $00,$38,$70,$08, $10,$38,$80,$08, $20,$38,$90,$08, $30,$38,$a0,$08
;gameplay_sq1_2:
;	.byte $51,$08,$51,$08,$51,$08,$51,$08,$51,$08,$51,$08,$51,$08,$51,$08
;	.byte $51,$08,$51,$08,$51,$08,$51,$08,$51,$08,$51,$08,$51,$08,$a1,$08
;	.byte $c3,<gameplay_sq1_2,>gameplay_sq1_2,$03
;	.byte $ff
;
;gameplay_sq2:
;	.byte $c8,$f8,$c0,$08
;gameplay_sq2_1:
;	.byte $c2,$06
;	.byte $31,$08,$51,$10, $c8,$08, $21,$08,$c8,$10, $51,$10,$71,$10, $c8,$20
;	.byte $31,$10,$51,$10, $c8,$10, $51,$08,$51,$08, $81,$20,$71,$08, $51,$20
;	.byte $c3,<gameplay_sq2_1,>gameplay_sq2_1,$01
;gameplay_sq2_2:
;	.byte $c2,$06
;	.byte $31,$08,$51,$10, $c8,$08, $21,$08,$c8,$10, $51,$10,$71,$10, $c8,$10,$50,$08,$50,$08
;	.byte $31,$10,$51,$08, $50,$08,$50,$08,$70,$08, $51,$08,$51,$08, $81,$20,$71,$08, $51,$20
;	.byte $c3,<gameplay_sq2_2,>gameplay_sq2_2,$01
;	.byte $ff
;
;gameplay_tri:
;	.byte $c1,$01
;	.byte $82,$08,$a2,$08, $c1,$07,$a2,$08,$a2,$08, $c1,$04,$73,$08, $c1,$07,$a2,$08,$a2,$08
;	.byte $c1,$01,$a2,$10,$03,$08, $c1,$07,$03,$08,$03,$08, $c1,$04,$54,$08, $c1,$01,$53,$08,$53,$08
;	.byte $82,$10,$a2,$08, $c1,$07,$a2,$08,$a2,$08, $c1,$04,$73,$08, $c1,$07,$a2,$08,$a2,$08
;	.byte $c1,$00,$13,$10, $14,$08, $13,$08,$03,$08, $73,$08, $a2,$08, $82,$08, $72,$08
;	.byte $c3,<gameplay_tri,>gameplay_tri,$04
;gameplay_tri1:
;	.byte $c1,$01,$02,$08, $c1,$07,$02,$08,$02,$08, $c1,$01,$02,$08, $c1,$04,$03,$08, $c1,$01,$02,$08, $c1,$07,$02,$08,$02,$08
;	.byte $c1,$01,$12,$08, $c1,$07,$12,$08,$12,$08, $c1,$01,$12,$08, $c1,$04,$13,$08, $c1,$01,$12,$08, $c1,$07,$12,$08,$12,$08
;	.byte $c1,$01,$22,$08, $c1,$07,$22,$08,$22,$08, $c1,$01,$22,$08, $c1,$04,$23,$08, $c1,$01,$22,$08, $c1,$07,$22,$08,$22,$08
;	.byte $c1,$01,$32,$08, $c1,$07,$32,$08,$32,$08, $c1,$01,$32,$08, $c1,$04,$33,$08, $c1,$01,$32,$08, $c1,$07,$32,$08,$32,$08
;gameplay_tri2:
;	.byte $c1,$04,$52,$08,$52,$08,$c8,$08,$03,$08,$52,$08,$52,$08,$c8,$08,$a2,$08
;	.byte $c3,<gameplay_tri2,>gameplay_tri2,$07
;	.byte $ff
;
;gameplay_nse:
;	.byte $c8,$c8
;	.byte $c2,$04,$0b,$08, $0c,$08, $0d,$08, $00,$08, $0e,$08, $0d,$08, $0d,$08
;gameplay_nse1:
;	.byte $c2,$04
;	.byte $0e,$08,$0e,$08, $00,$08,$00,$08, $0d,$08, $00,$08,$00,$08, $c2,$05,$00,$10
;	.byte $c2,$04,$0e,$08, $00,$08,$00,$08,  $0d,$08, $00,$08,$00,$08
;	.byte $c2,$04,$0e,$08,$00,$08, $c2,$04,$0e,$08, $00,$08,$00,$08, $0d,$08, $00,$08,$00,$08
;	.byte $c2,$05,$00,$10, $c2,$04,$0b,$08, $0c,$08, $0d,$08, $00,$08, $0e,$08, $0d,$08, $0d,$08
;	.byte $c3,<gameplay_nse1,>gameplay_nse1,$03
;gameplay_nse2:
;	.byte $c2,$04, $0e,$08,$00,$08,$00,$08,$0e,$08,$0d,$08,$0e,$08,$00,$08,$00,$08
;	.byte $c3,<gameplay_nse2,>gameplay_nse2,$02
;	.byte $0e,$08,$00,$08,$00,$08,$0e,$08,$0b,$08,$0b,$08,$0c,$08,$0d,$08
;gameplay_nse3:
;	.byte $c2,$04, $0e,$08,$0e,$08,$c8,$08,$0d,$08
;	.byte $c3,<gameplay_nse3,>gameplay_nse3,$0e
;	.byte $ff

;intros_sq1:
;	 .byte $c2,$01
;	 .byte $70,$08, $70,$08, $c8,$30
;	 .byte $c4,<intros_sq1,>intros_sq1
;intros_sq2:
;	 .byte $c2,$01
;	 .byte $20,$08, $20,$08, $c8,$30
;	 .byte $c4,<intros_sq2,>intros_sq2
;intros_tri:
;	.byte $c8,$80
;intros_tri1:
;	.byte $71,$0e, $51,$02, $71,$08, $01,$10, $70,$08, $01,$08, $21,$08
;	.byte $71,$0e, $51,$02, $71,$08, $01,$10, $c8,$18
;	.byte $c4,<intros_tri1,>intros_tri1
;intros_nse:
;	.byte $c2,$04,$0e,$08, $0e,$08, $0d,$18, $0e,$08, $0d,$10
;	.byte $c4,<intros_nse,>intros_nse



; Sound effects - Absolutely everything that applies for the music and songs
; applies here too, except sound effects have their own playlist and their
; own envelope table. Also, all sound effects play at tempo $100, which is
; impossible for music, since music tempo only goes up to $FF. When a sound
; effect is playing, it'll interrupt the corresponding channels of the music,
; and then when the sound effect is finished, the music channels it hogged will
; be audible again.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sound effect envelopes  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sfxenvelopes:
 .addr	sfxenv1,hit_env
sfxenv1:
 .byte	$8F,$8D,$88,$8F,$8E,$8D,$8C,$8B,$8A,$89,$88,$87,$86,$85,$84,$83,$82,$81,$80,$FF
hit_env:
	.byte $0f,$0e,$0f,$0e,$0f,$0e,$0f,$ff
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sound effect table  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
sounds:
	.addr sfx_silence, pause_jingle, hit, blowup
;;;;;;;;;;;;;;;;;;;;;
;;  sound effects  ;;
;;;;;;;;;;;;;;;;;;;;;
sfx_silence:
 .word	$0000, $0000, $0000, $0000

pause_jingle:
	.addr pause_sq1, $0000, $0000, $0000
pause_sq1:
	.byte $33,$08, $03,$08, $33,$08, $63,$08, $ff

hit:
	.addr $0000
	.addr hit_sq2
	.addr $0000
	.addr hit_nse
hit_sq2:
	.byte $c2,$01, $02,$02, $01,$02, $00,$02, $ff
hit_nse:
	.byte $0d,$02,$8e,$02,$02,$01,$ff

blowup:
	.addr blowup_sq1,blowup_sq2,blowup_tri,blowup_nse
blowup_sq1:
;	.byte $c2,$01
	.byte $00,$10,$01,$04,$00,$04,$01,$04,$00,$04,$00,$08,$ff
blowup_sq2:
;	.byte $c2,$01
	.byte $31,$04,$30,$04,$31,$04,$30,$04,$30,$08,$ff
blowup_tri:
	.byte $03,$08,$02,$08,$01,$08,$ff
blowup_nse:
	.byte $0d,$02,$0e,$02,$0d,$02,$0e,$02,$0d,$02,$0e,$02,$0d,$02,$0e,$02,$0d,$02,$0e,$02,$0d,$02,$0e,$02,$ff

