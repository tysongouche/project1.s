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
	beq $t1, $t6, Z_test					#Test if current byte = Z
	beq $t1, $t7, z_test					#Test if current byte = z
	
	slti, $t9, $t1, 0					#Test if current byte < 0
	bne $t9, $zero, z_t
	
	slti, $t9, $t1, 9 					#Test if current byte > 9
	bne $t9, $zero, n_t
	
	addi $t9, $zero, 97					#Test if current byte is maybe lowercase
	bge $t1, $t9, lc_add
	
	addi $t9, $zero, 65					#Test if current byte is upper
	bge $t1, $t9, uc_add
	
	addi $t9, $zero, 48					#Test if current byte is num
	bge $t1, $t9, num_add
	
	addi $t0, $t0, 1 					#If byte is too low, reaches here
	addi $t4, $t4, 1
	j OUTER_LOOP


UNDER_LOOP:
	li $v0, 11						#Print a newline
	li $a0, 13
	syscall
	li $v0, 1  						#Print Sum
	addi $a0, $t3, 0
	syscall
	li $v0, 10						#Program Ends
	syscall
	
	
#All of the test cases
lc_add:								#Add to the final sum for lower case
		
	
