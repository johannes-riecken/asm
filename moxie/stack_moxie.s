	.file	"stack.c"
	.text
	.section	.rodata
	.p2align	2
.LC0:
	.string	"Goodbye, World!"
	.text
	.p2align	1
	.global	bar
	.type	bar, @function
bar:
	dec	$sp, 4
	sto.l	12($fp), $r0
	sto.l	16($fp), $r1
	ldi.l	$r0, .LC0
	sto.l	-4($fp), $r0
	ldo.l	$r1, 12($fp)
	ldo.l	$r0, 16($fp)
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ret
	.size	bar, .-bar
	.p2align	1
	.global	foo
	.type	foo, @function
foo:
	dec	$sp, 24
	sto.l	12($fp), $r0
	ldo.l	$r1, 12($fp)
	ldo.l	$r0, 12($fp)
	jsra	bar
	ret
	.size	foo, .-foo
	.p2align	1
	.global	foo1
	.type	foo1, @function
foo1:
	dec	$sp, 24
	ldi.l	$r0, 5
	jsra	foo
	ret
	.size	foo1, .-foo1
	.section	.rodata
	.p2align	2
.LC1:
	.string	"Hello, World!"
	.text
	.p2align	1
	.global	main
	.type	main, @function
main:
	dec	$sp, 4
	ldi.l	$r0, .LC1
	sto.l	-4($fp), $r0
	xor	$r0, $r0
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 8.0.1 20180305 (experimental)"
