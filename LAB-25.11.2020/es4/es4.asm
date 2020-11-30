
	.orig	x3000
	
	lea	r0,array
	lea	r1,endarr
	jsr	ordina
stop	brnzp	stop


array	.fill	-34
	.fill	-12
	.fill	5
	.fill	9
	.fill	13
endarr	.fill	32

;***********************************************************************

ordina	st	r2,salvar2
	st	r3,salvar3

ciclo	ldr	r2,r0,#0
	ldr	r3,r1,#0
	str	r2,r1,#0
	str	r3,r0,#0
	add	r0,r0,#1
	add	r1,r1,#-1
	not	r2,r1
	add	r2,r2,#1
	add	r2,r0,r2
	brn	ciclo

	ld	r2,salvar2
	ld	r3,salvar3
	ret

salvar2	.blkw	1
salvar3	.blkw	1	
;***************************************************************
	.end