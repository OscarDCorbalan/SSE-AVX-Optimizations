	.file	"matriu4x4.c"
	.section .rdata,"dr"
LC0:
	.ascii "%d \0"
	.text
.globl _print_matriu
	.def	_print_matriu;	.scl	2;	.type	32;	.endef
_print_matriu:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %edi
	movl	$4, %esi
	jmp	L2
L3:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	incl	%ebx
	cmpl	$4, %ebx
	jne	L3
	movl	$10, (%esp)
	call	_putchar
	addl	$16, %edi
	decl	%esi
	je	L1
L2:
	xorl	%ebx, %ebx
	jmp	L3
L1:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
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
	leal	64(%esp), %edi
	movl	$16, %ecx
	xorl	%eax, %eax
	rep stosl
	xorl	%ebx, %ebx
	leal	192(%esp), %edx
	jmp	L7
L8:
	movl	%edx, 40(%esp)
	movl	%ecx, 36(%esp)
	call	_rand
	movl	%eax, (%edi)
	call	_rand
	movl	%eax, (%esi)
	movl	36(%esp), %ecx
	incl	%ecx
	addl	$4, %edi
	addl	$4, %esi
	cmpl	$4, %ecx
	movl	40(%esp), %edx
	jne	L8
	incl	%ebx
	cmpl	$4, %ebx
	je	L9
L7:
	movl	%ebx, %esi
	sall	$4, %esi
	leal	(%edx,%esi), %edi
	leal	128(%esp), %eax
	leal	(%eax,%esi), %esi
	xorl	%ecx, %ecx
	jmp	L8
L9:
	movl	$400000000, %eax
	cmpl	$1, 8(%ebp)
	jle	L10
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_atoi
L10:
	movl	$0, 56(%esp)
	jmp	L11
L12:
	movl	48(%esp), %eax
	movl	(%eax), %edi
	imull	(%ebx), %edi
	addl	%edi, %esi
	incl	52(%esp)
	addl	$4, %ebx
	addl	$16, %eax
	movl	%eax, 48(%esp)
	cmpl	$4, 52(%esp)
	jne	L12
	movl	28(%esp), %eax
	movl	%esi, (%ecx)
	incl	%edx
	addl	$4, %ecx
	cmpl	$4, %edx
	je	L13
L16:
	movl	(%ecx), %esi
	movl	44(%esp), %ebx
	leal	128(%esp,%edx,4), %edi
	movl	%edi, 48(%esp)
	movl	$0, 52(%esp)
	movl	%eax, 28(%esp)
	jmp	L12
L13:
	incl	60(%esp)
	cmpl	$4, 60(%esp)
	jne	L14
	jmp	L23
L17:
	movl	$0, 60(%esp)
L14:
	movl	60(%esp), %ebx
	sall	$4, %ebx
	leal	64(%esp), %ecx
	addl	%ebx, %ecx
	xorl	%edx, %edx
	leal	192(%esp), %esi
	addl	%ebx, %esi
	movl	%esi, 44(%esp)
	jmp	L16
L23:
	incl	56(%esp)
L11:
	cmpl	%eax, 56(%esp)
	jne	L17
	leal	64(%esp), %eax
	movl	%eax, (%esp)
	call	_print_matriu
	xorl	%eax, %eax
	addl	$260, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_atoi;	.scl	2;	.type	32;	.endef
