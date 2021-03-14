; Player/Missiles
; set sprite data directly, with DMA
; F#READY, 2021

; 37 bytes

        org $8000
 
pm_area = $4000

        lda #%00111110  ; enable P/M DMA
        sta $022f       ; SDMCTL

        lda #>pm_area
        sta $d407       ; PMBASE

        lda #3          ; P/M both on
        sta $d01d       ; GRACTL

        lda #$0e        ; white
        sta $02c0       ; PCOLR0

        lda #$78
        sta $d000       ; HPOSP0      

        ldx #0
set_p0  txa
        sta pm_area+$400,x
        inx
        bne set_p0        

loop    jmp loop
