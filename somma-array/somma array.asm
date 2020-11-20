;SOMMA DI UN ARRAY
	.orig	x3000
	lea	r0,array	;carica in r0 puntatore ad array
	and	r2,r2,#0	;azzero totalizzatore
ciclo	ldr	r1,r0,#0	;carica in R1 array(i)
	brz	fine		;se array(i) = 0 fine lavori
	add	r2,r1,r2	;somma il valore i-esimo di array in R2
	add	r0,r0,#1	;si porta a elemento i+1
	brnzp	ciclo		;ritorna alla label ciclo - fine del ciclo while a condizione iniziale
fine	st	r2,result	;si salva il valore della somma in result
stoqui	brnzp	stoqui		;salto incondizionato a questa istruzione 

;area dati
array	.fill	15
	.fill	-27
	.fill	5
	.fill	0	;tappo
result	.blkw	1	;blkw block of words alloca words (16 bit) per la cella result
	.end		;fine della traduzione per l'assembler