.eqv	print_int, 1
.eqv	print_str, 4
.eqv	read_str, 8
.eqv	done, 10
	
	.data
prompt:	.asciiz	"Introduza uma string: "
result:	.asciiz	"Numero de carateres numericos: "
str:	.space	40

	.text
	.globl	main

main:	la	$a0, prompt
	li	$v0, print_str
	syscall
	la	$a0, str
	li	$a1, 40
	li	$v0, read_str
	syscall
	
	li	$t0, 0			#i = 0
	li	$t1, 0			#n = 0
for:	addu	$t2, $a0, $t0
	lb	$t3, 0($t2)
	beq	$t3, '\0', end		#end cycle if char is 0 (end of string)
	
	blt	$t3, '0', skp		#if less than 0 go skp
	bgt	$t3, '9', skp		#if more than 9 go skp
	add	$t1, $t1, 1		#n++
	
skp:	add	$t0, $t0, 1		#i++
	j	for
end:	la	$a0, result
	li	$v0, print_str
	syscall
	move	$a0, $t1
	li	$v0, print_int
	syscall
	li	$v0, done
	syscall
	