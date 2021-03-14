; Screen memory
; F#READY, 2021

SAVMSC  = $58

        org $8000
        
; write directly to screen memory

        ldy #0
write   lda #$21        ; screen code 'A'
        sta (SAVMSC),y
        iny
        bne write
        
loop    jmp loop