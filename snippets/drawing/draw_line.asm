; Draw line
; F#READY, 2021

ROWCRS		= $54		; byte
y_position	= ROWCRS	; alias

COLCRS		= $55		; word
x_position	= COLCRS	; alias

OLDROW  	= $5a		; byte
y_start		= OLDROW	; alias

OLDCOL  	= $5b		; word
x_start		= OLDCOL	; alias

open_mode	= $ef9c		; A=mode
clear_scr	= $f420		; zero screen memory
draw_to		= $f9c2		; $f9bf (stx FILFLG)
plot_pixel	= $f1d8

FILFLG		= $2b7
FILDAT		= $2fd

ATACHR		= $2fb		; drawing color
draw_color	= ATACHR	; alias

			org $2000
			
            lda #7
            jsr open_mode
			
;			lda #1
            inc draw_color

            lda #0
            sta x_start
            lda #0
            sta y_start

            lda #159
            sta x_position
            lda #95
            sta y_position
            jsr draw_to
			
loop		jmp loop
