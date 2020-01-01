ca65 kill.asm
ld65 -C kill.cfg -o kill.prg kill.o
copy /b kill.hdr+kill.prg+g\kill.chr+g\kill.spr "KYFF.nes"
pause
