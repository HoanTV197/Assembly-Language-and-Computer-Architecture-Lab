# cau hoi them: lam sao de trong khi chay phim 0, ma ta an phim 4 sau do chay theo postscript phim 4:
# Giai phap: su dung chi thi " .ktext de viet code o dia chi 0x80000180
#--------------------------------------------------------------
.eqv HEADING 0xffff8010     # Integer: An angle between 0 and 359
                            # 0 : North (up)
                            # 90: East (right)
                            # 180: South (down)
                            # 270: West (left)
.eqv MOVING 0xffff8050      # Boolean: di chuyen hay khong di chuyen
.eqv LEAVETRACK 0xffff8020  # Boolean (0 or 1): co hay khong de lai vet(track)
                           
.eqv WHEREX 0xffff8030      # Integer: Vi tri x hien tai cua Marsbot
.eqv WHEREY 0xffff8040      # Integer: Vi tri y hien tai cua MarsBot 
#-------------------------------------------------------------
# Keyboard Matrix
.eqv OUT_ADRESS_HEXA_KEYBOARD 0xFFFF0014
.eqv IN_ADRESS_HEXA_KEYBOARD 0xFFFF0012
.data
# Nap vao Marsbot mot mang cau truc gom( <Goc chuyen dong>, <thoi gian>, <cat=1---khong cat =0>
# Nhan phim 0 trong Ma Tran  phim de chon psc1  => DCE:
psc1: .asciiz "90,3000,0;180,3000,0;180,5800,1;80,500,1;70,500,1;60,500,1;50,500,1;40,500,1;30,500,1;20,500,1;10,500,1;0,500,1;350,500,1;340,500,1;330,500,1;320,500,1;310,500,1;300,500,1;290,500,1;280,490,1;90,7000,0;270,500,1;260,500,1;250,500,1;240,500,1;230,500,1;220,500,1;210,500,1;200,500,1;190,500,1;180,500,1;170,500,1;160,500,1;150,500,1;140,500,1;130,500,1;120,500,1;110,500,1;100,500,1;90,1000,1;90,5000,0;270,3000,1;0,5800,1;90,3000,1;180,2900,0;270,3000,1;90,5000,0;"
#----------------------------------------------------------

# Nhan phim 4 trong Ma Tran phim de chon psc2   => HOAN B4:
psc2: .asciiz "90,3000,0;180,3000,0;180,6000,1;0,3000,1;90,4000,1;0,3000,1;180,6000,1;90,5000,0;80,500,1;70,500,1;60,500,1;50,500,1;40,500,1;30,500,1;20,500,1;10,500,1;0,500,1;350,500,1;340,500,1;330,500,1;320,500,1;310,500,1;300,500,1;290,500,1;280,490,1;90,0,0;270,500,1;260,500,1;250,500,1;240,500,1;230,500,1;220,500,1;210,500,1;200,500,1;190,500,1;180,500,1;170,500,1;160,500,1;150,500,1;140,500,1;130,500,1;120,500,1;110,500,1;100,800,1;90,250,1;90,3000,0;30,6300,1;210,3150,1;90,3150,1;330,3150,1;150,6300,1;90,1500,0;0,6000,1;145,7000,1;0,6000,1;90,2000,0;180,6000,1;80,250,1;70,250,1;60,250,1;50,250,1;40,250,1;30,250,1;20,250,1;10,250,1;0,250,1;350,250,1;340,250,1;330,250,1;320,250,1;310,250,1;300,250,1;290,250,1;280,250,1;80,250,1;70,250,1;60,250,1;50,250,1;40,250,1;30,250,1;20,250,1;10,250,1;0,250,1;350,250,1;340,250,1;330,250,1;320,250,1;310,250,1;300,250,1;290,250,1;280,250,1;90,5000,0;225,4200,1;90,4200,1;270,1000,0;0,500,1;180,4000,1;90,2000,0;"

#-----------------------------------------------------------
# Nhan phim 8 trong Ma Tran phim de chon psc3:  => Q VIET:
psc3: .asciiz "90,3000,0;180,10000,0;90,5000,0;80,500,1;70,500,1;60,500,1;50,500,1;40,500,1;30,500,1;20,500,1;10,500,1;0,500,1;350,500,1;340,500,1;330,500,1;320,500,1;310,500,1;300,500,1;290,500,1;280,490,1;270,500,1;260,500,1;250,500,1;240,500,1;230,500,1;220,500,1;210,500,1;200,500,1;190,500,1;180,500,1;170,500,1;160,500,1;150,500,1;140,500,1;130,500,1;120,500,1;110,500,1;100,800,1;90,250,1;80,500,0;70,500,0;60,500,0;330,1000,0;150,2000,1;0,6000,0;90,2000,0;145,6300,1;45,6300,1;90,2000,0;180,5000,1;90,2000,0;90,3000,1;270,3000,0;0,5000,1;90,3000,1;180,2500,0;270,3000,1;90,3000,0;0,2500,0;90,2000,0;90,6000,1;270,3000,0;180,5000,1;90,2000,0;"
#-----------------------------------------------------------
.text
# <Ma Tran Phim>

#-----------------------------------------------------------
#                  col 0x1      col 0x2      col 0x4      col 0x8
#     row 0x1         0            1            2            3
#                    0x11        0x21         0x41          0x81
#     row 0x2         4            5            6            7
#                    0x12        0x22         0x42          0x82
#     row 0x4         8            9            A            B
#                    0x14        0x24         0x44          0x84
#     row 0x8         C            D            E            F
#                    0x18        0x28         0x48          0x88
#-----------------------------------------------------------
	li $t3, IN_ADRESS_HEXA_KEYBOARD     #khoi tao thanh ghi
	li $t4, OUT_ADRESS_HEXA_KEYBOARD
PRESS: 
	li $t5, 0x01               # Hang 1 cua Key matrix  <khoi tao thanh ghi t5 voi gia tri 0x01>
	sb $t5, 0($t3)             # Nap noi dung $t3 tu bo nho vao ben phai $t5
	lb $a0, 0($t4)             # Cat noi dung $t4 cua thanh ghi ra bo nho. 
	bne $a0, 0x11, NOT_PHIM_0      # Nhay den nhan NOT_PHIM_0 neu a0 khac 0x11
	la $a1, psc1               # Khoi tao thanh ghi $a1 voi dia chi cua nhan "psc1"
	j START
	NOT_PHIM_0:
	li $t5, 0x02               # Hang 2 cua Key matrix
	sb $t5, 0($t3)
	lb $a0, 0($t4)
	bne $a0, 0x12, NOT_PHIM_4      # neu khac, nhay den phim_4
	la $a1, psc2
	j START
	NOT_PHIM_4:
	li $t5, 0X04               # Hang 3 cua key matrix
	sb $t5, 0($t3)
	lb $a0, 0($t4)
	bne $a0, 0x14, QUAY_LAI     
	la $a1, psc3
	j START
QUAY_LAI: j PRESS                  # Neu cac so 0,4,8 khong duoc an ta quay lai


#--------------------------------------------------------------------------
# CHUONG TRINH CHINH
START:
	jal GO                               # bat dau dich chuyen marsbot
READ_PSCRIPT: 
	addi $t0, $zero, 0                   # luu gia tri dau vao cua rotate
	addi $t1, $zero, 0                   # luu gia tri dau vao cua time
	                                     # Gia tri cua track | untrack chi la 1 hoac 0.   
	
 	READ_ROTATE:                         
 	add $t7, $a1, $t6                    # $a1 la dia chi cua psc1, $t6 =i , ban dau i=0;
	lb $t5, 0($t7)                       # Doc cac ki tu cua postscript
	beq $t5, 0, END                      # Gap so 0 thi ket thuc pscript
 	beq $t5, 44, READ_TIME               # gap ki tu ',' thi nhay den nhan READ.TIME
 	mul $t0, $t0, 10                     # tong = tong*10
 	addi $t5, $t5, -48                   # So 0 co thu tu 48 trong bang ascii.
 	add $t0, $t0, $t5                    # cong cac chu so lai voi nhau.
 	addi $t6, $t6, 1                     # i=i+1
 	j READ_ROTATE                        # quay lai doc tiep den khi gap dau ','
 	
 	READ_TIME:                           # doc thoi gian di chuyen
 	add $a0, $t0, $zero
	jal ROTATE
 	addi $t6, $t6, 1
 	add $t7, $a1, $t6                    # $a1 luu dia chi cua pscript
	lb $t5, 0($t7) 
	beq $t5, 44, READ_TRACK
	mul $t1, $t1, 10
 	addi $t5, $t5, -48
 	add $t1, $t1, $t5
 	j READ_TIME                          # quay lai doc tiep den khi gap dau ','
 	
 	READ_TRACK:                          # luu vet hay khong luu vet
 	addi $v0,$zero,32                    # Giu cho mar bot hoat dong bang cach sleeping voi thoi gian=$t1
 	add $a0, $zero, $t1
 	addi $t6, $t6, 1 
 	add $t7, $a1, $t6
	lb $t5, 0($t7) 
 	addi $t5, $t5, -48
 	beq $t5, $zero, KT_UNTRACK           # 0=untrack | 1=track | 
 	jal UNTRACK                          # keep old track
	jal TRACK                            # and draw new track line
	j NHAN_1
	
KT_UNTRACK:
	jal UNTRACK
NHAN_1:
	syscall
 	addi $t6, $t6, 2                     # ta bo qua dau ';', tang i len 2 don vi
 	j READ_PSCRIPT
#-----------------------------------------------------------
# GO procedure, to start running
# param[in] none
#-----------------------------------------------------------
GO:         li $at, MOVING         # change MOVING port
            addi $k0, $zero,1      # to logic 1,
            sb $k0, 0($at)         # to start running
            nop
            jr $ra
            nop
#-----------------------------------------------------------
# STOP procedure, to stop running
# param[in] none
#-----------------------------------------------------------
STOP:       li $at, MOVING         # change MOVING port to 0
            sb $zero, 0($at)       # to stop
            nop
            jr $ra
            nop
#-----------------------------------------------------------
# TRACK procedure, to start drawing line
# param[in] none
#-----------------------------------------------------------
TRACK:      li $at, LEAVETRACK    # change LEAVETRACK port
            addi $k0, $zero,1     # to logic 1,
            sb $k0, 0($at)        # to start tracking
            nop
            jr $ra
            nop
#-----------------------------------------------------------
# UNTRACK procedure, to stop drawing line
# param[in] none
#-----------------------------------------------------------
UNTRACK:    li $at, LEAVETRACK    # change LEAVETRACK port to 0
            sb $zero, 0($at)      # to stop drawing tail
            nop
            jr $ra
            nop
#-----------------------------------------------------------
# ROTATE procedure, to rotate the robot
# param[in] $a0, An angle between 0 and 359
# 0 : North (up)
# 90: East (right)
# 180: South (down)
# 270: West (left)
#-----------------------------------------------------------
ROTATE:    li $at, HEADING        # change HEADING port
           sw $a0, 0($at)         # to rotate robot
           nop
           jr $ra
           nop
#-----------------------------------------------------------
END:
	jal STOP
	li $v0, 10
	syscall                      # V0=0 nen thoat
	j PRESS
# Ket thuc!
