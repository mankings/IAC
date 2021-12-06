main:
	li	$a0, 10
	li	$a1, 2
	jal	x_to_y
	move 	$t0, $v0
	
end:	li	$v0, 10
	syscall
	

x_to_y:
	beq	$a1, 0, return1
	#save in stack
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	addi	$a1, $a1, -1
	jal	x_to_y
	mul	$v0, $a0, $v0
	
	exit:	
		lw	$ra, 0($sp)
		addi	$sp, $sp, 4
		jr	$ra
		
	return1:
		li	$v0, 1
		jr	$ra