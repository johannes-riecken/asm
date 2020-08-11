	.file	"hello_serial.c"
	.text
	.globl	_write
	.type	_write, @function
_write:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	$0, -4(%ebp)
	jmp	.L2
.L3:
	movl	-4(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -4(%ebp)
	movl	%eax, %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	$1016, %edx
	movzbl	(%eax), %eax
	movb	%al, (%edx)
.L2:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L3
	movl	16(%ebp), %eax
	leave
	ret
	.size	_write, .-_write
	.section	.rodata
.LC0:
	.string	"Hello World!"
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
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	subl	$12, %esp
	leal	.LC0@GOTOFF(%eax), %edx
	pushl	%edx
	movl	%eax, %ebx
	call	puts@PLT
	addl	$16, %esp
	movl	$0, %eax
	leal	-8(%ebp), %esp
	popl	%ecx
	popl	%ebx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	movl	(%esp), %eax
	ret
	.ident	"GCC: (GNU) 7.3.1 20180406"
	.section	.note.GNU-stack,"",@progbits
