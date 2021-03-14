; Graphics mode
; F#READY, 2021

; mode ANTIC width  height colors DL     screen_mem
;  3    8    40     24     4      $be50  $be70
;  4    9    80     48     2      $bd48  $bd80
;  5   10    80     48     4      $bb68  $bba0
;  6   11    160    96     2      $b778  $b7e0
;  7   13    160    96     4      $af98  $b060
;  8   15    320   192     2      $a036  $a150,$b000
;  9   15    80    192     16*    $a036  $a150,$b000
; 10   15    80    192     9 *    $a036  $a150,$b000
; 11   15    80    192     16*    $a036  $a150,$b000
; 14   12    160   192     2      $af38  $b060
; 15   14    160   192     4      $a036  $a150,$b000
;
; * GTIA modes 
;  9: 4-bit pixel luminance only
; 11: 4-bit pixel color only
; 10: 9 colors set in location 704..712

open_mode	= $ef9c		; A=mode

SAVMSC		= $58		; word
screen_mem	= SAVMSC	; alias

			org $2000

			lda #7
			jsr open_mode
			
; write some garbage

			ldy #0
fill		lda $f000,y		; ROM area
			sta (screen_mem),y
			iny
			bne fill
						
loop		jmp loop
