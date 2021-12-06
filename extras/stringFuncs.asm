.eqv	print_str, 4

	.data
dst:	.space	16
src:	.asciiz	"abcdefgh"

	
	.text
	.globl	main
main:	la	$a0, src
	la	$a1, dst
	jal	strcopy
	la	$a0, dst
	li	$v0, print_str
	syscall
	li	$v0, 10
	syscall
	
strlen:	
	li	$t0, 0			#i = 0
	li	$v0, 0			#n = 0  -> n é o valor de retorno logo é alocado em $v0
	la	$a1, str
lwh:	addu	$t1, $a1, $t0
	lb	$t2, ($t1)
	beq	$t2, '\0', lewh
	addi	$v0, $v0, 1		#n++
	addi	$t0, $t0, 1		#i++
	j	lwh
lewh:	jr	$ra	
	
strcopy:
	li	$t0, 0			#i = 0
cwh:	addu	$t1, $a0, $t0
	addu	$t2, $a1, $t0
	lb	$t3, ($t1)
	beq	$t3, '\0', cewh
	sb	$t3, ($t2)
	addi	$t0, $t0, 1
	j	cwh
cewh:	sb	$t3, ($t2)
	jr	$ra

strcat:
	li	$t0, 0			#i = 0
