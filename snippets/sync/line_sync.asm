; Line sync (kernal)
; F#READY, 2021

        org $8000
        
wait    lda $d40b   ; VCOUNT
        cmp #64
        bne wait
        
        lda #$34
        sta $d018   ; COLPF2
        bne wait
