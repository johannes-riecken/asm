	.file	"001.c"
	.text
	.p2align	1
	.global	strlen
	.type	strlen, @function
strlen:
	dec	$sp, 4
	sto.l	12($fp), $r0
	xor	$r0, $r0
	sto.l	-4($fp), $r0
	jmpa	.L2
.L3:
	ldo.l	$r0, 12($fp)
	inc	$r0, 1
	sto.l	12($fp), $r0
	ldo.l	$r0, -4($fp)
	inc	$r0, 1
	sto.l	-4($fp), $r0
.L2:
	ldo.l	$r0, 12($fp)
	ld.b	$r0, ($r0)
	zex.b	$r1, $r0
	xor	$r0, $r0
	cmp	$r1, $r0
	bne	.L3
	ldo.l	$r0, -4($fp)
	ret
	.size	strlen, .-strlen
	.p2align	1
	.global	print
	.type	print, @function
print:
	dec	$sp, 28
	sto.l	12($fp), $r0
	ldo.l	$r0, 12($fp)
	jsra	strlen
	sto.l	-4($fp), $r0
# 15 "001.c" 1
	movl $4, %eax
# 0 "" 2
# 17 "001.c" 1
	movl $1, %ebx
# 0 "" 2
# 19 "001.c" 1
	movl 12($fp), %ecx
# 0 "" 2
# 24 "001.c" 1
	movl -4($fp), %edx
# 0 "" 2
# 29 "001.c" 1
	int $0x80
# 0 "" 2
	nop
	ret
	.size	print, .-print
	.section	.rodata
	.p2align	2
.LC0:
	.string	"Hello, world!\n"
	.string	""
	.text
	.p2align	1
	.global	main
	.type	main, @function
main:
	dec	$sp, 24
	ldi.l	$r0, .LC0
	jsra	print
	xor	$r0, $r0
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 8.0.0 20180111 (experimental)"
