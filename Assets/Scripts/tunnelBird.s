	.text
	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 0
	.file	"tunnelBird.c"
	.def	loadBitmapFromResource;
	.scl	2;
	.type	32;
	.endef
	.globl	loadBitmapFromResource          # -- Begin function loadBitmapFromResource
	.p2align	4, 0x90
loadBitmapFromResource:                 # @loadBitmapFromResource
.seh_proc loadBitmapFromResource
# %bb.0:
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	144(%rsp), %rax
	movq	%rcx, 88(%rsp)
	movl	%edx, 84(%rsp)
	movq	%r8, 72(%rsp)
	movq	%r9, 64(%rsp)
	movq	88(%rsp), %rcx
	movl	84(%rsp), %eax
                                        # kill: def $ax killed $ax killed $eax
	movzwl	%ax, %eax
	movl	%eax, %edx
	movl	$2, %r8d
	callq	*__imp_FindResourceA(%rip)
	movq	%rax, 56(%rsp)
	cmpq	$0, 56(%rsp)
	jne	.LBB0_2
# %bb.1:
	movq	$0, 96(%rsp)
	jmp	.LBB0_7
.LBB0_2:
	movq	88(%rsp), %rcx
	movq	56(%rsp), %rdx
	callq	*__imp_LoadResource(%rip)
	movq	%rax, 48(%rsp)
	cmpq	$0, 48(%rsp)
	jne	.LBB0_4
# %bb.3:
	movq	$0, 96(%rsp)
	jmp	.LBB0_7
.LBB0_4:
	movq	48(%rsp), %rcx
	callq	*__imp_LockResource(%rip)
	movq	%rax, 40(%rsp)
	cmpq	$0, 40(%rsp)
	jne	.LBB0_6
# %bb.5:
	movq	$0, 96(%rsp)
	jmp	.LBB0_7
.LBB0_6:
	movq	40(%rsp), %rax
	movl	4(%rax), %ecx
	movq	72(%rsp), %rax
	movl	%ecx, (%rax)
	movq	40(%rsp), %rax
	movl	8(%rax), %ecx
	movl	%ecx, %eax
	negl	%eax
	cmovnsl	%eax, %ecx
	movq	64(%rsp), %rax
	movl	%ecx, (%rax)
	movq	40(%rsp), %rcx
	movq	40(%rsp), %rax
	movl	(%rax), %eax
                                        # kill: def $rax killed $eax
	addq	%rax, %rcx
	movq	40(%rsp), %rax
	movl	32(%rax), %eax
                                        # kill: def $rax killed $eax
	shlq	$2, %rax
	addq	%rax, %rcx
	movq	144(%rsp), %rax
	movq	%rcx, (%rax)
	movq	40(%rsp), %rax
	movq	%rax, 96(%rsp)
.LBB0_7:
	movq	96(%rsp), %rax
	addq	$104, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	setWindowIcon;
	.scl	2;
	.type	32;
	.endef
	.globl	setWindowIcon                   # -- Begin function setWindowIcon
	.p2align	4, 0x90
setWindowIcon:                          # @setWindowIcon
.seh_proc setWindowIcon
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%rcx, 48(%rsp)
	movq	48(%rsp), %rcx
	callq	glfwGetWin32Window
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movl	%eax, %ecx
	callq	*__imp_GetModuleHandleA(%rip)
	movq	%rax, %rcx
	movl	$101, %edx
	callq	*__imp_LoadIconA(%rip)
	movq	%rax, 32(%rsp)
	cmpq	$0, 32(%rsp)
	je	.LBB1_2
# %bb.1:
	movq	40(%rsp), %rcx
	movq	32(%rsp), %r9
	movl	$128, %edx
	xorl	%eax, %eax
	movl	%eax, %r8d
	callq	*__imp_SendMessageA(%rip)
	movq	40(%rsp), %rcx
	movq	32(%rsp), %r9
	movl	$128, %edx
	movl	$1, %r8d
	callq	*__imp_SendMessageA(%rip)
.LBB1_2:
	nop
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	framebufferSizeCallback;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	3, 0x0                          # -- Begin function framebufferSizeCallback
.LCPI2_0:
	.quad	0x408ab00000000000              # double 854
.LCPI2_1:
	.quad	0x407e000000000000              # double 480
.LCPI2_2:
	.quad	0xbff0000000000000              # double -1
.LCPI2_3:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	framebufferSizeCallback
	.p2align	4, 0x90
framebufferSizeCallback:                # @framebufferSizeCallback
.seh_proc framebufferSizeCallback
# %bb.0:
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movq	%rcx, 64(%rsp)
	movl	%edx, 60(%rsp)
	movl	%r8d, 56(%rsp)
	movl	60(%rsp), %r8d
	movl	56(%rsp), %r9d
	xorl	%edx, %edx
	movl	%edx, %ecx
	callq	*__imp_glViewport(%rip)
	movl	$5889, %ecx                     # imm = 0x1701
	callq	*__imp_glMatrixMode(%rip)
	callq	*__imp_glLoadIdentity(%rip)
	xorps	%xmm3, %xmm3
	movsd	.LCPI2_0(%rip), %xmm1           # xmm1 = [8.54E+2,0.0E+0]
	movsd	.LCPI2_1(%rip), %xmm2           # xmm2 = [4.8E+2,0.0E+0]
	movsd	.LCPI2_2(%rip), %xmm5           # xmm5 = [-1.0E+0,0.0E+0]
	movsd	.LCPI2_3(%rip), %xmm4           # xmm4 = [1.0E+0,0.0E+0]
	movaps	%xmm3, %xmm0
	movsd	%xmm5, 32(%rsp)
	movsd	%xmm4, 40(%rsp)
	callq	*__imp_glOrtho(%rip)
	movl	$5888, %ecx                     # imm = 0x1700
	callq	*__imp_glMatrixMode(%rip)
	callq	*__imp_glLoadIdentity(%rip)
	nop
	addq	$72, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	RGB_RGBA_convert;
	.scl	2;
	.type	32;
	.endef
	.globl	RGB_RGBA_convert                # -- Begin function RGB_RGBA_convert
	.p2align	4, 0x90
RGB_RGBA_convert:                       # @RGB_RGBA_convert
.seh_proc RGB_RGBA_convert
# %bb.0:
	subq	$88, %rsp
	.seh_stackalloc 88
	.seh_endprologue
	movq	128(%rsp), %rax
	movq	%rcx, 80(%rsp)
	movl	%edx, 76(%rsp)
	movl	%r8d, 72(%rsp)
	andb	$1, %r9b
	movb	%r9b, 71(%rsp)
	movl	76(%rsp), %eax
	imull	72(%rsp), %eax
	shll	$2, %eax
	movslq	%eax, %rcx
	callq	malloc
	movq	%rax, 56(%rsp)
	movl	$0, 52(%rsp)
	movl	$0, 48(%rsp)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movl	52(%rsp), %eax
	movl	76(%rsp), %ecx
	imull	72(%rsp), %ecx
	imull	$3, %ecx, %ecx
	cmpl	%ecx, %eax
	jge	.LBB3_13
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movq	80(%rsp), %rax
	movslq	52(%rsp), %rcx
	movb	(%rax,%rcx), %al
	movb	%al, 47(%rsp)
	movq	80(%rsp), %rax
	movl	52(%rsp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %al
	movb	%al, 46(%rsp)
	movq	80(%rsp), %rax
	movl	52(%rsp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %al
	movb	%al, 45(%rsp)
	testb	$1, 71(%rsp)
	je	.LBB3_4
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	movzbl	45(%rsp), %eax
	movl	%eax, 40(%rsp)                  # 4-byte Spill
	jmp	.LBB3_5
.LBB3_4:                                #   in Loop: Header=BB3_1 Depth=1
	movzbl	47(%rsp), %eax
	movl	%eax, 40(%rsp)                  # 4-byte Spill
.LBB3_5:                                #   in Loop: Header=BB3_1 Depth=1
	movl	40(%rsp), %eax                  # 4-byte Reload
	movb	%al, %dl
	movq	56(%rsp), %rax
	movslq	48(%rsp), %rcx
	movb	%dl, (%rax,%rcx)
	movb	46(%rsp), %dl
	movq	56(%rsp), %rax
	movl	48(%rsp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movb	%dl, (%rax,%rcx)
	testb	$1, 71(%rsp)
	je	.LBB3_7
# %bb.6:                                #   in Loop: Header=BB3_1 Depth=1
	movzbl	47(%rsp), %eax
	movl	%eax, 36(%rsp)                  # 4-byte Spill
	jmp	.LBB3_8
.LBB3_7:                                #   in Loop: Header=BB3_1 Depth=1
	movzbl	45(%rsp), %eax
	movl	%eax, 36(%rsp)                  # 4-byte Spill
.LBB3_8:                                #   in Loop: Header=BB3_1 Depth=1
	movl	36(%rsp), %eax                  # 4-byte Reload
	movb	%al, %dl
	movq	56(%rsp), %rax
	movl	48(%rsp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movb	%dl, (%rax,%rcx)
	movzbl	47(%rsp), %ecx
	movq	128(%rsp), %rax
	movzbl	(%rax), %edx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	%edx, %ecx
	movb	%al, 35(%rsp)                   # 1-byte Spill
	jne	.LBB3_11
# %bb.9:                                #   in Loop: Header=BB3_1 Depth=1
	movzbl	46(%rsp), %ecx
	movq	128(%rsp), %rax
	movzbl	1(%rax), %edx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	%edx, %ecx
	movb	%al, 35(%rsp)                   # 1-byte Spill
	jne	.LBB3_11
# %bb.10:                               #   in Loop: Header=BB3_1 Depth=1
	movzbl	45(%rsp), %eax
	movq	128(%rsp), %rcx
	movzbl	2(%rcx), %ecx
	cmpl	%ecx, %eax
	sete	%al
	movb	%al, 35(%rsp)                   # 1-byte Spill
.LBB3_11:                               #   in Loop: Header=BB3_1 Depth=1
	movb	35(%rsp), %dl                   # 1-byte Reload
	movl	$255, %eax
	xorl	%ecx, %ecx
	testb	$1, %dl
	cmovnel	%ecx, %eax
	movb	%al, %dl
	movq	56(%rsp), %rax
	movl	48(%rsp), %ecx
	addl	$3, %ecx
	movslq	%ecx, %rcx
	movb	%dl, (%rax,%rcx)
# %bb.12:                               #   in Loop: Header=BB3_1 Depth=1
	movl	52(%rsp), %eax
	addl	$3, %eax
	movl	%eax, 52(%rsp)
	movl	48(%rsp), %eax
	addl	$4, %eax
	movl	%eax, 48(%rsp)
	jmp	.LBB3_1
.LBB3_13:
	movq	56(%rsp), %rax
	addq	$88, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	drawTile;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function drawTile
.LCPI4_0:
	.long	0x3f800000                      # float 1
.LCPI4_1:
	.long	0x3dcccccd                      # float 0.100000001
	.text
	.globl	drawTile
	.p2align	4, 0x90
drawTile:                               # @drawTile
.seh_proc drawTile
# %bb.0:
	subq	$88, %rsp
	.seh_stackalloc 88
	.seh_endprologue
	movss	144(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	136(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	128(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movl	%ecx, 84(%rsp)
	movl	%edx, 80(%rsp)
	movl	%r8d, 76(%rsp)
	movss	%xmm3, 72(%rsp)
	movl	$0, 68(%rsp)
	movl	$0, 64(%rsp)
	movl	84(%rsp), %edx
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glBindTexture(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	xorl	%edx, %edx
	movl	$4096, %r8d                     # imm = 0x1000
	leaq	68(%rsp), %r9
	callq	*__imp_glGetTexLevelParameteriv(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	xorl	%edx, %edx
	movl	$4097, %r8d                     # imm = 0x1001
	leaq	64(%rsp), %r9
	callq	*__imp_glGetTexLevelParameteriv(%rip)
	cvtsi2ssl	68(%rsp), %xmm1
	movss	.LCPI4_1(%rip), %xmm0           # xmm0 = [1.00000001E-1,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	movss	%xmm0, 60(%rsp)
	cvtsi2ssl	64(%rsp), %xmm1
	movss	.LCPI4_1(%rip), %xmm0           # xmm0 = [1.00000001E-1,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	movss	%xmm0, 56(%rsp)
	movss	72(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	68(%rsp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, 52(%rsp)
	movss	72(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	64(%rsp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, 48(%rsp)
	cvtsi2ssl	80(%rsp), %xmm0
	movss	52(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	movss	60(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, 44(%rsp)
	movl	76(%rsp), %eax
	addl	$1, %eax
	cvtsi2ss	%eax, %xmm0
	movss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movd	%xmm0, %eax
	xorl	$2147483648, %eax               # imm = 0x80000000
	movd	%eax, %xmm0
	mulss	%xmm1, %xmm0
	movss	.LCPI4_0(%rip), %xmm1           # xmm1 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	addss	%xmm1, %xmm0
	addss	56(%rsp), %xmm0
	movss	%xmm0, 40(%rsp)
	movss	44(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	addss	52(%rsp), %xmm0
	movss	60(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	addss	%xmm1, %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, 36(%rsp)
	movss	40(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	addss	48(%rsp), %xmm0
	movss	56(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	addss	%xmm1, %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, 32(%rsp)
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glEnable(%rip)
	movl	84(%rsp), %edx
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glBindTexture(%rip)
	movl	$7, %ecx
	callq	*__imp_glBegin(%rip)
	movss	44(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	40(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	callq	*__imp_glTexCoord2f(%rip)
	movss	128(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	136(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	addss	144(%rsp), %xmm1
	callq	*__imp_glVertex2f(%rip)
	movss	36(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	40(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	callq	*__imp_glTexCoord2f(%rip)
	movss	128(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addss	144(%rsp), %xmm0
	movss	136(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	addss	144(%rsp), %xmm1
	callq	*__imp_glVertex2f(%rip)
	movss	36(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	32(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	callq	*__imp_glTexCoord2f(%rip)
	movss	128(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addss	144(%rsp), %xmm0
	movss	136(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	callq	*__imp_glVertex2f(%rip)
	movss	44(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	32(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	callq	*__imp_glTexCoord2f(%rip)
	movss	128(%rsp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	136(%rsp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	callq	*__imp_glVertex2f(%rip)
	callq	*__imp_glEnd(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glDisable(%rip)
	nop
	addq	$88, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	drawRect;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function drawRect
.LCPI5_0:
	.long	0x3f800000                      # float 1
.LCPI5_1:
	.long	0x437f0000                      # float 255
	.text
	.globl	drawRect
	.p2align	4, 0x90
drawRect:                               # @drawRect
.seh_proc drawRect
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	96(%rsp), %rax
	movss	%xmm0, 52(%rsp)
	movss	%xmm1, 48(%rsp)
	movss	%xmm2, 44(%rsp)
	movss	%xmm3, 40(%rsp)
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glDisable(%rip)
	movq	96(%rsp), %rax
	movzbl	(%rax), %eax
	cvtsi2ss	%eax, %xmm0
	movss	.LCPI5_1(%rip), %xmm1           # xmm1 = [2.55E+2,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	movq	96(%rsp), %rax
	movzbl	1(%rax), %eax
	cvtsi2ss	%eax, %xmm1
	movss	.LCPI5_1(%rip), %xmm2           # xmm2 = [2.55E+2,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm2, %xmm1
	movq	96(%rsp), %rax
	movzbl	2(%rax), %eax
	cvtsi2ss	%eax, %xmm2
	movss	.LCPI5_1(%rip), %xmm3           # xmm3 = [2.55E+2,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm3, %xmm2
	movq	96(%rsp), %rax
	movzbl	3(%rax), %eax
	cvtsi2ss	%eax, %xmm3
	movss	.LCPI5_1(%rip), %xmm4           # xmm4 = [2.55E+2,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm4, %xmm3
	callq	*__imp_glColor4f(%rip)
	movl	$7, %ecx
	callq	*__imp_glBegin(%rip)
	movss	52(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	callq	*__imp_glVertex2f(%rip)
	movss	52(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	addss	44(%rsp), %xmm0
	movss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	callq	*__imp_glVertex2f(%rip)
	movss	52(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	addss	44(%rsp), %xmm0
	movss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	addss	40(%rsp), %xmm1
	callq	*__imp_glVertex2f(%rip)
	movss	52(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	addss	40(%rsp), %xmm1
	callq	*__imp_glVertex2f(%rip)
	callq	*__imp_glEnd(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glEnable(%rip)
	movss	.LCPI5_0(%rip), %xmm3           # xmm3 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm3, %xmm0
	movaps	%xmm3, %xmm1
	movaps	%xmm3, %xmm2
	callq	*__imp_glColor4f(%rip)
	nop
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	indexOf;
	.scl	2;
	.type	32;
	.endef
	.globl	indexOf                         # -- Begin function indexOf
	.p2align	4, 0x90
indexOf:                                # @indexOf
.seh_proc indexOf
# %bb.0:
	subq	$24, %rsp
	.seh_stackalloc 24
	.seh_endprologue
	movq	%rcx, 8(%rsp)
	movb	%dl, 7(%rsp)
	movl	$0, (%rsp)
.LBB6_1:                                # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	movslq	(%rsp), %rcx
	movsbl	(%rax,%rcx), %eax
	cmpl	$0, %eax
	je	.LBB6_6
# %bb.2:                                #   in Loop: Header=BB6_1 Depth=1
	movq	8(%rsp), %rax
	movslq	(%rsp), %rcx
	movsbl	(%rax,%rcx), %eax
	movsbl	7(%rsp), %ecx
	cmpl	%ecx, %eax
	jne	.LBB6_4
# %bb.3:
	movl	(%rsp), %eax
	movl	%eax, 20(%rsp)
	jmp	.LBB6_7
.LBB6_4:                                #   in Loop: Header=BB6_1 Depth=1
	jmp	.LBB6_5
.LBB6_5:                                #   in Loop: Header=BB6_1 Depth=1
	movl	(%rsp), %eax
	addl	$1, %eax
	movl	%eax, (%rsp)
	jmp	.LBB6_1
.LBB6_6:
	movl	$-1, 20(%rsp)
.LBB6_7:
	movl	20(%rsp), %eax
	addq	$24, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	showText;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function showText
.LCPI7_0:
	.long	0x41000000                      # float 8
	.text
	.globl	showText
	.p2align	4, 0x90
showText:                               # @showText
.seh_proc showText
# %bb.0:
	subq	$88, %rsp
	.seh_stackalloc 88
	.seh_endprologue
	movl	128(%rsp), %eax
	movq	%rcx, 80(%rsp)
	movl	%edx, 76(%rsp)
	movl	%r8d, 72(%rsp)
	movl	%r9d, 68(%rsp)
	movl	$0, 64(%rsp)
.LBB7_1:                                # =>This Inner Loop Header: Depth=1
	movq	80(%rsp), %rax
	movslq	64(%rsp), %rcx
	movsbl	(%rax,%rcx), %eax
	cmpl	$0, %eax
	je	.LBB7_6
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	movq	fontOrder(%rip), %rcx
	movq	80(%rsp), %rax
	movslq	64(%rsp), %rdx
	movb	(%rax,%rdx), %dl
	callq	indexOf
	movl	%eax, 60(%rsp)
	cmpl	$-1, 60(%rsp)
	je	.LBB7_4
# %bb.3:                                #   in Loop: Header=BB7_1 Depth=1
	movl	tileTexture3(%rip), %ecx
	movl	60(%rsp), %edx
	movl	128(%rsp), %r8d
	movl	76(%rsp), %eax
	movl	64(%rsp), %r9d
	imull	68(%rsp), %r9d
	addl	%r9d, %eax
	cvtsi2ss	%eax, %xmm2
	cvtsi2ssl	72(%rsp), %xmm1
	cvtsi2ssl	68(%rsp), %xmm0
	movss	.LCPI7_0(%rip), %xmm3           # xmm3 = [8.0E+0,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
.LBB7_4:                                #   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_5
.LBB7_5:                                #   in Loop: Header=BB7_1 Depth=1
	movl	64(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 64(%rsp)
	jmp	.LBB7_1
.LBB7_6:
	addq	$88, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	showNumber;
	.scl	2;
	.type	32;
	.endef
	.globl	showNumber                      # -- Begin function showNumber
	.p2align	4, 0x90
showNumber:                             # @showNumber
.seh_proc showNumber
# %bb.0:
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movl	112(%rsp), %eax
	movl	%ecx, 68(%rsp)
	movl	%edx, 64(%rsp)
	movl	%r8d, 60(%rsp)
	movl	%r9d, 56(%rsp)
	leaq	44(%rsp), %rcx
	movl	68(%rsp), %r9d
	leaq	.L.str.1(%rip), %r8
	movl	$12, %edx
	callq	snprintf
	leaq	44(%rsp), %rcx
	movl	64(%rsp), %edx
	movl	60(%rsp), %r8d
	movl	56(%rsp), %r9d
	movl	112(%rsp), %eax
	movl	%eax, 32(%rsp)
	callq	showText
	nop
	addq	$72, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	getBackgroundBlock;
	.scl	2;
	.type	32;
	.endef
	.globl	getBackgroundBlock              # -- Begin function getBackgroundBlock
	.p2align	4, 0x90
getBackgroundBlock:                     # @getBackgroundBlock
.seh_proc getBackgroundBlock
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	callq	rand
	movl	$101, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	movl	%edx, 32(%rsp)
	cmpl	$50, 32(%rsp)
	jle	.LBB9_2
# %bb.1:
	movl	$23, 36(%rsp)
	jmp	.LBB9_3
.LBB9_2:
	movl	$24, 36(%rsp)
.LBB9_3:
	movl	36(%rsp), %eax
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	generateNewLineBackground;
	.scl	2;
	.type	32;
	.endef
	.globl	generateNewLineBackground       # -- Begin function generateNewLineBackground
	.p2align	4, 0x90
generateNewLineBackground:              # @generateNewLineBackground
.seh_proc generateNewLineBackground
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movl	%ecx, 36(%rsp)
	movl	$0, 32(%rsp)
.LBB10_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$30, 32(%rsp)
	jge	.LBB10_4
# %bb.2:                                #   in Loop: Header=BB10_1 Depth=1
	callq	getBackgroundBlock
	movl	%eax, %edx
	movslq	36(%rsp), %rcx
	leaq	grid(%rip), %rax
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	32(%rsp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB10_1 Depth=1
	movl	32(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 32(%rsp)
	jmp	.LBB10_1
.LBB10_4:
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	getForegroundBlock;
	.scl	2;
	.type	32;
	.endef
	.globl	getForegroundBlock              # -- Begin function getForegroundBlock
	.p2align	4, 0x90
getForegroundBlock:                     # @getForegroundBlock
.seh_proc getForegroundBlock
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	andb	$1, %cl
	movb	%cl, 51(%rsp)
	andb	$1, %dl
	movb	%dl, 50(%rsp)
	andb	$1, %r8b
	movb	%r8b, 49(%rsp)
	andb	$1, %r9b
	movb	%r9b, 48(%rsp)
	callq	rand
	movl	$101, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	movl	%edx, 44(%rsp)
	movl	$0, 40(%rsp)
	testb	$1, 51(%rsp)
	je	.LBB11_2
# %bb.1:
	movl	40(%rsp), %eax
	orl	$8, %eax
	movl	%eax, 40(%rsp)
.LBB11_2:
	testb	$1, 50(%rsp)
	je	.LBB11_4
# %bb.3:
	movl	40(%rsp), %eax
	orl	$4, %eax
	movl	%eax, 40(%rsp)
.LBB11_4:
	testb	$1, 49(%rsp)
	je	.LBB11_6
# %bb.5:
	movl	40(%rsp), %eax
	orl	$2, %eax
	movl	%eax, 40(%rsp)
.LBB11_6:
	testb	$1, 48(%rsp)
	je	.LBB11_8
# %bb.7:
	movl	40(%rsp), %eax
	orl	$1, %eax
	movl	%eax, 40(%rsp)
.LBB11_8:
	movl	40(%rsp), %eax
	addl	$-2, %eax
	movl	%eax, %ecx
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	subl	$13, %eax
	ja	.LBB11_45
# %bb.47:
	movq	32(%rsp), %rax                  # 8-byte Reload
	leaq	.LJTI11_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
.LBB11_9:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_11
# %bb.10:
	movl	$1, 52(%rsp)
	jmp	.LBB11_46
.LBB11_11:
	movl	$2, 52(%rsp)
	jmp	.LBB11_46
.LBB11_12:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_14
# %bb.13:
	movl	$3, 52(%rsp)
	jmp	.LBB11_46
.LBB11_14:
	movl	$4, 52(%rsp)
	jmp	.LBB11_46
.LBB11_15:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_17
# %bb.16:
	movl	$5, 52(%rsp)
	jmp	.LBB11_46
.LBB11_17:
	movl	$6, 52(%rsp)
	jmp	.LBB11_46
.LBB11_18:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_20
# %bb.19:
	movl	$7, 52(%rsp)
	jmp	.LBB11_46
.LBB11_20:
	movl	$8, 52(%rsp)
	jmp	.LBB11_46
.LBB11_21:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_23
# %bb.22:
	movl	$9, 52(%rsp)
	jmp	.LBB11_46
.LBB11_23:
	movl	$10, 52(%rsp)
	jmp	.LBB11_46
.LBB11_24:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_26
# %bb.25:
	movl	$1, 52(%rsp)
	jmp	.LBB11_46
.LBB11_26:
	movl	$2, 52(%rsp)
	jmp	.LBB11_46
.LBB11_27:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_29
# %bb.28:
	movl	$1, 52(%rsp)
	jmp	.LBB11_46
.LBB11_29:
	movl	$2, 52(%rsp)
	jmp	.LBB11_46
.LBB11_30:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_32
# %bb.31:
	movl	$1, 52(%rsp)
	jmp	.LBB11_46
.LBB11_32:
	movl	$2, 52(%rsp)
	jmp	.LBB11_46
.LBB11_33:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_35
# %bb.34:
	movl	$17, 52(%rsp)
	jmp	.LBB11_46
.LBB11_35:
	movl	$18, 52(%rsp)
	jmp	.LBB11_46
.LBB11_36:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_38
# %bb.37:
	movl	$15, 52(%rsp)
	jmp	.LBB11_46
.LBB11_38:
	movl	$16, 52(%rsp)
	jmp	.LBB11_46
.LBB11_39:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_41
# %bb.40:
	movl	$13, 52(%rsp)
	jmp	.LBB11_46
.LBB11_41:
	movl	$14, 52(%rsp)
	jmp	.LBB11_46
.LBB11_42:
	cmpl	$50, 44(%rsp)
	jle	.LBB11_44
# %bb.43:
	movl	$11, 52(%rsp)
	jmp	.LBB11_46
.LBB11_44:
	movl	$12, 52(%rsp)
	jmp	.LBB11_46
.LBB11_45:
	movl	$-1, 52(%rsp)
.LBB11_46:
	movl	52(%rsp), %eax
	addq	$56, %rsp
	retq
	.section	.rdata,"dr"
	.p2align	2, 0x0
.LJTI11_0:
	.long	.LBB11_21-.LJTI11_0
	.long	.LBB11_15-.LJTI11_0
	.long	.LBB11_45-.LJTI11_0
	.long	.LBB11_45-.LJTI11_0
	.long	.LBB11_18-.LJTI11_0
	.long	.LBB11_12-.LJTI11_0
	.long	.LBB11_42-.LJTI11_0
	.long	.LBB11_39-.LJTI11_0
	.long	.LBB11_24-.LJTI11_0
	.long	.LBB11_27-.LJTI11_0
	.long	.LBB11_36-.LJTI11_0
	.long	.LBB11_33-.LJTI11_0
	.long	.LBB11_30-.LJTI11_0
	.long	.LBB11_9-.LJTI11_0
	.text
	.seh_endproc
                                        # -- End function
	.def	generateNewLineForeground;
	.scl	2;
	.type	32;
	.endef
	.globl	generateNewLineForeground       # -- Begin function generateNewLineForeground
	.p2align	4, 0x90
generateNewLineForeground:              # @generateNewLineForeground
.seh_proc generateNewLineForeground
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movl	%ecx, 52(%rsp)
	movl	$0, 48(%rsp)
.LBB12_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$30, 48(%rsp)
	jge	.LBB12_4
# %bb.2:                                #   in Loop: Header=BB12_1 Depth=1
	movslq	52(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	48(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB12_1 Depth=1
	movl	48(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 48(%rsp)
	jmp	.LBB12_1
.LBB12_4:
	cmpl	$0, 52(%rsp)
	jne	.LBB12_6
# %bb.5:
	callq	rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, directionSurface(%rip)
	callq	rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, directionRoof(%rip)
	callq	rand
	movl	$6, %ecx
	cltd
	idivl	%ecx
	addl	$24, %edx
	movl	%edx, surfaceBlockY(%rip)
	callq	rand
	movl	$5, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	movl	%edx, roofBlockY(%rip)
	jmp	.LBB12_45
.LBB12_6:
	callq	rand
	movl	$101, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	cmpl	$80, %edx
	jle	.LBB12_8
# %bb.7:
	callq	rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, directionSurface(%rip)
.LBB12_8:
	movl	lastSurfaceBlockY(%rip), %eax
	movslq	difficulty(%rip), %rdx
	leaq	difficultyValues(%rip), %rcx
	cmpl	(%rcx,%rdx,4), %eax
	jge	.LBB12_10
# %bb.9:
	callq	rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$2, %edx
	movl	%edx, directionSurface(%rip)
.LBB12_10:
	cmpl	$25, lastSurfaceBlockY(%rip)
	jle	.LBB12_12
# %bb.11:
	callq	rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, directionSurface(%rip)
.LBB12_12:
	cmpl	$28, lastSurfaceBlockY(%rip)
	jge	.LBB12_22
# %bb.13:
	cmpl	$1, directionSurface(%rip)
	jne	.LBB12_15
# %bb.14:
	callq	rand
	movl	lastSurfaceBlockY(%rip), %ecx
	movl	lastSurfaceBlockY(%rip), %edx
	subl	$2, %edx
	subl	%edx, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	lastSurfaceBlockY(%rip), %eax
	subl	$2, %eax
	movl	%eax, surfaceBlockY(%rip)
	jmp	.LBB12_21
.LBB12_15:
	cmpl	$2, directionSurface(%rip)
	jne	.LBB12_17
# %bb.16:
	callq	rand
	movl	lastSurfaceBlockY(%rip), %ecx
	addl	$1, %ecx
	movl	lastSurfaceBlockY(%rip), %edx
	subl	$1, %edx
	subl	%edx, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	lastSurfaceBlockY(%rip), %eax
	subl	$1, %eax
	movl	%eax, surfaceBlockY(%rip)
	jmp	.LBB12_20
.LBB12_17:
	cmpl	$3, directionSurface(%rip)
	jne	.LBB12_19
# %bb.18:
	callq	rand
	movl	lastSurfaceBlockY(%rip), %ecx
	addl	$2, %ecx
	subl	lastSurfaceBlockY(%rip), %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	lastSurfaceBlockY(%rip), %eax
	addl	$1, %eax
	movl	%eax, surfaceBlockY(%rip)
.LBB12_19:
	jmp	.LBB12_20
.LBB12_20:
	jmp	.LBB12_21
.LBB12_21:
	jmp	.LBB12_23
.LBB12_22:
	callq	rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$27, %edx
	movl	%edx, surfaceBlockY(%rip)
.LBB12_23:
	callq	rand
	movl	$101, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	cmpl	$85, %edx
	jle	.LBB12_25
# %bb.24:
	callq	rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, directionRoof(%rip)
.LBB12_25:
	movl	surfaceBlockY(%rip), %eax
	subl	lastRoofBlockY(%rip), %eax
	movslq	difficulty(%rip), %rdx
	leaq	difficultyValues(%rip), %rcx
	cmpl	40(%rcx,%rdx,4), %eax
	jle	.LBB12_27
# %bb.26:
	callq	rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$2, %edx
	movl	%edx, directionRoof(%rip)
	jmp	.LBB12_31
.LBB12_27:
	movl	surfaceBlockY(%rip), %eax
	subl	lastRoofBlockY(%rip), %eax
	movslq	difficulty(%rip), %rdx
	leaq	difficultyValues(%rip), %rcx
	cmpl	80(%rcx,%rdx,4), %eax
	jle	.LBB12_29
# %bb.28:
	callq	rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, directionRoof(%rip)
	jmp	.LBB12_30
.LBB12_29:
	movl	$1, directionRoof(%rip)
.LBB12_30:
	jmp	.LBB12_31
.LBB12_31:
	cmpl	$3, lastRoofBlockY(%rip)
	jge	.LBB12_33
# %bb.32:
	callq	rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$2, %edx
	movl	%edx, directionRoof(%rip)
.LBB12_33:
	cmpl	$1, lastRoofBlockY(%rip)
	jle	.LBB12_43
# %bb.34:
	cmpl	$1, directionRoof(%rip)
	jne	.LBB12_36
# %bb.35:
	callq	rand
	movl	lastRoofBlockY(%rip), %ecx
	subl	$1, %ecx
	movl	lastRoofBlockY(%rip), %edx
	subl	$2, %edx
	subl	%edx, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	lastRoofBlockY(%rip), %eax
	subl	$2, %eax
	movl	%eax, roofBlockY(%rip)
	jmp	.LBB12_42
.LBB12_36:
	cmpl	$2, directionRoof(%rip)
	jne	.LBB12_38
# %bb.37:
	callq	rand
	movl	lastRoofBlockY(%rip), %ecx
	addl	$1, %ecx
	movl	lastRoofBlockY(%rip), %edx
	subl	$1, %edx
	subl	%edx, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	lastRoofBlockY(%rip), %eax
	subl	$1, %eax
	movl	%eax, roofBlockY(%rip)
	jmp	.LBB12_41
.LBB12_38:
	cmpl	$3, directionRoof(%rip)
	jne	.LBB12_40
# %bb.39:
	callq	rand
	movl	lastRoofBlockY(%rip), %ecx
	addl	$2, %ecx
	subl	lastRoofBlockY(%rip), %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	lastRoofBlockY(%rip), %eax
	addl	$1, %eax
	movl	%eax, roofBlockY(%rip)
.LBB12_40:
	jmp	.LBB12_41
.LBB12_41:
	jmp	.LBB12_42
.LBB12_42:
	jmp	.LBB12_44
.LBB12_43:
	callq	rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	movl	%edx, roofBlockY(%rip)
.LBB12_44:
	jmp	.LBB12_45
.LBB12_45:
	movl	$0, 44(%rsp)
.LBB12_46:                              # =>This Inner Loop Header: Depth=1
	cmpl	$30, 44(%rsp)
	jge	.LBB12_52
# %bb.47:                               #   in Loop: Header=BB12_46 Depth=1
	movl	44(%rsp), %eax
	cmpl	roofBlockY(%rip), %eax
	jle	.LBB12_49
# %bb.48:                               #   in Loop: Header=BB12_46 Depth=1
	movl	44(%rsp), %eax
	cmpl	surfaceBlockY(%rip), %eax
	jl	.LBB12_50
.LBB12_49:                              #   in Loop: Header=BB12_46 Depth=1
	movslq	52(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	44(%rsp), %rcx
	movl	$1, (%rax,%rcx,4)
.LBB12_50:                              #   in Loop: Header=BB12_46 Depth=1
	jmp	.LBB12_51
.LBB12_51:                              #   in Loop: Header=BB12_46 Depth=1
	movl	44(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 44(%rsp)
	jmp	.LBB12_46
.LBB12_52:
	cmpl	$0, 52(%rsp)
	je	.LBB12_65
# %bb.53:
	movl	$0, 40(%rsp)
.LBB12_54:                              # =>This Inner Loop Header: Depth=1
	cmpl	$30, 40(%rsp)
	jge	.LBB12_64
# %bb.55:                               #   in Loop: Header=BB12_54 Depth=1
	movl	40(%rsp), %eax
	cmpl	lastRoofBlockY(%rip), %eax
	jl	.LBB12_57
# %bb.56:                               #   in Loop: Header=BB12_54 Depth=1
	movl	40(%rsp), %eax
	cmpl	lastSurfaceBlockY(%rip), %eax
	jle	.LBB12_58
.LBB12_57:                              #   in Loop: Header=BB12_54 Depth=1
	movslq	52(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	40(%rsp), %rcx
	movl	(%rax,%rcx,4), %edx
	xorl	%eax, %eax
	movl	$1, %ecx
	cmpl	$0, %edx
	cmovnel	%ecx, %eax
	cmpl	$0, %eax
	setne	%dl
	movl	52(%rsp), %eax
	subl	$2, %eax
	movslq	%eax, %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	40(%rsp), %rcx
	movl	(%rax,%rcx,4), %r8d
	xorl	%eax, %eax
	movl	$1, %ecx
	cmpl	$0, %r8d
	cmovnel	%ecx, %eax
	cmpl	$0, %eax
	setne	%r9b
	andb	$1, %dl
	andb	$1, %r9b
	movb	$1, %r8b
	movb	%r8b, %cl
	callq	getForegroundBlock
	movl	%eax, %edx
	movl	52(%rsp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	40(%rsp), %rcx
	movl	%edx, (%rax,%rcx,4)
.LBB12_58:                              #   in Loop: Header=BB12_54 Depth=1
	movl	40(%rsp), %eax
	cmpl	lastRoofBlockY(%rip), %eax
	jne	.LBB12_60
# %bb.59:                               #   in Loop: Header=BB12_54 Depth=1
	movslq	52(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	40(%rsp), %rcx
	movl	(%rax,%rcx,4), %edx
	xorl	%eax, %eax
	movl	$1, %ecx
	cmpl	$0, %edx
	cmovnel	%ecx, %eax
	cmpl	$0, %eax
	setne	%dl
	movl	52(%rsp), %eax
	subl	$2, %eax
	movslq	%eax, %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	40(%rsp), %rcx
	movl	(%rax,%rcx,4), %r8d
	xorl	%eax, %eax
	movl	$1, %ecx
	cmpl	$0, %r8d
	cmovnel	%ecx, %eax
	cmpl	$0, %eax
	setne	%r9b
	andb	$1, %dl
	andb	$1, %r9b
	xorl	%eax, %eax
	movb	%al, %r8b
	movb	$1, %cl
	callq	getForegroundBlock
	movl	%eax, %edx
	movl	52(%rsp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	40(%rsp), %rcx
	movl	%edx, (%rax,%rcx,4)
.LBB12_60:                              #   in Loop: Header=BB12_54 Depth=1
	movl	40(%rsp), %eax
	cmpl	lastSurfaceBlockY(%rip), %eax
	jne	.LBB12_62
# %bb.61:                               #   in Loop: Header=BB12_54 Depth=1
	movslq	52(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	40(%rsp), %rcx
	movl	(%rax,%rcx,4), %edx
	xorl	%eax, %eax
	movl	$1, %ecx
	cmpl	$0, %edx
	cmovnel	%ecx, %eax
	cmpl	$0, %eax
	setne	%dl
	movl	52(%rsp), %eax
	subl	$2, %eax
	movslq	%eax, %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	40(%rsp), %rcx
	movl	(%rax,%rcx,4), %r8d
	xorl	%eax, %eax
	movl	$1, %ecx
	cmpl	$0, %r8d
	cmovnel	%ecx, %eax
	cmpl	$0, %eax
	setne	%r9b
	xorl	%eax, %eax
	andb	$1, %dl
	andb	$1, %r9b
	xorl	%eax, %eax
	movb	%al, %cl
	movb	$1, %r8b
	callq	getForegroundBlock
	movl	%eax, %edx
	movl	52(%rsp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	40(%rsp), %rcx
	movl	%edx, (%rax,%rcx,4)
.LBB12_62:                              #   in Loop: Header=BB12_54 Depth=1
	jmp	.LBB12_63
.LBB12_63:                              #   in Loop: Header=BB12_54 Depth=1
	movl	40(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 40(%rsp)
	jmp	.LBB12_54
.LBB12_64:
	jmp	.LBB12_65
.LBB12_65:
	movl	surfaceBlockY(%rip), %eax
	movl	%eax, lastSurfaceBlockY(%rip)
	movl	roofBlockY(%rip), %eax
	movl	%eax, lastRoofBlockY(%rip)
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	getPlant;
	.scl	2;
	.type	32;
	.endef
	.globl	getPlant                        # -- Begin function getPlant
	.p2align	4, 0x90
getPlant:                               # @getPlant
.seh_proc getPlant
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	callq	rand
	movslq	%eax, %rcx
	imulq	$-2004318071, %rcx, %rcx        # imm = 0x88888889
	shrq	$32, %rcx
	movl	%ecx, %edx
	addl	%eax, %edx
	movl	%edx, %ecx
	shrl	$31, %ecx
	sarl	$3, %edx
	addl	%ecx, %edx
                                        # implicit-def: $rcx
	movl	%edx, %ecx
	leal	(%rcx,%rcx,4), %edx
                                        # implicit-def: $rcx
	movl	%edx, %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%ecx, %eax
	movl	%eax, 48(%rsp)
	movl	48(%rsp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, 40(%rsp)                  # 8-byte Spill
	subq	$9, %rax
	ja	.LBB13_11
# %bb.13:
	movq	40(%rsp), %rax                  # 8-byte Reload
	leaq	.LJTI13_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
.LBB13_1:
	movl	$25, 52(%rsp)
	jmp	.LBB13_12
.LBB13_2:
	movl	$26, 52(%rsp)
	jmp	.LBB13_12
.LBB13_3:
	movl	$27, 52(%rsp)
	jmp	.LBB13_12
.LBB13_4:
	movl	$28, 52(%rsp)
	jmp	.LBB13_12
.LBB13_5:
	movl	$29, 52(%rsp)
	jmp	.LBB13_12
.LBB13_6:
	movl	$30, 52(%rsp)
	jmp	.LBB13_12
.LBB13_7:
	movl	$31, 52(%rsp)
	jmp	.LBB13_12
.LBB13_8:
	movl	$32, 52(%rsp)
	jmp	.LBB13_12
.LBB13_9:
	movl	$33, 52(%rsp)
	jmp	.LBB13_12
.LBB13_10:
	movl	$34, 52(%rsp)
	jmp	.LBB13_12
.LBB13_11:
	movl	$0, 52(%rsp)
.LBB13_12:
	movl	52(%rsp), %eax
	addq	$56, %rsp
	retq
	.section	.rdata,"dr"
	.p2align	2, 0x0
.LJTI13_0:
	.long	.LBB13_1-.LJTI13_0
	.long	.LBB13_2-.LJTI13_0
	.long	.LBB13_3-.LJTI13_0
	.long	.LBB13_4-.LJTI13_0
	.long	.LBB13_5-.LJTI13_0
	.long	.LBB13_6-.LJTI13_0
	.long	.LBB13_7-.LJTI13_0
	.long	.LBB13_8-.LJTI13_0
	.long	.LBB13_9-.LJTI13_0
	.long	.LBB13_10-.LJTI13_0
	.text
	.seh_endproc
                                        # -- End function
	.def	setPlants;
	.scl	2;
	.type	32;
	.endef
	.globl	setPlants                       # -- Begin function setPlants
	.p2align	4, 0x90
setPlants:                              # @setPlants
.seh_proc setPlants
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movl	%ecx, 36(%rsp)
	movl	$0, 32(%rsp)
.LBB14_1:                               # =>This Inner Loop Header: Depth=1
	cmpl	$30, 32(%rsp)
	jge	.LBB14_7
# %bb.2:                                #   in Loop: Header=BB14_1 Depth=1
	movslq	36(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$13440, %rax                    # imm = 0x3480
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	32(%rsp), %rcx
	movl	$0, (%rax,%rcx,4)
	movslq	36(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	32(%rsp), %rcx
	cmpl	$3, (%rax,%rcx,4)
	je	.LBB14_4
# %bb.3:                                #   in Loop: Header=BB14_1 Depth=1
	movslq	36(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	32(%rsp), %rcx
	cmpl	$4, (%rax,%rcx,4)
	jne	.LBB14_5
.LBB14_4:                               #   in Loop: Header=BB14_1 Depth=1
	callq	getPlant
	movl	%eax, %edx
	movslq	36(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$13440, %rax                    # imm = 0x3480
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movl	32(%rsp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movl	%edx, (%rax,%rcx,4)
.LBB14_5:                               #   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_6
.LBB14_6:                               #   in Loop: Header=BB14_1 Depth=1
	movl	32(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 32(%rsp)
	jmp	.LBB14_1
.LBB14_7:
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	updateWorld;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function updateWorld
.LCPI15_0:
	.long	0xc1800000                      # float -16
.LCPI15_1:
	.long	0xc2700000                      # float -60
.LCPI15_2:
	.long	0x3f800000                      # float 1
	.text
	.globl	updateWorld
	.p2align	4, 0x90
updateWorld:                            # @updateWorld
.seh_proc updateWorld
# %bb.0:
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movss	.LCPI15_0(%rip), %xmm0          # xmm0 = [-1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	ucomiss	mapX(%rip), %xmm0
	jb	.LBB15_55
# %bb.1:
	xorps	%xmm0, %xmm0
	movss	%xmm0, mapX(%rip)
	movl	$1, 68(%rsp)
.LBB15_2:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_4 Depth 2
	cmpl	$56, 68(%rsp)
	jge	.LBB15_9
# %bb.3:                                #   in Loop: Header=BB15_2 Depth=1
	movl	$0, 64(%rsp)
.LBB15_4:                               #   Parent Loop BB15_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$30, 64(%rsp)
	jge	.LBB15_7
# %bb.5:                                #   in Loop: Header=BB15_4 Depth=2
	movslq	68(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	64(%rsp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	68(%rsp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	64(%rsp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.6:                                #   in Loop: Header=BB15_4 Depth=2
	movl	64(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 64(%rsp)
	jmp	.LBB15_4
.LBB15_7:                               #   in Loop: Header=BB15_2 Depth=1
	jmp	.LBB15_8
.LBB15_8:                               #   in Loop: Header=BB15_2 Depth=1
	movl	68(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 68(%rsp)
	jmp	.LBB15_2
.LBB15_9:
	movl	$1, 60(%rsp)
.LBB15_10:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_12 Depth 2
	cmpl	$56, 60(%rsp)
	jge	.LBB15_17
# %bb.11:                               #   in Loop: Header=BB15_10 Depth=1
	movl	$0, 56(%rsp)
.LBB15_12:                              #   Parent Loop BB15_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$30, 56(%rsp)
	jge	.LBB15_15
# %bb.13:                               #   in Loop: Header=BB15_12 Depth=2
	movslq	60(%rsp), %rcx
	leaq	grid(%rip), %rax
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	56(%rsp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	60(%rsp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	leaq	grid(%rip), %rax
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	56(%rsp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.14:                               #   in Loop: Header=BB15_12 Depth=2
	movl	56(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 56(%rsp)
	jmp	.LBB15_12
.LBB15_15:                              #   in Loop: Header=BB15_10 Depth=1
	jmp	.LBB15_16
.LBB15_16:                              #   in Loop: Header=BB15_10 Depth=1
	movl	60(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 60(%rsp)
	jmp	.LBB15_10
.LBB15_17:
	movl	$1, 52(%rsp)
.LBB15_18:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB15_20 Depth 2
	cmpl	$55, 52(%rsp)
	jge	.LBB15_25
# %bb.19:                               #   in Loop: Header=BB15_18 Depth=1
	movl	$0, 48(%rsp)
.LBB15_20:                              #   Parent Loop BB15_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$30, 48(%rsp)
	jge	.LBB15_23
# %bb.21:                               #   in Loop: Header=BB15_20 Depth=2
	movslq	52(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$13440, %rax                    # imm = 0x3480
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	48(%rsp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	52(%rsp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	leaq	grid(%rip), %rax
	addq	$13440, %rax                    # imm = 0x3480
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	48(%rsp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.22:                               #   in Loop: Header=BB15_20 Depth=2
	movl	48(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 48(%rsp)
	jmp	.LBB15_20
.LBB15_23:                              #   in Loop: Header=BB15_18 Depth=1
	jmp	.LBB15_24
.LBB15_24:                              #   in Loop: Header=BB15_18 Depth=1
	movl	52(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 52(%rsp)
	jmp	.LBB15_18
.LBB15_25:
	movl	$55, %ecx
	callq	generateNewLineForeground
	movl	$55, %ecx
	callq	generateNewLineBackground
	movl	$54, %ecx
	callq	setPlants
	movl	score(%rip), %eax
	addl	$1, %eax
	movl	%eax, score(%rip)
	cmpl	$50, score(%rip)
	jge	.LBB15_27
# %bb.26:
	movl	$0, difficulty(%rip)
	jmp	.LBB15_54
.LBB15_27:
	cmpl	$100, score(%rip)
	jge	.LBB15_29
# %bb.28:
	movl	$1, difficulty(%rip)
	jmp	.LBB15_53
.LBB15_29:
	cmpl	$150, score(%rip)
	jge	.LBB15_31
# %bb.30:
	movl	$2, difficulty(%rip)
	jmp	.LBB15_52
.LBB15_31:
	cmpl	$200, score(%rip)
	jge	.LBB15_33
# %bb.32:
	movl	$3, difficulty(%rip)
	jmp	.LBB15_51
.LBB15_33:
	cmpl	$250, score(%rip)
	jge	.LBB15_35
# %bb.34:
	movl	$4, difficulty(%rip)
	jmp	.LBB15_50
.LBB15_35:
	cmpl	$300, score(%rip)               # imm = 0x12C
	jge	.LBB15_37
# %bb.36:
	movl	$5, difficulty(%rip)
	jmp	.LBB15_49
.LBB15_37:
	cmpl	$350, score(%rip)               # imm = 0x15E
	jge	.LBB15_39
# %bb.38:
	movl	$6, difficulty(%rip)
	jmp	.LBB15_48
.LBB15_39:
	cmpl	$400, score(%rip)               # imm = 0x190
	jge	.LBB15_41
# %bb.40:
	movl	$7, difficulty(%rip)
	jmp	.LBB15_47
.LBB15_41:
	cmpl	$450, score(%rip)               # imm = 0x1C2
	jge	.LBB15_43
# %bb.42:
	movl	$8, difficulty(%rip)
	jmp	.LBB15_46
.LBB15_43:
	cmpl	$449, score(%rip)               # imm = 0x1C1
	jle	.LBB15_45
# %bb.44:
	movl	$9, difficulty(%rip)
.LBB15_45:
	jmp	.LBB15_46
.LBB15_46:
	jmp	.LBB15_47
.LBB15_47:
	jmp	.LBB15_48
.LBB15_48:
	jmp	.LBB15_49
.LBB15_49:
	jmp	.LBB15_50
.LBB15_50:
	jmp	.LBB15_51
.LBB15_51:
	jmp	.LBB15_52
.LBB15_52:
	jmp	.LBB15_53
.LBB15_53:
	jmp	.LBB15_54
.LBB15_54:
	jmp	.LBB15_55
.LBB15_55:
	cvtsi2ssl	refreshRate(%rip), %xmm1
	movss	.LCPI15_2(%rip), %xmm0          # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	movss	%xmm0, 44(%rsp)
	movss	44(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	mapX(%rip), %xmm1               # xmm1 = mem[0],zero,zero,zero
	movss	.LCPI15_1(%rip), %xmm2          # xmm2 = [-6.0E+1,0.0E+0,0.0E+0,0.0E+0]
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, mapX(%rip)
	addq	$72, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	drawWorld;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function drawWorld
.LCPI16_0:
	.long	0x41800000                      # float 16
	.text
	.globl	drawWorld
	.p2align	4, 0x90
drawWorld:                              # @drawWorld
.seh_proc drawWorld
# %bb.0:
	subq	$88, %rsp
	.seh_stackalloc 88
	.seh_endprologue
	movl	$0, 84(%rsp)
.LBB16_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB16_3 Depth 2
	cmpl	$56, 84(%rsp)
	jge	.LBB16_50
# %bb.2:                                #   in Loop: Header=BB16_1 Depth=1
	movl	$0, 80(%rsp)
.LBB16_3:                               #   Parent Loop BB16_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$30, 80(%rsp)
	jge	.LBB16_48
# %bb.4:                                #   in Loop: Header=BB16_3 Depth=2
	movslq	84(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	80(%rsp), %rcx
	cmpl	$1, (%rax,%rcx,4)
	je	.LBB16_12
# %bb.5:                                #   in Loop: Header=BB16_3 Depth=2
	movslq	84(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	80(%rsp), %rcx
	cmpl	$2, (%rax,%rcx,4)
	je	.LBB16_12
# %bb.6:                                #   in Loop: Header=BB16_3 Depth=2
	movslq	84(%rsp), %rcx
	leaq	grid(%rip), %rax
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	80(%rsp), %rcx
	cmpl	$23, (%rax,%rcx,4)
	jne	.LBB16_8
# %bb.7:                                #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$3, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_11
.LBB16_8:                               #   in Loop: Header=BB16_3 Depth=2
	movslq	84(%rsp), %rcx
	leaq	grid(%rip), %rax
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	80(%rsp), %rcx
	cmpl	$24, (%rax,%rcx,4)
	jne	.LBB16_10
# %bb.9:                                #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movl	%r8d, %edx
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
.LBB16_10:                              #   in Loop: Header=BB16_3 Depth=2
	jmp	.LBB16_11
.LBB16_11:                              #   in Loop: Header=BB16_3 Depth=2
	jmp	.LBB16_12
.LBB16_12:                              #   in Loop: Header=BB16_3 Depth=2
	movslq	84(%rsp), %rax
	imulq	$120, %rax, %rcx
	leaq	grid(%rip), %rax
	addq	%rcx, %rax
	movslq	80(%rsp), %rcx
	movl	6720(%rax,%rcx,4), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, 72(%rsp)                  # 8-byte Spill
	subq	$18, %rax
	ja	.LBB16_32
# %bb.51:                               #   in Loop: Header=BB16_3 Depth=2
	movq	72(%rsp), %rax                  # 8-byte Reload
	leaq	.LJTI16_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
.LBB16_13:                              #   in Loop: Header=BB16_3 Depth=2
	jmp	.LBB16_33
.LBB16_14:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movl	%r8d, %edx
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_15:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$5, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_16:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$9, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_17:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$7, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_18:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$11, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_19:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$13, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_20:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$15, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_21:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$17, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_22:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$19, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_23:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$1, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_24:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$5, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_25:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$9, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_26:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$7, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_27:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$11, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_28:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$13, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_29:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$15, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_30:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$17, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_31:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$19, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_33
.LBB16_32:                              #   in Loop: Header=BB16_3 Depth=2
	jmp	.LBB16_33
.LBB16_33:                              #   in Loop: Header=BB16_3 Depth=2
	movslq	84(%rsp), %rax
	imulq	$120, %rax, %rcx
	leaq	grid(%rip), %rax
	addq	%rcx, %rax
	movslq	80(%rsp), %rcx
	movl	13440(%rax,%rcx,4), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	subq	$34, %rax
	ja	.LBB16_45
# %bb.52:                               #   in Loop: Header=BB16_3 Depth=2
	movq	64(%rsp), %rax                  # 8-byte Reload
	leaq	.LJTI16_1(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
.LBB16_34:                              #   in Loop: Header=BB16_3 Depth=2
	jmp	.LBB16_46
.LBB16_35:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$21, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_36:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$21, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_37:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$23, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_38:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$23, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_39:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$25, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_40:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$25, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_41:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$27, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_42:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$27, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_43:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$29, %edx
	movl	$1, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_44:                              #   in Loop: Header=BB16_3 Depth=2
	movl	tileTexture2(%rip), %ecx
	movl	84(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm2
	addss	mapX(%rip), %xmm2
	movl	80(%rsp), %eax
	shll	$4, %eax
	cvtsi2ss	%eax, %xmm1
	movl	$29, %edx
	movl	$3, %r8d
	movss	.LCPI16_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	jmp	.LBB16_46
.LBB16_45:                              #   in Loop: Header=BB16_3 Depth=2
	jmp	.LBB16_46
.LBB16_46:                              #   in Loop: Header=BB16_3 Depth=2
	jmp	.LBB16_47
.LBB16_47:                              #   in Loop: Header=BB16_3 Depth=2
	movl	80(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 80(%rsp)
	jmp	.LBB16_3
.LBB16_48:                              #   in Loop: Header=BB16_1 Depth=1
	jmp	.LBB16_49
.LBB16_49:                              #   in Loop: Header=BB16_1 Depth=1
	movl	84(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 84(%rsp)
	jmp	.LBB16_1
.LBB16_50:
	addq	$88, %rsp
	retq
	.section	.rdata,"dr"
	.p2align	2, 0x0
.LJTI16_0:
	.long	.LBB16_13-.LJTI16_0
	.long	.LBB16_14-.LJTI16_0
	.long	.LBB16_23-.LJTI16_0
	.long	.LBB16_15-.LJTI16_0
	.long	.LBB16_24-.LJTI16_0
	.long	.LBB16_16-.LJTI16_0
	.long	.LBB16_25-.LJTI16_0
	.long	.LBB16_17-.LJTI16_0
	.long	.LBB16_26-.LJTI16_0
	.long	.LBB16_18-.LJTI16_0
	.long	.LBB16_27-.LJTI16_0
	.long	.LBB16_22-.LJTI16_0
	.long	.LBB16_31-.LJTI16_0
	.long	.LBB16_21-.LJTI16_0
	.long	.LBB16_30-.LJTI16_0
	.long	.LBB16_20-.LJTI16_0
	.long	.LBB16_29-.LJTI16_0
	.long	.LBB16_19-.LJTI16_0
	.long	.LBB16_28-.LJTI16_0
.LJTI16_1:
	.long	.LBB16_34-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_45-.LJTI16_1
	.long	.LBB16_35-.LJTI16_1
	.long	.LBB16_36-.LJTI16_1
	.long	.LBB16_37-.LJTI16_1
	.long	.LBB16_38-.LJTI16_1
	.long	.LBB16_39-.LJTI16_1
	.long	.LBB16_40-.LJTI16_1
	.long	.LBB16_41-.LJTI16_1
	.long	.LBB16_42-.LJTI16_1
	.long	.LBB16_43-.LJTI16_1
	.long	.LBB16_44-.LJTI16_1
	.text
	.seh_endproc
                                        # -- End function
	.def	proofCollision;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function proofCollision
.LCPI17_0:
	.long	0x41800000                      # float 16
.LCPI17_1:
	.long	0x41600000                      # float 14
.LCPI17_2:
	.long	0x40800000                      # float 4
.LCPI17_3:
	.long	0x40000000                      # float 2
	.text
	.globl	proofCollision
	.p2align	4, 0x90
proofCollision:                         # @proofCollision
.seh_proc proofCollision
# %bb.0:
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movss	%xmm0, 64(%rsp)
	movss	%xmm1, 60(%rsp)
	movss	.LCPI17_3(%rip), %xmm0          # xmm0 = [2.0E+0,0.0E+0,0.0E+0,0.0E+0]
	addss	64(%rsp), %xmm0
	subss	mapX(%rip), %xmm0
	movss	.LCPI17_0(%rip), %xmm1          # xmm1 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	callq	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, 56(%rsp)
	movss	.LCPI17_2(%rip), %xmm0          # xmm0 = [4.0E+0,0.0E+0,0.0E+0,0.0E+0]
	addss	60(%rsp), %xmm0
	movss	.LCPI17_0(%rip), %xmm1          # xmm1 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	callq	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, 52(%rsp)
	movss	.LCPI17_1(%rip), %xmm0          # xmm0 = [1.4E+1,0.0E+0,0.0E+0,0.0E+0]
	addss	64(%rsp), %xmm0
	subss	mapX(%rip), %xmm0
	movss	.LCPI17_0(%rip), %xmm1          # xmm1 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	callq	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, 48(%rsp)
	movss	.LCPI17_1(%rip), %xmm0          # xmm0 = [1.4E+1,0.0E+0,0.0E+0,0.0E+0]
	addss	60(%rsp), %xmm0
	movss	.LCPI17_0(%rip), %xmm1          # xmm1 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	callq	floor
	cvttsd2si	%xmm0, %eax
	movl	%eax, 44(%rsp)
	movslq	56(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	52(%rsp), %rcx
	cmpl	$0, (%rax,%rcx,4)
	jne	.LBB17_4
# %bb.1:
	movslq	48(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	52(%rsp), %rcx
	cmpl	$0, (%rax,%rcx,4)
	jne	.LBB17_4
# %bb.2:
	movslq	48(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	44(%rsp), %rcx
	cmpl	$0, (%rax,%rcx,4)
	jne	.LBB17_4
# %bb.3:
	movslq	56(%rsp), %rcx
	leaq	grid(%rip), %rax
	addq	$6720, %rax                     # imm = 0x1A40
	imulq	$120, %rcx, %rcx
	addq	%rcx, %rax
	movslq	44(%rsp), %rcx
	cmpl	$0, (%rax,%rcx,4)
	je	.LBB17_5
.LBB17_4:
	movb	$1, 71(%rsp)
	jmp	.LBB17_6
.LBB17_5:
	movb	$0, 71(%rsp)
.LBB17_6:
	movb	71(%rsp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$72, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	updatePlayer;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	4, 0x0                          # -- Begin function updatePlayer
.LCPI18_0:
	.long	0x3f000000                      # float 0.5
.LCPI18_1:
	.long	0x3f800000                      # float 1
.LCPI18_2:
	.quad	0x3ff0000000000000              # double 1
.LCPI18_3:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
	.text
	.globl	updatePlayer
	.p2align	4, 0x90
updatePlayer:                           # @updatePlayer
.seh_proc updatePlayer
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movb	playerIsAlive(%rip), %al
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$1, %eax
	jne	.LBB18_12
# %bb.1:
	cvtsi2ssl	refreshRate(%rip), %xmm1
	movss	.LCPI18_1(%rip), %xmm0          # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	movss	%xmm0, 52(%rsp)
	movss	gravity(%rip), %xmm0            # xmm0 = mem[0],zero,zero,zero
	movss	52(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	movss	playerAcceleration(%rip), %xmm1 # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, playerAcceleration(%rip)
	movss	playerAcceleration(%rip), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movss	52(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	movss	.LCPI18_0(%rip), %xmm1          # xmm1 = [5.0E-1,0.0E+0,0.0E+0,0.0E+0]
	mulss	gravity(%rip), %xmm1
	mulss	52(%rsp), %xmm1
	mulss	52(%rsp), %xmm1
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, 48(%rsp)
	movss	playerPosX(%rip), %xmm0         # xmm0 = mem[0],zero,zero,zero
	movss	playerPosY(%rip), %xmm1         # xmm1 = mem[0],zero,zero,zero
	subss	48(%rsp), %xmm1
	callq	proofCollision
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$1, %eax
	jne	.LBB18_10
# %bb.2:
	movl	$0, 44(%rsp)
.LBB18_3:                               # =>This Inner Loop Header: Depth=1
	cvtsi2sdl	44(%rsp), %xmm1
	movss	48(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movaps	.LCPI18_3(%rip), %xmm2          # xmm2 = [NaN,NaN]
	pand	%xmm2, %xmm0
	movsd	.LCPI18_2(%rip), %xmm2          # xmm2 = [1.0E+0,0.0E+0]
	addsd	%xmm2, %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	.LBB18_9
# %bb.4:                                #   in Loop: Header=BB18_3 Depth=1
	movss	playerPosX(%rip), %xmm0         # xmm0 = mem[0],zero,zero,zero
	movss	playerPosY(%rip), %xmm1         # xmm1 = mem[0],zero,zero,zero
	movss	48(%rsp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	xorps	%xmm3, %xmm3
	movl	$1, %eax
	movl	$4294967295, %ecx               # imm = 0xFFFFFFFF
	ucomiss	%xmm3, %xmm2
	cmoval	%ecx, %eax
	cvtsi2ss	%eax, %xmm2
	addss	%xmm2, %xmm1
	callq	proofCollision
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$1, %eax
	je	.LBB18_6
# %bb.5:                                #   in Loop: Header=BB18_3 Depth=1
	movss	48(%rsp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
	movl	$1, %eax
	movl	$4294967295, %ecx               # imm = 0xFFFFFFFF
	ucomiss	%xmm1, %xmm0
	cmoval	%ecx, %eax
	cvtsi2ss	%eax, %xmm0
	addss	playerPosY(%rip), %xmm0
	movss	%xmm0, playerPosY(%rip)
	jmp	.LBB18_7
.LBB18_6:
	callq	glfwGetTime
	movsd	%xmm0, playerDeathTime(%rip)
	movb	$0, playerIsAlive(%rip)
	movb	$0, gameIsRunning(%rip)
	jmp	.LBB18_9
.LBB18_7:                               #   in Loop: Header=BB18_3 Depth=1
	jmp	.LBB18_8
.LBB18_8:                               #   in Loop: Header=BB18_3 Depth=1
	movl	44(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 44(%rsp)
	jmp	.LBB18_3
.LBB18_9:
	jmp	.LBB18_11
.LBB18_10:
	movss	48(%rsp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	playerPosY(%rip), %xmm0         # xmm0 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm0
	movss	%xmm0, playerPosY(%rip)
.LBB18_11:
	jmp	.LBB18_12
.LBB18_12:
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	drawPlayer;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function drawPlayer
.LCPI19_0:
	.long	0x41800000                      # float 16
	.text
	.globl	drawPlayer
	.p2align	4, 0x90
drawPlayer:                             # @drawPlayer
.seh_proc drawPlayer
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movl	tileTexture1(%rip), %ecx
	movss	playerPosX(%rip), %xmm2         # xmm2 = mem[0],zero,zero,zero
	movss	playerPosY(%rip), %xmm1         # xmm1 = mem[0],zero,zero,zero
	xorl	%r8d, %r8d
	movss	.LCPI19_0(%rip), %xmm0          # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movl	%r8d, %edx
	movaps	%xmm0, %xmm3
	movss	%xmm2, 32(%rsp)
	movss	%xmm1, 40(%rsp)
	movss	%xmm0, 48(%rsp)
	callq	drawTile
	nop
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	resetGame;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function resetGame
.LCPI20_0:
	.long	0x43700000                      # float 240
	.text
	.globl	resetGame
	.p2align	4, 0x90
resetGame:                              # @resetGame
.seh_proc resetGame
# %bb.0:
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	xorps	%xmm0, %xmm0
	movss	%xmm0, playerAcceleration(%rip)
	movss	.LCPI20_0(%rip), %xmm0          # xmm0 = [2.4E+2,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm0, playerPosY(%rip)
	xorps	%xmm0, %xmm0
	movss	%xmm0, mapX(%rip)
	movl	$0, difficulty(%rip)
	movb	$1, playerIsAlive(%rip)
	movl	score(%rip), %eax
	cmpl	highScore(%rip), %eax
	jle	.LBB20_2
# %bb.1:
	movl	score(%rip), %eax
	movl	%eax, highScore(%rip)
.LBB20_2:
	movl	$0, score(%rip)
	movl	$0, 36(%rsp)
.LBB20_3:                               # =>This Inner Loop Header: Depth=1
	cmpl	$56, 36(%rsp)
	jge	.LBB20_8
# %bb.4:                                #   in Loop: Header=BB20_3 Depth=1
	movl	36(%rsp), %ecx
	callq	generateNewLineBackground
	movl	36(%rsp), %ecx
	callq	generateNewLineForeground
	cmpl	$0, 36(%rsp)
	jle	.LBB20_6
# %bb.5:                                #   in Loop: Header=BB20_3 Depth=1
	movl	36(%rsp), %ecx
	subl	$1, %ecx
	callq	setPlants
.LBB20_6:                               #   in Loop: Header=BB20_3 Depth=1
	jmp	.LBB20_7
.LBB20_7:                               #   in Loop: Header=BB20_3 Depth=1
	movl	36(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB20_3
.LBB20_8:
	addq	$40, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	keyCallback;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	3, 0x0                          # -- Begin function keyCallback
.LCPI21_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI21_1:
	.long	0x43960000                      # float 300
	.text
	.globl	keyCallback
	.p2align	4, 0x90
keyCallback:                            # @keyCallback
.seh_proc keyCallback
# %bb.0:
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movl	96(%rsp), %eax
	movq	%rcx, 48(%rsp)
	movl	%edx, 44(%rsp)
	movl	%r8d, 40(%rsp)
	movl	%r9d, 36(%rsp)
	cmpl	$1, 36(%rsp)
	jne	.LBB21_16
# %bb.1:
	movl	44(%rsp), %eax
	movl	%eax, 32(%rsp)                  # 4-byte Spill
	subl	$32, %eax
	je	.LBB21_2
	jmp	.LBB21_17
.LBB21_17:
	movl	32(%rsp), %eax                  # 4-byte Reload
	subl	$87, %eax
	je	.LBB21_2
	jmp	.LBB21_18
.LBB21_18:
	movl	32(%rsp), %eax                  # 4-byte Reload
	subl	$256, %eax                      # imm = 0x100
	je	.LBB21_13
	jmp	.LBB21_19
.LBB21_19:
	movl	32(%rsp), %eax                  # 4-byte Reload
	subl	$265, %eax                      # imm = 0x109
	jne	.LBB21_14
	jmp	.LBB21_2
.LBB21_2:
	movb	playerIsAlive(%rip), %al
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$0, %eax
	jne	.LBB21_7
# %bb.3:
	movb	gameIsRunning(%rip), %al
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$0, %eax
	jne	.LBB21_7
# %bb.4:
	callq	glfwGetTime
	subsd	playerDeathTime(%rip), %xmm0
	movsd	.LCPI21_0(%rip), %xmm1          # xmm1 = [1.0E+0,0.0E+0]
	ucomisd	%xmm1, %xmm0
	jb	.LBB21_6
# %bb.5:
	callq	resetGame
.LBB21_6:
	jmp	.LBB21_10
.LBB21_7:
	movb	gameIsRunning(%rip), %al
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$0, %eax
	jne	.LBB21_9
# %bb.8:
	movb	$1, gameIsRunning(%rip)
.LBB21_9:
	jmp	.LBB21_10
.LBB21_10:
	movb	playerIsAlive(%rip), %al
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$1, %eax
	jne	.LBB21_12
# %bb.11:
	movss	.LCPI21_1(%rip), %xmm0          # xmm0 = [3.0E+2,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm0, playerAcceleration(%rip)
.LBB21_12:
	jmp	.LBB21_15
.LBB21_13:
	movq	48(%rsp), %rcx
	movl	$1, %edx
	callq	glfwSetWindowShouldClose
	jmp	.LBB21_15
.LBB21_14:
	jmp	.LBB21_15
.LBB21_15:
	jmp	.LBB21_16
.LBB21_16:
	addq	$56, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	mouseButtonCallback;
	.scl	2;
	.type	32;
	.endef
	.globl	mouseButtonCallback             # -- Begin function mouseButtonCallback
	.p2align	4, 0x90
mouseButtonCallback:                    # @mouseButtonCallback
.seh_proc mouseButtonCallback
# %bb.0:
	subq	$24, %rsp
	.seh_stackalloc 24
	.seh_endprologue
	movq	%rcx, 16(%rsp)
	movl	%edx, 12(%rsp)
	movl	%r8d, 8(%rsp)
	movl	%r9d, 4(%rsp)
	addq	$24, %rsp
	retq
	.seh_endproc
                                        # -- End function
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	3, 0x0                          # -- Begin function main
.LCPI23_0:
	.quad	0x3fc999999999999a              # double 0.20000000000000001
.LCPI23_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI23_2:
	.long	0x43a38000                      # float 327
.LCPI23_3:
	.long	0x42c80000                      # float 100
.LCPI23_4:
	.long	0x43480000                      # float 200
.LCPI23_5:
	.long	0x437a0000                      # float 250
	.text
	.globl	main
	.p2align	4, 0x90
main:                                   # @main
.seh_proc main
# %bb.0:
	pushq	%rbp
	.seh_pushreg %rbp
	subq	$272, %rsp                      # imm = 0x110
	.seh_stackalloc 272
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	.seh_endprologue
	movq	%r8, -40(%rbp)                  # 8-byte Spill
	movq	%rdx, -48(%rbp)                 # 8-byte Spill
	movl	%ecx, -52(%rbp)                 # 4-byte Spill
	callq	__main
	movl	-52(%rbp), %ecx                 # 4-byte Reload
	movq	-48(%rbp), %rdx                 # 8-byte Reload
	movq	-40(%rbp), %r8                  # 8-byte Reload
	movl	$0, 140(%rbp)
	movl	%ecx, 136(%rbp)
	movq	%rdx, 128(%rbp)
	movq	%r8, 120(%rbp)
	leaq	.L.str.2(%rip), %rcx
	callq	printf
	movl	$1, %ecx
	callq	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	callq	fflush
	callq	glfwInit
	cmpl	$0, %eax
	jne	.LBB23_2
# %bb.1:
	movl	$-1, 140(%rbp)
	jmp	.LBB23_29
.LBB23_2:
	callq	glfwGetPrimaryMonitor
	movq	%rax, 104(%rbp)
	movq	104(%rbp), %rcx
	callq	glfwGetVideoMode
	movq	%rax, 96(%rbp)
	movq	96(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, REAL_WINDOW_WIDTH(%rip)
	movq	96(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, REAL_WINDOW_HEIGHT(%rip)
	movq	96(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, refreshRate(%rip)
	movl	refreshRate(%rip), %edx
	movl	$135183, %ecx                   # imm = 0x2100F
	callq	glfwWindowHint
	movl	REAL_WINDOW_WIDTH(%rip), %ecx
	movl	REAL_WINDOW_HEIGHT(%rip), %edx
	movq	104(%rbp), %r9
	leaq	.L.str.3(%rip), %r8
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	movq	$0, 32(%rsp)
	callq	glfwCreateWindow
	movq	%rax, 112(%rbp)
	cmpq	$0, 112(%rbp)
	jne	.LBB23_4
# %bb.3:
	callq	glfwTerminate
	movl	$-1, 140(%rbp)
	jmp	.LBB23_29
.LBB23_4:
	movq	112(%rbp), %rcx
	callq	glfwMakeContextCurrent
	movl	$1, %ecx
	callq	glfwSwapInterval
	movl	$3042, %ecx                     # imm = 0xBE2
	callq	*__imp_glEnable(%rip)
	movl	$770, %ecx                      # imm = 0x302
	movl	$771, %edx                      # imm = 0x303
	callq	*__imp_glBlendFunc(%rip)
	xorl	%eax, %eax
	movl	%eax, %ecx
	callq	*__imp_GetModuleHandleA(%rip)
	movq	%rax, 88(%rbp)
	movq	88(%rbp), %rcx
	movl	$12, %edx
	leaq	texWidth1(%rip), %r8
	leaq	texHeight1(%rip), %r9
	leaq	80(%rbp), %rax
	movq	%rax, 32(%rsp)
	callq	loadBitmapFromResource
	movq	%rax, 72(%rbp)
	cmpq	$0, 72(%rbp)
	jne	.LBB23_6
# %bb.5:
	movl	$-1, 140(%rbp)
	jmp	.LBB23_29
.LBB23_6:
	movb	$1, 71(%rbp)
	movq	88(%rbp), %rcx
	movl	$13, %edx
	leaq	texWidth2(%rip), %r8
	leaq	texHeight2(%rip), %r9
	leaq	56(%rbp), %rax
	movq	%rax, 32(%rsp)
	callq	loadBitmapFromResource
	movq	%rax, 48(%rbp)
	cmpq	$0, 48(%rbp)
	jne	.LBB23_8
# %bb.7:
	movl	$-1, 140(%rbp)
	jmp	.LBB23_29
.LBB23_8:
	movb	$1, 47(%rbp)
	movq	88(%rbp), %rcx
	movl	$14, %edx
	leaq	texWidth3(%rip), %r8
	leaq	texHeight3(%rip), %r9
	leaq	32(%rbp), %rax
	movq	%rax, 32(%rsp)
	callq	loadBitmapFromResource
	movq	%rax, 24(%rbp)
	cmpq	$0, 24(%rbp)
	jne	.LBB23_10
# %bb.9:
	movl	$-1, 140(%rbp)
	jmp	.LBB23_29
.LBB23_10:
	movb	$1, 23(%rbp)
	movw	.L__const.main.transparentColor(%rip), %ax
	movw	%ax, 20(%rbp)
	movb	.L__const.main.transparentColor+2(%rip), %al
	movb	%al, 22(%rbp)
	movq	80(%rbp), %rcx
	movl	texWidth1(%rip), %edx
	movl	texHeight1(%rip), %r8d
	movb	71(%rbp), %r9b
	leaq	20(%rbp), %rax
	andb	$1, %r9b
	movq	%rax, 32(%rsp)
	callq	RGB_RGBA_convert
	movq	%rax, 8(%rbp)
	movq	56(%rbp), %rcx
	movl	texWidth2(%rip), %edx
	movl	texHeight2(%rip), %r8d
	movb	47(%rbp), %r9b
	leaq	20(%rbp), %rax
	andb	$1, %r9b
	movq	%rax, 32(%rsp)
	callq	RGB_RGBA_convert
	movq	%rax, (%rbp)
	movq	32(%rbp), %rcx
	movl	texWidth3(%rip), %edx
	movl	texHeight3(%rip), %r8d
	movb	23(%rbp), %r9b
	leaq	20(%rbp), %rax
	andb	$1, %r9b
	movq	%rax, 32(%rsp)
	callq	RGB_RGBA_convert
	movq	%rax, -8(%rbp)
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glEnable(%rip)
	movl	$1, %ecx
	leaq	tileTexture1(%rip), %rdx
	callq	*__imp_glGenTextures(%rip)
	movl	tileTexture1(%rip), %edx
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glBindTexture(%rip)
	movl	texWidth1(%rip), %r9d
	movl	texHeight1(%rip), %r10d
	movq	8(%rbp), %rax
	movl	$3553, %ecx                     # imm = 0xDE1
	xorl	%edx, %edx
	movl	$6408, %r8d                     # imm = 0x1908
	movl	%r10d, 32(%rsp)
	movl	$0, 40(%rsp)
	movl	$6408, 48(%rsp)                 # imm = 0x1908
	movl	$5121, 56(%rsp)                 # imm = 0x1401
	movq	%rax, 64(%rsp)
	callq	*__imp_glTexImage2D(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	movl	$10241, %edx                    # imm = 0x2801
	movl	$9728, %r8d                     # imm = 0x2600
	callq	*__imp_glTexParameteri(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	movl	$10240, %edx                    # imm = 0x2800
	movl	$9728, %r8d                     # imm = 0x2600
	callq	*__imp_glTexParameteri(%rip)
	movl	$1, %ecx
	leaq	tileTexture2(%rip), %rdx
	callq	*__imp_glGenTextures(%rip)
	movl	tileTexture2(%rip), %edx
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glBindTexture(%rip)
	movl	texWidth2(%rip), %r9d
	movl	texHeight2(%rip), %r10d
	movq	(%rbp), %rax
	movl	$3553, %ecx                     # imm = 0xDE1
	xorl	%edx, %edx
	movl	$6408, %r8d                     # imm = 0x1908
	movl	%r10d, 32(%rsp)
	movl	$0, 40(%rsp)
	movl	$6408, 48(%rsp)                 # imm = 0x1908
	movl	$5121, 56(%rsp)                 # imm = 0x1401
	movq	%rax, 64(%rsp)
	callq	*__imp_glTexImage2D(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	movl	$10241, %edx                    # imm = 0x2801
	movl	$9728, %r8d                     # imm = 0x2600
	callq	*__imp_glTexParameteri(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	movl	$10240, %edx                    # imm = 0x2800
	movl	$9728, %r8d                     # imm = 0x2600
	callq	*__imp_glTexParameteri(%rip)
	movl	$1, %ecx
	leaq	tileTexture3(%rip), %rdx
	callq	*__imp_glGenTextures(%rip)
	movl	tileTexture3(%rip), %edx
	movl	$3553, %ecx                     # imm = 0xDE1
	callq	*__imp_glBindTexture(%rip)
	movl	texWidth3(%rip), %r9d
	movl	texHeight3(%rip), %r10d
	movq	-8(%rbp), %rax
	movl	$3553, %ecx                     # imm = 0xDE1
	xorl	%edx, %edx
	movl	$6408, %r8d                     # imm = 0x1908
	movl	%r10d, 32(%rsp)
	movl	$0, 40(%rsp)
	movl	$6408, 48(%rsp)                 # imm = 0x1908
	movl	$5121, 56(%rsp)                 # imm = 0x1401
	movq	%rax, 64(%rsp)
	callq	*__imp_glTexImage2D(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	movl	$10241, %edx                    # imm = 0x2801
	movl	$9728, %r8d                     # imm = 0x2600
	callq	*__imp_glTexParameteri(%rip)
	movl	$3553, %ecx                     # imm = 0xDE1
	movl	$10240, %edx                    # imm = 0x2800
	movl	$9728, %r8d                     # imm = 0x2600
	callq	*__imp_glTexParameteri(%rip)
	movq	112(%rbp), %rcx
	leaq	framebufferSizeCallback(%rip), %rdx
	callq	glfwSetFramebufferSizeCallback
	movq	112(%rbp), %rcx
	leaq	keyCallback(%rip), %rdx
	callq	glfwSetKeyCallback
	movq	112(%rbp), %rcx
	leaq	mouseButtonCallback(%rip), %rdx
	callq	glfwSetMouseButtonCallback
	movq	112(%rbp), %rcx
	callq	setWindowIcon
	movq	112(%rbp), %rcx
	movl	REAL_WINDOW_WIDTH(%rip), %edx
	movl	REAL_WINDOW_HEIGHT(%rip), %r8d
	callq	framebufferSizeCallback
	callq	resetGame
	xorps	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
.LBB23_11:                              # =>This Inner Loop Header: Depth=1
	movq	112(%rbp), %rcx
	callq	glfwWindowShouldClose
	cmpl	$0, %eax
	setne	%al
	xorb	$-1, %al
	testb	$1, %al
	jne	.LBB23_12
	jmp	.LBB23_28
.LBB23_12:                              #   in Loop: Header=BB23_11 Depth=1
	callq	glfwGetTime
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	subsd	updateFrameratePrint(%rip), %xmm0
	movsd	.LCPI23_0(%rip), %xmm1          # xmm1 = [2.0000000000000001E-1,0.0E+0]
	ucomisd	%xmm1, %xmm0
	jb	.LBB23_14
# %bb.13:                               #   in Loop: Header=BB23_11 Depth=1
	movsd	-24(%rbp), %xmm1                # xmm1 = mem[0],zero
	subsd	lastUpdateTime(%rip), %xmm1
	movsd	.LCPI23_1(%rip), %xmm0          # xmm0 = [1.0E+0,0.0E+0]
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -12(%rbp)
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, updateFrameratePrint(%rip)
.LBB23_14:                              #   in Loop: Header=BB23_11 Depth=1
	movsd	-24(%rbp), %xmm0                # xmm0 = mem[0],zero
	movsd	%xmm0, lastUpdateTime(%rip)
	movl	$16384, %ecx                    # imm = 0x4000
	callq	*__imp_glClear(%rip)
	callq	drawWorld
	callq	drawPlayer
	cvttss2si	-12(%rbp), %ecx
	movl	$792, %edx                      # imm = 0x318
	movl	$5, %r8d
	movl	$9, %r9d
	movl	$1, 32(%rsp)
	callq	showNumber
	leaq	.L.str.4(%rip), %rcx
	movl	$824, %edx                      # imm = 0x338
	movl	$5, %r8d
	movl	$9, %r9d
	movl	$1, 32(%rsp)
	callq	showText
	testb	$1, gameIsRunning(%rip)
	je	.LBB23_17
# %bb.15:                               #   in Loop: Header=BB23_11 Depth=1
	testb	$1, playerIsAlive(%rip)
	je	.LBB23_17
# %bb.16:                               #   in Loop: Header=BB23_11 Depth=1
	callq	updateWorld
	callq	updatePlayer
	leaq	.L.str.5(%rip), %rcx
	movl	$5, %r8d
	movl	$9, %r9d
	movl	%r8d, %edx
	movl	$1, 32(%rsp)
	callq	showText
	movl	score(%rip), %ecx
	movl	$65, %edx
	movl	$5, %r8d
	movl	$9, %r9d
	movl	$1, 32(%rsp)
	callq	showNumber
	leaq	.L.str.6(%rip), %rcx
	movl	$150, %edx
	movl	$5, %r8d
	movl	$9, %r9d
	movl	$1, 32(%rsp)
	callq	showText
	movl	highScore(%rip), %ecx
	movl	$250, %edx
	movl	$5, %r8d
	movl	$9, %r9d
	movl	$1, 32(%rsp)
	callq	showNumber
	jmp	.LBB23_27
.LBB23_17:                              #   in Loop: Header=BB23_11 Depth=1
	testb	$1, playerIsAlive(%rip)
	je	.LBB23_19
# %bb.18:                               #   in Loop: Header=BB23_11 Depth=1
	leaq	.L.str.5(%rip), %rcx
	movl	$5, %r8d
	movl	$9, %r9d
	movl	%r8d, %edx
	movl	$1, 32(%rsp)
	callq	showText
	movl	score(%rip), %ecx
	movl	$65, %edx
	movl	$5, %r8d
	movl	$9, %r9d
	movl	$1, 32(%rsp)
	callq	showNumber
	leaq	.L.str.6(%rip), %rcx
	movl	$150, %edx
	movl	$5, %r8d
	movl	$9, %r9d
	movl	$1, 32(%rsp)
	callq	showText
	movl	highScore(%rip), %ecx
	movl	$250, %edx
	movl	$5, %r8d
	movl	$9, %r9d
	movl	$1, 32(%rsp)
	callq	showNumber
	leaq	.L.str.7(%rip), %rcx
	movl	$312, %edx                      # imm = 0x138
	movl	$450, %r8d                      # imm = 0x1C2
	movl	$10, %r9d
	movl	$1, 32(%rsp)
	callq	showText
	jmp	.LBB23_26
.LBB23_19:                              #   in Loop: Header=BB23_11 Depth=1
	movl	.L__const.main.color(%rip), %eax
	movl	%eax, -28(%rbp)
	leaq	-28(%rbp), %rax
	movss	.LCPI23_2(%rip), %xmm0          # xmm0 = [3.27E+2,0.0E+0,0.0E+0,0.0E+0]
	movss	.LCPI23_3(%rip), %xmm1          # xmm1 = [1.0E+2,0.0E+0,0.0E+0,0.0E+0]
	movss	.LCPI23_4(%rip), %xmm2          # xmm2 = [2.0E+2,0.0E+0,0.0E+0,0.0E+0]
	movss	.LCPI23_5(%rip), %xmm3          # xmm3 = [2.5E+2,0.0E+0,0.0E+0,0.0E+0]
	movq	%rax, 32(%rsp)
	callq	drawRect
	leaq	.L.str.8(%rip), %rcx
	movl	$337, %edx                      # imm = 0x151
	movl	$110, %r8d
	movl	$11, %r9d
	movl	$2, 32(%rsp)
	callq	showText
	cmpl	$0, score(%rip)
	je	.LBB23_22
# %bb.20:                               #   in Loop: Header=BB23_11 Depth=1
	movl	score(%rip), %eax
	cmpl	highScore(%rip), %eax
	jle	.LBB23_22
# %bb.21:                               #   in Loop: Header=BB23_11 Depth=1
	leaq	.L.str.9(%rip), %rcx
	movl	$337, %edx                      # imm = 0x151
	movl	$150, %r8d
	movl	$7, %r9d
	movl	$4, 32(%rsp)
	callq	showText
	movl	score(%rip), %ecx
	movl	$337, %edx                      # imm = 0x151
	movl	$170, %r8d
	movl	$7, %r9d
	movl	$4, 32(%rsp)
	callq	showNumber
	jmp	.LBB23_25
.LBB23_22:                              #   in Loop: Header=BB23_11 Depth=1
	cmpl	$0, score(%rip)
	je	.LBB23_24
# %bb.23:                               #   in Loop: Header=BB23_11 Depth=1
	leaq	.L.str.5(%rip), %rcx
	movl	$337, %edx                      # imm = 0x151
	movl	$150, %r8d
	movl	$7, %r9d
	movl	$1, 32(%rsp)
	callq	showText
	movl	score(%rip), %ecx
	movl	$337, %edx                      # imm = 0x151
	movl	$170, %r8d
	movl	$7, %r9d
	movl	$1, 32(%rsp)
	callq	showNumber
	leaq	.L.str.6(%rip), %rcx
	movl	$337, %edx                      # imm = 0x151
	movl	$210, %r8d
	movl	$7, %r9d
	movl	$1, 32(%rsp)
	callq	showText
	movl	highScore(%rip), %ecx
	movl	$337, %edx                      # imm = 0x151
	movl	$230, %r8d
	movl	$7, %r9d
	movl	$1, 32(%rsp)
	callq	showNumber
.LBB23_24:                              #   in Loop: Header=BB23_11 Depth=1
	jmp	.LBB23_25
.LBB23_25:                              #   in Loop: Header=BB23_11 Depth=1
	leaq	.L.str.10(%rip), %rcx
	movl	$337, %r8d                      # imm = 0x151
	movl	$7, %r9d
	movl	%r8d, %edx
	movl	$1, 32(%rsp)
	callq	showText
.LBB23_26:                              #   in Loop: Header=BB23_11 Depth=1
	jmp	.LBB23_27
.LBB23_27:                              #   in Loop: Header=BB23_11 Depth=1
	movq	112(%rbp), %rcx
	callq	glfwSwapBuffers
	callq	glfwPollEvents
	jmp	.LBB23_11
.LBB23_28:
	callq	glfwTerminate
	movl	$1, %ecx
	leaq	tileTexture1(%rip), %rdx
	callq	*__imp_glDeleteTextures(%rip)
	movl	$1, %ecx
	leaq	tileTexture2(%rip), %rdx
	callq	*__imp_glDeleteTextures(%rip)
	movl	$1, %ecx
	leaq	tileTexture3(%rip), %rdx
	callq	*__imp_glDeleteTextures(%rip)
	movq	8(%rbp), %rcx
	callq	free
	movq	(%rbp), %rcx
	callq	free
	movq	-8(%rbp), %rcx
	callq	free
	movl	$0, 140(%rbp)
.LBB23_29:
	movl	140(%rbp), %eax
	addq	$272, %rsp                      # imm = 0x110
	popq	%rbp
	retq
	.seh_endproc
                                        # -- End function
	.bss
	.globl	gameIsRunning                   # @gameIsRunning
gameIsRunning:
	.byte	0                               # 0x0

	.globl	updateFrameratePrint            # @updateFrameratePrint
	.p2align	3, 0x0
updateFrameratePrint:
	.quad	0x0000000000000000              # double 0

	.globl	playerDeathTime                 # @playerDeathTime
	.p2align	3, 0x0
playerDeathTime:
	.quad	0x0000000000000000              # double 0

	.globl	lastUpdateTime                  # @lastUpdateTime
	.p2align	3, 0x0
lastUpdateTime:
	.quad	0x0000000000000000              # double 0

	.globl	playerAcceleration              # @playerAcceleration
	.p2align	2, 0x0
playerAcceleration:
	.long	0x00000000                      # float 0

	.data
	.globl	playerPosY                      # @playerPosY
	.p2align	2, 0x0
playerPosY:
	.long	0x43700000                      # float 240

	.globl	playerPosX                      # @playerPosX
	.p2align	2, 0x0
playerPosX:
	.long	0x42c80000                      # float 100

	.globl	playerIsAlive                   # @playerIsAlive
playerIsAlive:
	.byte	1                               # 0x1

	.globl	gravity                         # @gravity
	.p2align	2, 0x0
gravity:
	.long	0xc4750000                      # float -980

	.bss
	.globl	score                           # @score
	.p2align	2, 0x0
score:
	.long	0                               # 0x0

	.globl	highScore                       # @highScore
	.p2align	2, 0x0
highScore:
	.long	0                               # 0x0

	.globl	difficulty                      # @difficulty
	.p2align	2, 0x0
difficulty:
	.long	0                               # 0x0

	.globl	mapX                            # @mapX
	.p2align	2, 0x0
mapX:
	.long	0x00000000                      # float 0

	.globl	grid                            # @grid
	.p2align	4, 0x0
grid:
	.zero	20160

	.section	.rdata,"dr"
.L.str:                                 # @.str
	.asciz	"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

	.data
	.globl	fontOrder                       # @fontOrder
	.p2align	3, 0x0
fontOrder:
	.quad	.L.str

	.bss
	.globl	tileTexture3                    # @tileTexture3
	.p2align	2, 0x0
tileTexture3:
	.long	0                               # 0x0

	.section	.rdata,"dr"
.L.str.1:                               # @.str.1
	.asciz	"%d"

	.globl	difficultyValues                # @difficultyValues
	.p2align	4, 0x0
difficultyValues:
	.long	20                              # 0x14
	.long	20                              # 0x14
	.long	20                              # 0x14
	.long	16                              # 0x10
	.long	16                              # 0x10
	.long	16                              # 0x10
	.long	15                              # 0xf
	.long	15                              # 0xf
	.long	15                              # 0xf
	.long	14                              # 0xe
	.long	19                              # 0x13
	.long	18                              # 0x12
	.long	17                              # 0x11
	.long	17                              # 0x11
	.long	16                              # 0x10
	.long	15                              # 0xf
	.long	14                              # 0xe
	.long	13                              # 0xd
	.long	12                              # 0xc
	.long	11                              # 0xb
	.long	16                              # 0x10
	.long	15                              # 0xf
	.long	14                              # 0xe
	.long	13                              # 0xd
	.long	12                              # 0xc
	.long	12                              # 0xc
	.long	11                              # 0xb
	.long	10                              # 0xa
	.long	9                               # 0x9
	.long	8                               # 0x8

	.bss
	.globl	directionSurface                # @directionSurface
	.p2align	2, 0x0
directionSurface:
	.long	0                               # 0x0

	.globl	directionRoof                   # @directionRoof
	.p2align	2, 0x0
directionRoof:
	.long	0                               # 0x0

	.globl	surfaceBlockY                   # @surfaceBlockY
	.p2align	2, 0x0
surfaceBlockY:
	.long	0                               # 0x0

	.globl	roofBlockY                      # @roofBlockY
	.p2align	2, 0x0
roofBlockY:
	.long	0                               # 0x0

	.globl	lastSurfaceBlockY               # @lastSurfaceBlockY
	.p2align	2, 0x0
lastSurfaceBlockY:
	.long	0                               # 0x0

	.globl	lastRoofBlockY                  # @lastRoofBlockY
	.p2align	2, 0x0
lastRoofBlockY:
	.long	0                               # 0x0

	.globl	refreshRate                     # @refreshRate
	.p2align	2, 0x0
refreshRate:
	.long	0                               # 0x0

	.globl	tileTexture2                    # @tileTexture2
	.p2align	2, 0x0
tileTexture2:
	.long	0                               # 0x0

	.globl	tileTexture1                    # @tileTexture1
	.p2align	2, 0x0
tileTexture1:
	.long	0                               # 0x0

	.section	.rdata,"dr"
.L.str.2:                               # @.str.2
	.asciz	"is running"

	.bss
	.globl	REAL_WINDOW_WIDTH               # @REAL_WINDOW_WIDTH
	.p2align	2, 0x0
REAL_WINDOW_WIDTH:
	.long	0                               # 0x0

	.globl	REAL_WINDOW_HEIGHT              # @REAL_WINDOW_HEIGHT
	.p2align	2, 0x0
REAL_WINDOW_HEIGHT:
	.long	0                               # 0x0

	.section	.rdata,"dr"
.L.str.3:                               # @.str.3
	.asciz	"tunnelBird"

	.bss
	.globl	texWidth1                       # @texWidth1
	.p2align	2, 0x0
texWidth1:
	.long	0                               # 0x0

	.globl	texHeight1                      # @texHeight1
	.p2align	2, 0x0
texHeight1:
	.long	0                               # 0x0

	.globl	texWidth2                       # @texWidth2
	.p2align	2, 0x0
texWidth2:
	.long	0                               # 0x0

	.globl	texHeight2                      # @texHeight2
	.p2align	2, 0x0
texHeight2:
	.long	0                               # 0x0

	.globl	texWidth3                       # @texWidth3
	.p2align	2, 0x0
texWidth3:
	.long	0                               # 0x0

	.globl	texHeight3                      # @texHeight3
	.p2align	2, 0x0
texHeight3:
	.long	0                               # 0x0

	.section	.rdata,"dr"
.L__const.main.transparentColor:        # @__const.main.transparentColor
	.ascii	"\377\000\377"

.L.str.4:                               # @.str.4
	.asciz	"FPS"

.L.str.5:                               # @.str.5
	.asciz	"SCORE"

.L.str.6:                               # @.str.6
	.asciz	"HIGHSCORE"

.L.str.7:                               # @.str.7
	.asciz	"PRESS JUMP KEY TO START"

.L__const.main.color:                   # @__const.main.color
	.ascii	"222\334"

.L.str.8:                               # @.str.8
	.asciz	"GAME OVER"

.L.str.9:                               # @.str.9
	.asciz	"NEW HIGHSCORE"

.L.str.10:                              # @.str.10
	.asciz	"PRESS JUMP KEY TO CONTINOU"

	.bss
	.globl	texChannels1                    # @texChannels1
	.p2align	2, 0x0
texChannels1:
	.long	0                               # 0x0

	.globl	texChannels2                    # @texChannels2
	.p2align	2, 0x0
texChannels2:
	.long	0                               # 0x0

	.globl	texChannels3                    # @texChannels3
	.p2align	2, 0x0
texChannels3:
	.long	0                               # 0x0

	.addrsig
	.addrsig_sym loadBitmapFromResource
	.addrsig_sym setWindowIcon
	.addrsig_sym glfwGetWin32Window
	.addrsig_sym framebufferSizeCallback
	.addrsig_sym RGB_RGBA_convert
	.addrsig_sym malloc
	.addrsig_sym drawTile
	.addrsig_sym drawRect
	.addrsig_sym indexOf
	.addrsig_sym showText
	.addrsig_sym showNumber
	.addrsig_sym snprintf
	.addrsig_sym getBackgroundBlock
	.addrsig_sym rand
	.addrsig_sym generateNewLineBackground
	.addrsig_sym getForegroundBlock
	.addrsig_sym generateNewLineForeground
	.addrsig_sym getPlant
	.addrsig_sym setPlants
	.addrsig_sym updateWorld
	.addrsig_sym drawWorld
	.addrsig_sym proofCollision
	.addrsig_sym updatePlayer
	.addrsig_sym glfwGetTime
	.addrsig_sym drawPlayer
	.addrsig_sym resetGame
	.addrsig_sym keyCallback
	.addrsig_sym glfwSetWindowShouldClose
	.addrsig_sym mouseButtonCallback
	.addrsig_sym printf
	.addrsig_sym fflush
	.addrsig_sym glfwInit
	.addrsig_sym glfwGetPrimaryMonitor
	.addrsig_sym glfwGetVideoMode
	.addrsig_sym glfwWindowHint
	.addrsig_sym glfwCreateWindow
	.addrsig_sym glfwTerminate
	.addrsig_sym glfwMakeContextCurrent
	.addrsig_sym glfwSwapInterval
	.addrsig_sym glfwSetFramebufferSizeCallback
	.addrsig_sym glfwSetKeyCallback
	.addrsig_sym glfwSetMouseButtonCallback
	.addrsig_sym glfwWindowShouldClose
	.addrsig_sym glfwSwapBuffers
	.addrsig_sym glfwPollEvents
	.addrsig_sym free
	.addrsig_sym gameIsRunning
	.addrsig_sym updateFrameratePrint
	.addrsig_sym playerDeathTime
	.addrsig_sym lastUpdateTime
	.addrsig_sym playerAcceleration
	.addrsig_sym playerPosY
	.addrsig_sym playerPosX
	.addrsig_sym playerIsAlive
	.addrsig_sym gravity
	.addrsig_sym score
	.addrsig_sym highScore
	.addrsig_sym difficulty
	.addrsig_sym mapX
	.addrsig_sym grid
	.addrsig_sym fontOrder
	.addrsig_sym tileTexture3
	.addrsig_sym difficultyValues
	.addrsig_sym directionSurface
	.addrsig_sym directionRoof
	.addrsig_sym surfaceBlockY
	.addrsig_sym roofBlockY
	.addrsig_sym lastSurfaceBlockY
	.addrsig_sym lastRoofBlockY
	.addrsig_sym refreshRate
	.addrsig_sym tileTexture2
	.addrsig_sym tileTexture1
	.addrsig_sym REAL_WINDOW_WIDTH
	.addrsig_sym REAL_WINDOW_HEIGHT
	.addrsig_sym texWidth1
	.addrsig_sym texHeight1
	.addrsig_sym texWidth2
	.addrsig_sym texHeight2
	.addrsig_sym texWidth3
	.addrsig_sym texHeight3
