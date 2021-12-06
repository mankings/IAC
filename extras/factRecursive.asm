	.data
msg:	.asciiz "Insira um numero <= 12: "
fres:	.asciiz "O factorial e: "

	.text
	.globl	main
main:	li	$v0, 4
	la	$a0, msg
	syscall
	li	$v0, 8
	syscall
	move	$t0, $v0
	li	$v0, 4
	la	$a0, fres
	syscall
	
	move	$a0, $t0
	jal	fact
	
	move	$a0, $v0
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall

fact:	ble	$a0, 1, return1
	addiu	$ra, $ra, -4
	sw	$ra, 0($sp)
	
	addiu	$a0, $a0, -1
	jal	fact
	mul	$v0, $v0, $a0
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr	$ra
	
	return1:
		li	$v0, 1
		jr	$ra