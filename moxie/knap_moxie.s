	.file	"knap.c"
	.text
	.global	items
	.data
	.p2align	2
	.type	items, @object
	.size	items, 176
items:
	.long	9
	.long	150
	.long	13
	.long	35
	.long	153
	.long	200
	.long	50
	.long	160
	.long	15
	.long	60
	.long	68
	.long	45
	.long	27
	.long	60
	.long	39
	.long	40
	.long	23
	.long	30
	.long	52
	.long	10
	.long	11
	.long	70
	.long	32
	.long	30
	.long	24
	.long	15
	.long	48
	.long	10
	.long	73
	.long	40
	.long	42
	.long	70
	.long	43
	.long	75
	.long	22
	.long	80
	.long	7
	.long	20
	.long	18
	.long	12
	.long	4
	.long	50
	.long	30
	.long	10
	.global	N
	.p2align	2
	.type	N, @object
	.size	N, 4
N:
	.long	22
	.text
	.p2align	1
	.global	knap
	.type	knap, @function
knap:
	dec	$sp, 40
	sto.l	12($fp), $r0
	xor	$r0, $r0
	sto.l	-4($fp), $r0
	xor	$r0, $r0
	sto.l	-8($fp), $r0
	jmpa	.L2
.L4:
	ldo.l	$r1, -4($fp)
	ldi.l	$r0, 3
	ashl	$r1, $r0
	ldi.l	$r0, items
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ld.l	$r0, ($r0)
	ldo.l	$r1, 12($fp)
	mov	$r3, $r1
	sub	$r3, $r0
	mov	$r0, $r3
	sto.l	-12($fp), $r0
	ldo.l	$r1, -12($fp)
	xor	$r0, $r0
	cmp	$r1, $r0
	blt	.L3
	ldo.l	$r0, -12($fp)
	jsra	knap
	mov	$r1, $r0
	ldo.l	$r2, -4($fp)
	ldi.l	$r0, 3
	ashl	$r2, $r0
	ldi.l	$r0, items+4
	mov	$r3, $r2
	add	$r3, $r0
	mov	$r0, $r3
	ld.l	$r0, ($r0)
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	sto.l	-16($fp), $r0
	ldo.l	$r1, -16($fp)
	ldo.l	$r0, -8($fp)
	cmp	$r1, $r0
	ble	.L3
	ldo.l	$r0, -16($fp)
	sto.l	-8($fp), $r0
.L3:
	ldo.l	$r0, -4($fp)
	inc	$r0, 1
	sto.l	-4($fp), $r0
.L2:
	lda.l	$r0, N
	ldo.l	$r1, -4($fp)
	cmp	$r1, $r0
	blt	.L4
	ldo.l	$r0, -8($fp)
	ret
	.size	knap, .-knap
	.ident	"GCC: (GNU) 8.3.0"
