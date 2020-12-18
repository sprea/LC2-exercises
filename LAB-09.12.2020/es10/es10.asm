	.orig	x3000

	ld	r0,N
	jsr	FIBONACCI

	
	ld	r0,N0
	jsr	FIBONACCI

	ld	r0,N1
	jsr	FIBONACCI

	ld	r0,N2
	jsr	FIBONACCI

	ld	r0,N3
	jsr	FIBONACCI

stop	brnzp	stop

N	.fill	10
N0	.fill	0
N1	.fill	5
N2	.fill	-5
N3	.fill	2
;****************************************************************************************************************
;Scrivere un sottoprogramma denominato FIBONACCI che riceve nel registro R0 il numero intero N e che
;restituisce sempre in R0 l'ennesimo termine Fn della sequenza di Fibonacci
;Fn = Fn-1 + Fn-2 con F1 = 1 e F2 = 1
;Per N<=0 allora Fn = 0

FIBONACCI
	and	r0,r0,r0	;aggiorna CC
	brnz	err		;N<=0 quindi non eseguo il calcolo

	add	r0,r0,#-2
	brp	nouno		;se r0>0 allora r0 non è uguale a 1 o 2
	and	r0,r0,#0
	add	r0,r0,#1	;essendo N<=2 allora r0 = 1
	ret

nouno	st	r1,sr1
	st	r2,sr2
	st	r3,sr3
	
	add	r1,r1,#0
	add	r1,r1,#1	;R1 = F(n-1)
	add	r2,r1,#0	;R2 = F(n-2)
	
ciclo	add	r3,r1,r2	;R3 = F(n)
	add	r0,r0,#-1	;decremento r0
	brz	fine		;se r0 = 0 allora esco dal ciclo
	add	r2,r1,#0	;F(n-2) = F(n-1)
	add	r1,r3,#0	;F(n-1) = F(n)
	brnzp	ciclo

fine	add	r0,r3,#0	;R0 = F(n)
	ld	r1,sr1
	ld	r2,sr2
	ld	r3,sr3
	ret

err	and	r0,r0,#0
	ret

sr1	.blkw	1
sr2	.blkw	1
sr3	.blkw	1

	.end