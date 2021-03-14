; Put char
; F#READY, 2021

put_char	= $f2b0		; output character to screen

			org $2000

			lda #'a'
			jsr put_char

loop		jmp loop
