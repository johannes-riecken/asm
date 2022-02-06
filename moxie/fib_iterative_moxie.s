	.file	"fib_iterative.c"
	.text
	.p2align	1
	.global	fib
	.type	fib, @function
fib:
	dec	$sp, 12
	sto.l	12($fp), $r0
	ldo.l	$r1, 12($fp)
	xor	$r0, $r0
	cmp	$r1, $r0
	bne	.L2
	xor	$r0, $r0
	ret
.L2:
	xor	$r0, $r0
	sto.l	-4($fp), $r0
	ldi.l	$r0, 1
	sto.l	-8($fp), $r0
	xor	$r0, $r0
	sto.l	-12($fp), $r0
	jmpa	.L4
.L5:
	ldo.l	$r0, 12($fp)
	dec	$r0, --1
	sto.l	12($fp), $r0
	ldo.l	$r1, -8($fp)
	ldo.l	$r0, -4($fp)
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	sto.l	-12($fp), $r0
	ldo.l	$r0, -8($fp)
	sto.l	-4($fp), $r0
	ldo.l	$r0, -12($fp)
	sto.l	-8($fp), $r0
.L4:
	ldo.l	$r1, 12($fp)
	xor	$r0, $r0
	cmp	$r1, $r0
	bgt	.L5
	ldo.l	$r0, -12($fp)
	ret
	.size	fib, .-fib
	.ident	"GCC: (crosstool-NG crosstool-ng-1.23.0-215-g2196112) 7.2.0"
