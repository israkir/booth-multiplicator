#############################################################################
#
# Program Name		: booth.asm
# Author		: Hakki Caner KIRMIZI
# Description		: Booth Algorithm implementation in MIPS
# Environment		: Windows-7 Entreprise
# Simulator		: MARS 3.8 (MIPS Assembler and Runtime Simulator)
# Version Control	: TortoiseSVN 1.6.7, Build 18415 - 32 Bit
# Project Hosting	: https://code.google.com/p/mips-booth-multiplication/
#
#############################################################################


# ====== DATA SEGMENT ====== #
	.data

# String variables
str_please_enter_int:	.asciiz "Please enter an integer: "
str_you_entered_int:	.asciiz "You entered: "

# Syscall variables
sys_print_int:		.word 1
sys_print_string:	.word 4
sys_read_int:		.word 5
sys_exit:		.word 10

# Local variables
i:			.word


# ====== TEXT SEGMENT ====== #
	.text
	.globl main

main:	
	# ask for an integer
	lw  $v0, sys_print_string
	la  $a0, str_please_enter_int
	syscall

	# get integer into i
	lw  $v0, sys_read_int
	syscall
	la  $t0, i
	sw  $v0,  ($t0)

	# "You entered:"
	lw  $v0, sys_print_string
	la  $a0, str_you_entered_int
	syscall

	# Print the integer
	lw  $v0, sys_print_int
	lw  $a0, i
	syscall

	# Exit
	lw  $v0, sys_exit
	syscall
