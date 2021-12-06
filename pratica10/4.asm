.macro print_int10
	li	$v0, 1
	syscall
.end_macro

.macro	print_str
	li	$v0, 4
	syscall
.end_macro

.macro	read_str
	li	$v0, 8
	syscall
.end_macro

	.data
frase1:	.space 20
frase2: .space 20
frase3:	.space 20
p1:	.asciiz "\nInsira a frase1: "
p2:	.asciiz	"\nInsira a frase2: "
p3:	.asciiz "\nO número de caracteres da frase1 é: "
p4:	.asciiz "\nA frase concatenada é: "
line:	.asciiz	"\n"

	.text
	.globl	main
main:
	la	$a0, p1
	print_str
	la	$a0, frase1
	li	$a1, 20
	read_str
	
	la	$a0, p2
	print_str
	la	$a0, frase2
	li	$a1, 20
	read_str
	
	la	$a0, p3
	print_str
	la	$a0, frase1
	jal	strlen
	move	$a0, $v0
	print_int10
	
	la	$a0, frase3
	la	$a1, frase1
	jal	strcopy
	la	$a0, frase3
	la	$a1, frase2
	jal	strcat
	
	la	$a0, p4
	print_str
	la	$a0, frase3
	print_str
	
	li	$v0, 10
	syscall
	
strlen:	
	li	$t0, 0			#i = 0
	li	$v0, 0			#n = 0  -> n é o valor de retorno logo é alocado em $v0
lwh:	addu	$t1, $a0, $t0
	lb	$t2, ($t1)
	beq	$t2, '\0', lewh
	addi	$v0, $v0, 1		#n++
	addi	$t0, $t0, 1		#i++
	j	lwh
lewh:	jr	$ra

strcopy:
	li	$t0, 0			#i = 0
cwh:	addu	$t1, $a0, $t0
	addu	$t2, $a1, $t0
	lb	$t3, ($t2)
	beq	$t3, '\0', cewh
	sb	$t3, ($t1)
	addi	$t0, $t0, 1
	j	cwh
cewh:	sb	$t3, ($t1)
	jr	$ra

strcat:					#funçao nao terminal pois invoca outra funçao, logo é preciso guardar valores na stack/registos $s
	addiu	$sp, $sp, -8		#alocate space for $ra and dst
	sw	$ra, 0($sp)		#save $ra to stack
	sw	$a0, 4($sp)		#save dst to stack
jwh:	lb	$t0, ($a0)
	beq	$t0, '\0', jewh
	addu	$a0, $a0, 1
	j	jwh
jewh:	jal	strcopy
	lw	$ra, 0($sp)		#restore $ra
	lw	$v0, 4($sp)		#restore dst
	addiu	$sp, $sp, 8		#restore stack
	jr	$ra
