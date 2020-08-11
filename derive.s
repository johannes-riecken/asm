	.file	"derive.cpp"
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
	.section	.text._ZN7Derived4showEv,"axG",@progbits,_ZN7Derived4showEv,comdat
	.p2align	1
	.weak	_ZN7Derived4showEv
	.type	_ZN7Derived4showEv, @function
_ZN7Derived4showEv:
.LFB1:
	sto.l	12($fp), $r0
	ldi.l	$r0, 20
	ret
.LFE1:
	.size	_ZN7Derived4showEv, .-_ZN7Derived4showEv
	.section	.text._ZN4BaseC2Ev,"axG",@progbits,_ZN4BaseC5Ev,comdat
	.p2align	1
	.weak	_ZN4BaseC2Ev
	.type	_ZN4BaseC2Ev, @function
_ZN4BaseC2Ev:
.LFB5:
	sto.l	12($fp), $r0
	ldi.l	$r1, _ZTV4Base+8
	ldo.l	$r0, 12($fp)
	st.l	($r0), $r1
	nop
	ret
.LFE5:
	.size	_ZN4BaseC2Ev, .-_ZN4BaseC2Ev
	.weak	_ZN4BaseC1Ev
	.set	_ZN4BaseC1Ev,_ZN4BaseC2Ev
	.section	.text._ZN7DerivedC2Ev,"axG",@progbits,_ZN7DerivedC5Ev,comdat
	.p2align	1
	.weak	_ZN7DerivedC2Ev
	.type	_ZN7DerivedC2Ev, @function
_ZN7DerivedC2Ev:
.LFB7:
	dec	$sp, 24
.LCFI0:
	sto.l	12($fp), $r0
	ldo.l	$r0, 12($fp)
	jsra	_ZN4BaseC2Ev
	ldi.l	$r1, _ZTV7Derived+8
	ldo.l	$r0, 12($fp)
	st.l	($r0), $r1
	nop
	ret
.LFE7:
	.size	_ZN7DerivedC2Ev, .-_ZN7DerivedC2Ev
	.weak	_ZN7DerivedC1Ev
	.set	_ZN7DerivedC1Ev,_ZN7DerivedC2Ev
	.text
	.p2align	1
	.global	main
	.type	main, @function
main:
.LFB2:
	push	$sp, $r6
.LCFI1:
	dec	$sp, 28
.LCFI2:
	ldi.l	$r0, 4
	jsra	_Znwj
	mov	$r6, $r0
	mov	$r0, $r6
	jsra	_ZN7DerivedC1Ev
	sto.l	-8($fp), $r6
	ldo.l	$r0, -8($fp)
	ld.l	$r0, ($r0)
	ld.l	$r1, ($r0)
	ldo.l	$r0, -8($fp)
	jsr	$r1
	xor	$r0, $r0
	mov	$r12, $fp
	dec	$r12, 4
	pop	$r12, $r6
	ret
.LFE2:
	.size	main, .-main
	.weak	_ZTV7Derived
	.section	.rodata._ZTV7Derived,"aG",@progbits,_ZTV7Derived,comdat
	.p2align	2
	.type	_ZTV7Derived, @object
	.size	_ZTV7Derived, 12
_ZTV7Derived:
	.long	0
	.long	_ZTI7Derived
	.long	_ZN7Derived4showEv
	.weak	_ZTV4Base
	.section	.rodata._ZTV4Base,"aG",@progbits,_ZTV4Base,comdat
	.p2align	2
	.type	_ZTV4Base, @object
	.size	_ZTV4Base, 12
_ZTV4Base:
	.long	0
	.long	_ZTI4Base
	.long	_ZN4Base4showEv
	.weak	_ZTI7Derived
	.section	.rodata._ZTI7Derived,"aG",@progbits,_ZTI7Derived,comdat
	.p2align	2
	.type	_ZTI7Derived, @object
	.size	_ZTI7Derived, 12
_ZTI7Derived:
	.long	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.long	_ZTS7Derived
	.long	_ZTI4Base
	.weak	_ZTS7Derived
	.section	.rodata._ZTS7Derived,"aG",@progbits,_ZTS7Derived,comdat
	.p2align	2
	.type	_ZTS7Derived, @object
	.size	_ZTS7Derived, 9
_ZTS7Derived:
	.string	"7Derived"
	.weak	_ZTI4Base
	.section	.rodata._ZTI4Base,"aG",@progbits,_ZTI4Base,comdat
	.p2align	2
	.type	_ZTI4Base, @object
	.size	_ZTI4Base, 8
_ZTI4Base:
	.long	_ZTVN10__cxxabiv117__class_type_infoE+8
	.long	_ZTS4Base
	.weak	_ZTS4Base
	.section	.rodata._ZTS4Base,"aG",@progbits,_ZTS4Base,comdat
	.p2align	2
	.type	_ZTS4Base, @object
	.size	_ZTS4Base, 6
_ZTS4Base:
	.string	"4Base"
	.section	.eh_frame,"aw",@progbits
.Lframe1:
	.4byte	.LECIE1-.LSCIE1
.LSCIE1:
	.4byte	0
	.byte	0x3
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0x14
	.byte	0xc
	.uleb128 0x1
	.uleb128 0
	.byte	0x11
	.uleb128 0x14
	.sleb128 -1
	.p2align	2
.LECIE1:
.LSFDE1:
	.4byte	.LEFDE1-.LASFDE1
.LASFDE1:
	.4byte	.LASFDE1-.Lframe1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI1-.LFB2
	.byte	0xe
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x20
	.p2align	2
.LEFDE1:
	.ident	"GCC: (GNU) 8.0.0 20180111 (experimental)"
