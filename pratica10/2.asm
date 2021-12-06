.eqv	print_int, 1
.eqv	print_str, 4
	
	.data
str:	.asciiz	"abcdefgh"
result:	.asciiz	"Comprimento da string: "

	.text
	.globl	main
main:	
	la	$a0, str
	jal	strlen
	move	$t0, $v0
	la	$a0, result
	li	$v0, print_str
	syscall
	move	$a0, $t0
	li	$v0, print_int
	syscall
	li	$v0, 10
	syscall

strlen:	
	li	$t0, 0			#i = 0
	li	$v0, 0			#n = 0  -> n é o valor de retorno logo é alocado em $v0
lwh:	addu	$t1, $a0, $t0
	lb	$t2, ($t1)
	beq	$t2, '\0', lewh
	addi	$v0, $v0, 1		#n++
	addi	$t0, $t0, 1		#i++
	j	lwh
lewh:	jr	$ra