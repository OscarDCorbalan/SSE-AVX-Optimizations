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
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %esi
	movl	$4, %edi
L2:
	xorl	%ebx, %ebx
L3:
	movl	(%esi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	incl	%ebx
	cmpl	$4, %ebx
	jne	L3
	movl	$10, (%esp)
	call	_putchar
	addl	$16, %esi
	decl	%edi
	jne	L2
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
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
	subl	$260, %esp
	call	___main
	leal	64(%esp), %eax
	movl	%eax, 28(%esp)
	movl	$64, %ecx
	xorl	%eax, %eax
	movl	28(%esp), %edi
	rep stosb
	movl	$0, 60(%esp)
L8:
	movl	60(%esp), %esi
	sall	$4, %esi
	leal	192(%esp), %edi
	addl	%esi, %edi
	leal	128(%esp), %edx
	leal	(%edx,%esi), %esi
	xorl	%ebx, %ebx
L9:
	call	_rand
	movl	%eax, (%edi)
	call	_rand
	movl	%eax, (%esi)
	incl	%ebx
	addl	$4, %edi
	addl	$4, %esi
	cmpl	$4, %ebx
	jne	L9
	incl	60(%esp)
	cmpl	$4, 60(%esp)
	jne	L8
	cmpl	$1, 8(%ebp)
	jle	L19
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_atoi
	movl	%eax, 44(%esp)
	testl	%eax, %eax
	je	L12
L11:
	movl	$0, 48(%esp)
	.p2align 2,,3
L17:
	movl	$0, 52(%esp)
L18:
	movl	52(%esp), %eax
	sall	$4, %eax
	leal	64(%esp), %edi
	addl	%eax, %edi
	movl	$0, 60(%esp)
	leal	192(%esp), %edx
	addl	%eax, %edx
	movl	%edx, 56(%esp)
L16:
	movl	(%edi), %esi
	movl	56(%esp), %ebx
	movl	60(%esp), %eax
	leal	128(%esp,%eax,4), %ecx
	xorl	%edx, %edx
L13:
	movl	(%ecx), %eax
	imull	(%ebx), %eax
	addl	%eax, %esi
	incl	%edx
	addl	$4, %ebx
	addl	$16, %ecx
	cmpl	$4, %edx
	jne	L13
	movl	%esi, (%edi)
	incl	60(%esp)
	addl	$4, %edi
	cmpl	$4, 60(%esp)
	jne	L16
	incl	52(%esp)
	cmpl	$4, 52(%esp)
	jne	L18
	incl	48(%esp)
	movl	48(%esp), %eax
	cmpl	%eax, 44(%esp)
	ja	L17
L12:
	leal	64(%esp), %edx
	movl	%edx, (%esp)
	call	_print_matriu
	xorl	%eax, %eax
	addl	$260, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
L19:
	movl	$400000000, 44(%esp)
	jmp	L11
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_atoi;	.scl	2;	.type	32;	.endef
