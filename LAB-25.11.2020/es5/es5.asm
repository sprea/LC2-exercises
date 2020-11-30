	.orig	x3000

	ld	r0,n1
	jsr	conv
	
	ld	r0,n2
	jsr	conv

	ld	r0,n3
	jsr	conv

	ld	r0,n4
	jsr	conv

stop	brnzp	stop

n1	.fill	b0000000000001100	;12
n2	.fill	b1000000000001100	;-12
n3	.fill	b0000000000000000	;0
n4	.fill	b1000000000000000	;-0

;********************************************************************************************
;Esercizio: Scrivere un sottoprogramma che
;-riceve in R0 un numero in modulo e segno
;-restituisce in R0 il numero in complemento a due

conv
	and	r0,r0,r0	;verifica del segno di R0
	brp	fine
	st	r1,salvar1
	ld	r1,msb
	and	r0,r0,r1
	not	r0,r0
	add	r0,r0,#1	;in R0 il numero in ca2
	ld	r1,salvar1

fine	ret

ris	.blkw	1
msb	.fill	b0111111111111111
salvar1	.blkw	1

	.end