
	.orig	x3000
	
	lea	r0,array
	lea	r1,endarr
	ld	r2,n1
	jsr	trova

	lea	r0,array
	lea	r1,endarr
	ld	r2,n2
	jsr	trova
	
	lea	r0,array
	lea	r1,endarr
	ld	r2,n3
	jsr	trova

stop	brnzp	stop


array	.fill	25
	.fill	-12
	.fill	4
	.fill	0
endarr	.fill	9

n1	.fill	-12
n2	.fill	9
n3	.fill	35




;***********************************************************************

trova	st	r3,salvar3
	st	r4,salvar4

	not	r1,r1
	add	r1,r1,#1	;r1= -puntatore di fine array

	not	r2,r2
	add	r2,r2,#1	;R2 = -N

ciclo	add	r3,r0,r1	;confronto tra R0 e R1
	brp	nontrov		;fine scansione array (R0 maggiore di R1)
	ldr	r3,r0,#0	;R3 = elemento dell'array
	add	r3,r2,r3	;confronto tra A(i) e N
	brz	trovato
	add	r0,r0,#1	;puntatore ad elemento successivo
	brnzp	ciclo
nontrov	and	r0,r0,#0	;restituisco indicazione di non trovato
	brnzp	fine

trovato	and	r0,r0,#0
	add	r0,r0,r4	;restituisce indice dell'elemento trovato

fine	ld	r3,salvar3
	ld	r4,salvar4
	ret

salvar3	.blkw	1
salvar4	.blkw	1	
;***************************************************************
	.end