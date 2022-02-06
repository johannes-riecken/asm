	.file	"fib_recursive.c"
	.text
	.p2align	1
	.global	fib
	.type	fib, @function
fib:
	push	$sp, $r6
	dec	$sp, 24
	sto.l	12($fp), $r0
	ldo.l	$r1, 12($fp)
	xor	$r0, $r0
	cmp	$r1, $r0
	bne	.L2
	xor	$r0, $r0
	jmpa	.L3
.L2:
	ldo.l	$r1, 12($fp)
	ldi.l	$r0, 1
	cmp	$r1, $r0
	bne	.L4
	ldi.l	$r0, 1
	jmpa	.L3
.L4:
	ldo.l	$r0, 12($fp)
	dec	$r0, --1
	jsra	fib
	mov	$r6, $r0
	ldo.l	$r0, 12($fp)
	dec	$r0, --2
	jsra	fib
	mov	$r1, $r6
	add	$r1, $r0
	mov	$r0, $r1
.L3:
	mov	$r12, $fp
	dec	$r12, 4
	pop	$r12, $r6
	ret
	.size	fib, .-fib
	.ident	"GCC: (crosstool-NG crosstool-ng-1.23.0-215-g2196112) 7.2.0"
