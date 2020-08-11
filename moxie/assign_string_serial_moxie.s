	.file	"hello_serial.c"
	.text
	.p2align	1
	.global	_write
	.type	_write, @function
_write:
	dec	$sp, 4
	sto.l	12($fp), $r0
	sto.l	16($fp), $r1
	sto.l	20($fp), $r2
	xor	$r0, $r0
	sto.l	-4($fp), $r0
	jmpa	.L2
.L3:
	ldo.l	$r0, -4($fp)
	mov	$r1, $r0
	inc	$r1, 1
	sto.l	-4($fp), $r1
	ldo.l	$r1, 16($fp)
	add	$r1, $r0
	ldi.l	$r0, 1016
	ld.b	$r1, ($r1)
	st.b	($r0), $r1
.L2:
	ldo.l	$r1, -4($fp)
	ldo.l	$r0, 20($fp)
	cmp	$r1, $r0
	blt	.L3
	ldo.l	$r0, 20($fp)
	ret
	.size	_write, .-_write
	.section	.rodata
	.p2align	2
.LC0:
	.string	"Hello World!"
	.text
	.p2align	1
	.global	main
	.type	main, @function
main:
	dec	$sp, 24
	ldi.l	$r0, .LC0
	jsra	puts
	xor	$r0, $r0
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 8.0.1 20180305 (experimental)"
