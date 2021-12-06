.eqv	print_str, 4
	
	.data
minus:	.asciiz	"texto em minusculas"
maius:	.space	20

	.text
	.globl	main
	
main:	la	$a0, minus
	la	$a1, maius
	
	li	$t0, 0			#i = 0
wh:	addu	$t1, $a0, $t0
	lb	$t2, 0($t1)
	beq	$t2, '\0', ewh		#end while if char is 0 (end of string)
	beq	$t2, ' ', skp		#dont subtract 32 if char is space
	addi	$t2, $t2, -32
skp:	addu	$t1, $a1, $t0
	sb	$t2, 0($t1)
	addi	$t0, $t0, 1
	j	wh
ewh:	move	$a0, $a1
	li	$v0, print_str
	syscall
	li	$v0, 10
	syscall
	