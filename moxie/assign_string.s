	.file	"hello.c"
	.text
	.section	.rodata
.LC0:
	.string	"Hello, World!"
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	leal	.LC0@GOTOFF(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	$0, %eax
	leave
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
