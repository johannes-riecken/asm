	.file	"eval.c"
	.text
	.comm	a,4,4
	.comm	i,4,4
	.p2align	1
	.global	eval
	.type	eval, @function
eval:
	push	$sp, $r6
	dec	$sp, 28
	xor	$r0, $r0
	sto.l	-8($fp), $r0
	jmpa	.L2
.L3:
	lda.l	$r0, i
	inc	$r0, 1
	sta.l	i, $r0
.L2:
	lda.l	$r1, a
	lda.l	$r0, i
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ld.b	$r0, ($r0)
	zex.b	$r1, $r0
	ldi.l	$r0, 32
	cmp	$r1, $r0
	beq	.L3
	lda.l	$r1, a
	lda.l	$r0, i
	mov	$r3, $r1
	add	$r3, $r0
	mov	$r0, $r3
	ld.b	$r0, ($r0)
	zex.b	$r1, $r0
	ldi.l	$r0, 43
	cmp	$r1, $r0
	bne	.L4
	lda.l	$r0, i
	inc	$r0, 1
	sta.l	i, $r0
	jsra	eval
	mov	$r6, $r0
	jsra	eval
	mov	$r1, $r6
	add	$r1, $r0
	mov	$r0, $r1
	jmpa	.L5
.L4:
	lda.l	$r1, a
	lda.l	$r0, i
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ld.b	$r0, ($r0)
	zex.b	$r1, $r0
	ldi.l	$r0, 42
	cmp	$r1, $r0
	bne	.L7
	lda.l	$r0, i
	inc	$r0, 1
	sta.l	i, $r0
	jsra	eval
	mov	$r6, $r0
	jsra	eval
	mov	$r3, $r6
	mul	$r3, $r0
	mov	$r0, $r3
	jmpa	.L5
.L9:
	ldo.l	$r1, -8($fp)
	mov	$r0, $r1
	ldi.l	$r2, 2
	ashl	$r0, $r2
	add	$r0, $r1
	add	$r0, $r0
	mov	$r1, $r0
	lda.l	$r2, a
	lda.l	$r0, i
	mov	$r3, $r0
	inc	$r3, 1
	sta.l	i, $r3
	mov	$r3, $r2
	add	$r3, $r0
	mov	$r0, $r3
	ld.b	$r0, ($r0)
	zex.b	$r0, $r0
	dec	$r0, --48
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	sto.l	-8($fp), $r0
.L7:
	lda.l	$r1, a
	lda.l	$r0, i
	mov	$r3, $r1
	add	$r3, $r0
	mov	$r0, $r3
	ld.b	$r0, ($r0)
	zex.b	$r1, $r0
	ldi.l	$r0, 47
	cmp	$r1, $r0
	bleu	.L8
	lda.l	$r1, a
	lda.l	$r0, i
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ld.b	$r0, ($r0)
	zex.b	$r1, $r0
	ldi.l	$r0, 57
	cmp	$r1, $r0
	bleu	.L9
.L8:
	ldo.l	$r0, -8($fp)
.L5:
	mov	$r12, $fp
	dec	$r12, 4
	pop	$r12, $r6
	ret
	.size	eval, .-eval
	.ident	"GCC: (GNU) 8.3.0"
