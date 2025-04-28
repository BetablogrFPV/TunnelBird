	.text
	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
.set @feat.00, 1
	.file	"tunnelBird.c"
	.def	_loadBitmapFromResource;
	.scl	2;
	.type	32;
	.endef
	.globl	_loadBitmapFromResource         # -- Begin function loadBitmapFromResource
	.p2align	4, 0x90
_loadBitmapFromResource:                # @loadBitmapFromResource
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$28, %esp
	movl	24(%ebp), %eax
	movl	20(%ebp), %eax
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
                                        # kill: def $ax killed $ax killed $eax
	movzwl	%ax, %ecx
	movl	$2, %eax
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	*__imp__FindResourceA@12
	subl	$12, %esp
	movl	%eax, -8(%ebp)
	cmpl	$0, -8(%ebp)
	jne	LBB0_2
# %bb.1:
	movl	$0, -4(%ebp)
	jmp	LBB0_7
LBB0_2:
	movl	8(%ebp), %ecx
	movl	-8(%ebp), %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__LoadResource@8
	subl	$8, %esp
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	LBB0_4
# %bb.3:
	movl	$0, -4(%ebp)
	jmp	LBB0_7
LBB0_4:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	calll	*__imp__LockResource@4
	subl	$4, %esp
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	LBB0_6
# %bb.5:
	movl	$0, -4(%ebp)
	jmp	LBB0_7
LBB0_6:
	movl	-16(%ebp), %eax
	movl	4(%eax), %ecx
	movl	16(%ebp), %eax
	movl	%ecx, (%eax)
	movl	-16(%ebp), %eax
	movl	8(%eax), %ecx
	movl	%ecx, %eax
	negl	%eax
	cmovnsl	%eax, %ecx
	movl	20(%ebp), %eax
	movl	%ecx, (%eax)
	movl	-16(%ebp), %ecx
	movl	-16(%ebp), %eax
	addl	(%eax), %ecx
	movl	-16(%ebp), %eax
	movl	32(%eax), %eax
	shll	$2, %eax
	addl	%eax, %ecx
	movl	24(%ebp), %eax
	movl	%ecx, (%eax)
	movl	-16(%ebp), %eax
	movl	%eax, -4(%ebp)
LBB0_7:
	movl	-4(%ebp), %eax
	addl	$28, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_setWindowIcon;
	.scl	2;
	.type	32;
	.endef
	.globl	_setWindowIcon                  # -- Begin function setWindowIcon
	.p2align	4, 0x90
_setWindowIcon:                         # @setWindowIcon
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	calll	_glfwGetWin32Window
	movl	%eax, -4(%ebp)
	xorl	%eax, %eax
	movl	$0, (%esp)
	calll	*__imp__GetModuleHandleA@4
	subl	$4, %esp
	movl	%eax, %ecx
	movl	$101, %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__LoadIconA@8
	subl	$8, %esp
	movl	%eax, -8(%ebp)
	cmpl	$0, -8(%ebp)
	je	LBB1_2
# %bb.1:
	movl	-4(%ebp), %ecx
	movl	-8(%ebp), %eax
	xorl	%edx, %edx
	movl	%ecx, (%esp)
	movl	$128, 4(%esp)
	movl	$0, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__SendMessageA@16
	subl	$16, %esp
	movl	-4(%ebp), %ecx
	movl	-8(%ebp), %eax
	movl	%ecx, (%esp)
	movl	$128, 4(%esp)
	movl	$1, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__SendMessageA@16
	subl	$16, %esp
LBB1_2:
	addl	$24, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_RGB_RGBA_convert;
	.scl	2;
	.type	32;
	.endef
	.globl	_RGB_RGBA_convert               # -- Begin function RGB_RGBA_convert
	.p2align	4, 0x90
_RGB_RGBA_convert:                      # @RGB_RGBA_convert
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$36, %esp
	movl	24(%ebp), %eax
	movb	20(%ebp), %al
	movl	16(%ebp), %ecx
	movl	12(%ebp), %ecx
	movl	8(%ebp), %ecx
	andb	$1, %al
	movb	%al, -1(%ebp)
	movl	12(%ebp), %eax
	imull	16(%ebp), %eax
	shll	$2, %eax
	movl	%eax, (%esp)
	calll	_malloc
	movl	%eax, -8(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
LBB2_1:                                 # =>This Inner Loop Header: Depth=1
	movl	-12(%ebp), %eax
	movl	12(%ebp), %ecx
	imull	16(%ebp), %ecx
	imull	$3, %ecx, %ecx
	cmpl	%ecx, %eax
	jge	LBB2_13
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movl	8(%ebp), %eax
	movl	-12(%ebp), %ecx
	movb	(%eax,%ecx), %al
	movb	%al, -17(%ebp)
	movl	8(%ebp), %eax
	movl	-12(%ebp), %ecx
	movb	1(%eax,%ecx), %al
	movb	%al, -18(%ebp)
	movl	8(%ebp), %eax
	movl	-12(%ebp), %ecx
	movb	2(%eax,%ecx), %al
	movb	%al, -19(%ebp)
	testb	$1, -1(%ebp)
	je	LBB2_4
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movzbl	-19(%ebp), %eax
	movl	%eax, -24(%ebp)                 # 4-byte Spill
	jmp	LBB2_5
LBB2_4:                                 #   in Loop: Header=BB2_1 Depth=1
	movzbl	-17(%ebp), %eax
	movl	%eax, -24(%ebp)                 # 4-byte Spill
LBB2_5:                                 #   in Loop: Header=BB2_1 Depth=1
	movl	-24(%ebp), %eax                 # 4-byte Reload
	movb	%al, %dl
	movl	-8(%ebp), %eax
	movl	-16(%ebp), %ecx
	movb	%dl, (%eax,%ecx)
	movb	-18(%ebp), %dl
	movl	-8(%ebp), %eax
	movl	-16(%ebp), %ecx
	movb	%dl, 1(%eax,%ecx)
	testb	$1, -1(%ebp)
	je	LBB2_7
# %bb.6:                                #   in Loop: Header=BB2_1 Depth=1
	movzbl	-17(%ebp), %eax
	movl	%eax, -28(%ebp)                 # 4-byte Spill
	jmp	LBB2_8
LBB2_7:                                 #   in Loop: Header=BB2_1 Depth=1
	movzbl	-19(%ebp), %eax
	movl	%eax, -28(%ebp)                 # 4-byte Spill
LBB2_8:                                 #   in Loop: Header=BB2_1 Depth=1
	movl	-28(%ebp), %eax                 # 4-byte Reload
	movb	%al, %dl
	movl	-8(%ebp), %eax
	movl	-16(%ebp), %ecx
	movb	%dl, 2(%eax,%ecx)
	movzbl	-17(%ebp), %ecx
	movl	24(%ebp), %eax
	movzbl	(%eax), %edx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	%edx, %ecx
	movb	%al, -29(%ebp)                  # 1-byte Spill
	jne	LBB2_11
# %bb.9:                                #   in Loop: Header=BB2_1 Depth=1
	movzbl	-18(%ebp), %ecx
	movl	24(%ebp), %eax
	movzbl	1(%eax), %edx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	%edx, %ecx
	movb	%al, -29(%ebp)                  # 1-byte Spill
	jne	LBB2_11
# %bb.10:                               #   in Loop: Header=BB2_1 Depth=1
	movzbl	-19(%ebp), %eax
	movl	24(%ebp), %ecx
	movzbl	2(%ecx), %ecx
	cmpl	%ecx, %eax
	sete	%al
	movb	%al, -29(%ebp)                  # 1-byte Spill
LBB2_11:                                #   in Loop: Header=BB2_1 Depth=1
	movb	-29(%ebp), %dl                  # 1-byte Reload
	movl	$255, %eax
	xorl	%ecx, %ecx
	testb	$1, %dl
	cmovnel	%ecx, %eax
	movb	%al, %dl
	movl	-8(%ebp), %eax
	movl	-16(%ebp), %ecx
	movb	%dl, 3(%eax,%ecx)
# %bb.12:                               #   in Loop: Header=BB2_1 Depth=1
	movl	-12(%ebp), %eax
	addl	$3, %eax
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	addl	$4, %eax
	movl	%eax, -16(%ebp)
	jmp	LBB2_1
LBB2_13:
	movl	-8(%ebp), %eax
	addl	$36, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_getIngameSpeed;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function getIngameSpeed
LCPI3_0:
	.long	0x3f800000                      # float 1
	.text
	.globl	_getIngameSpeed
	.p2align	4, 0x90
_getIngameSpeed:                        # @getIngameSpeed
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%eax
	movss	8(%ebp), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	_refreshRate, %xmm1
	movss	LCPI3_0, %xmm0                  # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	movss	8(%ebp), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm1, %xmm0
	movss	%xmm0, -4(%ebp)
	flds	-4(%ebp)
	addl	$4, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_mouseButtonCallback;
	.scl	2;
	.type	32;
	.endef
	.globl	_mouseButtonCallback            # -- Begin function mouseButtonCallback
	.p2align	4, 0x90
_mouseButtonCallback:                   # @mouseButtonCallback
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	movl	20(%ebp), %eax
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	popl	%ebp
	retl
                                        # -- End function
	.def	_keyCallback;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function keyCallback
LCPI5_0:
	.long	0x43700000                      # float 240
LCPI5_1:
	.long	0x43f00000                      # float 480
LCPI5_2:
	.long	0x43960000                      # float 300
	.text
	.globl	_keyCallback
	.p2align	4, 0x90
_keyCallback:                           # @keyCallback
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	24(%ebp), %eax
	movl	20(%ebp), %eax
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	cmpl	$1, 20(%ebp)
	jne	LBB5_17
# %bb.1:
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)                 # 4-byte Spill
	subl	$82, %eax
	je	LBB5_5
	jmp	LBB5_18
LBB5_18:
	movl	-12(%ebp), %eax                 # 4-byte Reload
	subl	$87, %eax
	je	LBB5_2
	jmp	LBB5_19
LBB5_19:
	movl	-12(%ebp), %eax                 # 4-byte Reload
	subl	$256, %eax                      # imm = 0x100
	je	LBB5_14
	jmp	LBB5_20
LBB5_20:
	movl	-12(%ebp), %eax                 # 4-byte Reload
	subl	$265, %eax                      # imm = 0x109
	jne	LBB5_15
	jmp	LBB5_2
LBB5_2:
	movss	LCPI5_1, %xmm0                  # xmm0 = [4.8E+2,0.0E+0,0.0E+0,0.0E+0]
	ucomiss	_playerPosY, %xmm0
	jbe	LBB5_4
# %bb.3:
	movss	LCPI5_2, %xmm0                  # xmm0 = [3.0E+2,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm0, _playerAcceleration
LBB5_4:
	jmp	LBB5_16
LBB5_5:
	movss	LCPI5_0, %xmm0                  # xmm0 = [2.4E+2,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm0, _playerPosY
	xorps	%xmm0, %xmm0
	movss	%xmm0, _playerAcceleration
	movl	$0, -4(%ebp)
LBB5_6:                                 # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_8 Depth 2
	cmpl	$55, -4(%ebp)
	jge	LBB5_13
# %bb.7:                                #   in Loop: Header=BB5_6 Depth=1
	movl	$0, -8(%ebp)
LBB5_8:                                 #   Parent Loop BB5_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$30, -8(%ebp)
	jge	LBB5_11
# %bb.9:                                #   in Loop: Header=BB5_8 Depth=2
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, -4(%ebp), %ecx
	addl	%ecx, %eax
	movl	-8(%ebp), %ecx
	movl	$0, (%eax,%ecx,4)
# %bb.10:                               #   in Loop: Header=BB5_8 Depth=2
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	LBB5_8
LBB5_11:                                #   in Loop: Header=BB5_6 Depth=1
	jmp	LBB5_12
LBB5_12:                                #   in Loop: Header=BB5_6 Depth=1
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	jmp	LBB5_6
LBB5_13:
	movb	$1, _playerIsAlive
	jmp	LBB5_16
LBB5_14:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	calll	_glfwSetWindowShouldClose
	jmp	LBB5_16
LBB5_15:
	jmp	LBB5_16
LBB5_16:
	jmp	LBB5_17
LBB5_17:
	addl	$20, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_framebufferSizeCallback;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	3, 0x0                          # -- Begin function framebufferSizeCallback
LCPI6_0:
	.quad	0x408ab00000000000              # double 854
LCPI6_1:
	.quad	0x407e000000000000              # double 480
LCPI6_2:
	.quad	0xbff0000000000000              # double -1
LCPI6_3:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	_framebufferSizeCallback
	.p2align	4, 0x90
_framebufferSizeCallback:               # @framebufferSizeCallback
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$48, %esp
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	16(%ebp), %eax
	xorl	%edx, %edx
	movl	$0, (%esp)
	movl	$0, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	*__imp__glViewport@16
	subl	$16, %esp
	movl	$5889, (%esp)                   # imm = 0x1701
	calll	*__imp__glMatrixMode@4
	subl	$4, %esp
	calll	*__imp__glLoadIdentity@0
	xorps	%xmm2, %xmm2
	movsd	LCPI6_0, %xmm4                  # xmm4 = [8.54E+2,0.0E+0]
	movsd	LCPI6_1, %xmm3                  # xmm3 = [4.8E+2,0.0E+0]
	movsd	LCPI6_2, %xmm1                  # xmm1 = [-1.0E+0,0.0E+0]
	movsd	LCPI6_3, %xmm0                  # xmm0 = [1.0E+0,0.0E+0]
	movsd	%xmm2, (%esp)
	movsd	%xmm4, 8(%esp)
	movsd	%xmm3, 16(%esp)
	movsd	%xmm2, 24(%esp)
	movsd	%xmm1, 32(%esp)
	movsd	%xmm0, 40(%esp)
	calll	*__imp__glOrtho@48
	subl	$48, %esp
	movl	$5888, (%esp)                   # imm = 0x1700
	calll	*__imp__glMatrixMode@4
	subl	$4, %esp
	calll	*__imp__glLoadIdentity@0
	addl	$48, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_drawTexture;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function drawTexture
LCPI7_0:
	.long	0x3f800000                      # float 1
	.text
	.globl	_drawTexture
	.p2align	4, 0x90
_drawTexture:                           # @drawTexture
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movss	16(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	12(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movl	8(%ebp), %eax
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	movl	8(%ebp), %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	%eax, 4(%esp)
	calll	*__imp__glBindTexture@8
	subl	$8, %esp
	xorl	%eax, %eax
	leal	-4(%ebp), %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$0, 4(%esp)
	movl	$4096, 8(%esp)                  # imm = 0x1000
	movl	%eax, 12(%esp)
	calll	*__imp__glGetTexLevelParameteriv@16
	subl	$16, %esp
	xorl	%eax, %eax
	leal	-8(%ebp), %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$0, 4(%esp)
	movl	$4097, 8(%esp)                  # imm = 0x1001
	movl	%eax, 12(%esp)
	calll	*__imp__glGetTexLevelParameteriv@16
	subl	$16, %esp
	movl	$3553, (%esp)                   # imm = 0xDE1
	calll	*__imp__glEnable@4
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	%eax, 4(%esp)
	calll	*__imp__glBindTexture@8
	subl	$8, %esp
	movl	$7, (%esp)
	calll	*__imp__glBegin@4
	subl	$4, %esp
	xorps	%xmm0, %xmm0
	movss	%xmm0, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glTexCoord2f@8
	subl	$8, %esp
	movss	12(%ebp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	16(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	-8(%ebp), %xmm2
	addss	%xmm2, %xmm0
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glVertex2f@8
	subl	$8, %esp
	movss	LCPI7_0, %xmm1                  # xmm1 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	xorps	%xmm0, %xmm0
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glTexCoord2f@8
	subl	$8, %esp
	movss	12(%ebp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	cvtsi2ssl	-4(%ebp), %xmm0
	addss	%xmm0, %xmm1
	movss	16(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	-8(%ebp), %xmm2
	addss	%xmm2, %xmm0
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glVertex2f@8
	subl	$8, %esp
	movss	LCPI7_0, %xmm0                  # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm0, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glTexCoord2f@8
	subl	$8, %esp
	movss	12(%ebp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	cvtsi2ssl	-4(%ebp), %xmm0
	addss	%xmm0, %xmm1
	movss	16(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glVertex2f@8
	subl	$8, %esp
	xorps	%xmm1, %xmm1
	movss	LCPI7_0, %xmm0                  # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glTexCoord2f@8
	subl	$8, %esp
	movss	12(%ebp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	16(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glVertex2f@8
	subl	$8, %esp
	calll	*__imp__glEnd@0
	movl	$3553, (%esp)                   # imm = 0xDE1
	calll	*__imp__glDisable@4
	addl	$20, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_proofCollision;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function proofCollision
LCPI8_0:
	.long	0x41800000                      # float 16
	.text
	.globl	_proofCollision
	.p2align	4, 0x90
_proofCollision:                        # @proofCollision
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-8, %esp
	subl	$40, %esp
	movss	12(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	8(%ebp), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	movss	8(%ebp), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	subss	_mapX, %xmm0
	movss	LCPI8_0, %xmm1                  # xmm1 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	%esp, %eax
	movsd	%xmm0, (%eax)
	calll	_floor
	fstpl	8(%esp)
	movsd	8(%esp), %xmm0                  # xmm0 = mem[0],zero
	cvttsd2si	%xmm0, %eax
	movl	%eax, 32(%esp)
	movss	12(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	LCPI8_0, %xmm1                  # xmm1 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	%esp, %eax
	movsd	%xmm0, (%eax)
	calll	_floor
	fstpl	16(%esp)
	movsd	16(%esp), %xmm0                 # xmm0 = mem[0],zero
	cvttsd2si	%xmm0, %eax
	movl	%eax, 28(%esp)
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, 32(%esp), %ecx
	addl	%ecx, %eax
	movl	28(%esp), %ecx
	cmpl	$0, (%eax,%ecx,4)
	jne	LBB8_4
# %bb.1:
	movl	32(%esp), %ecx
	addl	$1, %ecx
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, %ecx, %ecx
	addl	%ecx, %eax
	movl	28(%esp), %ecx
	cmpl	$0, (%eax,%ecx,4)
	jne	LBB8_4
# %bb.2:
	movl	32(%esp), %ecx
	addl	$1, %ecx
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, %ecx, %ecx
	addl	%ecx, %eax
	movl	28(%esp), %ecx
	cmpl	$0, 4(%eax,%ecx,4)
	jne	LBB8_4
# %bb.3:
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, 32(%esp), %ecx
	addl	%ecx, %eax
	movl	28(%esp), %ecx
	cmpl	$0, 4(%eax,%ecx,4)
	je	LBB8_5
LBB8_4:
	movb	$1, 39(%esp)
	jmp	LBB8_6
LBB8_5:
	movb	$0, 39(%esp)
LBB8_6:
	movb	39(%esp), %al
	andb	$1, %al
	movzbl	%al, %eax
	movl	%ebp, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_drawTile;
	.scl	2;
	.type	32;
	.endef
	.globl	_drawTile                       # -- Begin function drawTile
	.p2align	4, 0x90
_drawTile:                              # @drawTile
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movss	32(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	28(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	24(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	20(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	movl	8(%ebp), %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	%eax, 4(%esp)
	calll	*__imp__glBindTexture@8
	subl	$8, %esp
	xorl	%eax, %eax
	leal	-4(%ebp), %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$0, 4(%esp)
	movl	$4096, 8(%esp)                  # imm = 0x1000
	movl	%eax, 12(%esp)
	calll	*__imp__glGetTexLevelParameteriv@16
	subl	$16, %esp
	xorl	%eax, %eax
	leal	-8(%ebp), %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$0, 4(%esp)
	movl	$4097, 8(%esp)                  # imm = 0x1001
	movl	%eax, 12(%esp)
	calll	*__imp__glGetTexLevelParameteriv@16
	subl	$16, %esp
	cvtsi2ssl	12(%ebp), %xmm0
	mulss	20(%ebp), %xmm0
	cvtsi2ssl	-4(%ebp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -12(%ebp)
	cvtsi2ssl	-8(%ebp), %xmm0
	movl	16(%ebp), %eax
	addl	$1, %eax
	cvtsi2ss	%eax, %xmm1
	mulss	20(%ebp), %xmm1
	cvtsi2ssl	-8(%ebp), %xmm2
	divss	%xmm2, %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -16(%ebp)
	movss	20(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	-4(%ebp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -20(%ebp)
	movss	20(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtsi2ssl	-8(%ebp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -24(%ebp)
	movl	$3553, (%esp)                   # imm = 0xDE1
	calll	*__imp__glEnable@4
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	%eax, 4(%esp)
	calll	*__imp__glBindTexture@8
	subl	$8, %esp
	movl	$7, (%esp)
	calll	*__imp__glBegin@4
	subl	$4, %esp
	movss	-12(%ebp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-16(%ebp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glTexCoord2f@8
	subl	$8, %esp
	movss	24(%ebp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	28(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	addss	32(%ebp), %xmm0
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glVertex2f@8
	subl	$8, %esp
	movss	-12(%ebp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	addss	-20(%ebp), %xmm1
	movss	-16(%ebp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glTexCoord2f@8
	subl	$8, %esp
	movss	24(%ebp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	addss	32(%ebp), %xmm1
	movss	28(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	addss	32(%ebp), %xmm0
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glVertex2f@8
	subl	$8, %esp
	movss	-12(%ebp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	addss	-20(%ebp), %xmm1
	movss	-16(%ebp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addss	-24(%ebp), %xmm0
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glTexCoord2f@8
	subl	$8, %esp
	movss	24(%ebp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	addss	32(%ebp), %xmm1
	movss	28(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glVertex2f@8
	subl	$8, %esp
	movss	-12(%ebp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	movss	-16(%ebp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	addss	-24(%ebp), %xmm0
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glTexCoord2f@8
	subl	$8, %esp
	movss	24(%ebp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	28(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	*__imp__glVertex2f@8
	subl	$8, %esp
	calll	*__imp__glEnd@0
	movl	$3553, (%esp)                   # imm = 0xDE1
	calll	*__imp__glDisable@4
	addl	$36, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_updatePlayer;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	4, 0x0                          # -- Begin function updatePlayer
LCPI10_0:
	.long	0x3f000000                      # float 0.5
LCPI10_1:
	.long	0x3f800000                      # float 1
LCPI10_2:
	.quad	0x3ff0000000000000              # double 1
LCPI10_3:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
	.text
	.globl	_updatePlayer
	.p2align	4, 0x90
_updatePlayer:                          # @updatePlayer
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movb	_playerIsAlive, %al
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$1, %eax
	jne	LBB10_12
# %bb.1:
	cvtsi2ssl	_refreshRate, %xmm1
	movss	LCPI10_1, %xmm0                 # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	movss	%xmm0, -4(%ebp)
	movss	_gravity, %xmm0                 # xmm0 = mem[0],zero,zero,zero
	movss	-4(%ebp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	movss	_playerAcceleration, %xmm1      # xmm1 = mem[0],zero,zero,zero
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, _playerAcceleration
	movss	_playerAcceleration, %xmm0      # xmm0 = mem[0],zero,zero,zero
	movss	-4(%ebp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	movss	LCPI10_0, %xmm1                 # xmm1 = [5.0E-1,0.0E+0,0.0E+0,0.0E+0]
	mulss	_gravity, %xmm1
	mulss	-4(%ebp), %xmm1
	mulss	-4(%ebp), %xmm1
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%ebp)
	movss	_playerPosX, %xmm1              # xmm1 = mem[0],zero,zero,zero
	movss	_playerPosY, %xmm0              # xmm0 = mem[0],zero,zero,zero
	subss	-8(%ebp), %xmm0
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	_proofCollision
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$1, %eax
	jne	LBB10_10
# %bb.2:
	movl	$0, -12(%ebp)
LBB10_3:                                # =>This Inner Loop Header: Depth=1
	cvtsi2sdl	-12(%ebp), %xmm1
	movss	-8(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movaps	LCPI10_3, %xmm2                 # xmm2 = [NaN,NaN]
	pand	%xmm2, %xmm0
	movsd	LCPI10_2, %xmm2                 # xmm2 = [1.0E+0,0.0E+0]
	addsd	%xmm2, %xmm0
	ucomisd	%xmm1, %xmm0
	jbe	LBB10_9
# %bb.4:                                #   in Loop: Header=BB10_3 Depth=1
	movss	_playerPosX, %xmm1              # xmm1 = mem[0],zero,zero,zero
	movss	_playerPosY, %xmm0              # xmm0 = mem[0],zero,zero,zero
	movss	-8(%ebp), %xmm2                 # xmm2 = mem[0],zero,zero,zero
	xorps	%xmm3, %xmm3
	movl	$1, %eax
	movl	$4294967295, %ecx               # imm = 0xFFFFFFFF
	ucomiss	%xmm3, %xmm2
	cmoval	%ecx, %eax
	cvtsi2ss	%eax, %xmm2
	addss	%xmm2, %xmm0
	movss	%xmm1, (%esp)
	movss	%xmm0, 4(%esp)
	calll	_proofCollision
	andb	$1, %al
	movzbl	%al, %eax
	cmpl	$1, %eax
	je	LBB10_6
# %bb.5:                                #   in Loop: Header=BB10_3 Depth=1
	movss	-8(%ebp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	xorps	%xmm1, %xmm1
	movl	$1, %eax
	movl	$4294967295, %ecx               # imm = 0xFFFFFFFF
	ucomiss	%xmm1, %xmm0
	cmoval	%ecx, %eax
	cvtsi2ss	%eax, %xmm0
	addss	_playerPosY, %xmm0
	movss	%xmm0, _playerPosY
	jmp	LBB10_7
LBB10_6:
	movb	$0, _playerIsAlive
	jmp	LBB10_9
LBB10_7:                                #   in Loop: Header=BB10_3 Depth=1
	jmp	LBB10_8
LBB10_8:                                #   in Loop: Header=BB10_3 Depth=1
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -12(%ebp)
	jmp	LBB10_3
LBB10_9:
	jmp	LBB10_11
LBB10_10:
	movss	-8(%ebp), %xmm1                 # xmm1 = mem[0],zero,zero,zero
	movss	_playerPosY, %xmm0              # xmm0 = mem[0],zero,zero,zero
	subss	%xmm1, %xmm0
	movss	%xmm0, _playerPosY
LBB10_11:
	jmp	LBB10_12
LBB10_12:
	addl	$20, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_drawPlayer;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function drawPlayer
LCPI11_0:
	.long	0x41800000                      # float 16
	.text
	.globl	_drawPlayer
	.p2align	4, 0x90
_drawPlayer:                            # @drawPlayer
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$28, %esp
	movl	_tileTexture1, %eax
	movss	_playerPosX, %xmm2              # xmm2 = mem[0],zero,zero,zero
	movss	_playerPosY, %xmm1              # xmm1 = mem[0],zero,zero,zero
	xorl	%ecx, %ecx
	movss	LCPI11_0, %xmm0                 # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movl	%eax, (%esp)
	movl	$0, 4(%esp)
	movl	$0, 8(%esp)
	movss	%xmm0, 12(%esp)
	movss	%xmm2, 16(%esp)
	movss	%xmm1, 20(%esp)
	movss	%xmm0, 24(%esp)
	calll	_drawTile
	addl	$28, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_getBackgroundBlock;
	.scl	2;
	.type	32;
	.endef
	.globl	_getBackgroundBlock             # -- Begin function getBackgroundBlock
	.p2align	4, 0x90
_getBackgroundBlock:                    # @getBackgroundBlock
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -8(%ebp)
	movl	$100, -12(%ebp)
	calll	_rand
	movl	-12(%ebp), %ecx
	subl	-8(%ebp), %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	addl	-8(%ebp), %edx
	movl	%edx, -16(%ebp)
	cmpl	$60, -16(%ebp)
	jg	LBB12_2
# %bb.1:
	movl	$19, -4(%ebp)
	jmp	LBB12_3
LBB12_2:
	movl	$20, -4(%ebp)
LBB12_3:
	movl	-4(%ebp), %eax
	addl	$16, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_generateNewLineBackground;
	.scl	2;
	.type	32;
	.endef
	.globl	_generateNewLineBackground      # -- Begin function generateNewLineBackground
	.p2align	4, 0x90
_generateNewLineBackground:             # @generateNewLineBackground
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%eax
	movl	8(%ebp), %eax
	movl	$0, -4(%ebp)
LBB13_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$30, -4(%ebp)
	jge	LBB13_4
# %bb.2:                                #   in Loop: Header=BB13_1 Depth=1
	calll	_getBackgroundBlock
	movl	%eax, %edx
	leal	_grid, %eax
	imull	$120, 8(%ebp), %ecx
	addl	%ecx, %eax
	movl	-4(%ebp), %ecx
	movl	%edx, (%eax,%ecx,4)
# %bb.3:                                #   in Loop: Header=BB13_1 Depth=1
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	jmp	LBB13_1
LBB13_4:
	addl	$4, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_getForegroundBlock;
	.scl	2;
	.type	32;
	.endef
	.globl	_getForegroundBlock             # -- Begin function getForegroundBlock
	.p2align	4, 0x90
_getForegroundBlock:                    # @getForegroundBlock
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	20(%ebp), %eax
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	$0, -8(%ebp)
	movl	$100, -12(%ebp)
	calll	_rand
	movl	-12(%ebp), %ecx
	subl	-8(%ebp), %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	addl	-8(%ebp), %edx
	movl	%edx, -16(%ebp)
	cmpl	$60, -16(%ebp)
	jg	LBB14_2
# %bb.1:
	movl	$1, -4(%ebp)
	jmp	LBB14_3
LBB14_2:
	movl	$2, -4(%ebp)
LBB14_3:
	movl	-4(%ebp), %eax
	addl	$16, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_generateNewLineForeground;
	.scl	2;
	.type	32;
	.endef
	.globl	_generateNewLineForeground      # -- Begin function generateNewLineForeground
	.p2align	4, 0x90
_generateNewLineForeground:             # @generateNewLineForeground
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	$0, -4(%ebp)
LBB15_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$30, -4(%ebp)
	jge	LBB15_4
# %bb.2:                                #   in Loop: Header=BB15_1 Depth=1
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, 8(%ebp), %ecx
	addl	%ecx, %eax
	movl	-4(%ebp), %ecx
	movl	$0, (%eax,%ecx,4)
# %bb.3:                                #   in Loop: Header=BB15_1 Depth=1
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	jmp	LBB15_1
LBB15_4:
	cmpl	$0, 8(%ebp)
	jne	LBB15_6
# %bb.5:
	calll	_rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, _directionSurface
	calll	_rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, _directionRoof
	calll	_rand
	movl	$6, %ecx
	cltd
	idivl	%ecx
	addl	$24, %edx
	movl	%edx, _surfaceBlockY
	calll	_rand
	movl	$5, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	movl	%edx, _roofBlockY
	jmp	LBB15_45
LBB15_6:
	calll	_rand
	movl	$101, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	cmpl	$80, %edx
	jle	LBB15_8
# %bb.7:
	calll	_rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, _directionSurface
LBB15_8:
	cmpl	$16, _lastSurfaceBlockY
	jge	LBB15_10
# %bb.9:
	calll	_rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$2, %edx
	movl	%edx, _directionSurface
LBB15_10:
	cmpl	$25, _lastSurfaceBlockY
	jle	LBB15_12
# %bb.11:
	calll	_rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, _directionSurface
LBB15_12:
	cmpl	$28, _lastSurfaceBlockY
	jge	LBB15_22
# %bb.13:
	cmpl	$1, _directionSurface
	jne	LBB15_15
# %bb.14:
	calll	_rand
	movl	_lastSurfaceBlockY, %ecx
	movl	_lastSurfaceBlockY, %edx
	subl	$2, %edx
	subl	%edx, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	_lastSurfaceBlockY, %eax
	subl	$2, %eax
	movl	%eax, _surfaceBlockY
	jmp	LBB15_21
LBB15_15:
	cmpl	$2, _directionSurface
	jne	LBB15_17
# %bb.16:
	calll	_rand
	movl	_lastSurfaceBlockY, %ecx
	addl	$1, %ecx
	movl	_lastSurfaceBlockY, %edx
	subl	$1, %edx
	subl	%edx, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	_lastSurfaceBlockY, %eax
	subl	$1, %eax
	movl	%eax, _surfaceBlockY
	jmp	LBB15_20
LBB15_17:
	cmpl	$3, _directionSurface
	jne	LBB15_19
# %bb.18:
	calll	_rand
	movl	_lastSurfaceBlockY, %ecx
	addl	$2, %ecx
	subl	_lastSurfaceBlockY, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	_lastSurfaceBlockY, %eax
	addl	$1, %eax
	movl	%eax, _surfaceBlockY
LBB15_19:
	jmp	LBB15_20
LBB15_20:
	jmp	LBB15_21
LBB15_21:
	jmp	LBB15_23
LBB15_22:
	calll	_rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$27, %edx
	movl	%edx, _surfaceBlockY
LBB15_23:
	calll	_rand
	movl	$101, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	cmpl	$85, %edx
	jle	LBB15_25
# %bb.24:
	calll	_rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, _directionRoof
LBB15_25:
	movl	_surfaceBlockY, %eax
	subl	_lastRoofBlockY, %eax
	cmpl	$14, %eax
	jle	LBB15_27
# %bb.26:
	calll	_rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$2, %edx
	movl	%edx, _directionRoof
	jmp	LBB15_31
LBB15_27:
	movl	_surfaceBlockY, %eax
	subl	_lastRoofBlockY, %eax
	cmpl	$10, %eax
	jle	LBB15_29
# %bb.28:
	calll	_rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movl	%edx, _directionRoof
	jmp	LBB15_30
LBB15_29:
	movl	$1, _directionRoof
LBB15_30:
	jmp	LBB15_31
LBB15_31:
	cmpl	$3, _lastRoofBlockY
	jge	LBB15_33
# %bb.32:
	calll	_rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	addl	$2, %edx
	movl	%edx, _directionRoof
LBB15_33:
	cmpl	$1, _lastRoofBlockY
	jle	LBB15_43
# %bb.34:
	cmpl	$1, _directionRoof
	jne	LBB15_36
# %bb.35:
	calll	_rand
	movl	_lastRoofBlockY, %ecx
	subl	$1, %ecx
	movl	_lastRoofBlockY, %edx
	subl	$2, %edx
	subl	%edx, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	_lastRoofBlockY, %eax
	subl	$2, %eax
	movl	%eax, _roofBlockY
	jmp	LBB15_42
LBB15_36:
	cmpl	$2, _directionRoof
	jne	LBB15_38
# %bb.37:
	calll	_rand
	movl	_lastRoofBlockY, %ecx
	addl	$1, %ecx
	movl	_lastRoofBlockY, %edx
	subl	$1, %edx
	subl	%edx, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	_lastRoofBlockY, %eax
	subl	$1, %eax
	movl	%eax, _roofBlockY
	jmp	LBB15_41
LBB15_38:
	cmpl	$3, _directionRoof
	jne	LBB15_40
# %bb.39:
	calll	_rand
	movl	_lastRoofBlockY, %ecx
	addl	$2, %ecx
	subl	_lastRoofBlockY, %ecx
	addl	$1, %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	_lastRoofBlockY, %eax
	addl	$1, %eax
	movl	%eax, _roofBlockY
LBB15_40:
	jmp	LBB15_41
LBB15_41:
	jmp	LBB15_42
LBB15_42:
	jmp	LBB15_44
LBB15_43:
	calll	_rand
	movl	$3, %ecx
	cltd
	idivl	%ecx
	addl	$0, %edx
	movl	%edx, _roofBlockY
LBB15_44:
	jmp	LBB15_45
LBB15_45:
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, 8(%ebp), %ecx
	addl	%ecx, %eax
	movl	_surfaceBlockY, %ecx
	movl	$1, (%eax,%ecx,4)
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, 8(%ebp), %ecx
	addl	%ecx, %eax
	movl	_roofBlockY, %ecx
	movl	$2, (%eax,%ecx,4)
	movl	_surfaceBlockY, %eax
	movl	%eax, _lastSurfaceBlockY
	movl	_roofBlockY, %eax
	movl	%eax, _lastRoofBlockY
	movl	$0, -8(%ebp)
	movl	$100, -12(%ebp)
	calll	_rand
	movl	-12(%ebp), %ecx
	subl	-8(%ebp), %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	addl	-8(%ebp), %edx
	movl	%edx, -16(%ebp)
	addl	$16, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_updateWorld;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function updateWorld
LCPI16_0:
	.long	0xc1800000                      # float -16
LCPI16_1:
	.long	0xc2700000                      # float -60
LCPI16_2:
	.long	0x3f800000                      # float 1
	.text
	.globl	_updateWorld
	.p2align	4, 0x90
_updateWorld:                           # @updateWorld
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movss	LCPI16_0, %xmm0                 # xmm0 = [-1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	ucomiss	_mapX, %xmm0
	jb	LBB16_18
# %bb.1:
	xorps	%xmm0, %xmm0
	movss	%xmm0, _mapX
	movl	$1, -4(%ebp)
LBB16_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB16_4 Depth 2
	cmpl	$55, -4(%ebp)
	jge	LBB16_9
# %bb.3:                                #   in Loop: Header=BB16_2 Depth=1
	movl	$0, -8(%ebp)
LBB16_4:                                #   Parent Loop BB16_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$30, -8(%ebp)
	jge	LBB16_7
# %bb.5:                                #   in Loop: Header=BB16_4 Depth=2
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, -4(%ebp), %ecx
	addl	%ecx, %eax
	movl	-8(%ebp), %ecx
	movl	(%eax,%ecx,4), %edx
	movl	-4(%ebp), %ecx
	subl	$1, %ecx
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, %ecx, %ecx
	addl	%ecx, %eax
	movl	-8(%ebp), %ecx
	movl	%edx, (%eax,%ecx,4)
# %bb.6:                                #   in Loop: Header=BB16_4 Depth=2
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	LBB16_4
LBB16_7:                                #   in Loop: Header=BB16_2 Depth=1
	jmp	LBB16_8
LBB16_8:                                #   in Loop: Header=BB16_2 Depth=1
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	jmp	LBB16_2
LBB16_9:
	movl	$1, -12(%ebp)
LBB16_10:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB16_12 Depth 2
	cmpl	$55, -12(%ebp)
	jge	LBB16_17
# %bb.11:                               #   in Loop: Header=BB16_10 Depth=1
	movl	$0, -16(%ebp)
LBB16_12:                               #   Parent Loop BB16_10 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$30, -16(%ebp)
	jge	LBB16_15
# %bb.13:                               #   in Loop: Header=BB16_12 Depth=2
	leal	_grid, %eax
	imull	$120, -12(%ebp), %ecx
	addl	%ecx, %eax
	movl	-16(%ebp), %ecx
	movl	(%eax,%ecx,4), %edx
	movl	-12(%ebp), %ecx
	subl	$1, %ecx
	leal	_grid, %eax
	imull	$120, %ecx, %ecx
	addl	%ecx, %eax
	movl	-16(%ebp), %ecx
	movl	%edx, (%eax,%ecx,4)
# %bb.14:                               #   in Loop: Header=BB16_12 Depth=2
	movl	-16(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
	jmp	LBB16_12
LBB16_15:                               #   in Loop: Header=BB16_10 Depth=1
	jmp	LBB16_16
LBB16_16:                               #   in Loop: Header=BB16_10 Depth=1
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -12(%ebp)
	jmp	LBB16_10
LBB16_17:
	movl	$54, (%esp)
	calll	_generateNewLineForeground
	movl	$54, (%esp)
	calll	_generateNewLineBackground
LBB16_18:
	cvtsi2ssl	_refreshRate, %xmm1
	movss	LCPI16_2, %xmm0                 # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	divss	%xmm1, %xmm0
	movss	%xmm0, -20(%ebp)
	movss	-20(%ebp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	movss	_mapX, %xmm1                    # xmm1 = mem[0],zero,zero,zero
	movss	LCPI16_1, %xmm2                 # xmm2 = [-6.0E+1,0.0E+0,0.0E+0,0.0E+0]
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, _mapX
	addl	$24, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_drawWorld;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function drawWorld
LCPI17_0:
	.long	0x41800000                      # float 16
	.text
	.globl	_drawWorld
	.p2align	4, 0x90
_drawWorld:                             # @drawWorld
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$36, %esp
	movl	$0, -4(%ebp)
LBB17_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB17_3 Depth 2
	cmpl	$55, -4(%ebp)
	jge	LBB17_16
# %bb.2:                                #   in Loop: Header=BB17_1 Depth=1
	movl	$0, -8(%ebp)
LBB17_3:                                #   Parent Loop BB17_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpl	$30, -8(%ebp)
	jge	LBB17_14
# %bb.4:                                #   in Loop: Header=BB17_3 Depth=2
	leal	_grid, %eax
	imull	$120, -4(%ebp), %ecx
	addl	%ecx, %eax
	movl	-8(%ebp), %ecx
	cmpl	$19, (%eax,%ecx,4)
	jne	LBB17_6
# %bb.5:                                #   in Loop: Header=BB17_3 Depth=2
	movl	_tileTexture2, %eax
	movl	-4(%ebp), %ecx
	shll	$4, %ecx
	cvtsi2ss	%ecx, %xmm2
	addss	_mapX, %xmm2
	movl	-8(%ebp), %ecx
	shll	$4, %ecx
	cvtsi2ss	%ecx, %xmm1
	movss	LCPI17_0, %xmm0                 # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movl	%eax, (%esp)
	movl	$3, 4(%esp)
	movl	$1, 8(%esp)
	movss	%xmm0, 12(%esp)
	movss	%xmm2, 16(%esp)
	movss	%xmm1, 20(%esp)
	movss	%xmm0, 24(%esp)
	calll	_drawTile
LBB17_6:                                #   in Loop: Header=BB17_3 Depth=2
	leal	_grid, %eax
	imull	$120, -4(%ebp), %ecx
	addl	%ecx, %eax
	movl	-8(%ebp), %ecx
	cmpl	$20, (%eax,%ecx,4)
	jne	LBB17_8
# %bb.7:                                #   in Loop: Header=BB17_3 Depth=2
	movl	_tileTexture2, %eax
	movl	-4(%ebp), %ecx
	shll	$4, %ecx
	cvtsi2ss	%ecx, %xmm2
	addss	_mapX, %xmm2
	movl	-8(%ebp), %ecx
	shll	$4, %ecx
	cvtsi2ss	%ecx, %xmm1
	movss	LCPI17_0, %xmm0                 # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movl	%eax, (%esp)
	movl	$3, 4(%esp)
	movl	$3, 8(%esp)
	movss	%xmm0, 12(%esp)
	movss	%xmm2, 16(%esp)
	movss	%xmm1, 20(%esp)
	movss	%xmm0, 24(%esp)
	calll	_drawTile
LBB17_8:                                #   in Loop: Header=BB17_3 Depth=2
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, -4(%ebp), %ecx
	addl	%ecx, %eax
	movl	-8(%ebp), %ecx
	cmpl	$1, (%eax,%ecx,4)
	jne	LBB17_10
# %bb.9:                                #   in Loop: Header=BB17_3 Depth=2
	movl	_tileTexture2, %eax
	movl	-4(%ebp), %ecx
	shll	$4, %ecx
	cvtsi2ss	%ecx, %xmm2
	addss	_mapX, %xmm2
	movl	-8(%ebp), %ecx
	shll	$4, %ecx
	cvtsi2ss	%ecx, %xmm1
	movss	LCPI17_0, %xmm0                 # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movl	%eax, (%esp)
	movl	$1, 4(%esp)
	movl	$1, 8(%esp)
	movss	%xmm0, 12(%esp)
	movss	%xmm2, 16(%esp)
	movss	%xmm1, 20(%esp)
	movss	%xmm0, 24(%esp)
	calll	_drawTile
LBB17_10:                               #   in Loop: Header=BB17_3 Depth=2
	leal	_grid, %eax
	addl	$6600, %eax                     # imm = 0x19C8
	imull	$120, -4(%ebp), %ecx
	addl	%ecx, %eax
	movl	-8(%ebp), %ecx
	cmpl	$2, (%eax,%ecx,4)
	jne	LBB17_12
# %bb.11:                               #   in Loop: Header=BB17_3 Depth=2
	movl	_tileTexture2, %eax
	movl	-4(%ebp), %ecx
	shll	$4, %ecx
	cvtsi2ss	%ecx, %xmm2
	addss	_mapX, %xmm2
	movl	-8(%ebp), %ecx
	shll	$4, %ecx
	cvtsi2ss	%ecx, %xmm1
	movss	LCPI17_0, %xmm0                 # xmm0 = [1.6E+1,0.0E+0,0.0E+0,0.0E+0]
	movl	%eax, (%esp)
	movl	$5, 4(%esp)
	movl	$3, 8(%esp)
	movss	%xmm0, 12(%esp)
	movss	%xmm2, 16(%esp)
	movss	%xmm1, 20(%esp)
	movss	%xmm0, 24(%esp)
	calll	_drawTile
LBB17_12:                               #   in Loop: Header=BB17_3 Depth=2
	jmp	LBB17_13
LBB17_13:                               #   in Loop: Header=BB17_3 Depth=2
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	LBB17_3
LBB17_14:                               #   in Loop: Header=BB17_1 Depth=1
	jmp	LBB17_15
LBB17_15:                               #   in Loop: Header=BB17_1 Depth=1
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	jmp	LBB17_1
LBB17_16:
	addl	$36, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_indexOf;
	.scl	2;
	.type	32;
	.endef
	.globl	_indexOf                        # -- Begin function indexOf
	.p2align	4, 0x90
_indexOf:                               # @indexOf
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movb	12(%ebp), %al
	movl	8(%ebp), %eax
	movl	$0, -8(%ebp)
LBB18_1:                                # =>This Inner Loop Header: Depth=1
	movl	8(%ebp), %eax
	movl	-8(%ebp), %ecx
	movsbl	(%eax,%ecx), %eax
	cmpl	$0, %eax
	je	LBB18_6
# %bb.2:                                #   in Loop: Header=BB18_1 Depth=1
	movl	8(%ebp), %eax
	movl	-8(%ebp), %ecx
	movsbl	(%eax,%ecx), %eax
	movsbl	12(%ebp), %ecx
	cmpl	%ecx, %eax
	jne	LBB18_4
# %bb.3:
	movl	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	LBB18_7
LBB18_4:                                #   in Loop: Header=BB18_1 Depth=1
	jmp	LBB18_5
LBB18_5:                                #   in Loop: Header=BB18_1 Depth=1
	movl	-8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	jmp	LBB18_1
LBB18_6:
	movl	$-1, -4(%ebp)
LBB18_7:
	movl	-4(%ebp), %eax
	addl	$8, %esp
	popl	%ebp
	retl
                                        # -- End function
	.def	_showText;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	2, 0x0                          # -- Begin function showText
LCPI19_0:
	.long	0x41000000                      # float 8
	.text
	.globl	_showText
	.p2align	4, 0x90
_showText:                              # @showText
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$36, %esp
	movl	24(%ebp), %eax
	movl	20(%ebp), %eax
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	$0, -12(%ebp)
LBB19_1:                                # =>This Inner Loop Header: Depth=1
	movl	8(%ebp), %eax
	movl	-12(%ebp), %ecx
	movsbl	(%eax,%ecx), %eax
	cmpl	$0, %eax
	je	LBB19_6
# %bb.2:                                #   in Loop: Header=BB19_1 Depth=1
	movl	_fontOrder, %edx
	movl	8(%ebp), %eax
	movl	-12(%ebp), %ecx
	movl	%edx, (%esp)
	movsbl	(%eax,%ecx), %eax
	movl	%eax, 4(%esp)
	calll	_indexOf
	movl	%eax, -16(%ebp)
	cmpl	$-1, -16(%ebp)
	je	LBB19_4
# %bb.3:                                #   in Loop: Header=BB19_1 Depth=1
	movl	_tileTexture3, %edx
	movl	-16(%ebp), %ecx
	movl	24(%ebp), %eax
	movl	12(%ebp), %esi
	movl	-12(%ebp), %edi
	imull	20(%ebp), %edi
	addl	%edi, %esi
	cvtsi2ss	%esi, %xmm2
	cvtsi2ssl	16(%ebp), %xmm1
	cvtsi2ssl	20(%ebp), %xmm0
	movss	LCPI19_0, %xmm3                 # xmm3 = [8.0E+0,0.0E+0,0.0E+0,0.0E+0]
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	movss	%xmm3, 12(%esp)
	movss	%xmm2, 16(%esp)
	movss	%xmm1, 20(%esp)
	movss	%xmm0, 24(%esp)
	calll	_drawTile
LBB19_4:                                #   in Loop: Header=BB19_1 Depth=1
	jmp	LBB19_5
LBB19_5:                                #   in Loop: Header=BB19_1 Depth=1
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -12(%ebp)
	jmp	LBB19_1
LBB19_6:
	addl	$36, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
                                        # -- End function
	.def	_showNumber;
	.scl	2;
	.type	32;
	.endef
	.globl	_showNumber                     # -- Begin function showNumber
	.p2align	4, 0x90
_showNumber:                            # @showNumber
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$32, %esp
	movl	24(%ebp), %eax
	movl	20(%ebp), %eax
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	8(%ebp), %eax
	leal	L_.str.2, %ecx
	movl	%edx, (%esp)
	movl	$12, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	calll	_snprintf
	leal	-20(%ebp), %edi
	movl	12(%ebp), %esi
	movl	16(%ebp), %edx
	movl	20(%ebp), %ecx
	movl	24(%ebp), %eax
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_showText
	addl	$32, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
                                        # -- End function
	.def	_main;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	3, 0x0                          # -- Begin function main
LCPI21_0:
	.quad	0x3f1a36e2eb1c432d              # double 1.0E-4
	.text
	.globl	_main
	.p2align	4, 0x90
_main:                                  # @main
# %bb.0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$112, %esp
	movl	16(%ebp), %eax
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	calll	___main
	movl	$0, -12(%ebp)
	leal	L_.str.3, %eax
	movl	%eax, (%esp)
	calll	_printf
	movl	$1, (%esp)
	calll	*__imp____acrt_iob_func
	movl	%eax, (%esp)
	calll	_fflush
	calll	_glfwInit
	cmpl	$0, %eax
	jne	LBB21_2
# %bb.1:
	movl	$-1, -12(%ebp)
	jmp	LBB21_24
LBB21_2:
	calll	_glfwGetPrimaryMonitor
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	calll	_glfwGetVideoMode
	movl	%eax, -24(%ebp)
	movl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, _REAL_WINDOW_WIDTH
	movl	-24(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, _REAL_WINDOW_HEIGHT
	movl	-24(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, _refreshRate
	movl	_refreshRate, %eax
	movl	$135183, (%esp)                 # imm = 0x2100F
	movl	%eax, 4(%esp)
	calll	_glfwWindowHint
	movl	_REAL_WINDOW_WIDTH, %esi
	movl	_REAL_WINDOW_HEIGHT, %edx
	movl	-20(%ebp), %eax
	leal	L_.str.4, %ecx
	xorl	%edi, %edi
	movl	%esi, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	movl	$0, 16(%esp)
	calll	_glfwCreateWindow
	movl	%eax, -16(%ebp)
	cmpl	$0, -16(%ebp)
	jne	LBB21_4
# %bb.3:
	calll	_glfwTerminate
	movl	$-1, -12(%ebp)
	jmp	LBB21_24
LBB21_4:
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	calll	_glfwMakeContextCurrent
	movl	$1, (%esp)
	calll	_glfwSwapInterval
	movl	$3042, (%esp)                   # imm = 0xBE2
	calll	*__imp__glEnable@4
	subl	$4, %esp
	movl	$770, (%esp)                    # imm = 0x302
	movl	$771, 4(%esp)                   # imm = 0x303
	calll	*__imp__glBlendFunc@8
	subl	$8, %esp
	xorl	%eax, %eax
	movl	$0, (%esp)
	calll	*__imp__GetModuleHandleA@4
	subl	$4, %esp
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %esi
	leal	_texWidth1, %edx
	leal	_texHeight1, %ecx
	leal	-32(%ebp), %eax
	movl	%esi, (%esp)
	movl	$12, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_loadBitmapFromResource
	movl	%eax, -36(%ebp)
	cmpl	$0, -36(%ebp)
	jne	LBB21_6
# %bb.5:
	movl	$-1, -12(%ebp)
	jmp	LBB21_24
LBB21_6:
	movb	$1, -37(%ebp)
	movl	-28(%ebp), %esi
	leal	_texWidth2, %edx
	leal	_texHeight2, %ecx
	leal	-44(%ebp), %eax
	movl	%esi, (%esp)
	movl	$13, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_loadBitmapFromResource
	movl	%eax, -48(%ebp)
	cmpl	$0, -48(%ebp)
	jne	LBB21_8
# %bb.7:
	movl	$-1, -12(%ebp)
	jmp	LBB21_24
LBB21_8:
	movb	$1, -49(%ebp)
	movl	-28(%ebp), %esi
	leal	_texWidth3, %edx
	leal	_texHeight3, %ecx
	leal	-56(%ebp), %eax
	movl	%esi, (%esp)
	movl	$14, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_loadBitmapFromResource
	movl	%eax, -60(%ebp)
	cmpl	$0, -60(%ebp)
	jne	LBB21_10
# %bb.9:
	movl	$-1, -12(%ebp)
	jmp	LBB21_24
LBB21_10:
	movb	$1, -61(%ebp)
	movw	L___const.main.transparentColor, %ax
	movw	%ax, -64(%ebp)
	movb	L___const.main.transparentColor+2, %al
	movb	%al, -62(%ebp)
	movl	-32(%ebp), %edi
	movl	_texWidth1, %esi
	movl	_texHeight1, %edx
	movb	-37(%ebp), %cl
	leal	-64(%ebp), %eax
	andb	$1, %cl
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movzbl	%cl, %ecx
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_RGB_RGBA_convert
	movl	%eax, -68(%ebp)
	movl	-44(%ebp), %edi
	movl	_texWidth2, %esi
	movl	_texHeight2, %edx
	movb	-49(%ebp), %cl
	leal	-64(%ebp), %eax
	andb	$1, %cl
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movzbl	%cl, %ecx
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_RGB_RGBA_convert
	movl	%eax, -72(%ebp)
	movl	-56(%ebp), %edi
	movl	_texWidth3, %esi
	movl	_texHeight3, %edx
	movb	-61(%ebp), %cl
	leal	-64(%ebp), %eax
	andb	$1, %cl
	movl	%edi, (%esp)
	movl	%esi, 4(%esp)
	movl	%edx, 8(%esp)
	movzbl	%cl, %ecx
	movl	%ecx, 12(%esp)
	movl	%eax, 16(%esp)
	calll	_RGB_RGBA_convert
	movl	%eax, -76(%ebp)
	movl	$3553, (%esp)                   # imm = 0xDE1
	calll	*__imp__glEnable@4
	subl	$4, %esp
	leal	_tileTexture1, %eax
	movl	$1, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__glGenTextures@8
	subl	$8, %esp
	movl	_tileTexture1, %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	%eax, 4(%esp)
	calll	*__imp__glBindTexture@8
	subl	$8, %esp
	movl	_texWidth1, %edx
	movl	_texHeight1, %ecx
	movl	-68(%ebp), %eax
	xorl	%esi, %esi
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$0, 4(%esp)
	movl	$6408, 8(%esp)                  # imm = 0x1908
	movl	%edx, 12(%esp)
	movl	%ecx, 16(%esp)
	movl	$0, 20(%esp)
	movl	$6408, 24(%esp)                 # imm = 0x1908
	movl	$5121, 28(%esp)                 # imm = 0x1401
	movl	%eax, 32(%esp)
	calll	*__imp__glTexImage2D@36
	subl	$36, %esp
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$10241, 4(%esp)                 # imm = 0x2801
	movl	$9728, 8(%esp)                  # imm = 0x2600
	calll	*__imp__glTexParameteri@12
	subl	$12, %esp
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$10240, 4(%esp)                 # imm = 0x2800
	movl	$9728, 8(%esp)                  # imm = 0x2600
	calll	*__imp__glTexParameteri@12
	subl	$12, %esp
	leal	_tileTexture2, %eax
	movl	$1, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__glGenTextures@8
	subl	$8, %esp
	movl	_tileTexture2, %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	%eax, 4(%esp)
	calll	*__imp__glBindTexture@8
	subl	$8, %esp
	movl	_texWidth2, %edx
	movl	_texHeight2, %ecx
	movl	-72(%ebp), %eax
	xorl	%esi, %esi
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$0, 4(%esp)
	movl	$6408, 8(%esp)                  # imm = 0x1908
	movl	%edx, 12(%esp)
	movl	%ecx, 16(%esp)
	movl	$0, 20(%esp)
	movl	$6408, 24(%esp)                 # imm = 0x1908
	movl	$5121, 28(%esp)                 # imm = 0x1401
	movl	%eax, 32(%esp)
	calll	*__imp__glTexImage2D@36
	subl	$36, %esp
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$10241, 4(%esp)                 # imm = 0x2801
	movl	$9728, 8(%esp)                  # imm = 0x2600
	calll	*__imp__glTexParameteri@12
	subl	$12, %esp
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$10240, 4(%esp)                 # imm = 0x2800
	movl	$9728, 8(%esp)                  # imm = 0x2600
	calll	*__imp__glTexParameteri@12
	subl	$12, %esp
	leal	_tileTexture3, %eax
	movl	$1, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__glGenTextures@8
	subl	$8, %esp
	movl	_tileTexture3, %eax
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	%eax, 4(%esp)
	calll	*__imp__glBindTexture@8
	subl	$8, %esp
	movl	_texWidth3, %edx
	movl	_texHeight3, %ecx
	movl	-76(%ebp), %eax
	xorl	%esi, %esi
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$0, 4(%esp)
	movl	$6408, 8(%esp)                  # imm = 0x1908
	movl	%edx, 12(%esp)
	movl	%ecx, 16(%esp)
	movl	$0, 20(%esp)
	movl	$6408, 24(%esp)                 # imm = 0x1908
	movl	$5121, 28(%esp)                 # imm = 0x1401
	movl	%eax, 32(%esp)
	calll	*__imp__glTexImage2D@36
	subl	$36, %esp
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$10241, 4(%esp)                 # imm = 0x2801
	movl	$9728, 8(%esp)                  # imm = 0x2600
	calll	*__imp__glTexParameteri@12
	subl	$12, %esp
	movl	$3553, (%esp)                   # imm = 0xDE1
	movl	$10240, 4(%esp)                 # imm = 0x2800
	movl	$9728, 8(%esp)                  # imm = 0x2600
	calll	*__imp__glTexParameteri@12
	subl	$12, %esp
	movl	-16(%ebp), %ecx
	leal	_framebufferSizeCallback, %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_glfwSetFramebufferSizeCallback
	movl	-16(%ebp), %ecx
	leal	_keyCallback, %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_glfwSetKeyCallback
	movl	-16(%ebp), %ecx
	leal	_mouseButtonCallback, %eax
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	_glfwSetMouseButtonCallback
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	calll	_setWindowIcon
	movl	-16(%ebp), %edx
	movl	_REAL_WINDOW_WIDTH, %ecx
	movl	_REAL_WINDOW_HEIGHT, %eax
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, 8(%esp)
	calll	_framebufferSizeCallback
	movl	$0, -80(%ebp)
LBB21_11:                               # =>This Inner Loop Header: Depth=1
	cmpl	$55, -80(%ebp)
	jge	LBB21_14
# %bb.12:                               #   in Loop: Header=BB21_11 Depth=1
	movl	-80(%ebp), %eax
	movl	%eax, (%esp)
	calll	_generateNewLineForeground
# %bb.13:                               #   in Loop: Header=BB21_11 Depth=1
	movl	-80(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -80(%ebp)
	jmp	LBB21_11
LBB21_14:
	movl	$0, -84(%ebp)
LBB21_15:                               # =>This Inner Loop Header: Depth=1
	cmpl	$55, -84(%ebp)
	jge	LBB21_18
# %bb.16:                               #   in Loop: Header=BB21_15 Depth=1
	movl	-84(%ebp), %eax
	movl	%eax, (%esp)
	calll	_generateNewLineBackground
# %bb.17:                               #   in Loop: Header=BB21_15 Depth=1
	movl	-84(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -84(%ebp)
	jmp	LBB21_15
LBB21_18:
	jmp	LBB21_19
LBB21_19:                               # =>This Inner Loop Header: Depth=1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	calll	_glfwWindowShouldClose
	cmpl	$0, %eax
	setne	%al
	xorb	$-1, %al
	testb	$1, %al
	jne	LBB21_20
	jmp	LBB21_23
LBB21_20:                               #   in Loop: Header=BB21_19 Depth=1
	movl	$16384, (%esp)                  # imm = 0x4000
	calll	*__imp__glClear@4
	subl	$4, %esp
	testb	$1, _playerIsAlive
	je	LBB21_22
# %bb.21:                               #   in Loop: Header=BB21_19 Depth=1
	movl	_score, %eax
	addl	$1, %eax
	movl	%eax, _score
	calll	_updateWorld
	calll	_updatePlayer
LBB21_22:                               #   in Loop: Header=BB21_19 Depth=1
	calll	_drawWorld
	calll	_drawPlayer
	leal	L_.str.5, %eax
	movl	%eax, (%esp)
	movl	$5, 4(%esp)
	movl	$5, 8(%esp)
	movl	$9, 12(%esp)
	movl	$1, 16(%esp)
	calll	_showText
	movl	_score, %eax
	movl	%eax, (%esp)
	movl	$65, 4(%esp)
	movl	$5, 8(%esp)
	movl	$9, 12(%esp)
	movl	$1, 16(%esp)
	calll	_showNumber
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	calll	_glfwSwapBuffers
	movsd	LCPI21_0, %xmm0                 # xmm0 = [1.0E-4,0.0E+0]
	movsd	%xmm0, (%esp)
	calll	_glfwWaitEventsTimeout
	jmp	LBB21_19
LBB21_23:
	calll	_glfwTerminate
	leal	_tileTexture1, %eax
	movl	$1, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__glDeleteTextures@8
	subl	$8, %esp
	leal	_tileTexture2, %eax
	movl	$1, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__glDeleteTextures@8
	subl	$8, %esp
	leal	_tileTexture3, %eax
	movl	$1, (%esp)
	movl	%eax, 4(%esp)
	calll	*__imp__glDeleteTextures@8
	subl	$8, %esp
	movl	-68(%ebp), %eax
	movl	%eax, (%esp)
	calll	_free
	movl	-72(%ebp), %eax
	movl	%eax, (%esp)
	calll	_free
	movl	-76(%ebp), %eax
	movl	%eax, (%esp)
	calll	_free
	movl	$0, -12(%ebp)
LBB21_24:
	movl	-12(%ebp), %eax
	addl	$112, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	retl
                                        # -- End function
	.bss
	.globl	_gameStarted                    # @gameStarted
_gameStarted:
	.byte	0                               # 0x0

	.globl	_lastUpdateTime                 # @lastUpdateTime
	.p2align	3, 0x0
_lastUpdateTime:
	.quad	0x0000000000000000              # double 0

	.globl	_playerAcceleration             # @playerAcceleration
	.p2align	2, 0x0
_playerAcceleration:
	.long	0x00000000                      # float 0

	.data
	.globl	_playerPosY                     # @playerPosY
	.p2align	2, 0x0
_playerPosY:
	.long	0x43700000                      # float 240

	.globl	_playerPosX                     # @playerPosX
	.p2align	2, 0x0
_playerPosX:
	.long	0x42c80000                      # float 100

	.globl	_playerIsAlive                  # @playerIsAlive
_playerIsAlive:
	.byte	1                               # 0x1

	.globl	_gravity                        # @gravity
	.p2align	2, 0x0
_gravity:
	.long	0xc4750000                      # float -980

	.bss
	.globl	_score                          # @score
	.p2align	2, 0x0
_score:
	.long	0                               # 0x0

	.globl	_lastScore                      # @lastScore
	.p2align	2, 0x0
_lastScore:
	.long	0                               # 0x0

	.globl	_highScore                      # @highScore
	.p2align	2, 0x0
_highScore:
	.long	0                               # 0x0

	.globl	_mapX                           # @mapX
	.p2align	2, 0x0
_mapX:
	.long	0x00000000                      # float 0

	.globl	_grid                           # @grid
	.p2align	2, 0x0
_grid:
	.zero	13200

	.section	.rdata,"dr"
L_.str:                                 # @.str
	.asciz	"grass"

	.globl	_block_grass                    # @block_grass
	.p2align	2, 0x0
_block_grass:
	.long	L_.str
	.long	0                               # 0x0
	.long	1                               # 0x1

	.bss
	.globl	_refreshRate                    # @refreshRate
	.p2align	2, 0x0
_refreshRate:
	.long	0                               # 0x0

	.globl	_tileTexture1                   # @tileTexture1
	.p2align	2, 0x0
_tileTexture1:
	.long	0                               # 0x0

	.globl	_directionSurface               # @directionSurface
	.p2align	2, 0x0
_directionSurface:
	.long	0                               # 0x0

	.globl	_directionRoof                  # @directionRoof
	.p2align	2, 0x0
_directionRoof:
	.long	0                               # 0x0

	.globl	_surfaceBlockY                  # @surfaceBlockY
	.p2align	2, 0x0
_surfaceBlockY:
	.long	0                               # 0x0

	.globl	_roofBlockY                     # @roofBlockY
	.p2align	2, 0x0
_roofBlockY:
	.long	0                               # 0x0

	.globl	_lastSurfaceBlockY              # @lastSurfaceBlockY
	.p2align	2, 0x0
_lastSurfaceBlockY:
	.long	0                               # 0x0

	.globl	_lastRoofBlockY                 # @lastRoofBlockY
	.p2align	2, 0x0
_lastRoofBlockY:
	.long	0                               # 0x0

	.globl	_tileTexture2                   # @tileTexture2
	.p2align	2, 0x0
_tileTexture2:
	.long	0                               # 0x0

	.section	.rdata,"dr"
L_.str.1:                               # @.str.1
	.asciz	"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

	.data
	.globl	_fontOrder                      # @fontOrder
	.p2align	2, 0x0
_fontOrder:
	.long	L_.str.1

	.bss
	.globl	_tileTexture3                   # @tileTexture3
	.p2align	2, 0x0
_tileTexture3:
	.long	0                               # 0x0

	.section	.rdata,"dr"
L_.str.2:                               # @.str.2
	.asciz	"%d"

L_.str.3:                               # @.str.3
	.asciz	"is running"

	.bss
	.globl	_REAL_WINDOW_WIDTH              # @REAL_WINDOW_WIDTH
	.p2align	2, 0x0
_REAL_WINDOW_WIDTH:
	.long	0                               # 0x0

	.globl	_REAL_WINDOW_HEIGHT             # @REAL_WINDOW_HEIGHT
	.p2align	2, 0x0
_REAL_WINDOW_HEIGHT:
	.long	0                               # 0x0

	.section	.rdata,"dr"
L_.str.4:                               # @.str.4
	.asciz	"tunnelBird"

	.bss
	.globl	_texWidth1                      # @texWidth1
	.p2align	2, 0x0
_texWidth1:
	.long	0                               # 0x0

	.globl	_texHeight1                     # @texHeight1
	.p2align	2, 0x0
_texHeight1:
	.long	0                               # 0x0

	.globl	_texWidth2                      # @texWidth2
	.p2align	2, 0x0
_texWidth2:
	.long	0                               # 0x0

	.globl	_texHeight2                     # @texHeight2
	.p2align	2, 0x0
_texHeight2:
	.long	0                               # 0x0

	.globl	_texWidth3                      # @texWidth3
	.p2align	2, 0x0
_texWidth3:
	.long	0                               # 0x0

	.globl	_texHeight3                     # @texHeight3
	.p2align	2, 0x0
_texHeight3:
	.long	0                               # 0x0

	.section	.rdata,"dr"
L___const.main.transparentColor:        # @__const.main.transparentColor
	.ascii	"\377\000\377"

L_.str.5:                               # @.str.5
	.asciz	"SCORE"

	.bss
	.globl	_speedFactor                    # @speedFactor
	.p2align	2, 0x0
_speedFactor:
	.long	0x00000000                      # float 0

	.globl	_deltaTime                      # @deltaTime
	.p2align	3, 0x0
_deltaTime:
	.quad	0x0000000000000000              # double 0

	.globl	_backgroundScreen               # @backgroundScreen
	.p2align	2, 0x0
_backgroundScreen:
	.long	0                               # 0x0

	.globl	_texChannels1                   # @texChannels1
	.p2align	2, 0x0
_texChannels1:
	.long	0                               # 0x0

	.globl	_texChannels2                   # @texChannels2
	.p2align	2, 0x0
_texChannels2:
	.long	0                               # 0x0

	.globl	_texChannels3                   # @texChannels3
	.p2align	2, 0x0
_texChannels3:
	.long	0                               # 0x0

	.addrsig
	.addrsig_sym _loadBitmapFromResource
	.addrsig_sym _setWindowIcon
	.addrsig_sym _glfwGetWin32Window
	.addrsig_sym _RGB_RGBA_convert
	.addrsig_sym _malloc
	.addrsig_sym _mouseButtonCallback
	.addrsig_sym _keyCallback
	.addrsig_sym _glfwSetWindowShouldClose
	.addrsig_sym _framebufferSizeCallback
	.addrsig_sym _proofCollision
	.addrsig_sym _drawTile
	.addrsig_sym _updatePlayer
	.addrsig_sym _drawPlayer
	.addrsig_sym _getBackgroundBlock
	.addrsig_sym _rand
	.addrsig_sym _generateNewLineBackground
	.addrsig_sym _generateNewLineForeground
	.addrsig_sym _updateWorld
	.addrsig_sym _drawWorld
	.addrsig_sym _indexOf
	.addrsig_sym _showText
	.addrsig_sym _showNumber
	.addrsig_sym _snprintf
	.addrsig_sym _printf
	.addrsig_sym _fflush
	.addrsig_sym _glfwInit
	.addrsig_sym _glfwGetPrimaryMonitor
	.addrsig_sym _glfwGetVideoMode
	.addrsig_sym _glfwWindowHint
	.addrsig_sym _glfwCreateWindow
	.addrsig_sym _glfwTerminate
	.addrsig_sym _glfwMakeContextCurrent
	.addrsig_sym _glfwSwapInterval
	.addrsig_sym _glfwSetFramebufferSizeCallback
	.addrsig_sym _glfwSetKeyCallback
	.addrsig_sym _glfwSetMouseButtonCallback
	.addrsig_sym _glfwWindowShouldClose
	.addrsig_sym _glfwSwapBuffers
	.addrsig_sym _glfwWaitEventsTimeout
	.addrsig_sym _free
	.addrsig_sym _playerAcceleration
	.addrsig_sym _playerPosY
	.addrsig_sym _playerPosX
	.addrsig_sym _playerIsAlive
	.addrsig_sym _gravity
	.addrsig_sym _score
	.addrsig_sym _mapX
	.addrsig_sym _grid
	.addrsig_sym _refreshRate
	.addrsig_sym _tileTexture1
	.addrsig_sym _directionSurface
	.addrsig_sym _directionRoof
	.addrsig_sym _surfaceBlockY
	.addrsig_sym _roofBlockY
	.addrsig_sym _lastSurfaceBlockY
	.addrsig_sym _lastRoofBlockY
	.addrsig_sym _tileTexture2
	.addrsig_sym _fontOrder
	.addrsig_sym _tileTexture3
	.addrsig_sym _REAL_WINDOW_WIDTH
	.addrsig_sym _REAL_WINDOW_HEIGHT
	.addrsig_sym _texWidth1
	.addrsig_sym _texHeight1
	.addrsig_sym _texWidth2
	.addrsig_sym _texHeight2
	.addrsig_sym _texWidth3
	.addrsig_sym _texHeight3
