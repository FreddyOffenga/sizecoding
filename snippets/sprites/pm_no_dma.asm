; Player/Missiles
; set sprite data directly, no DMA
; F#READY, 2021

; 27 bytes

        org $8000
 
        lda #$0e         ; white
        sta $02c0        ; PCOLR0

        lda #$78
        sta $d000       ; HPOSP0      
                
wait    lda $d40b       ; VCOUNT
        bne wait

        tax
fill    sta $d40a       ; WSYNC
        stx $d00d       ; GRAFP0
        inx
        bne fill
        beq wait