	.orig	x3000

	lea	r0,array
	ld	r1,stringa

	jsr	OR_ARRAY

stop	brnzp	stop

array	.fill	b0000111100001111
	.fill	b0011001100110011
	.fill	b1100110011001100
	.fill	b0000000000000000	;tappo

stringa	.fill	b1111000011110000

;**********************************************************************************************
;Si ricorda che per il teorema di De Morgan: A OR B = A AND B
;A OR B negato
;A negato e B negato per l'and

OR_ARRAY

	;salvataggio dei registri esterni
	
	st	r2,sr2
	st	r3,sr3
	st	r4,sr4

	not	r3,r1		;nego r3
	;add	r3,r3,#1	;sbagliato devo solo negare

ciclo	ldr	r2,r0,#0	;carico in R2 il valore di r0 quindi array[i]
	brz	fine		;se trovo in R2 il valore 0 sono arrivato alla fine dell'array
	not	r2,r2		;nego r2
	and	r4,r3,r2	;AND tra NOT valore R0 e NOT valore R1
	not	r4,r4		;nego la and per trovare l'or
	str	r4,r0,#0	;salvo il valore nell'array
	add	r0,r0,#1	;vado ad i+1
	brnzp	ciclo

fine
	ld	r2,sr2
	ld	r3,sr3
	ld	r4,sr4	
	and	r0,r0,#0	;R0 = 0
	and	r1,r1,#0	;R1 = 0
	ret

sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1
;**********************************************************************************************
	.end