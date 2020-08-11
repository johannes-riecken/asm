	.file	"foo.c"
	.text
	.global	__extendsfdf2
	.section	.rodata
	.p2align	2
.LC0:
	.string	"%f\n"
	.p2align	2
.LC1:
	.string	"%a\n"
	.text
	.p2align	1
	.global	main
	.type	main, @function
main:
	dec	$sp, 28
	ldi.l	$r0, 1098383360
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r1, 1075838976
	xor	$r2, $r2
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r1, 1075838976
	xor	$r2, $r2
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1089994752
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1081606144
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1073217536
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1102839808
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1094451200
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1086062592
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1077673984
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1081868288
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1084096512
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1086193664
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1088290816
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r0, 1090387968
	sto.l	-4($fp), $r0
	ldo.l	$r0, -4($fp)
	jsra	__extendsfdf2
	mov	$r2, $r0
	mov	$r3, $r1
	mov	$r1, $r2
	mov	$r2, $r3
	ldi.l	$r0, .LC0
	jsra	printf
	ldi.l	$r1, 1073741824
	xor	$r2, $r2
	ldi.l	$r0, .LC1
	jsra	printf
	ldi.l	$r1, 1081081856
	xor	$r2, $r2
	ldi.l	$r0, .LC1
	jsra	printf
	xor	$r0, $r0
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 8.0.1 20180305 (experimental)"
