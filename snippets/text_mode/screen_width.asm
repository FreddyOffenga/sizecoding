; Screen width
; F#READY, 2021

SAVMSC  = $58
SDMCTL  = $22f

        org $8000
        
        dec SDMCTL      ; mode 0, 32 characters
;       inc SDMCTL      ; mode 0, 48 characters

; write directly to screen memory

        ldy #0
write   tya             ; screen code in A
        sta (SAVMSC),y
        iny
        bne write
        
loop    jmp loop