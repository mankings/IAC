	.eqv print_int, 1
	.eqv print_str, 4
	.eqv read_int, 5
	.eqv done, 10
	.eqv print_int16, 34
	
	.data
prompt:	.asciiz "Introduza um número: "
result: .asciiz "Dígitos em hexa são:\n"
brklne:	.asciiz "\n"

	.text
	.globl main
main:	la	$a0, prompt
	li	$v0, print_str
	syscall
	
	li	$v0, read_int
	syscall
	move	$t2, $v0
	
	la	$a0, result
	li	$v0, print_str
	syscall
	
	li	$t1, 0 #n = 0
for:	bge	$t1, 8, end
	
	andi	$t0, $t2, 0xF0000000
	srl	$a0, $t0, 28
	li	$v0, print_int16
	syscall
	
	la	$a0, brklne
	li	$v0, print_str
	syscall
	
	sll	$t2, $t2, 4
	
	addi	$t1, $t1, 1
	j	for
	
end:	li	$v0, done
	syscall