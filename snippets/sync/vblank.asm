; Vblank routine using RTCLOK
; F#READY, 2021

        org $8000
        
; 18 bytes

RTCLOK  = $14       ; frame counter

loop
wait            
        lda RTCLOK 
        cmp RTCLOK
        beq wait
        
        inc $02c6                
        jmp loop