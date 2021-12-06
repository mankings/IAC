.eqv	print_int, 1
.eqv	print_str, 4
.eqv	read_int, 5
.eqv	done, 10
	
	.data
prompt:	.asciiz	"Introduza um inteiro: "
end1:	.asciiz	"O factorial do número "
end2:	.asciiz " é "



	.text
	.globl	main
main:	la	$a0, prompt
	li	$v0, print_str
	syscall
	li	$v0, read_int
	syscall
	move	$a0, $v0
	move	$t2, $v0
	jal	fact
	move	$t0, $v0
	la	$a0, end1
	li	$v0, print_str
	syscall
	move	$a0, $t2
	li	$v0, print_int
	syscall
	la	$a0, end2
	li	$v0, print_str
	syscall
	move	$a0, $t0
	li	$v0, print_int
	syscall
	li	$v0, done
	syscall
	
fact:	move	$t0, $a0	#i = num
	li	$v0, 1		#res = 1
for:	mul	$v0, $v0, $t0
	#subi	$t0, $t0, 1	duas instruções
	addi	$t0, $t0, -1	#uma instrução
	bgt	$t0, $0, for
	jr	$ra
