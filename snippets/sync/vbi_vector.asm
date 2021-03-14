; Demonstrate minimal vbi init.
; F#READY, 2021

		org $60e2-(vbi-main)

VVBLKI  = $222

main
		lsr VVBLKI+1  ; $c0e2 to $60e2

loop    jmp loop      ; bvc loop

; vertical blank, you can use a,x,y here
vbi     inc $02c6     ; COLOR2         
		jmp $e45f     ; SYSVBV exit vblank routine
