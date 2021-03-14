; pure tone, POKEY
; F#READY, 2021

        org $8000
        
        lda #$a8    ; pure tone ($a0), volume 8 ($08)
        sta $d201   ; AUDC1
        
loop    lda 20      ; RTCLOK+2
        sta $d200   ; AUDF1        
        jmp loop