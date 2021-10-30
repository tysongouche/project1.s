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
