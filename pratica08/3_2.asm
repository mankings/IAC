.eqv	print_str, 4
.eqv	read_int, 5
.eqv	print_int, 1

	.data
array:	.space	24
prompt:	.asciiz	"Insira 6 números: \n"
space:	.asciiz " / "

	.text
	.globl	main
main:	la	$a0, prompt
	li	$v0, print_str
	syscall
	
	li	$t0, 0				#i = 0
	la	$t1, array
store:	mul	$t2, $t0, 4			#for cycle to store words into the array
	addu	$t3, $t1, $t2
	li	$v0, read_int
	syscall
	sw	$v0, ($t3)
	addi	$t0, $t0, 1
	beq	$t0, 6, estore
	j	store
estore:	li	$t0, 0			#i = 0
	la	$t1, array
print:	mul	$t2, $t0, 4			#print cycle to print words from the array
	addu	$t3, $t1, $t2
	lw	$a0, ($t3)
	li	$v0, print_int
	syscall
	
	addi	$t0, $t0, 1			#i++
	beq	$t0, 6, end
	
	la	$a0, space
	li	$v0, print_str
	syscall
	
	j	print
end:	li	$v0, 10
	syscall
