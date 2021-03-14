; Text mode
; F#READY, 2021

open_mode	= $ef9c		; A=mode

SAVMSC		= $58		; word
screen_mem	= SAVMSC	; alias

			org $2000

; mode ANTIC width  height colors DL     screen_mem
;  0    2    40     24     2      $bc20  $bc40
;  1    6    20     24     4      $bd60  $bd80
;  2    7    20     12     4      $be5c  $be70
; 12    4    40     24     5*     $bb80  $a044
; 13    5    40     12     5*     $bd6c  $bd80
;
; (*)
; mode  1, 2: select color by character bits 6,7 (only 64 characters to display)
; mode 12,13: 5th color by setting character bit 7 (inverse character)

			lda #0
			jsr open_mode
			
; write some garbage

			ldy #0
fill		tya
			sta (screen_mem),y
			iny
			bne fill
	
loop		jmp loop
