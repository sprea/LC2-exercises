	.orig	x3000

	ld	r0,n1
	ld	r1,n4
	jsr	sommauo
	ld	r0,n1
	ld	r1,n2
	jsr	sommauo
	ld	r0,n1
	ld	r1,n3
	jsr	sommauo
	ld	r0,n4
	ld	r1,n6
	jsr	sommauo
stop	brnzp	stop


n1	.fill	32760
n2	.fill	5
n3	.fill	10
n4	.fill	-32760
n5	.fill	-5
n6	.fill	-10

;*************************************************************************************
;sottoprogramma

sommauo


	add	r0,r0,#0
	brn	n1neg

;qui num1 positivo
	and	r1,r1,r1
	brn	disc
	brzp	concpos

;qui num1 neg
n1neg	and	r1,r1,r1
	brzp	disc
	brn	concneg

;qui discordi
disc	add	r1,r0,r1
	and	r0,r0,#0
	ret

;qui concordi positivi
concpos	add	r1,r0,r1
	brn	over
	and	r0,r0,#0
	ret

over	and	r0,r0,#0
	add	r0,r0,#1
	ret

;qui concordi negativi
concneg	add	r1,r0,r1
	brzp	under
	and	r0,r0,#0
	ret
under	and	r0,r0,#0
	add	r0,r0,#-1
	ret

	.end