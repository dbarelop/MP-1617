	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 16.0.2.181 Build 20160204";
# mark_description "-march=core-avx2 -std=c11 -g -O3 -Wall -DPRECISION=0 -DLEN=2048 -unroll0 -S -fsource-asm -o assembler/axpy_s";
# mark_description "tride.2k.single.avx2.icc.s";
	.file "axpy_stride.c"
	.text
..TXTST0:
.L_2__routine_start_main_0:
# -- Begin  main
	.text
# mark_begin;
       .align    16,0x90
	.globl main
# --- main()
main:
..B1.1:                         # Preds ..B1.0

### {

	.cfi_startproc
..___tag_value_main.2:
..L3:
                                                          #229.1
..LN0:
	.file   1 "../axpy_stride.c"
	.loc    1  229  is_stmt 1
        pushq     %rbp                                          #229.1
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbp                                    #229.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN2:
        andq      $-128, %rsp                                   #229.1
..LN3:
        pushq     %r12                                          #229.1
..LN4:
        subq      $120, %rsp                                    #229.1
..LN5:
        xorl      %esi, %esi                                    #229.1
..LN6:
        movl      $3, %edi                                      #229.1
..LN7:
        call      __intel_new_feature_proc_init                 #229.1
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
..LN8:
                                # LOE rbx r12 r13 r14 r15
..B1.30:                        # Preds ..B1.1
..LN9:
        vstmxcsr  (%rsp)                                        #229.1
..LN10:
	.loc    1  230  prologue_end  is_stmt 1

###   printf("                 Time \tFLOPs/ \t          \n");

        movl      $il0_peep_printf_format_0, %edi               #230.3
..LN11:
	.loc    1  229  is_stmt 1
        orl       $32832, (%rsp)                                #229.1
..LN12:
        vldmxcsr  (%rsp)                                        #229.1
..LN13:
	.loc    1  230  is_stmt 1
        call      puts                                          #230.3
..LN14:
                                # LOE rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.30
..LN15:
	.loc    1  231  is_stmt 1

###   printf("          Loop    (s) \tcycle  \t  Checksum \n");

        movl      $il0_peep_printf_format_1, %edi               #231.3
..LN16:
        call      puts                                          #231.3
..LN17:
                                # LOE rbx r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
..___tag_value_main.9:
..LN18:
	.loc    1  190  is_stmt 1
#       init()
        call      init                                          #190.3
..___tag_value_main.10:
..LN19:
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
..___tag_value_main.11:
..LN20:
	.loc    1  191  is_stmt 1
#       get_wall_time()
        call      get_wall_time                                 #191.13
..___tag_value_main.12:
..LN21:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.31:                        # Preds ..B1.4
..LN22:
        vmovsd    %xmm0, (%rsp)                                 #191.13
..LN23:
                                # LOE rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.31
..LN24:
	.loc    1  193  is_stmt 1
        xorl      %eax, %eax                                    #193.3
..LN25:
        movl      %eax, %r12d                                   #193.3
..LN26:
                                # LOE rbx r13 r14 r15 r12d
..B1.6:                         # Preds ..B1.9 ..B1.5
..L13:          # optimization report
                # %s was not vectorized: inner loop was already vectorized
..LN27:
	.loc    1  194  is_stmt 1
        xorl      %edx, %edx                                    #194.5
..LN28:
	.loc    1  195  is_stmt 1
        vmovss    alpha(%rip), %xmm0                            #195.14
..LN29:
        vbroadcastss %xmm0, %xmm1                               #195.14
..LN30:
                                # LOE rdx rbx r13 r14 r15 r12d xmm0 xmm1
..B1.7:                         # Preds ..B1.7 ..B1.6
..L14:          # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 1.067383
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.035156
                # MAIN VECTOR TYPE: 32-bits floating point
..LN31:
        lea       (,%rdx,8), %rcx                               #195.7
..LN32:
        vmovss    x(,%rdx,8), %xmm2                             #195.20
..LN33:
        vmovss    y(,%rdx,8), %xmm5                             #195.27
..LN34:
        vinsertps $16, 8+y(,%rdx,8), %xmm5, %xmm6               #195.27
..LN35:
        vinsertps $16, 8+x(,%rdx,8), %xmm2, %xmm3               #195.20
..LN36:
        vinsertps $32, 16+x(,%rdx,8), %xmm3, %xmm4              #195.20
..LN37:
        vinsertps $32, 16+y(,%rdx,8), %xmm6, %xmm7              #195.27
..LN38:
        vinsertps $48, 24+y(,%rdx,8), %xmm7, %xmm9              #195.27
..LN39:
        vinsertps $48, 24+x(,%rdx,8), %xmm4, %xmm8              #195.20
..LN40:
	.loc    1  194  is_stmt 1
        addq      $4, %rdx                                      #194.5
..LN41:
	.loc    1  195  is_stmt 1
        vfmadd231ps %xmm1, %xmm8, %xmm9                         #195.27
..LN42:
	.loc    1  194  is_stmt 1
        cmpq      $1024, %rdx                                   #194.5
..LN43:
	.loc    1  195  is_stmt 1
        vmovss    %xmm9, y(%rcx)                                #195.7
..LN44:
        vextractps $1, %xmm9, 8+y(%rcx)                         #195.7
..LN45:
        vextractps $2, %xmm9, 16+y(%rcx)                        #195.7
..LN46:
        vextractps $3, %xmm9, 24+y(%rcx)                        #195.7
..LN47:
	.loc    1  194  is_stmt 1
        jb        ..B1.7        # Prob 99%                      #194.5
..LN48:
                                # LOE rdx rbx r13 r14 r15 r12d xmm0 xmm1
..B1.8:                         # Preds ..B1.7
..LN49:
	.loc    1  197  is_stmt 1
        movl      $x, %edi                                      #197.5
..LN50:
        movl      $y, %esi                                      #197.5
..LN51:
        movl      $z, %edx                                      #197.5
..___tag_value_main.15:
..LN52:
#       dummy(float *, float *, float *, float)
        call      dummy                                         #197.5
..___tag_value_main.16:
..LN53:
                                # LOE rbx r13 r14 r15 r12d
..B1.9:                         # Preds ..B1.8
..LN54:
	.loc    1  193  is_stmt 1
        incl      %r12d                                         #193.3
..LN55:
        cmpl      $4882812, %r12d                               #193.3
..LN56:
        jb        ..B1.6        # Prob 82%                      #193.3
..LN57:
                                # LOE rbx r13 r14 r15 r12d
..B1.10:                        # Preds ..B1.9
..___tag_value_main.17:
..LN58:
	.loc    1  199  is_stmt 1
#       get_wall_time()
        call      get_wall_time                                 #199.11
..___tag_value_main.18:
..LN59:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.11:                        # Preds ..B1.10
..LN60:
	.loc    1  200  is_stmt 1
        movl      $2040, %edi                                   #200.3
..LN61:
        movl      $.L_2__STRING.6, %esi                         #200.3
..LN62:
        vsubsd    (%rsp), %xmm0, %xmm0                          #200.3
..___tag_value_main.19:
..LN63:
#       results(double, unsigned int, char *)
        call      results                                       #200.3
..___tag_value_main.20:
..LN64:
                                # LOE rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.11
..LN65:
	.loc    1  158  is_stmt 1
        xorl      %eax, %eax                                    #158.3
..LN66:
	.loc    1  156  is_stmt 1
        vxorps    %ymm0, %ymm0, %ymm0                           #156.12
..LN67:
        vmovups   %ymm0, (%rsp)                                 #156.12
..LN68:
                                # LOE rax rbx r12 r13 r14 r15 ymm0
..B1.13:                        # Preds ..B1.13 ..B1.12
..L21:          # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 7.847656
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 5.000000
                # MAIN VECTOR TYPE: 32-bits floating point
..LN69:
	.loc    1  159  is_stmt 1
        vaddps    y(,%rax,4), %ymm0, %ymm0                      #159.5
..LN70:
	.loc    1  158  is_stmt 1
        addq      $8, %rax                                      #158.3
..LN71:
        cmpq      $2048, %rax                                   #158.3
..LN72:
        jb        ..B1.13       # Prob 99%                      #158.3
..LN73:
                                # LOE rax rbx r12 r13 r14 r15 ymm0
..B1.14:                        # Preds ..B1.13
..LN74:
	.loc    1  161  is_stmt 1
        movl      $.L_2__STRING.4, %edi                         #161.3
..LN75:
	.loc    1  156  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #156.12
..LN76:
	.loc    1  161  is_stmt 1
        movl      $1, %eax                                      #161.3
..LN77:
	.loc    1  156  is_stmt 1
        vaddps    %xmm1, %xmm0, %xmm2                           #156.12
..LN78:
        vmovhlps  %xmm2, %xmm2, %xmm3                           #156.12
..LN79:
        vaddps    %xmm3, %xmm2, %xmm4                           #156.12
..LN80:
        vshufps   $245, %xmm4, %xmm4, %xmm5                     #156.12
..LN81:
        vaddss    %xmm5, %xmm4, %xmm0                           #156.12
..LN82:
	.loc    1  161  is_stmt 1
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #161.3
..LN83:
        vzeroupper                                              #161.3
..___tag_value_main.22:
..LN84:
#       printf(const char *__restrict__, ...)
        call      printf                                        #161.3
..___tag_value_main.23:
..LN85:
                                # LOE rbx r12 r13 r14 r15
..B1.15:                        # Preds ..B1.14
..___tag_value_main.24:
..LN86:
	.loc    1  213  is_stmt 1
#       init()
        call      init                                          #213.3
..___tag_value_main.25:
..LN87:
                                # LOE rbx r12 r13 r14 r15
..B1.16:                        # Preds ..B1.15
..___tag_value_main.26:
..LN88:
	.loc    1  214  is_stmt 1
#       get_wall_time()
        call      get_wall_time                                 #214.13
..___tag_value_main.27:
..LN89:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.33:                        # Preds ..B1.16
..LN90:
        vmovsd    %xmm0, 32(%rsp)                               #214.13
..LN91:
                                # LOE rbx r12 r13 r14 r15
..B1.17:                        # Preds ..B1.33
..LN92:
	.loc    1  216  is_stmt 1
        xorl      %eax, %eax                                    #216.3
..LN93:
        movl      %eax, %r12d                                   #216.3
..LN94:
                                # LOE rbx r13 r14 r15 r12d
..B1.18:                        # Preds ..B1.21 ..B1.17
..L28:          # optimization report
                # %s was not vectorized: inner loop was already vectorized
..LN95:
	.loc    1  217  is_stmt 1
        xorl      %edx, %edx                                    #217.5
..LN96:
	.loc    1  218  is_stmt 1
        vmovss    alpha(%rip), %xmm0                            #218.15
..LN97:
	.loc    1  220  is_stmt 1
        vbroadcastss %xmm0, %xmm1                               #220.22
..LN98:
                                # LOE rbx r13 r14 r15 edx r12d xmm0 xmm1
..B1.19:                        # Preds ..B1.19 ..B1.18
..L29:          # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 1.067383
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.035156
                # MAIN VECTOR TYPE: 32-bits floating point
..LN99:
	.loc    1  218  is_stmt 1
        lea       (%rdx,%rdx), %ecx                             #218.21
..LN100:
	.loc    1  233  is_stmt 1

###   axpy_stride_v1();
###   axpy_stride_v2(x, y);  //  s000_stride_v2(x, y, z);

        vmovss    x(,%rcx,4), %xmm2                             #233.18
..LN101:
	.loc    1  217  is_stmt 1
        addl      $4, %edx                                      #217.5
..LN102:
	.loc    1  233  is_stmt 1
        vmovss    y(,%rcx,4), %xmm5                             #233.21
..LN103:
        lea       (,%rcx,4), %rsi                               #233.21
..LN104:
        vinsertps $16, 8+y(,%rcx,4), %xmm5, %xmm6               #233.21
..LN105:
	.loc    1  217  is_stmt 1
        cmpl      $1024, %edx                                   #217.5
..LN106:
	.loc    1  233  is_stmt 1
        vinsertps $16, 8+x(,%rcx,4), %xmm2, %xmm3               #233.18
..LN107:
        vinsertps $32, 16+x(,%rcx,4), %xmm3, %xmm4              #233.18
..LN108:
        vinsertps $32, 16+y(,%rcx,4), %xmm6, %xmm7              #233.21
..LN109:
        vinsertps $48, 24+y(,%rcx,4), %xmm7, %xmm9              #233.21
..LN110:
        vinsertps $48, 24+x(,%rcx,4), %xmm4, %xmm8              #233.18
..LN111:
	.loc    1  218  is_stmt 1
        vfmadd231ps %xmm1, %xmm8, %xmm9                         #218.29
..LN112:
	.loc    1  233  is_stmt 1
        vmovss    %xmm9, y(%rsi)                                #233.21
..LN113:
        vextractps $1, %xmm9, 8+y(%rsi)                         #233.21
..LN114:
        vextractps $2, %xmm9, 16+y(%rsi)                        #233.21
..LN115:
        vextractps $3, %xmm9, 24+y(%rsi)                        #233.21
..LN116:
	.loc    1  217  is_stmt 1
        jb        ..B1.19       # Prob 99%                      #217.5
..LN117:
                                # LOE rbx r13 r14 r15 edx r12d xmm0 xmm1
..B1.20:                        # Preds ..B1.19
..LN118:
	.loc    1  220  is_stmt 1
        movl      $x, %edi                                      #220.5
..LN119:
        movl      $y, %esi                                      #220.5
..LN120:
        movl      $z, %edx                                      #220.5
..___tag_value_main.30:
..LN121:
#       dummy(float *, float *, float *, float)
        call      dummy                                         #220.5
..___tag_value_main.31:
..LN122:
                                # LOE rbx r13 r14 r15 r12d
..B1.21:                        # Preds ..B1.20
..LN123:
	.loc    1  216  is_stmt 1
        incl      %r12d                                         #216.3
..LN124:
        cmpl      $4882812, %r12d                               #216.3
..LN125:
        jb        ..B1.18       # Prob 82%                      #216.3
..LN126:
                                # LOE rbx r13 r14 r15 r12d
..B1.22:                        # Preds ..B1.21
..___tag_value_main.32:
..LN127:
	.loc    1  222  is_stmt 1
#       get_wall_time()
        call      get_wall_time                                 #222.11
..___tag_value_main.33:
..LN128:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.23:                        # Preds ..B1.22
..LN129:
	.loc    1  223  is_stmt 1
        movl      $2040, %edi                                   #223.3
..LN130:
        movl      $.L_2__STRING.7, %esi                         #223.3
..LN131:
        vsubsd    32(%rsp), %xmm0, %xmm0                        #223.3
..___tag_value_main.34:
..LN132:
#       results(double, unsigned int, char *)
        call      results                                       #223.3
..___tag_value_main.35:
..LN133:
                                # LOE rbx r12 r13 r14 r15
..B1.24:                        # Preds ..B1.23
..LN134:
	.loc    1  158  is_stmt 1
        vmovups   (%rsp), %ymm0                                 #158.3
..LN135:
        xorl      %eax, %eax                                    #158.3
..LN136:
                                # LOE rax rbx r12 r13 r14 r15 ymm0
..B1.25:                        # Preds ..B1.25 ..B1.24
..L36:          # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 7.847656
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 5.000000
                # MAIN VECTOR TYPE: 32-bits floating point
..LN137:
	.loc    1  159  is_stmt 1
        vaddps    y(,%rax,4), %ymm0, %ymm0                      #159.5
..LN138:
	.loc    1  158  is_stmt 1
        addq      $8, %rax                                      #158.3
..LN139:
        cmpq      $2048, %rax                                   #158.3
..LN140:
        jb        ..B1.25       # Prob 99%                      #158.3
..LN141:
                                # LOE rax rbx r12 r13 r14 r15 ymm0
..B1.26:                        # Preds ..B1.25
..LN142:
        vmovups   %ymm0, (%rsp)                                 #
..LN143:
	.loc    1  161  is_stmt 1
        movl      $.L_2__STRING.4, %edi                         #161.3
..LN144:
        movl      $1, %eax                                      #161.3
..LN145:
	.loc    1  156  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #156.12
..LN146:
        vaddps    %xmm1, %xmm0, %xmm2                           #156.12
..LN147:
        vmovhlps  %xmm2, %xmm2, %xmm3                           #156.12
..LN148:
        vaddps    %xmm3, %xmm2, %xmm4                           #156.12
..LN149:
        vshufps   $245, %xmm4, %xmm4, %xmm5                     #156.12
..LN150:
        vaddss    %xmm5, %xmm4, %xmm0                           #156.12
..LN151:
	.loc    1  161  is_stmt 1
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #161.3
..LN152:
        vzeroupper                                              #161.3
..___tag_value_main.37:
..LN153:
#       printf(const char *__restrict__, ...)
        call      printf                                        #161.3
..___tag_value_main.38:
..LN154:
                                # LOE rbx r12 r13 r14 r15
..B1.27:                        # Preds ..B1.26
..LN155:
	.loc    1  234  is_stmt 1

###   return 0;

        xorl      %eax, %eax                                    #234.10
..LN156:
	.loc    1  234  epilogue_begin  is_stmt 1
        addq      $120, %rsp                                    #234.10
	.cfi_restore 12
..LN157:
        popq      %r12                                          #234.10
..LN158:
        movq      %rbp, %rsp                                    #234.10
..LN159:
        popq      %rbp                                          #234.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN160:
        ret                                                     #234.10
        .align    16,0x90
	.cfi_endproc
..LN161:
                                # LOE
..LN162:
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.163:
.LNmain:
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
il0_peep_printf_format_0:
	.long	538976288
	.long	538976288
	.long	538976288
	.long	538976288
	.long	1835619360
	.long	1175003237
	.long	1934643020
	.long	537468975
	.long	538976288
	.long	538976288
	.word	32
	.space 2, 0x00 	# pad
	.align 4
il0_peep_printf_format_1:
	.long	538976288
	.long	538976288
	.long	1867259936
	.long	538996847
	.long	1932009504
	.long	1661542441
	.long	1701602169
	.long	537468960
	.long	1701331744
	.long	1970498403
	.word	8301
	.byte	0
	.data
# -- End  main
	.text
.L_2__routine_start_get_wall_time_1:
# -- Begin  get_wall_time
	.text
# mark_begin;
       .align    16,0x90
	.globl get_wall_time
# --- get_wall_time()
get_wall_time:
..B2.1:                         # Preds ..B2.0

### {

	.cfi_startproc
..___tag_value_get_wall_time.47:
..L48:
                                                         #82.1
..LN164:
	.loc    1  82  is_stmt 1
        subq      $24, %rsp                                     #82.1
	.cfi_def_cfa_offset 32
..LN165:
	.loc    1  84  prologue_end  is_stmt 1

###     struct timeval time;
###     if (gettimeofday(&time,NULL)) {

        xorl      %esi, %esi                                    #84.9
..LN166:
        lea       (%rsp), %rdi                                  #84.9
..LN167:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #84.9
..LN168:
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B2.2:                         # Preds ..B2.1
..LN169:
        testl     %eax, %eax                                    #84.9
..LN170:
        jne       ..B2.4        # Prob 0%                       #84.9
..LN171:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
..LN172:
	.loc    1  87  is_stmt 1

###         exit(-1); // return 0;
###     }
###     return (double)time.tv_sec + (double)time.tv_usec * .000001;

        vxorpd    %xmm0, %xmm0, %xmm0                           #87.42
..LN173:
        vxorpd    %xmm1, %xmm1, %xmm1                           #87.20
..LN174:
        vcvtsi2sdq 8(%rsp), %xmm0, %xmm0                        #87.42
..LN175:
        vcvtsi2sdq (%rsp), %xmm1, %xmm1                         #87.20
..LN176:
        vfmadd132sd .L_2il0floatpacket.0(%rip), %xmm1, %xmm0    #87.57
..LN177:
	.loc    1  87  epilogue_begin  is_stmt 1
        addq      $24, %rsp                                     #87.57
	.cfi_def_cfa_offset 8
..LN178:
        ret                                                     #87.57
	.cfi_def_cfa_offset 32
..LN179:
                                # LOE
..B2.4:                         # Preds ..B2.2                  # Infreq
..LN180:
	.loc    1  85  is_stmt 1
        movl      $-1, %edi                                     #85.9
..LN181:
#       exit(int)
        call      exit                                          #85.9
        .align    16,0x90
	.cfi_endproc
..LN182:
                                # LOE
..LN183:
# mark_end;
	.type	get_wall_time,@function
	.size	get_wall_time,.-get_wall_time
..LNget_wall_time.184:
.LNget_wall_time:
	.data
	.file   2 "/usr/include/bits/time.h"
	.file   3 "/usr/include/bits/types.h"
# -- End  get_wall_time
	.text
.L_2__routine_start_results_2:
# -- Begin  results
	.text
# mark_begin;
       .align    16,0x90
	.globl results
# --- results(double, unsigned int, char *)
results:
# parameter 1(wall_time): %xmm0
# parameter 2(vlen): %edi
# parameter 3(loop): %rsi
..B3.1:                         # Preds ..B3.0

### {

	.cfi_startproc
..___tag_value_results.57:
..L58:
                                                         #179.1
..LN185:
	.loc    1  179  is_stmt 1
        pushq     %r15                                          #179.1
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
..LN186:
        pushq     %rbx                                          #179.1
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
..LN187:
        pushq     %rbp                                          #179.1
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
..LN188:
        subq      $288, %rsp                                    #179.1
	.cfi_def_cfa_offset 320
..LN189:
        movq      %rsi, %r15                                    #179.1
..LN190:
        movl      %edi, %ebp                                    #179.1
..LN191:
	.loc    1  108  prologue_end  is_stmt 1
        movl      $.L_2__STRING.0, %edi                         #108.14
..LN192:
        movl      $.L_2__STRING.1, %esi                         #108.14
..LN193:
	.loc    1  104  is_stmt 1
        movq      $0x616e206c65646f6d, %rax                     #104.28
..LN194:
        movl      $25965, %edx                                  #104.28
..LN195:
	.loc    1  179  is_stmt 1
        vmovsd    %xmm0, 264(%rsp)                              #179.1
..LN196:
	.loc    1  104  is_stmt 1
        movq      %rax, 272(%rsp)                               #104.28
..LN197:
        movw      %dx, 280(%rsp)                                #104.28
..LN198:
        movb      $0, 282(%rsp)                                 #104.28
..LN199:
	.loc    1  106  is_stmt 1
        movq      $0, 256(%rsp)                                 #106.17
..LN200:
	.loc    1  108  is_stmt 1
#       fopen(const char *__restrict__, const char *__restrict__)
        call      fopen                                         #108.14
..LN201:
                                # LOE rax rbp r12 r13 r14 r15
..B3.16:                        # Preds ..B3.1
..LN202:
        movq      %rax, %rbx                                    #108.14
..LN203:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.2:                         # Preds ..B3.16
..LN204:
	.loc    1  109  is_stmt 1
        testq     %rbx, %rbx                                    #109.20
..LN205:
        je        ..B3.11       # Prob 32%                      #109.20
..LN206:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.3:                         # Preds ..B3.2
..LN207:
	.loc    1  111  is_stmt 1
        movl      $256, %esi                                    #111.16
..LN208:
        lea       (%rsp), %rdi                                  #111.16
..LN209:
        movq      %rbx, %rdx                                    #111.16
..LN210:
#       fgets(char *__restrict__, int, FILE *__restrict__)
        call      fgets                                         #111.16
..LN211:
                                # LOE rax rbx rbp r12 r13 r14 r15
..B3.4:                         # Preds ..B3.3
..LN212:
        testq     %rax, %rax                                    #111.47
..LN213:
        je        ..B3.10       # Prob 1%                       #111.47
..LN214:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.6:                         # Preds ..B3.4 ..B3.8
..L67:          # optimization report
                # %s was not vectorized: loop control variable was not identified. Explicitly compute the iteration count before executing the loop or try using canonical loop form
..LN215:
	.loc    1  113  is_stmt 1
        lea       (%rsp), %rax                                  #113.18
..LN216:
        movl      $10, %edx                                     #113.18
..LN217:
        lea       272(%rsp), %rcx                               #113.18
..LN218:
        call      __intel_sse4_strncmp                          #113.18
..LN219:
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B3.18:                        # Preds ..B3.6
..LN220:
        testl     %eax, %eax                                    #113.18
..LN221:
        je        ..B3.13       # Prob 20%                      #113.18
..LN222:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.7:                         # Preds ..B3.18
..LN223:
	.loc    1  111  is_stmt 1
        movl      $256, %esi                                    #111.16
..LN224:
        lea       (%rsp), %rdi                                  #111.16
..LN225:
        movq      %rbx, %rdx                                    #111.16
..LN226:
#       fgets(char *__restrict__, int, FILE *__restrict__)
        call      fgets                                         #111.16
..LN227:
                                # LOE rax rbx rbp r12 r13 r14 r15
..B3.8:                         # Preds ..B3.7
..LN228:
        testq     %rax, %rax                                    #111.47
..LN229:
        jne       ..B3.6        # Prob 82%                      #111.47
..LN230:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.10:                        # Preds ..B3.8 ..B3.20 ..B3.4
..LN231:
	.loc    1  122  is_stmt 1
        movq      %rbx, %rdi                                    #122.7
..LN232:
#       fclose(FILE *)
        call      fclose                                        #122.7
..LN233:
                                # LOE rbp r12 r13 r14 r15
..B3.11:                        # Preds ..B3.10 ..B3.2
..LN234:
	.loc    1  180  is_stmt 1

###   printf("%14s  %5.2f \t %4.1f \t",

        vxorpd    %xmm3, %xmm3, %xmm3                           #180.3
..LN235:
        imulq     $9765624, %rbp, %rax                          #180.3
..LN236:
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm1             #180.3
..LN237:
        movl      $.L_2__STRING.5, %edi                         #180.3
..LN238:
        vmulsd    256(%rsp), %xmm1, %xmm2                       #180.3
..LN239:
        movq      %r15, %rsi                                    #180.3
..LN240:
        vcvtsi2sdq %rax, %xmm3, %xmm3                           #180.3
..LN241:
        vmovsd    264(%rsp), %xmm0                              #180.3
..LN242:
        movl      $2, %eax                                      #180.3
..LN243:
        vmulsd    %xmm0, %xmm2, %xmm4                           #180.3
..LN244:
        vdivsd    %xmm4, %xmm3, %xmm1                           #180.3
..___tag_value_results.68:
..LN245:
#       printf(const char *__restrict__, ...)
        call      printf                                        #180.3
..___tag_value_results.69:
..LN246:
                                # LOE r12 r13 r14
..B3.12:                        # Preds ..B3.11

###           loop /* nombre del bucle */,
###           wall_time,
###           (FLOPs_IT*NTIMES*vlen)/(wall_time*(1e9)*getCPUfreq()) /* FLOPs por ciclo */);
### }

..LN247:
	.loc    1  184  epilogue_begin  is_stmt 1
        addq      $288, %rsp                                    #184.1
	.cfi_def_cfa_offset 32
	.cfi_restore 6
..LN248:
        popq      %rbp                                          #184.1
	.cfi_def_cfa_offset 24
	.cfi_restore 3
..LN249:
        popq      %rbx                                          #184.1
	.cfi_def_cfa_offset 16
	.cfi_restore 15
..LN250:
        popq      %r15                                          #184.1
	.cfi_def_cfa_offset 8
..LN251:
        ret                                                     #184.1
	.cfi_def_cfa_offset 320
	.cfi_offset 3, -24
	.cfi_offset 6, -32
	.cfi_offset 15, -16
..LN252:
                                # LOE
..B3.13:                        # Preds ..B3.18                 # Infreq
..LN253:
	.loc    1  115  is_stmt 1
        movl      $.L_2__STRING.2, %esi                         #115.19
..LN254:
        lea       (%rsp), %rdi                                  #115.19
..LN255:
#       strstr(const char *, const char *)
        call      strstr                                        #115.19
..LN256:
                                # LOE rax rbx rbp r12 r13 r14 r15
..B3.20:                        # Preds ..B3.13                 # Infreq
..LN257:
	.loc    1  117  is_stmt 1
        incq      %rax                                          #117.17
..LN258:
        movl      $.L_2__STRING.3, %esi                         #117.17
..LN259:
        movq      %rax, %rdi                                    #117.17
..LN260:
        lea       256(%rsp), %rdx                               #117.17
..LN261:
        xorl      %eax, %eax                                    #117.17
..LN262:
#       sscanf(const char *__restrict__, const char *__restrict__, ...)
        call      __isoc99_sscanf                               #117.17
..LN263:
        jmp       ..B3.10       # Prob 100%                     #117.17
        .align    16,0x90
	.cfi_endproc
..LN264:
                                # LOE rbx rbp r12 r13 r14 r15
..LN265:
# mark_end;
	.type	results,@function
	.size	results,.-results
..LNresults.266:
.LNresults:
	.data
	.file   4 "/usr/include/stdio.h"
	.file   5 "/usr/include/libio.h"
	.file   6 "/opt/intel/compilers_and_libraries_2016.2.181/linux/compiler/include/stddef.h"
# -- End  results
	.text
.L_2__routine_start_get_cpu_time_3:
# -- Begin  get_cpu_time
	.text
# mark_begin;
       .align    16,0x90
	.globl get_cpu_time
# --- get_cpu_time()
get_cpu_time:
..B4.1:                         # Preds ..B4.0

### {

	.cfi_startproc
..___tag_value_get_cpu_time.86:
..L87:
                                                         #94.1
..LN267:
	.loc    1  94  is_stmt 1
        pushq     %rsi                                          #94.1
	.cfi_def_cfa_offset 16
..LN268:
	.loc    1  95  prologue_end  is_stmt 1

###     return (double) clock() / CLOCKS_PER_SEC;

#       clock(void)
        call      clock                                         #95.21
..LN269:
                                # LOE rax rbx rbp r12 r13 r14 r15
..B4.2:                         # Preds ..B4.1
..LN270:
        vxorpd    %xmm0, %xmm0, %xmm0                           #95.21
..LN271:
        vcvtsi2sdq %rax, %xmm0, %xmm0                           #95.21
..LN272:
        vdivsd    .L_2il0floatpacket.2(%rip), %xmm0, %xmm0      #95.31
..LN273:
	.loc    1  95  epilogue_begin  is_stmt 1
        popq      %rcx                                          #95.31
	.cfi_def_cfa_offset 8
..LN274:
        ret                                                     #95.31
        .align    16,0x90
	.cfi_endproc
..LN275:
                                # LOE
..LN276:
# mark_end;
	.type	get_cpu_time,@function
	.size	get_cpu_time,.-get_cpu_time
..LNget_cpu_time.277:
.LNget_cpu_time:
	.data
# -- End  get_cpu_time
	.text
.L_2__routine_start_getCPUfreq_4:
# -- Begin  getCPUfreq
	.text
# mark_begin;
       .align    16,0x90
	.globl getCPUfreq
# --- getCPUfreq()
getCPUfreq:
..B5.1:                         # Preds ..B5.0

### {

	.cfi_startproc
..___tag_value_getCPUfreq.95:
..L96:
                                                         #101.1
..LN278:
	.loc    1  101  is_stmt 1
        pushq     %r12                                          #101.1
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
..LN279:
        subq      $288, %rsp                                    #101.1
	.cfi_def_cfa_offset 304
..LN280:
	.loc    1  108  prologue_end  is_stmt 1

###    FILE * sysinfo;
###    char * ptr;
###    char buf[BUFLEN], key[] = "model name";
###    int keylen = sizeof(key) - 1;
###     double freq = 0;
### 
###    sysinfo = fopen( "/proc/cpuinfo", "r" );

        movl      $.L_2__STRING.0, %edi                         #108.14
..LN281:
        movl      $.L_2__STRING.1, %esi                         #108.14
..LN282:
	.loc    1  104  is_stmt 1
        movq      $0x616e206c65646f6d, %rax                     #104.28
..LN283:
        movl      $25965, %edx                                  #104.28
..LN284:
        movq      %rax, 264(%rsp)                               #104.28
..LN285:
        movw      %dx, 272(%rsp)                                #104.28
..LN286:
        movb      $0, 274(%rsp)                                 #104.28
..LN287:
	.loc    1  106  is_stmt 1
        movq      $0, 256(%rsp)                                 #106.17
..LN288:
	.loc    1  108  is_stmt 1
#       fopen(const char *__restrict__, const char *__restrict__)
        call      fopen                                         #108.14
..LN289:
                                # LOE rax rbx rbp r13 r14 r15
..B5.15:                        # Preds ..B5.1
..LN290:
        movq      %rax, %r12                                    #108.14
..LN291:
                                # LOE rbx rbp r12 r13 r14 r15
..B5.2:                         # Preds ..B5.15
..LN292:
	.loc    1  109  is_stmt 1

###     if (sysinfo != NULL)

        testq     %r12, %r12                                    #109.20
..LN293:
        je        ..B5.11       # Prob 32%                      #109.20
..LN294:
                                # LOE rbx rbp r12 r13 r14 r15
..B5.3:                         # Preds ..B5.2
..LN295:
	.loc    1  111  is_stmt 1

###     {
###         while (fgets(buf, BUFLEN, sysinfo) != NULL)

        movl      $256, %esi                                    #111.16
..LN296:
        lea       (%rsp), %rdi                                  #111.16
..LN297:
        movq      %r12, %rdx                                    #111.16
..LN298:
#       fgets(char *__restrict__, int, FILE *__restrict__)
        call      fgets                                         #111.16
..LN299:
                                # LOE rax rbx rbp r12 r13 r14 r15
..B5.4:                         # Preds ..B5.3
..LN300:
        testq     %rax, %rax                                    #111.47
..LN301:
        je        ..B5.10       # Prob 1%                       #111.47
..LN302:
                                # LOE rbx rbp r12 r13 r14 r15
..B5.6:                         # Preds ..B5.4 ..B5.8
..L101:         # optimization report
                # %s was not vectorized: loop control variable was not identified. Explicitly compute the iteration count before executing the loop or try using canonical loop form
..LN303:
	.loc    1  113  is_stmt 1

###         {
###             if (!strncmp(buf, key, keylen))

        lea       (%rsp), %rax                                  #113.18
..LN304:
        movl      $10, %edx                                     #113.18
..LN305:
        lea       264(%rsp), %rcx                               #113.18
..LN306:
        call      __intel_sse4_strncmp                          #113.18
..LN307:
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B5.17:                        # Preds ..B5.6
..LN308:
        testl     %eax, %eax                                    #113.18
..LN309:
        je        ..B5.12       # Prob 20%                      #113.18
..LN310:
                                # LOE rbx rbp r12 r13 r14 r15
..B5.7:                         # Preds ..B5.17
..LN311:
	.loc    1  111  is_stmt 1
        movl      $256, %esi                                    #111.16
..LN312:
        lea       (%rsp), %rdi                                  #111.16
..LN313:
        movq      %r12, %rdx                                    #111.16
..LN314:
#       fgets(char *__restrict__, int, FILE *__restrict__)
        call      fgets                                         #111.16
..LN315:
                                # LOE rax rbx rbp r12 r13 r14 r15
..B5.8:                         # Preds ..B5.7
..LN316:
        testq     %rax, %rax                                    #111.47
..LN317:
        jne       ..B5.6        # Prob 82%                      #111.47
..LN318:
                                # LOE rbx rbp r12 r13 r14 r15
..B5.10:                        # Preds ..B5.8 ..B5.19 ..B5.4
..LN319:
	.loc    1  122  is_stmt 1

###             {
###             ptr = strstr(buf, "@" );
###                 // fprintf(stderr, "CPU freq: %s", ptr+1);
###                 sscanf(ptr+1, "%lf", &freq);
###                 // fprintf(stderr, "%lf\n", freq);
###             break;
###          }
###       }
###       fclose(sysinfo);

        movq      %r12, %rdi                                    #122.7
..LN320:
#       fclose(FILE *)
        call      fclose                                        #122.7
..LN321:
                                # LOE rbx rbp r13 r14 r15
..B5.11:                        # Preds ..B5.10 ..B5.2
..LN322:
	.loc    1  124  is_stmt 1

###    }
###    return(freq);

        vmovsd    256(%rsp), %xmm0                              #124.10
..LN323:
	.loc    1  124  epilogue_begin  is_stmt 1
        addq      $288, %rsp                                    #124.10
	.cfi_def_cfa_offset 16
	.cfi_restore 12
..LN324:
        popq      %r12                                          #124.10
	.cfi_def_cfa_offset 8
..LN325:
        ret                                                     #124.10
	.cfi_def_cfa_offset 304
	.cfi_offset 12, -16
..LN326:
                                # LOE
..B5.12:                        # Preds ..B5.17                 # Infreq
..LN327:
	.loc    1  115  is_stmt 1
        movl      $.L_2__STRING.2, %esi                         #115.19
..LN328:
        lea       (%rsp), %rdi                                  #115.19
..LN329:
#       strstr(const char *, const char *)
        call      strstr                                        #115.19
..LN330:
                                # LOE rax rbx rbp r12 r13 r14 r15
..B5.19:                        # Preds ..B5.12                 # Infreq
..LN331:
	.loc    1  117  is_stmt 1
        incq      %rax                                          #117.17
..LN332:
        movl      $.L_2__STRING.3, %esi                         #117.17
..LN333:
        movq      %rax, %rdi                                    #117.17
..LN334:
        lea       256(%rsp), %rdx                               #117.17
..LN335:
        xorl      %eax, %eax                                    #117.17
..LN336:
#       sscanf(const char *__restrict__, const char *__restrict__, ...)
        call      __isoc99_sscanf                               #117.17
..LN337:
        jmp       ..B5.10       # Prob 100%                     #117.17
        .align    16,0x90
	.cfi_endproc
..LN338:
                                # LOE rbx rbp r12 r13 r14 r15
..LN339:
# mark_end;
	.type	getCPUfreq,@function
	.size	getCPUfreq,.-getCPUfreq
..LNgetCPUfreq.340:
.LNgetCPUfreq:
	.data
# -- End  getCPUfreq
	.text
.L_2__routine_start_check_5:
# -- Begin  check
	.text
# mark_begin;
       .align    16,0x90
	.globl check
# --- check(float *)
check:
# parameter 1(arr): %rdi
..B6.1:                         # Preds ..B6.0

### {

	.cfi_startproc
..___tag_value_check.111:
..L112:
                                                        #155.1
..LN341:
	.loc    1  155  is_stmt 1
        pushq     %rbp                                          #155.1
	.cfi_def_cfa_offset 16
..LN342:
        movq      %rsp, %rbp                                    #155.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN343:
        andq      $-32, %rsp                                    #155.1
..LN344:
	.loc    1  158  prologue_end  is_stmt 1

###   real sum = 0;
### 
###   for (int i = 0; i < LEN; i++)

        movq      %rdi, %rdx                                    #158.3
..LN345:
        andq      $31, %rdx                                     #158.3
..LN346:
        movl      %edx, %ecx                                    #158.3
..LN347:
	.loc    1  156  is_stmt 1
        vxorps    %xmm0, %xmm0, %xmm0                           #156.12
..LN348:
	.loc    1  158  is_stmt 1
        testl     %ecx, %ecx                                    #158.3
..LN349:
        je        ..B6.7        # Prob 50%                      #158.3
..LN350:
                                # LOE rdx rbx rdi r12 r13 r14 r15 ecx xmm0
..B6.2:                         # Preds ..B6.1
..LN351:
        testb     $3, %cl                                       #158.3
..LN352:
        jne       ..B6.16       # Prob 10%                      #158.3
..LN353:
                                # LOE rbx rdi r12 r13 r14 r15 ecx xmm0
..B6.3:                         # Preds ..B6.2
..LN354:
        negl      %ecx                                          #158.3
..LN355:
        xorl      %eax, %eax                                    #158.3
..LN356:
        addl      $32, %ecx                                     #158.3
..LN357:
        shrl      $2, %ecx                                      #158.3
..LN358:
        movl      %ecx, %edx                                    #158.3
..LN359:
                                # LOE rax rdx rbx rdi r12 r13 r14 r15 ecx xmm0
..B6.4:                         # Preds ..B6.4 ..B6.3
..L117:         # optimization report
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 9.054688
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 7.000000
..LN360:
	.loc    1  159  is_stmt 1

###     sum += arr[i];

        vaddss    (%rdi,%rax,4), %xmm0, %xmm0                   #159.5
..LN361:
	.loc    1  158  is_stmt 1
        incq      %rax                                          #158.3
..LN362:
        cmpq      %rdx, %rax                                    #158.3
..LN363:
        jb        ..B6.4        # Prob 99%                      #158.3
..LN364:
                                # LOE rax rdx rbx rdi r12 r13 r14 r15 ecx xmm0
..B6.7:                         # Preds ..B6.1 ..B6.4
..LN365:
        negl      %ecx                                          #158.3
..LN366:
	.loc    1  156  is_stmt 1
        vxorps    %xmm1, %xmm1, %xmm1                           #156.12
..LN367:
	.loc    1  158  is_stmt 1
        andl      $7, %ecx                                      #158.3
..LN368:
	.loc    1  156  is_stmt 1
        vmovss    %xmm0, %xmm1, %xmm0                           #156.12
..LN369:
	.loc    1  158  is_stmt 1
        negq      %rcx                                          #158.3
..LN370:
        addq      $2048, %rcx                                   #158.3
..LN371:
	.loc    1  156  is_stmt 1
        vinsertf128 $1, %xmm1, %ymm0, %ymm0                     #156.12
..LN372:
                                # LOE rdx rcx rbx rdi r12 r13 r14 r15 ymm0
..B6.8:                         # Preds ..B6.8 ..B6.7
..L118:         # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 9.054688
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 7.000000
                # MAIN VECTOR TYPE: 32-bits floating point
..LN373:
	.loc    1  159  is_stmt 1
        vaddps    (%rdi,%rdx,4), %ymm0, %ymm0                   #159.5
..LN374:
	.loc    1  158  is_stmt 1
        addq      $8, %rdx                                      #158.3
..LN375:
        cmpq      %rcx, %rdx                                    #158.3
..LN376:
        jb        ..B6.8        # Prob 99%                      #158.3
..LN377:
                                # LOE rdx rcx rbx rdi r12 r13 r14 r15 ymm0
..B6.9:                         # Preds ..B6.8
..LN378:
	.loc    1  156  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #156.12
..LN379:
        vaddps    %xmm1, %xmm0, %xmm2                           #156.12
..LN380:
        vmovhlps  %xmm2, %xmm2, %xmm3                           #156.12
..LN381:
        vaddps    %xmm3, %xmm2, %xmm4                           #156.12
..LN382:
        vshufps   $245, %xmm4, %xmm4, %xmm5                     #156.12
..LN383:
        vaddss    %xmm5, %xmm4, %xmm0                           #156.12
..LN384:
                                # LOE rcx rbx rdi r12 r13 r14 r15 xmm0
..B6.10:                        # Preds ..B6.9 ..B6.16
..LN385:
	.loc    1  158  is_stmt 1
        cmpq      $2048, %rcx                                   #158.3
..LN386:
        jae       ..B6.14       # Prob 0%                       #158.3
..LN387:
                                # LOE rcx rbx rdi r12 r13 r14 r15 xmm0
..B6.12:                        # Preds ..B6.10 ..B6.12
..L119:         # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 9.054688
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 7.000000
..LN388:
	.loc    1  159  is_stmt 1
        vaddss    (%rdi,%rcx,4), %xmm0, %xmm0                   #159.5
..LN389:
	.loc    1  158  is_stmt 1
        incq      %rcx                                          #158.3
..LN390:
        cmpq      $2048, %rcx                                   #158.3
..LN391:
        jb        ..B6.12       # Prob 99%                      #158.3
..LN392:
                                # LOE rcx rbx rdi r12 r13 r14 r15 xmm0
..B6.14:                        # Preds ..B6.12 ..B6.10
..LN393:
	.loc    1  161  is_stmt 1

### 
###   printf("%f \n", sum);

        movl      $.L_2__STRING.4, %edi                         #161.3
..LN394:
        movl      $1, %eax                                      #161.3
..LN395:
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #161.3
..LN396:
        vzeroupper                                              #161.3
..___tag_value_check.120:
..LN397:
#       printf(const char *__restrict__, ...)
        call      printf                                        #161.3
..___tag_value_check.121:
..LN398:
                                # LOE rbx r12 r13 r14 r15
..B6.15:                        # Preds ..B6.14

### }

..LN399:
	.loc    1  162  epilogue_begin  is_stmt 1
        movq      %rbp, %rsp                                    #162.1
..LN400:
        popq      %rbp                                          #162.1
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN401:
        ret                                                     #162.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN402:
                                # LOE
..B6.16:                        # Preds ..B6.2                  # Infreq
..LN403:
	.loc    1  158  is_stmt 1
        xorl      %ecx, %ecx                                    #158.3
..LN404:
        jmp       ..B6.10       # Prob 100%                     #158.3
        .align    16,0x90
	.cfi_endproc
..LN405:
                                # LOE rcx rbx rdi r12 r13 r14 r15 xmm0
..LN406:
# mark_end;
	.type	check,@function
	.size	check,.-check
..LNcheck.407:
.LNcheck:
	.data
# -- End  check
	.text
.L_2__routine_start_axpy_stride_v1_6:
# -- Begin  axpy_stride_v1
	.text
# mark_begin;
       .align    16,0x90
	.globl axpy_stride_v1
# --- axpy_stride_v1()
axpy_stride_v1:
..B7.1:                         # Preds ..B7.0

### {

	.cfi_startproc
..___tag_value_axpy_stride_v1.130:
..L131:
                                                        #187.1
..LN408:
	.loc    1  187  is_stmt 1
        pushq     %rbp                                          #187.1
	.cfi_def_cfa_offset 16
..LN409:
        movq      %rsp, %rbp                                    #187.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN410:
        andq      $-32, %rsp                                    #187.1
..LN411:
        subq      $32, %rsp                                     #187.1

###   double start_t, end_t, wall_dif;
### 
###   init();

..___tag_value_axpy_stride_v1.136:
..LN412:
	.loc    1  190  prologue_end  is_stmt 1
#       init()
        call      init                                          #190.3
..___tag_value_axpy_stride_v1.137:
..LN413:
                                # LOE rbx r12 r13 r14 r15
..B7.2:                         # Preds ..B7.1

###   start_t = get_wall_time();

..___tag_value_axpy_stride_v1.138:
..LN414:
	.loc    1  191  is_stmt 1
#       get_wall_time()
        call      get_wall_time                                 #191.13
..___tag_value_axpy_stride_v1.139:
..LN415:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B7.16:                        # Preds ..B7.2
..LN416:
        vmovsd    %xmm0, (%rsp)                                 #191.13
..LN417:
                                # LOE rbx r12 r13 r14 r15
..B7.3:                         # Preds ..B7.16
..LN418:
	.loc    1  193  is_stmt 1

### 
###   for (uint nl = 0; nl < NTIMES; nl++) {

        xorl      %eax, %eax                                    #193.3
..LN419:
        movq      %r12, 8(%rsp)                                 #193.3
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
..LN420:
        movl      %eax, %r12d                                   #193.3
..LN421:
                                # LOE rbx r13 r14 r15 r12d
..B7.4:                         # Preds ..B7.7 ..B7.3
..L141:         # optimization report
                # %s was not vectorized: inner loop was already vectorized
..LN422:
	.loc    1  194  is_stmt 1

###     for (int i = 0; i < LEN; i+=2) {

        xorl      %edx, %edx                                    #194.5
..LN423:
	.loc    1  195  is_stmt 1

###       y[i] = alpha*x[i] + y[i];

        vmovss    alpha(%rip), %xmm0                            #195.14
..LN424:
	.loc    1  197  is_stmt 1

###     }
###     dummy(x, y, z, alpha);

        vbroadcastss %xmm0, %xmm1                               #197.20
..LN425:
                                # LOE rdx rbx r13 r14 r15 r12d xmm0 xmm1
..B7.5:                         # Preds ..B7.5 ..B7.4
..L142:         # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 1.067383
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.035156
                # MAIN VECTOR TYPE: 32-bits floating point
..LN426:
	.loc    1  195  is_stmt 1
        lea       (,%rdx,8), %rcx                               #195.7
..LN427:
        vmovss    x(,%rdx,8), %xmm2                             #195.20
..LN428:
        vmovss    y(,%rdx,8), %xmm5                             #195.27
..LN429:
        vinsertps $16, 8+y(,%rdx,8), %xmm5, %xmm6               #195.27
..LN430:
        vinsertps $16, 8+x(,%rdx,8), %xmm2, %xmm3               #195.20
..LN431:
        vinsertps $32, 16+x(,%rdx,8), %xmm3, %xmm4              #195.20
..LN432:
        vinsertps $32, 16+y(,%rdx,8), %xmm6, %xmm7              #195.27
..LN433:
        vinsertps $48, 24+y(,%rdx,8), %xmm7, %xmm9              #195.27
..LN434:
        vinsertps $48, 24+x(,%rdx,8), %xmm4, %xmm8              #195.20
..LN435:
	.loc    1  194  is_stmt 1
        addq      $4, %rdx                                      #194.5
..LN436:
	.loc    1  195  is_stmt 1
        vfmadd231ps %xmm1, %xmm8, %xmm9                         #195.27
..LN437:
	.loc    1  194  is_stmt 1
        cmpq      $1024, %rdx                                   #194.5
..LN438:
	.loc    1  195  is_stmt 1
        vmovss    %xmm9, y(%rcx)                                #195.7
..LN439:
        vextractps $1, %xmm9, 8+y(%rcx)                         #195.7
..LN440:
        vextractps $2, %xmm9, 16+y(%rcx)                        #195.7
..LN441:
        vextractps $3, %xmm9, 24+y(%rcx)                        #195.7
..LN442:
	.loc    1  194  is_stmt 1
        jb        ..B7.5        # Prob 99%                      #194.5
..LN443:
                                # LOE rdx rbx r13 r14 r15 r12d xmm0 xmm1
..B7.6:                         # Preds ..B7.5
..LN444:
	.loc    1  197  is_stmt 1
        movl      $x, %edi                                      #197.5
..LN445:
        movl      $y, %esi                                      #197.5
..LN446:
        movl      $z, %edx                                      #197.5
..___tag_value_axpy_stride_v1.143:
..LN447:
#       dummy(float *, float *, float *, float)
        call      dummy                                         #197.5
..___tag_value_axpy_stride_v1.144:
..LN448:
                                # LOE rbx r13 r14 r15 r12d
..B7.7:                         # Preds ..B7.6
..LN449:
	.loc    1  193  is_stmt 1
        incl      %r12d                                         #193.3
..LN450:
        cmpl      $4882812, %r12d                               #193.3
..LN451:
        jb        ..B7.4        # Prob 82%                      #193.3
..LN452:
                                # LOE rbx r13 r14 r15 r12d
..B7.8:                         # Preds ..B7.7
..LN453:
        movq      8(%rsp), %r12                                 #
	.cfi_restore 12

###   }
###   end_t = get_wall_time(); wall_dif = end_t - start_t;

..___tag_value_axpy_stride_v1.146:
..LN454:
	.loc    1  199  is_stmt 1
#       get_wall_time()
        call      get_wall_time                                 #199.11
..___tag_value_axpy_stride_v1.147:
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
..LN455:
                                # LOE rbx r12 r13 r14 r15 r12d r12b xmm0
..B7.9:                         # Preds ..B7.8
..LN456:
	.loc    1  200  is_stmt 1

###   results(wall_dif, LEN - AVX_LEN, "axpy_stride_v1");

        movl      $2040, %edi                                   #200.3
..LN457:
        movl      $.L_2__STRING.6, %esi                         #200.3
..LN458:
        vsubsd    (%rsp), %xmm0, %xmm0                          #200.3
..___tag_value_axpy_stride_v1.149:
..LN459:
#       results(double, unsigned int, char *)
        call      results                                       #200.3
..___tag_value_axpy_stride_v1.150:
..LN460:
                                # LOE rbx r12 r13 r14 r15 r12d r12b
..B7.10:                        # Preds ..B7.9
..LN461:
	.loc    1  158  is_stmt 1
        xorl      %eax, %eax                                    #158.3
..LN462:
	.loc    1  156  is_stmt 1
        vxorps    %ymm0, %ymm0, %ymm0                           #156.12
..LN463:
                                # LOE rax rbx r12 r13 r14 r15 ymm0
..B7.11:                        # Preds ..B7.11 ..B7.10
..L151:         # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 7.847656
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 5.000000
                # MAIN VECTOR TYPE: 32-bits floating point
..LN464:
	.loc    1  159  is_stmt 1
        vaddps    y(,%rax,4), %ymm0, %ymm0                      #159.5
..LN465:
	.loc    1  158  is_stmt 1
        addq      $8, %rax                                      #158.3
..LN466:
        cmpq      $2048, %rax                                   #158.3
..LN467:
        jb        ..B7.11       # Prob 99%                      #158.3
..LN468:
                                # LOE rax rbx r12 r13 r14 r15 ymm0
..B7.12:                        # Preds ..B7.11
..LN469:
	.loc    1  161  is_stmt 1
        movl      $.L_2__STRING.4, %edi                         #161.3
..LN470:
	.loc    1  156  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #156.12
..LN471:
	.loc    1  161  is_stmt 1
        movl      $1, %eax                                      #161.3
..LN472:
	.loc    1  156  is_stmt 1
        vaddps    %xmm1, %xmm0, %xmm2                           #156.12
..LN473:
        vmovhlps  %xmm2, %xmm2, %xmm3                           #156.12
..LN474:
        vaddps    %xmm3, %xmm2, %xmm4                           #156.12
..LN475:
        vshufps   $245, %xmm4, %xmm4, %xmm5                     #156.12
..LN476:
        vaddss    %xmm5, %xmm4, %xmm0                           #156.12
..LN477:
	.loc    1  161  is_stmt 1
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #161.3
..LN478:
        vzeroupper                                              #161.3
..___tag_value_axpy_stride_v1.152:
..LN479:
#       printf(const char *__restrict__, ...)
        call      printf                                        #161.3
..___tag_value_axpy_stride_v1.153:
..LN480:
                                # LOE rbx r12 r13 r14 r15
..B7.13:                        # Preds ..B7.12
..LN481:
	.loc    1  202  is_stmt 1

###   check(y);
###   return 0;

        xorl      %eax, %eax                                    #202.10
..LN482:
	.loc    1  202  epilogue_begin  is_stmt 1
        movq      %rbp, %rsp                                    #202.10
..LN483:
        popq      %rbp                                          #202.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN484:
        ret                                                     #202.10
        .align    16,0x90
	.cfi_endproc
..LN485:
                                # LOE
..LN486:
# mark_end;
	.type	axpy_stride_v1,@function
	.size	axpy_stride_v1,.-axpy_stride_v1
..LNaxpy_stride_v1.487:
.LNaxpy_stride_v1:
	.data
# -- End  axpy_stride_v1
	.text
.L_2__routine_start_axpy_stride_v2_7:
# -- Begin  axpy_stride_v2
	.text
# mark_begin;
       .align    16,0x90
	.globl axpy_stride_v2
# --- axpy_stride_v2(float *__restrict__, float *__restrict__)
axpy_stride_v2:
# parameter 1(vx): %rdi
# parameter 2(vy): %rsi
..B8.1:                         # Preds ..B8.0

### {

	.cfi_startproc
..___tag_value_axpy_stride_v2.160:
..L161:
                                                        #207.1
..LN488:
	.loc    1  207  is_stmt 1
        pushq     %rbp                                          #207.1
	.cfi_def_cfa_offset 16
..LN489:
        movq      %rsp, %rbp                                    #207.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN490:
        andq      $-32, %rsp                                    #207.1
..LN491:
        pushq     %r15                                          #207.1
..LN492:
        pushq     %rbx                                          #207.1
..LN493:
        subq      $16, %rsp                                     #207.1
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
..LN494:
        movq      %rsi, %rbx                                    #207.1
..LN495:
        movq      %rdi, %r15                                    #207.1

###   real *xx = __builtin_assume_aligned(vx, SIMD_ALIGN);
###   real *yy = __builtin_assume_aligned(vy, SIMD_ALIGN);
###   //real *z = __builtin_assume_aligned(c, SIMD_ALIGN);
###   double start_t, end_t, wall_dif;
### 
###   init();

..___tag_value_axpy_stride_v2.168:
..LN496:
	.loc    1  213  prologue_end  is_stmt 1
#       init()
        call      init                                          #213.3
..___tag_value_axpy_stride_v2.169:
..LN497:
                                # LOE rbx r12 r13 r14 r15
..B8.2:                         # Preds ..B8.1

###   start_t = get_wall_time();

..___tag_value_axpy_stride_v2.170:
..LN498:
	.loc    1  214  is_stmt 1
#       get_wall_time()
        call      get_wall_time                                 #214.13
..___tag_value_axpy_stride_v2.171:
..LN499:
                                # LOE rbx r12 r13 r14 r15 xmm0
..B8.16:                        # Preds ..B8.2
..LN500:
        vmovsd    %xmm0, (%rsp)                                 #214.13
..LN501:
                                # LOE rbx r12 r13 r14 r15
..B8.3:                         # Preds ..B8.16
..LN502:
	.loc    1  216  is_stmt 1

### 
###   for (uint nl = 0; nl < NTIMES; nl++) {

        xorl      %eax, %eax                                    #216.3
..LN503:
        movq      %r14, 8(%rsp)                                 #216.3
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
..LN504:
        movq      %r15, %r14                                    #216.3
..LN505:
        movl      %eax, %r15d                                   #216.3
..LN506:
                                # LOE rbx r12 r13 r14 r15d
..B8.4:                         # Preds ..B8.7 ..B8.3
..L173:         # optimization report
                # %s was not vectorized: inner loop was already vectorized
..LN507:
	.loc    1  217  is_stmt 1

###     for (int i = 0; i < LEN; i+=2) {

        xorl      %edx, %edx                                    #217.5
..LN508:
	.loc    1  218  is_stmt 1

###       yy[i] = alpha*xx[i] + yy[i];

        vmovss    alpha(%rip), %xmm0                            #218.15
..LN509:
        vbroadcastss %xmm0, %xmm1                               #218.15
        .align    16,0x90
..LN510:
                                # LOE rbx r12 r13 r14 edx r15d xmm0 xmm1
..B8.5:                         # Preds ..B8.5 ..B8.4
..L174:         # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 1.600586
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 4
                # NORMALIZED VECTORIZATION OVERHEAD 0.035156
                # MAIN VECTOR TYPE: 32-bits floating point
..LN511:
        lea       (%rdx,%rdx), %ecx                             #218.21
..LN512:
        vmovss    (%r14,%rcx,4), %xmm2                          #218.21
..LN513:
	.loc    1  217  is_stmt 1
        addl      $4, %edx                                      #217.5
..LN514:
	.loc    1  218  is_stmt 1
        vmovss    (%rbx,%rcx,4), %xmm5                          #218.29
..LN515:
        lea       (%rbx,%rcx,4), %r8                            #218.7
..LN516:
        vinsertps $16, 8(%r8), %xmm5, %xmm6                     #218.29
..LN517:
	.loc    1  217  is_stmt 1
        cmpl      $1024, %edx                                   #217.5
..LN518:
	.loc    1  218  is_stmt 1
        vinsertps $16, 8(%r14,%rcx,4), %xmm2, %xmm3             #218.21
..LN519:
        vinsertps $32, 16(%r14,%rcx,4), %xmm3, %xmm4            #218.21
..LN520:
        vinsertps $32, 16(%r8), %xmm6, %xmm7                    #218.29
..LN521:
        vinsertps $48, 24(%r8), %xmm7, %xmm9                    #218.29
..LN522:
        vinsertps $48, 24(%r14,%rcx,4), %xmm4, %xmm8            #218.21
..LN523:
        vfmadd231ps %xmm1, %xmm8, %xmm9                         #218.29
..LN524:
        vmovss    %xmm9, (%r8)                                  #218.7
..LN525:
        vextractps $1, %xmm9, 8(%r8)                            #218.7
..LN526:
        vextractps $2, %xmm9, 16(%r8)                           #218.7
..LN527:
        vextractps $3, %xmm9, 24(%r8)                           #218.7
..LN528:
	.loc    1  217  is_stmt 1
        jb        ..B8.5        # Prob 99%                      #217.5
..LN529:
                                # LOE rbx r12 r13 r14 edx r15d xmm0 xmm1
..B8.6:                         # Preds ..B8.5
..LN530:
	.loc    1  220  is_stmt 1

###     }
###     dummy(xx, yy, z, alpha);

        movq      %r14, %rdi                                    #220.5
..LN531:
        movq      %rbx, %rsi                                    #220.5
..LN532:
        movl      $z, %edx                                      #220.5
..___tag_value_axpy_stride_v2.175:
..LN533:
#       dummy(float *, float *, float *, float)
        call      dummy                                         #220.5
..___tag_value_axpy_stride_v2.176:
..LN534:
                                # LOE rbx r12 r13 r14 r15d
..B8.7:                         # Preds ..B8.6
..LN535:
	.loc    1  216  is_stmt 1
        incl      %r15d                                         #216.3
..LN536:
        cmpl      $4882812, %r15d                               #216.3
..LN537:
        jb        ..B8.4        # Prob 82%                      #216.3
..LN538:
                                # LOE rbx r12 r13 r14 r15d
..B8.8:                         # Preds ..B8.7
..LN539:
        movq      8(%rsp), %r14                                 #
	.cfi_restore 14

###   }
###   end_t = get_wall_time(); wall_dif = end_t - start_t;

..___tag_value_axpy_stride_v2.178:
..LN540:
	.loc    1  222  is_stmt 1
#       get_wall_time()
        call      get_wall_time                                 #222.11
..___tag_value_axpy_stride_v2.179:
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
..LN541:
                                # LOE rbx r12 r13 r14 r14d r14b xmm0
..B8.9:                         # Preds ..B8.8
..LN542:
	.loc    1  223  is_stmt 1

###   results(wall_dif, LEN - AVX_LEN, "axpy_stride_v2");

        movl      $2040, %edi                                   #223.3
..LN543:
        movl      $.L_2__STRING.7, %esi                         #223.3
..LN544:
        vsubsd    (%rsp), %xmm0, %xmm0                          #223.3
..___tag_value_axpy_stride_v2.181:
..LN545:
#       results(double, unsigned int, char *)
        call      results                                       #223.3
..___tag_value_axpy_stride_v2.182:
..LN546:
                                # LOE rbx r12 r13 r14 r14d r14b
..B8.10:                        # Preds ..B8.9
..LN547:
	.loc    1  158  is_stmt 1
        xorl      %eax, %eax                                    #158.3
..LN548:
	.loc    1  156  is_stmt 1
        vxorps    %ymm0, %ymm0, %ymm0                           #156.12
..LN549:
                                # LOE rax rbx r12 r13 r14 ymm0
..B8.11:                        # Preds ..B8.11 ..B8.10
..L183:         # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 9.421875
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 5.000000
                # MAIN VECTOR TYPE: 32-bits floating point
..LN550:
	.loc    1  159  is_stmt 1
        vaddps    (%rbx,%rax,4), %ymm0, %ymm0                   #159.5
..LN551:
	.loc    1  158  is_stmt 1
        addq      $8, %rax                                      #158.3
..LN552:
        cmpq      $2048, %rax                                   #158.3
..LN553:
        jb        ..B8.11       # Prob 99%                      #158.3
..LN554:
                                # LOE rax rbx r12 r13 r14 ymm0
..B8.12:                        # Preds ..B8.11
..LN555:
	.loc    1  161  is_stmt 1
        movl      $.L_2__STRING.4, %edi                         #161.3
..LN556:
	.loc    1  156  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #156.12
..LN557:
	.loc    1  161  is_stmt 1
        movl      $1, %eax                                      #161.3
..LN558:
	.loc    1  156  is_stmt 1
        vaddps    %xmm1, %xmm0, %xmm2                           #156.12
..LN559:
        vmovhlps  %xmm2, %xmm2, %xmm3                           #156.12
..LN560:
        vaddps    %xmm3, %xmm2, %xmm4                           #156.12
..LN561:
        vshufps   $245, %xmm4, %xmm4, %xmm5                     #156.12
..LN562:
        vaddss    %xmm5, %xmm4, %xmm0                           #156.12
..LN563:
	.loc    1  161  is_stmt 1
        vcvtss2sd %xmm0, %xmm0, %xmm0                           #161.3
..LN564:
        vzeroupper                                              #161.3
..___tag_value_axpy_stride_v2.184:
..LN565:
#       printf(const char *__restrict__, ...)
        call      printf                                        #161.3
..___tag_value_axpy_stride_v2.185:
..LN566:
                                # LOE r12 r13 r14
..B8.13:                        # Preds ..B8.12
..LN567:
	.loc    1  225  is_stmt 1

###   check(yy);
###   return 0;

        xorl      %eax, %eax                                    #225.10
..LN568:
	.loc    1  225  epilogue_begin  is_stmt 1
        addq      $16, %rsp                                     #225.10
	.cfi_restore 3
..LN569:
        popq      %rbx                                          #225.10
	.cfi_restore 15
..LN570:
        popq      %r15                                          #225.10
..LN571:
        movq      %rbp, %rsp                                    #225.10
..LN572:
        popq      %rbp                                          #225.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN573:
        ret                                                     #225.10
        .align    16,0x90
	.cfi_endproc
..LN574:
                                # LOE
..LN575:
# mark_end;
	.type	axpy_stride_v2,@function
	.size	axpy_stride_v2,.-axpy_stride_v2
..LNaxpy_stride_v2.576:
.LNaxpy_stride_v2:
	.data
# -- End  axpy_stride_v2
	.text
.L_2__routine_start_set1d_8:
# -- Begin  set1d
	.text
# mark_begin;
       .align    16,0x90
	.globl set1d
# --- set1d(float *, float, int)
set1d:
# parameter 1(arr): %rdi
# parameter 2(value): %xmm0
# parameter 3(stride): %esi
..B9.1:                         # Preds ..B9.0

### {  

	.cfi_startproc
..___tag_value_set1d.195:
..L196:
                                                        #134.1
..LN577:
	.loc    1  134  prologue_end  is_stmt 1
..LN578:
	.loc    1  135  is_stmt 1

###   if (stride == -1) {

        cmpl      $-1, %esi                                     #135.7
..LN579:
        jne       ..B9.14       # Prob 66%                      #135.7
..LN580:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B9.2:                         # Preds ..B9.1
..LN581:
	.loc    1  136  is_stmt 1

###     for (unsigned int i = 0; i < LEN; i++)

        movq      %rdi, %rdx                                    #136.5
..LN582:
        andq      $31, %rdx                                     #136.5
..LN583:
        movl      %edx, %edx                                    #136.5
..LN584:
        testl     %edx, %edx                                    #136.5
..LN585:
        je        ..B9.7        # Prob 50%                      #136.5
..LN586:
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15
..B9.3:                         # Preds ..B9.2
..LN587:
        testb     $3, %dl                                       #136.5
..LN588:
        jne       ..B9.31       # Prob 10%                      #136.5
..LN589:
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15
..B9.4:                         # Preds ..B9.3
..LN590:
        negl      %edx                                          #136.5
..LN591:
        xorl      %eax, %eax                                    #136.5
..LN592:
        addl      $32, %edx                                     #136.5
..LN593:
        shrl      $2, %edx                                      #136.5
..LN594:
	.loc    1  137  is_stmt 1

###       arr[i] = 1. / (real) (i+1);

        vmovss    .L_2il0floatpacket.7(%rip), %xmm0             #137.16
..LN595:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B9.5:                         # Preds ..B9.5 ..B9.4
..L198:         # optimization report
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 7.148438
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 0.312500
..LN596:
        lea       1(%rax), %ecx                                 #137.31
..LN597:
        vcvtsi2ssq %rcx, %xmm1, %xmm1                           #137.31
..LN598:
        vdivss    %xmm1, %xmm0, %xmm2                           #137.31
..LN599:
        vmovss    %xmm2, (%rdi,%rax,4)                          #137.7
..LN600:
	.loc    1  136  is_stmt 1
        movl      %ecx, %eax                                    #136.5
..LN601:
        cmpl      %edx, %ecx                                    #136.5
..LN602:
        jb        ..B9.5        # Prob 99%                      #136.5
..LN603:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B9.7:                         # Preds ..B9.5 ..B9.2
..LN604:
	.loc    1  137  is_stmt 1
        movl      $8, %ecx                                      #137.31
..LN605:
        lea       1(%rdx), %esi                                 #137.31
..LN606:
	.loc    1  136  is_stmt 1
        movl      %edx, %eax                                    #136.5
..LN607:
        negl      %eax                                          #136.5
..LN608:
        andl      $7, %eax                                      #136.5
..LN609:
	.loc    1  137  is_stmt 1
        vmovd     %esi, %xmm0                                   #137.31
..LN610:
        vmovd     %ecx, %xmm1                                   #137.31
..LN611:
        vpbroadcastd %xmm0, %ymm2                               #137.31
..LN612:
	.loc    1  136  is_stmt 1
        negl      %eax                                          #136.5
..LN613:
	.loc    1  137  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #137.31
..LN614:
	.loc    1  136  is_stmt 1
        addl      $2048, %eax                                   #136.5
..LN615:
	.loc    1  137  is_stmt 1
        vpaddd    .L_2il0floatpacket.4(%rip), %ymm2, %ymm0      #137.31
..LN616:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 ymm0 ymm1
..B9.8:                         # Preds ..B9.8 ..B9.7
..L199:         # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 7.148438
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 0.312500
                # MAIN VECTOR TYPE: 32-bits floating point
..LN617:
        vpsrld    $8, %ymm0, %ymm2                              #137.31
..LN618:
        vpand     .L_2il0floatpacket.5(%rip), %ymm0, %ymm3      #137.31
..LN619:
        vpaddd    %ymm1, %ymm0, %ymm0                           #137.31
..LN620:
        vcvtdq2ps %ymm2, %ymm5                                  #137.31
..LN621:
        vcvtdq2ps %ymm3, %ymm4                                  #137.31
..LN622:
        vfmadd132ps .L_2il0floatpacket.6(%rip), %ymm4, %ymm5    #137.31
..LN623:
        vrcpps    %ymm5, %ymm6                                  #137.31
..LN624:
        vmulps    %ymm5, %ymm6, %ymm8                           #137.31
..LN625:
        vaddps    %ymm6, %ymm6, %ymm7                           #137.31
..LN626:
        vfnmadd213ps %ymm7, %ymm6, %ymm8                        #137.31
..LN627:
        vmovups   %ymm8, (%rdi,%rdx,4)                          #137.7
..LN628:
	.loc    1  136  is_stmt 1
        addl      $8, %edx                                      #136.5
..LN629:
        cmpl      %eax, %edx                                    #136.5
..LN630:
        jb        ..B9.8        # Prob 99%                      #136.5
..LN631:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 ymm0 ymm1
..B9.10:                        # Preds ..B9.8 ..B9.31
..LN632:
        cmpl      $2048, %eax                                   #136.5
..LN633:
        jae       ..B9.30       # Prob 0%                       #136.5
..LN634:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15
..B9.11:                        # Preds ..B9.10
..LN635:
	.loc    1  137  is_stmt 1
        vmovss    .L_2il0floatpacket.7(%rip), %xmm0             #137.16
..LN636:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 xmm0
..B9.12:                        # Preds ..B9.12 ..B9.11
..L200:         # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 7.148438
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 0.312500
..LN637:
        lea       1(%rax), %edx                                 #137.31
..LN638:
        vcvtsi2ssq %rdx, %xmm1, %xmm1                           #137.31
..LN639:
        vdivss    %xmm1, %xmm0, %xmm2                           #137.31
..LN640:
        vmovss    %xmm2, (%rdi,%rax,4)                          #137.7
..LN641:
	.loc    1  136  is_stmt 1
        movl      %edx, %eax                                    #136.5
..LN642:
        cmpl      $2048, %edx                                   #136.5
..LN643:
        jb        ..B9.12       # Prob 99%                      #136.5
..LN644:
        jmp       ..B9.30       # Prob 100%                     #136.5
..LN645:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 xmm0
..B9.14:                        # Preds ..B9.1
..LN646:
	.loc    1  135  is_stmt 1
        cmpl      $-2, %esi                                     #135.7
..LN647:
        jne       ..B9.27       # Prob 50%                      #135.7
..LN648:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B9.15:                        # Preds ..B9.14
..LN649:
	.loc    1  141  is_stmt 1

###   }
###   else if (stride == -2) {
###     /* if (i > 65535) -> overflow of (i+1)*(i+1) */
###     for (unsigned int i = 0; i < LEN; i++)

        movq      %rdi, %rax                                    #141.5
..LN650:
        andq      $31, %rax                                     #141.5
..LN651:
        movl      %eax, %eax                                    #141.5
..LN652:
        testl     %eax, %eax                                    #141.5
..LN653:
        je        ..B9.20       # Prob 50%                      #141.5
..LN654:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15
..B9.16:                        # Preds ..B9.15
..LN655:
        testb     $3, %al                                       #141.5
..LN656:
        jne       ..B9.32       # Prob 10%                      #141.5
..LN657:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15
..B9.17:                        # Preds ..B9.16
..LN658:
        negl      %eax                                          #141.5
..LN659:
        xorl      %edx, %edx                                    #141.5
..LN660:
        addl      $32, %eax                                     #141.5
..LN661:
        shrl      $2, %eax                                      #141.5
..LN662:
	.loc    1  142  is_stmt 1

###       arr[i] = 1. / (real) ((i+1) * (i+1));

        vmovss    .L_2il0floatpacket.7(%rip), %xmm0             #142.16
..LN663:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B9.18:                        # Preds ..B9.18 ..B9.17
..L201:         # optimization report
                # PEELED LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 7.183594
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 0.312500
..LN664:
        lea       1(%rdx), %esi                                 #142.32
..LN665:
        movl      %esi, %ecx                                    #142.40
..LN666:
        vxorps    %xmm1, %xmm1, %xmm1                           #142.40
..LN667:
        imull     %esi, %ecx                                    #142.40
..LN668:
        vcvtsi2ssq %rcx, %xmm1, %xmm1                           #142.40
..LN669:
        vdivss    %xmm1, %xmm0, %xmm2                           #142.40
..LN670:
        vmovss    %xmm2, (%rdi,%rdx,4)                          #142.7
..LN671:
	.loc    1  141  is_stmt 1
        movl      %esi, %edx                                    #141.5
..LN672:
        cmpl      %eax, %esi                                    #141.5
..LN673:
        jb        ..B9.18       # Prob 99%                      #141.5
..LN674:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B9.20:                        # Preds ..B9.18 ..B9.15
..LN675:
	.loc    1  142  is_stmt 1
        movl      $8, %ecx                                      #142.32
..LN676:
        lea       1(%rax), %esi                                 #142.32
..LN677:
	.loc    1  141  is_stmt 1
        movl      %eax, %edx                                    #141.5
..LN678:
        negl      %edx                                          #141.5
..LN679:
        andl      $7, %edx                                      #141.5
..LN680:
	.loc    1  142  is_stmt 1
        vmovd     %esi, %xmm0                                   #142.32
..LN681:
        vmovd     %ecx, %xmm1                                   #142.32
..LN682:
        vpbroadcastd %xmm0, %ymm2                               #142.32
..LN683:
	.loc    1  141  is_stmt 1
        negl      %edx                                          #141.5
..LN684:
	.loc    1  142  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #142.32
..LN685:
	.loc    1  141  is_stmt 1
        addl      $2048, %edx                                   #141.5
..LN686:
	.loc    1  142  is_stmt 1
        vpaddd    .L_2il0floatpacket.4(%rip), %ymm2, %ymm0      #142.32
        .align    16,0x90
..LN687:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 ymm0 ymm1
..B9.21:                        # Preds ..B9.21 ..B9.20
..L202:         # optimization report
                # LOOP WAS VECTORIZED
                # VECTORIZATION SPEEDUP COEFFECIENT 7.183594
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 0.312500
                # MAIN VECTOR TYPE: 32-bits floating point
..LN688:
        vpmulld   %ymm0, %ymm0, %ymm3                           #142.40
..LN689:
        vpsrld    $8, %ymm3, %ymm2                              #142.40
..LN690:
        vpand     .L_2il0floatpacket.5(%rip), %ymm3, %ymm4      #142.40
..LN691:
        vpaddd    %ymm1, %ymm0, %ymm0                           #142.32
..LN692:
        vcvtdq2ps %ymm2, %ymm6                                  #142.40
..LN693:
        vcvtdq2ps %ymm4, %ymm5                                  #142.40
..LN694:
        vfmadd132ps .L_2il0floatpacket.6(%rip), %ymm5, %ymm6    #142.40
..LN695:
        vrcpps    %ymm6, %ymm7                                  #142.40
..LN696:
        vmulps    %ymm6, %ymm7, %ymm9                           #142.40
..LN697:
        vaddps    %ymm7, %ymm7, %ymm8                           #142.40
..LN698:
        vfnmadd213ps %ymm8, %ymm7, %ymm9                        #142.40
..LN699:
        vmovups   %ymm9, (%rdi,%rax,4)                          #142.7
..LN700:
	.loc    1  141  is_stmt 1
        addl      $8, %eax                                      #141.5
..LN701:
        cmpl      %edx, %eax                                    #141.5
..LN702:
        jb        ..B9.21       # Prob 99%                      #141.5
..LN703:
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 ymm0 ymm1
..B9.23:                        # Preds ..B9.21 ..B9.32
..LN704:
        cmpl      $2048, %edx                                   #141.5
..LN705:
        jae       ..B9.30       # Prob 0%                       #141.5
..LN706:
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15
..B9.24:                        # Preds ..B9.23
..LN707:
	.loc    1  142  is_stmt 1
        vmovss    .L_2il0floatpacket.7(%rip), %xmm0             #142.16
..LN708:
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B9.25:                        # Preds ..B9.25 ..B9.24
..L203:         # optimization report
                # REMAINDER LOOP FOR VECTORIZATION
                # VECTORIZATION SPEEDUP COEFFECIENT 7.183594
                # VECTOR TRIP COUNT IS KNOWN CONSTANT
                # VECTOR LENGTH 8
                # NORMALIZED VECTORIZATION OVERHEAD 0.312500
..LN709:
        lea       1(%rdx), %ecx                                 #142.32
..LN710:
        movl      %ecx, %eax                                    #142.40
..LN711:
        vxorps    %xmm1, %xmm1, %xmm1                           #142.40
..LN712:
        imull     %ecx, %eax                                    #142.40
..LN713:
        vcvtsi2ssq %rax, %xmm1, %xmm1                           #142.40
..LN714:
        vdivss    %xmm1, %xmm0, %xmm2                           #142.40
..LN715:
        vmovss    %xmm2, (%rdi,%rdx,4)                          #142.7
..LN716:
	.loc    1  141  is_stmt 1
        movl      %ecx, %edx                                    #141.5
..LN717:
        cmpl      $2048, %ecx                                   #141.5
..LN718:
        jb        ..B9.25       # Prob 99%                      #141.5
..LN719:
        jmp       ..B9.30       # Prob 100%                     #141.5
..LN720:
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 xmm0
..B9.27:                        # Preds ..B9.14
..LN721:
	.loc    1  145  is_stmt 1

###   }
###   else {
###     for (unsigned int i = 0; i < LEN; i += stride)

        xorl      %eax, %eax                                    #145.25
..LN722:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B9.28:                        # Preds ..B9.28 ..B9.27
..L204:         # optimization report
                # %s was not vectorized: loop control variable %s was found, but loop iteration count cannot be computed before executing the loop
..LN723:
	.loc    1  146  is_stmt 1

###       arr[i] = value;

        vmovss    %xmm0, (%rdi,%rax,4)                          #146.7
..LN724:
	.loc    1  145  is_stmt 1
        addl      %esi, %eax                                    #145.39
..LN725:
        cmpl      $2048, %eax                                   #145.34
..LN726:
        jb        ..B9.28       # Prob 82%                      #145.34
..LN727:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B9.30:                        # Preds ..B9.28 ..B9.25 ..B9.12 ..B9.23 ..B9.10
                                #      
..LN728:
	.loc    1  148  is_stmt 1

###   }
###   return 0;

        vzeroupper                                              #148.10
..LN729:
        xorl      %eax, %eax                                    #148.10
..LN730:
	.loc    1  148  epilogue_begin  is_stmt 1
        ret                                                     #148.10
..LN731:
                                # LOE
..B9.31:                        # Preds ..B9.3                  # Infreq
..LN732:
	.loc    1  136  is_stmt 1
        xorl      %eax, %eax                                    #136.5
..LN733:
        jmp       ..B9.10       # Prob 100%                     #136.5
..LN734:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15
..B9.32:                        # Preds ..B9.16                 # Infreq
..LN735:
	.loc    1  141  is_stmt 1
        xorl      %edx, %edx                                    #141.5
..LN736:
        jmp       ..B9.23       # Prob 100%                     #141.5
        .align    16,0x90
	.cfi_endproc
..LN737:
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15
..LN738:
# mark_end;
	.type	set1d,@function
	.size	set1d,.-set1d
..LNset1d.739:
.LNset1d:
	.data
# -- End  set1d
	.text
.L_2__routine_start_init_9:
# -- Begin  init
	.text
# mark_begin;
       .align    16,0x90
	.globl init
# --- init()
init:
..B10.1:                        # Preds ..B10.0

### {

	.cfi_startproc
..___tag_value_init.209:
..L210:
                                                        #166.1
..LN740:
	.loc    1  166  is_stmt 1
        pushq     %rsi                                          #166.1
	.cfi_def_cfa_offset 16
..LN741:
	.loc    1  170  prologue_end  is_stmt 1

###   real any = 0., one = 1.;
###   int unit = 1, frac1 = -1;
### 
###   set1d(x, one, unit);

        movl      $x, %edi                                      #170.3
..LN742:
        vmovss    .L_2il0floatpacket.7(%rip), %xmm0             #170.3
..LN743:
        movl      $1, %esi                                      #170.3
..___tag_value_init.213:
..LN744:
#       set1d(float *, float, int)
        call      set1d                                         #170.3
..___tag_value_init.214:
..LN745:
                                # LOE rbx rbp r12 r13 r14 r15
..B10.2:                        # Preds ..B10.1
..LN746:
	.loc    1  171  is_stmt 1

###   set1d(y, any, frac1);

        movl      $y, %edi                                      #171.3
..LN747:
        movl      $-1, %esi                                     #171.3
..LN748:
        vxorps    %xmm0, %xmm0, %xmm0                           #171.3
..___tag_value_init.215:
..LN749:
#       set1d(float *, float, int)
        call      set1d                                         #171.3
..___tag_value_init.216:
..LN750:
                                # LOE rbx rbp r12 r13 r14 r15
..B10.3:                        # Preds ..B10.2
..LN751:
	.loc    1  172  is_stmt 1

###   set1d(z, any, frac1);

        movl      $z, %edi                                      #172.3
..LN752:
        movl      $-1, %esi                                     #172.3
..LN753:
        vxorps    %xmm0, %xmm0, %xmm0                           #172.3
..___tag_value_init.217:
..LN754:
#       set1d(float *, float, int)
        call      set1d                                         #172.3
..___tag_value_init.218:
..LN755:
                                # LOE rbx rbp r12 r13 r14 r15
..B10.4:                        # Preds ..B10.3
..LN756:
	.loc    1  174  is_stmt 1

### 
###   return 0;

        xorl      %eax, %eax                                    #174.10
..LN757:
	.loc    1  174  epilogue_begin  is_stmt 1
        popq      %rcx                                          #174.10
	.cfi_def_cfa_offset 8
..LN758:
        ret                                                     #174.10
        .align    16,0x90
	.cfi_endproc
..LN759:
                                # LOE
..LN760:
# mark_end;
	.type	init,@function
	.size	init,.-init
..LNinit.761:
.LNinit:
	.data
# -- End  init
	.data
	.align 4
	.align 4
	.globl alpha
alpha:
	.long	0x3dcccccd
	.type	alpha,@object
	.size	alpha,4
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.3:
	.long	0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000,0x3f800000
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,32
	.align 32
.L_2il0floatpacket.4:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,32
	.align 32
.L_2il0floatpacket.5:
	.long	0x000000ff,0x000000ff,0x000000ff,0x000000ff,0x000000ff,0x000000ff,0x000000ff,0x000000ff
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,32
	.align 32
.L_2il0floatpacket.6:
	.long	0x43800000,0x43800000,0x43800000,0x43800000,0x43800000,0x43800000,0x43800000,0x43800000
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,32
	.align 8
.L_2il0floatpacket.0:
	.long	0xa0b5ed8d,0x3eb0c6f7
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,8
	.align 8
.L_2il0floatpacket.1:
	.long	0x00000000,0x41cdcd65
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.align 8
.L_2il0floatpacket.2:
	.long	0x00000000,0x412e8480
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 4
.L_2il0floatpacket.7:
	.long	0x3f800000
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,4
	.section .rodata.str1.4, "aMS",@progbits,1
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.6:
	.long	2037413985
	.long	1920234335
	.long	1600480361
	.word	12662
	.byte	0
	.type	.L_2__STRING.6,@object
	.size	.L_2__STRING.6,15
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.4:
	.long	169895461
	.byte	0
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,5
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.7:
	.long	2037413985
	.long	1920234335
	.long	1600480361
	.word	12918
	.byte	0
	.type	.L_2__STRING.7,@object
	.size	.L_2__STRING.7,15
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.long	1869770799
	.long	1885548387
	.long	1718511989
	.word	111
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.word	114
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,2
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.5:
	.long	1932800293
	.long	891625504
	.long	543568430
	.long	874848265
	.long	543568174
	.word	9
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,22
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.word	64
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,2
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.long	6712357
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,4
	.data
	.comm x,8192,64
	.comm y,8192,64
	.comm z,8192,64
	.section .debug_opt_report, ""
..L223:
	.ascii ".itt_notify_tab\0"
	.word	258
	.word	48
	.long	25
	.long	..L224 - ..L223
	.long	48
	.long	..L225 - ..L223
	.long	425
	.long	0x00000008,0x00000000
	.long	0
	.long	0
	.long	0
	.long	0
	.quad	..L13
	.long	28
	.long	4
	.quad	..L14
	.long	28
	.long	18
	.quad	..L21
	.long	28
	.long	37
	.quad	..L28
	.long	28
	.long	56
	.quad	..L29
	.long	28
	.long	70
	.quad	..L36
	.long	28
	.long	89
	.quad	..L67
	.long	28
	.long	108
	.quad	..L101
	.long	28
	.long	122
	.quad	..L117
	.long	28
	.long	136
	.quad	..L118
	.long	28
	.long	155
	.quad	..L119
	.long	28
	.long	174
	.quad	..L141
	.long	28
	.long	193
	.quad	..L142
	.long	28
	.long	207
	.quad	..L151
	.long	28
	.long	226
	.quad	..L173
	.long	28
	.long	245
	.quad	..L174
	.long	28
	.long	259
	.quad	..L183
	.long	28
	.long	278
	.quad	..L198
	.long	28
	.long	297
	.quad	..L199
	.long	28
	.long	316
	.quad	..L200
	.long	28
	.long	335
	.quad	..L201
	.long	28
	.long	354
	.quad	..L202
	.long	28
	.long	373
	.quad	..L203
	.long	28
	.long	392
	.quad	..L204
	.long	28
	.long	411
..L224:
	.long	1769238639
	.long	1635412333
	.long	1852795252
	.long	1885696607
	.long	1601466991
	.long	1936876918
	.long	7237481
	.long	1769238639
	.long	1635412333
	.long	1852795252
	.long	1885696607
	.long	7631471
..L225:
	.long	42078211
	.long	-2139090931
	.long	-2139062144
	.long	-2139062144
	.long	269617096
	.long	-2139062144
	.long	-2139062144
	.long	-1467972992
	.long	-1801091132
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-37191550
	.long	44222344
	.long	-2139090931
	.long	-2139062144
	.long	-2139062144
	.long	269617096
	.long	-2139062144
	.long	-2139062144
	.long	-1467972992
	.long	-1801091132
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-37191550
	.long	44222344
	.long	-2139090931
	.long	-2139062144
	.long	-2139062144
	.long	269289204
	.long	-2139062144
	.long	-2139062144
	.long	116686976
	.long	-2139090926
	.long	-2139062144
	.long	-2071953280
	.long	-1987528576
	.long	302162887
	.long	-2139062256
	.long	-2139062144
	.long	-2138931072
	.long	-947287880
	.long	269615779
	.long	-2139062144
	.long	-2139062144
	.long	-1199536000
	.long	-1547204216
	.long	-2146431742
	.long	-2139062144
	.long	-2139062144
	.long	302499968
	.long	-2139062256
	.long	-2139062144
	.long	-2138931072
	.long	-1517828952
	.long	269615764
	.long	-2139062144
	.long	-2139062144
	.long	-931102080
	.long	-1563981571
	.long	-2146431742
	.long	-2139062144
	.long	-2139062144
	.long	302499968
	.long	-2139062256
	.long	-2139062144
	.long	-2138931072
	.long	-1517820232
	.long	269615764
	.long	-2139062144
	.long	-2139062144
	.long	-1333755264
	.long	-1563981429
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-223313788
	.long	43698056
	.long	-2139090926
	.long	-2139062144
	.long	-2105507712
	.long	-1997361024
	.long	302160583
	.long	-2139062256
	.long	-2139062144
	.long	-2138537856
	.long	-947326288
	.long	269615770
	.long	-2139062144
	.long	-2139062144
	.long	-125795200
	.long	-1698199310
	.long	-2146430462
	.long	-2139062144
	.long	-2139062144
	.long	-218595198
	.long	43698056
	.long	-2139090926
	.long	-2139062144
	.long	-2004844416
	.long	-1997342592
	.long	218274503
	.long	-2139062256
	.long	-2139062144
	.long	-58687360
	.byte	6
	.section .note.GNU-stack, ""
	.global x#
	.global y#
	.global z#
	.global alpha#
// -- Begin DWARF2 SEGMENT .debug_info
	.section .debug_info
.debug_info_seg:
	.align 1
	.4byte 0x00000924
	.2byte 0x0003
	.4byte .debug_abbrev_seg
	.byte 0x08
//	DW_TAG_compile_unit:
	.byte 0x01
//	DW_AT_comp_dir:
	.4byte .debug_str
//	DW_AT_name:
	.4byte .debug_str+0x6e
//	DW_AT_producer:
	.4byte .debug_str+0x7f
	.4byte .debug_str+0xeb
//	DW_AT_language:
	.byte 0x01
//	DW_AT_use_UTF8:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte 0x0000000000000000
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0xa0
//	DW_AT_stmt_list:
	.4byte .debug_line_seg
//	DW_TAG_base_type:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte 0x00746e69
//	DW_TAG_subprogram:
	.byte 0x03
//	DW_AT_decl_line:
	.byte 0x51
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_AT_name:
	.4byte .debug_str+0x1c4
	.4byte .debug_str+0x1c4
//	DW_AT_frame_base:
	.2byte 0x7702
	.byte 0x00
//	DW_AT_low_pc:
	.8byte ..L48
//	DW_AT_high_pc:
	.8byte ..LNget_wall_time.184
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x53
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1cd
//	DW_AT_type:
	.4byte 0x00000533
//	DW_AT_location:
	.2byte 0x9102
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x05
//	DW_AT_decl_line:
	.byte 0x5d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_AT_name:
	.4byte .debug_str+0x3d5
	.4byte .debug_str+0x3d5
//	DW_AT_low_pc:
	.8byte ..L87
//	DW_AT_high_pc:
	.8byte ..LNget_cpu_time.277
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_subprogram:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0x64
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_AT_name:
	.4byte .debug_str+0x237
	.4byte .debug_str+0x237
//	DW_AT_external:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_subprogram:
	.byte 0x07
//	DW_AT_decl_line:
	.byte 0x64
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_abstract_origin:
	.4byte 0x00000087
//	DW_AT_frame_base:
	.2byte 0x7702
	.byte 0x00
//	DW_AT_low_pc:
	.8byte ..L96
//	DW_AT_high_pc:
	.8byte ..LNgetCPUfreq.340
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x66
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x242
//	DW_AT_type:
	.4byte 0x00000643
//	DW_AT_location:
	.2byte 0x5c01
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x67
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00727470
//	DW_AT_type:
	.4byte 0x00000626
//	DW_AT_location:
	.2byte 0x5001
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x68
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00667562
//	DW_AT_type:
	.4byte 0x000008a1
//	DW_AT_location:
	.2byte 0x9102
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x68
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x0079656b
//	DW_AT_type:
	.4byte 0x000008ab
//	DW_AT_location:
	.4byte 0x02889103
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x69
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x3ce
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x6a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x23d
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_AT_location:
	.4byte 0x02809103
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x0a
//	DW_AT_decl_line:
	.byte 0x85
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x3e2
	.4byte .debug_str+0x3e2
//	DW_AT_low_pc:
	.8byte ..L196
//	DW_AT_high_pc:
	.8byte ..LNset1d.739
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x85
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.4byte 0x00727261
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x85
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000514
//	DW_AT_name:
	.4byte .debug_str+0x3e8
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0x85
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x3ee
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_lexical_block:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x88
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN594
//	DW_AT_high_pc:
	.8byte ..LN641
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x88
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000061f
	.byte 0x00
//	DW_TAG_lexical_block:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x8d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN662
//	DW_AT_high_pc:
	.8byte ..LN716
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x8d
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000061f
	.byte 0x00
//	DW_TAG_lexical_block:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x91
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN721
//	DW_AT_high_pc:
	.8byte ..LN728
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x91
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000061f
//	DW_AT_location:
	.2byte 0x5001
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x0f
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1af
	.4byte .debug_str+0x1af
//	DW_AT_external:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x10
//	DW_AT_type:
	.4byte 0x0000050f
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_abstract_origin:
	.4byte 0x000001a7
//	DW_AT_low_pc:
	.8byte ..L112
//	DW_AT_high_pc:
	.8byte ..LNcheck.407
//	DW_TAG_formal_parameter:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.4byte 0x00727261
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x9c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006d7573
//	DW_AT_type:
	.4byte 0x00000514
//	DW_TAG_lexical_block:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0x9e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN360
//	DW_AT_high_pc:
	.8byte ..LN399
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x9e
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xa5
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x3f5
	.4byte .debug_str+0x3f5
//	DW_AT_low_pc:
	.8byte ..L210
//	DW_AT_high_pc:
	.8byte ..LNinit.761
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xa7
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00796e61
//	DW_AT_type:
	.4byte 0x00000514
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xa7
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00656e6f
//	DW_AT_type:
	.4byte 0x00000514
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xa8
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x3fa
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xa8
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x3ff
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x06
//	DW_AT_decl_line:
	.byte 0xba
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x1b5
	.4byte .debug_str+0x1b5
//	DW_AT_external:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_subprogram:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0xba
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_abstract_origin:
	.4byte 0x00000256
//	DW_AT_low_pc:
	.8byte ..L131
//	DW_AT_high_pc:
	.8byte ..LNaxpy_stride_v1.487
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xbc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x191
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xbc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1a0
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xbc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1a6
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_lexical_block:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0xc1
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN422
//	DW_AT_high_pc:
	.8byte ..LN449
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xc1
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6c6e
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000061f
//	DW_TAG_lexical_block:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0xc2
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN423
//	DW_AT_high_pc:
	.8byte ..LN449
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xc2
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x13
//	DW_AT_low_pc:
	.8byte ..LN461
//	DW_AT_high_pc:
	.8byte ..LN481
//	DW_AT_abstract_origin:
	.4byte 0x000001a7
//	DW_AT_call_line:
	.byte 0xc9
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.4byte 0x00727261
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x9c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006d7573
//	DW_AT_type:
	.4byte 0x00000514
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x15
//	DW_AT_decl_line:
	.byte 0xcd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_declaration:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x177
	.4byte .debug_str+0x177
//	DW_AT_external:
	.byte 0x01
//	DW_AT_inline:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x10
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_TAG_formal_parameter:
	.byte 0x10
//	DW_AT_type:
	.4byte 0x0000050f
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x11
//	DW_AT_decl_line:
	.byte 0xcd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_abstract_origin:
	.4byte 0x0000030b
//	DW_AT_low_pc:
	.8byte ..L161
//	DW_AT_high_pc:
	.8byte ..LNaxpy_stride_v2.576
//	DW_TAG_formal_parameter:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0xcd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.2byte 0x7876
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x0b
//	DW_AT_decl_line:
	.byte 0xcd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.2byte 0x7976
	.byte 0x00
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xd0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7878
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xd1
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7979
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xd3
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x191
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xd3
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1a0
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xd3
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1a6
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_lexical_block:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0xd8
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN507
//	DW_AT_high_pc:
	.8byte ..LN535
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xd8
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x6c6e
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000061f
//	DW_TAG_lexical_block:
	.byte 0x0d
//	DW_AT_decl_line:
	.byte 0xd9
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_low_pc:
	.8byte ..LN508
//	DW_AT_high_pc:
	.8byte ..LN535
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xd9
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0069
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x13
//	DW_AT_low_pc:
	.8byte ..LN547
//	DW_AT_high_pc:
	.8byte ..LN567
//	DW_AT_abstract_origin:
	.4byte 0x000001a7
//	DW_AT_call_line:
	.byte 0xe0
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.4byte 0x00727261
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x9c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006d7573
//	DW_AT_type:
	.4byte 0x00000514
	.byte 0x00
	.byte 0x00
//	DW_TAG_subprogram:
	.byte 0x12
//	DW_AT_decl_line:
	.byte 0xe4
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_AT_name:
	.4byte .debug_str+0x172
	.4byte .debug_str+0x172
//	DW_AT_low_pc:
	.8byte ..L3
//	DW_AT_high_pc:
	.8byte ..LNmain.163
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_inlined_subroutine:
	.byte 0x16
//	DW_AT_ranges:
	.4byte .debug_ranges_seg
//	DW_AT_entry_pc:
	.8byte ..LN86
//	DW_AT_abstract_origin:
	.4byte 0x0000030b
//	DW_AT_call_line:
	.byte 0xe9
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0xcd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.2byte 0x7876
	.byte 0x00
//	DW_TAG_formal_parameter:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0xcd
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.2byte 0x7976
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xd0
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7878
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0xd1
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x7979
	.byte 0x00
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xd3
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x191
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xd3
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1a0
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xd3
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1a6
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_inlined_subroutine:
	.byte 0x13
//	DW_AT_low_pc:
	.8byte ..LN134
//	DW_AT_high_pc:
	.8byte ..LN155
//	DW_AT_abstract_origin:
	.4byte 0x000001a7
//	DW_AT_call_line:
	.byte 0xe0
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.4byte 0x00727261
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x9c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006d7573
//	DW_AT_type:
	.4byte 0x00000514
	.byte 0x00
	.byte 0x00
//	DW_TAG_inlined_subroutine:
	.byte 0x13
//	DW_AT_low_pc:
	.8byte ..LN18
//	DW_AT_high_pc:
	.8byte ..LN86
//	DW_AT_abstract_origin:
	.4byte 0x00000256
//	DW_AT_call_line:
	.byte 0xe8
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xbc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x191
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xbc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1a0
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0xbc
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x1a6
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_TAG_inlined_subroutine:
	.byte 0x13
//	DW_AT_low_pc:
	.8byte ..LN65
//	DW_AT_high_pc:
	.8byte ..LN86
//	DW_AT_abstract_origin:
	.4byte 0x000001a7
//	DW_AT_call_line:
	.byte 0xc9
//	DW_AT_call_column:
	.byte 0x03
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x14
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000050f
//	DW_AT_name:
	.4byte 0x00727261
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x9c
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x006d7573
//	DW_AT_type:
	.4byte 0x00000514
	.byte 0x00
	.byte 0x00
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x00000514
//	DW_TAG_base_type:
	.byte 0x18
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x186
//	DW_TAG_pointer_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x00000520
//	DW_TAG_const_type:
	.byte 0x19
//	DW_AT_type:
	.4byte 0x00000525
//	DW_TAG_base_type:
	.byte 0x18
//	DW_AT_byte_size:
	.byte 0x00
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x18c
//	DW_TAG_base_type:
	.byte 0x18
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x199
//	DW_TAG_structure_type:
	.byte 0x1a
//	DW_AT_decl_line:
	.byte 0x1e
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_byte_size:
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0x1d2
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0x20
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x1e8
//	DW_AT_type:
	.4byte 0x00000558
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0x21
//	DW_AT_decl_file:
	.byte 0x02
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x1fd
//	DW_AT_type:
	.4byte 0x0000056a
	.byte 0x00
//	DW_TAG_typedef:
	.byte 0x1c
//	DW_AT_decl_line:
	.byte 0x8b
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0x1da
//	DW_AT_type:
	.4byte 0x00000563
//	DW_TAG_base_type:
	.byte 0x18
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x1e3
//	DW_TAG_typedef:
	.byte 0x1c
//	DW_AT_decl_line:
	.byte 0x8d
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0x1ef
//	DW_AT_type:
	.4byte 0x00000563
//	DW_TAG_subprogram:
	.byte 0x1d
//	DW_AT_decl_line:
	.byte 0xb2
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_prototyped:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x205
	.4byte .debug_str+0x205
//	DW_AT_frame_base:
	.2byte 0x7702
	.byte 0x00
//	DW_AT_low_pc:
	.8byte ..L58
//	DW_AT_high_pc:
	.8byte ..LNresults.266
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xb2
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_AT_name:
	.4byte .debug_str+0x1c8
//	DW_AT_location:
	.2byte 0x6101
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xb2
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x0000061f
//	DW_AT_name:
	.4byte .debug_str+0x21a
//	DW_AT_location:
	.2byte 0x5501
//	DW_TAG_formal_parameter:
	.byte 0x0c
//	DW_AT_decl_line:
	.byte 0xb2
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_type:
	.4byte 0x00000626
//	DW_AT_name:
	.4byte .debug_str+0x224
//	DW_AT_location:
	.2byte 0x5401
//	DW_TAG_inlined_subroutine:
	.byte 0x16
//	DW_AT_ranges:
	.4byte .debug_ranges_seg+0x60
//	DW_AT_entry_pc:
	.8byte ..LN191
//	DW_AT_abstract_origin:
	.4byte 0x00000087
//	DW_AT_call_line:
	.byte 0xb7
//	DW_AT_call_column:
	.byte 0x33
//	DW_AT_call_file:
	.byte 0x01
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x66
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x242
//	DW_AT_type:
	.4byte 0x00000643
//	DW_TAG_variable:
	.byte 0x0e
//	DW_AT_decl_line:
	.byte 0x67
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00727470
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x68
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x00667562
//	DW_AT_type:
	.4byte 0x000008a1
//	DW_AT_location:
	.2byte 0x9102
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x08
//	DW_AT_decl_line:
	.byte 0x68
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte 0x0079656b
//	DW_AT_type:
	.4byte 0x000008ab
//	DW_AT_location:
	.4byte 0x02909103
//	DW_TAG_variable:
	.byte 0x09
//	DW_AT_decl_line:
	.byte 0x69
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x3ce
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_variable:
	.byte 0x04
//	DW_AT_decl_line:
	.byte 0x6a
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x23d
//	DW_AT_type:
	.4byte 0x0000052c
//	DW_AT_location:
	.4byte 0x02809103
	.byte 0x00
	.byte 0x00
//	DW_TAG_base_type:
	.byte 0x18
//	DW_AT_byte_size:
	.byte 0x04
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x20d
//	DW_TAG_pointer_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x0000062b
//	DW_TAG_base_type:
	.byte 0x18
//	DW_AT_byte_size:
	.byte 0x01
//	DW_AT_encoding:
	.byte 0x06
//	DW_AT_name:
	.4byte .debug_str+0x21f
//	DW_TAG_base_type:
	.byte 0x18
//	DW_AT_byte_size:
	.byte 0x08
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x229
//	DW_TAG_pointer_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x0000063e
//	DW_TAG_const_type:
	.byte 0x19
//	DW_AT_type:
	.4byte 0x0000062b
//	DW_TAG_pointer_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x00000648
//	DW_TAG_typedef:
	.byte 0x1c
//	DW_AT_decl_line:
	.byte 0x30
//	DW_AT_decl_file:
	.byte 0x04
//	DW_AT_name:
	.4byte .debug_str+0x24a
//	DW_AT_type:
	.4byte 0x00000653
//	DW_TAG_structure_type:
	.byte 0x1a
//	DW_AT_decl_line:
	.byte 0xf5
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_byte_size:
	.byte 0xd8
//	DW_AT_name:
	.4byte .debug_str+0x24f
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0xf6
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x258
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0xfb
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x25f
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0xfc
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0x26c
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0xfd
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x18
//	DW_AT_name:
	.4byte .debug_str+0x279
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0xfe
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x20
//	DW_AT_name:
	.4byte .debug_str+0x287
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0xff
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x28
//	DW_AT_name:
	.4byte .debug_str+0x296
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0100
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x30
//	DW_AT_name:
	.4byte .debug_str+0x2a4
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0101
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x38
//	DW_AT_name:
	.4byte .debug_str+0x2b2
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0102
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x40
//	DW_AT_name:
	.4byte .debug_str+0x2bf
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0104
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x48
//	DW_AT_name:
	.4byte .debug_str+0x2cb
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0105
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x50
//	DW_AT_name:
	.4byte .debug_str+0x2d9
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0106
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x58
//	DW_AT_name:
	.4byte .debug_str+0x2e9
//	DW_AT_type:
	.4byte 0x00000626
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0108
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x60
//	DW_AT_name:
	.4byte .debug_str+0x312
//	DW_AT_type:
	.4byte 0x00000815
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x010a
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x68
//	DW_AT_name:
	.4byte .debug_str+0x31b
//	DW_AT_type:
	.4byte 0x0000084d
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x010c
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x70
//	DW_AT_name:
	.4byte .debug_str+0x322
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0110
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x74
//	DW_AT_name:
	.4byte .debug_str+0x32a
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0112
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x78
//	DW_AT_name:
	.4byte .debug_str+0x33a
//	DW_AT_type:
	.4byte 0x00000852
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0116
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01802303
//	DW_AT_name:
	.4byte .debug_str+0x355
//	DW_AT_type:
	.4byte 0x0000085d
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0117
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01822303
//	DW_AT_name:
	.4byte .debug_str+0x361
//	DW_AT_type:
	.4byte 0x0000062b
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0118
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01832303
//	DW_AT_name:
	.4byte .debug_str+0x370
//	DW_AT_type:
	.4byte 0x00000864
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x011c
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01882303
//	DW_AT_name:
	.4byte .debug_str+0x385
//	DW_AT_type:
	.4byte 0x0000086d
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0125
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01902303
//	DW_AT_name:
	.4byte .debug_str+0x33e
//	DW_AT_type:
	.4byte 0x0000087d
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x012e
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01982303
//	DW_AT_name:
	.4byte .debug_str+0x395
//	DW_AT_type:
	.4byte 0x00000888
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x012f
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01a02303
//	DW_AT_name:
	.4byte .debug_str+0x39c
//	DW_AT_type:
	.4byte 0x00000888
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0130
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01a82303
//	DW_AT_name:
	.4byte .debug_str+0x3a3
//	DW_AT_type:
	.4byte 0x00000888
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0131
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01b02303
//	DW_AT_name:
	.4byte .debug_str+0x3aa
//	DW_AT_type:
	.4byte 0x00000888
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0132
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01b82303
//	DW_AT_name:
	.4byte .debug_str+0x3b8
//	DW_AT_type:
	.4byte 0x0000088d
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0134
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01c02303
//	DW_AT_name:
	.4byte .debug_str+0x3bf
//	DW_AT_type:
	.4byte 0x0000002e
//	DW_TAG_member:
	.byte 0x1e
//	DW_AT_decl_line:
	.2byte 0x0136
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.4byte 0x01c42303
//	DW_AT_name:
	.4byte .debug_str+0x3c5
//	DW_AT_type:
	.4byte 0x00000898
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x0000081a
//	DW_TAG_structure_type:
	.byte 0x1a
//	DW_AT_decl_line:
	.byte 0xa0
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_byte_size:
	.byte 0x18
//	DW_AT_name:
	.4byte .debug_str+0x2f6
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0xa1
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x00
//	DW_AT_name:
	.4byte .debug_str+0x301
//	DW_AT_type:
	.4byte 0x00000815
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0xa2
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x08
//	DW_AT_name:
	.4byte .debug_str+0x307
//	DW_AT_type:
	.4byte 0x0000084d
//	DW_TAG_member:
	.byte 0x1b
//	DW_AT_decl_line:
	.byte 0xa6
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_data_member_location:
	.2byte 0x2302
	.byte 0x10
//	DW_AT_name:
	.4byte .debug_str+0x30d
//	DW_AT_type:
	.4byte 0x0000002e
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x00000653
//	DW_TAG_typedef:
	.byte 0x1c
//	DW_AT_decl_line:
	.byte 0x83
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0x332
//	DW_AT_type:
	.4byte 0x00000563
//	DW_TAG_base_type:
	.byte 0x18
//	DW_AT_byte_size:
	.byte 0x02
//	DW_AT_encoding:
	.byte 0x07
//	DW_AT_name:
	.4byte .debug_str+0x346
//	DW_TAG_array_type:
	.byte 0x1f
//	DW_AT_type:
	.4byte 0x0000062b
//	DW_AT_byte_size:
	.byte 0x01
//	DW_TAG_subrange_type:
	.byte 0x20
//	DW_AT_upper_bound:
	.byte 0x00
	.byte 0x00
//	DW_TAG_pointer_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x00000872
//	DW_TAG_typedef:
	.byte 0x1c
//	DW_AT_decl_line:
	.byte 0x9a
//	DW_AT_decl_file:
	.byte 0x05
//	DW_AT_name:
	.4byte .debug_str+0x37a
//	DW_AT_type:
	.4byte 0x00000525
//	DW_TAG_typedef:
	.byte 0x1c
//	DW_AT_decl_line:
	.byte 0x84
//	DW_AT_decl_file:
	.byte 0x03
//	DW_AT_name:
	.4byte .debug_str+0x38b
//	DW_AT_type:
	.4byte 0x00000563
//	DW_TAG_pointer_type:
	.byte 0x17
//	DW_AT_type:
	.4byte 0x00000525
//	DW_TAG_typedef:
	.byte 0x1c
//	DW_AT_decl_line:
	.byte 0x2c
//	DW_AT_decl_file:
	.byte 0x06
//	DW_AT_name:
	.4byte .debug_str+0x3b1
//	DW_AT_type:
	.4byte 0x00000632
//	DW_TAG_array_type:
	.byte 0x1f
//	DW_AT_type:
	.4byte 0x0000062b
//	DW_AT_byte_size:
	.byte 0x14
//	DW_TAG_subrange_type:
	.byte 0x20
//	DW_AT_upper_bound:
	.byte 0x13
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x21
//	DW_AT_type:
	.4byte 0x0000062b
//	DW_AT_byte_size:
	.2byte 0x0100
//	DW_TAG_subrange_type:
	.byte 0x20
//	DW_AT_upper_bound:
	.byte 0xff
	.byte 0x00
//	DW_TAG_array_type:
	.byte 0x1f
//	DW_AT_type:
	.4byte 0x0000062b
//	DW_AT_byte_size:
	.byte 0x0b
//	DW_TAG_subrange_type:
	.byte 0x20
//	DW_AT_upper_bound:
	.byte 0x0a
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0x44
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0078
//	DW_AT_type:
	.4byte 0x000008c8
//	DW_AT_location:
	.2byte 0x0309
	.8byte x
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_array_type:
	.byte 0x21
//	DW_AT_type:
	.4byte 0x00000514
//	DW_AT_byte_size:
	.2byte 0x2000
//	DW_TAG_subrange_type:
	.byte 0x23
//	DW_AT_upper_bound:
	.2byte 0x07ff
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0x45
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x0079
//	DW_AT_type:
	.4byte 0x000008e7
//	DW_AT_location:
	.2byte 0x0309
	.8byte y
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_array_type:
	.byte 0x21
//	DW_AT_type:
	.4byte 0x00000514
//	DW_AT_byte_size:
	.2byte 0x2000
//	DW_TAG_subrange_type:
	.byte 0x23
//	DW_AT_upper_bound:
	.2byte 0x07ff
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x22
//	DW_AT_decl_line:
	.byte 0x46
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.2byte 0x007a
//	DW_AT_type:
	.4byte 0x00000906
//	DW_AT_location:
	.2byte 0x0309
	.8byte z
//	DW_AT_external:
	.byte 0x01
//	DW_TAG_array_type:
	.byte 0x21
//	DW_AT_type:
	.4byte 0x00000514
//	DW_AT_byte_size:
	.2byte 0x2000
//	DW_TAG_subrange_type:
	.byte 0x23
//	DW_AT_upper_bound:
	.2byte 0x07ff
	.byte 0x00
//	DW_TAG_variable:
	.byte 0x24
//	DW_AT_decl_line:
	.byte 0x47
//	DW_AT_decl_file:
	.byte 0x01
//	DW_AT_name:
	.4byte .debug_str+0x405
//	DW_AT_type:
	.4byte 0x00000514
//	DW_AT_location:
	.2byte 0x0309
	.8byte alpha
//	DW_AT_external:
	.byte 0x01
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_line
	.section .debug_line
.debug_line_seg:
	.align 1
// -- Begin DWARF2 SEGMENT .debug_abbrev
	.section .debug_abbrev
.debug_abbrev_seg:
	.align 1
	.byte 0x01
	.byte 0x11
	.byte 0x01
	.byte 0x1b
	.byte 0x0e
	.byte 0x03
	.byte 0x0e
	.byte 0x25
	.byte 0x0e
	.2byte 0x7681
	.byte 0x0e
	.byte 0x13
	.byte 0x0b
	.byte 0x53
	.byte 0x0c
	.byte 0x11
	.byte 0x01
	.byte 0x55
	.byte 0x06
	.byte 0x10
	.byte 0x06
	.2byte 0x0000
	.byte 0x02
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x03
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x40
	.byte 0x0a
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x04
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x05
	.byte 0x2e
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x06
	.byte 0x2e
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x3c
	.byte 0x0c
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x3f
	.byte 0x0c
	.byte 0x20
	.byte 0x0b
	.2byte 0x0000
	.byte 0x07
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x31
	.byte 0x13
	.byte 0x40
	.byte 0x0a
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.2byte 0x0000
	.byte 0x08
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x09
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x0a
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x0b
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x08
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x0c
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.byte 0x02
	.byte 0x0a
	.2byte 0x0000
	.byte 0x0d
	.byte 0x0b
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.2byte 0x0000
	.byte 0x0e
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x0f
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x3c
	.byte 0x0c
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x3f
	.byte 0x0c
	.byte 0x20
	.byte 0x0b
	.2byte 0x0000
	.byte 0x10
	.byte 0x05
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x11
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x31
	.byte 0x13
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.2byte 0x0000
	.byte 0x12
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x13
	.byte 0x1d
	.byte 0x01
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x31
	.byte 0x13
	.byte 0x59
	.byte 0x0b
	.byte 0x57
	.byte 0x0b
	.byte 0x58
	.byte 0x0b
	.2byte 0x0000
	.byte 0x14
	.byte 0x05
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x49
	.byte 0x13
	.byte 0x03
	.byte 0x08
	.2byte 0x0000
	.byte 0x15
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x3c
	.byte 0x0c
	.byte 0x49
	.byte 0x13
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x3f
	.byte 0x0c
	.byte 0x20
	.byte 0x0b
	.2byte 0x0000
	.byte 0x16
	.byte 0x1d
	.byte 0x01
	.byte 0x55
	.byte 0x06
	.byte 0x52
	.byte 0x01
	.byte 0x31
	.byte 0x13
	.byte 0x59
	.byte 0x0b
	.byte 0x57
	.byte 0x0b
	.byte 0x58
	.byte 0x0b
	.2byte 0x0000
	.byte 0x17
	.byte 0x0f
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x18
	.byte 0x24
	.byte 0x00
	.byte 0x0b
	.byte 0x0b
	.byte 0x3e
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x19
	.byte 0x26
	.byte 0x00
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x1a
	.byte 0x13
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x0b
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.2byte 0x0000
	.byte 0x1b
	.byte 0x0d
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x38
	.byte 0x0a
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x1c
	.byte 0x16
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x1d
	.byte 0x2e
	.byte 0x01
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x27
	.byte 0x0c
	.byte 0x03
	.byte 0x0e
	.2byte 0x4087
	.byte 0x0e
	.byte 0x40
	.byte 0x0a
	.byte 0x11
	.byte 0x01
	.byte 0x12
	.byte 0x01
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x1e
	.byte 0x0d
	.byte 0x00
	.byte 0x3b
	.byte 0x05
	.byte 0x3a
	.byte 0x0b
	.byte 0x38
	.byte 0x0a
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.2byte 0x0000
	.byte 0x1f
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x0b
	.2byte 0x0000
	.byte 0x20
	.byte 0x21
	.byte 0x00
	.byte 0x2f
	.byte 0x0b
	.2byte 0x0000
	.byte 0x21
	.byte 0x01
	.byte 0x01
	.byte 0x49
	.byte 0x13
	.byte 0x0b
	.byte 0x05
	.2byte 0x0000
	.byte 0x22
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x08
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x23
	.byte 0x21
	.byte 0x00
	.byte 0x2f
	.byte 0x05
	.2byte 0x0000
	.byte 0x24
	.byte 0x34
	.byte 0x00
	.byte 0x3b
	.byte 0x0b
	.byte 0x3a
	.byte 0x0b
	.byte 0x03
	.byte 0x0e
	.byte 0x49
	.byte 0x13
	.byte 0x02
	.byte 0x0a
	.byte 0x3f
	.byte 0x0c
	.2byte 0x0000
	.byte 0x00
// -- Begin DWARF2 SEGMENT .debug_frame
	.section .debug_frame
.debug_frame_seg:
	.align 1
// -- Begin DWARF2 SEGMENT .debug_str
	.section .debug_str,"MS",@progbits,1
.debug_str_seg:
	.align 1
	.8byte 0x68632f656d6f682f
	.8byte 0x62706f72442f7375
	.8byte 0x6172745f322f786f
	.8byte 0x645f342f6f6a6162
	.8byte 0x2f6169636e65636f
	.8byte 0x6e695f6f64617267
	.8byte 0x6c754d2f6d726f66
	.8byte 0x7365636f72706974
	.8byte 0x332f7365726f6461
	.8byte 0x636974636172505f
	.8byte 0x6365765f312f7361
	.8byte 0x6963617a69726f74
	.8byte 0x35692f32702f6e6f
	.4byte 0x3734332d
	.2byte 0x0030
	.8byte 0x5f797078612f2e2e
	.8byte 0x632e656469727473
	.byte 0x00
	.8byte 0x2952286c65746e49
	.8byte 0x6c65746e49204320
	.8byte 0x4320343620295228
	.8byte 0x2072656c69706d6f
	.8byte 0x6c70706120726f66
	.8byte 0x736e6f6974616369
	.8byte 0x676e696e6e757220
	.8byte 0x65746e49206e6f20
	.8byte 0x2c3436202952286c
	.8byte 0x6e6f697372655620
	.8byte 0x2e322e302e363120
	.8byte 0x6c69754220313831
	.8byte 0x3230363130322064
	.4byte 0x000a3430
	.8byte 0x633d686372616d2d
	.8byte 0x327876612d65726f
	.8byte 0x31633d6474732d20
	.8byte 0x334f2d20672d2031
	.8byte 0x2d206c6c61572d20
	.8byte 0x4953494345525044
	.8byte 0x4c442d20303d4e4f
	.8byte 0x20383430323d4e45
	.8byte 0x306c6c6f726e752d
	.8byte 0x6f73662d20532d20
	.8byte 0x6d73612d65637275
	.8byte 0x65737361206f2d20
	.8byte 0x78612f72656c626d
	.8byte 0x64697274735f7970
	.8byte 0x6e69732e6b322e65
	.8byte 0x327876612e656c67
	.4byte 0x6363692e
	.2byte 0x732e
	.byte 0x00
	.4byte 0x6e69616d
	.byte 0x00
	.8byte 0x7274735f79707861
	.4byte 0x5f656469
	.2byte 0x3276
	.byte 0x00
	.4byte 0x616f6c66
	.2byte 0x0074
	.4byte 0x64696f76
	.byte 0x00
	.8byte 0x00745f7472617473
	.4byte 0x62756f64
	.2byte 0x656c
	.byte 0x00
	.4byte 0x5f646e65
	.2byte 0x0074
	.8byte 0x6669645f6c6c6177
	.byte 0x00
	.4byte 0x63656863
	.2byte 0x006b
	.8byte 0x7274735f79707861
	.4byte 0x5f656469
	.2byte 0x3176
	.byte 0x00
	.8byte 0x6c6c61775f746567
	.4byte 0x6d69745f
	.2byte 0x0065
	.8byte 0x006c6176656d6974
	.8byte 0x745f656d69745f5f
	.byte 0x00
	.4byte 0x676e6f6c
	.byte 0x00
	.4byte 0x735f7674
	.2byte 0x6365
	.byte 0x00
	.8byte 0x6f63657375735f5f
	.4byte 0x5f73646e
	.2byte 0x0074
	.8byte 0x00636573755f7674
	.8byte 0x0073746c75736572
	.8byte 0x64656e6769736e75
	.4byte 0x746e6920
	.byte 0x00
	.4byte 0x6e656c76
	.byte 0x00
	.4byte 0x72616863
	.byte 0x00
	.4byte 0x706f6f6c
	.byte 0x00
	.8byte 0x64656e6769736e75
	.4byte 0x6e6f6c20
	.2byte 0x0067
	.8byte 0x7266555043746567
	.2byte 0x7165
	.byte 0x00
	.8byte 0x006f666e69737973
	.4byte 0x454c4946
	.byte 0x00
	.8byte 0x454c49465f4f495f
	.byte 0x00
	.4byte 0x616c665f
	.2byte 0x7367
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x7274705f
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x646e655f
	.byte 0x00
	.8byte 0x646165725f4f495f
	.4byte 0x7361625f
	.2byte 0x0065
	.8byte 0x746972775f4f495f
	.4byte 0x61625f65
	.2byte 0x6573
	.byte 0x00
	.8byte 0x746972775f4f495f
	.4byte 0x74705f65
	.2byte 0x0072
	.8byte 0x746972775f4f495f
	.4byte 0x6e655f65
	.2byte 0x0064
	.8byte 0x5f6675625f4f495f
	.4byte 0x65736162
	.byte 0x00
	.8byte 0x5f6675625f4f495f
	.4byte 0x00646e65
	.8byte 0x657661735f4f495f
	.4byte 0x7361625f
	.2byte 0x0065
	.8byte 0x6b6361625f4f495f
	.8byte 0x00657361625f7075
	.8byte 0x657661735f4f495f
	.4byte 0x646e655f
	.byte 0x00
	.8byte 0x6b72616d5f4f495f
	.2byte 0x7265
	.byte 0x00
	.4byte 0x78656e5f
	.2byte 0x0074
	.4byte 0x7562735f
	.2byte 0x0066
	.4byte 0x736f705f
	.byte 0x00
	.8byte 0x7372656b72616d5f
	.byte 0x00
	.4byte 0x6168635f
	.2byte 0x6e69
	.byte 0x00
	.8byte 0x006f6e656c69665f
	.8byte 0x00327367616c665f
	.8byte 0x00745f66666f5f5f
	.8byte 0x66666f5f646c6f5f
	.4byte 0x00746573
	.8byte 0x64656e6769736e75
	.4byte 0x6f687320
	.2byte 0x7472
	.byte 0x00
	.8byte 0x6c6f635f7275635f
	.4byte 0x006e6d75
	.8byte 0x5f656c626174765f
	.4byte 0x7366666f
	.2byte 0x7465
	.byte 0x00
	.8byte 0x756274726f68735f
	.2byte 0x0066
	.8byte 0x6b636f6c5f4f495f
	.2byte 0x745f
	.byte 0x00
	.4byte 0x636f6c5f
	.2byte 0x006b
	.8byte 0x5f343666666f5f5f
	.2byte 0x0074
	.4byte 0x61705f5f
	.2byte 0x3164
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3264
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3364
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3464
	.byte 0x00
	.4byte 0x657a6973
	.2byte 0x745f
	.byte 0x00
	.4byte 0x61705f5f
	.2byte 0x3564
	.byte 0x00
	.4byte 0x646f6d5f
	.2byte 0x0065
	.8byte 0x32646573756e755f
	.byte 0x00
	.4byte 0x6c79656b
	.2byte 0x6e65
	.byte 0x00
	.8byte 0x5f7570635f746567
	.4byte 0x656d6974
	.byte 0x00
	.4byte 0x31746573
	.2byte 0x0064
	.4byte 0x756c6176
	.2byte 0x0065
	.4byte 0x69727473
	.2byte 0x6564
	.byte 0x00
	.4byte 0x74696e69
	.byte 0x00
	.4byte 0x74696e75
	.byte 0x00
	.4byte 0x63617266
	.2byte 0x0031
	.4byte 0x68706c61
	.2byte 0x0061
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
// -- Begin DWARF2 SEGMENT .debug_ranges
	.section .debug_ranges
.debug_ranges_seg:
	.align 1
	.8byte ..LN86
	.8byte ..LN100
	.8byte ..LN101
	.8byte ..LN102
	.8byte ..LN105
	.8byte ..LN106
	.8byte ..LN111
	.8byte ..LN112
	.8byte ..LN116
	.8byte ..LN155
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN191
	.8byte ..LN195
	.8byte ..LN196
	.8byte ..LN234
	.8byte ..LN253
	.8byte ..LNresults.266
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.8byte ..LN0
	.8byte ..LNinit.761
	.8byte 0x0000000000000000
	.8byte 0x0000000000000000
	.section .text
.LNDBG_TXe:
# End
