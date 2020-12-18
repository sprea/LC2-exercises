	.orig	x3000

	lea	r0,arr
	lea	r1,end
	jsr	CONTA_PARI_DISPARI
	
stop	brnzp	stop

arr	.fill	112
	.fill	-27
	.fill	-1232
	.fill	450
	.fill	15
end	.fill	120

;**********************************************************************************************

CONTA_PARI_DISPARI

	st	r2,sr2
	st	r3,sr3
	st	r4,sr4

	and	r2,r2,#0	;azzero il contatore pari
	and	r3,r3,#0	;azzero il contatore dispari
	not	r1,r1
	add	r1,r1,#1	;R1 = -indirizzo finale

ciclo	add	r6,r0,r1	;confronto indirizzi (R6 = R0 - R1)
	brp	fine
	ldr	r4,r0,#0	;carico in R4 array[i]
	and	r4,r4,b00001	;controllo se dispari, verifico il bit di peso 2^0
	brz	pari		;se zero dispari
	add	r3,r3,#1	;aggiorno contatore dispari
	brnzp	next
pari	add	r2,r2,#1	;aggiorno contatore pari

next	add	r0,r0,#1	;vado a i+1
	brnzp	ciclo

fine
	st	r2,contpar
	st	r3,contdis
	ld	r0,contpar
	ld	r1,contdis
	ld	r2,sr2
	ld	r3,sr3
	ld	r4,sr4
	ret

sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1
contpar	.blkw	1
contdis	.blkw	1
	.end