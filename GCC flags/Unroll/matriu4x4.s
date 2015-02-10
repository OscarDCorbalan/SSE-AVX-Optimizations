	.file	"matriu4x4.c"
	.section .rdata,"dr"
LC0:
	.ascii "%d \0"
	.text
	.p2align 2,,3
.globl _print_matriu
	.def	_print_matriu;	.scl	2;	.type	32;	.endef
_print_matriu:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	8(%ebp), %ebx
	movl	(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	4(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	8(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	12(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	leal	16(%ebx), %esi
	movl	16(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	4(%esi), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	8(%esi), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	12(%esi), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	leal	32(%ebx), %esi
	movl	32(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	4(%esi), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	8(%esi), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	12(%esi), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	leal	48(%ebx), %esi
	movl	48(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	4(%esi), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	8(%esi), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	12(%esi), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$10, 8(%ebp)
	addl	$16, %esp
	popl	%ebx
	popl	%esi
	leave
	jmp	_putchar
	.def	___main;	.scl	2;	.type	32;	.endef
	.p2align 2,,3
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$500, %esp
	call	___main
	leal	304(%esp), %edi
	movl	$64, %ecx
	xorl	%eax, %eax
	rep stosb
	call	_rand
	movl	%eax, 432(%esp)
	call	_rand
	movl	%eax, 368(%esp)
	call	_rand
	movl	%eax, 436(%esp)
	call	_rand
	movl	%eax, 372(%esp)
	call	_rand
	movl	%eax, 440(%esp)
	call	_rand
	movl	%eax, 376(%esp)
	call	_rand
	movl	%eax, 444(%esp)
	call	_rand
	movl	%eax, 380(%esp)
	call	_rand
	movl	%eax, 448(%esp)
	call	_rand
	movl	%eax, 384(%esp)
	call	_rand
	movl	%eax, 452(%esp)
	call	_rand
	movl	%eax, 388(%esp)
	call	_rand
	movl	%eax, 456(%esp)
	call	_rand
	movl	%eax, 392(%esp)
	call	_rand
	movl	%eax, 460(%esp)
	call	_rand
	movl	%eax, 396(%esp)
	call	_rand
	movl	%eax, 464(%esp)
	call	_rand
	movl	%eax, 400(%esp)
	call	_rand
	movl	%eax, 468(%esp)
	call	_rand
	movl	%eax, 404(%esp)
	call	_rand
	movl	%eax, 472(%esp)
	call	_rand
	movl	%eax, 408(%esp)
	call	_rand
	movl	%eax, 476(%esp)
	call	_rand
	movl	%eax, 412(%esp)
	call	_rand
	movl	%eax, 480(%esp)
	call	_rand
	movl	%eax, 416(%esp)
	call	_rand
	movl	%eax, 484(%esp)
	call	_rand
	movl	%eax, 420(%esp)
	call	_rand
	movl	%eax, 488(%esp)
	call	_rand
	movl	%eax, 424(%esp)
	call	_rand
	movl	%eax, 492(%esp)
	call	_rand
	movl	%eax, 428(%esp)
	cmpl	$1, 8(%ebp)
	jg	L3
	movl	$400000000, 236(%esp)
L5:
	movl	436(%esp), %ecx
	movl	384(%esp), %edx
	imull	%ecx, %edx
	movl	432(%esp), %ebx
	movl	368(%esp), %edi
	movl	%edi, %eax
	imull	%ebx, %eax
	addl	%edx, %eax
	movl	%eax, 180(%esp)
	movl	440(%esp), %edx
	movl	400(%esp), %eax
	imull	%edx, %eax
	movl	%eax, 232(%esp)
	movl	444(%esp), %eax
	movl	416(%esp), %esi
	imull	%eax, %esi
	movl	%esi, 228(%esp)
	movl	372(%esp), %esi
	imull	%ebx, %esi
	movl	%esi, 296(%esp)
	movl	388(%esp), %esi
	imull	%ecx, %esi
	addl	296(%esp), %esi
	movl	%esi, 132(%esp)
	movl	404(%esp), %esi
	imull	%edx, %esi
	movl	%esi, 224(%esp)
	movl	420(%esp), %esi
	imull	%eax, %esi
	movl	%esi, 216(%esp)
	movl	376(%esp), %esi
	imull	%ebx, %esi
	movl	%esi, 292(%esp)
	movl	392(%esp), %esi
	imull	%ecx, %esi
	addl	292(%esp), %esi
	movl	%esi, 128(%esp)
	movl	408(%esp), %esi
	imull	%edx, %esi
	movl	%esi, 212(%esp)
	movl	424(%esp), %esi
	imull	%eax, %esi
	movl	%esi, 200(%esp)
	imull	380(%esp), %ebx
	imull	396(%esp), %ecx
	addl	%ebx, %ecx
	movl	%ecx, 124(%esp)
	imull	412(%esp), %edx
	movl	%edx, 140(%esp)
	imull	428(%esp), %eax
	movl	%eax, 136(%esp)
	movl	448(%esp), %ecx
	movl	%ecx, %ebx
	imull	%edi, %ebx
	movl	452(%esp), %edx
	movl	384(%esp), %eax
	imull	%edx, %eax
	addl	%ebx, %eax
	movl	%eax, 120(%esp)
	movl	456(%esp), %eax
	movl	400(%esp), %ebx
	imull	%eax, %ebx
	movl	%ebx, 116(%esp)
	movl	460(%esp), %esi
	movl	416(%esp), %ebx
	imull	%esi, %ebx
	movl	%ebx, 112(%esp)
	movl	372(%esp), %ebx
	imull	%ecx, %ebx
	movl	%ebx, 252(%esp)
	movl	388(%esp), %ebx
	imull	%edx, %ebx
	addl	252(%esp), %ebx
	movl	%ebx, 172(%esp)
	movl	404(%esp), %ebx
	imull	%eax, %ebx
	movl	%ebx, 108(%esp)
	movl	420(%esp), %ebx
	imull	%esi, %ebx
	movl	%ebx, 104(%esp)
	movl	376(%esp), %ebx
	imull	%ecx, %ebx
	movl	%ebx, 252(%esp)
	movl	392(%esp), %ebx
	imull	%edx, %ebx
	addl	252(%esp), %ebx
	movl	%ebx, 168(%esp)
	movl	408(%esp), %ebx
	imull	%eax, %ebx
	movl	%ebx, 100(%esp)
	movl	424(%esp), %ebx
	imull	%esi, %ebx
	movl	%ebx, 96(%esp)
	imull	380(%esp), %ecx
	imull	396(%esp), %edx
	addl	%ecx, %edx
	movl	%edx, 164(%esp)
	imull	412(%esp), %eax
	movl	%eax, 92(%esp)
	imull	428(%esp), %esi
	movl	%esi, 88(%esp)
	movl	464(%esp), %edx
	movl	%edx, %ebx
	imull	%edi, %ebx
	movl	468(%esp), %ecx
	movl	384(%esp), %eax
	imull	%ecx, %eax
	addl	%ebx, %eax
	movl	%eax, 160(%esp)
	movl	472(%esp), %ebx
	movl	400(%esp), %esi
	imull	%ebx, %esi
	movl	%esi, 84(%esp)
	movl	476(%esp), %esi
	movl	416(%esp), %eax
	imull	%esi, %eax
	movl	%eax, 80(%esp)
	movl	372(%esp), %eax
	imull	%edx, %eax
	movl	%eax, 252(%esp)
	movl	388(%esp), %eax
	imull	%ecx, %eax
	addl	252(%esp), %eax
	movl	%eax, 156(%esp)
	movl	404(%esp), %eax
	imull	%ebx, %eax
	movl	%eax, 76(%esp)
	movl	420(%esp), %eax
	imull	%esi, %eax
	movl	%eax, 72(%esp)
	movl	376(%esp), %eax
	imull	%edx, %eax
	movl	%eax, 252(%esp)
	movl	392(%esp), %eax
	imull	%ecx, %eax
	addl	252(%esp), %eax
	movl	%eax, 152(%esp)
	movl	408(%esp), %eax
	imull	%ebx, %eax
	movl	%eax, 68(%esp)
	movl	424(%esp), %eax
	imull	%esi, %eax
	movl	%eax, 64(%esp)
	imull	380(%esp), %edx
	movl	396(%esp), %eax
	imull	%ecx, %eax
	addl	%edx, %eax
	movl	%eax, 148(%esp)
	imull	412(%esp), %ebx
	movl	%ebx, 60(%esp)
	imull	428(%esp), %esi
	movl	%esi, 56(%esp)
	movl	480(%esp), %edx
	imull	%edx, %edi
	movl	484(%esp), %ecx
	movl	384(%esp), %eax
	imull	%ecx, %eax
	addl	%edi, %eax
	movl	%eax, 144(%esp)
	movl	488(%esp), %ebx
	movl	400(%esp), %esi
	imull	%ebx, %esi
	movl	%esi, 240(%esp)
	movl	492(%esp), %esi
	movl	416(%esp), %edi
	imull	%esi, %edi
	movl	%edi, 220(%esp)
	movl	372(%esp), %edi
	imull	%edx, %edi
	movl	388(%esp), %eax
	imull	%ecx, %eax
	addl	%edi, %eax
	movl	%eax, 252(%esp)
	movl	404(%esp), %eax
	imull	%ebx, %eax
	movl	%eax, 208(%esp)
	movl	420(%esp), %edi
	imull	%esi, %edi
	movl	%edi, 204(%esp)
	movl	376(%esp), %edi
	imull	%edx, %edi
	movl	392(%esp), %eax
	imull	%ecx, %eax
	leal	(%eax,%edi), %edi
	movl	%edi, 176(%esp)
	movl	408(%esp), %eax
	imull	%ebx, %eax
	movl	%eax, 196(%esp)
	movl	424(%esp), %edi
	imull	%esi, %edi
	movl	%edi, 192(%esp)
	imull	380(%esp), %edx
	movl	396(%esp), %eax
	imull	%ecx, %eax
	addl	%edx, %eax
	movl	%eax, 248(%esp)
	imull	412(%esp), %ebx
	movl	%ebx, 188(%esp)
	imull	428(%esp), %esi
	movl	%esi, 184(%esp)
	movl	$0, 264(%esp)
	movl	$0, 272(%esp)
	movl	$0, 276(%esp)
	movl	$0, 260(%esp)
	movl	$0, 300(%esp)
	movl	$0, 288(%esp)
	movl	$0, 284(%esp)
	movl	$0, 280(%esp)
	movl	$0, 296(%esp)
	movl	$0, 268(%esp)
	movl	$0, 292(%esp)
	movl	$0, 256(%esp)
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	movl	$0, 28(%esp)
	movl	228(%esp), %edi
	movl	232(%esp), %eax
	leal	(%edi,%eax), %eax
	movl	%eax, 44(%esp)
	movl	216(%esp), %eax
	movl	224(%esp), %edi
	leal	(%eax,%edi), %edi
	movl	%edi, 52(%esp)
	movl	200(%esp), %edi
	movl	212(%esp), %eax
	leal	(%edi,%eax), %eax
	movl	%eax, 48(%esp)
	movl	136(%esp), %eax
	movl	140(%esp), %edi
	leal	(%eax,%edi), %edi
	movl	%edi, 140(%esp)
	movl	112(%esp), %edi
	movl	116(%esp), %eax
	leal	(%edi,%eax), %eax
	movl	%eax, 136(%esp)
	movl	104(%esp), %eax
	movl	108(%esp), %edi
	leal	(%eax,%edi), %edi
	movl	%edi, 224(%esp)
	movl	96(%esp), %edi
	movl	100(%esp), %eax
	leal	(%edi,%eax), %eax
	movl	%eax, 212(%esp)
	movl	88(%esp), %eax
	movl	92(%esp), %edi
	leal	(%eax,%edi), %edi
	movl	%edi, 244(%esp)
	movl	80(%esp), %edi
	movl	84(%esp), %eax
	leal	(%edi,%eax), %eax
	movl	%eax, 232(%esp)
	movl	72(%esp), %eax
	movl	76(%esp), %edi
	leal	(%eax,%edi), %edi
	movl	%edi, 228(%esp)
	movl	64(%esp), %edi
	movl	68(%esp), %eax
	leal	(%edi,%eax), %eax
	movl	%eax, 216(%esp)
	movl	56(%esp), %eax
	movl	60(%esp), %edi
	leal	(%eax,%edi), %edi
	movl	%edi, 200(%esp)
	movl	240(%esp), %edi
	movl	220(%esp), %eax
	leal	(%edi,%eax), %eax
	movl	%eax, 220(%esp)
	movl	204(%esp), %eax
	movl	208(%esp), %edi
	leal	(%eax,%edi), %edi
	movl	%edi, 208(%esp)
	movl	192(%esp), %edi
	movl	196(%esp), %eax
	leal	(%edi,%eax), %eax
	movl	%eax, 240(%esp)
	movl	184(%esp), %eax
	movl	188(%esp), %edi
	leal	(%eax,%edi), %edi
	movl	%edi, 204(%esp)
	movl	44(%esp), %eax
	addl	180(%esp), %eax
	movl	%eax, 196(%esp)
	movl	52(%esp), %edi
	addl	132(%esp), %edi
	movl	%edi, 192(%esp)
	movl	48(%esp), %eax
	addl	128(%esp), %eax
	movl	%eax, 188(%esp)
	movl	140(%esp), %edi
	addl	124(%esp), %edi
	movl	%edi, 184(%esp)
	movl	136(%esp), %eax
	addl	120(%esp), %eax
	movl	%eax, 180(%esp)
	xorl	%eax, %eax
	.p2align 2,,3
L4:
	addl	196(%esp), %esi
	addl	192(%esp), %ebx
	addl	188(%esp), %ecx
	addl	184(%esp), %edx
	movl	180(%esp), %edi
	addl	%edi, 256(%esp)
	movl	224(%esp), %edi
	addl	172(%esp), %edi
	addl	%edi, 292(%esp)
	movl	212(%esp), %edi
	addl	168(%esp), %edi
	addl	%edi, 268(%esp)
	movl	244(%esp), %edi
	addl	164(%esp), %edi
	addl	%edi, 296(%esp)
	movl	232(%esp), %edi
	addl	160(%esp), %edi
	addl	%edi, 280(%esp)
	movl	228(%esp), %edi
	addl	156(%esp), %edi
	addl	%edi, 284(%esp)
	movl	216(%esp), %edi
	addl	152(%esp), %edi
	addl	%edi, 288(%esp)
	movl	200(%esp), %edi
	addl	148(%esp), %edi
	addl	%edi, 300(%esp)
	movl	220(%esp), %edi
	addl	144(%esp), %edi
	addl	%edi, 260(%esp)
	movl	208(%esp), %edi
	addl	252(%esp), %edi
	addl	%edi, 276(%esp)
	movl	240(%esp), %edi
	addl	176(%esp), %edi
	addl	%edi, 272(%esp)
	movl	204(%esp), %edi
	addl	248(%esp), %edi
	addl	%edi, 264(%esp)
	incl	%eax
	cmpl	%eax, 236(%esp)
	ja	L4
	movl	%esi, 304(%esp)
	movl	%ebx, 308(%esp)
	movl	%ecx, 312(%esp)
	movl	%edx, 316(%esp)
	movl	256(%esp), %eax
	movl	%eax, 320(%esp)
	movl	292(%esp), %edx
	movl	%edx, 324(%esp)
	movl	268(%esp), %ecx
	movl	%ecx, 328(%esp)
	movl	296(%esp), %ebx
	movl	%ebx, 332(%esp)
	movl	280(%esp), %esi
	movl	%esi, 336(%esp)
	movl	284(%esp), %edi
	movl	%edi, 340(%esp)
	movl	288(%esp), %eax
	movl	%eax, 344(%esp)
	movl	300(%esp), %edx
	movl	%edx, 348(%esp)
	movl	260(%esp), %ecx
	movl	%ecx, 352(%esp)
	movl	276(%esp), %ebx
	movl	%ebx, 356(%esp)
	movl	272(%esp), %esi
	movl	%esi, 360(%esp)
	movl	264(%esp), %edi
	movl	%edi, 364(%esp)
L6:
	movl	304(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	308(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	312(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	316(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	movl	320(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	324(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	328(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	332(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	movl	336(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	340(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	344(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	348(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	movl	352(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	356(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	360(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	364(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$10, (%esp)
	call	_putchar
	xorl	%eax, %eax
	addl	$500, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
L3:
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_atoi
	movl	%eax, 236(%esp)
	testl	%eax, %eax
	jne	L5
	jmp	L6
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_atoi;	.scl	2;	.type	32;	.endef
