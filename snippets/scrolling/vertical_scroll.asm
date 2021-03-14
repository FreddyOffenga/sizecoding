; Vertical scrolling
; F#READY, 2021

        org $8000
        
        lda #$42+$20    ; enable vscroll in display list
        sta $bc23
        
        ldx #80         ; fill two lines
fill    lda #$21        ; 'A'
        sta $bc40-1,x
        dex
        bne fill
            
loop    lda $14         ; RTCLOK
        and #7          ; scroll offsets 0..7
        sta $d405       ; VSCROL
        bvc loop
