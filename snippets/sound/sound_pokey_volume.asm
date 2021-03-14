; POKEY, volume only 4-bits
; F#READY, 2021

        org $8000
        
loop    lda $d40b   ; VCOUNT
        ora #$10    ; volume only
        sta $d201   ; AUDC1
        jmp loop
