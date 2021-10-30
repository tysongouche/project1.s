.data 								#data section starts
	input: .space 11					#Reserve 11 bytes for input

.text 								#text section starts

main: 								#Main Section Starts
	li $v0, 8						#Load Read input command
	la $a0, input						#Mem Address from input is now destination MA
	li $a1, 11						#Setting length to be 11 bytes
	syscall
	
	li $t0, 0						#This register will be used for byte addressing
	
	li $t4, 0 						#Outerloop Counter
	li $t3, 0      						#Sum to print
	li $t5, 10						#Stop Case for outer loop (10)
	
	li $t6, 90						#Holds ASCII value of Z
	li $t7, 122						#Holds ASCII value of z
	li $t8, 9 						#Test case for 9_t

OUTER_LOOP:
	beq $t4, $t5, UNDER_LOOP				#LOOP COUNTER
	lbu $t1, input($t0)					#Load byte from input into t1 register
