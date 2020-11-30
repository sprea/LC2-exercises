	.orig	x3000

	lea	r0,array
	jsr	sommams

stoqui	brnzp	stoqui


array	.fill	b0000000000001100	;12
	.fill	b1000000000001101	;-13
	.fill	0			;fine array



;*******************************************************************************************++
;Esercizio: Scrivere un sottoprogramma che 
;-riceve in R0 l'indirizzo del primo elemento di un array di numeri in modulo e segno diversi da 0
;-restituisce in R0 il risultato in modulo e segno della sommatoria di tutti i numeri dell'array trascurando i traboccamenti

sommams
	st	r7,salvar7
	
	and	r1,r0,r0	;R1 = puntatore ad array
	and	r2,r2,#0	;R2 = 0 risultato somma

ciclo	ldr	r0,r1,#0
	brz	stop
	jsr	conversione
	add	r2,r0,r2	;aggiorno sommatoria
	add	r1,r1,#1	;incremento l'indice
	brnzp	ciclo

stop	add	r2,r2,#0
	brzp	torna
;la sommatoria negativa deve essere convertita in modulo e segno
	not	r2,r2
	add	r2,r2,#1	;R2 - modulo della sommatoria negativa
	ld	r1,segnoneg
	add	r2,r1,r2
torna	add	r0,r2,#0
	ld	r7,salvar7
	ld	r1,salvar1
	ld	r2,salvar2
	ret

segnoneg	.fill	b1000000000000000
salvar7	.blkw	1
salvar1	.blkw	1
salvar2	.blkw	1
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

conversione
	and	r0,r0,r0	;verifica del segno di R0
	brn	conv
	ret
;qui numero in modulo e segno negativo
conv	st	r1,sr1
	ld	r1,msb
	and	r0,r0,r1
	not	r0,r0
	add	r0,r0,#1	;in R0 il numero in ca2
	ld	r1,sr1
	ret

msb	.fill	b0111111111111111
sr1	.blkw	1

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	.end