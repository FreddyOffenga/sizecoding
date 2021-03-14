; Screen memory
; F#READY, 2021

SAVMSC  = $58

        org $8000
        
        lda #$cc
        sta $02f4       ; CHBAS

; write directly to screen memory

        ldy #0
write   tya
        sta (SAVMSC),y
        iny
        bne write
        
loop    jmp loop