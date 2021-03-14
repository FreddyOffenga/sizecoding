; Plot pixel
; F#READY, 2021 

; Plots a single pixel at (x_position, y_position)
; can be used in both graphics and text modes

ROWCRS		= $54		; byte
y_position	= ROWCRS	; alias

COLCRS		= $55		; word
x_position	= COLCRS	; alias

open_mode	= $ef9c		; A=mode
plot_pixel	= $f1d8

ATACHR		= $2fb		; drawing color
draw_color	= ATACHR	; alias

			org $2000

			lda #5		; mode 0
			jsr open_mode

			lda #2
            sta draw_color

            lda #5
            sta x_position
            lda #4
            sta y_position
            jsr plot_pixel
			
loop		jmp loop
