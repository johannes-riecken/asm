.text
.globl _start

_start:
    mov $1, %rax
    mov $1, %rdi
    mov $msg, %rsi
    mov $14, %rdx
    syscall

    mov $60, %rax
    mov $0, %rdi
    syscall

.data
msg:
.ascii "Hello, world!\n"
