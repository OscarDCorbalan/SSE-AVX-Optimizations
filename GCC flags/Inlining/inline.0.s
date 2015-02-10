	.file	"inline.c"
	.text
.globl _getValue1
	.def	_getValue1;	.scl	2;	.type	32;	.endef
_getValue1:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$100, (%esp)
	call	_random
	subl	$50, %eax
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
	subl	$50, %eax
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
	movl	$0, 24(%esp)
	jmp	L4
L5:
	call	_getValue1
	movl	%eax, 20(%esp)
	call	_getValue2
	movl	%eax, 16(%esp)
	movl	16(%esp), %eax
	movl	20(%esp), %edx
	leal	(%edx,%eax), %eax
	movl	%eax, 28(%esp)
	incl	24(%esp)
L4:
	cmpl	$39999999, 24(%esp)
	jle	L5
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$1, %eax
	leave
	ret
	.def	_random;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
