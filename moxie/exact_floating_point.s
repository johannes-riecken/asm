	.file	"foo.c"
	.text
	.section	.rodata
.LC1:
	.string	"%f\n"
.LC16:
	.string	"%a\n"
	.text
	.globl	main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	subl	$16, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	flds	.LC0@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$4, %esp
	fldl	.LC2@GOTOFF(%ebx)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$4, %esp
	fldl	.LC2@GOTOFF(%ebx)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC3@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC4@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC5@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC6@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC7@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC8@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC9@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC10@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC11@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC12@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC13@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	flds	.LC14@GOTOFF(%ebx)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$4, %esp
	fldl	.LC15@GOTOFF(%ebx)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC16@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	subl	$4, %esp
	fldl	.LC17@GOTOFF(%ebx)
	leal	-8(%esp), %esp
	fstpl	(%esp)
	leal	.LC16@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	$0, %eax
	leal	-8(%ebp), %esp
	popl	%ecx
	popl	%ebx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1098383360
	.align 8
.LC2:
	.long	0
	.long	1075838976
	.align 4
.LC3:
	.long	1089994752
	.align 4
.LC4:
	.long	1081606144
	.align 4
.LC5:
	.long	1073217536
	.align 4
.LC6:
	.long	1102839808
	.align 4
.LC7:
	.long	1094451200
	.align 4
.LC8:
	.long	1086062592
	.align 4
.LC9:
	.long	1077673984
	.align 4
.LC10:
	.long	1081868288
	.align 4
.LC11:
	.long	1084096512
	.align 4
.LC12:
	.long	1086193664
	.align 4
.LC13:
	.long	1088290816
	.align 4
.LC14:
	.long	1090387968
	.align 8
.LC15:
	.long	0
	.long	1073741824
	.align 8
.LC17:
	.long	0
	.long	1081081856
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
	movl	(%esp), %ebx
	ret
	.ident	"GCC: (GNU) 7.3.1 20180406"
	.section	.note.GNU-stack,"",@progbits
