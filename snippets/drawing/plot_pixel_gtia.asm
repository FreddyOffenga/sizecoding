; Plot pixel GTIA mode
; F#READY, 2021


ROWCRS		= $54		; byte
COLCRS		= $55		; word

open_mode	= $ef9c		; A=mode
plot_pixel	= $f1d8

ATACHR		= $2fb		; drawing color

			org $2000

			lda #9
			jsr open_mode

            ldx #0
            stx $54     ; ROWCRS (y position)
more        stx $55     ; COLCRS (x position)
            stx $2fb    ; ATACHR color
            jsr $f1d8   ; plot pixel

            ldx COLCRS
            inx
            cpx #80
            bne more
                        						
loop		jmp loop
