	.file	"stack.c"
	.text
	.section	.rodata
.LC0:
	.string	"Goodbye, World!"
	.text
	.globl	bar
	.type	bar, @function
bar:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	leal	.LC0@GOTOFF(%eax), %eax
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	leave
	ret
	.size	bar, .-bar
	.globl	foo
	.type	foo, @function
foo:
	pushl	%ebp
	movl	%esp, %ebp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	pushl	8(%ebp)
	pushl	8(%ebp)
	call	bar
	addl	$8, %esp
	leave
	ret
	.size	foo, .-foo
	.globl	foo1
	.type	foo1, @function
foo1:
	pushl	%ebp
	movl	%esp, %ebp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	pushl	$5
	call	foo
	addl	$4, %esp
	leave
	ret
	.size	foo1, .-foo1
	.section	.rodata
.LC1:
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
	leal	.LC1@GOTOFF(%eax), %eax
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
