; Open mode through device table
; F#READY, 2021

        org $8000
        
        jsr open_mode

open_mode
        lda $e411   ; open S: hi-byte
        pha
        lda $e410   ; open S: lo-byte
        pha
    
        lda #7      ; mode #
        sta $2b     ; ICAX2Z, CIO mode byte
        rts