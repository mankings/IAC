	.eqv done,10
	.eqv print_str,4
	.eqv read_int,5
	
	.data
prompt:	.asciiz "Introduza um numer\n"
strpar: .asciiz "O numero é par\n"
strimp: .asciiz "O numero é ímpar\n"

	.text
	.globl main
main:	la 	$a0, prompt
	li 	$v0, print_str
	syscall
	
	li 	$v0, read_int #a = read_int()
	syscall
	
	andi 	$t0, $v0, 1 #a && 1
	bne 	$t0, $0, impar #if ((a && 1) != 0) goto impar
	la 	$a0, strpar
	j 	print
impar:	la 	$a0, strimp
print:	li 	$v0, print_str
	syscall
	
	li 	$v0, done # exit()
	syscall
