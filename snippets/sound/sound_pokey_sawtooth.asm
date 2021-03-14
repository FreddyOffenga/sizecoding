; Pure tone sawtooth wave, POKEY
; POKEY doesn't have ADSR build in, so you have to make your own waves
; F#READY, 2021

        org $8000
        
        lda #$80
        sta $d200   ; AUDF1
        
wait    lda 20
        cmp 20
        beq wait
        
        and #$0f    ; volume
        ora #$a0    ; pure tone
        sta $d201   ; AUDC1
        
        jmp wait