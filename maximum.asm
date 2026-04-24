# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	q: .asciiz "Enter number:\n"
    n: .asciiz "\n"
	m: .asciiz "Maximum: "

#Text Area (i.e. instructions/code directive)
.text

main:
    li $v0, 4
    la $a0, q
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, q
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, q
    syscall

    li $v0, 5
    syscall
    move $t2, $v0
	
	# check t0
	slt $t3, $t0, 0
	beq $t3, $zero, skip0
	sub $t0, $zero, $t0

	skip0:
	# check t1
	slt $t4, $t1, 0
	beq $t4, $zero, skip1
	sub $t1, $zero, $t1

	skip1:
	# check t2
	slt $t5, $t2, 0
	beq $t5, $zero, skip2
	sub $t2, $zero, $t2

	skip2:
	j check


check:
	bge $t0, $t1, ct0
	bge $t2, $t0, ct2
	j rt1

ct0:
	bge $t0, $t2, rt0
	j rt2

ct2:
	bge $t2, $t1, rt2
	j rt1

rt0:
	li $v0, 4
	la $a0, m
	syscall

	li $v0, 1
	move $a0, $t0
	syscall
	j exit

rt1:
	li $v0, 4
	la $a0, m
	syscall

	li $v0, 1
	move $a0, $t1
	syscall
	j exit

rt2:
	li $v0, 4
	la $a0, m
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	j exit

exit:
	li $v0, 10
	syscall

