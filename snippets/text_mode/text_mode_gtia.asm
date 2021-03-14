; Text mode GTIA
; F#READY, 2021

; characters 0..15 set to GTIA luminances in font

open_mode	= $ef9c		; A=mode

SAVMSC		= $58		; word
screen_mem	= SAVMSC	; alias

GPRIOR		= $26f		; GTIA modes: $40=9,$80=10,$c0=11
CHBAS		= $2f4		; character base

my_font		= $4000

			org $2000
			
			lda #0
			jsr open_mode

			lda #$40
			sta GPRIOR

			lda #>my_font
			sta CHBAS
			
; copy data to font
; 17 bytes

			ldy #0
			tya
fill_all
			ldx #7
fill_char
			sta my_font,y
			iny
			dex
			bpl fill_char
			clc
			adc #$11
			bcc fill_all

; write characters

			ldy #15
fill		tya
			sta (screen_mem),y
			dey
			bpl fill
	
loop		jmp loop
