; Plot one pixel using CIO
; F#READY, 2021

; 32 bytes (!), do not use for sizecoding ;)

    	org $2000
    
    	lda #10
    	sta 85			; COLCRS (x)
    	sta 84			; ROWCRS (y)
	
	    ldx #$60
    	lda #0
    	sta $0348,x    ; ICBLL #6
    	sta $0349,x    ; ICBLH #6
    	lda #11        ; PUT
    	sta $0342,x    ; ICCOM #6
    	lda #1         ; output byte
    	jsr $E456      ; CIOV
