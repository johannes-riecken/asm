	.text
	.p2align 1
	.global __moxie_exception_handler
__moxie_exception_handler:
	
	/* Create return frame on current stack.  We'll fill the
	return address in later. */
	dec   $sp, 12
	st.l  ($sp), $fp

	/* Save all general purpose registers.  */
	mov   $fp, $sp
	push  $sp, $r13
	push  $sp, $r12
	push  $sp, $r11
	push  $sp, $r10
	push  $sp, $r9
	push  $sp, $r8
	push  $sp, $r7
	push  $sp, $r6
	push  $sp, $r5
	push  $sp, $r4
	push  $sp, $r3
	push  $sp, $r2
	push  $sp, $r1
	push  $sp, $r0

	/* Get our handler parameters ...
	   (*handler)(fault_address, fault_type, fault_code) */
	gsr   $r0, 5
	gsr   $r1, 2
	gsr   $r2, 3
	
	jsra __handle_exception

	/* Insert the return address in our call frame.  */
	sto.l 4($fp), $r0

	/* Re-enable exceptions */
	ldi.l $r4, 0x1
	gsr   $r3, 0
	or    $r3, $r4
	ssr   $r3, 0

	mov   $r0, $fp
	dec   $r0, 14*4
	mov   $sp, $r0

	/* Restore all general purpose registers.  */

	pop   $sp, $r0
	pop   $sp, $r1
	pop   $sp, $r2
	pop   $sp, $r3
	pop   $sp, $r4
	pop   $sp, $r5
	pop   $sp, $r6
	pop   $sp, $r7
	pop   $sp, $r8
	pop   $sp, $r9
	pop   $sp, $r10
	pop   $sp, $r11
	pop   $sp, $r12
	pop   $sp, $r13
	
	ret
