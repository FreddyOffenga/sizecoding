; Console speaker sound, volume only 1-bit
; F#READY, 2021

        org $8000
        
loop    lda $d40b   ; VCOUNT
        sta $d01f   ; CONSOL
        jmp loop