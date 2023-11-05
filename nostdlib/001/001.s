	.file	"001.c"
	.text
	.globl	strlen
	.type	strlen, @function
strlen:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L2
.L3:
	addl	$1, 8(%ebp)
	addl	$1, -4(%ebp)
.L2:
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L3
	movl	-4(%ebp), %eax
	leave
	ret
	.size	strlen, .-strlen
	.globl	print
	.type	print, @function
print:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	pushl	%eax
	call	strlen
	addl	$4, %esp
	movl	%eax, -4(%ebp)
#APP
# 15 "001.c" 1
	movl $4, %eax
# 0 "" 2
# 17 "001.c" 1
	movl $1, %ebx
# 0 "" 2
# 19 "001.c" 1
	movl 8(%ebp), %ecx
# 0 "" 2
# 24 "001.c" 1
	movl -4(%ebp), %edx
# 0 "" 2
# 29 "001.c" 1
	int $0x80
# 0 "" 2
#NO_APP
	nop
	leave
	ret
	.size	print, .-print
	.section	.rodata
.LC0:
	.string	"Hello, world!\n"
	.string	""
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$.LC0
	call	print
	addl	$4, %esp
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
