	.orig	x3000

	lea	r0,array
	jsr	GAP_ASS

stop	brnzp	stop

array	.fill	112
	.fill	-27
	.fill	-12
	.fill	45
	.fill	15
	.fill	0

;*******************************************************************************************************************
;Scrivere un sottoprogramma che riceve nel registro R0 l'indirizzo della prima cella di un array di interi
;in complemento a due non ordinati terminato dal valore 0 che non è da considerare.
;Il sottoprogramma deve restituire nel registro r0 la differenza fra il valore assoluto massimo e il valore assoluto
;minimo dei numeri della sequenza

GAP_ASS
	
	
	st	r1,sr1
	st	r2,sr2
	st	r3,sr3
	st	r4,sr4
	st	r5,sr5
	
;	and	r2,r2,#0
;	and	r3,r3,#0

	ldr	r1,r0,#0
	brz	finvuo

;qui almeno un elemento nell'array

	brp	giapos
	not	r1,r1
	add	r1,r1,#1	;R1 = valore assoluto di array[1]

giapos	add	r2,r1,#0	;R2 = max valore assoluto
	add	r3,r1,#0	;R3 = min valore assoluto	
	add	r0,r0,#1	;incremento l'indice di array

ciclo	ldr	r1,r0,#0	;R1 = array[i]
	brz	fine
	brp	pos
	not	r1,r1
	add	r1,r1,#1	;R1 = valore assoluto di array[i]
	
pos	not	r4,r1
	add	r4,r4,#1	;R4 = -valore assoluto array[i]
	add	r5,r2,r4	;confronto tra -valore assoluto di array[i] e max val assouluto
	brzp	nonwmx
;qui R1 nuovo massimo
	add	r2,r1,#0	;aggiorno max val assoluto
	brnzp	next

nonwmx	add	r5,r3,r4	;confronto tra -valore assoluto di array[i] e min val assouluto
	brnz	next
;qui R1 nuovo minimo
	add	r3,r1,#0	;aggiorno min val assoluto

next	add	r0,r0,#1	;incremento indice
	brnzp	ciclo

finvuo	and	r0,r0,#0
	add	r0,r0,#-1
	brnzp	recreg

fine	not	r3,r3
	add	r3,r3,#1	;R3 = -min val assoluto
	
	add	r0,r2,r3	;calcolo la differenza tra valori assoluti
	
recreg	ld	r1,sr1
	ld	r2,sr2
	ld	r3,sr3
	ld	r4,sr4
	ld	r5,sr5	
	
	ret

sr1	.blkw	1
sr2	.blkw	1
sr3	.blkw	1
sr4	.blkw	1
sr5	.blkw	1

;***********************************************************************************************************
	.end