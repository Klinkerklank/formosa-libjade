	.att_syntax
	.text
	.p2align	5
	.global	slh_dsa_shake128f_verify
	.global	slh_dsa_shake128f_sign
	.global	slh_dsa_shake128f_keygen
	.type	slh_dsa_shake128f_verify, %function
slh_dsa_shake128f_verify:
	movq	%rsp, %rax
	leaq	-56(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, (%rsp)
	movq	%rbp, 8(%rsp)
	movq	%r12, 16(%rsp)
	movq	%r13, 24(%rsp)
	movq	%r14, 32(%rsp)
	movq	%r15, 40(%rsp)
	movq	%rax, 48(%rsp)
	lfence
	movq	$0, %rax
	movq	(%rsi), %rax
	movq	8(%rsi), %rsi
	movq	%rcx, %r9
	lfence
	movq	$0, %rcx
	cmpq	$255, %rsi
	jbe 	.Lslh_dsa_shake128f_verify$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake128f_verify$2
.Lslh_dsa_shake128f_verify$1:
	movq	%rsi, %rcx
	movq	%r9, %rsi
	leaq	-152(%rsp), %rsp
	call	.Lslh_verify_internal_$1
.Lslh_dsa_shake128f_verify$3:
	leaq	152(%rsp), %rsp
.Lslh_dsa_shake128f_verify$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake128f_sign, %function
slh_dsa_shake128f_sign:
	movq	%rsp, %rax
	leaq	-56(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, (%rsp)
	movq	%rbp, 8(%rsp)
	movq	%r12, 16(%rsp)
	movq	%r13, 24(%rsp)
	movq	%r14, 32(%rsp)
	movq	%r15, 40(%rsp)
	movq	%rax, 48(%rsp)
	lfence
	movq	$0, %rax
	movq	(%rdx), %rax
	movq	8(%rdx), %rdx
	movq	%rcx, %r10
	lfence
	movq	$0, %rcx
	cmpq	$255, %rdx
	jbe 	.Lslh_dsa_shake128f_sign$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake128f_sign$2
.Lslh_dsa_shake128f_sign$1:
	movq	%rdx, %rcx
	movq	%r10, %rdx
	leaq	-184(%rsp), %rsp
	call	.Lslh_sign_internal_$1
.Lslh_dsa_shake128f_sign$3:
	leaq	184(%rsp), %rsp
.Lslh_dsa_shake128f_sign$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake128f_keygen, %function
slh_dsa_shake128f_keygen:
	movq	%rsp, %rax
	leaq	-16(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, (%rsp)
	movq	%rax, 8(%rsp)
	movq	%rdx, %rax
	lfence
	movq	$0, %rcx
	leaq	-56(%rsp), %rsp
	call	.Lslh_keygen_internal_$1
.Lslh_dsa_shake128f_keygen$1:
	leaq	56(%rsp), %rsp
	movq	(%rsp), %rbx
	movq	8(%rsp), %rsp
	ret
.Lslh_verify_internal_$1:
	leaq	72(%rsp), %r9
	movq	$0, (%r9)
	movq	$0, 8(%r9)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movq	%rdi, %r9
	leaq	16(%rdi), %r10
	movq	%r8, %r11
	movq	%r9, 48(%rsp)
	movq	%r10, 56(%rsp)
	movq	%r8, 64(%rsp)
	leaq	120(%rsp), %rdi
	movq	%r11, %r8
	movq	%rax, %r11
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_verify_internal_$4:
	leaq	280(%rsp), %rsp
// declassify_mem 34 [RSP + 120]
	movq	48(%rsp), %r8
	movq	56(%rsp), %rax
	movq	64(%rsp), %rdi
	lfence
	movq	$0, %rcx
	leaq	120(%rsp), %rcx
	leaq	145(%rsp), %rdx
	leaq	153(%rsp), %rsi
	movl	$0, 108(%rsp)
	movl	$0, 112(%rsp)
	movl	$0, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	(%rdx), %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	1(%rdx), %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	2(%rdx), %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	3(%rdx), %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	4(%rdx), %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	5(%rdx), %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	6(%rdx), %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	7(%rdx), %r9d
	orl 	%r9d, 116(%rsp)
	movl	$0, 108(%rsp)
	andl	$2147483647, 112(%rsp)
	movl	$0, %edx
	shll	$8, %edx
	movzbl	(%rsi), %r9d
	orl 	%r9d, %edx
	andl	$7, %edx
	leaq	72(%rsp), %r9
	movl	108(%rsp), %esi
	movl	%esi, 4(%r9)
	movl	112(%rsp), %esi
	movl	%esi, 8(%r9)
	movl	116(%rsp), %esi
	movl	%esi, 12(%r9)
	leaq	72(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$3, 16(%r9)
	leaq	72(%rsp), %r9
	movl	%edx, 20(%r9)
	leaq	16(%rdi), %r10
	movq	%r8, 64(%rsp)
	movq	%rax, 56(%rsp)
	movq	%rdi, 48(%rsp)
	movl	%edx, 104(%rsp)
	leaq	32(%rsp), %rax
	leaq	72(%rsp), %r9
	movq	%rax, %rdx
	movq	%rcx, %rax
	leaq	-888(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	888(%rsp), %rsp
	movq	64(%rsp), %r8
	movq	56(%rsp), %r10
	movq	48(%rsp), %rdi
	movl	104(%rsp), %edx
	lfence
	movq	$0, %rax
	leaq	32(%rsp), %rax
	leaq	3712(%rdi), %rcx
	leaq	108(%rsp), %rsi
	leaq	-120(%rsp), %rsp
	call	.Lht_verify$1
.Lslh_verify_internal_$2:
	leaq	120(%rsp), %rsp
	ret
.Lslh_sign_internal_$1:
	leaq	96(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movq	%rax, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%r8, 72(%rsp)
	leaq	16(%rsi), %r10
	movq	%rdi, %r11
	movq	%rdi, 80(%rsp)
	movq	%rsi, 88(%rsp)
	leaq	-280(%rsp), %rsp
	call	.LPRF_msg$1
.Lslh_sign_internal_$6:
	leaq	280(%rsp), %rsp
	movq	%rax, %r8
	movq	80(%rsp), %rdi
	movq	88(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	48(%rsp), %r11
	movq	56(%rsp), %rcx
	movq	64(%rsp), %rdx
	movq	72(%rsp), %rsi
	lfence
	movq	$0, %r9
	leaq	32(%rax), %r9
	leaq	48(%rax), %r10
// declassify_mem 16 [R9]
	movq	%r9, 72(%rsp)
	movq	%rdi, 64(%rsp)
	movq	%rax, 56(%rsp)
	leaq	144(%rsp), %rdi
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_sign_internal_$5:
	leaq	280(%rsp), %rsp
// declassify_mem 34 [RSP + 144]
	movq	72(%rsp), %r8
	movq	64(%rsp), %rdi
	movq	56(%rsp), %rsi
	lfence
	movq	$0, %rax
	leaq	144(%rsp), %rcx
	leaq	169(%rsp), %rdx
	leaq	177(%rsp), %rax
	movl	$0, 132(%rsp)
	movl	$0, 136(%rsp)
	movl	$0, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	(%rdx), %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	1(%rdx), %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	2(%rdx), %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	3(%rdx), %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	4(%rdx), %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	5(%rdx), %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	6(%rdx), %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	7(%rdx), %r9d
	orl 	%r9d, 140(%rsp)
	movl	$0, 132(%rsp)
	andl	$2147483647, 136(%rsp)
	movl	$0, %edx
	shll	$8, %edx
	movzbl	(%rax), %r9d
	orl 	%r9d, %edx
	andl	$7, %edx
	leaq	96(%rsp), %r9
	movl	132(%rsp), %eax
	movl	%eax, 4(%r9)
	movl	136(%rsp), %eax
	movl	%eax, 8(%r9)
	movl	140(%rsp), %eax
	movl	%eax, 12(%r9)
	leaq	96(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$3, 16(%r9)
	leaq	96(%rsp), %r9
	movl	%edx, 20(%r9)
	leaq	16(%rdi), %r10
	movq	%rsi, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%rdi, 72(%rsp)
	movq	%rcx, 48(%rsp)
	movl	%edx, 128(%rsp)
	leaq	96(%rsp), %r9
	movq	%rcx, %rax
	movq	%rsi, %rbx
	leaq	-216(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	216(%rsp), %rsp
// declassify_mem 3696 [R10]
	movq	56(%rsp), %rdx
	movq	64(%rsp), %r8
	movq	72(%rsp), %rdi
	movq	48(%rsp), %rax
	movl	128(%rsp), %ecx
	lfence
	movq	$0, %rsi
	movq	%rdx, 48(%rsp)
	movq	%r8, 72(%rsp)
	movq	%rdi, 64(%rsp)
	movl	%ecx, 128(%rsp)
	leaq	32(%rsp), %rcx
	leaq	96(%rsp), %r9
	movq	%rcx, %rdx
	leaq	-888(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	888(%rsp), %rsp
	movq	48(%rsp), %rdx
	movq	72(%rsp), %r8
	movq	64(%rsp), %rdi
	movl	128(%rsp), %esi
	lfence
	movq	$0, %rax
	leaq	3712(%rdi), %rcx
	movq	%rdi, 64(%rsp)
	leaq	32(%rsp), %rax
	leaq	132(%rsp), %rdi
	leaq	-120(%rsp), %rsp
	call	.Lht_sign$1
.Lslh_sign_internal_$2:
	leaq	120(%rsp), %rsp
	movq	64(%rsp), %rdi
	lfence
	movq	$0, %rax
// declassify_mem 17088 [RDI]
	movq	$0, %rax
	ret
.Lslh_keygen_internal_$1:
	movq	%rsi, %r11
	movq	%rax, %r10
	movq	(%r10), %rdx
	movq	%rdx, (%r11)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%r11)
	leaq	16(%rsi), %r11
	leaq	16(%rax), %r10
	movq	(%r10), %rdx
	movq	%rdx, (%r11)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%r11)
	leaq	32(%rsi), %r11
	leaq	32(%rax), %r10
	movq	(%r10), %rdx
	movq	%rdx, (%r11)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%r11)
	movq	%rdi, %r11
	leaq	32(%rax), %r10
	movq	(%r10), %rax
	movq	%rax, (%r11)
	movq	8(%r10), %rax
	movq	%rax, 8(%r11)
	movq	%rsi, %rdx
	leaq	32(%rsi), %r8
	leaq	24(%rsp), %r9
	movq	$0, (%r9)
	movq	$0, 8(%r9)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$21, %r10d
	leaq	24(%rsp), %r9
	movl	%r10d, (%r9)
	movl	$0, %ecx
	movl	$3, %r9d
	leaq	48(%rsi), %rax
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %r10
	movl	%ecx, %edi
	movl	%r9d, %ecx
	movq	%r10, %r9
	leaq	-472(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	472(%rsp), %rsp
	movq	%rcx, %rax
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	lfence
	movq	$0, %rcx
	leaq	16(%rdi), %r11
	movq	(%rax), %rdx
	movq	%rdx, (%r11)
	movq	8(%rax), %rax
	movq	%rax, 8(%r11)
// declassify_mem 32 [RDI]
	ret
.Lfors_pkfromsig$1:
	movq	%rdx, 656(%rsp)
	leaq	752(%rsp), %rdx
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lfors_pkfromsig$75
.Lfors_pkfromsig$76:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$75:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$76
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, (%rdx)
	jmp 	.Lfors_pkfromsig$73
.Lfors_pkfromsig$74:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$73:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$74
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 4(%rdx)
	jmp 	.Lfors_pkfromsig$71
.Lfors_pkfromsig$72:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$71:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$72
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 8(%rdx)
	jmp 	.Lfors_pkfromsig$69
.Lfors_pkfromsig$70:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$69:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$70
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 12(%rdx)
	jmp 	.Lfors_pkfromsig$67
.Lfors_pkfromsig$68:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$67:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$68
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 16(%rdx)
	jmp 	.Lfors_pkfromsig$65
.Lfors_pkfromsig$66:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$65:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$66
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 20(%rdx)
	jmp 	.Lfors_pkfromsig$63
.Lfors_pkfromsig$64:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$63:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$64
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 24(%rdx)
	jmp 	.Lfors_pkfromsig$61
.Lfors_pkfromsig$62:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$61:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$62
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 28(%rdx)
	jmp 	.Lfors_pkfromsig$59
.Lfors_pkfromsig$60:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$59:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$60
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 32(%rdx)
	jmp 	.Lfors_pkfromsig$57
.Lfors_pkfromsig$58:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$57:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$58
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 36(%rdx)
	jmp 	.Lfors_pkfromsig$55
.Lfors_pkfromsig$56:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$55:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$56
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 40(%rdx)
	jmp 	.Lfors_pkfromsig$53
.Lfors_pkfromsig$54:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$53:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$54
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 44(%rdx)
	jmp 	.Lfors_pkfromsig$51
.Lfors_pkfromsig$52:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$51:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$52
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 48(%rdx)
	jmp 	.Lfors_pkfromsig$49
.Lfors_pkfromsig$50:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$49:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$50
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 52(%rdx)
	jmp 	.Lfors_pkfromsig$47
.Lfors_pkfromsig$48:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$47:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$48
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 56(%rdx)
	jmp 	.Lfors_pkfromsig$45
.Lfors_pkfromsig$46:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$45:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$46
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 60(%rdx)
	jmp 	.Lfors_pkfromsig$43
.Lfors_pkfromsig$44:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$43:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$44
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 64(%rdx)
	jmp 	.Lfors_pkfromsig$41
.Lfors_pkfromsig$42:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$41:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$42
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 68(%rdx)
	jmp 	.Lfors_pkfromsig$39
.Lfors_pkfromsig$40:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$39:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$40
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 72(%rdx)
	jmp 	.Lfors_pkfromsig$37
.Lfors_pkfromsig$38:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$37:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$38
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 76(%rdx)
	jmp 	.Lfors_pkfromsig$35
.Lfors_pkfromsig$36:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$35:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$36
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 80(%rdx)
	jmp 	.Lfors_pkfromsig$33
.Lfors_pkfromsig$34:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$33:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$34
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 84(%rdx)
	jmp 	.Lfors_pkfromsig$31
.Lfors_pkfromsig$32:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$31:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$32
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 88(%rdx)
	jmp 	.Lfors_pkfromsig$29
.Lfors_pkfromsig$30:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$29:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$30
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 92(%rdx)
	jmp 	.Lfors_pkfromsig$27
.Lfors_pkfromsig$28:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$27:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$28
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 96(%rdx)
	jmp 	.Lfors_pkfromsig$25
.Lfors_pkfromsig$26:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$25:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$26
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 100(%rdx)
	jmp 	.Lfors_pkfromsig$23
.Lfors_pkfromsig$24:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$23:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$24
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 104(%rdx)
	jmp 	.Lfors_pkfromsig$21
.Lfors_pkfromsig$22:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$21:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$22
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 108(%rdx)
	jmp 	.Lfors_pkfromsig$19
.Lfors_pkfromsig$20:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$19:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$20
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 112(%rdx)
	jmp 	.Lfors_pkfromsig$17
.Lfors_pkfromsig$18:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$17:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$18
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 116(%rdx)
	jmp 	.Lfors_pkfromsig$15
.Lfors_pkfromsig$16:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$15:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$16
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 120(%rdx)
	jmp 	.Lfors_pkfromsig$13
.Lfors_pkfromsig$14:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$13:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$14
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 124(%rdx)
	jmp 	.Lfors_pkfromsig$11
.Lfors_pkfromsig$12:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$11:
	cmpl	$6, %ecx
	jb  	.Lfors_pkfromsig$12
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 128(%rdx)
	movq	$0, %rax
	movq	$0, %rcx
	movq	$0, %rdi
	jmp 	.Lfors_pkfromsig$3
.Lfors_pkfromsig$4:
	movq	%rcx, 664(%rsp)
	leaq	(%r10,%rax), %rsi
	leaq	64(%rsp), %r11
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	movl	$0, %ecx
	movl	%ecx, 24(%r9)
	movl	%edi, %ecx
	shll	$6, %ecx
	addl	752(%rsp,%rdi,4), %ecx
	lfence
	movq	$0, %rdx
	movl	%ecx, 28(%r9)
	movq	%r8, 672(%rsp)
	movq	%r9, 680(%rsp)
	movq	%r10, 688(%rsp)
	movq	%rdi, 696(%rsp)
	movq	%rax, 704(%rsp)
	leaq	64(%rsp), %rdi
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	40(%rsp), %rsp
	movq	672(%rsp), %r8
	movq	680(%rsp), %r9
	movq	688(%rsp), %r10
	movq	696(%rsp), %rdi
	movq	704(%rsp), %rax
	lfence
	movq	$0, %rcx
	addq	$16, %rax
	movl	752(%rsp,%rdi,4), %esi
	lfence
	movq	$0, %rcx
	movl	$0, %edx
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movl	%edx, %ecx
	incl	%ecx
	movl	%ecx, 24(%r9)
	movl	%esi, %ecx
	andl	$1, %ecx
	movl	%edx, 744(%rsp)
	movl	%esi, 748(%rsp)
	cmpl	$0, %ecx
	je  	.Lfors_pkfromsig$8
	movl	28(%r9), %ecx
	decl	%ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r9)
	leaq	640(%rsp), %r11
	leaq	(%r10,%rax), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	leaq	624(%rsp), %r11
	leaq	64(%rsp), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	jmp 	.Lfors_pkfromsig$9
.Lfors_pkfromsig$8:
	movl	28(%r9), %ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r9)
	leaq	640(%rsp), %r11
	leaq	64(%rsp), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	leaq	624(%rsp), %r11
	leaq	(%r10,%rax), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
.Lfors_pkfromsig$9:
	movq	%r8, 704(%rsp)
	movq	%r9, 696(%rsp)
	movq	%r10, 688(%rsp)
	movq	%rdi, 680(%rsp)
	movq	%rax, 672(%rsp)
	leaq	32(%rsp), %rdi
	leaq	640(%rsp), %rax
	leaq	624(%rsp), %rcx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	40(%rsp), %rsp
	movq	704(%rsp), %r8
	movq	696(%rsp), %r9
	movq	688(%rsp), %r10
	movq	680(%rsp), %rdi
	movq	672(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	64(%rsp), %r11
	leaq	32(%rsp), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	movl	744(%rsp), %edx
	movl	748(%rsp), %esi
	lfence
	movq	$0, %rcx
	shrl	$1, %esi
	addq	$16, %rax
	incl	%edx
.Lfors_pkfromsig$5:
	cmpl	$6, %edx
	jb  	.Lfors_pkfromsig$6
	movq	664(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	96(%rsp,%rcx), %r11
	leaq	64(%rsp), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	addq	$16, %rcx
	incq	%rdi
.Lfors_pkfromsig$3:
	cmpq	$33, %rdi
	jb  	.Lfors_pkfromsig$4
	leaq	712(%rsp), %rax
	movq	(%r9), %rdx
	movq	%rdx, (%rax)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rax)
	leaq	712(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$4, 16(%r10)
	movl	20(%r9), %edx
	leaq	712(%rsp), %r9
	movl	%edx, 20(%r9)
	movq	656(%rsp), %rdi
	lfence
	movq	$0, %rax
	leaq	712(%rsp), %r9
	leaq	96(%rsp), %rax
	leaq	-40(%rsp), %rsp
	call	.LT_k$1
.Lfors_pkfromsig$2:
	leaq	40(%rsp), %rsp
	ret
.Lfors_sign$1:
	leaq	64(%rsp), %rdx
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lfors_sign$72
.Lfors_sign$73:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$72:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$73
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, (%rdx)
	jmp 	.Lfors_sign$70
.Lfors_sign$71:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$70:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$71
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 4(%rdx)
	jmp 	.Lfors_sign$68
.Lfors_sign$69:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$68:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$69
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 8(%rdx)
	jmp 	.Lfors_sign$66
.Lfors_sign$67:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$66:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$67
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 12(%rdx)
	jmp 	.Lfors_sign$64
.Lfors_sign$65:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$64:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$65
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 16(%rdx)
	jmp 	.Lfors_sign$62
.Lfors_sign$63:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$62:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$63
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 20(%rdx)
	jmp 	.Lfors_sign$60
.Lfors_sign$61:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$60:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$61
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 24(%rdx)
	jmp 	.Lfors_sign$58
.Lfors_sign$59:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$58:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$59
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 28(%rdx)
	jmp 	.Lfors_sign$56
.Lfors_sign$57:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$56:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$57
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 32(%rdx)
	jmp 	.Lfors_sign$54
.Lfors_sign$55:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$54:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$55
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 36(%rdx)
	jmp 	.Lfors_sign$52
.Lfors_sign$53:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$52:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$53
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 40(%rdx)
	jmp 	.Lfors_sign$50
.Lfors_sign$51:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$50:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$51
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 44(%rdx)
	jmp 	.Lfors_sign$48
.Lfors_sign$49:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$48:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$49
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 48(%rdx)
	jmp 	.Lfors_sign$46
.Lfors_sign$47:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$46:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$47
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 52(%rdx)
	jmp 	.Lfors_sign$44
.Lfors_sign$45:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$44:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$45
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 56(%rdx)
	jmp 	.Lfors_sign$42
.Lfors_sign$43:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$42:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$43
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 60(%rdx)
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$41
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 64(%rdx)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$39
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 68(%rdx)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$37
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 72(%rdx)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$35
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 76(%rdx)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$33
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 80(%rdx)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$31
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 84(%rdx)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$29
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 88(%rdx)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$27
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 92(%rdx)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$25
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 96(%rdx)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$23
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 100(%rdx)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$21
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 104(%rdx)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$19
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 108(%rdx)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$17
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 112(%rdx)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$15
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 116(%rdx)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$13
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 120(%rdx)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$11
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 124(%rdx)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$9
	movl	%edi, %r11d
	addl	$-6, %ecx
	shrq	%cl, %r11
	andq	$63, %r11
	movl	%r11d, 128(%rdx)
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%edi, %edx
	shll	$6, %edx
	addl	64(%rsp,%rdi,4), %edx
	lfence
	movq	$0, %rcx
	leaq	(%r10,%rax), %rsi
	movq	%rbx, 8(%rsp)
	movq	%r8, 16(%rsp)
	movq	%r9, 24(%rsp)
	movq	%r10, 32(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rsi, %rax
	movl	%edx, %esi
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %rbx
	movq	16(%rsp), %r8
	movq	24(%rsp), %r9
	movq	32(%rsp), %r10
	movq	40(%rsp), %rdi
	movq	48(%rsp), %rax
	lfence
	movq	$0, %rcx
	addq	$16, %rax
	movl	64(%rsp,%rdi,4), %esi
	lfence
	movq	$0, %rcx
	xorl	$1, %esi
	movl	$0, %edx
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%rbx, 48(%rsp)
	movq	%r8, 40(%rsp)
	movq	%rdi, 32(%rsp)
	movl	%edx, 56(%rsp)
	movq	%rax, 24(%rsp)
	movl	%esi, 60(%rsp)
	movl	$6, %ecx
	subl	%edx, %ecx
	shlq	%cl, %rdi
	addl	%esi, %edi
	leaq	(%r10,%rax), %rax
	movq	%r10, 16(%rsp)
	movl	%edx, %ecx
	leaq	-2264(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	2264(%rsp), %rsp
	movq	16(%rsp), %r10
	lfence
	movq	$0, %rax
	movq	48(%rsp), %rbx
	movq	40(%rsp), %r8
	movq	32(%rsp), %rdi
	movl	56(%rsp), %edx
	movq	24(%rsp), %rax
	movl	60(%rsp), %esi
	lfence
	movq	$0, %rcx
	shrl	$1, %esi
	xorl	$1, %esi
	addq	$16, %rax
	incl	%edx
.Lfors_sign$4:
	cmpl	$6, %edx
	jb  	.Lfors_sign$5
	incq	%rdi
.Lfors_sign$2:
	cmpq	$33, %rdi
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rax, 2096(%rsp)
	movq	$0, %rax
	movl	$0, %r10d
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%ecx, 2200(%rsp)
	subl	%r10d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %esi
	movl	%edx, %r11d
	imull	%edi, %esi
	addl	%esi, %r11d
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%rbx, 2104(%rsp)
	movl	%r11d, 2204(%rsp)
	cmpl	$0, %r10d
	je  	.Lfors_node$6
	movl	%esi, %eax
	imull	$2, %eax, %eax
	movl	%r10d, %edx
	decl	%edx
	movl	$7, %ecx
	movq	$1, %r12
	shlq	%cl, %r12
	subl	%edx, %ecx
	movq	$1, %rbx
	shlq	%cl, %rbx
	subq	%rbx, %r12
	shrq	$1, %rbx
	movl	%eax, %eax
	xorl	%edx, %edx
	divq	%rbx
	addq	%rdx, %r12
	imulq	$16, %r12, %rbx
	movl	%r10d, 24(%r9)
	movl	%esi, 28(%r9)
	movl	$7, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbp
	subl	%r10d, %ecx
	movq	$1, %r12
	shlq	%cl, %r12
	subq	%r12, %rbp
	shrq	$1, %r12
	movl	%esi, %eax
	xorl	%edx, %edx
	divq	%r12
	addq	%rdx, %rbp
	imulq	$16, %rbp, %rax
	subl	%esi, %r11d
	cmpl	$4, %r11d
	jnb 	.Lfors_node$13
	movq	%rbx, %rcx
	addq	$16, %rcx
	leaq	2080(%rsp), %r11
	leaq	32(%rsp,%rbx), %rdx
	movq	(%rdx), %rbx
	movq	%rbx, (%r11)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%r11)
	leaq	2064(%rsp), %r11
	leaq	32(%rsp,%rcx), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%r11)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%r11)
	movq	%r8, 2112(%rsp)
	movq	%r9, 2120(%rsp)
	movl	%edi, 2208(%rsp)
	movl	%r10d, 2212(%rsp)
	movl	%esi, 2216(%rsp)
	movq	%rax, 2128(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	2080(%rsp), %rax
	leaq	2064(%rsp), %rcx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_node$16:
	leaq	40(%rsp), %rsp
	movq	2112(%rsp), %r8
	movq	2120(%rsp), %r9
	movl	2208(%rsp), %edi
	movl	2212(%rsp), %r10d
	movl	2216(%rsp), %esi
	movq	2128(%rsp), %rax
	lfence
	movq	$0, %rcx
	jmp 	.Lfors_node$7
.Lfors_node$13:
	movl	%r10d, 2220(%rsp)
	movl	%esi, %edx
	movl	%edx, 2224(%rsp)
	movl	%r10d, 2228(%rsp)
	movl	%esi, %edx
	incl	%edx
	movl	%edx, 2232(%rsp)
	movl	%r10d, 2236(%rsp)
	movl	%esi, %edx
	addl	$2, %edx
	movl	%edx, 2240(%rsp)
	movl	%r10d, 2244(%rsp)
	movl	%esi, %edx
	addl	$3, %edx
	movl	%edx, 2248(%rsp)
	movq	%r8, 2128(%rsp)
	movq	%r9, 2120(%rsp)
	movl	%edi, 2216(%rsp)
	movl	%r10d, 2212(%rsp)
	movl	%esi, 2208(%rsp)
	movq	%rax, 2112(%rsp)
	leaq	32(%rsp,%rbx), %rsi
	leaq	2136(%rsp), %rdi
	leaq	2220(%rsp), %rax
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_2n__thash_x4$1
.Lfors_node$15:
	leaq	824(%rsp), %rsp
	movq	2128(%rsp), %r8
	movq	2120(%rsp), %r9
	movl	2216(%rsp), %edi
	movl	2212(%rsp), %r10d
	movl	2208(%rsp), %esi
	movq	2112(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	32(%rsp,%rax), %r11
	leaq	2136(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%r11)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%r11)
	leaq	48(%rsp,%rax), %r11
	leaq	2152(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%r11)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%r11)
	leaq	64(%rsp,%rax), %r11
	leaq	2168(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%r11)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%r11)
	leaq	80(%rsp,%rax), %r11
	leaq	2184(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%r11)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%r11)
	addl	$3, %esi
.Lfors_node$14:
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%r10d, 24(%r9)
	movl	%esi, 28(%r9)
	movl	$7, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbp
	subl	%r10d, %ecx
	movq	$1, %r12
	shlq	%cl, %r12
	subq	%r12, %rbp
	shrq	$1, %r12
	movl	%esi, %eax
	xorl	%edx, %edx
	divq	%r12
	addq	%rdx, %rbp
	imulq	$16, %rbp, %rax
	subl	%esi, %r11d
	cmpl	$4, %r11d
	jnb 	.Lfors_node$8
	movq	%r8, 2128(%rsp)
	movq	%r9, 2120(%rsp)
	movl	%edi, 2216(%rsp)
	movl	%r10d, 2212(%rsp)
	movl	%esi, 2208(%rsp)
	movq	%rax, 2112(%rsp)
	leaq	32(%rsp,%rax), %rax
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$12:
	leaq	40(%rsp), %rsp
	movq	2128(%rsp), %r8
	movq	2120(%rsp), %r9
	movl	2216(%rsp), %ecx
	movl	2212(%rsp), %r10d
	movl	2208(%rsp), %esi
	movq	2112(%rsp), %rax
	lfence
	movq	$0, %rdx
	movq	%r8, 2112(%rsp)
	movq	%r9, 2120(%rsp)
	movl	%ecx, 2208(%rsp)
	movl	%r10d, 2212(%rsp)
	movl	%esi, 2216(%rsp)
	movq	%rax, 2128(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_node$11:
	leaq	40(%rsp), %rsp
	movq	2112(%rsp), %r8
	movq	2120(%rsp), %r9
	movl	2208(%rsp), %edi
	movl	2212(%rsp), %r10d
	movl	2216(%rsp), %esi
	movq	2128(%rsp), %rax
	lfence
	movq	$0, %rcx
	jmp 	.Lfors_node$7
.Lfors_node$8:
	movq	%r8, 2112(%rsp)
	movq	%r9, 2120(%rsp)
	movl	%edi, 2208(%rsp)
	movl	%r10d, 2212(%rsp)
	movl	%esi, 2216(%rsp)
	movq	%rax, 2128(%rsp)
	leaq	32(%rsp,%rax), %rax
	movq	%rax, %rcx
	movl	%esi, %eax
	leaq	-216(%rsp), %rsp
	call	.Lfors_leaves_x4$1
.Lfors_node$10:
	leaq	216(%rsp), %rsp
	movq	2112(%rsp), %r8
	movq	2120(%rsp), %r9
	movl	2208(%rsp), %edi
	movl	2212(%rsp), %r10d
	movl	2216(%rsp), %esi
	movq	2128(%rsp), %rax
	lfence
	movq	$0, %rcx
	addl	$3, %esi
.Lfors_node$9:
.Lfors_node$7:
	movq	2104(%rsp), %rbx
	movl	2204(%rsp), %r11d
	lfence
	movq	$0, %rcx
	incl	%esi
.Lfors_node$4:
	cmpl	%r11d, %esi
	jb  	.Lfors_node$5
	movl	2200(%rsp), %ecx
	lfence
	movq	$0, %rdx
	incl	%r10d
.Lfors_node$2:
	cmpl	%ecx, %r10d
	jbe 	.Lfors_node$3
	movq	2096(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rax
	movq	%rax, 8(%rcx)
	ret
.Lfors_leaves_x4$1:
	movq	%rcx, %mm0
	leaq	56(%rsp), %rdi
	movq	(%rbx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rdi)
	leaq	72(%rsp), %rdi
	movq	(%rbx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rdi)
	leaq	88(%rsp), %rdi
	movq	(%rbx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rdi)
	leaq	104(%rsp), %rdi
	movq	(%rbx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rdi)
	movl	$0, %esi
	movl	%esi, 184(%rsp)
	movl	%eax, 188(%rsp)
	incl	%eax
	movl	%esi, 192(%rsp)
	movl	%eax, 196(%rsp)
	incl	%eax
	movl	%esi, 200(%rsp)
	movl	%eax, 204(%rsp)
	incl	%eax
	movl	%esi, 208(%rsp)
	movl	%eax, 212(%rsp)
	leaq	24(%rsp), %rax
	movq	(%r9), %rdx
	movq	%rdx, (%rax)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rax)
	leaq	24(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$6, 16(%r10)
	movl	20(%r9), %edx
	leaq	24(%rsp), %r10
	movl	%edx, 20(%r10)
	movq	%r8, 8(%rsp)
	movq	%r9, 16(%rsp)
	leaq	120(%rsp), %rdi
	leaq	56(%rsp), %rsi
	leaq	24(%rsp), %r9
	leaq	184(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lfors_leaves_x4$3:
	leaq	824(%rsp), %rsp
	movq	8(%rsp), %r8
	movq	16(%rsp), %r9
	movq	%mm0, %rdi
	lfence
	movq	$0, %rax
	leaq	120(%rsp), %rsi
	leaq	184(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lfors_leaves_x4$2:
	leaq	824(%rsp), %rsp
	ret
.Lfors_skgen$1:
	leaq	8(%rsp), %rcx
	movq	(%r9), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rcx)
	leaq	8(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$6, 16(%r10)
	movl	20(%r9), %edx
	leaq	8(%rsp), %r9
	movl	%edx, 20(%r9)
	leaq	8(%rsp), %r9
	movl	%esi, 28(%r9)
	leaq	8(%rsp), %r9
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	40(%rsp), %rsp
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%rsi), %edi
	movl	%edi, 108(%rsp)
	movl	4(%rsi), %edi
	movl	%edi, 112(%rsp)
	movl	8(%rsi), %esi
	movl	%esi, 116(%rsp)
	leaq	72(%rsp), %r9
	movq	$0, (%r9)
	movq	$0, 8(%r9)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	leaq	72(%rsp), %r9
	movl	108(%rsp), %esi
	movl	%esi, 4(%r9)
	movl	112(%rsp), %esi
	movl	%esi, 8(%r9)
	movl	116(%rsp), %esi
	movl	%esi, 12(%r9)
	movq	%rcx, %rsi
	movq	%r8, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	40(%rsp), %rcx
	leaq	72(%rsp), %r9
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	152(%rsp), %rsp
	movq	16(%rsp), %r8
	movq	24(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	$608, %rdx
	movl	$1, %r10d
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%r10d, 104(%rsp)
	movq	%rdx, 24(%rsp)
	leaq	108(%rsp), %rsi
	movl	8(%rsi), %eax
	andl	$7, %eax
	shrl	$3, 8(%rsi)
	movl	4(%rsi), %r9d
	shll	$29, %r9d
	orl 	%r9d, 8(%rsi)
	shrl	$3, 4(%rsi)
	movl	(%rsi), %r9d
	shll	$29, %r9d
	orl 	%r9d, 4(%rsi)
	shrl	$3, (%rsi)
	leaq	72(%rsp), %r9
	movl	%r10d, (%r9)
	leaq	72(%rsp), %r9
	movl	108(%rsp), %esi
	movl	%esi, 4(%r9)
	movl	112(%rsp), %esi
	movl	%esi, 8(%r9)
	movl	116(%rsp), %esi
	movl	%esi, 12(%r9)
	leaq	56(%rsp), %rdi
	leaq	40(%rsp), %rsi
	movq	(%rsi), %r9
	movq	%r9, (%rdi)
	movq	8(%rsi), %rsi
	movq	%rsi, 8(%rdi)
	leaq	(%rcx,%rdx), %rsi
	movq	%r8, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	40(%rsp), %rcx
	leaq	56(%rsp), %rdi
	leaq	72(%rsp), %r9
	movl	%eax, %edx
	movq	%rdi, %rax
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	152(%rsp), %rsp
	movq	16(%rsp), %r8
	movq	32(%rsp), %rcx
	lfence
	movq	$0, %rax
	movl	104(%rsp), %r10d
	movq	24(%rsp), %rdx
	lfence
	movq	$0, %rax
	addq	$608, %rdx
	incl	%r10d
.Lht_verify$2:
	cmpl	$22, %r10d
	jb  	.Lht_verify$3
	movq	8(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	40(%rsp), %rcx
	movb	$0, %dl
	movb	(%rax), %sil
	xorb	(%rcx), %sil
	orb 	%sil, %dl
	movb	1(%rax), %sil
	xorb	1(%rcx), %sil
	orb 	%sil, %dl
	movb	2(%rax), %sil
	xorb	2(%rcx), %sil
	orb 	%sil, %dl
	movb	3(%rax), %sil
	xorb	3(%rcx), %sil
	orb 	%sil, %dl
	movb	4(%rax), %sil
	xorb	4(%rcx), %sil
	orb 	%sil, %dl
	movb	5(%rax), %sil
	xorb	5(%rcx), %sil
	orb 	%sil, %dl
	movb	6(%rax), %sil
	xorb	6(%rcx), %sil
	orb 	%sil, %dl
	movb	7(%rax), %sil
	xorb	7(%rcx), %sil
	orb 	%sil, %dl
	movb	8(%rax), %sil
	xorb	8(%rcx), %sil
	orb 	%sil, %dl
	movb	9(%rax), %sil
	xorb	9(%rcx), %sil
	orb 	%sil, %dl
	movb	10(%rax), %sil
	xorb	10(%rcx), %sil
	orb 	%sil, %dl
	movb	11(%rax), %sil
	xorb	11(%rcx), %sil
	orb 	%sil, %dl
	movb	12(%rax), %sil
	xorb	12(%rcx), %sil
	orb 	%sil, %dl
	movb	13(%rax), %sil
	xorb	13(%rcx), %sil
	orb 	%sil, %dl
	movb	14(%rax), %sil
	xorb	14(%rcx), %sil
	orb 	%sil, %dl
	movb	15(%rax), %sil
	xorb	15(%rcx), %sil
	orb 	%sil, %dl
	movzbq	%dl, %rax
	ret
.Lht_sign$1:
	movl	(%rdi), %r9d
	movl	%r9d, 112(%rsp)
	movl	4(%rdi), %r9d
	movl	%r9d, 116(%rsp)
	movl	8(%rdi), %edi
	movl	%edi, 120(%rsp)
	leaq	72(%rsp), %r9
	movq	$0, (%r9)
	movq	$0, 8(%r9)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	leaq	72(%rsp), %r9
	movl	112(%rsp), %edi
	movl	%edi, 4(%r9)
	movl	116(%rsp), %edi
	movl	%edi, 8(%r9)
	movl	120(%rsp), %edi
	movl	%edi, 12(%r9)
	movq	%rcx, %rdi
	movq	%rcx, 8(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%r8, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%esi, 104(%rsp)
	leaq	72(%rsp), %r9
	movq	%rdi, %rcx
	movq	%rax, %rdi
	movl	%esi, %eax
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rsi
// declassify_mem 608 [RSI]
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	24(%rsp), %r8
	movq	32(%rsp), %rax
	movl	104(%rsp), %edi
	lfence
	movq	$0, %r9
	movq	%rdx, 32(%rsp)
	movq	%r8, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	40(%rsp), %rcx
	leaq	72(%rsp), %r9
	movl	%edi, %edx
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	152(%rsp), %rsp
	movq	32(%rsp), %rdx
	movq	24(%rsp), %r8
	movq	16(%rsp), %rcx
	lfence
	movq	$0, %r9
	movq	$608, %rsi
	movl	$1, %r10d
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%rdx, 16(%rsp)
	leaq	112(%rsp), %rdi
	movl	8(%rdi), %eax
	andl	$7, %eax
	shrl	$3, 8(%rdi)
	movl	4(%rdi), %r9d
	shll	$29, %r9d
	orl 	%r9d, 8(%rdi)
	shrl	$3, 4(%rdi)
	movl	(%rdi), %r9d
	shll	$29, %r9d
	orl 	%r9d, 4(%rdi)
	shrl	$3, (%rdi)
	leaq	72(%rsp), %r9
	movl	%r10d, (%r9)
	leaq	72(%rsp), %r9
	movl	112(%rsp), %edi
	movl	%edi, 4(%r9)
	movl	116(%rsp), %edi
	movl	%edi, 8(%r9)
	movl	120(%rsp), %edi
	movl	%edi, 12(%r9)
	leaq	56(%rsp), %rdi
	leaq	40(%rsp), %r11
	movq	(%r11), %r9
	movq	%r9, (%rdi)
	movq	8(%r11), %r9
	movq	%r9, 8(%rdi)
	leaq	(%rcx,%rsi), %rdi
	movq	%rcx, 24(%rsp)
	movq	%r8, 32(%rsp)
	movl	%r10d, 104(%rsp)
	movq	%rsi, 8(%rsp)
	movl	%eax, 108(%rsp)
	leaq	56(%rsp), %rsi
	leaq	72(%rsp), %r9
	movq	%rdi, %rcx
	movq	%rsi, %rdi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdi
// declassify_mem 608 [RDI]
	movq	24(%rsp), %rcx
	movq	32(%rsp), %r8
	movl	104(%rsp), %r10d
	movq	8(%rsp), %rsi
	movl	108(%rsp), %edx
	lfence
	movq	$0, %rax
	cmpl	$21, %r10d
	jnb 	.Lht_sign$4
	movq	%r8, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%r10d, 108(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	40(%rsp), %rcx
	leaq	56(%rsp), %rax
	leaq	72(%rsp), %r9
	movq	%rdi, %rsi
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	152(%rsp), %rsp
	movq	8(%rsp), %r8
	movq	32(%rsp), %rcx
	movl	108(%rsp), %r10d
	movq	24(%rsp), %rsi
	lfence
	movq	$0, %rax
.Lht_sign$4:
	movq	16(%rsp), %rdx
	lfence
	movq	$0, %rax
	addq	$608, %rsi
	incl	%r10d
.Lht_sign$2:
	cmpl	$22, %r10d
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 112(%rsp)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$0, 16(%r9)
	movl	%edx, 20(%r9)
	movq	%rsi, %rcx
	movq	%r8, 120(%rsp)
	movl	%edx, 152(%rsp)
	movq	%rsi, 128(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	leaq	-952(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	952(%rsp), %rsp
	movq	120(%rsp), %r8
	movl	152(%rsp), %ecx
	movq	128(%rsp), %rsi
	lfence
	movq	$0, %rax
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$2, 16(%r9)
	movl	%ecx, 28(%r9)
	movq	$560, %rax
	movl	%ecx, %edi
	movl	$0, %edx
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%edx, %ecx
	incl	%ecx
	movl	%ecx, 24(%r9)
	movl	%edi, %ecx
	andl	$1, %ecx
	movl	%edx, 152(%rsp)
	movl	%edi, 156(%rsp)
	cmpl	$0, %ecx
	je  	.Lxmss_pkfromsig$5
	movl	28(%r9), %ecx
	decl	%ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r9)
	leaq	96(%rsp), %rdi
	leaq	(%rsi,%rax), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	leaq	80(%rsp), %rdi
	leaq	32(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	jmp 	.Lxmss_pkfromsig$6
.Lxmss_pkfromsig$5:
	movl	28(%r9), %ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r9)
	leaq	96(%rsp), %rdi
	leaq	32(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	leaq	80(%rsp), %rdi
	leaq	(%rsi,%rax), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
.Lxmss_pkfromsig$6:
	movq	%r8, 128(%rsp)
	movq	%r9, 120(%rsp)
	movq	%rsi, 136(%rsp)
	movq	%rax, 144(%rsp)
	leaq	64(%rsp), %rdi
	leaq	96(%rsp), %rax
	leaq	80(%rsp), %rcx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	40(%rsp), %rsp
	movq	128(%rsp), %r8
	movq	120(%rsp), %r9
	movq	136(%rsp), %rsi
	movq	144(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	32(%rsp), %rdi
	leaq	64(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	movl	152(%rsp), %edx
	movl	156(%rsp), %edi
	lfence
	movq	$0, %rcx
	shrl	$1, %edi
	addq	$16, %rax
	incl	%edx
.Lxmss_pkfromsig$2:
	cmpl	$3, %edx
	jb  	.Lxmss_pkfromsig$3
	movq	112(%rsp), %rcx
	lfence
	movq	$0, %rax
	leaq	32(%rsp), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rax
	movq	%rax, 8(%rcx)
	ret
.Lxmss_sign$1:
	movq	%rdi, 8(%rsp)
	movq	$560, %rsi
	movl	%eax, %edi
	xorl	$1, %edi
	movl	$0, %r10d
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%rdx, 16(%rsp)
	movq	%r8, 24(%rsp)
	movl	%eax, 48(%rsp)
	movl	%r10d, 52(%rsp)
	movl	%edi, 56(%rsp)
	movq	%rsi, 32(%rsp)
	leaq	(%rcx,%rsi), %rax
	movq	%rcx, 40(%rsp)
	movl	%r10d, %ecx
	leaq	-472(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	472(%rsp), %rsp
	movq	40(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	16(%rsp), %rdx
	movq	24(%rsp), %r8
	movl	48(%rsp), %eax
	movl	52(%rsp), %r10d
	movl	56(%rsp), %edi
	movq	32(%rsp), %rsi
	lfence
	movq	$0, %r11
	shrl	$1, %edi
	xorl	$1, %edi
	addq	$16, %rsi
	incl	%r10d
.Lxmss_sign$3:
	cmpl	$3, %r10d
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rsi
	lfence
	movq	$0, %rdi
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$0, 16(%r9)
	movl	%eax, 20(%r9)
	movq	%rcx, %rax
	movq	%rcx, 8(%rsp)
	leaq	-344(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	344(%rsp), %rsp
	movq	8(%rsp), %rcx
	lfence
	movq	$0, %rax
	ret
.Lxmss_node$1:
	movq	%rax, 304(%rsp)
	movq	$0, %rax
	movl	$0, %r10d
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%ecx, 408(%rsp)
	subl	%r10d, %ecx
	movq	$1, %r11
	shlq	%cl, %r11
	movl	%r11d, %esi
	imull	%edi, %esi
	addl	%esi, %r11d
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%rdx, 312(%rsp)
	movq	%r8, 320(%rsp)
	movl	%edi, 412(%rsp)
	movl	%r10d, 416(%rsp)
	movl	%esi, 420(%rsp)
	movl	%r11d, 424(%rsp)
	cmpl	$0, %r10d
	je  	.Lxmss_node$6
	movl	%esi, %eax
	imull	$2, %eax, %eax
	movl	%r10d, %edx
	decl	%edx
	movl	$4, %ecx
	movq	$1, %rdi
	shlq	%cl, %rdi
	subl	%edx, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %rdi
	movl	%eax, %eax
	addq	%rax, %rdi
	imulq	$16, %rdi, %rax
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$2, 16(%r9)
	movl	%r10d, 24(%r9)
	movl	%esi, 28(%r9)
	movl	$4, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subl	%r10d, %ecx
	movq	$1, %rdi
	shlq	%cl, %rdi
	subq	%rdi, %rdx
	movl	%esi, %ecx
	addq	%rcx, %rdx
	imulq	$16, %rdx, %rcx
	subl	%esi, %r11d
	cmpl	$4, %r11d
	jnb 	.Lxmss_node$9
	movq	%rax, %rdx
	addq	$16, %rdx
	leaq	288(%rsp), %rdi
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rsi
	movq	%rsi, (%rdi)
	movq	8(%rax), %rax
	movq	%rax, 8(%rdi)
	leaq	272(%rsp), %rax
	leaq	32(%rsp,%rdx), %rdx
	movq	(%rdx), %rsi
	movq	%rsi, (%rax)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rax)
	movq	%r9, 336(%rsp)
	movq	%rcx, 328(%rsp)
	leaq	32(%rsp,%rcx), %rdi
	leaq	288(%rsp), %rax
	leaq	272(%rsp), %rcx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_node$12:
	leaq	40(%rsp), %rsp
	movq	336(%rsp), %r9
	movq	328(%rsp), %rax
	lfence
	movq	$0, %rcx
	jmp 	.Lxmss_node$7
.Lxmss_node$9:
	movl	%r10d, 428(%rsp)
	movl	%esi, %edx
	movl	%edx, 432(%rsp)
	movl	%r10d, 436(%rsp)
	movl	%esi, %edx
	incl	%edx
	movl	%edx, 440(%rsp)
	movl	%r10d, 444(%rsp)
	movl	%esi, %edx
	addl	$2, %edx
	movl	%edx, 448(%rsp)
	movl	%r10d, 452(%rsp)
	addl	$3, %esi
	movl	%esi, 456(%rsp)
	movq	%r9, 328(%rsp)
	movq	%rcx, 336(%rsp)
	leaq	32(%rsp,%rax), %rsi
	leaq	344(%rsp), %rdi
	leaq	428(%rsp), %rax
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_2n__thash_x4$1
.Lxmss_node$11:
	leaq	824(%rsp), %rsp
	movq	328(%rsp), %r9
	movq	336(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	32(%rsp,%rax), %rdi
	leaq	344(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	leaq	48(%rsp,%rax), %rdi
	leaq	360(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	leaq	64(%rsp,%rax), %rdi
	leaq	376(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	leaq	80(%rsp,%rax), %rdi
	leaq	392(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	movl	420(%rsp), %esi
	addl	$3, %esi
	movl	%esi, 420(%rsp)
.Lxmss_node$10:
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$0, 16(%r9)
	movl	%esi, 20(%r9)
	movl	%esi, %eax
	imulq	$16, %rax, %rax
	leaq	32(%rsp,%rax), %rdi
	leaq	-920(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	920(%rsp), %rsp
.Lxmss_node$7:
	movq	312(%rsp), %rdx
	movq	320(%rsp), %r8
	movl	412(%rsp), %edi
	movl	416(%rsp), %r10d
	movl	420(%rsp), %esi
	movl	424(%rsp), %r11d
	lfence
	movq	$0, %rcx
	incl	%esi
.Lxmss_node$4:
	cmpl	%r11d, %esi
	jb  	.Lxmss_node$5
	movl	408(%rsp), %ecx
	lfence
	movq	$0, %rsi
	incl	%r10d
.Lxmss_node$2:
	cmpl	%ecx, %r10d
	jbe 	.Lxmss_node$3
	movq	304(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rax
	movq	%rax, 8(%rcx)
	ret
.Lwots_pkfromsig$1:
	movq	%rsi, 592(%rsp)
	leaq	648(%rsp), %rsi
	movq	%rsi, %rdi
	movq	$0, %r10
	movl	$0, %ecx
	movl	$0, %r11d
	jmp 	.Lwots_pkfromsig$72
.Lwots_pkfromsig$73:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$72:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$73
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, (%rdi)
	jmp 	.Lwots_pkfromsig$70
.Lwots_pkfromsig$71:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$70:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$71
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 4(%rdi)
	jmp 	.Lwots_pkfromsig$68
.Lwots_pkfromsig$69:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$68:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$69
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 8(%rdi)
	jmp 	.Lwots_pkfromsig$66
.Lwots_pkfromsig$67:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$66:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$67
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 12(%rdi)
	jmp 	.Lwots_pkfromsig$64
.Lwots_pkfromsig$65:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$64:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$65
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 16(%rdi)
	jmp 	.Lwots_pkfromsig$62
.Lwots_pkfromsig$63:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$62:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$63
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 20(%rdi)
	jmp 	.Lwots_pkfromsig$60
.Lwots_pkfromsig$61:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$60:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$61
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 24(%rdi)
	jmp 	.Lwots_pkfromsig$58
.Lwots_pkfromsig$59:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$58:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$59
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 28(%rdi)
	jmp 	.Lwots_pkfromsig$56
.Lwots_pkfromsig$57:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$56:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$57
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 32(%rdi)
	jmp 	.Lwots_pkfromsig$54
.Lwots_pkfromsig$55:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$54:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$55
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 36(%rdi)
	jmp 	.Lwots_pkfromsig$52
.Lwots_pkfromsig$53:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$52:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$53
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 40(%rdi)
	jmp 	.Lwots_pkfromsig$50
.Lwots_pkfromsig$51:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$50:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$51
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 44(%rdi)
	jmp 	.Lwots_pkfromsig$48
.Lwots_pkfromsig$49:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$48:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$49
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 48(%rdi)
	jmp 	.Lwots_pkfromsig$46
.Lwots_pkfromsig$47:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$46:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$47
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 52(%rdi)
	jmp 	.Lwots_pkfromsig$44
.Lwots_pkfromsig$45:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$44:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$45
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 56(%rdi)
	jmp 	.Lwots_pkfromsig$42
.Lwots_pkfromsig$43:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$42:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$43
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 60(%rdi)
	jmp 	.Lwots_pkfromsig$40
.Lwots_pkfromsig$41:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$40:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$41
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 64(%rdi)
	jmp 	.Lwots_pkfromsig$38
.Lwots_pkfromsig$39:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$38:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$39
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 68(%rdi)
	jmp 	.Lwots_pkfromsig$36
.Lwots_pkfromsig$37:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$36:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$37
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 72(%rdi)
	jmp 	.Lwots_pkfromsig$34
.Lwots_pkfromsig$35:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$34:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$35
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 76(%rdi)
	jmp 	.Lwots_pkfromsig$32
.Lwots_pkfromsig$33:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$32:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$33
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 80(%rdi)
	jmp 	.Lwots_pkfromsig$30
.Lwots_pkfromsig$31:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$30:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$31
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 84(%rdi)
	jmp 	.Lwots_pkfromsig$28
.Lwots_pkfromsig$29:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$28:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$29
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 88(%rdi)
	jmp 	.Lwots_pkfromsig$26
.Lwots_pkfromsig$27:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$26:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$27
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 92(%rdi)
	jmp 	.Lwots_pkfromsig$24
.Lwots_pkfromsig$25:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$24:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$25
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 96(%rdi)
	jmp 	.Lwots_pkfromsig$22
.Lwots_pkfromsig$23:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$22:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$23
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 100(%rdi)
	jmp 	.Lwots_pkfromsig$20
.Lwots_pkfromsig$21:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$20:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$21
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 104(%rdi)
	jmp 	.Lwots_pkfromsig$18
.Lwots_pkfromsig$19:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$18:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$19
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 108(%rdi)
	jmp 	.Lwots_pkfromsig$16
.Lwots_pkfromsig$17:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$16:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$17
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 112(%rdi)
	jmp 	.Lwots_pkfromsig$14
.Lwots_pkfromsig$15:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$14:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$15
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 116(%rdi)
	jmp 	.Lwots_pkfromsig$12
.Lwots_pkfromsig$13:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$12:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$13
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 120(%rdi)
	jmp 	.Lwots_pkfromsig$10
.Lwots_pkfromsig$11:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$10:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$11
	movl	%r11d, %r11d
	addl	$-4, %ecx
	shrq	%cl, %r11
	andq	$15, %r11
	movl	%r11d, 124(%rdi)
	movq	%rsi, %rax
	movl	$480, %ecx
	subl	(%rax), %ecx
	subl	4(%rax), %ecx
	subl	8(%rax), %ecx
	subl	12(%rax), %ecx
	subl	16(%rax), %ecx
	subl	20(%rax), %ecx
	subl	24(%rax), %ecx
	subl	28(%rax), %ecx
	subl	32(%rax), %ecx
	subl	36(%rax), %ecx
	subl	40(%rax), %ecx
	subl	44(%rax), %ecx
	subl	48(%rax), %ecx
	subl	52(%rax), %ecx
	subl	56(%rax), %ecx
	subl	60(%rax), %ecx
	subl	64(%rax), %ecx
	subl	68(%rax), %ecx
	subl	72(%rax), %ecx
	subl	76(%rax), %ecx
	subl	80(%rax), %ecx
	subl	84(%rax), %ecx
	subl	88(%rax), %ecx
	subl	92(%rax), %ecx
	subl	96(%rax), %ecx
	subl	100(%rax), %ecx
	subl	104(%rax), %ecx
	subl	108(%rax), %ecx
	subl	112(%rax), %ecx
	subl	116(%rax), %ecx
	subl	120(%rax), %ecx
	subl	124(%rax), %ecx
	shll	$4, %ecx
	movl	%ecx, %eax
	shrl	$0, %eax
	andl	$255, %eax
	movb	%al, 929(%rsp)
	shrl	$8, %ecx
	andl	$255, %ecx
	movb	%cl, 928(%rsp)
	leaq	128(%rsi), %rdi
	leaq	928(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %r11d
	jmp 	.Lwots_pkfromsig$8
.Lwots_pkfromsig$9:
	shll	$8, %r11d
	movzbl	(%rax,%rsi), %r10d
	orl 	%r10d, %r11d
	incq	%rsi
	addl	$8, %ecx
.Lwots_pkfromsig$8:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$9
	movl	%r11d, %r10d
	addl	$-4, %ecx
	shrq	%cl, %r10
	andq	$15, %r10
	movl	%r10d, (%rdi)
	jmp 	.Lwots_pkfromsig$6
.Lwots_pkfromsig$7:
	shll	$8, %r11d
	movzbl	(%rax,%rsi), %r10d
	orl 	%r10d, %r11d
	incq	%rsi
	addl	$8, %ecx
.Lwots_pkfromsig$6:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$7
	movl	%r11d, %r10d
	addl	$-4, %ecx
	shrq	%cl, %r10
	andq	$15, %r10
	movl	%r10d, 4(%rdi)
	jmp 	.Lwots_pkfromsig$4
.Lwots_pkfromsig$5:
	shll	$8, %r11d
	movzbl	(%rax,%rsi), %r10d
	orl 	%r10d, %r11d
	incq	%rsi
	addl	$8, %ecx
.Lwots_pkfromsig$4:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$5
	movl	%r11d, %r10d
	addl	$-4, %ecx
	shrq	%cl, %r10
	andq	$15, %r10
	movl	%r10d, 8(%rdi)
	movb	(%rdx), %al
	movb	%al, 32(%rsp)
	movb	1(%rdx), %al
	movb	%al, 33(%rsp)
	movb	2(%rdx), %al
	movb	%al, 34(%rsp)
	movb	3(%rdx), %al
	movb	%al, 35(%rsp)
	movb	4(%rdx), %al
	movb	%al, 36(%rsp)
	movb	5(%rdx), %al
	movb	%al, 37(%rsp)
	movb	6(%rdx), %al
	movb	%al, 38(%rsp)
	movb	7(%rdx), %al
	movb	%al, 39(%rsp)
	movb	8(%rdx), %al
	movb	%al, 40(%rsp)
	movb	9(%rdx), %al
	movb	%al, 41(%rsp)
	movb	10(%rdx), %al
	movb	%al, 42(%rsp)
	movb	11(%rdx), %al
	movb	%al, 43(%rsp)
	movb	12(%rdx), %al
	movb	%al, 44(%rsp)
	movb	13(%rdx), %al
	movb	%al, 45(%rsp)
	movb	14(%rdx), %al
	movb	%al, 46(%rsp)
	movb	15(%rdx), %al
	movb	%al, 47(%rsp)
	movb	16(%rdx), %al
	movb	%al, 48(%rsp)
	movb	17(%rdx), %al
	movb	%al, 49(%rsp)
	movb	18(%rdx), %al
	movb	%al, 50(%rsp)
	movb	19(%rdx), %al
	movb	%al, 51(%rsp)
	movb	20(%rdx), %al
	movb	%al, 52(%rsp)
	movb	21(%rdx), %al
	movb	%al, 53(%rsp)
	movb	22(%rdx), %al
	movb	%al, 54(%rsp)
	movb	23(%rdx), %al
	movb	%al, 55(%rsp)
	movb	24(%rdx), %al
	movb	%al, 56(%rsp)
	movb	25(%rdx), %al
	movb	%al, 57(%rsp)
	movb	26(%rdx), %al
	movb	%al, 58(%rsp)
	movb	27(%rdx), %al
	movb	%al, 59(%rsp)
	movb	28(%rdx), %al
	movb	%al, 60(%rsp)
	movb	29(%rdx), %al
	movb	%al, 61(%rsp)
	movb	30(%rdx), %al
	movb	%al, 62(%rsp)
	movb	31(%rdx), %al
	movb	%al, 63(%rsp)
	movb	32(%rdx), %al
	movb	%al, 64(%rsp)
	movb	33(%rdx), %al
	movb	%al, 65(%rsp)
	movb	34(%rdx), %al
	movb	%al, 66(%rsp)
	movb	35(%rdx), %al
	movb	%al, 67(%rsp)
	movb	36(%rdx), %al
	movb	%al, 68(%rsp)
	movb	37(%rdx), %al
	movb	%al, 69(%rsp)
	movb	38(%rdx), %al
	movb	%al, 70(%rsp)
	movb	39(%rdx), %al
	movb	%al, 71(%rsp)
	movb	40(%rdx), %al
	movb	%al, 72(%rsp)
	movb	41(%rdx), %al
	movb	%al, 73(%rsp)
	movb	42(%rdx), %al
	movb	%al, 74(%rsp)
	movb	43(%rdx), %al
	movb	%al, 75(%rsp)
	movb	44(%rdx), %al
	movb	%al, 76(%rsp)
	movb	45(%rdx), %al
	movb	%al, 77(%rsp)
	movb	46(%rdx), %al
	movb	%al, 78(%rsp)
	movb	47(%rdx), %al
	movb	%al, 79(%rsp)
	movb	48(%rdx), %al
	movb	%al, 80(%rsp)
	movb	49(%rdx), %al
	movb	%al, 81(%rsp)
	movb	50(%rdx), %al
	movb	%al, 82(%rsp)
	movb	51(%rdx), %al
	movb	%al, 83(%rsp)
	movb	52(%rdx), %al
	movb	%al, 84(%rsp)
	movb	53(%rdx), %al
	movb	%al, 85(%rsp)
	movb	54(%rdx), %al
	movb	%al, 86(%rsp)
	movb	55(%rdx), %al
	movb	%al, 87(%rsp)
	movb	56(%rdx), %al
	movb	%al, 88(%rsp)
	movb	57(%rdx), %al
	movb	%al, 89(%rsp)
	movb	58(%rdx), %al
	movb	%al, 90(%rsp)
	movb	59(%rdx), %al
	movb	%al, 91(%rsp)
	movb	60(%rdx), %al
	movb	%al, 92(%rsp)
	movb	61(%rdx), %al
	movb	%al, 93(%rsp)
	movb	62(%rdx), %al
	movb	%al, 94(%rsp)
	movb	63(%rdx), %al
	movb	%al, 95(%rsp)
	movb	64(%rdx), %al
	movb	%al, 96(%rsp)
	movb	65(%rdx), %al
	movb	%al, 97(%rsp)
	movb	66(%rdx), %al
	movb	%al, 98(%rsp)
	movb	67(%rdx), %al
	movb	%al, 99(%rsp)
	movb	68(%rdx), %al
	movb	%al, 100(%rsp)
	movb	69(%rdx), %al
	movb	%al, 101(%rsp)
	movb	70(%rdx), %al
	movb	%al, 102(%rsp)
	movb	71(%rdx), %al
	movb	%al, 103(%rsp)
	movb	72(%rdx), %al
	movb	%al, 104(%rsp)
	movb	73(%rdx), %al
	movb	%al, 105(%rsp)
	movb	74(%rdx), %al
	movb	%al, 106(%rsp)
	movb	75(%rdx), %al
	movb	%al, 107(%rsp)
	movb	76(%rdx), %al
	movb	%al, 108(%rsp)
	movb	77(%rdx), %al
	movb	%al, 109(%rsp)
	movb	78(%rdx), %al
	movb	%al, 110(%rsp)
	movb	79(%rdx), %al
	movb	%al, 111(%rsp)
	movb	80(%rdx), %al
	movb	%al, 112(%rsp)
	movb	81(%rdx), %al
	movb	%al, 113(%rsp)
	movb	82(%rdx), %al
	movb	%al, 114(%rsp)
	movb	83(%rdx), %al
	movb	%al, 115(%rsp)
	movb	84(%rdx), %al
	movb	%al, 116(%rsp)
	movb	85(%rdx), %al
	movb	%al, 117(%rsp)
	movb	86(%rdx), %al
	movb	%al, 118(%rsp)
	movb	87(%rdx), %al
	movb	%al, 119(%rsp)
	movb	88(%rdx), %al
	movb	%al, 120(%rsp)
	movb	89(%rdx), %al
	movb	%al, 121(%rsp)
	movb	90(%rdx), %al
	movb	%al, 122(%rsp)
	movb	91(%rdx), %al
	movb	%al, 123(%rsp)
	movb	92(%rdx), %al
	movb	%al, 124(%rsp)
	movb	93(%rdx), %al
	movb	%al, 125(%rsp)
	movb	94(%rdx), %al
	movb	%al, 126(%rsp)
	movb	95(%rdx), %al
	movb	%al, 127(%rsp)
	movb	96(%rdx), %al
	movb	%al, 128(%rsp)
	movb	97(%rdx), %al
	movb	%al, 129(%rsp)
	movb	98(%rdx), %al
	movb	%al, 130(%rsp)
	movb	99(%rdx), %al
	movb	%al, 131(%rsp)
	movb	100(%rdx), %al
	movb	%al, 132(%rsp)
	movb	101(%rdx), %al
	movb	%al, 133(%rsp)
	movb	102(%rdx), %al
	movb	%al, 134(%rsp)
	movb	103(%rdx), %al
	movb	%al, 135(%rsp)
	movb	104(%rdx), %al
	movb	%al, 136(%rsp)
	movb	105(%rdx), %al
	movb	%al, 137(%rsp)
	movb	106(%rdx), %al
	movb	%al, 138(%rsp)
	movb	107(%rdx), %al
	movb	%al, 139(%rsp)
	movb	108(%rdx), %al
	movb	%al, 140(%rsp)
	movb	109(%rdx), %al
	movb	%al, 141(%rsp)
	movb	110(%rdx), %al
	movb	%al, 142(%rsp)
	movb	111(%rdx), %al
	movb	%al, 143(%rsp)
	movb	112(%rdx), %al
	movb	%al, 144(%rsp)
	movb	113(%rdx), %al
	movb	%al, 145(%rsp)
	movb	114(%rdx), %al
	movb	%al, 146(%rsp)
	movb	115(%rdx), %al
	movb	%al, 147(%rsp)
	movb	116(%rdx), %al
	movb	%al, 148(%rsp)
	movb	117(%rdx), %al
	movb	%al, 149(%rsp)
	movb	118(%rdx), %al
	movb	%al, 150(%rsp)
	movb	119(%rdx), %al
	movb	%al, 151(%rsp)
	movb	120(%rdx), %al
	movb	%al, 152(%rsp)
	movb	121(%rdx), %al
	movb	%al, 153(%rsp)
	movb	122(%rdx), %al
	movb	%al, 154(%rsp)
	movb	123(%rdx), %al
	movb	%al, 155(%rsp)
	movb	124(%rdx), %al
	movb	%al, 156(%rsp)
	movb	125(%rdx), %al
	movb	%al, 157(%rsp)
	movb	126(%rdx), %al
	movb	%al, 158(%rsp)
	movb	127(%rdx), %al
	movb	%al, 159(%rsp)
	movb	128(%rdx), %al
	movb	%al, 160(%rsp)
	movb	129(%rdx), %al
	movb	%al, 161(%rsp)
	movb	130(%rdx), %al
	movb	%al, 162(%rsp)
	movb	131(%rdx), %al
	movb	%al, 163(%rsp)
	movb	132(%rdx), %al
	movb	%al, 164(%rsp)
	movb	133(%rdx), %al
	movb	%al, 165(%rsp)
	movb	134(%rdx), %al
	movb	%al, 166(%rsp)
	movb	135(%rdx), %al
	movb	%al, 167(%rsp)
	movb	136(%rdx), %al
	movb	%al, 168(%rsp)
	movb	137(%rdx), %al
	movb	%al, 169(%rsp)
	movb	138(%rdx), %al
	movb	%al, 170(%rsp)
	movb	139(%rdx), %al
	movb	%al, 171(%rsp)
	movb	140(%rdx), %al
	movb	%al, 172(%rsp)
	movb	141(%rdx), %al
	movb	%al, 173(%rsp)
	movb	142(%rdx), %al
	movb	%al, 174(%rsp)
	movb	143(%rdx), %al
	movb	%al, 175(%rsp)
	movb	144(%rdx), %al
	movb	%al, 176(%rsp)
	movb	145(%rdx), %al
	movb	%al, 177(%rsp)
	movb	146(%rdx), %al
	movb	%al, 178(%rsp)
	movb	147(%rdx), %al
	movb	%al, 179(%rsp)
	movb	148(%rdx), %al
	movb	%al, 180(%rsp)
	movb	149(%rdx), %al
	movb	%al, 181(%rsp)
	movb	150(%rdx), %al
	movb	%al, 182(%rsp)
	movb	151(%rdx), %al
	movb	%al, 183(%rsp)
	movb	152(%rdx), %al
	movb	%al, 184(%rsp)
	movb	153(%rdx), %al
	movb	%al, 185(%rsp)
	movb	154(%rdx), %al
	movb	%al, 186(%rsp)
	movb	155(%rdx), %al
	movb	%al, 187(%rsp)
	movb	156(%rdx), %al
	movb	%al, 188(%rsp)
	movb	157(%rdx), %al
	movb	%al, 189(%rsp)
	movb	158(%rdx), %al
	movb	%al, 190(%rsp)
	movb	159(%rdx), %al
	movb	%al, 191(%rsp)
	movb	160(%rdx), %al
	movb	%al, 192(%rsp)
	movb	161(%rdx), %al
	movb	%al, 193(%rsp)
	movb	162(%rdx), %al
	movb	%al, 194(%rsp)
	movb	163(%rdx), %al
	movb	%al, 195(%rsp)
	movb	164(%rdx), %al
	movb	%al, 196(%rsp)
	movb	165(%rdx), %al
	movb	%al, 197(%rsp)
	movb	166(%rdx), %al
	movb	%al, 198(%rsp)
	movb	167(%rdx), %al
	movb	%al, 199(%rsp)
	movb	168(%rdx), %al
	movb	%al, 200(%rsp)
	movb	169(%rdx), %al
	movb	%al, 201(%rsp)
	movb	170(%rdx), %al
	movb	%al, 202(%rsp)
	movb	171(%rdx), %al
	movb	%al, 203(%rsp)
	movb	172(%rdx), %al
	movb	%al, 204(%rsp)
	movb	173(%rdx), %al
	movb	%al, 205(%rsp)
	movb	174(%rdx), %al
	movb	%al, 206(%rsp)
	movb	175(%rdx), %al
	movb	%al, 207(%rsp)
	movb	176(%rdx), %al
	movb	%al, 208(%rsp)
	movb	177(%rdx), %al
	movb	%al, 209(%rsp)
	movb	178(%rdx), %al
	movb	%al, 210(%rsp)
	movb	179(%rdx), %al
	movb	%al, 211(%rsp)
	movb	180(%rdx), %al
	movb	%al, 212(%rsp)
	movb	181(%rdx), %al
	movb	%al, 213(%rsp)
	movb	182(%rdx), %al
	movb	%al, 214(%rsp)
	movb	183(%rdx), %al
	movb	%al, 215(%rsp)
	movb	184(%rdx), %al
	movb	%al, 216(%rsp)
	movb	185(%rdx), %al
	movb	%al, 217(%rsp)
	movb	186(%rdx), %al
	movb	%al, 218(%rsp)
	movb	187(%rdx), %al
	movb	%al, 219(%rsp)
	movb	188(%rdx), %al
	movb	%al, 220(%rsp)
	movb	189(%rdx), %al
	movb	%al, 221(%rsp)
	movb	190(%rdx), %al
	movb	%al, 222(%rsp)
	movb	191(%rdx), %al
	movb	%al, 223(%rsp)
	movb	192(%rdx), %al
	movb	%al, 224(%rsp)
	movb	193(%rdx), %al
	movb	%al, 225(%rsp)
	movb	194(%rdx), %al
	movb	%al, 226(%rsp)
	movb	195(%rdx), %al
	movb	%al, 227(%rsp)
	movb	196(%rdx), %al
	movb	%al, 228(%rsp)
	movb	197(%rdx), %al
	movb	%al, 229(%rsp)
	movb	198(%rdx), %al
	movb	%al, 230(%rsp)
	movb	199(%rdx), %al
	movb	%al, 231(%rsp)
	movb	200(%rdx), %al
	movb	%al, 232(%rsp)
	movb	201(%rdx), %al
	movb	%al, 233(%rsp)
	movb	202(%rdx), %al
	movb	%al, 234(%rsp)
	movb	203(%rdx), %al
	movb	%al, 235(%rsp)
	movb	204(%rdx), %al
	movb	%al, 236(%rsp)
	movb	205(%rdx), %al
	movb	%al, 237(%rsp)
	movb	206(%rdx), %al
	movb	%al, 238(%rsp)
	movb	207(%rdx), %al
	movb	%al, 239(%rsp)
	movb	208(%rdx), %al
	movb	%al, 240(%rsp)
	movb	209(%rdx), %al
	movb	%al, 241(%rsp)
	movb	210(%rdx), %al
	movb	%al, 242(%rsp)
	movb	211(%rdx), %al
	movb	%al, 243(%rsp)
	movb	212(%rdx), %al
	movb	%al, 244(%rsp)
	movb	213(%rdx), %al
	movb	%al, 245(%rsp)
	movb	214(%rdx), %al
	movb	%al, 246(%rsp)
	movb	215(%rdx), %al
	movb	%al, 247(%rsp)
	movb	216(%rdx), %al
	movb	%al, 248(%rsp)
	movb	217(%rdx), %al
	movb	%al, 249(%rsp)
	movb	218(%rdx), %al
	movb	%al, 250(%rsp)
	movb	219(%rdx), %al
	movb	%al, 251(%rsp)
	movb	220(%rdx), %al
	movb	%al, 252(%rsp)
	movb	221(%rdx), %al
	movb	%al, 253(%rsp)
	movb	222(%rdx), %al
	movb	%al, 254(%rsp)
	movb	223(%rdx), %al
	movb	%al, 255(%rsp)
	movb	224(%rdx), %al
	movb	%al, 256(%rsp)
	movb	225(%rdx), %al
	movb	%al, 257(%rsp)
	movb	226(%rdx), %al
	movb	%al, 258(%rsp)
	movb	227(%rdx), %al
	movb	%al, 259(%rsp)
	movb	228(%rdx), %al
	movb	%al, 260(%rsp)
	movb	229(%rdx), %al
	movb	%al, 261(%rsp)
	movb	230(%rdx), %al
	movb	%al, 262(%rsp)
	movb	231(%rdx), %al
	movb	%al, 263(%rsp)
	movb	232(%rdx), %al
	movb	%al, 264(%rsp)
	movb	233(%rdx), %al
	movb	%al, 265(%rsp)
	movb	234(%rdx), %al
	movb	%al, 266(%rsp)
	movb	235(%rdx), %al
	movb	%al, 267(%rsp)
	movb	236(%rdx), %al
	movb	%al, 268(%rsp)
	movb	237(%rdx), %al
	movb	%al, 269(%rsp)
	movb	238(%rdx), %al
	movb	%al, 270(%rsp)
	movb	239(%rdx), %al
	movb	%al, 271(%rsp)
	movb	240(%rdx), %al
	movb	%al, 272(%rsp)
	movb	241(%rdx), %al
	movb	%al, 273(%rsp)
	movb	242(%rdx), %al
	movb	%al, 274(%rsp)
	movb	243(%rdx), %al
	movb	%al, 275(%rsp)
	movb	244(%rdx), %al
	movb	%al, 276(%rsp)
	movb	245(%rdx), %al
	movb	%al, 277(%rsp)
	movb	246(%rdx), %al
	movb	%al, 278(%rsp)
	movb	247(%rdx), %al
	movb	%al, 279(%rsp)
	movb	248(%rdx), %al
	movb	%al, 280(%rsp)
	movb	249(%rdx), %al
	movb	%al, 281(%rsp)
	movb	250(%rdx), %al
	movb	%al, 282(%rsp)
	movb	251(%rdx), %al
	movb	%al, 283(%rsp)
	movb	252(%rdx), %al
	movb	%al, 284(%rsp)
	movb	253(%rdx), %al
	movb	%al, 285(%rsp)
	movb	254(%rdx), %al
	movb	%al, 286(%rsp)
	movb	255(%rdx), %al
	movb	%al, 287(%rsp)
	movb	256(%rdx), %al
	movb	%al, 288(%rsp)
	movb	257(%rdx), %al
	movb	%al, 289(%rsp)
	movb	258(%rdx), %al
	movb	%al, 290(%rsp)
	movb	259(%rdx), %al
	movb	%al, 291(%rsp)
	movb	260(%rdx), %al
	movb	%al, 292(%rsp)
	movb	261(%rdx), %al
	movb	%al, 293(%rsp)
	movb	262(%rdx), %al
	movb	%al, 294(%rsp)
	movb	263(%rdx), %al
	movb	%al, 295(%rsp)
	movb	264(%rdx), %al
	movb	%al, 296(%rsp)
	movb	265(%rdx), %al
	movb	%al, 297(%rsp)
	movb	266(%rdx), %al
	movb	%al, 298(%rsp)
	movb	267(%rdx), %al
	movb	%al, 299(%rsp)
	movb	268(%rdx), %al
	movb	%al, 300(%rsp)
	movb	269(%rdx), %al
	movb	%al, 301(%rsp)
	movb	270(%rdx), %al
	movb	%al, 302(%rsp)
	movb	271(%rdx), %al
	movb	%al, 303(%rsp)
	movb	272(%rdx), %al
	movb	%al, 304(%rsp)
	movb	273(%rdx), %al
	movb	%al, 305(%rsp)
	movb	274(%rdx), %al
	movb	%al, 306(%rsp)
	movb	275(%rdx), %al
	movb	%al, 307(%rsp)
	movb	276(%rdx), %al
	movb	%al, 308(%rsp)
	movb	277(%rdx), %al
	movb	%al, 309(%rsp)
	movb	278(%rdx), %al
	movb	%al, 310(%rsp)
	movb	279(%rdx), %al
	movb	%al, 311(%rsp)
	movb	280(%rdx), %al
	movb	%al, 312(%rsp)
	movb	281(%rdx), %al
	movb	%al, 313(%rsp)
	movb	282(%rdx), %al
	movb	%al, 314(%rsp)
	movb	283(%rdx), %al
	movb	%al, 315(%rsp)
	movb	284(%rdx), %al
	movb	%al, 316(%rsp)
	movb	285(%rdx), %al
	movb	%al, 317(%rsp)
	movb	286(%rdx), %al
	movb	%al, 318(%rsp)
	movb	287(%rdx), %al
	movb	%al, 319(%rsp)
	movb	288(%rdx), %al
	movb	%al, 320(%rsp)
	movb	289(%rdx), %al
	movb	%al, 321(%rsp)
	movb	290(%rdx), %al
	movb	%al, 322(%rsp)
	movb	291(%rdx), %al
	movb	%al, 323(%rsp)
	movb	292(%rdx), %al
	movb	%al, 324(%rsp)
	movb	293(%rdx), %al
	movb	%al, 325(%rsp)
	movb	294(%rdx), %al
	movb	%al, 326(%rsp)
	movb	295(%rdx), %al
	movb	%al, 327(%rsp)
	movb	296(%rdx), %al
	movb	%al, 328(%rsp)
	movb	297(%rdx), %al
	movb	%al, 329(%rsp)
	movb	298(%rdx), %al
	movb	%al, 330(%rsp)
	movb	299(%rdx), %al
	movb	%al, 331(%rsp)
	movb	300(%rdx), %al
	movb	%al, 332(%rsp)
	movb	301(%rdx), %al
	movb	%al, 333(%rsp)
	movb	302(%rdx), %al
	movb	%al, 334(%rsp)
	movb	303(%rdx), %al
	movb	%al, 335(%rsp)
	movb	304(%rdx), %al
	movb	%al, 336(%rsp)
	movb	305(%rdx), %al
	movb	%al, 337(%rsp)
	movb	306(%rdx), %al
	movb	%al, 338(%rsp)
	movb	307(%rdx), %al
	movb	%al, 339(%rsp)
	movb	308(%rdx), %al
	movb	%al, 340(%rsp)
	movb	309(%rdx), %al
	movb	%al, 341(%rsp)
	movb	310(%rdx), %al
	movb	%al, 342(%rsp)
	movb	311(%rdx), %al
	movb	%al, 343(%rsp)
	movb	312(%rdx), %al
	movb	%al, 344(%rsp)
	movb	313(%rdx), %al
	movb	%al, 345(%rsp)
	movb	314(%rdx), %al
	movb	%al, 346(%rsp)
	movb	315(%rdx), %al
	movb	%al, 347(%rsp)
	movb	316(%rdx), %al
	movb	%al, 348(%rsp)
	movb	317(%rdx), %al
	movb	%al, 349(%rsp)
	movb	318(%rdx), %al
	movb	%al, 350(%rsp)
	movb	319(%rdx), %al
	movb	%al, 351(%rsp)
	movb	320(%rdx), %al
	movb	%al, 352(%rsp)
	movb	321(%rdx), %al
	movb	%al, 353(%rsp)
	movb	322(%rdx), %al
	movb	%al, 354(%rsp)
	movb	323(%rdx), %al
	movb	%al, 355(%rsp)
	movb	324(%rdx), %al
	movb	%al, 356(%rsp)
	movb	325(%rdx), %al
	movb	%al, 357(%rsp)
	movb	326(%rdx), %al
	movb	%al, 358(%rsp)
	movb	327(%rdx), %al
	movb	%al, 359(%rsp)
	movb	328(%rdx), %al
	movb	%al, 360(%rsp)
	movb	329(%rdx), %al
	movb	%al, 361(%rsp)
	movb	330(%rdx), %al
	movb	%al, 362(%rsp)
	movb	331(%rdx), %al
	movb	%al, 363(%rsp)
	movb	332(%rdx), %al
	movb	%al, 364(%rsp)
	movb	333(%rdx), %al
	movb	%al, 365(%rsp)
	movb	334(%rdx), %al
	movb	%al, 366(%rsp)
	movb	335(%rdx), %al
	movb	%al, 367(%rsp)
	movb	336(%rdx), %al
	movb	%al, 368(%rsp)
	movb	337(%rdx), %al
	movb	%al, 369(%rsp)
	movb	338(%rdx), %al
	movb	%al, 370(%rsp)
	movb	339(%rdx), %al
	movb	%al, 371(%rsp)
	movb	340(%rdx), %al
	movb	%al, 372(%rsp)
	movb	341(%rdx), %al
	movb	%al, 373(%rsp)
	movb	342(%rdx), %al
	movb	%al, 374(%rsp)
	movb	343(%rdx), %al
	movb	%al, 375(%rsp)
	movb	344(%rdx), %al
	movb	%al, 376(%rsp)
	movb	345(%rdx), %al
	movb	%al, 377(%rsp)
	movb	346(%rdx), %al
	movb	%al, 378(%rsp)
	movb	347(%rdx), %al
	movb	%al, 379(%rsp)
	movb	348(%rdx), %al
	movb	%al, 380(%rsp)
	movb	349(%rdx), %al
	movb	%al, 381(%rsp)
	movb	350(%rdx), %al
	movb	%al, 382(%rsp)
	movb	351(%rdx), %al
	movb	%al, 383(%rsp)
	movb	352(%rdx), %al
	movb	%al, 384(%rsp)
	movb	353(%rdx), %al
	movb	%al, 385(%rsp)
	movb	354(%rdx), %al
	movb	%al, 386(%rsp)
	movb	355(%rdx), %al
	movb	%al, 387(%rsp)
	movb	356(%rdx), %al
	movb	%al, 388(%rsp)
	movb	357(%rdx), %al
	movb	%al, 389(%rsp)
	movb	358(%rdx), %al
	movb	%al, 390(%rsp)
	movb	359(%rdx), %al
	movb	%al, 391(%rsp)
	movb	360(%rdx), %al
	movb	%al, 392(%rsp)
	movb	361(%rdx), %al
	movb	%al, 393(%rsp)
	movb	362(%rdx), %al
	movb	%al, 394(%rsp)
	movb	363(%rdx), %al
	movb	%al, 395(%rsp)
	movb	364(%rdx), %al
	movb	%al, 396(%rsp)
	movb	365(%rdx), %al
	movb	%al, 397(%rsp)
	movb	366(%rdx), %al
	movb	%al, 398(%rsp)
	movb	367(%rdx), %al
	movb	%al, 399(%rsp)
	movb	368(%rdx), %al
	movb	%al, 400(%rsp)
	movb	369(%rdx), %al
	movb	%al, 401(%rsp)
	movb	370(%rdx), %al
	movb	%al, 402(%rsp)
	movb	371(%rdx), %al
	movb	%al, 403(%rsp)
	movb	372(%rdx), %al
	movb	%al, 404(%rsp)
	movb	373(%rdx), %al
	movb	%al, 405(%rsp)
	movb	374(%rdx), %al
	movb	%al, 406(%rsp)
	movb	375(%rdx), %al
	movb	%al, 407(%rsp)
	movb	376(%rdx), %al
	movb	%al, 408(%rsp)
	movb	377(%rdx), %al
	movb	%al, 409(%rsp)
	movb	378(%rdx), %al
	movb	%al, 410(%rsp)
	movb	379(%rdx), %al
	movb	%al, 411(%rsp)
	movb	380(%rdx), %al
	movb	%al, 412(%rsp)
	movb	381(%rdx), %al
	movb	%al, 413(%rsp)
	movb	382(%rdx), %al
	movb	%al, 414(%rsp)
	movb	383(%rdx), %al
	movb	%al, 415(%rsp)
	movb	384(%rdx), %al
	movb	%al, 416(%rsp)
	movb	385(%rdx), %al
	movb	%al, 417(%rsp)
	movb	386(%rdx), %al
	movb	%al, 418(%rsp)
	movb	387(%rdx), %al
	movb	%al, 419(%rsp)
	movb	388(%rdx), %al
	movb	%al, 420(%rsp)
	movb	389(%rdx), %al
	movb	%al, 421(%rsp)
	movb	390(%rdx), %al
	movb	%al, 422(%rsp)
	movb	391(%rdx), %al
	movb	%al, 423(%rsp)
	movb	392(%rdx), %al
	movb	%al, 424(%rsp)
	movb	393(%rdx), %al
	movb	%al, 425(%rsp)
	movb	394(%rdx), %al
	movb	%al, 426(%rsp)
	movb	395(%rdx), %al
	movb	%al, 427(%rsp)
	movb	396(%rdx), %al
	movb	%al, 428(%rsp)
	movb	397(%rdx), %al
	movb	%al, 429(%rsp)
	movb	398(%rdx), %al
	movb	%al, 430(%rsp)
	movb	399(%rdx), %al
	movb	%al, 431(%rsp)
	movb	400(%rdx), %al
	movb	%al, 432(%rsp)
	movb	401(%rdx), %al
	movb	%al, 433(%rsp)
	movb	402(%rdx), %al
	movb	%al, 434(%rsp)
	movb	403(%rdx), %al
	movb	%al, 435(%rsp)
	movb	404(%rdx), %al
	movb	%al, 436(%rsp)
	movb	405(%rdx), %al
	movb	%al, 437(%rsp)
	movb	406(%rdx), %al
	movb	%al, 438(%rsp)
	movb	407(%rdx), %al
	movb	%al, 439(%rsp)
	movb	408(%rdx), %al
	movb	%al, 440(%rsp)
	movb	409(%rdx), %al
	movb	%al, 441(%rsp)
	movb	410(%rdx), %al
	movb	%al, 442(%rsp)
	movb	411(%rdx), %al
	movb	%al, 443(%rsp)
	movb	412(%rdx), %al
	movb	%al, 444(%rsp)
	movb	413(%rdx), %al
	movb	%al, 445(%rsp)
	movb	414(%rdx), %al
	movb	%al, 446(%rsp)
	movb	415(%rdx), %al
	movb	%al, 447(%rsp)
	movb	416(%rdx), %al
	movb	%al, 448(%rsp)
	movb	417(%rdx), %al
	movb	%al, 449(%rsp)
	movb	418(%rdx), %al
	movb	%al, 450(%rsp)
	movb	419(%rdx), %al
	movb	%al, 451(%rsp)
	movb	420(%rdx), %al
	movb	%al, 452(%rsp)
	movb	421(%rdx), %al
	movb	%al, 453(%rsp)
	movb	422(%rdx), %al
	movb	%al, 454(%rsp)
	movb	423(%rdx), %al
	movb	%al, 455(%rsp)
	movb	424(%rdx), %al
	movb	%al, 456(%rsp)
	movb	425(%rdx), %al
	movb	%al, 457(%rsp)
	movb	426(%rdx), %al
	movb	%al, 458(%rsp)
	movb	427(%rdx), %al
	movb	%al, 459(%rsp)
	movb	428(%rdx), %al
	movb	%al, 460(%rsp)
	movb	429(%rdx), %al
	movb	%al, 461(%rsp)
	movb	430(%rdx), %al
	movb	%al, 462(%rsp)
	movb	431(%rdx), %al
	movb	%al, 463(%rsp)
	movb	432(%rdx), %al
	movb	%al, 464(%rsp)
	movb	433(%rdx), %al
	movb	%al, 465(%rsp)
	movb	434(%rdx), %al
	movb	%al, 466(%rsp)
	movb	435(%rdx), %al
	movb	%al, 467(%rsp)
	movb	436(%rdx), %al
	movb	%al, 468(%rsp)
	movb	437(%rdx), %al
	movb	%al, 469(%rsp)
	movb	438(%rdx), %al
	movb	%al, 470(%rsp)
	movb	439(%rdx), %al
	movb	%al, 471(%rsp)
	movb	440(%rdx), %al
	movb	%al, 472(%rsp)
	movb	441(%rdx), %al
	movb	%al, 473(%rsp)
	movb	442(%rdx), %al
	movb	%al, 474(%rsp)
	movb	443(%rdx), %al
	movb	%al, 475(%rsp)
	movb	444(%rdx), %al
	movb	%al, 476(%rsp)
	movb	445(%rdx), %al
	movb	%al, 477(%rsp)
	movb	446(%rdx), %al
	movb	%al, 478(%rsp)
	movb	447(%rdx), %al
	movb	%al, 479(%rsp)
	movb	448(%rdx), %al
	movb	%al, 480(%rsp)
	movb	449(%rdx), %al
	movb	%al, 481(%rsp)
	movb	450(%rdx), %al
	movb	%al, 482(%rsp)
	movb	451(%rdx), %al
	movb	%al, 483(%rsp)
	movb	452(%rdx), %al
	movb	%al, 484(%rsp)
	movb	453(%rdx), %al
	movb	%al, 485(%rsp)
	movb	454(%rdx), %al
	movb	%al, 486(%rsp)
	movb	455(%rdx), %al
	movb	%al, 487(%rsp)
	movb	456(%rdx), %al
	movb	%al, 488(%rsp)
	movb	457(%rdx), %al
	movb	%al, 489(%rsp)
	movb	458(%rdx), %al
	movb	%al, 490(%rsp)
	movb	459(%rdx), %al
	movb	%al, 491(%rsp)
	movb	460(%rdx), %al
	movb	%al, 492(%rsp)
	movb	461(%rdx), %al
	movb	%al, 493(%rsp)
	movb	462(%rdx), %al
	movb	%al, 494(%rsp)
	movb	463(%rdx), %al
	movb	%al, 495(%rsp)
	movb	464(%rdx), %al
	movb	%al, 496(%rsp)
	movb	465(%rdx), %al
	movb	%al, 497(%rsp)
	movb	466(%rdx), %al
	movb	%al, 498(%rsp)
	movb	467(%rdx), %al
	movb	%al, 499(%rsp)
	movb	468(%rdx), %al
	movb	%al, 500(%rsp)
	movb	469(%rdx), %al
	movb	%al, 501(%rsp)
	movb	470(%rdx), %al
	movb	%al, 502(%rsp)
	movb	471(%rdx), %al
	movb	%al, 503(%rsp)
	movb	472(%rdx), %al
	movb	%al, 504(%rsp)
	movb	473(%rdx), %al
	movb	%al, 505(%rsp)
	movb	474(%rdx), %al
	movb	%al, 506(%rsp)
	movb	475(%rdx), %al
	movb	%al, 507(%rsp)
	movb	476(%rdx), %al
	movb	%al, 508(%rsp)
	movb	477(%rdx), %al
	movb	%al, 509(%rsp)
	movb	478(%rdx), %al
	movb	%al, 510(%rsp)
	movb	479(%rdx), %al
	movb	%al, 511(%rsp)
	movb	480(%rdx), %al
	movb	%al, 512(%rsp)
	movb	481(%rdx), %al
	movb	%al, 513(%rsp)
	movb	482(%rdx), %al
	movb	%al, 514(%rsp)
	movb	483(%rdx), %al
	movb	%al, 515(%rsp)
	movb	484(%rdx), %al
	movb	%al, 516(%rsp)
	movb	485(%rdx), %al
	movb	%al, 517(%rsp)
	movb	486(%rdx), %al
	movb	%al, 518(%rsp)
	movb	487(%rdx), %al
	movb	%al, 519(%rsp)
	movb	488(%rdx), %al
	movb	%al, 520(%rsp)
	movb	489(%rdx), %al
	movb	%al, 521(%rsp)
	movb	490(%rdx), %al
	movb	%al, 522(%rsp)
	movb	491(%rdx), %al
	movb	%al, 523(%rsp)
	movb	492(%rdx), %al
	movb	%al, 524(%rsp)
	movb	493(%rdx), %al
	movb	%al, 525(%rsp)
	movb	494(%rdx), %al
	movb	%al, 526(%rsp)
	movb	495(%rdx), %al
	movb	%al, 527(%rsp)
	movb	496(%rdx), %al
	movb	%al, 528(%rsp)
	movb	497(%rdx), %al
	movb	%al, 529(%rsp)
	movb	498(%rdx), %al
	movb	%al, 530(%rsp)
	movb	499(%rdx), %al
	movb	%al, 531(%rsp)
	movb	500(%rdx), %al
	movb	%al, 532(%rsp)
	movb	501(%rdx), %al
	movb	%al, 533(%rsp)
	movb	502(%rdx), %al
	movb	%al, 534(%rsp)
	movb	503(%rdx), %al
	movb	%al, 535(%rsp)
	movb	504(%rdx), %al
	movb	%al, 536(%rsp)
	movb	505(%rdx), %al
	movb	%al, 537(%rsp)
	movb	506(%rdx), %al
	movb	%al, 538(%rsp)
	movb	507(%rdx), %al
	movb	%al, 539(%rsp)
	movb	508(%rdx), %al
	movb	%al, 540(%rsp)
	movb	509(%rdx), %al
	movb	%al, 541(%rsp)
	movb	510(%rdx), %al
	movb	%al, 542(%rsp)
	movb	511(%rdx), %al
	movb	%al, 543(%rsp)
	movb	512(%rdx), %al
	movb	%al, 544(%rsp)
	movb	513(%rdx), %al
	movb	%al, 545(%rsp)
	movb	514(%rdx), %al
	movb	%al, 546(%rsp)
	movb	515(%rdx), %al
	movb	%al, 547(%rsp)
	movb	516(%rdx), %al
	movb	%al, 548(%rsp)
	movb	517(%rdx), %al
	movb	%al, 549(%rsp)
	movb	518(%rdx), %al
	movb	%al, 550(%rsp)
	movb	519(%rdx), %al
	movb	%al, 551(%rsp)
	movb	520(%rdx), %al
	movb	%al, 552(%rsp)
	movb	521(%rdx), %al
	movb	%al, 553(%rsp)
	movb	522(%rdx), %al
	movb	%al, 554(%rsp)
	movb	523(%rdx), %al
	movb	%al, 555(%rsp)
	movb	524(%rdx), %al
	movb	%al, 556(%rsp)
	movb	525(%rdx), %al
	movb	%al, 557(%rsp)
	movb	526(%rdx), %al
	movb	%al, 558(%rsp)
	movb	527(%rdx), %al
	movb	%al, 559(%rsp)
	movb	528(%rdx), %al
	movb	%al, 560(%rsp)
	movb	529(%rdx), %al
	movb	%al, 561(%rsp)
	movb	530(%rdx), %al
	movb	%al, 562(%rsp)
	movb	531(%rdx), %al
	movb	%al, 563(%rsp)
	movb	532(%rdx), %al
	movb	%al, 564(%rsp)
	movb	533(%rdx), %al
	movb	%al, 565(%rsp)
	movb	534(%rdx), %al
	movb	%al, 566(%rsp)
	movb	535(%rdx), %al
	movb	%al, 567(%rsp)
	movb	536(%rdx), %al
	movb	%al, 568(%rsp)
	movb	537(%rdx), %al
	movb	%al, 569(%rsp)
	movb	538(%rdx), %al
	movb	%al, 570(%rsp)
	movb	539(%rdx), %al
	movb	%al, 571(%rsp)
	movb	540(%rdx), %al
	movb	%al, 572(%rsp)
	movb	541(%rdx), %al
	movb	%al, 573(%rsp)
	movb	542(%rdx), %al
	movb	%al, 574(%rsp)
	movb	543(%rdx), %al
	movb	%al, 575(%rsp)
	movb	544(%rdx), %al
	movb	%al, 576(%rsp)
	movb	545(%rdx), %al
	movb	%al, 577(%rsp)
	movb	546(%rdx), %al
	movb	%al, 578(%rsp)
	movb	547(%rdx), %al
	movb	%al, 579(%rsp)
	movb	548(%rdx), %al
	movb	%al, 580(%rsp)
	movb	549(%rdx), %al
	movb	%al, 581(%rsp)
	movb	550(%rdx), %al
	movb	%al, 582(%rsp)
	movb	551(%rdx), %al
	movb	%al, 583(%rsp)
	movb	552(%rdx), %al
	movb	%al, 584(%rsp)
	movb	553(%rdx), %al
	movb	%al, 585(%rsp)
	movb	554(%rdx), %al
	movb	%al, 586(%rsp)
	movb	555(%rdx), %al
	movb	%al, 587(%rsp)
	movb	556(%rdx), %al
	movb	%al, 588(%rsp)
	movb	557(%rdx), %al
	movb	%al, 589(%rsp)
	movb	558(%rdx), %al
	movb	%al, 590(%rsp)
	movb	559(%rdx), %al
	movb	%al, 591(%rsp)
	movl	$15, %edx
	movl	%edx, 788(%rsp)
	movl	%edx, 792(%rsp)
	movl	%edx, 796(%rsp)
	movl	%edx, 800(%rsp)
	movl	%edx, 804(%rsp)
	movl	%edx, 808(%rsp)
	movl	%edx, 812(%rsp)
	movl	%edx, 816(%rsp)
	movl	%edx, 820(%rsp)
	movl	%edx, 824(%rsp)
	movl	%edx, 828(%rsp)
	movl	%edx, 832(%rsp)
	movl	%edx, 836(%rsp)
	movl	%edx, 840(%rsp)
	movl	%edx, 844(%rsp)
	movl	%edx, 848(%rsp)
	movl	%edx, 852(%rsp)
	movl	%edx, 856(%rsp)
	movl	%edx, 860(%rsp)
	movl	%edx, 864(%rsp)
	movl	%edx, 868(%rsp)
	movl	%edx, 872(%rsp)
	movl	%edx, 876(%rsp)
	movl	%edx, 880(%rsp)
	movl	%edx, 884(%rsp)
	movl	%edx, 888(%rsp)
	movl	%edx, 892(%rsp)
	movl	%edx, 896(%rsp)
	movl	%edx, 900(%rsp)
	movl	%edx, 904(%rsp)
	movl	%edx, 908(%rsp)
	movl	%edx, 912(%rsp)
	movl	%edx, 916(%rsp)
	movl	%edx, 920(%rsp)
	movl	%edx, 924(%rsp)
	movq	%r9, 600(%rsp)
	movq	%r8, 608(%rsp)
	leaq	32(%rsp), %rcx
	leaq	648(%rsp), %rax
	leaq	788(%rsp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rcx
	leaq	-1304(%rsp), %rsp
	call	.Lwots_chains_refill_x4$1
.Lwots_pkfromsig$3:
	leaq	1304(%rsp), %rsp
	movq	600(%rsp), %r9
	movq	608(%rsp), %r8
	lfence
	movq	$0, %rax
	leaq	616(%rsp), %rax
	movq	(%r9), %rdx
	movq	%rdx, (%rax)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rax)
	leaq	616(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$1, 16(%r10)
	movl	20(%r9), %edx
	leaq	616(%rsp), %r10
	movl	%edx, 20(%r10)
	movq	592(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	%r9, 592(%rsp)
	leaq	616(%rsp), %r9
	leaq	32(%rsp), %rcx
	movq	%rax, %rdi
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkfromsig$2:
	leaq	40(%rsp), %rsp
	movq	%rdi, %rdx
	movq	592(%rsp), %r9
	lfence
	movq	$0, %rax
	ret
.Lwots_sign$1:
	leaq	56(%rsp), %rdi
	movq	%rdi, %r10
	movq	$0, %r11
	movl	$0, %ecx
	movl	$0, %ebx
	jmp 	.Lwots_sign$72
.Lwots_sign$73:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$72:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$73
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, (%r10)
	jmp 	.Lwots_sign$70
.Lwots_sign$71:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$70:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$71
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 4(%r10)
	jmp 	.Lwots_sign$68
.Lwots_sign$69:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$68:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$69
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 8(%r10)
	jmp 	.Lwots_sign$66
.Lwots_sign$67:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$66:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$67
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 12(%r10)
	jmp 	.Lwots_sign$64
.Lwots_sign$65:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$64:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$65
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 16(%r10)
	jmp 	.Lwots_sign$62
.Lwots_sign$63:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$62:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$63
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 20(%r10)
	jmp 	.Lwots_sign$60
.Lwots_sign$61:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$60:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$61
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 24(%r10)
	jmp 	.Lwots_sign$58
.Lwots_sign$59:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$58:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$59
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 28(%r10)
	jmp 	.Lwots_sign$56
.Lwots_sign$57:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$56:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$57
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 32(%r10)
	jmp 	.Lwots_sign$54
.Lwots_sign$55:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$54:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$55
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 36(%r10)
	jmp 	.Lwots_sign$52
.Lwots_sign$53:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$52:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$53
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 40(%r10)
	jmp 	.Lwots_sign$50
.Lwots_sign$51:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$50:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$51
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 44(%r10)
	jmp 	.Lwots_sign$48
.Lwots_sign$49:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$48:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$49
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 48(%r10)
	jmp 	.Lwots_sign$46
.Lwots_sign$47:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$46:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$47
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 52(%r10)
	jmp 	.Lwots_sign$44
.Lwots_sign$45:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$44:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$45
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 56(%r10)
	jmp 	.Lwots_sign$42
.Lwots_sign$43:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$42:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$43
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 60(%r10)
	jmp 	.Lwots_sign$40
.Lwots_sign$41:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$40:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$41
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 64(%r10)
	jmp 	.Lwots_sign$38
.Lwots_sign$39:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$38:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$39
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 68(%r10)
	jmp 	.Lwots_sign$36
.Lwots_sign$37:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$36:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$37
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 72(%r10)
	jmp 	.Lwots_sign$34
.Lwots_sign$35:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$34:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$35
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 76(%r10)
	jmp 	.Lwots_sign$32
.Lwots_sign$33:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$32:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$33
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 80(%r10)
	jmp 	.Lwots_sign$30
.Lwots_sign$31:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$30:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$31
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 84(%r10)
	jmp 	.Lwots_sign$28
.Lwots_sign$29:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$28:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$29
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 88(%r10)
	jmp 	.Lwots_sign$26
.Lwots_sign$27:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$26:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$27
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 92(%r10)
	jmp 	.Lwots_sign$24
.Lwots_sign$25:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$24:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$25
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 96(%r10)
	jmp 	.Lwots_sign$22
.Lwots_sign$23:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$22:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$23
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 100(%r10)
	jmp 	.Lwots_sign$20
.Lwots_sign$21:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$20:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$21
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 104(%r10)
	jmp 	.Lwots_sign$18
.Lwots_sign$19:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$18:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$19
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 108(%r10)
	jmp 	.Lwots_sign$16
.Lwots_sign$17:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$16:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$17
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 112(%r10)
	jmp 	.Lwots_sign$14
.Lwots_sign$15:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$14:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$15
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 116(%r10)
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$12:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$13
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 120(%r10)
	jmp 	.Lwots_sign$10
.Lwots_sign$11:
	shll	$8, %ebx
	movzbl	(%rsi,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$10:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$11
	movl	%ebx, %r11d
	addl	$-4, %ecx
	shrq	%cl, %r11
	andq	$15, %r11
	movl	%r11d, 124(%r10)
	movq	%rdi, %rcx
	movl	$480, %esi
	subl	(%rcx), %esi
	subl	4(%rcx), %esi
	subl	8(%rcx), %esi
	subl	12(%rcx), %esi
	subl	16(%rcx), %esi
	subl	20(%rcx), %esi
	subl	24(%rcx), %esi
	subl	28(%rcx), %esi
	subl	32(%rcx), %esi
	subl	36(%rcx), %esi
	subl	40(%rcx), %esi
	subl	44(%rcx), %esi
	subl	48(%rcx), %esi
	subl	52(%rcx), %esi
	subl	56(%rcx), %esi
	subl	60(%rcx), %esi
	subl	64(%rcx), %esi
	subl	68(%rcx), %esi
	subl	72(%rcx), %esi
	subl	76(%rcx), %esi
	subl	80(%rcx), %esi
	subl	84(%rcx), %esi
	subl	88(%rcx), %esi
	subl	92(%rcx), %esi
	subl	96(%rcx), %esi
	subl	100(%rcx), %esi
	subl	104(%rcx), %esi
	subl	108(%rcx), %esi
	subl	112(%rcx), %esi
	subl	116(%rcx), %esi
	subl	120(%rcx), %esi
	subl	124(%rcx), %esi
	shll	$4, %esi
	movl	%esi, %ecx
	shrl	$0, %ecx
	andl	$255, %ecx
	movb	%cl, 337(%rsp)
	shrl	$8, %esi
	andl	$255, %esi
	movb	%sil, 336(%rsp)
	leaq	128(%rdi), %rdi
	leaq	336(%rsp), %rsi
	movq	$0, %r10
	movl	$0, %ecx
	movl	$0, %r11d
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %r11d
	movzbl	(%rsi,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_sign$8:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$9
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, (%rdi)
	jmp 	.Lwots_sign$6
.Lwots_sign$7:
	shll	$8, %r11d
	movzbl	(%rsi,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_sign$6:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$7
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 4(%rdi)
	jmp 	.Lwots_sign$4
.Lwots_sign$5:
	shll	$8, %r11d
	movzbl	(%rsi,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_sign$4:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$5
	movl	%r11d, %r10d
	addl	$-4, %ecx
	shrq	%cl, %r10
	andq	$15, %r10
	movl	%r10d, 8(%rdi)
	leaq	24(%rsp), %rcx
	movq	(%r9), %rsi
	movq	%rsi, (%rcx)
	movq	8(%r9), %rsi
	movq	%rsi, 8(%rcx)
	movq	16(%r9), %rsi
	movq	%rsi, 16(%rcx)
	movq	24(%r9), %rsi
	movq	%rsi, 24(%rcx)
	leaq	24(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$5, 16(%r10)
	movl	20(%r9), %ecx
	leaq	24(%rsp), %r10
	movl	%ecx, 20(%r10)
	movq	%r9, 8(%rsp)
	movq	%r8, 16(%rsp)
	leaq	24(%rsp), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	leaq	-760(%rsp), %rsp
	call	.Lwots_sk_x4$1
.Lwots_sign$3:
	leaq	760(%rsp), %rsp
	movq	8(%rsp), %r9
	movq	16(%rsp), %r8
	lfence
	movq	$0, %rax
	movl	$0, %edx
	movl	%edx, 196(%rsp)
	movl	%edx, 200(%rsp)
	movl	%edx, 204(%rsp)
	movl	%edx, 208(%rsp)
	movl	%edx, 212(%rsp)
	movl	%edx, 216(%rsp)
	movl	%edx, 220(%rsp)
	movl	%edx, 224(%rsp)
	movl	%edx, 228(%rsp)
	movl	%edx, 232(%rsp)
	movl	%edx, 236(%rsp)
	movl	%edx, 240(%rsp)
	movl	%edx, 244(%rsp)
	movl	%edx, 248(%rsp)
	movl	%edx, 252(%rsp)
	movl	%edx, 256(%rsp)
	movl	%edx, 260(%rsp)
	movl	%edx, 264(%rsp)
	movl	%edx, 268(%rsp)
	movl	%edx, 272(%rsp)
	movl	%edx, 276(%rsp)
	movl	%edx, 280(%rsp)
	movl	%edx, 284(%rsp)
	movl	%edx, 288(%rsp)
	movl	%edx, 292(%rsp)
	movl	%edx, 296(%rsp)
	movl	%edx, 300(%rsp)
	movl	%edx, 304(%rsp)
	movl	%edx, 308(%rsp)
	movl	%edx, 312(%rsp)
	movl	%edx, 316(%rsp)
	movl	%edx, 320(%rsp)
	movl	%edx, 324(%rsp)
	movl	%edx, 328(%rsp)
	movl	%edx, 332(%rsp)
	movq	%r9, 16(%rsp)
	leaq	196(%rsp), %rax
	leaq	56(%rsp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rcx
	leaq	-1304(%rsp), %rsp
	call	.Lwots_chains_refill_x4$1
.Lwots_sign$2:
	leaq	1304(%rsp), %rsp
	movq	16(%rsp), %r9
	lfence
	movq	$0, %rax
	ret
.Lwots_pkgen$1:
	movq	%rdi, 592(%rsp)
	leaq	616(%rsp), %rcx
	movq	(%r9), %rsi
	movq	%rsi, (%rcx)
	movq	8(%r9), %rsi
	movq	%rsi, 8(%rcx)
	movq	16(%r9), %rsi
	movq	%rsi, 16(%rcx)
	movq	24(%r9), %rsi
	movq	%rsi, 24(%rcx)
	leaq	616(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$5, 16(%r10)
	movl	20(%r9), %ecx
	leaq	616(%rsp), %r10
	movl	%ecx, 20(%r10)
	movq	%r9, 600(%rsp)
	movq	%r8, 608(%rsp)
	leaq	32(%rsp), %rcx
	leaq	616(%rsp), %rsi
	movq	%rcx, %rdi
	leaq	-760(%rsp), %rsp
	call	.Lwots_sk_x4$1
.Lwots_pkgen$4:
	leaq	760(%rsp), %rsp
	movq	600(%rsp), %r9
	movq	608(%rsp), %r8
	lfence
	movq	$0, %rcx
	movl	$0, %edx
	movl	%edx, 648(%rsp)
	movl	%edx, 652(%rsp)
	movl	%edx, 656(%rsp)
	movl	%edx, 660(%rsp)
	movl	%edx, 664(%rsp)
	movl	%edx, 668(%rsp)
	movl	%edx, 672(%rsp)
	movl	%edx, 676(%rsp)
	movl	%edx, 680(%rsp)
	movl	%edx, 684(%rsp)
	movl	%edx, 688(%rsp)
	movl	%edx, 692(%rsp)
	movl	%edx, 696(%rsp)
	movl	%edx, 700(%rsp)
	movl	%edx, 704(%rsp)
	movl	%edx, 708(%rsp)
	movl	%edx, 712(%rsp)
	movl	%edx, 716(%rsp)
	movl	%edx, 720(%rsp)
	movl	%edx, 724(%rsp)
	movl	%edx, 728(%rsp)
	movl	%edx, 732(%rsp)
	movl	%edx, 736(%rsp)
	movl	%edx, 740(%rsp)
	movl	%edx, 744(%rsp)
	movl	%edx, 748(%rsp)
	movl	%edx, 752(%rsp)
	movl	%edx, 756(%rsp)
	movl	%edx, 760(%rsp)
	movl	%edx, 764(%rsp)
	movl	%edx, 768(%rsp)
	movl	%edx, 772(%rsp)
	movl	%edx, 776(%rsp)
	movl	%edx, 780(%rsp)
	movl	%edx, 784(%rsp)
	movl	$15, %edx
	movl	%edx, 788(%rsp)
	movl	%edx, 792(%rsp)
	movl	%edx, 796(%rsp)
	movl	%edx, 800(%rsp)
	movl	%edx, 804(%rsp)
	movl	%edx, 808(%rsp)
	movl	%edx, 812(%rsp)
	movl	%edx, 816(%rsp)
	movl	%edx, 820(%rsp)
	movl	%edx, 824(%rsp)
	movl	%edx, 828(%rsp)
	movl	%edx, 832(%rsp)
	movl	%edx, 836(%rsp)
	movl	%edx, 840(%rsp)
	movl	%edx, 844(%rsp)
	movl	%edx, 848(%rsp)
	movl	%edx, 852(%rsp)
	movl	%edx, 856(%rsp)
	movl	%edx, 860(%rsp)
	movl	%edx, 864(%rsp)
	movl	%edx, 868(%rsp)
	movl	%edx, 872(%rsp)
	movl	%edx, 876(%rsp)
	movl	%edx, 880(%rsp)
	movl	%edx, 884(%rsp)
	movl	%edx, 888(%rsp)
	movl	%edx, 892(%rsp)
	movl	%edx, 896(%rsp)
	movl	%edx, 900(%rsp)
	movl	%edx, 904(%rsp)
	movl	%edx, 908(%rsp)
	movl	%edx, 912(%rsp)
	movl	%edx, 916(%rsp)
	movl	%edx, 920(%rsp)
	movl	%edx, 924(%rsp)
	movq	%r9, 608(%rsp)
	movq	%r8, 600(%rsp)
	leaq	32(%rsp), %rcx
	leaq	648(%rsp), %rdx
	leaq	788(%rsp), %rsi
	movq	%rcx, %rdi
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	leaq	-1048(%rsp), %rsp
	call	.Lwots_chains_x4$1
.Lwots_pkgen$3:
	leaq	1048(%rsp), %rsp
	movq	608(%rsp), %r9
	movq	600(%rsp), %r8
	lfence
	movq	$0, %rcx
	leaq	616(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$1, 16(%r10)
	movl	20(%r9), %ecx
	leaq	616(%rsp), %r10
	movl	%ecx, 20(%r10)
	movq	592(%rsp), %rdi
	lfence
	movq	$0, %rcx
	movq	%r9, 592(%rsp)
	leaq	616(%rsp), %r9
	leaq	32(%rsp), %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	40(%rsp), %rsp
	movq	592(%rsp), %r9
	lfence
	movq	$0, %rcx
	ret
.Lwots_sk_x4$1:
	movq	%rdi, 8(%rsp)
	leaq	32(%rsp), %rdi
	movq	(%r8), %r9
	movq	%r9, (%rdi)
	movq	8(%r8), %r9
	movq	%r9, 8(%rdi)
	leaq	48(%rsp), %rcx
	movq	(%rsi), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rsi), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rsi), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rsi), %rsi
	movq	%rsi, 24(%rcx)
	leaq	80(%rsp), %rdi
	movq	(%rdx), %rsi
	movq	%rsi, (%rdi)
	movq	8(%rdx), %rsi
	movq	%rsi, 8(%rdi)
	leaq	96(%rsp), %rdi
	movq	(%rdx), %rsi
	movq	%rsi, (%rdi)
	movq	8(%rdx), %rsi
	movq	%rsi, 8(%rdi)
	leaq	112(%rsp), %rdi
	movq	(%rdx), %rsi
	movq	%rsi, (%rdi)
	movq	8(%rdx), %rsi
	movq	%rsi, 8(%rdi)
	leaq	128(%rsp), %rdi
	movq	(%rdx), %rsi
	movq	%rsi, (%rdi)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rdi)
	movq	$0, %rdx
	jmp 	.Lwots_sk_x4$2
.Lwots_sk_x4$3:
	movl	$0, %esi
	movl	%edx, %ecx
	shll	$2, %ecx
	movl	%ecx, 720(%rsp)
	movl	%esi, 724(%rsp)
	incl	%ecx
	movl	%ecx, 728(%rsp)
	movl	%esi, 732(%rsp)
	incl	%ecx
	movl	%ecx, 736(%rsp)
	movl	%esi, 740(%rsp)
	incl	%ecx
	movl	%ecx, 744(%rsp)
	movl	%esi, 748(%rsp)
	movq	%rdx, %rdi
	imulq	$64, %rdi, %rdi
	movq	%rdx, 16(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	144(%rsp,%rdi), %rdi
	leaq	80(%rsp), %rsi
	leaq	32(%rsp), %r8
	leaq	48(%rsp), %r9
	leaq	720(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lwots_sk_x4$4:
	leaq	824(%rsp), %rsp
	movq	16(%rsp), %rdx
	lfence
	movq	$0, %rcx
	incq	%rdx
.Lwots_sk_x4$2:
	cmpq	$9, %rdx
	jb  	.Lwots_sk_x4$3
	movq	8(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	144(%rsp), %rdx
	movq	%rdx, (%rcx)
	movq	152(%rsp), %rdx
	movq	%rdx, 8(%rcx)
	movq	160(%rsp), %rdx
	movq	%rdx, 16(%rcx)
	movq	168(%rsp), %rdx
	movq	%rdx, 24(%rcx)
	movq	176(%rsp), %rdx
	movq	%rdx, 32(%rcx)
	movq	184(%rsp), %rdx
	movq	%rdx, 40(%rcx)
	movq	192(%rsp), %rdx
	movq	%rdx, 48(%rcx)
	movq	200(%rsp), %rdx
	movq	%rdx, 56(%rcx)
	movq	208(%rsp), %rdx
	movq	%rdx, 64(%rcx)
	movq	216(%rsp), %rdx
	movq	%rdx, 72(%rcx)
	movq	224(%rsp), %rdx
	movq	%rdx, 80(%rcx)
	movq	232(%rsp), %rdx
	movq	%rdx, 88(%rcx)
	movq	240(%rsp), %rdx
	movq	%rdx, 96(%rcx)
	movq	248(%rsp), %rdx
	movq	%rdx, 104(%rcx)
	movq	256(%rsp), %rdx
	movq	%rdx, 112(%rcx)
	movq	264(%rsp), %rdx
	movq	%rdx, 120(%rcx)
	movq	272(%rsp), %rdx
	movq	%rdx, 128(%rcx)
	movq	280(%rsp), %rdx
	movq	%rdx, 136(%rcx)
	movq	288(%rsp), %rdx
	movq	%rdx, 144(%rcx)
	movq	296(%rsp), %rdx
	movq	%rdx, 152(%rcx)
	movq	304(%rsp), %rdx
	movq	%rdx, 160(%rcx)
	movq	312(%rsp), %rdx
	movq	%rdx, 168(%rcx)
	movq	320(%rsp), %rdx
	movq	%rdx, 176(%rcx)
	movq	328(%rsp), %rdx
	movq	%rdx, 184(%rcx)
	movq	336(%rsp), %rdx
	movq	%rdx, 192(%rcx)
	movq	344(%rsp), %rdx
	movq	%rdx, 200(%rcx)
	movq	352(%rsp), %rdx
	movq	%rdx, 208(%rcx)
	movq	360(%rsp), %rdx
	movq	%rdx, 216(%rcx)
	movq	368(%rsp), %rdx
	movq	%rdx, 224(%rcx)
	movq	376(%rsp), %rdx
	movq	%rdx, 232(%rcx)
	movq	384(%rsp), %rdx
	movq	%rdx, 240(%rcx)
	movq	392(%rsp), %rdx
	movq	%rdx, 248(%rcx)
	movq	400(%rsp), %rdx
	movq	%rdx, 256(%rcx)
	movq	408(%rsp), %rdx
	movq	%rdx, 264(%rcx)
	movq	416(%rsp), %rdx
	movq	%rdx, 272(%rcx)
	movq	424(%rsp), %rdx
	movq	%rdx, 280(%rcx)
	movq	432(%rsp), %rdx
	movq	%rdx, 288(%rcx)
	movq	440(%rsp), %rdx
	movq	%rdx, 296(%rcx)
	movq	448(%rsp), %rdx
	movq	%rdx, 304(%rcx)
	movq	456(%rsp), %rdx
	movq	%rdx, 312(%rcx)
	movq	464(%rsp), %rdx
	movq	%rdx, 320(%rcx)
	movq	472(%rsp), %rdx
	movq	%rdx, 328(%rcx)
	movq	480(%rsp), %rdx
	movq	%rdx, 336(%rcx)
	movq	488(%rsp), %rdx
	movq	%rdx, 344(%rcx)
	movq	496(%rsp), %rdx
	movq	%rdx, 352(%rcx)
	movq	504(%rsp), %rdx
	movq	%rdx, 360(%rcx)
	movq	512(%rsp), %rdx
	movq	%rdx, 368(%rcx)
	movq	520(%rsp), %rdx
	movq	%rdx, 376(%rcx)
	movq	528(%rsp), %rdx
	movq	%rdx, 384(%rcx)
	movq	536(%rsp), %rdx
	movq	%rdx, 392(%rcx)
	movq	544(%rsp), %rdx
	movq	%rdx, 400(%rcx)
	movq	552(%rsp), %rdx
	movq	%rdx, 408(%rcx)
	movq	560(%rsp), %rdx
	movq	%rdx, 416(%rcx)
	movq	568(%rsp), %rdx
	movq	%rdx, 424(%rcx)
	movq	576(%rsp), %rdx
	movq	%rdx, 432(%rcx)
	movq	584(%rsp), %rdx
	movq	%rdx, 440(%rcx)
	movq	592(%rsp), %rdx
	movq	%rdx, 448(%rcx)
	movq	600(%rsp), %rdx
	movq	%rdx, 456(%rcx)
	movq	608(%rsp), %rdx
	movq	%rdx, 464(%rcx)
	movq	616(%rsp), %rdx
	movq	%rdx, 472(%rcx)
	movq	624(%rsp), %rdx
	movq	%rdx, 480(%rcx)
	movq	632(%rsp), %rdx
	movq	%rdx, 488(%rcx)
	movq	640(%rsp), %rdx
	movq	%rdx, 496(%rcx)
	movq	648(%rsp), %rdx
	movq	%rdx, 504(%rcx)
	movq	656(%rsp), %rdx
	movq	%rdx, 512(%rcx)
	movq	664(%rsp), %rdx
	movq	%rdx, 520(%rcx)
	movq	672(%rsp), %rdx
	movq	%rdx, 528(%rcx)
	movq	680(%rsp), %rdx
	movq	%rdx, 536(%rcx)
	movq	688(%rsp), %rdx
	movq	%rdx, 544(%rcx)
	movq	696(%rsp), %rdx
	movq	%rdx, 552(%rcx)
	ret
.Lwots_chains_refill_x4$1:
	movq	%rsi, 8(%rsp)
	lfence
	movq	$0, %rax
	movl	$35, 856(%rsp)
	movl	$35, 860(%rsp)
	movl	$35, 864(%rsp)
	movl	$35, 868(%rsp)
	movl	$35, 872(%rsp)
	movl	$35, 876(%rsp)
	movl	$35, 880(%rsp)
	movl	$35, 884(%rsp)
	movl	$35, 888(%rsp)
	movl	$35, 892(%rsp)
	movl	$35, 896(%rsp)
	movl	$35, 900(%rsp)
	movl	$35, 904(%rsp)
	movl	$35, 908(%rsp)
	movl	$35, 912(%rsp)
	movl	$35, 916(%rsp)
	movl	$35, 920(%rsp)
	movl	$35, 924(%rsp)
	movl	$35, 928(%rsp)
	movl	$35, 932(%rsp)
	movl	$35, 936(%rsp)
	movl	$35, 940(%rsp)
	movl	$35, 944(%rsp)
	movl	$35, 948(%rsp)
	movl	$35, 952(%rsp)
	movl	$35, 956(%rsp)
	movl	$35, 960(%rsp)
	movl	$35, 964(%rsp)
	movl	$35, 968(%rsp)
	movl	$35, 972(%rsp)
	movl	$35, 976(%rsp)
	movl	$35, 980(%rsp)
	movl	$35, 984(%rsp)
	movl	$35, 988(%rsp)
	movl	$35, 992(%rsp)
	movl	$35, 996(%rsp)
	movl	$0, %esi
	movl	$1, %edi
	movl	(%rcx), %r10d
	movl	%r10d, 1144(%rsp)
	movl	(%rdx), %r11d
	movl	%r11d, 1000(%rsp)
	movl	%esi, %ebx
	movl	$0, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	4(%rcx), %r10d
	movl	%r10d, 1148(%rsp)
	movl	4(%rdx), %r11d
	movl	%r11d, 1004(%rsp)
	movl	%esi, %ebx
	movl	$1, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	8(%rcx), %r10d
	movl	%r10d, 1152(%rsp)
	movl	8(%rdx), %r11d
	movl	%r11d, 1008(%rsp)
	movl	%esi, %ebx
	movl	$2, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	12(%rcx), %r10d
	movl	%r10d, 1156(%rsp)
	movl	12(%rdx), %r11d
	movl	%r11d, 1012(%rsp)
	movl	%esi, %ebx
	movl	$3, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	16(%rcx), %r10d
	movl	%r10d, 1160(%rsp)
	movl	16(%rdx), %r11d
	movl	%r11d, 1016(%rsp)
	movl	%esi, %ebx
	movl	$4, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	20(%rcx), %r10d
	movl	%r10d, 1164(%rsp)
	movl	20(%rdx), %r11d
	movl	%r11d, 1020(%rsp)
	movl	%esi, %ebx
	movl	$5, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	24(%rcx), %r10d
	movl	%r10d, 1168(%rsp)
	movl	24(%rdx), %r11d
	movl	%r11d, 1024(%rsp)
	movl	%esi, %ebx
	movl	$6, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	28(%rcx), %r10d
	movl	%r10d, 1172(%rsp)
	movl	28(%rdx), %r11d
	movl	%r11d, 1028(%rsp)
	movl	%esi, %ebx
	movl	$7, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	32(%rcx), %r10d
	movl	%r10d, 1176(%rsp)
	movl	32(%rdx), %r11d
	movl	%r11d, 1032(%rsp)
	movl	%esi, %ebx
	movl	$8, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	36(%rcx), %r10d
	movl	%r10d, 1180(%rsp)
	movl	36(%rdx), %r11d
	movl	%r11d, 1036(%rsp)
	movl	%esi, %ebx
	movl	$9, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	40(%rcx), %r10d
	movl	%r10d, 1184(%rsp)
	movl	40(%rdx), %r11d
	movl	%r11d, 1040(%rsp)
	movl	%esi, %ebx
	movl	$10, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	44(%rcx), %r10d
	movl	%r10d, 1188(%rsp)
	movl	44(%rdx), %r11d
	movl	%r11d, 1044(%rsp)
	movl	%esi, %ebx
	movl	$11, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	48(%rcx), %r10d
	movl	%r10d, 1192(%rsp)
	movl	48(%rdx), %r11d
	movl	%r11d, 1048(%rsp)
	movl	%esi, %ebx
	movl	$12, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	52(%rcx), %r10d
	movl	%r10d, 1196(%rsp)
	movl	52(%rdx), %r11d
	movl	%r11d, 1052(%rsp)
	movl	%esi, %ebx
	movl	$13, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	56(%rcx), %r10d
	movl	%r10d, 1200(%rsp)
	movl	56(%rdx), %r11d
	movl	%r11d, 1056(%rsp)
	movl	%esi, %ebx
	movl	$14, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	60(%rcx), %r10d
	movl	%r10d, 1204(%rsp)
	movl	60(%rdx), %r11d
	movl	%r11d, 1060(%rsp)
	movl	%esi, %ebx
	movl	$15, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	64(%rcx), %r10d
	movl	%r10d, 1208(%rsp)
	movl	64(%rdx), %r11d
	movl	%r11d, 1064(%rsp)
	movl	%esi, %ebx
	movl	$16, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	68(%rcx), %r10d
	movl	%r10d, 1212(%rsp)
	movl	68(%rdx), %r11d
	movl	%r11d, 1068(%rsp)
	movl	%esi, %ebx
	movl	$17, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	72(%rcx), %r10d
	movl	%r10d, 1216(%rsp)
	movl	72(%rdx), %r11d
	movl	%r11d, 1072(%rsp)
	movl	%esi, %ebx
	movl	$18, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	76(%rcx), %r10d
	movl	%r10d, 1220(%rsp)
	movl	76(%rdx), %r11d
	movl	%r11d, 1076(%rsp)
	movl	%esi, %ebx
	movl	$19, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	80(%rcx), %r10d
	movl	%r10d, 1224(%rsp)
	movl	80(%rdx), %r11d
	movl	%r11d, 1080(%rsp)
	movl	%esi, %ebx
	movl	$20, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	84(%rcx), %r10d
	movl	%r10d, 1228(%rsp)
	movl	84(%rdx), %r11d
	movl	%r11d, 1084(%rsp)
	movl	%esi, %ebx
	movl	$21, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	88(%rcx), %r10d
	movl	%r10d, 1232(%rsp)
	movl	88(%rdx), %r11d
	movl	%r11d, 1088(%rsp)
	movl	%esi, %ebx
	movl	$22, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	92(%rcx), %r10d
	movl	%r10d, 1236(%rsp)
	movl	92(%rdx), %r11d
	movl	%r11d, 1092(%rsp)
	movl	%esi, %ebx
	movl	$23, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	96(%rcx), %r10d
	movl	%r10d, 1240(%rsp)
	movl	96(%rdx), %r11d
	movl	%r11d, 1096(%rsp)
	movl	%esi, %ebx
	movl	$24, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	100(%rcx), %r10d
	movl	%r10d, 1244(%rsp)
	movl	100(%rdx), %r11d
	movl	%r11d, 1100(%rsp)
	movl	%esi, %ebx
	movl	$25, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	104(%rcx), %r10d
	movl	%r10d, 1248(%rsp)
	movl	104(%rdx), %r11d
	movl	%r11d, 1104(%rsp)
	movl	%esi, %ebx
	movl	$26, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	108(%rcx), %r10d
	movl	%r10d, 1252(%rsp)
	movl	108(%rdx), %r11d
	movl	%r11d, 1108(%rsp)
	movl	%esi, %ebx
	movl	$27, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	112(%rcx), %r10d
	movl	%r10d, 1256(%rsp)
	movl	112(%rdx), %r11d
	movl	%r11d, 1112(%rsp)
	movl	%esi, %ebx
	movl	$28, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	116(%rcx), %r10d
	movl	%r10d, 1260(%rsp)
	movl	116(%rdx), %r11d
	movl	%r11d, 1116(%rsp)
	movl	%esi, %ebx
	movl	$29, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	120(%rcx), %r10d
	movl	%r10d, 1264(%rsp)
	movl	120(%rdx), %r11d
	movl	%r11d, 1120(%rsp)
	movl	%esi, %ebx
	movl	$30, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	124(%rcx), %r10d
	movl	%r10d, 1268(%rsp)
	movl	124(%rdx), %r11d
	movl	%r11d, 1124(%rsp)
	movl	%esi, %ebx
	movl	$31, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	128(%rcx), %r10d
	movl	%r10d, 1272(%rsp)
	movl	128(%rdx), %r11d
	movl	%r11d, 1128(%rsp)
	movl	%esi, %ebx
	movl	$32, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	132(%rcx), %r10d
	movl	%r10d, 1276(%rsp)
	movl	132(%rdx), %r11d
	movl	%r11d, 1132(%rsp)
	movl	%esi, %ebx
	movl	$33, 856(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	136(%rcx), %r10d
	movl	%r10d, 1280(%rsp)
	movl	136(%rdx), %r11d
	movl	%r11d, 1136(%rsp)
	movl	%esi, %edx
	movl	$34, 856(%rsp,%rdx,4)
	movl	$0, %ecx
	cmpl	%r11d, %r10d
	cmovb	%edi, %ecx
	addl	%ecx, %esi
	orl 	%eax, %esi
	movl	$0, 1284(%rsp)
	movl	$0, 1140(%rsp)
	movl	%esi, 768(%rsp)
	movl	$0, 772(%rsp)
	movq	8(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 192(%rsp)
	movq	8(%rcx), %rdx
	movq	%rdx, 200(%rsp)
	movq	16(%rcx), %rdx
	movq	%rdx, 208(%rsp)
	movq	24(%rcx), %rdx
	movq	%rdx, 216(%rsp)
	movq	32(%rcx), %rdx
	movq	%rdx, 224(%rsp)
	movq	40(%rcx), %rdx
	movq	%rdx, 232(%rsp)
	movq	48(%rcx), %rdx
	movq	%rdx, 240(%rsp)
	movq	56(%rcx), %rdx
	movq	%rdx, 248(%rsp)
	movq	64(%rcx), %rdx
	movq	%rdx, 256(%rsp)
	movq	72(%rcx), %rdx
	movq	%rdx, 264(%rsp)
	movq	80(%rcx), %rdx
	movq	%rdx, 272(%rsp)
	movq	88(%rcx), %rdx
	movq	%rdx, 280(%rsp)
	movq	96(%rcx), %rdx
	movq	%rdx, 288(%rsp)
	movq	104(%rcx), %rdx
	movq	%rdx, 296(%rsp)
	movq	112(%rcx), %rdx
	movq	%rdx, 304(%rsp)
	movq	120(%rcx), %rdx
	movq	%rdx, 312(%rsp)
	movq	128(%rcx), %rdx
	movq	%rdx, 320(%rsp)
	movq	136(%rcx), %rdx
	movq	%rdx, 328(%rsp)
	movq	144(%rcx), %rdx
	movq	%rdx, 336(%rsp)
	movq	152(%rcx), %rdx
	movq	%rdx, 344(%rsp)
	movq	160(%rcx), %rdx
	movq	%rdx, 352(%rsp)
	movq	168(%rcx), %rdx
	movq	%rdx, 360(%rsp)
	movq	176(%rcx), %rdx
	movq	%rdx, 368(%rsp)
	movq	184(%rcx), %rdx
	movq	%rdx, 376(%rsp)
	movq	192(%rcx), %rdx
	movq	%rdx, 384(%rsp)
	movq	200(%rcx), %rdx
	movq	%rdx, 392(%rsp)
	movq	208(%rcx), %rdx
	movq	%rdx, 400(%rsp)
	movq	216(%rcx), %rdx
	movq	%rdx, 408(%rsp)
	movq	224(%rcx), %rdx
	movq	%rdx, 416(%rsp)
	movq	232(%rcx), %rdx
	movq	%rdx, 424(%rsp)
	movq	240(%rcx), %rdx
	movq	%rdx, 432(%rsp)
	movq	248(%rcx), %rdx
	movq	%rdx, 440(%rsp)
	movq	256(%rcx), %rdx
	movq	%rdx, 448(%rsp)
	movq	264(%rcx), %rdx
	movq	%rdx, 456(%rsp)
	movq	272(%rcx), %rdx
	movq	%rdx, 464(%rsp)
	movq	280(%rcx), %rdx
	movq	%rdx, 472(%rsp)
	movq	288(%rcx), %rdx
	movq	%rdx, 480(%rsp)
	movq	296(%rcx), %rdx
	movq	%rdx, 488(%rsp)
	movq	304(%rcx), %rdx
	movq	%rdx, 496(%rsp)
	movq	312(%rcx), %rdx
	movq	%rdx, 504(%rsp)
	movq	320(%rcx), %rdx
	movq	%rdx, 512(%rsp)
	movq	328(%rcx), %rdx
	movq	%rdx, 520(%rsp)
	movq	336(%rcx), %rdx
	movq	%rdx, 528(%rsp)
	movq	344(%rcx), %rdx
	movq	%rdx, 536(%rsp)
	movq	352(%rcx), %rdx
	movq	%rdx, 544(%rsp)
	movq	360(%rcx), %rdx
	movq	%rdx, 552(%rsp)
	movq	368(%rcx), %rdx
	movq	%rdx, 560(%rsp)
	movq	376(%rcx), %rdx
	movq	%rdx, 568(%rsp)
	movq	384(%rcx), %rdx
	movq	%rdx, 576(%rsp)
	movq	392(%rcx), %rdx
	movq	%rdx, 584(%rsp)
	movq	400(%rcx), %rdx
	movq	%rdx, 592(%rsp)
	movq	408(%rcx), %rdx
	movq	%rdx, 600(%rsp)
	movq	416(%rcx), %rdx
	movq	%rdx, 608(%rsp)
	movq	424(%rcx), %rdx
	movq	%rdx, 616(%rsp)
	movq	432(%rcx), %rdx
	movq	%rdx, 624(%rsp)
	movq	440(%rcx), %rdx
	movq	%rdx, 632(%rsp)
	movq	448(%rcx), %rdx
	movq	%rdx, 640(%rsp)
	movq	456(%rcx), %rdx
	movq	%rdx, 648(%rsp)
	movq	464(%rcx), %rdx
	movq	%rdx, 656(%rsp)
	movq	472(%rcx), %rdx
	movq	%rdx, 664(%rsp)
	movq	480(%rcx), %rdx
	movq	%rdx, 672(%rsp)
	movq	488(%rcx), %rdx
	movq	%rdx, 680(%rsp)
	movq	496(%rcx), %rdx
	movq	%rdx, 688(%rsp)
	movq	504(%rcx), %rdx
	movq	%rdx, 696(%rsp)
	movq	512(%rcx), %rdx
	movq	%rdx, 704(%rsp)
	movq	520(%rcx), %rdx
	movq	%rdx, 712(%rsp)
	movq	528(%rcx), %rdx
	movq	%rdx, 720(%rsp)
	movq	536(%rcx), %rdx
	movq	%rdx, 728(%rsp)
	movq	544(%rcx), %rdx
	movq	%rdx, 736(%rsp)
	movq	552(%rcx), %rdx
	movq	%rdx, 744(%rsp)
	movq	$0, 752(%rsp)
	movq	$0, 760(%rsp)
	movl	$0, 808(%rsp)
	movl	$0, 792(%rsp)
	movl	$35, 776(%rsp)
	movq	$0, 128(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 136(%rsp)
	movq	$0, 72(%rsp)
	movl	$0, 812(%rsp)
	movl	$0, 796(%rsp)
	movl	$35, 780(%rsp)
	movq	$0, 144(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 152(%rsp)
	movq	$0, 88(%rsp)
	movl	$0, 816(%rsp)
	movl	$0, 800(%rsp)
	movl	$35, 784(%rsp)
	movq	$0, 160(%rsp)
	movq	$0, 96(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 104(%rsp)
	movl	$0, 820(%rsp)
	movl	$0, 804(%rsp)
	movl	$35, 788(%rsp)
	movq	$0, 176(%rsp)
	movq	$0, 112(%rsp)
	movq	$0, 184(%rsp)
	movq	$0, 120(%rsp)
	leaq	16(%rsp), %rdi
	movq	(%r8), %rdx
	movq	%rdx, (%rdi)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rdi)
	leaq	32(%rsp), %rcx
	movq	(%r9), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rcx)
	jmp 	.Lwots_chains_refill_x4$2
.Lwots_chains_refill_x4$3:
	movl	776(%rsp), %eax
	movl	%eax, 824(%rsp)
	movl	808(%rsp), %eax
	movl	%eax, 828(%rsp)
	movl	780(%rsp), %eax
	movl	%eax, 832(%rsp)
	movl	812(%rsp), %eax
	movl	%eax, 836(%rsp)
	movl	784(%rsp), %eax
	movl	%eax, 840(%rsp)
	movl	816(%rsp), %eax
	movl	%eax, 844(%rsp)
	movl	788(%rsp), %eax
	movl	%eax, 848(%rsp)
	movl	820(%rsp), %eax
	movl	%eax, 852(%rsp)
	leaq	64(%rsp), %rdi
	leaq	128(%rsp), %rsi
	leaq	16(%rsp), %r8
	leaq	32(%rsp), %r9
	leaq	824(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lwots_chains_refill_x4$4:
	leaq	824(%rsp), %rsp
	lfence
	movq	$0, %rax
.Lwots_chains_refill_x4$2:
	movl	772(%rsp), %ecx
	movl	768(%rsp), %edx
	movl	$0, %esi
	movl	$1, %edi
	movl	808(%rsp), %r8d
	movl	792(%rsp), %r9d
	movl	776(%rsp), %r10d
	orl 	%eax, %r10d
	movq	128(%rsp), %r11
	movq	64(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 128(%rsp)
	movq	136(%rsp), %r11
	movq	72(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 136(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$16, %r11, %r11
	movq	128(%rsp), %rbx
	movq	%rbx, 192(%rsp,%r11)
	movq	136(%rsp), %rbx
	movq	%rbx, 200(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %ebx
	movl	856(%rsp,%rbx,4), %ebx
	orl 	%eax, %ebx
	cmpl	$0, %r11d
	cmovne	%ebx, %r10d
	movl	%ebx, %ebp
	movl	1144(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1000(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%ebx, %ebx
	imulq	$16, %rbx, %rbx
	movq	128(%rsp), %rbp
	movq	192(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 128(%rsp)
	movq	136(%rsp), %rbp
	movq	200(%rsp,%rbx), %rbx
	cmpl	$0, %r11d
	cmovne	%rbx, %rbp
	movq	%rbp, 136(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 808(%rsp)
	movl	%r9d, 792(%rsp)
	movl	%r10d, 776(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	812(%rsp), %r8d
	movl	796(%rsp), %r9d
	movl	780(%rsp), %r10d
	orl 	%eax, %r10d
	movq	144(%rsp), %r11
	movq	80(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 144(%rsp)
	movq	152(%rsp), %r11
	movq	88(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 152(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$16, %r11, %r11
	movq	144(%rsp), %rbx
	movq	%rbx, 192(%rsp,%r11)
	movq	152(%rsp), %rbx
	movq	%rbx, 200(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %ebx
	movl	856(%rsp,%rbx,4), %ebx
	orl 	%eax, %ebx
	cmpl	$0, %r11d
	cmovne	%ebx, %r10d
	movl	%ebx, %ebp
	movl	1144(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1000(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%ebx, %ebx
	imulq	$16, %rbx, %rbx
	movq	144(%rsp), %rbp
	movq	192(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 144(%rsp)
	movq	152(%rsp), %rbp
	movq	200(%rsp,%rbx), %rbx
	cmpl	$0, %r11d
	cmovne	%rbx, %rbp
	movq	%rbp, 152(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 812(%rsp)
	movl	%r9d, 796(%rsp)
	movl	%r10d, 780(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	816(%rsp), %r8d
	movl	800(%rsp), %r9d
	movl	784(%rsp), %r10d
	orl 	%eax, %r10d
	movq	160(%rsp), %r11
	movq	96(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 160(%rsp)
	movq	168(%rsp), %r11
	movq	104(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 168(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$16, %r11, %r11
	movq	160(%rsp), %rbx
	movq	%rbx, 192(%rsp,%r11)
	movq	168(%rsp), %rbx
	movq	%rbx, 200(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %ebx
	movl	856(%rsp,%rbx,4), %ebx
	orl 	%eax, %ebx
	cmpl	$0, %r11d
	cmovne	%ebx, %r10d
	movl	%ebx, %ebp
	movl	1144(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1000(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%ebx, %ebx
	imulq	$16, %rbx, %rbx
	movq	160(%rsp), %rbp
	movq	192(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 160(%rsp)
	movq	168(%rsp), %rbp
	movq	200(%rsp,%rbx), %rbx
	cmpl	$0, %r11d
	cmovne	%rbx, %rbp
	movq	%rbp, 168(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 816(%rsp)
	movl	%r9d, 800(%rsp)
	movl	%r10d, 784(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	820(%rsp), %r8d
	movl	804(%rsp), %r9d
	movl	788(%rsp), %r10d
	orl 	%eax, %r10d
	movq	176(%rsp), %r11
	movq	112(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 176(%rsp)
	movq	184(%rsp), %r11
	movq	120(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 184(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$16, %r11, %r11
	movq	176(%rsp), %rbx
	movq	%rbx, 192(%rsp,%r11)
	movq	184(%rsp), %rbx
	movq	%rbx, 200(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %edx
	movl	856(%rsp,%rdx,4), %edx
	orl 	%eax, %edx
	cmpl	$0, %r11d
	cmovne	%edx, %r10d
	movl	%edx, %ebx
	movl	1144(%rsp,%rbx,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1000(%rsp,%rbx,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%edx, %edx
	imulq	$16, %rdx, %rdx
	movq	176(%rsp), %rbx
	movq	192(%rsp,%rdx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbx
	movq	%rbx, 176(%rsp)
	movq	184(%rsp), %rbx
	movq	200(%rsp,%rdx), %rdx
	cmpl	$0, %r11d
	cmovne	%rdx, %rbx
	movq	%rbx, 184(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 820(%rsp)
	movl	%r9d, 804(%rsp)
	movl	%r10d, 788(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	%ecx, 772(%rsp)
	orl 	%eax, %esi
	cmpl	$0, %esi
	jne 	.Lwots_chains_refill_x4$3
	movq	8(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	192(%rsp), %rdx
	movq	%rdx, (%rcx)
	movq	200(%rsp), %rdx
	movq	%rdx, 8(%rcx)
	movq	208(%rsp), %rdx
	movq	%rdx, 16(%rcx)
	movq	216(%rsp), %rdx
	movq	%rdx, 24(%rcx)
	movq	224(%rsp), %rdx
	movq	%rdx, 32(%rcx)
	movq	232(%rsp), %rdx
	movq	%rdx, 40(%rcx)
	movq	240(%rsp), %rdx
	movq	%rdx, 48(%rcx)
	movq	248(%rsp), %rdx
	movq	%rdx, 56(%rcx)
	movq	256(%rsp), %rdx
	movq	%rdx, 64(%rcx)
	movq	264(%rsp), %rdx
	movq	%rdx, 72(%rcx)
	movq	272(%rsp), %rdx
	movq	%rdx, 80(%rcx)
	movq	280(%rsp), %rdx
	movq	%rdx, 88(%rcx)
	movq	288(%rsp), %rdx
	movq	%rdx, 96(%rcx)
	movq	296(%rsp), %rdx
	movq	%rdx, 104(%rcx)
	movq	304(%rsp), %rdx
	movq	%rdx, 112(%rcx)
	movq	312(%rsp), %rdx
	movq	%rdx, 120(%rcx)
	movq	320(%rsp), %rdx
	movq	%rdx, 128(%rcx)
	movq	328(%rsp), %rdx
	movq	%rdx, 136(%rcx)
	movq	336(%rsp), %rdx
	movq	%rdx, 144(%rcx)
	movq	344(%rsp), %rdx
	movq	%rdx, 152(%rcx)
	movq	352(%rsp), %rdx
	movq	%rdx, 160(%rcx)
	movq	360(%rsp), %rdx
	movq	%rdx, 168(%rcx)
	movq	368(%rsp), %rdx
	movq	%rdx, 176(%rcx)
	movq	376(%rsp), %rdx
	movq	%rdx, 184(%rcx)
	movq	384(%rsp), %rdx
	movq	%rdx, 192(%rcx)
	movq	392(%rsp), %rdx
	movq	%rdx, 200(%rcx)
	movq	400(%rsp), %rdx
	movq	%rdx, 208(%rcx)
	movq	408(%rsp), %rdx
	movq	%rdx, 216(%rcx)
	movq	416(%rsp), %rdx
	movq	%rdx, 224(%rcx)
	movq	424(%rsp), %rdx
	movq	%rdx, 232(%rcx)
	movq	432(%rsp), %rdx
	movq	%rdx, 240(%rcx)
	movq	440(%rsp), %rdx
	movq	%rdx, 248(%rcx)
	movq	448(%rsp), %rdx
	movq	%rdx, 256(%rcx)
	movq	456(%rsp), %rdx
	movq	%rdx, 264(%rcx)
	movq	464(%rsp), %rdx
	movq	%rdx, 272(%rcx)
	movq	472(%rsp), %rdx
	movq	%rdx, 280(%rcx)
	movq	480(%rsp), %rdx
	movq	%rdx, 288(%rcx)
	movq	488(%rsp), %rdx
	movq	%rdx, 296(%rcx)
	movq	496(%rsp), %rdx
	movq	%rdx, 304(%rcx)
	movq	504(%rsp), %rdx
	movq	%rdx, 312(%rcx)
	movq	512(%rsp), %rdx
	movq	%rdx, 320(%rcx)
	movq	520(%rsp), %rdx
	movq	%rdx, 328(%rcx)
	movq	528(%rsp), %rdx
	movq	%rdx, 336(%rcx)
	movq	536(%rsp), %rdx
	movq	%rdx, 344(%rcx)
	movq	544(%rsp), %rdx
	movq	%rdx, 352(%rcx)
	movq	552(%rsp), %rdx
	movq	%rdx, 360(%rcx)
	movq	560(%rsp), %rdx
	movq	%rdx, 368(%rcx)
	movq	568(%rsp), %rdx
	movq	%rdx, 376(%rcx)
	movq	576(%rsp), %rdx
	movq	%rdx, 384(%rcx)
	movq	584(%rsp), %rdx
	movq	%rdx, 392(%rcx)
	movq	592(%rsp), %rdx
	movq	%rdx, 400(%rcx)
	movq	600(%rsp), %rdx
	movq	%rdx, 408(%rcx)
	movq	608(%rsp), %rdx
	movq	%rdx, 416(%rcx)
	movq	616(%rsp), %rdx
	movq	%rdx, 424(%rcx)
	movq	624(%rsp), %rdx
	movq	%rdx, 432(%rcx)
	movq	632(%rsp), %rdx
	movq	%rdx, 440(%rcx)
	movq	640(%rsp), %rdx
	movq	%rdx, 448(%rcx)
	movq	648(%rsp), %rdx
	movq	%rdx, 456(%rcx)
	movq	656(%rsp), %rdx
	movq	%rdx, 464(%rcx)
	movq	664(%rsp), %rdx
	movq	%rdx, 472(%rcx)
	movq	672(%rsp), %rdx
	movq	%rdx, 480(%rcx)
	movq	680(%rsp), %rdx
	movq	%rdx, 488(%rcx)
	movq	688(%rsp), %rdx
	movq	%rdx, 496(%rcx)
	movq	696(%rsp), %rdx
	movq	%rdx, 504(%rcx)
	movq	704(%rsp), %rdx
	movq	%rdx, 512(%rcx)
	movq	712(%rsp), %rdx
	movq	%rdx, 520(%rcx)
	movq	720(%rsp), %rdx
	movq	%rdx, 528(%rcx)
	movq	728(%rsp), %rdx
	movq	%rdx, 536(%rcx)
	movq	736(%rsp), %rdx
	movq	%rdx, 544(%rcx)
	movq	744(%rsp), %rdx
	movq	%rdx, 552(%rcx)
	ret
.Lwots_chains_x4$1:
	movq	%rdi, 8(%rsp)
	leaq	32(%rsp), %rdi
	movq	(%r8), %rsi
	movq	%rsi, (%rdi)
	movq	8(%r8), %rsi
	movq	%rsi, 8(%rdi)
	leaq	48(%rsp), %rsi
	movq	(%r9), %rdi
	movq	%rdi, (%rsi)
	movq	8(%r9), %rdi
	movq	%rdi, 8(%rsi)
	movq	16(%r9), %rdi
	movq	%rdi, 16(%rsi)
	movq	24(%r9), %rdi
	movq	%rdi, 24(%rsi)
	movl	$0, %esi
	movl	(%rcx), %r10d
	movl	%r10d, 904(%rsp)
	movl	(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 760(%rsp)
	movl	4(%rcx), %r10d
	movl	%r10d, 908(%rsp)
	movl	4(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 764(%rsp)
	movl	8(%rcx), %r10d
	movl	%r10d, 912(%rsp)
	movl	8(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 768(%rsp)
	movl	12(%rcx), %r10d
	movl	%r10d, 916(%rsp)
	movl	12(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 772(%rsp)
	movl	16(%rcx), %r10d
	movl	%r10d, 920(%rsp)
	movl	16(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 776(%rsp)
	movl	20(%rcx), %r10d
	movl	%r10d, 924(%rsp)
	movl	20(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 780(%rsp)
	movl	24(%rcx), %r10d
	movl	%r10d, 928(%rsp)
	movl	24(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 784(%rsp)
	movl	28(%rcx), %r10d
	movl	%r10d, 932(%rsp)
	movl	28(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 788(%rsp)
	movl	32(%rcx), %r10d
	movl	%r10d, 936(%rsp)
	movl	32(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 792(%rsp)
	movl	36(%rcx), %r10d
	movl	%r10d, 940(%rsp)
	movl	36(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 796(%rsp)
	movl	40(%rcx), %r10d
	movl	%r10d, 944(%rsp)
	movl	40(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 800(%rsp)
	movl	44(%rcx), %r10d
	movl	%r10d, 948(%rsp)
	movl	44(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 804(%rsp)
	movl	48(%rcx), %r10d
	movl	%r10d, 952(%rsp)
	movl	48(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 808(%rsp)
	movl	52(%rcx), %r10d
	movl	%r10d, 956(%rsp)
	movl	52(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 812(%rsp)
	movl	56(%rcx), %r10d
	movl	%r10d, 960(%rsp)
	movl	56(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 816(%rsp)
	movl	60(%rcx), %r10d
	movl	%r10d, 964(%rsp)
	movl	60(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 820(%rsp)
	movl	64(%rcx), %r10d
	movl	%r10d, 968(%rsp)
	movl	64(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 824(%rsp)
	movl	68(%rcx), %r10d
	movl	%r10d, 972(%rsp)
	movl	68(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 828(%rsp)
	movl	72(%rcx), %r10d
	movl	%r10d, 976(%rsp)
	movl	72(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 832(%rsp)
	movl	76(%rcx), %r10d
	movl	%r10d, 980(%rsp)
	movl	76(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 836(%rsp)
	movl	80(%rcx), %r10d
	movl	%r10d, 984(%rsp)
	movl	80(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 840(%rsp)
	movl	84(%rcx), %r10d
	movl	%r10d, 988(%rsp)
	movl	84(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 844(%rsp)
	movl	88(%rcx), %r10d
	movl	%r10d, 992(%rsp)
	movl	88(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 848(%rsp)
	movl	92(%rcx), %r10d
	movl	%r10d, 996(%rsp)
	movl	92(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 852(%rsp)
	movl	96(%rcx), %r10d
	movl	%r10d, 1000(%rsp)
	movl	96(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 856(%rsp)
	movl	100(%rcx), %r10d
	movl	%r10d, 1004(%rsp)
	movl	100(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 860(%rsp)
	movl	104(%rcx), %r10d
	movl	%r10d, 1008(%rsp)
	movl	104(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 864(%rsp)
	movl	108(%rcx), %r10d
	movl	%r10d, 1012(%rsp)
	movl	108(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 868(%rsp)
	movl	112(%rcx), %r10d
	movl	%r10d, 1016(%rsp)
	movl	112(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 872(%rsp)
	movl	116(%rcx), %r10d
	movl	%r10d, 1020(%rsp)
	movl	116(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 876(%rsp)
	movl	120(%rcx), %r10d
	movl	%r10d, 1024(%rsp)
	movl	120(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 880(%rsp)
	movl	124(%rcx), %r10d
	movl	%r10d, 1028(%rsp)
	movl	124(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 884(%rsp)
	movl	128(%rcx), %r10d
	movl	%r10d, 1032(%rsp)
	movl	128(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 888(%rsp)
	movl	132(%rcx), %r10d
	movl	%r10d, 1036(%rsp)
	movl	132(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 892(%rsp)
	movl	136(%rcx), %r10d
	movl	%r10d, 1040(%rsp)
	movl	136(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 896(%rsp)
	movl	%esi, 1044(%rsp)
	movl	%esi, 900(%rsp)
	movq	8(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 144(%rsp)
	movq	8(%rcx), %rdx
	movq	%rdx, 152(%rsp)
	movq	16(%rcx), %rdx
	movq	%rdx, 160(%rsp)
	movq	24(%rcx), %rdx
	movq	%rdx, 168(%rsp)
	movq	32(%rcx), %rdx
	movq	%rdx, 176(%rsp)
	movq	40(%rcx), %rdx
	movq	%rdx, 184(%rsp)
	movq	48(%rcx), %rdx
	movq	%rdx, 192(%rsp)
	movq	56(%rcx), %rdx
	movq	%rdx, 200(%rsp)
	movq	64(%rcx), %rdx
	movq	%rdx, 208(%rsp)
	movq	72(%rcx), %rdx
	movq	%rdx, 216(%rsp)
	movq	80(%rcx), %rdx
	movq	%rdx, 224(%rsp)
	movq	88(%rcx), %rdx
	movq	%rdx, 232(%rsp)
	movq	96(%rcx), %rdx
	movq	%rdx, 240(%rsp)
	movq	104(%rcx), %rdx
	movq	%rdx, 248(%rsp)
	movq	112(%rcx), %rdx
	movq	%rdx, 256(%rsp)
	movq	120(%rcx), %rdx
	movq	%rdx, 264(%rsp)
	movq	128(%rcx), %rdx
	movq	%rdx, 272(%rsp)
	movq	136(%rcx), %rdx
	movq	%rdx, 280(%rsp)
	movq	144(%rcx), %rdx
	movq	%rdx, 288(%rsp)
	movq	152(%rcx), %rdx
	movq	%rdx, 296(%rsp)
	movq	160(%rcx), %rdx
	movq	%rdx, 304(%rsp)
	movq	168(%rcx), %rdx
	movq	%rdx, 312(%rsp)
	movq	176(%rcx), %rdx
	movq	%rdx, 320(%rsp)
	movq	184(%rcx), %rdx
	movq	%rdx, 328(%rsp)
	movq	192(%rcx), %rdx
	movq	%rdx, 336(%rsp)
	movq	200(%rcx), %rdx
	movq	%rdx, 344(%rsp)
	movq	208(%rcx), %rdx
	movq	%rdx, 352(%rsp)
	movq	216(%rcx), %rdx
	movq	%rdx, 360(%rsp)
	movq	224(%rcx), %rdx
	movq	%rdx, 368(%rsp)
	movq	232(%rcx), %rdx
	movq	%rdx, 376(%rsp)
	movq	240(%rcx), %rdx
	movq	%rdx, 384(%rsp)
	movq	248(%rcx), %rdx
	movq	%rdx, 392(%rsp)
	movq	256(%rcx), %rdx
	movq	%rdx, 400(%rsp)
	movq	264(%rcx), %rdx
	movq	%rdx, 408(%rsp)
	movq	272(%rcx), %rdx
	movq	%rdx, 416(%rsp)
	movq	280(%rcx), %rdx
	movq	%rdx, 424(%rsp)
	movq	288(%rcx), %rdx
	movq	%rdx, 432(%rsp)
	movq	296(%rcx), %rdx
	movq	%rdx, 440(%rsp)
	movq	304(%rcx), %rdx
	movq	%rdx, 448(%rsp)
	movq	312(%rcx), %rdx
	movq	%rdx, 456(%rsp)
	movq	320(%rcx), %rdx
	movq	%rdx, 464(%rsp)
	movq	328(%rcx), %rdx
	movq	%rdx, 472(%rsp)
	movq	336(%rcx), %rdx
	movq	%rdx, 480(%rsp)
	movq	344(%rcx), %rdx
	movq	%rdx, 488(%rsp)
	movq	352(%rcx), %rdx
	movq	%rdx, 496(%rsp)
	movq	360(%rcx), %rdx
	movq	%rdx, 504(%rsp)
	movq	368(%rcx), %rdx
	movq	%rdx, 512(%rsp)
	movq	376(%rcx), %rdx
	movq	%rdx, 520(%rsp)
	movq	384(%rcx), %rdx
	movq	%rdx, 528(%rsp)
	movq	392(%rcx), %rdx
	movq	%rdx, 536(%rsp)
	movq	400(%rcx), %rdx
	movq	%rdx, 544(%rsp)
	movq	408(%rcx), %rdx
	movq	%rdx, 552(%rsp)
	movq	416(%rcx), %rdx
	movq	%rdx, 560(%rsp)
	movq	424(%rcx), %rdx
	movq	%rdx, 568(%rsp)
	movq	432(%rcx), %rdx
	movq	%rdx, 576(%rsp)
	movq	440(%rcx), %rdx
	movq	%rdx, 584(%rsp)
	movq	448(%rcx), %rdx
	movq	%rdx, 592(%rsp)
	movq	456(%rcx), %rdx
	movq	%rdx, 600(%rsp)
	movq	464(%rcx), %rdx
	movq	%rdx, 608(%rsp)
	movq	472(%rcx), %rdx
	movq	%rdx, 616(%rsp)
	movq	480(%rcx), %rdx
	movq	%rdx, 624(%rsp)
	movq	488(%rcx), %rdx
	movq	%rdx, 632(%rsp)
	movq	496(%rcx), %rdx
	movq	%rdx, 640(%rsp)
	movq	504(%rcx), %rdx
	movq	%rdx, 648(%rsp)
	movq	512(%rcx), %rdx
	movq	%rdx, 656(%rsp)
	movq	520(%rcx), %rdx
	movq	%rdx, 664(%rsp)
	movq	528(%rcx), %rdx
	movq	%rdx, 672(%rsp)
	movq	536(%rcx), %rdx
	movq	%rdx, 680(%rsp)
	movq	544(%rcx), %rdx
	movq	%rdx, 688(%rsp)
	movq	552(%rcx), %rdx
	movq	%rdx, 696(%rsp)
	movq	$0, 704(%rsp)
	movq	$0, 712(%rsp)
	movq	$0, %rcx
	jmp 	.Lwots_chains_x4$2
.Lwots_chains_x4$3:
	movl	%ecx, %edx
	shll	$2, %edx
	movl	%edx, 728(%rsp)
	incl	%edx
	movl	%edx, 736(%rsp)
	incl	%edx
	movl	%edx, 744(%rsp)
	incl	%edx
	movl	%edx, 752(%rsp)
	movl	$16, %edx
	movl	$0, %esi
	movl	$0, %edi
	movq	%rcx, %r8
	shlq	$2, %r8
	movl	904(%rsp,%r8,4), %r10d
	movl	760(%rsp,%r8,4), %r9d
	movl	%r10d, %r11d
	addl	%r9d, %r11d
	movl	$16, %ebx
	cmpl	$0, %r9d
	cmove	%ebx, %r10d
	cmpl	$0, %r9d
	cmove	%edi, %r11d
	cmpl	%edx, %r10d
	cmovb	%r10d, %edx
	cmpl	%r11d, %esi
	cmovb	%r11d, %esi
	movl	908(%rsp,%r8,4), %r10d
	movl	764(%rsp,%r8,4), %r9d
	movl	%r10d, %r11d
	addl	%r9d, %r11d
	movl	$16, %ebx
	cmpl	$0, %r9d
	cmove	%ebx, %r10d
	cmpl	$0, %r9d
	cmove	%edi, %r11d
	cmpl	%edx, %r10d
	cmovb	%r10d, %edx
	cmpl	%r11d, %esi
	cmovb	%r11d, %esi
	movl	912(%rsp,%r8,4), %r10d
	movl	768(%rsp,%r8,4), %r9d
	movl	%r10d, %r11d
	addl	%r9d, %r11d
	movl	$16, %ebx
	cmpl	$0, %r9d
	cmove	%ebx, %r10d
	cmpl	$0, %r9d
	cmove	%edi, %r11d
	cmpl	%edx, %r10d
	cmovb	%r10d, %edx
	cmpl	%r11d, %esi
	cmovb	%r11d, %esi
	movl	916(%rsp,%r8,4), %r10d
	movl	772(%rsp,%r8,4), %r9d
	movl	%r10d, %r11d
	addl	%r9d, %r11d
	movl	$16, %r8d
	cmpl	$0, %r9d
	cmove	%r8d, %r10d
	cmpl	$0, %r9d
	cmove	%edi, %r11d
	cmpl	%edx, %r10d
	cmovb	%r10d, %edx
	cmpl	%r11d, %esi
	cmovb	%r11d, %esi
	lfence
	movq	$0, %rdi
	movq	%rcx, %rdi
	imulq	$64, %rdi, %rdi
	jmp 	.Lwots_chains_x4$4
.Lwots_chains_x4$5:
	movl	%edx, 732(%rsp)
	movl	%edx, 740(%rsp)
	movl	%edx, 748(%rsp)
	movl	%edx, 756(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movl	%edx, 720(%rsp)
	movl	%esi, 724(%rsp)
	leaq	144(%rsp,%rdi), %rsi
	leaq	80(%rsp), %rdi
	leaq	32(%rsp), %r8
	leaq	48(%rsp), %r9
	leaq	728(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lwots_chains_x4$6:
	leaq	824(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rdi
	movl	720(%rsp), %edx
	movl	724(%rsp), %esi
	lfence
	movq	$0, %r8
	movq	%rcx, %r8
	shlq	$2, %r8
	movl	%edx, %r9d
	movl	904(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	760(%rsp,%r8,4), %r10d
	movq	144(%rsp,%rdi), %r11
	movq	80(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 144(%rsp,%rdi)
	movq	152(%rsp,%rdi), %r11
	movq	88(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 152(%rsp,%rdi)
	movl	%edx, %r9d
	movl	908(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	764(%rsp,%r8,4), %r10d
	movq	160(%rsp,%rdi), %r11
	movq	96(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 160(%rsp,%rdi)
	movq	168(%rsp,%rdi), %r11
	movq	104(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 168(%rsp,%rdi)
	movl	%edx, %r9d
	movl	912(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	768(%rsp,%r8,4), %r10d
	movq	176(%rsp,%rdi), %r11
	movq	112(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 176(%rsp,%rdi)
	movq	184(%rsp,%rdi), %r11
	movq	120(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 184(%rsp,%rdi)
	movl	%edx, %r9d
	movl	916(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	772(%rsp,%r8,4), %r10d
	movq	192(%rsp,%rdi), %r11
	movq	128(%rsp), %r8
	cmpl	%r10d, %r9d
	cmovb	%r8, %r11
	movq	%r11, 192(%rsp,%rdi)
	movq	200(%rsp,%rdi), %r11
	movq	136(%rsp), %r8
	cmpl	%r10d, %r9d
	cmovb	%r8, %r11
	movq	%r11, 200(%rsp,%rdi)
	incl	%edx
.Lwots_chains_x4$4:
	cmpl	%esi, %edx
	jb  	.Lwots_chains_x4$5
	incq	%rcx
.Lwots_chains_x4$2:
	cmpq	$9, %rcx
	jb  	.Lwots_chains_x4$3
	movq	8(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	144(%rsp), %rdx
	movq	%rdx, (%rcx)
	movq	152(%rsp), %rdx
	movq	%rdx, 8(%rcx)
	movq	160(%rsp), %rdx
	movq	%rdx, 16(%rcx)
	movq	168(%rsp), %rdx
	movq	%rdx, 24(%rcx)
	movq	176(%rsp), %rdx
	movq	%rdx, 32(%rcx)
	movq	184(%rsp), %rdx
	movq	%rdx, 40(%rcx)
	movq	192(%rsp), %rdx
	movq	%rdx, 48(%rcx)
	movq	200(%rsp), %rdx
	movq	%rdx, 56(%rcx)
	movq	208(%rsp), %rdx
	movq	%rdx, 64(%rcx)
	movq	216(%rsp), %rdx
	movq	%rdx, 72(%rcx)
	movq	224(%rsp), %rdx
	movq	%rdx, 80(%rcx)
	movq	232(%rsp), %rdx
	movq	%rdx, 88(%rcx)
	movq	240(%rsp), %rdx
	movq	%rdx, 96(%rcx)
	movq	248(%rsp), %rdx
	movq	%rdx, 104(%rcx)
	movq	256(%rsp), %rdx
	movq	%rdx, 112(%rcx)
	movq	264(%rsp), %rdx
	movq	%rdx, 120(%rcx)
	movq	272(%rsp), %rdx
	movq	%rdx, 128(%rcx)
	movq	280(%rsp), %rdx
	movq	%rdx, 136(%rcx)
	movq	288(%rsp), %rdx
	movq	%rdx, 144(%rcx)
	movq	296(%rsp), %rdx
	movq	%rdx, 152(%rcx)
	movq	304(%rsp), %rdx
	movq	%rdx, 160(%rcx)
	movq	312(%rsp), %rdx
	movq	%rdx, 168(%rcx)
	movq	320(%rsp), %rdx
	movq	%rdx, 176(%rcx)
	movq	328(%rsp), %rdx
	movq	%rdx, 184(%rcx)
	movq	336(%rsp), %rdx
	movq	%rdx, 192(%rcx)
	movq	344(%rsp), %rdx
	movq	%rdx, 200(%rcx)
	movq	352(%rsp), %rdx
	movq	%rdx, 208(%rcx)
	movq	360(%rsp), %rdx
	movq	%rdx, 216(%rcx)
	movq	368(%rsp), %rdx
	movq	%rdx, 224(%rcx)
	movq	376(%rsp), %rdx
	movq	%rdx, 232(%rcx)
	movq	384(%rsp), %rdx
	movq	%rdx, 240(%rcx)
	movq	392(%rsp), %rdx
	movq	%rdx, 248(%rcx)
	movq	400(%rsp), %rdx
	movq	%rdx, 256(%rcx)
	movq	408(%rsp), %rdx
	movq	%rdx, 264(%rcx)
	movq	416(%rsp), %rdx
	movq	%rdx, 272(%rcx)
	movq	424(%rsp), %rdx
	movq	%rdx, 280(%rcx)
	movq	432(%rsp), %rdx
	movq	%rdx, 288(%rcx)
	movq	440(%rsp), %rdx
	movq	%rdx, 296(%rcx)
	movq	448(%rsp), %rdx
	movq	%rdx, 304(%rcx)
	movq	456(%rsp), %rdx
	movq	%rdx, 312(%rcx)
	movq	464(%rsp), %rdx
	movq	%rdx, 320(%rcx)
	movq	472(%rsp), %rdx
	movq	%rdx, 328(%rcx)
	movq	480(%rsp), %rdx
	movq	%rdx, 336(%rcx)
	movq	488(%rsp), %rdx
	movq	%rdx, 344(%rcx)
	movq	496(%rsp), %rdx
	movq	%rdx, 352(%rcx)
	movq	504(%rsp), %rdx
	movq	%rdx, 360(%rcx)
	movq	512(%rsp), %rdx
	movq	%rdx, 368(%rcx)
	movq	520(%rsp), %rdx
	movq	%rdx, 376(%rcx)
	movq	528(%rsp), %rdx
	movq	%rdx, 384(%rcx)
	movq	536(%rsp), %rdx
	movq	%rdx, 392(%rcx)
	movq	544(%rsp), %rdx
	movq	%rdx, 400(%rcx)
	movq	552(%rsp), %rdx
	movq	%rdx, 408(%rcx)
	movq	560(%rsp), %rdx
	movq	%rdx, 416(%rcx)
	movq	568(%rsp), %rdx
	movq	%rdx, 424(%rcx)
	movq	576(%rsp), %rdx
	movq	%rdx, 432(%rcx)
	movq	584(%rsp), %rdx
	movq	%rdx, 440(%rcx)
	movq	592(%rsp), %rdx
	movq	%rdx, 448(%rcx)
	movq	600(%rsp), %rdx
	movq	%rdx, 456(%rcx)
	movq	608(%rsp), %rdx
	movq	%rdx, 464(%rcx)
	movq	616(%rsp), %rdx
	movq	%rdx, 472(%rcx)
	movq	624(%rsp), %rdx
	movq	%rdx, 480(%rcx)
	movq	632(%rsp), %rdx
	movq	%rdx, 488(%rcx)
	movq	640(%rsp), %rdx
	movq	%rdx, 496(%rcx)
	movq	648(%rsp), %rdx
	movq	%rdx, 504(%rcx)
	movq	656(%rsp), %rdx
	movq	%rdx, 512(%rcx)
	movq	664(%rsp), %rdx
	movq	%rdx, 520(%rcx)
	movq	672(%rsp), %rdx
	movq	%rdx, 528(%rcx)
	movq	680(%rsp), %rdx
	movq	%rdx, 536(%rcx)
	movq	688(%rsp), %rdx
	movq	%rdx, 544(%rcx)
	movq	696(%rsp), %rdx
	movq	%rdx, 552(%rcx)
	ret
.LT_k$1:
	movq	%rdi, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdx
	vpbroadcastq	(%r8,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r8,%rdx), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r9), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%r9), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%r9), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%r9), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%r9), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%r9), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%r9), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%r9), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %rdx
	vmovdqu	(%rcx,%rdx), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vmovdqu	8(%rcx,%rdx), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rcx,%rdx), %rcx
	vmovq	%rcx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rdx
	movq	$0, %rcx
	vmovq	%rcx, %xmm7
	vmovdqu	(%rax,%rdx), %ymm14
	movq	32(%rax,%rdx), %rcx
	vmovq	%rcx, %xmm8
	vmovdqu	40(%rax,%rdx), %ymm13
	movq	72(%rax,%rdx), %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	movq	80(%rax,%rdx), %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	addq	$88, %rdx
	call	.L_keccakf1600_avx2$1
.LT_k$9:
	movq	$0, %rcx
	jmp 	.LT_k$6
.LT_k$7:
	vpbroadcastq	(%rax,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rdx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rax,%rdx), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	48(%rax,%rdx), %ymm14
	movq	80(%rax,%rdx), %rsi
	vmovq	%rsi, %xmm8
	vmovdqu	88(%rax,%rdx), %ymm13
	movq	120(%rax,%rdx), %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	movq	128(%rax,%rdx), %rsi
	vmovq	%rsi, %xmm9
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	addq	$136, %rdx
	call	.L_keccakf1600_avx2$1
.LT_k$8:
	incq	%rcx
.LT_k$6:
	cmpq	$3, %rcx
	jb  	.LT_k$7
	vpbroadcastq	(%rax,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rdx), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%rax,%rdx), %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rax
	movq	$0, %rdx
	movq	$0, %rcx
	jmp 	.LT_k$3
.LT_k$4:
	call	.L_keccakf1600_avx2$1
.LT_k$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rax,%rdx)
	vmovdqu	%ymm4, 8(%rax,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rax,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rax,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rax,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rax,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rax,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rax,%rdx)
	addq	$136, %rdx
	incq	%rcx
.LT_k$3:
	cmpq	$0, %rcx
	jb  	.LT_k$4
	call	.L_keccakf1600_avx2$1
.LT_k$2:
	movq	%xmm5, (%rax,%rdx)
	movq	%xmm4, 8(%rax,%rdx)
	ret
.LT_len$1:
	movq	%rdi, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdx
	vpbroadcastq	(%r8,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r8,%rdx), %rsi
	vmovq	%rsi, %xmm7
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rdx
	movl	(%r9), %esi
	bswapl	%esi
	movl	%esi, (%rdx)
	movl	4(%r9), %esi
	bswapl	%esi
	movl	%esi, 4(%rdx)
	movl	8(%r9), %esi
	bswapl	%esi
	movl	%esi, 8(%rdx)
	movl	12(%r9), %esi
	bswapl	%esi
	movl	%esi, 12(%rdx)
	movl	16(%r9), %esi
	bswapl	%esi
	movl	%esi, 16(%rdx)
	movl	20(%r9), %esi
	bswapl	%esi
	movl	%esi, 20(%rdx)
	movl	24(%r9), %esi
	bswapl	%esi
	movl	%esi, 24(%rdx)
	movl	28(%r9), %esi
	bswapl	%esi
	movl	%esi, 28(%rdx)
	leaq	16(%rsp), %rdx
	movq	$0, %rsi
	vmovdqu	(%rdx,%rsi), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vmovdqu	8(%rdx,%rsi), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rdx,%rsi), %rsi
	vmovq	%rsi, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rdx
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	(%rcx,%rdx), %ymm14
	movq	32(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm8
	vmovdqu	40(%rcx,%rdx), %ymm13
	movq	72(%rcx,%rdx), %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	movq	80(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm9
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	addq	$88, %rdx
	call	.L_keccakf1600_avx2$1
.LT_len$9:
	movq	$0, %rdi
	jmp 	.LT_len$6
.LT_len$7:
	vpbroadcastq	(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	48(%rcx,%rdx), %ymm14
	movq	80(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm8
	vmovdqu	88(%rcx,%rdx), %ymm13
	movq	120(%rcx,%rdx), %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	movq	128(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm9
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	addq	$136, %rdx
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%rdi
.LT_len$6:
	cmpq	$3, %rdi
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	48(%rcx,%rdx), %xmm9
	vmovdqu	%xmm9, %xmm9
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	vmovq	%rcx, %xmm11
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm8
	vinserti128	$1, %xmm8, %ymm9, %ymm14
	movq	$0, %rcx
	vmovq	%rcx, %xmm8
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rdi
	movq	$0, %rdx
	movq	$0, %rcx
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rdi,%rdx)
	vmovdqu	%ymm4, 8(%rdi,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rdi,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rdi,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rdi,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rdi,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rdi,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rdi,%rdx)
	addq	$136, %rdx
	incq	%rcx
.LT_len$3:
	cmpq	$0, %rcx
	jb  	.LT_len$4
	call	.L_keccakf1600_avx2$1
.LT_len$2:
	movq	%xmm5, (%rdi,%rdx)
	movq	%xmm4, 8(%rdi,%rdx)
	ret
.LH$1:
	movq	%rdi, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdx
	vpbroadcastq	(%r8,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r8,%rdx), %rsi
	vmovq	%rsi, %xmm7
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rdx
	movl	(%r9), %esi
	bswapl	%esi
	movl	%esi, (%rdx)
	movl	4(%r9), %esi
	bswapl	%esi
	movl	%esi, 4(%rdx)
	movl	8(%r9), %esi
	bswapl	%esi
	movl	%esi, 8(%rdx)
	movl	12(%r9), %esi
	bswapl	%esi
	movl	%esi, 12(%rdx)
	movl	16(%r9), %esi
	bswapl	%esi
	movl	%esi, 16(%rdx)
	movl	20(%r9), %esi
	bswapl	%esi
	movl	%esi, 20(%rdx)
	movl	24(%r9), %esi
	bswapl	%esi
	movl	%esi, 24(%rdx)
	movl	28(%r9), %esi
	bswapl	%esi
	movl	%esi, 28(%rdx)
	leaq	16(%rsp), %rdx
	movq	$0, %rsi
	vmovdqu	(%rdx,%rsi), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vmovdqu	8(%rdx,%rsi), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rdx,%rsi), %rsi
	vmovq	%rsi, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rdx
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	(%rax,%rdx), %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm9, %ymm14
	movq	$0, %rsi
	vmovq	%rsi, %xmm8
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rax
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	vmovdqu	(%rcx,%rax), %xmm8
	vinserti128	$1, %xmm8, %ymm9, %ymm14
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vmovq	%rcx, %xmm8
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rax
	movq	$0, %rdx
	movq	$0, %rcx
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rax,%rdx)
	vmovdqu	%ymm4, 8(%rax,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rax,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rax,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rax,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rax,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rax,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rax,%rdx)
	addq	$136, %rdx
	incq	%rcx
.LH$3:
	cmpq	$0, %rcx
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm5, (%rax,%rdx)
	movq	%xmm4, 8(%rax,%rdx)
	ret
.LF$1:
	movq	%rdi, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rax
	vpbroadcastq	(%r8,%rax), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r8,%rax), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r9), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%r9), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%r9), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%r9), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%r9), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%r9), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%r9), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%r9), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rax
	movq	$0, %rdx
	vmovdqu	(%rax,%rdx), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vmovdqu	8(%rax,%rdx), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rax,%rdx), %rcx
	vmovq	%rcx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rax
	movq	$0, %rcx
	vmovq	%rcx, %xmm7
	vmovdqu	(%rdi,%rax), %xmm9
	vmovdqu	%xmm9, %xmm9
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vmovq	%rcx, %xmm11
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm8
	vinserti128	$1, %xmm8, %ymm9, %ymm14
	movq	$0, %rcx
	vmovq	%rcx, %xmm8
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rax
	movq	$0, %rdx
	movq	$0, %rcx
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rax,%rdx)
	vmovdqu	%ymm4, 8(%rax,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rax,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rax,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rax,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rax,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rax,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rax,%rdx)
	addq	$136, %rdx
	incq	%rcx
.LF$3:
	cmpq	$0, %rcx
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm5, (%rax,%rdx)
	movq	%xmm4, 8(%rax,%rdx)
	ret
.LPRF$1:
	movq	%rax, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rax
	vpbroadcastq	(%r8,%rax), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r8,%rax), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r9), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%r9), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%r9), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%r9), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%r9), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%r9), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%r9), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%r9), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rax
	movq	$0, %rdx
	vmovdqu	(%rax,%rdx), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vmovdqu	8(%rax,%rdx), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rax,%rdx), %rcx
	vmovq	%rcx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rax
	movq	$0, %rcx
	vmovq	%rcx, %xmm7
	vmovdqu	(%rbx,%rax), %xmm9
	vmovdqu	%xmm9, %xmm9
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vmovq	%rcx, %xmm11
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm8
	vinserti128	$1, %xmm8, %ymm9, %ymm14
	movq	$0, %rcx
	vmovq	%rcx, %xmm8
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rax
	movq	$0, %rdx
	movq	$0, %rcx
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rax,%rdx)
	vmovdqu	%ymm4, 8(%rax,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rax,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rax,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rax,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rax,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rax,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rax,%rdx)
	addq	$136, %rdx
	incq	%rcx
.LPRF$3:
	cmpq	$0, %rcx
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm5, (%rax,%rdx)
	movq	%xmm4, 8(%rax,%rdx)
	ret
.LPRF_msg$1:
	movq	%r11, %mm0
	movq	%rax, 232(%rsp)
	movq	%rcx, 240(%rsp)
	movq	%rdx, 248(%rsp)
	movq	%r8, 256(%rsp)
	leaq	32(%rsp), %rax
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, 192(%rax)
	vmovdqu	(%r10), %xmm0
	vmovdqu	%xmm0, 32(%rsp)
	vmovdqu	(%r9), %xmm0
	vmovdqu	%xmm0, 48(%rsp)
	movb	$0, 64(%rsp)
	movb	%cl, 65(%rsp)
	movq	$34, %rsi
	movq	$0, %rcx
	movq	232(%rsp), %r11
	movq	240(%rsp), %rdx
	lfence
	movq	$0, %rax
	jmp 	.LPRF_msg$11
.LPRF_msg$12:
	cmpq	$136, %rsi
	jb  	.LPRF_msg$13
	movq	%r11, 240(%rsp)
	movq	%rcx, 232(%rsp)
	movq	%rdx, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$14:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %r11
	movq	232(%rsp), %rcx
	movq	264(%rsp), %rdx
	lfence
	movq	$0, %rax
	movq	$0, %rsi
.LPRF_msg$13:
	movb	(%r11,%rcx), %r9b
	incq	%rcx
	xorb	%r9b, 32(%rsp,%rsi)
	incq	%rsi
.LPRF_msg$11:
	cmpq	%rdx, %rcx
	jb  	.LPRF_msg$12
	movq	$0, %rcx
	movq	248(%rsp), %rdx
	movq	256(%rsp), %r8
	lfence
	movq	$0, %rax
	jmp 	.LPRF_msg$7
.LPRF_msg$8:
	cmpq	$136, %rsi
	jb  	.LPRF_msg$9
	movq	%rdx, 256(%rsp)
	movq	%rcx, 248(%rsp)
	movq	%r8, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$10:
	leaq	200(%rsp), %rsp
	movq	256(%rsp), %rdx
	movq	248(%rsp), %rcx
	movq	264(%rsp), %r8
	lfence
	movq	$0, %rax
	movq	$0, %rsi
.LPRF_msg$9:
	movb	(%rdx,%rcx), %r9b
	incq	%rcx
	xorb	%r9b, 32(%rsp,%rsi)
	incq	%rsi
.LPRF_msg$7:
	cmpq	%r8, %rcx
	jb  	.LPRF_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rsi
	jb  	.LPRF_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %rsi
.LPRF_msg$5:
	xorb	$31, 32(%rsp,%rsi)
	leaq	32(%rsp), %rax
	cmpq	$136, %rsi
	jb  	.LPRF_msg$3
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$4:
	leaq	200(%rsp), %rsp
.LPRF_msg$3:
	xorb	$128, 167(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$2:
	leaq	200(%rsp), %rsp
	movq	%mm0, %rax
	vmovdqu	32(%rsp), %xmm0
	vmovdqu	%xmm0, (%rax)
	ret
.LH_msg$1:
	movq	%rdi, %mm0
	movq	%r11, 232(%rsp)
	movq	%rcx, 240(%rsp)
	movq	%rdx, 248(%rsp)
	movq	%rsi, 256(%rsp)
	leaq	32(%rsp), %rax
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, 192(%rax)
	vmovdqu	(%r8), %xmm0
	vmovdqu	%xmm0, 32(%rsp)
	vmovdqu	(%r9), %xmm0
	vmovdqu	%xmm0, 48(%rsp)
	vmovdqu	(%r10), %xmm0
	vmovdqu	%xmm0, 64(%rsp)
	movb	$0, 80(%rsp)
	movb	%cl, 81(%rsp)
	movq	$50, %rsi
	movq	$0, %rcx
	movq	232(%rsp), %r11
	movq	240(%rsp), %rdx
	lfence
	movq	$0, %rax
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %rsi
	jb  	.LH_msg$13
	movq	%r11, 240(%rsp)
	movq	%rcx, 232(%rsp)
	movq	%rdx, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$14:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %r11
	movq	232(%rsp), %rcx
	movq	264(%rsp), %rdx
	lfence
	movq	$0, %rax
	movq	$0, %rsi
.LH_msg$13:
	movb	(%r11,%rcx), %r9b
	incq	%rcx
	xorb	%r9b, 32(%rsp,%rsi)
	incq	%rsi
.LH_msg$11:
	cmpq	%rdx, %rcx
	jb  	.LH_msg$12
	movq	$0, %rcx
	movq	248(%rsp), %rdx
	movq	256(%rsp), %r8
	lfence
	movq	$0, %rax
	jmp 	.LH_msg$7
.LH_msg$8:
	cmpq	$136, %rsi
	jb  	.LH_msg$9
	movq	%rdx, 256(%rsp)
	movq	%rcx, 248(%rsp)
	movq	%r8, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$10:
	leaq	200(%rsp), %rsp
	movq	256(%rsp), %rdx
	movq	248(%rsp), %rcx
	movq	264(%rsp), %r8
	lfence
	movq	$0, %rax
	movq	$0, %rsi
.LH_msg$9:
	movb	(%rdx,%rcx), %r9b
	incq	%rcx
	xorb	%r9b, 32(%rsp,%rsi)
	incq	%rsi
.LH_msg$7:
	cmpq	%r8, %rcx
	jb  	.LH_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rsi
	jb  	.LH_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %rsi
.LH_msg$5:
	xorb	$31, 32(%rsp,%rsi)
	leaq	32(%rsp), %rax
	cmpq	$136, %rsi
	jb  	.LH_msg$3
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$4:
	leaq	200(%rsp), %rsp
.LH_msg$3:
	xorb	$128, 167(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$2:
	leaq	200(%rsp), %rsp
	movq	%mm0, %rdi
	movb	32(%rsp), %r9b
	movb	%r9b, (%rdi)
	movb	33(%rsp), %r9b
	movb	%r9b, 1(%rdi)
	movb	34(%rsp), %r9b
	movb	%r9b, 2(%rdi)
	movb	35(%rsp), %r9b
	movb	%r9b, 3(%rdi)
	movb	36(%rsp), %r9b
	movb	%r9b, 4(%rdi)
	movb	37(%rsp), %r9b
	movb	%r9b, 5(%rdi)
	movb	38(%rsp), %r9b
	movb	%r9b, 6(%rdi)
	movb	39(%rsp), %r9b
	movb	%r9b, 7(%rdi)
	movb	40(%rsp), %r9b
	movb	%r9b, 8(%rdi)
	movb	41(%rsp), %r9b
	movb	%r9b, 9(%rdi)
	movb	42(%rsp), %r9b
	movb	%r9b, 10(%rdi)
	movb	43(%rsp), %r9b
	movb	%r9b, 11(%rdi)
	movb	44(%rsp), %r9b
	movb	%r9b, 12(%rdi)
	movb	45(%rsp), %r9b
	movb	%r9b, 13(%rdi)
	movb	46(%rsp), %r9b
	movb	%r9b, 14(%rdi)
	movb	47(%rsp), %r9b
	movb	%r9b, 15(%rdi)
	movb	48(%rsp), %r9b
	movb	%r9b, 16(%rdi)
	movb	49(%rsp), %r9b
	movb	%r9b, 17(%rdi)
	movb	50(%rsp), %r9b
	movb	%r9b, 18(%rdi)
	movb	51(%rsp), %r9b
	movb	%r9b, 19(%rdi)
	movb	52(%rsp), %r9b
	movb	%r9b, 20(%rdi)
	movb	53(%rsp), %r9b
	movb	%r9b, 21(%rdi)
	movb	54(%rsp), %r9b
	movb	%r9b, 22(%rdi)
	movb	55(%rsp), %r9b
	movb	%r9b, 23(%rdi)
	movb	56(%rsp), %r9b
	movb	%r9b, 24(%rdi)
	movb	57(%rsp), %r9b
	movb	%r9b, 25(%rdi)
	movb	58(%rsp), %r9b
	movb	%r9b, 26(%rdi)
	movb	59(%rsp), %r9b
	movb	%r9b, 27(%rdi)
	movb	60(%rsp), %r9b
	movb	%r9b, 28(%rdi)
	movb	61(%rsp), %r9b
	movb	%r9b, 29(%rdi)
	movb	62(%rsp), %r9b
	movb	%r9b, 30(%rdi)
	movb	63(%rsp), %r9b
	movb	%r9b, 31(%rdi)
	movb	64(%rsp), %r9b
	movb	%r9b, 32(%rdi)
	movb	65(%rsp), %r9b
	movb	%r9b, 33(%rdi)
	ret
.Lthash_x4_2n__thash_x4$1:
	movq	%rdi, %mm0
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vmovdqu	%ymm0, 64(%rsp)
	vmovdqu	%ymm0, 96(%rsp)
	vmovdqu	%ymm0, 128(%rsp)
	vmovdqu	%ymm0, 160(%rsp)
	vmovdqu	%ymm0, 192(%rsp)
	vmovdqu	%ymm0, 224(%rsp)
	vmovdqu	%ymm0, 256(%rsp)
	vmovdqu	%ymm0, 288(%rsp)
	vmovdqu	%ymm0, 320(%rsp)
	vmovdqu	%ymm0, 352(%rsp)
	vmovdqu	%ymm0, 384(%rsp)
	vmovdqu	%ymm0, 416(%rsp)
	vmovdqu	%ymm0, 448(%rsp)
	vmovdqu	%ymm0, 480(%rsp)
	vmovdqu	%ymm0, 512(%rsp)
	vmovdqu	%ymm0, 544(%rsp)
	vmovdqu	%ymm0, 576(%rsp)
	vmovdqu	%ymm0, 608(%rsp)
	vmovdqu	%ymm0, 640(%rsp)
	vmovdqu	%ymm0, 672(%rsp)
	vmovdqu	%ymm0, 704(%rsp)
	vmovdqu	%ymm0, 736(%rsp)
	vmovdqu	%ymm0, 768(%rsp)
	vmovdqu	%ymm0, 800(%rsp)
	movq	(%r8), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rcx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	8(%r8), %rcx
	movq	%rcx, 64(%rsp)
	movq	%rcx, 72(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rcx, 88(%rsp)
	movl	(%r9), %ecx
	bswapl	%ecx
	movl	4(%r9), %edx
	bswapl	%edx
	movl	%ecx, 96(%rsp)
	movl	%edx, 100(%rsp)
	movl	%ecx, 104(%rsp)
	movl	%edx, 108(%rsp)
	movl	%ecx, 112(%rsp)
	movl	%edx, 116(%rsp)
	movl	%ecx, 120(%rsp)
	movl	%edx, 124(%rsp)
	movl	8(%r9), %ecx
	bswapl	%ecx
	movl	12(%r9), %edx
	bswapl	%edx
	movl	%ecx, 128(%rsp)
	movl	%edx, 132(%rsp)
	movl	%ecx, 136(%rsp)
	movl	%edx, 140(%rsp)
	movl	%ecx, 144(%rsp)
	movl	%edx, 148(%rsp)
	movl	%ecx, 152(%rsp)
	movl	%edx, 156(%rsp)
	movl	16(%r9), %ecx
	bswapl	%ecx
	movl	20(%r9), %edx
	bswapl	%edx
	movl	%ecx, 160(%rsp)
	movl	%edx, 164(%rsp)
	movl	%ecx, 168(%rsp)
	movl	%edx, 172(%rsp)
	movl	%ecx, 176(%rsp)
	movl	%edx, 180(%rsp)
	movl	%ecx, 184(%rsp)
	movl	%edx, 188(%rsp)
	movl	(%rax), %ecx
	bswapl	%ecx
	movl	4(%rax), %edx
	bswapl	%edx
	movl	%ecx, 192(%rsp)
	movl	%edx, 196(%rsp)
	movl	8(%rax), %ecx
	bswapl	%ecx
	movl	12(%rax), %edx
	bswapl	%edx
	movl	%ecx, 200(%rsp)
	movl	%edx, 204(%rsp)
	movl	16(%rax), %ecx
	bswapl	%ecx
	movl	20(%rax), %edx
	bswapl	%edx
	movl	%ecx, 208(%rsp)
	movl	%edx, 212(%rsp)
	movl	24(%rax), %ecx
	bswapl	%ecx
	movl	28(%rax), %edx
	bswapl	%edx
	movl	%ecx, 216(%rsp)
	movl	%edx, 220(%rsp)
	movq	(%rsi), %rcx
	movq	%rcx, 224(%rsp)
	movq	32(%rsi), %rcx
	movq	%rcx, 232(%rsp)
	movq	64(%rsi), %rcx
	movq	%rcx, 240(%rsp)
	movq	96(%rsi), %rcx
	movq	%rcx, 248(%rsp)
	movq	8(%rsi), %rcx
	movq	%rcx, 256(%rsp)
	movq	40(%rsi), %rcx
	movq	%rcx, 264(%rsp)
	movq	72(%rsi), %rcx
	movq	%rcx, 272(%rsp)
	movq	104(%rsi), %rcx
	movq	%rcx, 280(%rsp)
	movq	16(%rsi), %rcx
	movq	%rcx, 288(%rsp)
	movq	48(%rsi), %rcx
	movq	%rcx, 296(%rsp)
	movq	80(%rsi), %rcx
	movq	%rcx, 304(%rsp)
	movq	112(%rsi), %rcx
	movq	%rcx, 312(%rsp)
	movq	24(%rsi), %rcx
	movq	%rcx, 320(%rsp)
	movq	56(%rsi), %rcx
	movq	%rcx, 328(%rsp)
	movq	88(%rsi), %rcx
	movq	%rcx, 336(%rsp)
	movq	120(%rsi), %rcx
	movq	%rcx, 344(%rsp)
	movq	$-9223372036854775808, %rax
	movq	352(%rsp), %rcx
	xorq	$31, %rcx
	movq	%rcx, 352(%rsp)
	movq	544(%rsp), %rcx
	xorq	%rax, %rcx
	movq	%rcx, 544(%rsp)
	movq	360(%rsp), %rcx
	xorq	$31, %rcx
	movq	%rcx, 360(%rsp)
	movq	552(%rsp), %rcx
	xorq	%rax, %rcx
	movq	%rcx, 552(%rsp)
	movq	368(%rsp), %rcx
	xorq	$31, %rcx
	movq	%rcx, 368(%rsp)
	movq	560(%rsp), %rcx
	xorq	%rax, %rcx
	movq	%rcx, 560(%rsp)
	movq	376(%rsp), %rcx
	xorq	$31, %rcx
	movq	%rcx, 376(%rsp)
	movq	568(%rsp), %rcx
	xorq	%rax, %rcx
	movq	%rcx, 568(%rsp)
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.Lthash_x4_2n__thash_x4$2:
	movq	%mm0, %rax
	movq	32(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	64(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	40(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 24(%rax)
	movq	48(%rsp), %rcx
	movq	%rcx, 32(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 40(%rax)
	movq	56(%rsp), %rcx
	movq	%rcx, 48(%rax)
	movq	88(%rsp), %rcx
	movq	%rcx, 56(%rax)
	ret
.Lthash_x4_n__thash_x4$1:
	movq	%rdi, %mm1
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vmovdqu	%ymm0, 64(%rsp)
	vmovdqu	%ymm0, 96(%rsp)
	vmovdqu	%ymm0, 128(%rsp)
	vmovdqu	%ymm0, 160(%rsp)
	vmovdqu	%ymm0, 192(%rsp)
	vmovdqu	%ymm0, 224(%rsp)
	vmovdqu	%ymm0, 256(%rsp)
	vmovdqu	%ymm0, 288(%rsp)
	vmovdqu	%ymm0, 320(%rsp)
	vmovdqu	%ymm0, 352(%rsp)
	vmovdqu	%ymm0, 384(%rsp)
	vmovdqu	%ymm0, 416(%rsp)
	vmovdqu	%ymm0, 448(%rsp)
	vmovdqu	%ymm0, 480(%rsp)
	vmovdqu	%ymm0, 512(%rsp)
	vmovdqu	%ymm0, 544(%rsp)
	vmovdqu	%ymm0, 576(%rsp)
	vmovdqu	%ymm0, 608(%rsp)
	vmovdqu	%ymm0, 640(%rsp)
	vmovdqu	%ymm0, 672(%rsp)
	vmovdqu	%ymm0, 704(%rsp)
	vmovdqu	%ymm0, 736(%rsp)
	vmovdqu	%ymm0, 768(%rsp)
	vmovdqu	%ymm0, 800(%rsp)
	movq	(%r8), %rdx
	movq	%rdx, 32(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rdx, 56(%rsp)
	movq	8(%r8), %rdx
	movq	%rdx, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rdx, 80(%rsp)
	movq	%rdx, 88(%rsp)
	movl	(%r9), %edx
	bswapl	%edx
	movl	4(%r9), %edi
	bswapl	%edi
	movl	%edx, 96(%rsp)
	movl	%edi, 100(%rsp)
	movl	%edx, 104(%rsp)
	movl	%edi, 108(%rsp)
	movl	%edx, 112(%rsp)
	movl	%edi, 116(%rsp)
	movl	%edx, 120(%rsp)
	movl	%edi, 124(%rsp)
	movl	8(%r9), %edx
	bswapl	%edx
	movl	12(%r9), %edi
	bswapl	%edi
	movl	%edx, 128(%rsp)
	movl	%edi, 132(%rsp)
	movl	%edx, 136(%rsp)
	movl	%edi, 140(%rsp)
	movl	%edx, 144(%rsp)
	movl	%edi, 148(%rsp)
	movl	%edx, 152(%rsp)
	movl	%edi, 156(%rsp)
	movl	16(%r9), %edx
	bswapl	%edx
	movl	20(%r9), %edi
	bswapl	%edi
	movl	%edx, 160(%rsp)
	movl	%edi, 164(%rsp)
	movl	%edx, 168(%rsp)
	movl	%edi, 172(%rsp)
	movl	%edx, 176(%rsp)
	movl	%edi, 180(%rsp)
	movl	%edx, 184(%rsp)
	movl	%edi, 188(%rsp)
	movl	(%rcx), %edx
	bswapl	%edx
	movl	4(%rcx), %edi
	bswapl	%edi
	movl	%edx, 192(%rsp)
	movl	%edi, 196(%rsp)
	movl	8(%rcx), %edx
	bswapl	%edx
	movl	12(%rcx), %edi
	bswapl	%edi
	movl	%edx, 200(%rsp)
	movl	%edi, 204(%rsp)
	movl	16(%rcx), %edx
	bswapl	%edx
	movl	20(%rcx), %edi
	bswapl	%edi
	movl	%edx, 208(%rsp)
	movl	%edi, 212(%rsp)
	movl	24(%rcx), %edx
	bswapl	%edx
	movl	28(%rcx), %ecx
	bswapl	%ecx
	movl	%edx, 216(%rsp)
	movl	%ecx, 220(%rsp)
	movq	(%rsi), %rcx
	movq	%rcx, 224(%rsp)
	movq	16(%rsi), %rcx
	movq	%rcx, 232(%rsp)
	movq	32(%rsi), %rcx
	movq	%rcx, 240(%rsp)
	movq	48(%rsi), %rcx
	movq	%rcx, 248(%rsp)
	movq	8(%rsi), %rcx
	movq	%rcx, 256(%rsp)
	movq	24(%rsi), %rcx
	movq	%rcx, 264(%rsp)
	movq	40(%rsi), %rcx
	movq	%rcx, 272(%rsp)
	movq	56(%rsi), %rcx
	movq	%rcx, 280(%rsp)
	movq	$-9223372036854775808, %rdx
	movq	288(%rsp), %rcx
	xorq	$31, %rcx
	movq	%rcx, 288(%rsp)
	movq	544(%rsp), %rcx
	xorq	%rdx, %rcx
	movq	%rcx, 544(%rsp)
	movq	296(%rsp), %rcx
	xorq	$31, %rcx
	movq	%rcx, 296(%rsp)
	movq	552(%rsp), %rcx
	xorq	%rdx, %rcx
	movq	%rcx, 552(%rsp)
	movq	304(%rsp), %rcx
	xorq	$31, %rcx
	movq	%rcx, 304(%rsp)
	movq	560(%rsp), %rcx
	xorq	%rdx, %rcx
	movq	%rcx, 560(%rsp)
	movq	312(%rsp), %rcx
	xorq	$31, %rcx
	movq	%rcx, 312(%rsp)
	movq	568(%rsp), %rcx
	xorq	%rdx, %rcx
	movq	%rcx, 568(%rsp)
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.Lthash_x4_n__thash_x4$2:
	movq	%mm1, %rdi
	movq	32(%rsp), %rcx
	movq	%rcx, (%rdi)
	movq	64(%rsp), %rcx
	movq	%rcx, 8(%rdi)
	movq	40(%rsp), %rcx
	movq	%rcx, 16(%rdi)
	movq	72(%rsp), %rcx
	movq	%rcx, 24(%rdi)
	movq	48(%rsp), %rcx
	movq	%rcx, 32(%rdi)
	movq	80(%rsp), %rcx
	movq	%rcx, 40(%rdi)
	movq	56(%rsp), %rcx
	movq	%rcx, 48(%rdi)
	movq	88(%rsp), %rcx
	movq	%rcx, 56(%rdi)
	ret
.L_keccakf1600_avx2x4_nat$1:
	vmovdqu	224(%rcx), %ymm10
	vmovdqu	256(%rcx), %ymm13
	vmovdqu	352(%rcx), %ymm7
	vmovdqu	384(%rcx), %ymm0
	vmovdqu	480(%rcx), %ymm4
	vmovdqu	576(%rcx), %ymm1
	vmovdqu	672(%rcx), %ymm14
	vmovdqu	704(%rcx), %ymm2
	vmovdqu	768(%rcx), %ymm3
	leaq	glob_data + 0(%rip), %rdx
	leaq	glob_data + 32(%rip), %rsi
	leaq	glob_data + 448(%rip), %rdi
	movq	$0, %r8
.L_keccakf1600_avx2x4_nat$2:
	vmovdqu	160(%rcx), %ymm12
	vpxor	640(%rcx), %ymm4, %ymm9
	vmovdqu	%ymm4, 224(%rcx)
	vmovdqu	%ymm10, %ymm4
	vmovdqu	192(%rcx), %ymm8
	vmovdqu	512(%rcx), %ymm6
	vmovdqu	%ymm14, 352(%rcx)
	vpxor	320(%rcx), %ymm12, %ymm11
	vmovdqu	64(%rcx), %ymm10
	vmovdqu	%ymm12, 256(%rcx)
	vpxor	%ymm14, %ymm6, %ymm6
	vmovdqu	32(%rcx), %ymm5
	vmovdqu	448(%rcx), %ymm12
	vmovdqu	%ymm13, 576(%rcx)
	vpxor	%ymm11, %ymm9, %ymm9
	vpxor	%ymm7, %ymm8, %ymm11
	vpxor	544(%rcx), %ymm2, %ymm8
	vmovdqu	%ymm10, 480(%rcx)
	vpxor	%ymm11, %ymm6, %ymm6
	vpxor	%ymm0, %ymm4, %ymm11
	vmovdqu	288(%rcx), %ymm14
	vmovdqu	%ymm7, 384(%rcx)
	vpxor	%ymm11, %ymm8, %ymm8
	vpxor	416(%rcx), %ymm13, %ymm11
	vpxor	%ymm5, %ymm6, %ymm6
	vmovdqu	96(%rcx), %ymm7
	vpxor	%ymm10, %ymm8, %ymm8
	vpxor	736(%rcx), %ymm1, %ymm10
	vpxor	%ymm12, %ymm14, %ymm14
	vmovdqu	%ymm12, 672(%rcx)
	vpsrlq	$63, %ymm6, %ymm12
	vpsrlq	$63, %ymm8, %ymm15
	vpxor	(%rcx), %ymm9, %ymm9
	vpxor	%ymm11, %ymm10, %ymm10
	vmovdqu	128(%rcx), %ymm13
	vpxor	%ymm7, %ymm10, %ymm10
	vpxor	608(%rcx), %ymm3, %ymm11
	vmovdqu	%ymm13, 704(%rcx)
	vpxor	%ymm14, %ymm11, %ymm11
	vpsllq	$1, %ymm6, %ymm14
	vpor	%ymm12, %ymm14, %ymm14
	vpsllq	$1, %ymm8, %ymm12
	vpxor	%ymm13, %ymm11, %ymm11
	vpor	%ymm15, %ymm12, %ymm12
	vpsrlq	$63, %ymm10, %ymm13
	vpxor	%ymm11, %ymm14, %ymm14
	vpsllq	$1, %ymm10, %ymm15
	vpxor	%ymm9, %ymm12, %ymm12
	vpor	%ymm13, %ymm15, %ymm15
	vpxor	%ymm5, %ymm12, %ymm5
	vpxor	%ymm6, %ymm15, %ymm15
	vpsrlq	$63, %ymm11, %ymm6
	vpsllq	$1, %ymm11, %ymm11
	vpxor	%ymm2, %ymm15, %ymm2
	vpxor	%ymm4, %ymm15, %ymm4
	vpor	%ymm6, %ymm11, %ymm11
	vpxor	(%rcx), %ymm14, %ymm6
	vpxor	%ymm8, %ymm11, %ymm11
	vpsrlq	$63, %ymm9, %ymm8
	vpsllq	$1, %ymm9, %ymm9
	vpxor	%ymm1, %ymm11, %ymm1
	vpxor	%ymm7, %ymm11, %ymm7
	vpor	%ymm8, %ymm9, %ymm9
	vpxor	%ymm10, %ymm9, %ymm9
	vpxor	192(%rcx), %ymm12, %ymm10
	vpxor	%ymm3, %ymm9, %ymm3
	vpsrlq	$20, %ymm10, %ymm8
	vpsllq	$44, %ymm10, %ymm10
	vpor	%ymm8, %ymm10, %ymm10
	vpxor	%ymm0, %ymm15, %ymm8
	vpbroadcastq	(%rdi,%r8,8), %ymm0
	vpsrlq	$21, %ymm8, %ymm13
	vpsllq	$43, %ymm8, %ymm8
	vpor	%ymm13, %ymm8, %ymm8
	vpandn	%ymm8, %ymm10, %ymm13
	vpxor	%ymm0, %ymm13, %ymm13
	vpxor	%ymm6, %ymm13, %ymm0
	vpsrlq	$43, %ymm1, %ymm13
	vpsllq	$21, %ymm1, %ymm1
	vmovdqu	%ymm0, (%rcx)
	vpor	%ymm13, %ymm1, %ymm1
	vpandn	%ymm1, %ymm8, %ymm13
	vpxor	%ymm10, %ymm13, %ymm0
	vpsrlq	$50, %ymm3, %ymm13
	vpsllq	$14, %ymm3, %ymm3
	vmovdqu	%ymm0, 32(%rcx)
	vpor	%ymm13, %ymm3, %ymm3
	vpandn	%ymm3, %ymm1, %ymm13
	vpxor	%ymm8, %ymm13, %ymm8
	vmovdqu	%ymm8, 64(%rcx)
	vpandn	%ymm6, %ymm3, %ymm8
	vpandn	%ymm10, %ymm6, %ymm6
	vpxor	%ymm1, %ymm8, %ymm8
	vmovdqu	%ymm8, 96(%rcx)
	vpxor	%ymm3, %ymm6, %ymm8
	vpsrlq	$36, %ymm7, %ymm3
	vpsllq	$28, %ymm7, %ymm7
	vmovdqu	%ymm8, 128(%rcx)
	vpor	%ymm3, %ymm7, %ymm7
	vpxor	288(%rcx), %ymm9, %ymm3
	vpsrlq	$44, %ymm3, %ymm10
	vpsllq	$20, %ymm3, %ymm3
	vpor	%ymm10, %ymm3, %ymm3
	vpxor	320(%rcx), %ymm14, %ymm10
	vpsrlq	$61, %ymm10, %ymm8
	vpsllq	$3, %ymm10, %ymm10
	vpor	%ymm8, %ymm10, %ymm10
	vpandn	%ymm10, %ymm3, %ymm8
	vpxor	%ymm7, %ymm8, %ymm8
	vmovdqu	%ymm8, 160(%rcx)
	vpxor	512(%rcx), %ymm12, %ymm8
	vpsrlq	$19, %ymm8, %ymm6
	vpsllq	$45, %ymm8, %ymm8
	vpor	%ymm6, %ymm8, %ymm8
	vpandn	%ymm8, %ymm10, %ymm6
	vpxor	%ymm3, %ymm6, %ymm6
	vmovdqu	%ymm6, 192(%rcx)
	vpsrlq	$3, %ymm2, %ymm6
	vpsllq	$61, %ymm2, %ymm2
	vpor	%ymm6, %ymm2, %ymm2
	vpandn	%ymm2, %ymm8, %ymm6
	vpxor	%ymm10, %ymm6, %ymm10
	vpandn	%ymm7, %ymm2, %ymm6
	vpandn	%ymm3, %ymm7, %ymm7
	vpsrlq	$63, %ymm5, %ymm3
	vpsllq	$1, %ymm5, %ymm5
	vpxor	%ymm8, %ymm6, %ymm13
	vpor	%ymm3, %ymm5, %ymm5
	vpsrlq	$58, %ymm4, %ymm3
	vpxor	%ymm2, %ymm7, %ymm6
	vpsllq	$6, %ymm4, %ymm4
	vmovdqu	%ymm6, 288(%rcx)
	vpxor	608(%rcx), %ymm9, %ymm2
	vpor	%ymm3, %ymm4, %ymm4
	vpxor	416(%rcx), %ymm11, %ymm3
	vpshufb	(%rdx), %ymm2, %ymm2
	vpsrlq	$39, %ymm3, %ymm8
	vpsllq	$25, %ymm3, %ymm3
	vpor	%ymm3, %ymm8, %ymm8
	vpandn	%ymm8, %ymm4, %ymm3
	vpandn	%ymm2, %ymm8, %ymm7
	vpxor	%ymm5, %ymm3, %ymm6
	vpxor	640(%rcx), %ymm14, %ymm3
	vpxor	%ymm4, %ymm7, %ymm7
	vmovdqu	%ymm6, 320(%rcx)
	vpsrlq	$46, %ymm3, %ymm6
	vpsllq	$18, %ymm3, %ymm3
	vpor	%ymm3, %ymm6, %ymm3
	vpandn	%ymm3, %ymm2, %ymm6
	vpxor	%ymm8, %ymm6, %ymm0
	vpandn	%ymm5, %ymm3, %ymm8
	vpandn	%ymm4, %ymm5, %ymm5
	vpxor	%ymm2, %ymm8, %ymm6
	vmovdqu	%ymm6, 416(%rcx)
	vpxor	%ymm3, %ymm5, %ymm6
	vpxor	704(%rcx), %ymm9, %ymm5
	vpxor	672(%rcx), %ymm9, %ymm9
	vmovdqu	%ymm6, 448(%rcx)
	vpsrlq	$37, %ymm5, %ymm3
	vpsllq	$27, %ymm5, %ymm5
	vpor	%ymm5, %ymm3, %ymm3
	vpxor	256(%rcx), %ymm14, %ymm5
	vpxor	224(%rcx), %ymm14, %ymm14
	vpsrlq	$28, %ymm5, %ymm2
	vpsllq	$36, %ymm5, %ymm5
	vpor	%ymm5, %ymm2, %ymm2
	vpxor	384(%rcx), %ymm12, %ymm5
	vpxor	352(%rcx), %ymm12, %ymm12
	vpsrlq	$54, %ymm5, %ymm6
	vpsllq	$10, %ymm5, %ymm5
	vpor	%ymm5, %ymm6, %ymm6
	vpxor	544(%rcx), %ymm15, %ymm5
	vpxor	480(%rcx), %ymm15, %ymm15
	vpandn	%ymm6, %ymm2, %ymm4
	vpsrlq	$49, %ymm5, %ymm8
	vpsllq	$15, %ymm5, %ymm5
	vpxor	%ymm3, %ymm4, %ymm4
	vpor	%ymm5, %ymm8, %ymm8
	vpandn	%ymm8, %ymm6, %ymm5
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	%ymm5, 512(%rcx)
	vpxor	736(%rcx), %ymm11, %ymm5
	vpxor	576(%rcx), %ymm11, %ymm11
	vpshufb	(%rsi), %ymm5, %ymm5
	vpandn	%ymm5, %ymm8, %ymm1
	vpxor	%ymm6, %ymm1, %ymm1
	vmovdqu	%ymm1, 544(%rcx)
	vpandn	%ymm3, %ymm5, %ymm1
	vpandn	%ymm2, %ymm3, %ymm3
	vpxor	%ymm5, %ymm3, %ymm3
	vpsrlq	$62, %ymm12, %ymm5
	vpxor	%ymm8, %ymm1, %ymm1
	vmovdqu	%ymm3, 608(%rcx)
	vpsrlq	$2, %ymm15, %ymm3
	vpsllq	$62, %ymm15, %ymm15
	vpor	%ymm15, %ymm3, %ymm3
	vpsrlq	$9, %ymm11, %ymm15
	vpsllq	$55, %ymm11, %ymm11
	vpsllq	$2, %ymm12, %ymm12
	vpor	%ymm11, %ymm15, %ymm11
	vpsrlq	$25, %ymm9, %ymm15
	vpor	%ymm12, %ymm5, %ymm12
	vpsllq	$39, %ymm9, %ymm9
	vpor	%ymm9, %ymm15, %ymm15
	vpandn	%ymm15, %ymm11, %ymm9
	vpxor	%ymm3, %ymm9, %ymm9
	vmovdqu	%ymm9, 640(%rcx)
	vpsrlq	$23, %ymm14, %ymm9
	vpsllq	$41, %ymm14, %ymm14
	vpor	%ymm14, %ymm9, %ymm9
	vpandn	%ymm12, %ymm9, %ymm2
	vpandn	%ymm9, %ymm15, %ymm14
	vpxor	%ymm15, %ymm2, %ymm2
	vpandn	%ymm3, %ymm12, %ymm15
	vpandn	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm15, %ymm15
	vpxor	%ymm11, %ymm14, %ymm14
	vpxor	%ymm12, %ymm3, %ymm3
	vmovdqu	%ymm15, 736(%rcx)
	incq	%r8
	cmpq	$24, %r8
	jb  	.L_keccakf1600_avx2x4_nat$2
	vmovdqu	%ymm10, 224(%rcx)
	vmovdqu	%ymm13, 256(%rcx)
	vmovdqu	%ymm7, 352(%rcx)
	vmovdqu	%ymm0, 384(%rcx)
	vmovdqu	%ymm4, 480(%rcx)
	vmovdqu	%ymm1, 576(%rcx)
	vmovdqu	%ymm14, 672(%rcx)
	vmovdqu	%ymm2, 704(%rcx)
	vmovdqu	%ymm3, 768(%rcx)
	ret
.L_keccakf1600_avx2$1:
	call	.L__keccakf1600_avx2$1
.L_keccakf1600_avx2$2:
	ret
.L__keccakf1600_avx2$1:
	leaq	glob_data + 448(%rip), %rsi
	movq	$0, %r8
.L__keccakf1600_avx2$2:
	vpshufd	$78, %ymm6, %ymm8
	vpxor	%ymm0, %ymm1, %ymm7
	vpxor	%ymm3, %ymm2, %ymm10
	vpxor	%ymm4, %ymm7, %ymm7
	vpxor	%ymm10, %ymm7, %ymm10
	vpermq	$147, %ymm10, %ymm7
	vpxor	%ymm6, %ymm8, %ymm8
	vpermq	$78, %ymm8, %ymm9
	vpsrlq	$63, %ymm10, %ymm11
	vpaddq	%ymm10, %ymm10, %ymm10
	vpor	%ymm10, %ymm11, %ymm11
	vpermq	$57, %ymm11, %ymm10
	vpxor	%ymm7, %ymm11, %ymm11
	vpermq	$0, %ymm11, %ymm11
	vpxor	%ymm5, %ymm8, %ymm8
	vpxor	%ymm9, %ymm8, %ymm8
	vpsrlq	$63, %ymm8, %ymm9
	vpaddq	%ymm8, %ymm8, %ymm12
	vpor	%ymm9, %ymm12, %ymm12
	vpxor	%ymm11, %ymm6, %ymm6
	vpxor	%ymm11, %ymm5, %ymm5
	vpblendd	$192, %ymm12, %ymm10, %ymm10
	vpblendd	$3, %ymm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm10, %ymm10
	vpsllvq	glob_data + 256(%rip), %ymm6, %ymm7
	vpsrlvq	glob_data + 64(%rip), %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vpxor	%ymm10, %ymm0, %ymm0
	vpsllvq	glob_data + 320(%rip), %ymm0, %ymm7
	vpsrlvq	glob_data + 128(%rip), %ymm0, %ymm0
	vpor	%ymm7, %ymm0, %ymm0
	vpxor	%ymm10, %ymm2, %ymm2
	vpsllvq	glob_data + 352(%rip), %ymm2, %ymm7
	vpsrlvq	glob_data + 160(%rip), %ymm2, %ymm2
	vpor	%ymm7, %ymm2, %ymm9
	vpxor	%ymm10, %ymm1, %ymm1
	vpsllvq	glob_data + 384(%rip), %ymm1, %ymm2
	vpsrlvq	glob_data + 192(%rip), %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vpermq	$141, %ymm6, %ymm2
	vpermq	$141, %ymm0, %ymm7
	vpsllvq	glob_data + 416(%rip), %ymm3, %ymm0
	vpsrlvq	glob_data + 224(%rip), %ymm3, %ymm8
	vpor	%ymm0, %ymm8, %ymm8
	vpxor	%ymm10, %ymm4, %ymm11
	vpermq	$27, %ymm9, %ymm4
	vpermq	$114, %ymm1, %ymm9
	vpsllvq	glob_data + 288(%rip), %ymm11, %ymm0
	vpsrlvq	glob_data + 96(%rip), %ymm11, %ymm10
	vpor	%ymm0, %ymm10, %ymm10
	vpsrldq	$8, %ymm8, %ymm0
	vpandn	%ymm0, %ymm8, %ymm0
	vpblendd	$12, %ymm9, %ymm10, %ymm1
	vpblendd	$12, %ymm10, %ymm7, %ymm3
	vpblendd	$12, %ymm7, %ymm2, %ymm6
	vpblendd	$12, %ymm2, %ymm10, %ymm11
	vpblendd	$48, %ymm7, %ymm1, %ymm1
	vpblendd	$48, %ymm4, %ymm3, %ymm3
	vpblendd	$48, %ymm10, %ymm6, %ymm6
	vpblendd	$48, %ymm9, %ymm11, %ymm11
	vpblendd	$192, %ymm4, %ymm1, %ymm1
	vpblendd	$192, %ymm9, %ymm3, %ymm3
	vpblendd	$192, %ymm9, %ymm6, %ymm6
	vpblendd	$192, %ymm7, %ymm11, %ymm11
	vpandn	%ymm3, %ymm1, %ymm1
	vpandn	%ymm11, %ymm6, %ymm3
	vpblendd	$12, %ymm10, %ymm4, %ymm12
	vpblendd	$12, %ymm4, %ymm2, %ymm6
	vpxor	%ymm2, %ymm1, %ymm1
	vpblendd	$48, %ymm2, %ymm12, %ymm12
	vpblendd	$48, %ymm7, %ymm6, %ymm6
	vpxor	%ymm4, %ymm3, %ymm3
	vpblendd	$192, %ymm7, %ymm12, %ymm12
	vpblendd	$192, %ymm10, %ymm6, %ymm6
	vpandn	%ymm6, %ymm12, %ymm12
	vpxor	%ymm9, %ymm12, %ymm12
	vpermq	$30, %ymm8, %ymm6
	vpblendd	$48, %ymm5, %ymm6, %ymm6
	vpermq	$57, %ymm8, %ymm11
	vpblendd	$192, %ymm5, %ymm11, %ymm11
	vpandn	%ymm6, %ymm11, %ymm11
	vpblendd	$12, %ymm4, %ymm7, %ymm6
	vpblendd	$12, %ymm7, %ymm9, %ymm13
	vpblendd	$48, %ymm9, %ymm6, %ymm6
	vpblendd	$48, %ymm2, %ymm13, %ymm13
	vpblendd	$192, %ymm2, %ymm6, %ymm6
	vpblendd	$192, %ymm4, %ymm13, %ymm13
	vpandn	%ymm13, %ymm6, %ymm6
	vpxor	%ymm10, %ymm6, %ymm6
	vpermq	$0, %ymm0, %ymm13
	vpermq	$27, %ymm1, %ymm0
	vpermq	$141, %ymm3, %ymm1
	vpermq	$114, %ymm12, %ymm3
	vpblendd	$12, %ymm2, %ymm9, %ymm12
	vpblendd	$12, %ymm9, %ymm4, %ymm9
	vpblendd	$48, %ymm4, %ymm12, %ymm12
	vpblendd	$48, %ymm10, %ymm9, %ymm9
	vpblendd	$192, %ymm10, %ymm12, %ymm12
	vpblendd	$192, %ymm2, %ymm9, %ymm9
	vpandn	%ymm9, %ymm12, %ymm2
	vpxor	%ymm13, %ymm5, %ymm5
	vpxor	%ymm8, %ymm11, %ymm4
	vpxor	%ymm7, %ymm2, %ymm2
	vpbroadcastq	(%rsi,%r8,8), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	incq	%r8
	cmpq	$24, %r8
	jb  	.L__keccakf1600_avx2$2
	ret
.L_keccakf1600_opt$1:
	movq	(%rax), %rcx
	movq	80(%rax), %rbx
	movq	96(%rax), %rdx
	movq	144(%rax), %rsi
	movq	152(%rax), %r12
	movq	160(%rax), %rdi
	movq	168(%rax), %r11
	movq	176(%rax), %r8
	movq	192(%rax), %r9
	movq	$0, %r10
.L_keccakf1600_opt$2:
	movq	%r12, 8(%rsp)
	movq	%rbx, 16(%rsp)
	movq	%r10, %mm1
	movq	%r11, 24(%rsp)
	movq	120(%rax), %r14
	xorq	%rdi, %r14
	movq	%rbx, %r10
	xorq	40(%rax), %r10
	xorq	%r14, %r10
	movq	128(%rax), %r13
	xorq	%r11, %r13
	movq	88(%rax), %r14
	movq	48(%rax), %r11
	xorq	%r11, %r14
	xorq	%r13, %r14
	movq	136(%rax), %r13
	xorq	%r8, %r13
	movq	%rdx, %rbx
	xorq	56(%rax), %rbx
	xorq	%r13, %rbx
	movq	%rsi, %r13
	xorq	184(%rax), %r13
	movq	104(%rax), %rbp
	xorq	64(%rax), %rbp
	xorq	%r13, %rbp
	xorq	%r9, %r12
	movq	112(%rax), %r15
	xorq	72(%rax), %r15
	xorq	%r12, %r15
	xorq	%rcx, %r10
	xorq	8(%rax), %r14
	xorq	16(%rax), %rbx
	movq	24(%rax), %r12
	xorq	%r12, %rbp
	xorq	32(%rax), %r15
	rorx	$63, %rbp, %r13
	xorq	%r14, %r13
	movq	%r13, 88(%rsp)
	rorx	$63, %r14, %r14
	xorq	%r15, %r14
	movq	%r14, 80(%rsp)
	rorx	$63, %r15, %r15
	xorq	%rbx, %r15
	rorx	$63, %rbx, %rbx
	xorq	%r10, %rbx
	rorx	$63, %r10, %r10
	xorq	%rbp, %r10
	xorq	%r14, %rcx
	xorq	%rbx, %r11
	rorx	$20, %r11, %r11
	xorq	%r13, %rdx
	rorx	$21, %rdx, %rdx
	xorq	%r15, %rsi
	rorx	$43, %rsi, %r13
	xorq	%r10, %r9
	rorx	$50, %r9, %r9
	andnq	%rcx, %r9, %rsi
	xorq	%r13, %rsi
	movq	%rsi, 48(%rax)
	andnq	%r13, %rdx, %rsi
	andnq	%r9, %r13, %r13
	xorq	%rdx, %r13
	movq	%r13, 72(%rsp)
	andnq	%rdx, %r11, %rdx
	leaq	glob_data + 448(%rip), %rbp
	movq	%mm1, %r13
	xorq	(%rbp,%r13,8), %rdx
	xorq	%rcx, %rdx
	xorq	%r11, %rsi
	movq	%rsi, 56(%rsp)
	andnq	%r11, %rcx, %rcx
	xorq	%r9, %rcx
	movq	%rcx, 64(%rsp)
	xorq	%r15, %r12
	rorx	$36, %r12, %rcx
	movq	72(%rax), %rsi
	xorq	%r10, %rsi
	rorx	$44, %rsi, %rsi
	movq	16(%rsp), %r11
	movq	80(%rsp), %rbp
	xorq	%rbp, %r11
	rorx	$61, %r11, %r12
	movq	128(%rax), %r11
	movq	%rbx, %r9
	xorq	%rbx, %r11
	rorx	$19, %r11, %r13
	movq	88(%rsp), %r11
	xorq	%r11, %r8
	rorx	$3, %r8, %r8
	andnq	%rcx, %r8, %r14
	xorq	%r13, %r14
	movq	%r14, 16(%rsp)
	andnq	%r13, %r12, %r14
	andnq	%r8, %r13, %r13
	xorq	%r12, %r13
	movq	%r13, 48(%rsp)
	andnq	%r12, %rsi, %r12
	xorq	%rcx, %r12
	movq	%r12, 128(%rax)
	xorq	%rsi, %r14
	movq	%r14, 24(%rax)
	andnq	%rsi, %rcx, %rsi
	xorq	%r8, %rsi
	movq	%rsi, 72(%rax)
	movq	8(%rax), %rsi
	xorq	%rbx, %rsi
	rorx	$63, %rsi, %rsi
	movq	56(%rax), %r8
	xorq	%r11, %r8
	rorx	$58, %r8, %r8
	movq	104(%rax), %rcx
	xorq	%r15, %rcx
	rorx	$39, %rcx, %r14
	movq	8(%rsp), %rcx
	xorq	%r10, %rcx
	rorx	$56, %rcx, %rcx
	movq	%rbp, %rbx
	xorq	%rbp, %rdi
	rorx	$46, %rdi, %rdi
	andnq	%rsi, %rdi, %r12
	xorq	%rcx, %r12
	movq	%r12, 104(%rax)
	andnq	%rcx, %r14, %r12
	andnq	%rdi, %rcx, %rcx
	xorq	%r14, %rcx
	andnq	%r14, %r8, %r14
	xorq	%rsi, %r14
	movq	%r14, 56(%rax)
	xorq	%r8, %r12
	movq	%r12, 40(%rsp)
	andnq	%r8, %rsi, %rsi
	xorq	%rdi, %rsi
	movq	%rsi, 8(%rsp)
	movq	32(%rax), %rsi
	xorq	%r10, %rsi
	rorx	$37, %rsi, %r12
	movq	40(%rax), %r8
	xorq	%rbx, %r8
	rorx	$28, %r8, %r13
	movq	88(%rax), %rdi
	xorq	%r9, %rdi
	rorx	$54, %rdi, %rdi
	movq	136(%rax), %rsi
	xorq	%r11, %rsi
	rorx	$49, %rsi, %r14
	movq	184(%rax), %rsi
	xorq	%r15, %rsi
	rorx	$8, %rsi, %rbp
	andnq	%r12, %rbp, %rsi
	xorq	%r14, %rsi
	andnq	%r14, %rdi, %r8
	andnq	%rbp, %r14, %r14
	xorq	%rdi, %r14
	movq	%r14, 136(%rax)
	andnq	%rdi, %r13, %rdi
	xorq	%r12, %rdi
	movq	%rdi, 184(%rax)
	xorq	%r13, %r8
	movq	%r8, 40(%rax)
	andnq	%r13, %r12, %r12
	xorq	%rbp, %r12
	movq	%r12, 88(%rax)
	xorq	16(%rax), %r11
	xorq	64(%rax), %r15
	xorq	112(%rax), %r10
	xorq	120(%rax), %rbx
	xorq	24(%rsp), %r9
	rorx	$2, %r11, %r11
	rorx	$9, %r15, %r13
	rorx	$25, %r10, %r10
	rorx	$23, %rbx, %rbx
	rorx	$62, %r9, %r15
	andnq	%r11, %r15, %r14
	xorq	%rbx, %r14
	movq	%r14, 120(%rax)
	andnq	%rbx, %r10, %r9
	andnq	%r15, %rbx, %r12
	xorq	%r10, %r12
	andnq	%r10, %r13, %rbp
	xorq	%r11, %rbp
	movq	%rbp, %r10
	movq	%rbp, 112(%rax)
	xorq	%r13, %r9
	movq	%r9, 24(%rsp)
	andnq	%r13, %r11, %rbx
	xorq	%r15, %rbx
	xorq	56(%rax), %rdi
	movq	128(%rax), %r11
	xorq	%r10, %r11
	xorq	%rdi, %r11
	movq	24(%rax), %rbp
	movq	%rbp, %rdi
	xorq	56(%rsp), %rdi
	movq	%r8, %r13
	xorq	40(%rsp), %r13
	xorq	%rdi, %r13
	movq	48(%rsp), %rdi
	xorq	136(%rax), %rdi
	movq	%r12, %r10
	xorq	72(%rsp), %r10
	xorq	%rdi, %r10
	movq	104(%rax), %r8
	xorq	16(%rsp), %r8
	xorq	48(%rax), %r14
	xorq	%r8, %r14
	movq	64(%rsp), %r8
	xorq	%rbx, %r8
	movq	8(%rsp), %rdi
	xorq	72(%rax), %rdi
	xorq	%r8, %rdi
	xorq	%rdx, %r11
	xorq	%r9, %r13
	xorq	%rcx, %r10
	xorq	%rsi, %r14
	movq	88(%rax), %r15
	xorq	%r15, %rdi
	rorx	$63, %r14, %r8
	xorq	%r13, %r8
	rorx	$63, %r13, %r9
	xorq	%rdi, %r9
	rorx	$63, %rdi, %rdi
	xorq	%r10, %rdi
	rorx	$63, %r10, %r10
	xorq	%r11, %r10
	rorx	$63, %r11, %r11
	xorq	%r14, %r11
	xorq	%r9, %rdx
	xorq	%r10, %rbp
	rorx	$20, %rbp, %rbp
	xorq	%r8, %rcx
	rorx	$21, %rcx, %rcx
	xorq	%rdi, %rsi
	rorx	$43, %rsi, %rsi
	xorq	%r11, %rbx
	rorx	$50, %rbx, %rbx
	andnq	%rdx, %rbx, %r13
	xorq	%rsi, %r13
	movq	%r13, 24(%rax)
	andnq	%rsi, %rcx, %r13
	andnq	%rbx, %rsi, %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 16(%rax)
	andnq	%rcx, %rbp, %rcx
	movq	%mm1, %rsi
	leaq	glob_data + 448(%rip), %r14
	xorq	8(%r14,%rsi,8), %rcx
	xorq	%rdx, %rcx
	movq	%rcx, 80(%rsp)
	xorq	%rbp, %r13
	movq	%r13, 8(%rax)
	andnq	%rbp, %rdx, %rcx
	xorq	%rbx, %rcx
	movq	%rcx, 32(%rax)
	movq	48(%rax), %rcx
	xorq	%rdi, %rcx
	rorx	$36, %rcx, %rcx
	movq	72(%rax), %rdx
	xorq	%r11, %rdx
	rorx	$44, %rdx, %rdx
	movq	56(%rax), %rsi
	xorq	%r9, %rsi
	rorx	$61, %rsi, %rsi
	movq	40(%rax), %rbx
	xorq	%r10, %rbx
	rorx	$19, %rbx, %rbx
	xorq	%r8, %r12
	rorx	$3, %r12, %r13
	andnq	%rcx, %r13, %r12
	xorq	%rbx, %r12
	movq	%r12, 64(%rax)
	andnq	%rbx, %rsi, %r12
	andnq	%r13, %rbx, %rbx
	xorq	%rsi, %rbx
	movq	%rbx, 56(%rax)
	andnq	%rsi, %rdx, %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 40(%rax)
	xorq	%rdx, %r12
	movq	%r12, 48(%rax)
	andnq	%rdx, %rcx, %rcx
	xorq	%r13, %rcx
	movq	%rcx, 72(%rax)
	movq	56(%rsp), %rcx
	xorq	%r10, %rcx
	rorx	$63, %rcx, %rcx
	movq	48(%rsp), %rdx
	xorq	%r8, %rdx
	rorx	$58, %rdx, %rsi
	movq	104(%rax), %rdx
	xorq	%rdi, %rdx
	rorx	$39, %rdx, %r12
	xorq	%r11, %r15
	rorx	$56, %r15, %rdx
	movq	112(%rax), %r13
	xorq	%r9, %r13
	rorx	$46, %r13, %r13
	andnq	%rcx, %r13, %rbx
	xorq	%rdx, %rbx
	movq	%rbx, 104(%rax)
	andnq	%rdx, %r12, %r14
	andnq	%r13, %rdx, %rdx
	xorq	%r12, %rdx
	andnq	%r12, %rsi, %rbx
	xorq	%rcx, %rbx
	xorq	%rsi, %r14
	movq	%r14, 88(%rax)
	andnq	%rsi, %rcx, %rcx
	xorq	%r13, %rcx
	movq	%rcx, 112(%rax)
	movq	64(%rsp), %rcx
	xorq	%r11, %rcx
	rorx	$37, %rcx, %rbp
	movq	128(%rax), %rcx
	xorq	%r9, %rcx
	rorx	$28, %rcx, %r14
	movq	40(%rsp), %rsi
	xorq	%r10, %rsi
	rorx	$54, %rsi, %r12
	movq	136(%rax), %rsi
	xorq	%r8, %rsi
	rorx	$49, %rsi, %r15
	movq	120(%rax), %rsi
	xorq	%rdi, %rsi
	rorx	$8, %rsi, %rcx
	andnq	%rbp, %rcx, %rsi
	xorq	%r15, %rsi
	andnq	%r15, %r12, %r13
	andnq	%rcx, %r15, %r15
	xorq	%r12, %r15
	movq	%r15, 136(%rax)
	andnq	%r12, %r14, %r12
	xorq	%rbp, %r12
	movq	%r12, 120(%rax)
	xorq	%r14, %r13
	movq	%r13, 128(%rax)
	andnq	%r14, %rbp, %r12
	xorq	%rcx, %r12
	xorq	72(%rsp), %r8
	xorq	16(%rsp), %rdi
	xorq	8(%rsp), %r11
	xorq	184(%rax), %r9
	xorq	24(%rsp), %r10
	rorx	$2, %r8, %rcx
	rorx	$9, %rdi, %r14
	rorx	$25, %r11, %rdi
	rorx	$23, %r9, %r8
	rorx	$62, %r10, %r10
	andnq	%rcx, %r10, %r9
	xorq	%r8, %r9
	movq	%r9, 184(%rax)
	andnq	%r8, %rdi, %r11
	andnq	%r10, %r8, %r8
	xorq	%rdi, %r8
	andnq	%rdi, %r14, %rdi
	xorq	%rcx, %rdi
	xorq	%r14, %r11
	andnq	%r14, %rcx, %r9
	xorq	%r10, %r9
	movq	%mm1, %rcx
	addq	$2, %rcx
	movq	%rcx, %r10
	movq	80(%rsp), %rcx
	cmpq	$24, %r10
	jb  	.L_keccakf1600_opt$2
	movq	%rcx, (%rax)
	movq	%rbx, 80(%rax)
	movq	%rdx, 96(%rax)
	movq	%rsi, 144(%rax)
	movq	%r12, 152(%rax)
	movq	%rdi, 160(%rax)
	movq	%r11, 168(%rax)
	movq	%r8, 176(%rax)
	movq	%r9, 192(%rax)
	ret
	.data
	.p2align	5
glob_data:
G$ROL8:
	.byte	  7,   0,   1,   2,   3,   4,   5,   6,  15,   8,   9,  10,  11,  12,  13,  14
	.byte	 23,  16,  17,  18,  19,  20,  21,  22,  31,  24,  25,  26,  27,  28,  29,  30
G$ROL56:
	.byte	  1,   2,   3,   4,   5,   6,   7,   0,   9,  10,  11,  12,  13,  14,  15,   8
	.byte	 17,  18,  19,  20,  21,  22,  23,  16,  25,  26,  27,  28,  29,  30,  31,  24
G$KECCAK_RHOTATES_RIGHT:
	.byte	 61,   0,   0,   0,   0,   0,   0,   0,  46,   0,   0,   0,   0,   0,   0,   0
	.byte	 28,   0,   0,   0,   0,   0,   0,   0,  23,   0,   0,   0,   0,   0,   0,   0
	.byte	 63,   0,   0,   0,   0,   0,   0,   0,   2,   0,   0,   0,   0,   0,   0,   0
	.byte	 36,   0,   0,   0,   0,   0,   0,   0,  37,   0,   0,   0,   0,   0,   0,   0
	.byte	 19,   0,   0,   0,   0,   0,   0,   0,  58,   0,   0,   0,   0,   0,   0,   0
	.byte	  8,   0,   0,   0,   0,   0,   0,   0,  25,   0,   0,   0,   0,   0,   0,   0
	.byte	 54,   0,   0,   0,   0,   0,   0,   0,   3,   0,   0,   0,   0,   0,   0,   0
	.byte	  9,   0,   0,   0,   0,   0,   0,   0,  56,   0,   0,   0,   0,   0,   0,   0
	.byte	 62,   0,   0,   0,   0,   0,   0,   0,  49,   0,   0,   0,   0,   0,   0,   0
	.byte	 39,   0,   0,   0,   0,   0,   0,   0,  44,   0,   0,   0,   0,   0,   0,   0
	.byte	 20,   0,   0,   0,   0,   0,   0,   0,  21,   0,   0,   0,   0,   0,   0,   0
	.byte	 43,   0,   0,   0,   0,   0,   0,   0,  50,   0,   0,   0,   0,   0,   0,   0
G$KECCAK_RHOTATES_LEFT:
	.byte	  3,   0,   0,   0,   0,   0,   0,   0,  18,   0,   0,   0,   0,   0,   0,   0
	.byte	 36,   0,   0,   0,   0,   0,   0,   0,  41,   0,   0,   0,   0,   0,   0,   0
	.byte	  1,   0,   0,   0,   0,   0,   0,   0,  62,   0,   0,   0,   0,   0,   0,   0
	.byte	 28,   0,   0,   0,   0,   0,   0,   0,  27,   0,   0,   0,   0,   0,   0,   0
	.byte	 45,   0,   0,   0,   0,   0,   0,   0,   6,   0,   0,   0,   0,   0,   0,   0
	.byte	 56,   0,   0,   0,   0,   0,   0,   0,  39,   0,   0,   0,   0,   0,   0,   0
	.byte	 10,   0,   0,   0,   0,   0,   0,   0,  61,   0,   0,   0,   0,   0,   0,   0
	.byte	 55,   0,   0,   0,   0,   0,   0,   0,   8,   0,   0,   0,   0,   0,   0,   0
	.byte	  2,   0,   0,   0,   0,   0,   0,   0,  15,   0,   0,   0,   0,   0,   0,   0
	.byte	 25,   0,   0,   0,   0,   0,   0,   0,  20,   0,   0,   0,   0,   0,   0,   0
	.byte	 44,   0,   0,   0,   0,   0,   0,   0,  43,   0,   0,   0,   0,   0,   0,   0
	.byte	 21,   0,   0,   0,   0,   0,   0,   0,  14,   0,   0,   0,   0,   0,   0,   0
G$KECCAK1600_RC:
	.byte	  1,   0,   0,   0,   0,   0,   0,   0, 130, 128,   0,   0,   0,   0,   0,   0
	.byte	138, 128,   0,   0,   0,   0,   0, 128,   0, 128,   0, 128,   0,   0,   0, 128
	.byte	139, 128,   0,   0,   0,   0,   0,   0,   1,   0,   0, 128,   0,   0,   0,   0
	.byte	129, 128,   0, 128,   0,   0,   0, 128,   9, 128,   0,   0,   0,   0,   0, 128
	.byte	138,   0,   0,   0,   0,   0,   0,   0, 136,   0,   0,   0,   0,   0,   0,   0
	.byte	  9, 128,   0, 128,   0,   0,   0,   0,  10,   0,   0, 128,   0,   0,   0,   0
	.byte	139, 128,   0, 128,   0,   0,   0,   0, 139,   0,   0,   0,   0,   0,   0, 128
	.byte	137, 128,   0,   0,   0,   0,   0, 128,   3, 128,   0,   0,   0,   0,   0, 128
	.byte	  2, 128,   0,   0,   0,   0,   0, 128, 128,   0,   0,   0,   0,   0,   0, 128
	.byte	 10, 128,   0,   0,   0,   0,   0,   0,  10,   0,   0, 128,   0,   0,   0, 128
	.byte	129, 128,   0, 128,   0,   0,   0, 128, 128, 128,   0,   0,   0,   0,   0, 128
	.byte	  1,   0,   0, 128,   0,   0,   0,   0,   8, 128,   0, 128,   0,   0,   0, 128
	.ident	"Jasmin Compiler 2026.09.0"
	.section	".note.GNU-stack", "", %progbits
