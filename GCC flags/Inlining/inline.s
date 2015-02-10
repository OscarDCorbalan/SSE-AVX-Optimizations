	.file	"inline.c"
	.text
.globl _constant
	.def	_constant;	.scl	2;	.type	32;	.endef
_constant:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$10, %eax
	leave
	ret
.globl _getValue1
	.def	_getValue1;	.scl	2;	.type	32;	.endef
_getValue1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$100, (%esp)
	call	_random
	subl	$40, %eax
	leave
	ret
.globl _getValue2
	.def	_getValue2;	.scl	2;	.type	32;	.endef
_getValue2:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$100, (%esp)
	call	_random
	subl	$60, %eax
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "i = %d\0"
	.text
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	call	_constant
	movl	%eax, 28(%esp)
	movl	$0, 24(%esp)
	jmp	L5
L6:
	call	_getValue1
	movl	%eax, 20(%esp)
	call	_getValue2
	movl	%eax, 16(%esp)
	movl	16(%esp), %eax
	movl	20(%esp), %edx
	leal	(%edx,%eax), %eax
	movl	%eax, 28(%esp)
	incl	24(%esp)
L5:
	cmpl	$39999999, 24(%esp)
	jle	L6
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$1, %eax
	leave
	ret
	.def	_random;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
