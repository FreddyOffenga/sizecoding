; Scanline sync (kernal)
; F#READY, 2021

        org $8000
        
wait    lda $d40b   ; VCOUNT
        bne wait
        tax
        sta $022f   ; SDMCTL
colors  dex
        dex
        sta $d40a   ; WSYNC
        stx $d01a   ; COLBK
        bne colors
        beq wait
