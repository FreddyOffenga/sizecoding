; Text ANTIC 3 (10 scanlines mode 0)
; F#READY, 2021

; custom display list
; needs custom font to make this work

open_mode	= $ef9c		; A=mode

screen_mem	= $4000

			org $2000

			lda #<display_list
			sta $230
			lda #>display_list
			sta $231
			
; write some garbage

			ldy #0
fill		tya
			sta screen_mem,y
			iny
			bne fill

loop		jmp loop

; 20 x ANTIC 3 (200 scanlines)
display_list
			dta $70,$70,$70			; 24 blank lines
			dta $43, a(screen_mem)	; ANTIC 3 DMA
			dta 3,3,3,3,3,3,3
			dta 3,3,3,3,3,3,3,3
			dta 3,3,3,3				
			dta $41, a(display_list)
