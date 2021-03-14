; pure tone, POKEY
; F#READY, 2021

        org $8000
        
        lda #$a8    ; pure tone ($a0), volume 8 ($08)
        sta $d201   ; AUDC1
        
        lda #$80
        sta $d200   ; AUDF1
        
loop    jmp loop