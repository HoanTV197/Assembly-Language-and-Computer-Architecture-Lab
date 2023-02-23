.data
string: .asciiz
message1: .asciiz "Nhap chuoi:"
message2: .asciiz " "
end_of_string: .asciiz "\n"
.text
        li $s1,0   			# s1 l� bi?n ??m s? k� t? l� s? trong stack
        lb $s7,end_of_string
   
     	li $s5,48			#$s5 = 0 trong m� ascii
	li $s6,57			#s6 = 9 trong m� ascii
        
main:
get_string: 
	li $v0,54
	la $a0,message1
	la $a1,string
	li $a2,21
	syscall
	
	la $a0, string
	li $t0, 0			# t0 l� ch? s?
check:	
	add $t1, $a0, $t0		# $t1 = $a0 + $t0 = ch? s?
	lb $t2, 0($t1)			# $t2 = m� ascii c?a $t1
	beq $t2,$s7,end_of_check	# ki?m tra xem ?� ki?m tra h?t chu?i ban ??u nh?p v�o ch?a, k� t? cu?i l� "\n"
	slt $t8,$s5,$t2			# ki?m tra xem $t2 c� n?m trong ?o?n 48 ??n 57 hay kh�ng 
	slt $t9,$t2,$s6			# ki?m tra xem $t2 c� n?m trong ?o?n 48 ??n 57 hay kh�ng 
	bne $t8,$t9,boqua           # n?u kh�ng thu?c th� b? qua
	add $sp,$sp,-4			# push
	add $t2,$t2,-48 
	sw $t2,0($sp)
	add $s1,$s1,1			# m?i l?n push th� t?ng bi?n ??m l�n 1
	
	
boqua: 
	add $t0,$t0,1	
	j check
	
end_of_check:
	beq $s1,0,end		# $s1 l� bi?n ??m s? k� t? trong stack, n?u = 0 t?c l� ?� pop h?t th� end
	li $v0,4		# print th�m k� t? message2 l� k� t? tr?ng ?? d? nh�n
	la $a0,message2
	syscall
	lw $a0,0($sp)		# pop
	add $sp,$sp,4
	li $v0,1		# print integer
	syscall
	add $s1,$s1,-1
	j end_of_check		# v�ng l?p pop
	
end:
	