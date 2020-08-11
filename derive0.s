	.file	"derive0.cpp"
	.text
	.section	.text._ZN4Base4showEv,"axG",@progbits,_ZN4Base4showEv,comdat
	.p2align	1
	.weak	_ZN4Base4showEv
	.type	_ZN4Base4showEv, @function
_ZN4Base4showEv:
.LFB0:
	sto.l	12($fp), $r0
	ldi.l	$r0, 10
	ret
.LFE0:
	.size	_ZN4Base4showEv, .-_ZN4Base4showEv
	.text
	.p2align	1
	.global	main
	.type	main, @function
main:
.LFB1:
	dec	$sp, 28
.LCFI0:
	mov	$r0, $fp
	dec	$r0, --1
	jsra	_ZN4Base4showEv
	nop
	ret
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.0.0 20180111 (experimental)"
