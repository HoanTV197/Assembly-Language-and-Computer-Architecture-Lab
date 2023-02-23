check(int*, int):
        addiu   $sp,$sp,-24
        sw      $fp,20($sp)
        move    $fp,$sp
        sw      $4,24($fp)
        sw      $5,28($fp)
        sw      $0,0($fp)
        li      $2,-1                 # 0xffffffffffffffff
        sw      $2,4($fp)
        li      $2,1                        # 0x1
        sw      $2,8($fp)
.L6:
        lw      $3,8($fp)
        lw      $2,28($fp)
        slt     $2,$3,$2
        beq     $2,$0,.L4
        nop

        lw      $3,8($fp)
        li      $2,1073676288                 # 0x3fff0000
        ori     $2,$2,0xffff
        addu    $2,$3,$2
        sll     $2,$2,2
        lw      $3,24($fp)
        addu    $2,$3,$2
        lw      $3,0($2)
        lw      $2,8($fp)
        sll     $2,$2,2
        lw      $4,24($fp)
        addu    $2,$4,$2
        lw      $2,0($2)
        slt     $2,$3,$2
        bne     $2,$0,.L5
        nop

        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
        lw      $2,8($fp)
        sw      $2,4($fp)
.L5:
        lw      $2,8($fp)
        addiu   $2,$2,1
        sw      $2,8($fp)
        b       .L6
        nop

.L4:
        lw      $2,0($fp)
        slt     $2,$2,2
        bne     $2,$0,.L7
        nop

        move    $2,$0
        b       .L8
        nop

.L7:
        lw      $2,0($fp)
        bne     $2,$0,.L9
        nop

        li      $2,1                        # 0x1
        b       .L8
        nop

.L9:
        lw      $2,28($fp)
        addiu   $2,$2,-1
        lw      $3,4($fp)
        beq     $3,$2,.L10
        nop

        lw      $3,4($fp)
        li      $2,1                        # 0x1
        bne     $3,$2,.L11
        nop

.L10:
        li      $2,1                        # 0x1
        b       .L8
        nop

.L11:
        lw      $3,4($fp)
        li      $2,1073676288                 # 0x3fff0000
        ori     $2,$2,0xffff
        addu    $2,$3,$2
        sll     $2,$2,2
        lw      $3,24($fp)
        addu    $2,$3,$2
        lw      $3,0($2)
        lw      $2,4($fp)
        addiu   $2,$2,1
        sll     $2,$2,2
        lw      $4,24($fp)
        addu    $2,$4,$2
        lw      $2,0($2)
        slt     $2,$3,$2
        beq     $2,$0,.L12
        nop

        li      $2,1                        # 0x1
        b       .L8
        nop

.L12:
        lw      $2,4($fp)
        slt     $2,$2,2
        bne     $2,$0,.L13
        nop

        lw      $3,4($fp)
        li      $2,1073676288                 # 0x3fff0000
        ori     $2,$2,0xfffe
        addu    $2,$3,$2
        sll     $2,$2,2
        lw      $3,24($fp)
        addu    $2,$3,$2
        lw      $3,0($2)
        lw      $2,4($fp)
        sll     $2,$2,2
        lw      $4,24($fp)
        addu    $2,$4,$2
        lw      $2,0($2)
        slt     $2,$3,$2
        beq     $2,$0,.L13
        nop

        li      $2,1                        # 0x1
        b       .L8
        nop

.L13:
        lw      $2,4($fp)
        bgez    $2,.L14
        nop

        li      $2,1                        # 0x1
        b       .L8
        nop

.L14:
        move    $2,$0
.L8:
        move    $sp,$fp
        lw      $fp,20($sp)
        addiu   $sp,$sp,24
        jr      $31
        nop

.LC0:
        .ascii  "Yes\000"
.LC1:
        .ascii  "No\000"
main:
        addiu   $sp,$sp,-48
        sw      $31,44($sp)
        sw      $fp,40($sp)
        move    $fp,$sp
        li      $2,1                        # 0x1
        sw      $2,20($fp)
        li      $2,2                        # 0x2
        sw      $2,24($fp)
        li      $2,5                        # 0x5
        sw      $2,28($fp)
        li      $2,3                        # 0x3
        sw      $2,32($fp)
        li      $2,5                        # 0x5
        sw      $2,36($fp)
        li      $2,5                        # 0x5
        sw      $2,16($fp)
        addiu   $2,$fp,20
        lw      $5,16($fp)
        move    $4,$2
        jal     check(int*, int)
        nop

        beq     $2,$0,.L16
        nop

        lui     $2,%hi(.LC0)
        addiu   $5,$2,%lo(.LC0)
        lui     $2,%hi(_ZSt4cout)
        addiu   $4,$2,%lo(_ZSt4cout)
        jal     std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)
        nop

        b       .L17
        nop

.L16:
        lui     $2,%hi(.LC1)
        addiu   $5,$2,%lo(.LC1)
        lui     $2,%hi(_ZSt4cout)
        addiu   $4,$2,%lo(_ZSt4cout)
        jal     std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)
        nop

.L17:
        move    $2,$0
        move    $sp,$fp
        lw      $31,44($sp)
        lw      $fp,40($sp)
        addiu   $sp,$sp,48
        jr      $31
        nop

__static_initialization_and_destruction_0(int, int):
        addiu   $sp,$sp,-24
        sw      $31,20($sp)
        sw      $fp,16($sp)
        move    $fp,$sp
        sw      $4,24($fp)
        sw      $5,28($fp)
        lw      $3,24($fp)
        li      $2,1                        # 0x1
        bne     $3,$2,.L21
        nop

        lw      $3,28($fp)
        li      $2,65535                    # 0xffff
        bne     $3,$2,.L21
        nop

        addiu   $4,$28,%gp_rel(_ZStL8__ioinit)
        jal     std::ios_base::Init::Init() [complete object constructor]
        nop

        addiu   $6,$28,%gp_rel(__dso_handle)
        addiu   $5,$28,%gp_rel(_ZStL8__ioinit)
        lui     $2,%hi(_ZNSt8ios_base4InitD1Ev)
        addiu   $4,$2,%lo(_ZNSt8ios_base4InitD1Ev)
        jal     __cxa_atexit
        nop

.L21:
        nop
        move    $sp,$fp
        lw      $31,20($sp)
        lw      $fp,16($sp)
        addiu   $sp,$sp,24
        jr      $31
        nop

_GLOBAL__sub_I_check(int*, int):
        addiu   $sp,$sp,-24
        sw      $31,20($sp)
        sw      $fp,16($sp)
        move    $fp,$sp
        li      $5,65535                    # 0xffff
        li      $4,1                        # 0x1
        jal     __static_initialization_and_destruction_0(int, int)
        nop

        move    $sp,$fp
        lw      $31,20($sp)
        lw      $fp,16($sp)
        addiu   $sp,$sp,24
        jr      $31
        nop