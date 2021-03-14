; Colors registers
; F#READY, 2021

        org $8000
        
        lda #$0     ; black
        sta $02c5   ; COLOR1
        
        lda #$ea    ; green
        sta $02c6   ; COLOR2
        
        lda #$b6    ; purple
        sta $02c8   ; COLOR4
        
loop    jmp loop