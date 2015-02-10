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
	subl	$44, %esp
	movl	8(%ebp), %edi
	movl	$0, -28(%ebp)
	jmp	L2
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
	incl	-28(%ebp)
	addl	$16, %edi
	cmpl	$4, -28(%ebp)
	je	L1
L2:
	movl	%edi, %esi
	movl	$0, %ebx
	jmp	L3
L1:
	addl	$44, %esp
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
	subl	$244, %esp
	call	___main
	leal	48(%esp), %edi
	movl	$64, %ecx
	movb	$0, %al
	rep stosb
	movl	$0, 44(%esp)
	jmp	L7
L8:
	call	_rand
	movl	%eax, (%ebx)
	call	_rand
	movl	%eax, (%esi)
	incl	%edi
	addl	$4, %ebx
	addl	$4, %esi
	cmpl	$4, %edi
	jne	L8
	incl	44(%esp)
	cmpl	$4, 44(%esp)
	je	L9
L7:
	movl	44(%esp), %esi
	sall	$4, %esi
	leal	176(%esp), %ebx
	addl	%esi, %ebx
	leal	112(%esp), %eax
	leal	(%eax,%esi), %esi
	movl	$0, %edi
	jmp	L8
L9:
	cmpl	$1, 8(%ebp)
	jg	L10
	movl	$400000000, 24(%esp)
L12:
	movl	$0, 28(%esp)
	jmp	L11
L10:
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_atoi
	movl	%eax, 24(%esp)
	testl	%eax, %eax
	jne	L12
	jmp	L13
L14:
	movl	(%edx), %esi
	imull	(%ecx), %esi
	addl	%esi, %ebx
	addl	$4, %ecx
	addl	$16, %edx
	decl	%eax
	jne	L14
	movl	40(%esp), %edx
	movl	%ebx, (%edx)
	incl	%edi
	addl	$4, 44(%esp)
	cmpl	$4, %edi
	je	L15
L17:
	movl	44(%esp), %eax
	movl	%eax, 40(%esp)
	movl	(%eax), %ebx
	movl	32(%esp), %ecx
	leal	112(%esp,%edi,4), %edx
	movl	$4, %eax
	jmp	L14
L15:
	incl	36(%esp)
	cmpl	$4, 36(%esp)
	je	L16
L18:
	movl	36(%esp), %eax
	sall	$4, %eax
	leal	48(%esp), %edx
	addl	%eax, %edx
	movl	%edx, 44(%esp)
	movl	$0, %edi
	movl	36(%esp), %eax
	sall	$4, %eax
	leal	176(%esp), %edx
	addl	%eax, %edx
	movl	%edx, 32(%esp)
	jmp	L17
L16:
	incl	28(%esp)
	movl	24(%esp), %eax
	cmpl	%eax, 28(%esp)
	jae	L13
L11:
	movl	$0, 36(%esp)
	jmp	L18
L13:
	leal	48(%esp), %eax
	movl	%eax, (%esp)
	call	_print_matriu
	movl	$0, %eax
	addl	$244, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_atoi;	.scl	2;	.type	32;	.endef
