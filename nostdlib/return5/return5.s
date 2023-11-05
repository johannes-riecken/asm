        .text
        .globl _start
_start:
        mov $1, %eax
        mov $5, %ebx
int $0x80
