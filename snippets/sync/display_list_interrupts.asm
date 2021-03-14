; Display List Interrupt
; F#READY, 2021

        org $8000
        
        lda #<dli
        sta $200
        lda #>dli
        sta $201
        
        lda #$c0    ; enable DLIs 
        sta $d40e   ; NMIEN

        lda #$82
        sta $bc30   ; enable DLI at line #12
                
loop    jmp loop

dli     pha
        lda #$34
        sta $d018
        pla
        rti
