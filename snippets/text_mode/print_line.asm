; Print line
; F#READY, 2021


open_mode	= $ef9c		; A=mode
clear_scr	= $f420		; zero screen memory
print_line	= $c642		; x=adr.lo, y=adr.hi, end line with $9b

			org $2000

            ldx #<hello
            ldy #>hello	
            jsr print_line

loop        jmp loop
			
hello       dta 'Hello, World!',$9b
