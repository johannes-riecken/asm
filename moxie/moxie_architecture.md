Calling convention
==================

We don't have an over-abundance of registers, so for now we're only going to pass the first two 32-bits of function arguments in registers $r0 and $r1 and the rest will go on the stack. Integral values smaller than 32-bits will be promoted to 32-bits. Scalar return values will go in $r0 (and $r1 if required).

Instructions
============

jsra performs the following actions:

push the return address (next instruction) on the stack
push $fp on the stack
set $pc to target address

ret does the opposite...

pop the old frame pointer into $fp
pop the return address into $pc

Pretty simple! Keep in mind, however, that this isn't nearly enough support for proper function calls. We still need to save callee saved registers on the stack and allocate space for local variables. Let's do that later when we actually have instructions for writing to memory. We'll just avoid using local variables for now.

Latent argument pointer register ?ap and second frame pointer ?fp get replaced
with $fp and $sp by calculating their difference. 

push $sp, $r2 decrements $sp by 4 and saves $r2 to its memory location.

add.l $r1, $r2, $r3 does $r1 = $r2 + $r3

