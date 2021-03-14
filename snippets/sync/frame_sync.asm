; Frame sync
; F#READY, 2021

            org $8000
            
loop        lda $14     ; RTCLOK
wait        cmp $14
            beq wait

; executed every frame
            inc $02c6   ; COLOR2 
            jmp loop
