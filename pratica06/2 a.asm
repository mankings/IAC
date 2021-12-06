	.text
	.globl main
main: 
	ori $t0,$0,0x12345678
	#
	sll $t2,$t0,1
	srl $t3,$t0,1
	sra $t4,$t0,1
	#
	sll $t2,$t0,4
	srl $t3,$t0,4
	sra $t4,$t0,4
	#
	sll $t2,$t0,16
	srl $t3,$t0,16
	sra $t4,$t0,16
	#
	ori $t0,$0,0x862A5C1B
	#
	sll $t2,$t0,2
	srl $t3,$t0,2
	sra $t4,$t0,2
	#
	sll $t2,$t0,4
	srl $t3,$t0,4
	sra $t4,$t0,4
	
	jr $ra