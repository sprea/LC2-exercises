	.orig	x3000

	lea	r0,msg
	jsr	CONV_MAIUS

stop	brnzp	stop

msg	.stringz	"Ciao Cari"

;***************************************************************

CONV_MAIUS
	st	r1,sr1
	st	r2,sr2
	st	r3,sr3
	st	r4,sr4
	st	r5,sr5
	st	r6,sr6


	ld	r2,coda		;R2 = codifica decimale di a
	ld	r3,codz		;R2 = codificica decimale di z
	ld	r5,diff		;r5 = differenza per convertire le lettere (-32)
	and	r6,r6,#0	;R6 = contatore lettere convertite

ciclo	ldr	r1,r0,#0	;R1 = car[i]
	brz	fine
	add	r4,r1,r2	;confronto car[i] con "a"
	brn	nomin		;se l'operzione è negativa la lettera non è minuscola
	add	r4,r1,r3	;confronto car[i] con "z"
	brp	nomin
;qui lettera minuscola la converte
	add	r1,r1,r5	;converte min -> MAIU
	str	r1,r0,#0	;scrive il nuovo carattere in R0
	add	r6,r6,#1	;incremento del contatore
;qui comunque
nomin	add	r0,r0,#1
	brnzp	ciclo

fine	add	r0,r6,#0	;copio in R0 contatore lettere convertite

	ld	r1,sr1
	ld	r2,sr2
	ld	r3,sr3
	ld	r4,sr4
	ld	r5,sr5
	ld	r6,sr6

	ret


diff	.fill	-32
coda	.fill	-97
codz	.fill	-122
sr1	.blkw	1
sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1
sr5	.blkw	1
sr6	.blkw	1
;**********************************************************************************************************
	.end