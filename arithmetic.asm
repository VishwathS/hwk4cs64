# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 64*( a - 4*b) + 9*c using only one mult instruction
# 3. Print out the result

.text
main:
	# inputs
	li $v0, 5
	syscall
	move $t0, $v0 # t0 = a

	li $v0, 5
	syscall
	move $t1, $v0 # t1 = b

	li $v0, 5
	syscall
	move $t2, $v0 # t2 = c

	sll $t3, $t1, 2
	sub $t4, $t0, $t3

	li $t5, 9
	mult $t5, $t2
	mflo $t5

	sll $t4, $t4, 6
	add $t6, $t4, $t5

	# Print
	li $v0, 1
	move $a0, $t6
	syscall

exit:
	li $v0, 10
	syscall
