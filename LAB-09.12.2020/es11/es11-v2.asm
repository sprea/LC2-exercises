	.orig	x3000

	lea	r0,f1
	lea	r1,ef1
	add	r1,r1,#-2
	jsr	CONTA_DOPPIE
	
	lea	r0,f2
	lea	r1,ef2
	add	r1,r1,#-2
	jsr	CONTA_DOPPIE

stop	brnzp	stop

f1	.stringz	"aafbb"
ef1	.blkw	1

f2	.stringz	"aacvbb"
ef2	.blkw	1

;*******************************************************************************************************
CONTA_DOPPIE
	st	r2,sr2
	st	r3,sr3
	st	r4,sr4
	
	and	r4,r4,#0	;R4 = contatore di doppie
	not	r1,r1
	add	r1,r1,#1	;R1 = -indirizzo finale

ciclo	add	r2,r0,r1
	brzp	fine		;finito quando R0 >= R1

;qui restano almento 2 caratteri
	ldr	r2,r0,#0
	ldr	r3,r0,#1
	not	r3,r3
	add	r3,r3,#1
	add	r3,r2,r3	;confronto lettera[i] con lettera[i+1]
	brnp	nodop

;qui coppia di lettere uguali
	add	r4,r4,#1	;incremento contatore

nodop	add	r0,r0,#1
	brnzp	ciclo

fine	add	r0,r4,#0	;R0 = conteggio doppie	
	ld	r2,sr2
	ld	r3,sr3
	ld	r4,sr4

	ret

sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1

	.end