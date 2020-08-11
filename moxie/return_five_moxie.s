	.file	"tiniest.c"
	.text
	.p2align	1
	.global	main
	.type	main, @function
main:
	ldi.l	$r0, 5
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 8.0.1 20180305 (experimental)"
