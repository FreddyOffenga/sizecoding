; Plot pixel GTIA mode
; F#READY 2021


ROWCRS		= $54		; byte
y_position	= ROWCRS	; alias

COLCRS		= $55		; word
x_position	= COLCRS	; alias

open_mode	= $ef9c		; A=mode
plot_pixel	= $f1d8

ATACHR		= $2fb		; drawing color
draw_color	= ATACHR	; alias

			org $2000

			lda #9
			jsr open_mode

			dec 559

			ldx #0
plot_all
			txa
			pha			
			sta x_position

			bit $c01b		; $10
			beq no_flip
			eor #$0f
no_flip
			and #15			
			sta draw_color

			lda #0
			sta y_position

			jsr plot_pixel

			pla
			tax
			inx
			bne plot_all
						
loop		jmp loop
