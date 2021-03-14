; Set custom VBLANK routine
; F#READY, 2021

; 18 bytes

		org $8000

        lda #6          ; sets VVBLKI
        ldy #<vbi
        ldx #>vbi
        jsr $e45c       ; SETVBV

loop    jmp loop

; A, X, Y are already saved by the OS
vbi     inc 710        
		jmp $e45f     ; SYSVBV exit vblank routine
