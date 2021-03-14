; Scanline sync (kernal)
; F#READY, 2021

        org $8000

        lda #0
        sta $022f   ; SDMCTL
colors  lda $d40b   ; VCOUNT
        asl
        sta $d01a   ; COLBK
        jmp colors