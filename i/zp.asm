; x00

reg2001save:		.res 1
nmi_num:	 		.res 1
sprite_cycling:		.res 1
nmi_addy:			.res 2
loop_addy:			.res 2
control_pad1:		.res 1
control_pad2:		.res 1
control_pad3:		.res 1
control_pad4:		.res 1
control_old1:		.res 1
control_old2:		.res 1
control_old3:		.res 1
control_old4:		.res 1

player_offset:		.res 1
temp_addy:			.res 2

p1_anim_addy:		.res 2
p2_anim_addy:		.res 2
; x11
p3_anim_addy:		.res 2
p4_anim_addy:		.res 2

p1_direction:		.res 1
p2_direction:		.res 1
p3_direction:		.res 1
p4_direction:		.res 1
p1_anim:			.res 1
p2_anim:			.res 1
p3_anim:			.res 1
p4_anim:			.res 1
p1_anim_count:		.res 1
p2_anim_count:		.res 1
p3_anim_count:		.res 1
; x20
p4_anim_count:		.res 1
p1_energy:			.res 1
p2_energy:			.res 1
p3_energy:			.res 1
p4_energy:			.res 1

p1_xpos:			.res 1
p2_xpos:			.res 1
p3_xpos:			.res 1
p4_xpos:			.res 1
p1_ypos:			.res 1
p2_ypos:			.res 1
p3_ypos:			.res 1
p4_ypos:			.res 1
p1_zpos:			.res 1
p2_zpos:			.res 1
p3_zpos:			.res 1
; x30
p4_zpos:			.res 1
p1_zpos_t:			.res 1
p2_zpos_t:			.res 1
p3_zpos_t:			.res 1
p4_zpos_t:			.res 1
p1_zpos_b:			.res 1
p2_zpos_b:			.res 1
p3_zpos_b:			.res 1
p4_zpos_b:			.res 1

p1_left:			.res 1
p1_right:			.res 1
p1_top:				.res 1
p1_bottom:			.res 1


p2_left:			.res 1
p2_right:			.res 1
p2_top:				.res 1
p2_bottom:			.res 1

p3_left:			.res 1
p3_right:			.res 1
p3_top:				.res 1
p3_bottom:			.res 1

p4_left:			.res 1
p4_right:			.res 1
p4_top:				.res 1
p4_bottom:			.res 1

p1_top_attack:		.res 1
p2_top_attack:		.res 1
p3_top_attack:		.res 1
p4_top_attack:		.res 1
p1_bot_attack:		.res 1
p2_bot_attack:		.res 1
p3_bot_attack:		.res 1
p4_bot_attack:		.res 1
p1_left_attack:		.res 1
p2_left_attack:		.res 1
p3_left_attack:		.res 1
p4_left_attack:		.res 1
p1_right_attack:	.res 1
p2_right_attack:	.res 1
p3_right_attack:	.res 1
p4_right_attack:	.res 1



p1_jumping:			.res 1
p2_jumping:			.res 1
p3_jumping:			.res 1
p4_jumping:			.res 1

p1_attack_y:		.res 1
p2_attack_y:		.res 1
p3_attack_y:		.res 1
p4_attack_y:		.res 1

p1_attack_x:		.res 1
p2_attack_x:		.res 1
p3_attack_x:		.res 1
p4_attack_x:		.res 1

p1_attack_num:		.res 1
p2_attack_num:		.res 1
p3_attack_num:		.res 1
p4_attack_num:		.res 1

p1_onom:			.res 1
p2_onom:			.res 1
p3_onom:			.res 1
p4_onom:			.res 1

onom_num:			.res 1

code_offset:		.res 4
code_count:			.res 4
code_offset2:		.res 4
code_count2:		.res 4
code_offset3:		.res 4
code_count3:		.res 4
code_offset4:		.res 4
code_count4:		.res 4

p1_attack_str1_p2:	.res 1
p2_attack_str1_p1:	.res 1
p3_attack_str1_p1:	.res 1
p4_attack_str1_p1:	.res 1
p1_attack_str2_p3:	.res 1
p2_attack_str2_p3:	.res 1
p3_attack_str2_p2:	.res 1
p4_attack_str2_p2:	.res 1
p1_attack_str3_p4:	.res 1
p2_attack_str3_p4:	.res 1
p3_attack_str3_p4:	.res 1
p4_attack_str3_p3:	.res 1

p1_life_offset:		.res 1
p2_life_offset:		.res 1
p3_life_offset:		.res 1
p4_life_offset:		.res 1

p1_life1:			.res 1
p1_life2:			.res 1
p1_life3:			.res 1
p1_life4:			.res 1
p1_life5:			.res 1
p1_life6:			.res 1
p2_life1:			.res 1
p2_life2:			.res 1
p2_life3:			.res 1
p2_life4:			.res 1
p2_life5:			.res 1
p2_life6:			.res 1
p3_life1:			.res 1
p3_life2:			.res 1
p3_life3:			.res 1
p3_life4:			.res 1
p3_life5:			.res 1
p3_life6:			.res 1
p4_life1:			.res 1
p4_life2:			.res 1
p4_life3:			.res 1
p4_life4:			.res 1
p4_life5:			.res 1
p4_life6:			.res 1

onom_random:		.res 1
onom_table_random:	.res 1
onom_shake_offset:	.res 1
players_dead:		.res 1
winner_addy:		.res 2
anim_ticker:		.res 1
anim_offset:		.res 1
