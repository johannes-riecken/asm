	.file	"hello.c"
	.text
	.section	.rodata
	.p2align	2
.LC0:
	.string	"Hello, World!"
	.text
	.p2align	1
	.global	main
	.type	main, @function
main:
	dec	$sp, 4
	ldi.l	$r0, .LC0
	sto.l	-4($fp), $r0
	xor	$r0, $r0
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 8.0.1 20180305 (experimental)"
