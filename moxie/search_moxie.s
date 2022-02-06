.LC0:
        .ascii  "./example.d"
example.linsearch(int[], int, int, int):
        push    $sp, $r6
        dec     $sp, 44
        mov     $r6, $r0
        sto.l   16($fp), $r1
        sto.l   20($fp), $r2
        sto.l   24($fp), $r3
        xor     $r0, $r0
        sto.l   -8($fp), $r0
        ldo.l   $r0, 20($fp)
        sto.l   -8($fp), $r0
.L6:
        ldo.l   $r1, -8($fp)
        ldo.l   $r0, 24($fp)
        cmp     $r1, $r0
        bgt     .L2
        ldo.l   $r1, 4($r6)
        ld.l    $r2, ($r6)
        ldo.l   $r0, -8($fp)
        cmp     $r2, $r0
        bgtu    .L3
        ldi.l   $r0, 11
        sto.l   -16($fp), $r0
        ldi.l   $r0, .LC0
        sto.l   -12($fp), $r0
        ldo.l   $r0, -16($fp)
        sto.l   -24($fp), $r0
        ldo.l   $r0, -12($fp)
        sto.l   -20($fp), $r0
        mov     $r0, $fp
        dec     $r0, --24
        ldi.l   $r1, 4
        jsra    _d_arraybounds
.L3:
        ldo.l   $r2, -8($fp)
        ldi.l   $r0, 2
        mov     $r3, $r2
        ashl    $r3, $r0
        mov     $r0, $r3
        mov     $r2, $r1
        add     $r2, $r0
        mov     $r0, $r2
        ld.l    $r0, ($r0)
        ldo.l   $r1, 16($fp)
        cmp     $r1, $r0
        bne     .L4
        ldo.l   $r0, -8($fp)
        jmpa    .L5
.L4:
        ldo.l   $r0, -8($fp)
        inc     $r0, 1
        sto.l   -8($fp), $r0
        jmpa    .L6
.L2:
        ldi.l   $r0, -1
.L5:
        mov     $r12, $fp
        dec     $r12, 4
        pop     $r12, $r6
        ret
example.binsearch(int[], int, int, int):
        push    $sp, $r6
        dec     $sp, 52
        mov     $r6, $r0
        sto.l   16($fp), $r1
        sto.l   20($fp), $r2
        sto.l   24($fp), $r3
.L15:
        ldo.l   $r1, 24($fp)
        ldo.l   $r0, 20($fp)
        cmp     $r1, $r0
        blt     .L8
        ldo.l   $r1, 20($fp)
        ldo.l   $r0, 24($fp)
        mov     $r2, $r1
        add     $r2, $r0
        mov     $r0, $r2
        ldi.l   $r1, 31
        mov     $r3, $r0
        lshr    $r3, $r1
        mov     $r1, $r3
        add     $r1, $r0
        ldi.l   $r0, 1
        mov     $r2, $r1
        ashr    $r2, $r0
        mov     $r0, $r2
        sto.l   -8($fp), $r0
        ldo.l   $r1, 4($r6)
        ld.l    $r2, ($r6)
        ldo.l   $r0, -8($fp)
        cmp     $r2, $r0
        bgtu    .L9
        ldi.l   $r0, 11
        sto.l   -24($fp), $r0
        ldi.l   $r0, .LC0
        sto.l   -20($fp), $r0
        ldo.l   $r0, -24($fp)
        sto.l   -32($fp), $r0
        ldo.l   $r0, -20($fp)
        sto.l   -28($fp), $r0
        mov     $r0, $fp
        dec     $r0, --32
        ldi.l   $r1, 12
        jsra    _d_arraybounds
.L9:
        ldo.l   $r2, -8($fp)
        ldi.l   $r0, 2
        mov     $r3, $r2
        ashl    $r3, $r0
        mov     $r0, $r3
        mov     $r2, $r1
        add     $r2, $r0
        mov     $r0, $r2
        ld.l    $r0, ($r0)
        ldo.l   $r1, 16($fp)
        cmp     $r1, $r0
        bne     .L10
        ldo.l   $r0, -8($fp)
        jmpa    .L11
.L10:
        ldo.l   $r1, 4($r6)
        ld.l    $r2, ($r6)
        ldo.l   $r0, -8($fp)
        cmp     $r2, $r0
        bgtu    .L12
        ldi.l   $r0, 11
        sto.l   -16($fp), $r0
        ldi.l   $r0, .LC0
        sto.l   -12($fp), $r0
        ldo.l   $r0, -16($fp)
        sto.l   -32($fp), $r0
        ldo.l   $r0, -12($fp)
        sto.l   -28($fp), $r0
        mov     $r0, $fp
        dec     $r0, --32
        ldi.l   $r1, 13
        jsra    _d_arraybounds
.L12:
        ldo.l   $r2, -8($fp)
        ldi.l   $r0, 2
        mov     $r3, $r2
        ashl    $r3, $r0
        mov     $r0, $r3
        mov     $r2, $r1
        add     $r2, $r0
        mov     $r0, $r2
        ld.l    $r0, ($r0)
        ldo.l   $r1, 16($fp)
        cmp     $r1, $r0
        bge     .L13
        ldo.l   $r0, -8($fp)
        dec     $r0, --1
        sto.l   24($fp), $r0
        jmpa    .L15
.L13:
        ldo.l   $r0, -8($fp)
        inc     $r0, 1
        sto.l   20($fp), $r0
        jmpa    .L15
.L8:
        ldi.l   $r0, -1
.L11:
        mov     $r12, $fp
        dec     $r12, 4
        pop     $r12, $r6
        ret
