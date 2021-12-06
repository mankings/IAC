	.eqv print_int, 1
	.eqv print_str,4
	.eqv read_int,5
	.eqv done,10
	
	.data
prompt:	.asciiz "Introduza um número: "
result:	.asciiz "Factorial: "

	.text
	.globl main
main:	la	$a0, prompt
	li	$v0, print_str
	syscall
	
	li	$v0, read_int
	syscall
	move	$t0, $v0
	
	li	$t1, 1		#$t1 = 1
	move	$t2, $v0	#$t2 = $t0 = read_int
for:	ble	$t2, 0, end
	mul	$t1, $t1, $t2
	subi	$t2, $t2, 1
	j	for
	
end:	la	$a0, result
	li	$v0, print_str
	syscall
	move	$a0, $t1
	li	$v0, print_int
	syscall

	li	$v0, done
	syscall