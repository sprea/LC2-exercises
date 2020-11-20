;***********************************************************************************************************************************
;programma chiamante main
	.orig	x3000

	ld	r1,n1
	ld	r2,n2
	jsr	confr
	ld	r1,n2
	ld	r2,n1
	jsr	confr
	ld	r1,n3
	ld	r2,n4
	jsr	confr
	
stop	brnzp	stop	

;area dati
n1	.fill	10
n2	.fill	20
n3	.fill	-10
n4	.fill	-20
;************************************************************************************************************************************
;************************************************************************************************************************************
;sottoprogramma che confronta due numeri
;R1 = num1
;R2 = num2

;output
;R0 = -1 se num1 < num2
;R1 = 0 se num1 = num2
;R2 = +1 se num1 > num2

confr
	st	r1,salvar1
	st	r2,salvar2

	and	r0,r0,#0
;confronto i due numeri facendo num1 - num2

	not	r2,r2
	add	r2,r2,#1	;R2 = -R2
	add	r1,r1,r2	;R1 = num1 - num2
	brn	num1min		;se condition code = n (negativo) num1min
	brz	fine		;se condition code = z (zero) num1=num2

;qui num1>num2 perche i salti non sono stati eseguiti quindi num1>num2
	add	r0,r0,#1
	brnzp	fine

;qui num1 < num2
num1min	add	r0,r0,#-1

;qui num1 = num2
fine	ld	r1,salvar1
	ld	r2,salvar2

	ret

salvar1	.blkw	1
salvar2	.blkw	1
;************************************************************************************************************************************
	.end