; Project Euler #1
; Find the sum of all the multiples of 3 or 5 below 1000.
; compile with: tass64 euler1.asm -ao euler1.prg
; run with: vice euler1.prg
;   Answer: 233168

	*=$0801
	.byte $0c, $08, $0a, $00, $9e, $20
	.byte $34, $30, $39, $36, $00, $00
	.byte $00
	*=$1000

main:
	jsr $e544 ;clear screen

; loop 3 to 999 step 3
	ldy #$03 ; step
	lda #$03 ; step
	sta counter
	jsr sumloop

; loop 5 to 999 step 15
	ldy #$0F ; step
	jsr clearcounter
	lda #$05
	sta counter
	jsr sumloop

	; loop 10 to 999 step 15
	ldy #$0F ; step
	jsr clearcounter
	lda #$0A
	sta counter
	jsr sumloop

	jsr printdec
	rts

clearcounter:
	lda #$00
	sta counter
	sta counter+1
	sta counter+2
	sta counter+3
	rts

sumloop:
; add counter to sum
	; summand1 = counter
	ldx counter
	stx summand1
	ldx counter+1
	stx summand1+1
	ldx counter+2
	stx summand1+2
	ldx counter+3
	stx summand1+3

	; summand2 = sum
	ldx sum
	stx summand2
	ldx sum+1
	stx summand2+1
	ldx sum+2
	stx summand2+2
	ldx sum+3
	stx summand2+3

	; result = summand1 + summand2
	jsr adc32

	; sum = result
	ldx result
	stx sum
	ldx result+1
	stx sum+1
	ldx result+2
	stx sum+2
	ldx result+3
	stx sum+3

; add 3 to counter
	; summand2 = 3
	; counter only needs 16 bits
	sty summand2
	lda #$00
	sta summand2+1

	; result = summand1 + summand2
	jsr adc32

	; counter = result
	ldx result
	stx counter
	ldx result+1
	stx counter+1

; if (counter < 0x03E8) goto loop3
	lda counter+1
	cmp #$03
	bcc sumloop
	lda counter
	cmp #$E8
	bcc sumloop
	rts

	; add 32 bit integers
adc32:
	clc
	lda summand1
	adc summand2
	sta result
	lda summand1+1
	adc summand2+1
	sta result+1
	lda summand1+2
	adc summand2+2
	sta result+2
	lda summand1+3
	adc summand2+3
	sta result+3
	rts

	; prints a 32 bit value to the screen
printdec:
	jsr hex2dec

	ldx #9
l1:
	lda output,x
	bne l2
	dex             ; skip leading zeros
	bne l1

l2:
	lda output,x
	ora #$30
	jsr $ffd2
	dex
	bpl l2
	rts

	; converts 10 digits (32 bit values have max. 10 decimal digits)
hex2dec:
	ldx #0
l3:
	jsr div10
	sta output,x
	inx
	cpx #10
	bne l3
	rts

	; divides a 32 bit value by 10
	; remainder is returned in akku
div10:
	ldy #32         ; 32 bits
	lda #0
	clc
l4:
	rol
	cmp #10
	bcc skip
	sbc #10
skip:
	rol sum
	rol sum+1
	rol sum+2
	rol sum+3
	dey
	bpl l4
	rts

sum			.byte $00,$00,$00,$00
counter	.byte $00,$00,$00,$00
summand1   .byte $00,$00,$00,$00
summand2   .byte $00,$00,$00,$00
result	.byte $00,$00,$00,$00

output  .byte 0,0,0,0,0,0,0,0,0,0