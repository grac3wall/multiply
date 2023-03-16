#Programming 1
#3 - advanced version
	.data	
arg:	.word	1

arg2:	.word 	1
	.text			#start of instructions
		
	.globl main
main:
	li $v0, 5 		# 5  sets syscall to read an integer value
	syscall
	
	la $t1, arg		#stores  value of arg2 into v1
	sw $v0, 0($t1) 		#saves value at arg to t1
	lw $t1, 0($t1)
	
	li $v0, 5
	syscall			#reads second arg from keyboard (using syscall code 5)
	la $t0, arg2		#loads address of arg2 into t4
	sw $v0, 0($t0)	
	lw $t0, 0($t0)

	addi	$s3, $zero, 0	#initializes saved register to 0
	beqz	$t1, fin	#checks if  .word 's value is 0, ends if is

fori:
	add	$s3, $s3, $t0	#adds the value of .word to the preexisting value of s3 
	addi	$t1, $t1, -1	#subtrats the value that's compared when deciding to loop
	bnez	$t1, fori	#takes that t1  argument for this loop and checks if 0, exits loop if it is

fin:
	li	$v0, 1		#display int code
	move 	$a0, $s3	
	syscall			#call for int display
	
	li	$v0, 10		#returns value of 10 - so syscall will terminate program below
	syscall			#ends program... (terminate code 10 above)


#li v0 10 provides the argument for the syscall.
