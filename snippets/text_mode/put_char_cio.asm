; Put char to screen using CIO
; F#READY, 2021

; 20 bytes, don't use for sizecoding ;)

	org $0600

put_char
    ldx #$60        ; #6
    lda #0
	sta $0348,x     ; ICBLL
	sta $0349,x     ; ICBLH
	lda #11         ; PUT
	sta $0342,x     ; ICCOM
	lda #'A'        ; character
	jsr $e456       ; CIOV