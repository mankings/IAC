.eqv	SIZE, 6
.eqv	TRUE, 1
.eqv	FALSE, 0

.eqv	print_int, 1
.eqv	print_str, 4
.eqv	read_int, 5

	.data
array:	.space	24
prompt:	.asciiz	"Insira 6 numeros:\n"
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
	addi	$t0, $t0, 1			#i++
	beq	$t0, SIZE, do
	j	store
do:	li	$t0, FALSE			#houveTroca = FALSE
	li	$t1, 0				#i = 0
	la	$t2, array
for:	mul	$t3, $t1, 4
	addu	$t4, $t2, $t3
	lw	$t5, ($t4)			#$t5 = array[i]
	addi	$t3, $t1, 1
#	mul	$t3, $t3, 4
	sll	$t3, $t3, 2
	addu	$t4, $t2, $t3
	lw	$t6, ($t4)			#$t6 = array[i+1]
	ble	$t5, $t6, ifnot
	sw	$t5, ($t4)
#	mul	$t3, $t1, 4
	sll	$t3, $t1, 2
	addu	$t4, $t2, $t3
	sw	$t6, ($t4)
	li	$t0, TRUE
ifnot:	li	$t3, SIZE
	subi	$t3, $t3, 1
	addi	$t1, $t1, 1			#i++
	bge	$t1, $t3, while
	j	for
while:	beq	$t0, FALSE, ewhile
	j	do
ewhile:	li	$t0, 0				#i = 0
	la	$t1, array
print:	sll	$t2, $t0, 2			#print cycle to print words from the array
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
