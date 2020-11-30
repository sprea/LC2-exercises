	.orig	x3000
	
	lea	r0,A	;carica in r0 indirizzo al primo elemento di A
	ld	r1,N
	jsr	pos
stoqui	brnzp	stoqui

A	.fill	12
	.fill	5
	.fill	10
	.fill	1
	.fill	0	;tappo array

N	.fill	10
;******************************************************************************
pos
	st	r2,salvar2
	st	r3,salvar3
	st	r4,salvar4
	st	r5,salvar5

	and	r4,r4,#1
	and	r2,r2,#0
	and	r3,r3,#0
	not	r2,r1
	add	r2,r2,#1

ciclo	ldr	r5,r0,#0	;carica	in r5 il valore di array(i)
	brz	fine		;se trova 0 fine
	add	r4,r4,#1	;incremento il contatore delle posizioni
	add	r3,r5,r2	;r3=r5+r2
	brz	trovato		;se r3=0 allora ho trovato il valore N	
	st	r4,I		;salvo il contatore in I
	add	r0,r0,#1	;si porta a elemento + 1
	brnzp	ciclo		;condizione del ciclo

trovato	ld	r0,I
	brnzp	salva

fine	and	r0,r0,#0
	brnzp	salva

salva
	ld	r2,salvar2
	ld	r3,salvar3
	ld	r4,salvar4
	ld	r5,salvar5
	ret

I	.blkw	1
salvar2	.blkw	1
salvar3	.blkw	1
salvar4	.blkw	1
salvar5	.blkw	1

	.end