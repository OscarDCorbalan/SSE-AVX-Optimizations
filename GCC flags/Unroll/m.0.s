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
	subl	$40, %esp
	movl	$0, -12(%ebp)
	jmp	L2
L5:
	movl	$0, -16(%ebp)
	jmp	L3
L4:
	movl	-12(%ebp), %eax
	sall	$4, %eax
	addl	8(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	(%eax,%edx,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	incl	-16(%ebp)
L3:
	cmpl	$3, -16(%ebp)
	jle	L4
	movl	$10, (%esp)
	call	_putchar
	incl	-12(%ebp)
L2:
	cmpl	$3, -12(%ebp)
	jle	L5
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
	pushl	%ebx
	subl	$248, %esp
	call	___main
	leal	20(%esp), %ebx
	movb	$0, %al
	movl	$64, %edx
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep stosb
	movl	$400000000, 236(%esp)
	movl	$0, 232(%esp)
	jmp	L7
L10:
	movl	$0, 228(%esp)
	jmp	L8
L9:
	call	_rand
	movl	232(%esp), %edx
	sall	$2, %edx
	addl	228(%esp), %edx
	movl	%eax, 148(%esp,%edx,4)
	call	_rand
	movl	232(%esp), %edx
	sall	$2, %edx
	addl	228(%esp), %edx
	movl	%eax, 84(%esp,%edx,4)
	incl	228(%esp)
L8:
	cmpl	$3, 228(%esp)
	jbe	L9
	incl	232(%esp)
L7:
	cmpl	$3, 232(%esp)
	jbe	L10
	cmpl	$1, 8(%ebp)
	jle	L11
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_atoi
	movl	%eax, 236(%esp)
L11:
	movl	$0, 224(%esp)
	jmp	L12
L19:
	movl	$0, 220(%esp)
	jmp	L13
L18:
	movl	$0, 216(%esp)
	jmp	L14
L17:
	movl	$0, 212(%esp)
	jmp	L15
L16:
	movl	220(%esp), %eax
	sall	$2, %eax
	addl	216(%esp), %eax
	movl	20(%esp,%eax,4), %edx
	movl	220(%esp), %eax
	sall	$2, %eax
	addl	212(%esp), %eax
	movl	148(%esp,%eax,4), %ecx
	movl	212(%esp), %eax
	sall	$2, %eax
	addl	216(%esp), %eax
	movl	84(%esp,%eax,4), %eax
	imull	%ecx, %eax
	addl	%eax, %edx
	movl	220(%esp), %eax
	sall	$2, %eax
	addl	216(%esp), %eax
	movl	%edx, 20(%esp,%eax,4)
	incl	212(%esp)
L15:
	cmpl	$3, 212(%esp)
	jle	L16
	incl	216(%esp)
L14:
	cmpl	$3, 216(%esp)
	jle	L17
	incl	220(%esp)
L13:
	cmpl	$3, 220(%esp)
	jle	L18
	incl	224(%esp)
L12:
	movl	224(%esp), %eax
	cmpl	236(%esp), %eax
	jb	L19
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_print_matriu
	movl	$0, %eax
	addl	$248, %esp
	popl	%ebx
	popl	%edi
	leave
	ret
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_atoi;	.scl	2;	.type	32;	.endef
