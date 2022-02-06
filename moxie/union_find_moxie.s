	.file	"union_find.c"
	.text
	.local	id
	.comm	id,4,4
	.local	sz
	.comm	sz,4,4
	.p2align	1
	.global	UFinit
	.type	UFinit, @function
UFinit:
	dec	$sp, 28
	sto.l	12($fp), $r0
	ldo.l	$r1, 12($fp)
	ldi.l	$r0, 2
	mov	$r2, $r1
	ashl	$r2, $r0
	mov	$r0, $r2
	jsra	malloc
	sta.l	id, $r0
	ldo.l	$r1, 12($fp)
	ldi.l	$r0, 2
	mov	$r3, $r1
	ashl	$r3, $r0
	mov	$r0, $r3
	jsra	malloc
	sta.l	sz, $r0
	xor	$r0, $r0
	sto.l	-4($fp), $r0
	jmpa	.L2
.L3:
	lda.l	$r1, id
	ldo.l	$r2, -4($fp)
	ldi.l	$r0, 2
	mov	$r3, $r2
	ashl	$r3, $r0
	mov	$r0, $r3
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ldo.l	$r1, -4($fp)
	st.l	($r0), $r1
	lda.l	$r1, sz
	ldo.l	$r2, -4($fp)
	ldi.l	$r0, 2
	mov	$r3, $r2
	ashl	$r3, $r0
	mov	$r0, $r3
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ldi.l	$r1, 1
	st.l	($r0), $r1
	ldo.l	$r0, -4($fp)
	inc	$r0, 1
	sto.l	-4($fp), $r0
.L2:
	ldo.l	$r1, -4($fp)
	ldo.l	$r0, 12($fp)
	cmp	$r1, $r0
	blt	.L3
	nop
	ret
	.size	UFinit, .-UFinit
	.p2align	1
	.global	find
	.type	find, @function
find:
	dec	$sp, 4
	sto.l	12($fp), $r0
	ldo.l	$r0, 12($fp)
	sto.l	-4($fp), $r0
	jmpa	.L5
.L6:
	lda.l	$r1, id
	ldo.l	$r2, -4($fp)
	ldi.l	$r0, 2
	mov	$r3, $r2
	ashl	$r3, $r0
	mov	$r0, $r3
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ld.l	$r0, ($r0)
	sto.l	-4($fp), $r0
.L5:
	lda.l	$r1, id
	ldo.l	$r2, -4($fp)
	ldi.l	$r0, 2
	mov	$r3, $r2
	ashl	$r3, $r0
	mov	$r0, $r3
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ld.l	$r0, ($r0)
	ldo.l	$r1, -4($fp)
	cmp	$r1, $r0
	bne	.L6
	ldo.l	$r0, -4($fp)
	ret
	.size	find, .-find
	.p2align	1
	.global	UFfind
	.type	UFfind, @function
UFfind:
	push	$sp, $r6
	dec	$sp, 24
	sto.l	12($fp), $r0
	sto.l	16($fp), $r1
	ldo.l	$r0, 12($fp)
	jsra	find
	mov	$r6, $r0
	ldo.l	$r0, 16($fp)
	jsra	find
	mov	$r1, $r0
	ldi.b	$r0, 1
	cmp	$r6, $r1
	beq	.L9
	xor	$r0, $r0
.L9:
	zex.b	$r0, $r0
	mov	$r12, $fp
	dec	$r12, 4
	pop	$r12, $r6
	ret
	.size	UFfind, .-UFfind
	.p2align	1
	.global	UFunion
	.type	UFunion, @function
UFunion:
	dec	$sp, 32
	sto.l	12($fp), $r0
	sto.l	16($fp), $r1
	ldo.l	$r0, 12($fp)
	jsra	find
	sto.l	-4($fp), $r0
	ldo.l	$r0, 16($fp)
	jsra	find
	sto.l	-8($fp), $r0
	ldo.l	$r1, -4($fp)
	ldo.l	$r0, -8($fp)
	cmp	$r1, $r0
	beq	.L15
	lda.l	$r1, sz
	ldo.l	$r2, -4($fp)
	ldi.l	$r0, 2
	mov	$r3, $r2
	ashl	$r3, $r0
	mov	$r0, $r3
	mov	$r4, $r1
	add	$r4, $r0
	mov	$r0, $r4
	ld.l	$r1, ($r0)
	lda.l	$r2, sz
	ldo.l	$r3, -8($fp)
	ldi.l	$r0, 2
	mov	$r12, $r3
	ashl	$r12, $r0
	mov	$r0, $r12
	mov	$r3, $r2
	add	$r3, $r0
	mov	$r0, $r3
	ld.l	$r0, ($r0)
	cmp	$r1, $r0
	bge	.L14
	lda.l	$r1, id
	ldo.l	$r2, -4($fp)
	ldi.l	$r0, 2
	mov	$r4, $r2
	ashl	$r4, $r0
	mov	$r0, $r4
	mov	$r12, $r1
	add	$r12, $r0
	mov	$r0, $r12
	ldo.l	$r1, -8($fp)
	st.l	($r0), $r1
	lda.l	$r1, sz
	ldo.l	$r2, -8($fp)
	ldi.l	$r0, 2
	mov	$r3, $r2
	ashl	$r3, $r0
	mov	$r0, $r3
	mov	$r4, $r1
	add	$r4, $r0
	mov	$r0, $r4
	ld.l	$r2, ($r0)
	lda.l	$r1, sz
	ldo.l	$r3, -4($fp)
	ldi.l	$r0, 2
	mov	$r12, $r3
	ashl	$r12, $r0
	mov	$r0, $r12
	mov	$r3, $r1
	add	$r3, $r0
	mov	$r0, $r3
	ld.l	$r1, ($r0)
	lda.l	$r3, sz
	ldo.l	$r4, -8($fp)
	ldi.l	$r0, 2
	mov	$r12, $r4
	ashl	$r12, $r0
	mov	$r0, $r12
	mov	$r4, $r3
	add	$r4, $r0
	mov	$r0, $r4
	mov	$r12, $r2
	add	$r12, $r1
	mov	$r1, $r12
	st.l	($r0), $r1
	ret
.L14:
	lda.l	$r1, id
	ldo.l	$r2, -8($fp)
	ldi.l	$r0, 2
	mov	$r3, $r2
	ashl	$r3, $r0
	mov	$r0, $r3
	mov	$r4, $r1
	add	$r4, $r0
	mov	$r0, $r4
	ldo.l	$r1, -4($fp)
	st.l	($r0), $r1
	lda.l	$r1, sz
	ldo.l	$r2, -4($fp)
	ldi.l	$r0, 2
	mov	$r12, $r2
	ashl	$r12, $r0
	mov	$r0, $r12
	mov	$r2, $r1
	add	$r2, $r0
	mov	$r0, $r2
	ld.l	$r2, ($r0)
	lda.l	$r1, sz
	ldo.l	$r3, -8($fp)
	ldi.l	$r0, 2
	mov	$r4, $r3
	ashl	$r4, $r0
	mov	$r0, $r4
	mov	$r12, $r1
	add	$r12, $r0
	mov	$r0, $r12
	ld.l	$r1, ($r0)
	lda.l	$r3, sz
	ldo.l	$r4, -4($fp)
	ldi.l	$r0, 2
	mov	$r12, $r4
	ashl	$r12, $r0
	mov	$r0, $r12
	mov	$r4, $r3
	add	$r4, $r0
	mov	$r0, $r4
	mov	$r12, $r2
	add	$r12, $r1
	mov	$r1, $r12
	st.l	($r0), $r1
	ret
.L15:
	nop
	ret
	.size	UFunion, .-UFunion
	.ident	"GCC: (GNU) 8.3.0"
