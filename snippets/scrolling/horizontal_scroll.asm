; Horizontal scrolling
; F#READY, 2021

        org $8000
        
        lda #$42+$10    ; enable hscroll in display list
        sta $bc23
        
        ldx #47         ; fill one line
fill    lda #$21        ; 'A'
        sta $bc40,x
        dex
        bpl fill
            
loop    lda $14         ; RTCLOK
        sta $d404       ; HSCROL
        jmp loop
