	.eqv done,10
	.eqv print_int10,1
	.eqv print_str,4
	.eqv read_int,5
	.eqv print_char,11
	#
	.eqv print_int16,34
	.eqv print_intu10,36
	#
	.data
str1: .asciiz "Introduza dois numeros: "
str2: .asciiz "A soma dos numeros e': "
###
	.text
	.globl main
# a ->$t0 ; b ->$t1
main:   la	$a0, str1
	li	$v0, print_str
	syscall
	#
	li	$v0, read_int
	syscall
	move	$t0, $v0
	#
	li	$v0, read_int
	syscall
	move	$t1, $v0
	#
	la	$a0, str2
	li	$v0, print_str
	syscall
	#
	add 	$a0, $t1, $t0
	#
	li 	$v0, print_int10
	syscall
	move	$t8, $a0
	#
	li	$a0, '\n'
	li	$v0, print_char
	syscall
	move	$a0, $t8
	li	$v0, print_intu10
	syscall
	li	$a0, '\n'
	li	$v0, print_char
	syscall
	move	$a0, $t8
	li	$v0, print_int16
	syscall
	#
	li	$v0, done #exit()
	syscall