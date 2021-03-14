; Display list example
; F#FREADY, 2021

            org $2000
            
            lda #<display
            sta $230            ; SDLSTL
            lda #>display
            sta $231            ; SDLSTL+1
            
loop        jmp loop

display     dta $70,$70,$70     ; 3x8 blank lines
            dta $42, a($f000)   ; mode 0 DMA points to ROM
            dta $0d,$0d,$0d,$0d ; 4 x mode 7
            dta $06,$07         ; mode 1,2
            dta $41, a(display) ; end