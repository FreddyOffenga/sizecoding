; Scanline sync (kernal)
; F#READY, 2021

        org $8000
        
wait    lda $d40b   ; VCOUNT
        cmp #32
        bne wait

        ldx #0
        stx $022f
bar     lda colors,x
        sta $d40a   ; WSYNC
        sta $d01a   ; COLPF2
        inx
        cpx #9
        bne bar
        beq wait

colors  dta $24,$26,$28,$2a
        dta $2a,$28,$26,$24,0