.eqv	print_int, 1
.eqv	print_str, 4
	
	.data
lista:	.word	4, 3, -2, 1, 27, 45
str:	.asciiz	"Conteudo do array: \n"
space:	.asciiz	" / "

	.text
	.globl	main
	
main:	la	$a0, str
	li	$v0, print_str
	syscall
	
	li	$t0, 0			#i = 0
	la	$t1, lista
for:	mul	$t4, $t0, 4
	addu	$t2, $t1, $t4
	lw	$a0, 0($t2)
	li	$v0, print_int
	syscall
	
	addi	$t0, $t0, 1		#i++
	beq	$t0, 6, end
	
	la	$a0, space
	li	$v0, print_str
	syscall
	
	j	for
end:	li	$v0, 10
	syscall
		
