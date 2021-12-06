.eqv	SIZE, 8
	
	.data
nums:	.word	-2, 126, 6, 8, 5087, -3046, -131, 17
msg: 	.asciiz	"O Minimo e: "

	.text
	.globl	main
main:	li	$t0, 0x7fffffff		#int min = 0x7fffffff
	li	$t1, 0			#int i = 0
	la	$a0, nums
for:	bge	$t1, SIZE, efor
	mul	$t2, $t1, 4
	addu	$t3, $a0, $t2
	lw	$t4, ($t3)		#val = nums[i]
	bge	$t4, $t0, skip
	move 	$t0, $t4
skip:	addi	$t1, $t1, 1
	j	for
efor:	li	$v0, 4
	la	$a0, msg
	syscall
	li	$v0, 1
	move	$a0, $t0
	syscall
	li	$v0, 10			
	syscall
	
