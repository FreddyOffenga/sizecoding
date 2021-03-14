; Line sync (kernal)
; F#READY, 2021

        org $8000
        
wait    lda $d40b   ; VCOUNT
        cmp #64
        bne wait    ; wait for scanline 2 x 64
        
        ldx #15
bar     txa
        sta $d40a   ; WSYNC sync on scanline
        sta $d018   ; COLPF2
        dex
        bpl bar

        bmi wait
