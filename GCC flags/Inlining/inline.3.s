	.file	"inline.c"
	.text
	.p2align 2,,3
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
	.p2align 2,,3
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
	.p2align 2,,3
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	pushl	%esi
	pushl	%ebx
	subl	$24, %esp
	call	___main
	movl	$40000000, %ebx
	.p2align 2,,3
L4:
	movl	$100, (%esp)
	call	_random
	movl	%eax, %esi
	movl	$100, (%esp)
	call	_random
	leal	-100(%esi,%eax), %eax
	decl	%ebx
	jne	L4
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$1, %eax
	addl	$24, %esp
	popl	%ebx
	popl	%esi
	leave
	ret
	.def	_random;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
