	.orig	x3000

	lea	r0,mex
	lea	r1,last

	jsr	CONTA_DOPPIE

stop	brnzp	stop

;nel mezzo del cammin di nostra vita che la diritta via era smarrita bella
mex	.stringz	"aacvbb"
last	.stringz	"."

;*****************************************************************************************************

CONTA_DOPPIE
	
	st	r2,sr2
	st	r3,sr3
	st	r4,sr4
	st	r5,sr5
	st	r6,sr6
	and	r4,r4,#0	;azzero contatore doppie

ciclo	ldr	r2,r0,#0
	not	r3,r0
	add	r3,r3,r1
	brz	fine
	add	r0,r0,#1	;incremento l'indice della stringa
	ldr	r5,r0,#0	;salvo il valore di r0+1
	not	r5,r5
	add	r5,r5,#1	;nego r5
	add	r6,r2,r5	;sommo le lettere
	brz	incre
	brnp	ciclo
incre	add	r4,r4,#1	;ho trovato due lettere uguali aggiorno il contatore
	brnzp	ciclo

fine
	and	r0,r0,#0
	add	r0,r4,r0
	ld	r2,sr2
	ld	r3,sr3
	ld	r4,sr4
	ld	r5,sr5
	ld	r6,sr6
	ret

sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1
sr5	.blkw	1
sr6	.blkw	1

	.end