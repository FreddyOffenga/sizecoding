; Open graphics mode using CIO
; F#READY, 2021

; 37 bytes (!), don't use for sizecoding

    	org $2000

        ldx #$60       ; CHANNEL
    	lda #3         ; OPEN
    	sta $0342,x    ; ICCOM #6
    	lda #12        ; R/W
    	sta $034a,x    ; ICAX1 #6
    	lda #1         ; mode
    	sta $034b,x    ; ICAX2 #6
    	lda #<device
    	sta $0344,x    ; ICBAL #6
    	lda #>device
    	sta $0345,x    ; ICBAH #6
    	jsr $e456      ; CIOV

device
    	dta 'S'
