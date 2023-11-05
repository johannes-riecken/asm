.global _start
.ent    _start 
_start:
# main:   
# addiu $sp, $zero, 1600 #default SP to 1600
# beq1:	addiu   $t0, $0, 1
# 	addiu   $t1, $0, 1
# 	addiu	$t2, $0, 1
# 	beq	$t0, $t1, beq1d
# 	addiu	$t2, $t2, 1
# beq1d:	addiu	$t2, $t2, 1		# $t2 = 2
	
# beq2:	addiu   $t0, $0, 0
# 	addiu   $t1, $0, 1
# 	addiu	$t2, $0, 1
# 	beq	$t0, $t1, beq2d
# 	addiu	$t2, $t2, 1
# beq2d:	addiu	$t2, $t2, 1		# $t2 = 3

# End the program	
# ori   $v0, $zero, 10
# syscall
.end _start
