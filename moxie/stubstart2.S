.globl _start

_start:
  call main
  movl %eax, %ebx;
  movl $1, %eax   #syscall number for SYS_exit
  int $0x80
