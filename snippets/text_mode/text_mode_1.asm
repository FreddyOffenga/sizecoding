; Text mode 1
; F#READY, 2021

open_mode	= $ef9c		; A=mode

SAVMSC		= $58		; word
screen_mem	= SAVMSC	; alias

            org $2000

; mode ANTIC width  height colors DL     screen_mem
;  1    6    20     24     4      $bd60  $bd80
; mode  1, 2: select color by character bits 6,7 (only 64 characters to display)

            lda #7
            jsr open_mode
			
; write 0..255

            ldy #0
fill        tya
            sta (SAVMSC),y
            iny
            bne fill
	
loop        jmp loop
