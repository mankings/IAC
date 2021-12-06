	.eqv print_int, 1
	.eqv print_str,4
	.eqv read_int,5
	.eqv done,10
	
	.data
prompt:	.asciiz "Introduza um numero: "
char:	.asciiz "-"

	.text
	.globl main
main:	la	$a0, prompt
	li	$v0, print_str
	syscall
	
	li	$v0, read_int
	syscall
	move	$t1, $v0
	
	li	$t0, 0
	
for:	bge	$t0, $t1, exit
	addi	$t0, $t0, 1
	la	$a0, char
	li	$v0, print_str
	syscall
	j	for

exit:	li	$v0, done
	syscall	
