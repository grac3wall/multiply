#Programming 1
#1
#the program what.s takes the value of .word (5) and adds it to itself until its essentially been multiplied by itself.
#2 below
		.data	
arg:	.word	5

arg2:	.word 3

	.text
	.globl main
main:
	la	$t1, arg	#sets temporary register to the value of the address of .word
	lw	$t1, 0($t1)	#sets the temporary register to the value of .word (not the address)
	
	la 	$t2, arg2	#second multiplicand address
	lw	$s2, 0($t2)	#s2 set to second multiplicand value

	addi	$s3, $zero, 0	#saved value set to 0, to be added to until final result reached
	beqz	$t1, fin	#checks if  .word 's value is 0, ends if is
fori:
	add	$s3, $s3, $s2	#adds the value of .word to the preexisting value of s3 
	addi	$t1, $t1, -1	#subtracts the value that's compared when deciding to loop
	bnez	$t1, fori	#takes that t1  argument for this loop and checks if 0, exits loop if it is

fin:
	li	$v0, 10		#returns value of 10 - so syscall will terminate program below
	syscall			#ends program...

#the second argument is the number added to the total the number of times as iterated 
#by the seconf argument, only one is stored as a temp var and one as a saved 
#register in order to optimize the program essentialy 
