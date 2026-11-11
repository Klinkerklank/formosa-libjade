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
	leaq	-8(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rax, (%rsp)
	movq	%rsi, %rax
	movq	%rdx, %rcx
	lfence
	movq	$0, %rdx
	leaq	-56(%rsp), %rsp
	call	.Lslh_keygen_internal_$1
.Lslh_dsa_shake128f_keygen$1:
	leaq	56(%rsp), %rsp
	movq	(%rsp), %rsp
	ret
.Lslh_verify_internal_$1:
	leaq	72(%rsp), %r11
	movq	$0, (%r11)
	movq	$0, 8(%r11)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
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
	movq	48(%rsp), %rsi
	movq	56(%rsp), %rax
	movq	64(%rsp), %rdi
	lfence
	movq	$0, %rdx
	leaq	120(%rsp), %rcx
	leaq	145(%rsp), %rdx
	leaq	153(%rsp), %r8
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
	movzbl	(%r8), %r9d
	orl 	%r9d, %edx
	andl	$7, %edx
	leaq	72(%rsp), %r8
	movl	108(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	112(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	116(%rsp), %r9d
	movl	%r9d, 12(%r8)
	leaq	72(%rsp), %r8
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$3, 16(%r8)
	leaq	72(%rsp), %r8
	movl	%edx, 20(%r8)
	leaq	16(%rdi), %r10
	movq	%rsi, 64(%rsp)
	movq	%rax, 56(%rsp)
	movq	%rdi, 48(%rsp)
	movl	%edx, 104(%rsp)
	leaq	32(%rsp), %rax
	leaq	72(%rsp), %r8
	movq	%rax, %rdx
	movq	%rcx, %rax
	movq	%rsi, %r9
	leaq	-888(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	888(%rsp), %rsp
	movq	64(%rsp), %rsi
	movq	56(%rsp), %r10
	movq	48(%rsp), %rdi
	movl	104(%rsp), %edx
	lfence
	movq	$0, %rax
	leaq	32(%rsp), %rax
	leaq	3712(%rdi), %rcx
	leaq	108(%rsp), %rdi
	leaq	-120(%rsp), %rsp
	call	.Lht_verify$1
.Lslh_verify_internal_$2:
	leaq	120(%rsp), %rsp
	ret
.Lslh_sign_internal_$1:
	leaq	96(%rsp), %r11
	movq	$0, (%r11)
	movq	$0, 8(%r11)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
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
	movq	%rcx, %r8
	movq	80(%rsp), %rdi
	movq	88(%rsp), %rax
	lfence
	movq	$0, %rdx
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
	movq	72(%rsp), %rsi
	movq	64(%rsp), %rdi
	movq	56(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	144(%rsp), %rcx
	leaq	169(%rsp), %rdx
	leaq	177(%rsp), %r8
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
	movzbl	(%r8), %r9d
	orl 	%r9d, %edx
	andl	$7, %edx
	leaq	96(%rsp), %r8
	movl	132(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	136(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	140(%rsp), %r9d
	movl	%r9d, 12(%r8)
	leaq	96(%rsp), %r8
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$3, 16(%r8)
	leaq	96(%rsp), %r8
	movl	%edx, 20(%r8)
	movq	%rax, %r11
	leaq	16(%rdi), %r10
	movq	%r11, 56(%rsp)
	movq	%rsi, 64(%rsp)
	movq	%rdi, 72(%rsp)
	movq	%rcx, 48(%rsp)
	movl	%edx, 128(%rsp)
	leaq	96(%rsp), %r8
	movq	%rcx, %rax
	leaq	-216(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	216(%rsp), %rsp
// declassify_mem 3696 [R10]
	movq	56(%rsp), %r11
	movq	64(%rsp), %r9
	movq	72(%rsp), %rdi
	movq	48(%rsp), %rax
	movl	128(%rsp), %edx
	lfence
	movq	$0, %rcx
	movq	%r11, 48(%rsp)
	movq	%r9, 72(%rsp)
	movq	%rdi, 64(%rsp)
	movl	%edx, 128(%rsp)
	leaq	32(%rsp), %rcx
	leaq	96(%rsp), %r8
	movq	%rcx, %rdx
	leaq	-888(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	888(%rsp), %rsp
	movq	48(%rsp), %r11
	movq	72(%rsp), %rsi
	movq	64(%rsp), %rdi
	movl	128(%rsp), %edx
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
	movq	%rax, %r11
	movq	%rcx, %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	leaq	16(%rax), %r11
	leaq	16(%rcx), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	leaq	32(%rax), %r11
	leaq	32(%rcx), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	movq	%rdi, %r11
	leaq	32(%rcx), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r11)
	movq	%rax, %r11
	leaq	32(%rax), %rsi
	leaq	24(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$21, %r9d
	leaq	24(%rsp), %r8
	movl	%r9d, (%r8)
	movl	$0, %r10d
	movl	$3, %edx
	leaq	48(%rax), %rcx
	movq	%rax, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %r8
	movq	%rcx, %rax
	movl	%edx, %ecx
	leaq	-376(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	376(%rsp), %rsp
	movq	%rcx, %rax
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	lfence
	movq	$0, %rdx
	leaq	16(%rdi), %r11
	movq	(%rax), %rdx
	movq	%rdx, (%r11)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%r11)
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
	movl	%ecx, 24(%r8)
	movl	%edi, %edx
	shll	$6, %edx
	addl	752(%rsp,%rdi,4), %edx
	lfence
	movq	$0, %rcx
	movl	%edx, 28(%r8)
	movq	%r9, 672(%rsp)
	movq	%r8, 680(%rsp)
	movq	%r10, 688(%rsp)
	movq	%rdi, 696(%rsp)
	movq	%rax, 704(%rsp)
	leaq	64(%rsp), %rdi
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	40(%rsp), %rsp
	movq	672(%rsp), %r9
	movq	680(%rsp), %r8
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
	movl	%ecx, 24(%r8)
	movl	%esi, %ecx
	andl	$1, %ecx
	movl	%edx, 744(%rsp)
	movl	%esi, 748(%rsp)
	cmpl	$0, %ecx
	je  	.Lfors_pkfromsig$8
	movl	28(%r8), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
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
	movl	28(%r8), %edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
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
	movq	%r9, 704(%rsp)
	movq	%r8, 696(%rsp)
	movq	%r10, 688(%rsp)
	movq	%rdi, 680(%rsp)
	movq	%rax, 672(%rsp)
	leaq	32(%rsp), %rdi
	leaq	640(%rsp), %rcx
	leaq	624(%rsp), %rdx
	movq	%r9, %rsi
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	40(%rsp), %rsp
	movq	704(%rsp), %r9
	movq	696(%rsp), %r8
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
	movq	(%r8), %rdx
	movq	%rdx, (%rax)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rax)
	leaq	712(%rsp), %r11
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$4, 16(%r11)
	movl	20(%r8), %edx
	leaq	712(%rsp), %r8
	movl	%edx, 20(%r8)
	movq	656(%rsp), %rdi
	lfence
	movq	$0, %rax
	leaq	712(%rsp), %r8
	leaq	96(%rsp), %rax
	leaq	-40(%rsp), %rsp
	call	.LT_k$1
.Lfors_pkfromsig$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lfors_sign$1:
	leaq	64(%rsp), %rdx
	movq	$0, %rdi
	movl	$0, %ecx
	movl	$0, %r9d
	jmp 	.Lfors_sign$72
.Lfors_sign$73:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$72:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$73
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, (%rdx)
	jmp 	.Lfors_sign$70
.Lfors_sign$71:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$70:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$71
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 4(%rdx)
	jmp 	.Lfors_sign$68
.Lfors_sign$69:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$68:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$69
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 8(%rdx)
	jmp 	.Lfors_sign$66
.Lfors_sign$67:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$66:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$67
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 12(%rdx)
	jmp 	.Lfors_sign$64
.Lfors_sign$65:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$64:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$65
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 16(%rdx)
	jmp 	.Lfors_sign$62
.Lfors_sign$63:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$62:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$63
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 20(%rdx)
	jmp 	.Lfors_sign$60
.Lfors_sign$61:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$60:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$61
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 24(%rdx)
	jmp 	.Lfors_sign$58
.Lfors_sign$59:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$58:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$59
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 28(%rdx)
	jmp 	.Lfors_sign$56
.Lfors_sign$57:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$56:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$57
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 32(%rdx)
	jmp 	.Lfors_sign$54
.Lfors_sign$55:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$54:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$55
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 36(%rdx)
	jmp 	.Lfors_sign$52
.Lfors_sign$53:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$52:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$53
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 40(%rdx)
	jmp 	.Lfors_sign$50
.Lfors_sign$51:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$50:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$51
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 44(%rdx)
	jmp 	.Lfors_sign$48
.Lfors_sign$49:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$48:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$49
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 48(%rdx)
	jmp 	.Lfors_sign$46
.Lfors_sign$47:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$46:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$47
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 52(%rdx)
	jmp 	.Lfors_sign$44
.Lfors_sign$45:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$44:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$45
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 56(%rdx)
	jmp 	.Lfors_sign$42
.Lfors_sign$43:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$42:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$43
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 60(%rdx)
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$41
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 64(%rdx)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$39
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 68(%rdx)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$37
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 72(%rdx)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$35
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 76(%rdx)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$33
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 80(%rdx)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$31
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 84(%rdx)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$29
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 88(%rdx)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$27
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 92(%rdx)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$25
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 96(%rdx)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$23
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 100(%rdx)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$21
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 104(%rdx)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$19
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 108(%rdx)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$17
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 112(%rdx)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$15
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 116(%rdx)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$13
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 120(%rdx)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$11
	movl	%r9d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 124(%rdx)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$9
	movl	%r9d, %eax
	addl	$-6, %ecx
	shrq	%cl, %rax
	andq	$63, %rax
	movl	%eax, 128(%rdx)
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%edi, %edx
	shll	$6, %edx
	addl	64(%rsp,%rdi,4), %edx
	lfence
	movq	$0, %rcx
	leaq	(%r10,%rax), %rcx
	movq	%r11, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%r8, 24(%rsp)
	movq	%r10, 32(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rcx, %rax
	movl	%edx, %edi
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %r11
	movq	16(%rsp), %rsi
	movq	24(%rsp), %r8
	movq	32(%rsp), %r10
	movq	40(%rsp), %rdi
	movq	48(%rsp), %rax
	lfence
	movq	$0, %rcx
	addq	$16, %rax
	movl	64(%rsp,%rdi,4), %r9d
	lfence
	movq	$0, %rcx
	xorl	$1, %r9d
	movl	$0, %edx
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%r11, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%rdi, 32(%rsp)
	movl	%edx, 56(%rsp)
	movq	%rax, 24(%rsp)
	movl	%r9d, 60(%rsp)
	movl	$6, %ecx
	subl	%edx, %ecx
	shlq	%cl, %rdi
	addl	%r9d, %edi
	leaq	(%r10,%rax), %rax
	movq	%r10, 16(%rsp)
	movl	%edi, %r10d
	movl	%edx, %ecx
	leaq	-2168(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	2168(%rsp), %rsp
	movq	16(%rsp), %r10
	lfence
	movq	$0, %rax
	movq	48(%rsp), %r11
	movq	40(%rsp), %rsi
	movq	32(%rsp), %rdi
	movl	56(%rsp), %edx
	movq	24(%rsp), %rax
	movl	60(%rsp), %r9d
	lfence
	movq	$0, %rcx
	shrl	$1, %r9d
	xorl	$1, %r9d
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
	movl	$0, %r9d
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%ecx, 2136(%rsp)
	subl	%r9d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %edi
	imull	%r10d, %edi
	addl	%edi, %edx
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%r11, 2104(%rsp)
	movl	%edx, 2140(%rsp)
	cmpl	$0, %r9d
	je  	.Lfors_node$6
	movl	%edi, %eax
	imull	$2, %eax, %eax
	movl	%r9d, %edx
	decl	%edx
	movl	$7, %ecx
	movq	$1, %r11
	shlq	%cl, %r11
	subl	%edx, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %r11
	shrq	$1, %rbp
	movl	%eax, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %r11
	imulq	$16, %r11, %r11
	movq	%r11, %rax
	addq	$16, %rax
	leaq	2080(%rsp), %rcx
	leaq	32(%rsp,%r11), %rdx
	movq	(%rdx), %r11
	movq	%r11, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	2064(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movl	%r9d, 24(%r8)
	movl	%edi, 28(%r8)
	movl	$7, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %r11
	subl	%r9d, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %r11
	shrq	$1, %rbp
	movl	%edi, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %r11
	imulq	$16, %r11, %rax
	movq	%rsi, 2112(%rsp)
	movq	%r8, 2120(%rsp)
	movl	%r10d, 2144(%rsp)
	movl	%r9d, 2148(%rsp)
	movl	%edi, 2152(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	2080(%rsp), %rcx
	leaq	2064(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_node$10:
	leaq	40(%rsp), %rsp
	movq	2112(%rsp), %rsi
	movq	2120(%rsp), %r8
	movl	2144(%rsp), %r10d
	movl	2148(%rsp), %r9d
	movl	2152(%rsp), %edi
	lfence
	movq	$0, %rcx
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%r9d, 24(%r8)
	movl	%edi, 28(%r8)
	movl	$7, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbx
	subl	%r9d, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %rbx
	shrq	$1, %rbp
	movl	%edi, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %rbx
	imulq	$16, %rbx, %rax
	movq	%rsi, 2112(%rsp)
	movq	%r8, 2120(%rsp)
	movl	%r10d, 2144(%rsp)
	movl	%r9d, 2148(%rsp)
	movl	%edi, 2152(%rsp)
	movq	%rax, 2128(%rsp)
	leaq	32(%rsp,%rax), %rax
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$9:
	leaq	40(%rsp), %rsp
	movq	2112(%rsp), %rsi
	movq	2120(%rsp), %r8
	movl	2144(%rsp), %ecx
	movl	2148(%rsp), %r9d
	movl	2152(%rsp), %edi
	movq	2128(%rsp), %rax
	lfence
	movq	$0, %rdx
	movq	%rsi, 2128(%rsp)
	movq	%r8, 2120(%rsp)
	movl	%ecx, 2152(%rsp)
	movl	%r9d, 2148(%rsp)
	movl	%edi, 2144(%rsp)
	movq	%rax, 2112(%rsp)
	leaq	32(%rsp,%rax), %rdi
	movq	%rsi, %r9
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_node$8:
	leaq	40(%rsp), %rsp
	movq	2128(%rsp), %rsi
	movq	2120(%rsp), %r8
	movl	2152(%rsp), %r10d
	movl	2148(%rsp), %r9d
	movl	2144(%rsp), %edi
	movq	2112(%rsp), %rax
	lfence
	movq	$0, %rcx
.Lfors_node$7:
	movq	2104(%rsp), %r11
	movl	2140(%rsp), %edx
	lfence
	movq	$0, %rcx
	incl	%edi
.Lfors_node$4:
	cmpl	%edx, %edi
	jb  	.Lfors_node$5
	movl	2136(%rsp), %ecx
	lfence
	movq	$0, %rdx
	incl	%r9d
.Lfors_node$2:
	cmpl	%ecx, %r9d
	jbe 	.Lfors_node$3
	movq	2096(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	ret
.Lfors_skgen$1:
	leaq	8(%rsp), %rcx
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rcx)
	leaq	8(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$6, 16(%rcx)
	movl	20(%r8), %edx
	leaq	8(%rsp), %rcx
	movl	%edx, 20(%rcx)
	leaq	8(%rsp), %rcx
	movl	%edi, 28(%rcx)
	leaq	8(%rsp), %r8
	movq	%rax, %rcx
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%rdi), %r9d
	movl	%r9d, 108(%rsp)
	movl	4(%rdi), %r9d
	movl	%r9d, 112(%rsp)
	movl	8(%rdi), %r9d
	movl	%r9d, 116(%rsp)
	leaq	72(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	leaq	72(%rsp), %r8
	movl	108(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	112(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	116(%rsp), %r9d
	movl	%r9d, 12(%r8)
	movq	%rcx, %rdi
	movq	%rsi, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	40(%rsp), %rcx
	leaq	72(%rsp), %r8
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	152(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	$608, %rax
	movl	$1, %r10d
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%r10d, 104(%rsp)
	movq	%rax, 24(%rsp)
	leaq	108(%rsp), %rdi
	movl	8(%rdi), %edx
	andl	$7, %edx
	shrl	$3, 8(%rdi)
	movl	4(%rdi), %r9d
	shll	$29, %r9d
	orl 	%r9d, 8(%rdi)
	shrl	$3, 4(%rdi)
	movl	(%rdi), %r9d
	shll	$29, %r9d
	orl 	%r9d, 4(%rdi)
	shrl	$3, (%rdi)
	leaq	72(%rsp), %r8
	movl	%r10d, (%r8)
	leaq	72(%rsp), %r8
	movl	108(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	112(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	116(%rsp), %r9d
	movl	%r9d, 12(%r8)
	leaq	56(%rsp), %rdi
	leaq	40(%rsp), %r8
	movq	(%r8), %r9
	movq	%r9, (%rdi)
	movq	8(%r8), %r9
	movq	%r9, 8(%rdi)
	leaq	(%rcx,%rax), %rdi
	movq	%rsi, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	40(%rsp), %rcx
	leaq	56(%rsp), %rax
	leaq	72(%rsp), %r8
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	152(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rcx
	lfence
	movq	$0, %rax
	movl	104(%rsp), %r10d
	movq	24(%rsp), %rax
	lfence
	movq	$0, %rdx
	addq	$608, %rax
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
	movl	8(%rdi), %r9d
	movl	%r9d, 120(%rsp)
	leaq	72(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	leaq	72(%rsp), %r8
	movl	112(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	116(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	120(%rsp), %r9d
	movl	%r9d, 12(%r8)
	movq	%rcx, %rdi
	movq	%rcx, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%edx, 104(%rsp)
	leaq	72(%rsp), %r8
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
// declassify_mem 608 [RDI]
	movq	8(%rsp), %rcx
	movq	16(%rsp), %r11
	movq	24(%rsp), %rsi
	movq	32(%rsp), %rax
	movl	104(%rsp), %edx
	lfence
	movq	$0, %r8
	movq	%r11, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	40(%rsp), %rcx
	leaq	72(%rsp), %r8
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	152(%rsp), %rsp
	movq	32(%rsp), %r11
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rcx
	lfence
	movq	$0, %r9
	movq	$608, %rdi
	movl	$1, %eax
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%r11, 16(%rsp)
	leaq	112(%rsp), %r8
	movl	8(%r8), %edx
	andl	$7, %edx
	shrl	$3, 8(%r8)
	movl	4(%r8), %r9d
	shll	$29, %r9d
	orl 	%r9d, 8(%r8)
	shrl	$3, 4(%r8)
	movl	(%r8), %r9d
	shll	$29, %r9d
	orl 	%r9d, 4(%r8)
	shrl	$3, (%r8)
	leaq	72(%rsp), %r8
	movl	%eax, (%r8)
	leaq	72(%rsp), %r8
	movl	112(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	116(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	120(%rsp), %r9d
	movl	%r9d, 12(%r8)
	leaq	56(%rsp), %r8
	leaq	40(%rsp), %r9
	movq	(%r9), %r10
	movq	%r10, (%r8)
	movq	8(%r9), %r9
	movq	%r9, 8(%r8)
	leaq	(%rcx,%rdi), %r8
	movq	%rcx, 24(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%eax, 104(%rsp)
	movq	%rdi, 8(%rsp)
	movl	%edx, 108(%rsp)
	leaq	56(%rsp), %rax
	leaq	72(%rsp), %rcx
	movq	%r8, %rdi
	movq	%rcx, %r8
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	%rdi, %r8
// declassify_mem 608 [R8]
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rsi
	movl	104(%rsp), %eax
	movq	8(%rsp), %rdi
	movl	108(%rsp), %edx
	lfence
	movq	$0, %r9
	cmpl	$21, %eax
	jnb 	.Lht_sign$4
	movq	%rsi, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%eax, 108(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	40(%rsp), %rcx
	leaq	56(%rsp), %rax
	leaq	72(%rsp), %r11
	movq	%r8, %rdi
	movq	%r11, %r8
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	152(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	32(%rsp), %rcx
	movl	108(%rsp), %eax
	movq	24(%rsp), %rdi
	lfence
	movq	$0, %rdx
.Lht_sign$4:
	movq	16(%rsp), %r11
	lfence
	movq	$0, %rdx
	addq	$608, %rdi
	incl	%eax
.Lht_sign$2:
	cmpl	$22, %eax
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 112(%rsp)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$0, 16(%r8)
	movl	%edx, 20(%r8)
	movq	%rdi, %rcx
	movq	%rsi, 120(%rsp)
	movl	%edx, 152(%rsp)
	movq	%rdi, 128(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rdi
	movq	%rcx, %rdx
	movq	%rsi, %r10
	movq	%r8, %r11
	leaq	-792(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	792(%rsp), %rsp
	movq	%rcx, %r8
	movq	120(%rsp), %rsi
	movl	152(%rsp), %edx
	movq	128(%rsp), %rdi
	lfence
	movq	$0, %rax
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$2, 16(%r8)
	movl	%edx, 28(%r8)
	movq	$560, %rax
	movl	%edx, %r9d
	movl	$0, %edx
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%edx, %ecx
	incl	%ecx
	movl	%ecx, 24(%r8)
	movl	%r9d, %ecx
	andl	$1, %ecx
	movl	%edx, 152(%rsp)
	movl	%r9d, 156(%rsp)
	cmpl	$0, %ecx
	je  	.Lxmss_pkfromsig$5
	movl	28(%r8), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
	leaq	96(%rsp), %rcx
	leaq	(%rdi,%rax), %rdx
	movq	(%rdx), %r9
	movq	%r9, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	80(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %r9
	movq	%r9, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	jmp 	.Lxmss_pkfromsig$6
.Lxmss_pkfromsig$5:
	movl	28(%r8), %edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %r9
	movq	%r9, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	80(%rsp), %rcx
	leaq	(%rdi,%rax), %rdx
	movq	(%rdx), %r9
	movq	%r9, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
.Lxmss_pkfromsig$6:
	movq	%rsi, 128(%rsp)
	movq	%r8, 120(%rsp)
	movq	%rdi, 136(%rsp)
	movq	%rax, 144(%rsp)
	leaq	64(%rsp), %rdi
	leaq	96(%rsp), %rcx
	leaq	80(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	40(%rsp), %rsp
	movq	128(%rsp), %rsi
	movq	120(%rsp), %r8
	movq	136(%rsp), %rdi
	movq	144(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	32(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	(%rdx), %r9
	movq	%r9, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	movl	152(%rsp), %edx
	movl	156(%rsp), %r9d
	lfence
	movq	$0, %rcx
	shrl	$1, %r9d
	addq	$16, %rax
	incl	%edx
.Lxmss_pkfromsig$2:
	cmpl	$3, %edx
	jb  	.Lxmss_pkfromsig$3
	movq	112(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	ret
.Lxmss_sign$1:
	movq	%rax, 8(%rsp)
	movq	$560, %rax
	movl	%edx, %ecx
	xorl	$1, %ecx
	movl	$0, %r9d
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%r11, 16(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 48(%rsp)
	movl	%r9d, 52(%rsp)
	movl	%ecx, 56(%rsp)
	movq	%rax, 32(%rsp)
	leaq	(%rdi,%rax), %rax
	movq	%rdi, 40(%rsp)
	movl	%ecx, %r10d
	movl	%r9d, %ecx
	leaq	-376(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	376(%rsp), %rsp
	movq	40(%rsp), %rdi
	lfence
	movq	$0, %rax
	movq	16(%rsp), %r11
	movq	24(%rsp), %rsi
	movl	48(%rsp), %edx
	movl	52(%rsp), %r9d
	movl	56(%rsp), %ecx
	movq	32(%rsp), %rax
	lfence
	movq	$0, %r10
	shrl	$1, %ecx
	xorl	$1, %ecx
	addq	$16, %rax
	incl	%r9d
.Lxmss_sign$3:
	cmpl	$3, %r9d
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$0, 16(%r8)
	movl	%edx, 20(%r8)
	movq	%rdi, %rbx
	movq	%rdi, 8(%rsp)
	movq	%rsi, %r10
	leaq	-232(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	232(%rsp), %rsp
	movq	8(%rsp), %rdi
	lfence
	movq	$0, %rax
	ret
.Lxmss_node$1:
	movq	%rax, 304(%rsp)
	movq	$0, %rax
	movl	$0, %edx
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%ecx, 336(%rsp)
	subl	%edx, %ecx
	movq	$1, %r9
	shlq	%cl, %r9
	movl	%r9d, %edi
	imull	%r10d, %edi
	addl	%edi, %r9d
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%r11, 312(%rsp)
	movq	%rsi, 320(%rsp)
	movl	%r10d, 340(%rsp)
	movl	%edx, 344(%rsp)
	movl	%edi, 348(%rsp)
	movl	%r9d, 352(%rsp)
	cmpl	$0, %edx
	je  	.Lxmss_node$6
	movl	%edi, %eax
	imull	$2, %eax, %eax
	movl	%edx, %r9d
	decl	%r9d
	movl	$4, %ecx
	movq	$1, %r11
	shlq	%cl, %r11
	subl	%r9d, %ecx
	movq	$1, %r9
	shlq	%cl, %r9
	subq	%r9, %r11
	movl	%eax, %eax
	addq	%rax, %r11
	imulq	$16, %r11, %r11
	movq	%r11, %rax
	addq	$16, %rax
	leaq	288(%rsp), %rcx
	leaq	32(%rsp,%r11), %r9
	movq	(%r9), %r10
	movq	%r10, (%rcx)
	movq	8(%r9), %r9
	movq	%r9, 8(%rcx)
	leaq	272(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %r9
	movq	%r9, (%rcx)
	movq	8(%rax), %r9
	movq	%r9, 8(%rcx)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$2, 16(%r8)
	movl	%edx, 24(%r8)
	movl	%edi, 28(%r8)
	movl	$4, %ecx
	movq	$1, %r9
	shlq	%cl, %r9
	subl	%edx, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %r9
	movl	%edi, %eax
	addq	%rax, %r9
	imulq	$16, %r9, %rax
	movq	%r8, 328(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	288(%rsp), %rcx
	leaq	272(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_node$9:
	leaq	40(%rsp), %rsp
	movq	328(%rsp), %r8
	lfence
	movq	$0, %rcx
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$0, 16(%r8)
	movl	%edi, 20(%r8)
	movl	%edi, %eax
	imulq	$16, %rax, %rax
	leaq	32(%rsp,%rax), %rdi
	leaq	-664(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	664(%rsp), %rsp
	movq	%rcx, %r8
.Lxmss_node$7:
	movq	312(%rsp), %r11
	movq	320(%rsp), %rsi
	movl	340(%rsp), %r10d
	movl	344(%rsp), %edx
	movl	348(%rsp), %edi
	movl	352(%rsp), %r9d
	lfence
	movq	$0, %rcx
	incl	%edi
.Lxmss_node$4:
	cmpl	%r9d, %edi
	jb  	.Lxmss_node$5
	movl	336(%rsp), %ecx
	lfence
	movq	$0, %rdi
	incl	%edx
.Lxmss_node$2:
	cmpl	%ecx, %edx
	jbe 	.Lxmss_node$3
	movq	304(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	ret
.Lwots_pkfromsig$1:
	movq	%rdi, 592(%rsp)
	leaq	652(%rsp), %rsi
	movq	%rsi, %rdi
	movq	$0, %r8
	movl	$0, %ecx
	movl	$0, %r9d
	jmp 	.Lwots_pkfromsig$74
.Lwots_pkfromsig$75:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$74:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$75
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, (%rdi)
	jmp 	.Lwots_pkfromsig$72
.Lwots_pkfromsig$73:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$72:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$73
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 4(%rdi)
	jmp 	.Lwots_pkfromsig$70
.Lwots_pkfromsig$71:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$70:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$71
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 8(%rdi)
	jmp 	.Lwots_pkfromsig$68
.Lwots_pkfromsig$69:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$68:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$69
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 12(%rdi)
	jmp 	.Lwots_pkfromsig$66
.Lwots_pkfromsig$67:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$66:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$67
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 16(%rdi)
	jmp 	.Lwots_pkfromsig$64
.Lwots_pkfromsig$65:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$64:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$65
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 20(%rdi)
	jmp 	.Lwots_pkfromsig$62
.Lwots_pkfromsig$63:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$62:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$63
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 24(%rdi)
	jmp 	.Lwots_pkfromsig$60
.Lwots_pkfromsig$61:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$60:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$61
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 28(%rdi)
	jmp 	.Lwots_pkfromsig$58
.Lwots_pkfromsig$59:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$58:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$59
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 32(%rdi)
	jmp 	.Lwots_pkfromsig$56
.Lwots_pkfromsig$57:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$56:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$57
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 36(%rdi)
	jmp 	.Lwots_pkfromsig$54
.Lwots_pkfromsig$55:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$54:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$55
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 40(%rdi)
	jmp 	.Lwots_pkfromsig$52
.Lwots_pkfromsig$53:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$52:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$53
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 44(%rdi)
	jmp 	.Lwots_pkfromsig$50
.Lwots_pkfromsig$51:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$50:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$51
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 48(%rdi)
	jmp 	.Lwots_pkfromsig$48
.Lwots_pkfromsig$49:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$48:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$49
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 52(%rdi)
	jmp 	.Lwots_pkfromsig$46
.Lwots_pkfromsig$47:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$46:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$47
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 56(%rdi)
	jmp 	.Lwots_pkfromsig$44
.Lwots_pkfromsig$45:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$44:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$45
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 60(%rdi)
	jmp 	.Lwots_pkfromsig$42
.Lwots_pkfromsig$43:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$42:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$43
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 64(%rdi)
	jmp 	.Lwots_pkfromsig$40
.Lwots_pkfromsig$41:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$40:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$41
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 68(%rdi)
	jmp 	.Lwots_pkfromsig$38
.Lwots_pkfromsig$39:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$38:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$39
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 72(%rdi)
	jmp 	.Lwots_pkfromsig$36
.Lwots_pkfromsig$37:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$36:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$37
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 76(%rdi)
	jmp 	.Lwots_pkfromsig$34
.Lwots_pkfromsig$35:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$34:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$35
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 80(%rdi)
	jmp 	.Lwots_pkfromsig$32
.Lwots_pkfromsig$33:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$32:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$33
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 84(%rdi)
	jmp 	.Lwots_pkfromsig$30
.Lwots_pkfromsig$31:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$30:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$31
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 88(%rdi)
	jmp 	.Lwots_pkfromsig$28
.Lwots_pkfromsig$29:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$28:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$29
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 92(%rdi)
	jmp 	.Lwots_pkfromsig$26
.Lwots_pkfromsig$27:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$26:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$27
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 96(%rdi)
	jmp 	.Lwots_pkfromsig$24
.Lwots_pkfromsig$25:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$24:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$25
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 100(%rdi)
	jmp 	.Lwots_pkfromsig$22
.Lwots_pkfromsig$23:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$22:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$23
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 104(%rdi)
	jmp 	.Lwots_pkfromsig$20
.Lwots_pkfromsig$21:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$20:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$21
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 108(%rdi)
	jmp 	.Lwots_pkfromsig$18
.Lwots_pkfromsig$19:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$18:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$19
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 112(%rdi)
	jmp 	.Lwots_pkfromsig$16
.Lwots_pkfromsig$17:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$16:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$17
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 116(%rdi)
	jmp 	.Lwots_pkfromsig$14
.Lwots_pkfromsig$15:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$14:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$15
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 120(%rdi)
	jmp 	.Lwots_pkfromsig$12
.Lwots_pkfromsig$13:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$12:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$13
	movl	%r9d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 124(%rdi)
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
	movb	%al, 793(%rsp)
	shrl	$8, %ecx
	andl	$255, %ecx
	movb	%cl, 792(%rsp)
	leaq	128(%rsi), %rdi
	leaq	792(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %r9d
	jmp 	.Lwots_pkfromsig$10
.Lwots_pkfromsig$11:
	shll	$8, %r9d
	movzbl	(%rax,%rsi), %r8d
	orl 	%r8d, %r9d
	incq	%rsi
	addl	$8, %ecx
.Lwots_pkfromsig$10:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$11
	movl	%r9d, %r8d
	addl	$-4, %ecx
	shrq	%cl, %r8
	andq	$15, %r8
	movl	%r8d, (%rdi)
	jmp 	.Lwots_pkfromsig$8
.Lwots_pkfromsig$9:
	shll	$8, %r9d
	movzbl	(%rax,%rsi), %r8d
	orl 	%r8d, %r9d
	incq	%rsi
	addl	$8, %ecx
.Lwots_pkfromsig$8:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$9
	movl	%r9d, %r8d
	addl	$-4, %ecx
	shrq	%cl, %r8
	andq	$15, %r8
	movl	%r8d, 4(%rdi)
	jmp 	.Lwots_pkfromsig$6
.Lwots_pkfromsig$7:
	shll	$8, %r9d
	movzbl	(%rax,%rsi), %r8d
	orl 	%r8d, %r9d
	incq	%rsi
	addl	$8, %ecx
.Lwots_pkfromsig$6:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$7
	movl	%r9d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 8(%rdi)
	movb	(%rdx), %r9b
	movb	%r9b, 32(%rsp)
	movb	1(%rdx), %r9b
	movb	%r9b, 33(%rsp)
	movb	2(%rdx), %r9b
	movb	%r9b, 34(%rsp)
	movb	3(%rdx), %r9b
	movb	%r9b, 35(%rsp)
	movb	4(%rdx), %r9b
	movb	%r9b, 36(%rsp)
	movb	5(%rdx), %r9b
	movb	%r9b, 37(%rsp)
	movb	6(%rdx), %r9b
	movb	%r9b, 38(%rsp)
	movb	7(%rdx), %r9b
	movb	%r9b, 39(%rsp)
	movb	8(%rdx), %r9b
	movb	%r9b, 40(%rsp)
	movb	9(%rdx), %r9b
	movb	%r9b, 41(%rsp)
	movb	10(%rdx), %r9b
	movb	%r9b, 42(%rsp)
	movb	11(%rdx), %r9b
	movb	%r9b, 43(%rsp)
	movb	12(%rdx), %r9b
	movb	%r9b, 44(%rsp)
	movb	13(%rdx), %r9b
	movb	%r9b, 45(%rsp)
	movb	14(%rdx), %r9b
	movb	%r9b, 46(%rsp)
	movb	15(%rdx), %r9b
	movb	%r9b, 47(%rsp)
	movb	16(%rdx), %r9b
	movb	%r9b, 48(%rsp)
	movb	17(%rdx), %r9b
	movb	%r9b, 49(%rsp)
	movb	18(%rdx), %r9b
	movb	%r9b, 50(%rsp)
	movb	19(%rdx), %r9b
	movb	%r9b, 51(%rsp)
	movb	20(%rdx), %r9b
	movb	%r9b, 52(%rsp)
	movb	21(%rdx), %r9b
	movb	%r9b, 53(%rsp)
	movb	22(%rdx), %r9b
	movb	%r9b, 54(%rsp)
	movb	23(%rdx), %r9b
	movb	%r9b, 55(%rsp)
	movb	24(%rdx), %r9b
	movb	%r9b, 56(%rsp)
	movb	25(%rdx), %r9b
	movb	%r9b, 57(%rsp)
	movb	26(%rdx), %r9b
	movb	%r9b, 58(%rsp)
	movb	27(%rdx), %r9b
	movb	%r9b, 59(%rsp)
	movb	28(%rdx), %r9b
	movb	%r9b, 60(%rsp)
	movb	29(%rdx), %r9b
	movb	%r9b, 61(%rsp)
	movb	30(%rdx), %r9b
	movb	%r9b, 62(%rsp)
	movb	31(%rdx), %r9b
	movb	%r9b, 63(%rsp)
	movb	32(%rdx), %r9b
	movb	%r9b, 64(%rsp)
	movb	33(%rdx), %r9b
	movb	%r9b, 65(%rsp)
	movb	34(%rdx), %r9b
	movb	%r9b, 66(%rsp)
	movb	35(%rdx), %r9b
	movb	%r9b, 67(%rsp)
	movb	36(%rdx), %r9b
	movb	%r9b, 68(%rsp)
	movb	37(%rdx), %r9b
	movb	%r9b, 69(%rsp)
	movb	38(%rdx), %r9b
	movb	%r9b, 70(%rsp)
	movb	39(%rdx), %r9b
	movb	%r9b, 71(%rsp)
	movb	40(%rdx), %r9b
	movb	%r9b, 72(%rsp)
	movb	41(%rdx), %r9b
	movb	%r9b, 73(%rsp)
	movb	42(%rdx), %r9b
	movb	%r9b, 74(%rsp)
	movb	43(%rdx), %r9b
	movb	%r9b, 75(%rsp)
	movb	44(%rdx), %r9b
	movb	%r9b, 76(%rsp)
	movb	45(%rdx), %r9b
	movb	%r9b, 77(%rsp)
	movb	46(%rdx), %r9b
	movb	%r9b, 78(%rsp)
	movb	47(%rdx), %r9b
	movb	%r9b, 79(%rsp)
	movb	48(%rdx), %r9b
	movb	%r9b, 80(%rsp)
	movb	49(%rdx), %r9b
	movb	%r9b, 81(%rsp)
	movb	50(%rdx), %r9b
	movb	%r9b, 82(%rsp)
	movb	51(%rdx), %r9b
	movb	%r9b, 83(%rsp)
	movb	52(%rdx), %r9b
	movb	%r9b, 84(%rsp)
	movb	53(%rdx), %r9b
	movb	%r9b, 85(%rsp)
	movb	54(%rdx), %r9b
	movb	%r9b, 86(%rsp)
	movb	55(%rdx), %r9b
	movb	%r9b, 87(%rsp)
	movb	56(%rdx), %r9b
	movb	%r9b, 88(%rsp)
	movb	57(%rdx), %r9b
	movb	%r9b, 89(%rsp)
	movb	58(%rdx), %r9b
	movb	%r9b, 90(%rsp)
	movb	59(%rdx), %r9b
	movb	%r9b, 91(%rsp)
	movb	60(%rdx), %r9b
	movb	%r9b, 92(%rsp)
	movb	61(%rdx), %r9b
	movb	%r9b, 93(%rsp)
	movb	62(%rdx), %r9b
	movb	%r9b, 94(%rsp)
	movb	63(%rdx), %r9b
	movb	%r9b, 95(%rsp)
	movb	64(%rdx), %r9b
	movb	%r9b, 96(%rsp)
	movb	65(%rdx), %r9b
	movb	%r9b, 97(%rsp)
	movb	66(%rdx), %r9b
	movb	%r9b, 98(%rsp)
	movb	67(%rdx), %r9b
	movb	%r9b, 99(%rsp)
	movb	68(%rdx), %r9b
	movb	%r9b, 100(%rsp)
	movb	69(%rdx), %r9b
	movb	%r9b, 101(%rsp)
	movb	70(%rdx), %r9b
	movb	%r9b, 102(%rsp)
	movb	71(%rdx), %r9b
	movb	%r9b, 103(%rsp)
	movb	72(%rdx), %r9b
	movb	%r9b, 104(%rsp)
	movb	73(%rdx), %r9b
	movb	%r9b, 105(%rsp)
	movb	74(%rdx), %r9b
	movb	%r9b, 106(%rsp)
	movb	75(%rdx), %r9b
	movb	%r9b, 107(%rsp)
	movb	76(%rdx), %r9b
	movb	%r9b, 108(%rsp)
	movb	77(%rdx), %r9b
	movb	%r9b, 109(%rsp)
	movb	78(%rdx), %r9b
	movb	%r9b, 110(%rsp)
	movb	79(%rdx), %r9b
	movb	%r9b, 111(%rsp)
	movb	80(%rdx), %r9b
	movb	%r9b, 112(%rsp)
	movb	81(%rdx), %r9b
	movb	%r9b, 113(%rsp)
	movb	82(%rdx), %r9b
	movb	%r9b, 114(%rsp)
	movb	83(%rdx), %r9b
	movb	%r9b, 115(%rsp)
	movb	84(%rdx), %r9b
	movb	%r9b, 116(%rsp)
	movb	85(%rdx), %r9b
	movb	%r9b, 117(%rsp)
	movb	86(%rdx), %r9b
	movb	%r9b, 118(%rsp)
	movb	87(%rdx), %r9b
	movb	%r9b, 119(%rsp)
	movb	88(%rdx), %r9b
	movb	%r9b, 120(%rsp)
	movb	89(%rdx), %r9b
	movb	%r9b, 121(%rsp)
	movb	90(%rdx), %r9b
	movb	%r9b, 122(%rsp)
	movb	91(%rdx), %r9b
	movb	%r9b, 123(%rsp)
	movb	92(%rdx), %r9b
	movb	%r9b, 124(%rsp)
	movb	93(%rdx), %r9b
	movb	%r9b, 125(%rsp)
	movb	94(%rdx), %r9b
	movb	%r9b, 126(%rsp)
	movb	95(%rdx), %r9b
	movb	%r9b, 127(%rsp)
	movb	96(%rdx), %r9b
	movb	%r9b, 128(%rsp)
	movb	97(%rdx), %r9b
	movb	%r9b, 129(%rsp)
	movb	98(%rdx), %r9b
	movb	%r9b, 130(%rsp)
	movb	99(%rdx), %r9b
	movb	%r9b, 131(%rsp)
	movb	100(%rdx), %r9b
	movb	%r9b, 132(%rsp)
	movb	101(%rdx), %r9b
	movb	%r9b, 133(%rsp)
	movb	102(%rdx), %r9b
	movb	%r9b, 134(%rsp)
	movb	103(%rdx), %r9b
	movb	%r9b, 135(%rsp)
	movb	104(%rdx), %r9b
	movb	%r9b, 136(%rsp)
	movb	105(%rdx), %r9b
	movb	%r9b, 137(%rsp)
	movb	106(%rdx), %r9b
	movb	%r9b, 138(%rsp)
	movb	107(%rdx), %r9b
	movb	%r9b, 139(%rsp)
	movb	108(%rdx), %r9b
	movb	%r9b, 140(%rsp)
	movb	109(%rdx), %r9b
	movb	%r9b, 141(%rsp)
	movb	110(%rdx), %r9b
	movb	%r9b, 142(%rsp)
	movb	111(%rdx), %r9b
	movb	%r9b, 143(%rsp)
	movb	112(%rdx), %r9b
	movb	%r9b, 144(%rsp)
	movb	113(%rdx), %r9b
	movb	%r9b, 145(%rsp)
	movb	114(%rdx), %r9b
	movb	%r9b, 146(%rsp)
	movb	115(%rdx), %r9b
	movb	%r9b, 147(%rsp)
	movb	116(%rdx), %r9b
	movb	%r9b, 148(%rsp)
	movb	117(%rdx), %r9b
	movb	%r9b, 149(%rsp)
	movb	118(%rdx), %r9b
	movb	%r9b, 150(%rsp)
	movb	119(%rdx), %r9b
	movb	%r9b, 151(%rsp)
	movb	120(%rdx), %r9b
	movb	%r9b, 152(%rsp)
	movb	121(%rdx), %r9b
	movb	%r9b, 153(%rsp)
	movb	122(%rdx), %r9b
	movb	%r9b, 154(%rsp)
	movb	123(%rdx), %r9b
	movb	%r9b, 155(%rsp)
	movb	124(%rdx), %r9b
	movb	%r9b, 156(%rsp)
	movb	125(%rdx), %r9b
	movb	%r9b, 157(%rsp)
	movb	126(%rdx), %r9b
	movb	%r9b, 158(%rsp)
	movb	127(%rdx), %r9b
	movb	%r9b, 159(%rsp)
	movb	128(%rdx), %r9b
	movb	%r9b, 160(%rsp)
	movb	129(%rdx), %r9b
	movb	%r9b, 161(%rsp)
	movb	130(%rdx), %r9b
	movb	%r9b, 162(%rsp)
	movb	131(%rdx), %r9b
	movb	%r9b, 163(%rsp)
	movb	132(%rdx), %r9b
	movb	%r9b, 164(%rsp)
	movb	133(%rdx), %r9b
	movb	%r9b, 165(%rsp)
	movb	134(%rdx), %r9b
	movb	%r9b, 166(%rsp)
	movb	135(%rdx), %r9b
	movb	%r9b, 167(%rsp)
	movb	136(%rdx), %r9b
	movb	%r9b, 168(%rsp)
	movb	137(%rdx), %r9b
	movb	%r9b, 169(%rsp)
	movb	138(%rdx), %r9b
	movb	%r9b, 170(%rsp)
	movb	139(%rdx), %r9b
	movb	%r9b, 171(%rsp)
	movb	140(%rdx), %r9b
	movb	%r9b, 172(%rsp)
	movb	141(%rdx), %r9b
	movb	%r9b, 173(%rsp)
	movb	142(%rdx), %r9b
	movb	%r9b, 174(%rsp)
	movb	143(%rdx), %r9b
	movb	%r9b, 175(%rsp)
	movb	144(%rdx), %r9b
	movb	%r9b, 176(%rsp)
	movb	145(%rdx), %r9b
	movb	%r9b, 177(%rsp)
	movb	146(%rdx), %r9b
	movb	%r9b, 178(%rsp)
	movb	147(%rdx), %r9b
	movb	%r9b, 179(%rsp)
	movb	148(%rdx), %r9b
	movb	%r9b, 180(%rsp)
	movb	149(%rdx), %r9b
	movb	%r9b, 181(%rsp)
	movb	150(%rdx), %r9b
	movb	%r9b, 182(%rsp)
	movb	151(%rdx), %r9b
	movb	%r9b, 183(%rsp)
	movb	152(%rdx), %r9b
	movb	%r9b, 184(%rsp)
	movb	153(%rdx), %r9b
	movb	%r9b, 185(%rsp)
	movb	154(%rdx), %r9b
	movb	%r9b, 186(%rsp)
	movb	155(%rdx), %r9b
	movb	%r9b, 187(%rsp)
	movb	156(%rdx), %r9b
	movb	%r9b, 188(%rsp)
	movb	157(%rdx), %r9b
	movb	%r9b, 189(%rsp)
	movb	158(%rdx), %r9b
	movb	%r9b, 190(%rsp)
	movb	159(%rdx), %r9b
	movb	%r9b, 191(%rsp)
	movb	160(%rdx), %r9b
	movb	%r9b, 192(%rsp)
	movb	161(%rdx), %r9b
	movb	%r9b, 193(%rsp)
	movb	162(%rdx), %r9b
	movb	%r9b, 194(%rsp)
	movb	163(%rdx), %r9b
	movb	%r9b, 195(%rsp)
	movb	164(%rdx), %r9b
	movb	%r9b, 196(%rsp)
	movb	165(%rdx), %r9b
	movb	%r9b, 197(%rsp)
	movb	166(%rdx), %r9b
	movb	%r9b, 198(%rsp)
	movb	167(%rdx), %r9b
	movb	%r9b, 199(%rsp)
	movb	168(%rdx), %r9b
	movb	%r9b, 200(%rsp)
	movb	169(%rdx), %r9b
	movb	%r9b, 201(%rsp)
	movb	170(%rdx), %r9b
	movb	%r9b, 202(%rsp)
	movb	171(%rdx), %r9b
	movb	%r9b, 203(%rsp)
	movb	172(%rdx), %r9b
	movb	%r9b, 204(%rsp)
	movb	173(%rdx), %r9b
	movb	%r9b, 205(%rsp)
	movb	174(%rdx), %r9b
	movb	%r9b, 206(%rsp)
	movb	175(%rdx), %r9b
	movb	%r9b, 207(%rsp)
	movb	176(%rdx), %r9b
	movb	%r9b, 208(%rsp)
	movb	177(%rdx), %r9b
	movb	%r9b, 209(%rsp)
	movb	178(%rdx), %r9b
	movb	%r9b, 210(%rsp)
	movb	179(%rdx), %r9b
	movb	%r9b, 211(%rsp)
	movb	180(%rdx), %r9b
	movb	%r9b, 212(%rsp)
	movb	181(%rdx), %r9b
	movb	%r9b, 213(%rsp)
	movb	182(%rdx), %r9b
	movb	%r9b, 214(%rsp)
	movb	183(%rdx), %r9b
	movb	%r9b, 215(%rsp)
	movb	184(%rdx), %r9b
	movb	%r9b, 216(%rsp)
	movb	185(%rdx), %r9b
	movb	%r9b, 217(%rsp)
	movb	186(%rdx), %r9b
	movb	%r9b, 218(%rsp)
	movb	187(%rdx), %r9b
	movb	%r9b, 219(%rsp)
	movb	188(%rdx), %r9b
	movb	%r9b, 220(%rsp)
	movb	189(%rdx), %r9b
	movb	%r9b, 221(%rsp)
	movb	190(%rdx), %r9b
	movb	%r9b, 222(%rsp)
	movb	191(%rdx), %r9b
	movb	%r9b, 223(%rsp)
	movb	192(%rdx), %r9b
	movb	%r9b, 224(%rsp)
	movb	193(%rdx), %r9b
	movb	%r9b, 225(%rsp)
	movb	194(%rdx), %r9b
	movb	%r9b, 226(%rsp)
	movb	195(%rdx), %r9b
	movb	%r9b, 227(%rsp)
	movb	196(%rdx), %r9b
	movb	%r9b, 228(%rsp)
	movb	197(%rdx), %r9b
	movb	%r9b, 229(%rsp)
	movb	198(%rdx), %r9b
	movb	%r9b, 230(%rsp)
	movb	199(%rdx), %r9b
	movb	%r9b, 231(%rsp)
	movb	200(%rdx), %r9b
	movb	%r9b, 232(%rsp)
	movb	201(%rdx), %r9b
	movb	%r9b, 233(%rsp)
	movb	202(%rdx), %r9b
	movb	%r9b, 234(%rsp)
	movb	203(%rdx), %r9b
	movb	%r9b, 235(%rsp)
	movb	204(%rdx), %r9b
	movb	%r9b, 236(%rsp)
	movb	205(%rdx), %r9b
	movb	%r9b, 237(%rsp)
	movb	206(%rdx), %r9b
	movb	%r9b, 238(%rsp)
	movb	207(%rdx), %r9b
	movb	%r9b, 239(%rsp)
	movb	208(%rdx), %r9b
	movb	%r9b, 240(%rsp)
	movb	209(%rdx), %r9b
	movb	%r9b, 241(%rsp)
	movb	210(%rdx), %r9b
	movb	%r9b, 242(%rsp)
	movb	211(%rdx), %r9b
	movb	%r9b, 243(%rsp)
	movb	212(%rdx), %r9b
	movb	%r9b, 244(%rsp)
	movb	213(%rdx), %r9b
	movb	%r9b, 245(%rsp)
	movb	214(%rdx), %r9b
	movb	%r9b, 246(%rsp)
	movb	215(%rdx), %r9b
	movb	%r9b, 247(%rsp)
	movb	216(%rdx), %r9b
	movb	%r9b, 248(%rsp)
	movb	217(%rdx), %r9b
	movb	%r9b, 249(%rsp)
	movb	218(%rdx), %r9b
	movb	%r9b, 250(%rsp)
	movb	219(%rdx), %r9b
	movb	%r9b, 251(%rsp)
	movb	220(%rdx), %r9b
	movb	%r9b, 252(%rsp)
	movb	221(%rdx), %r9b
	movb	%r9b, 253(%rsp)
	movb	222(%rdx), %r9b
	movb	%r9b, 254(%rsp)
	movb	223(%rdx), %r9b
	movb	%r9b, 255(%rsp)
	movb	224(%rdx), %r9b
	movb	%r9b, 256(%rsp)
	movb	225(%rdx), %r9b
	movb	%r9b, 257(%rsp)
	movb	226(%rdx), %r9b
	movb	%r9b, 258(%rsp)
	movb	227(%rdx), %r9b
	movb	%r9b, 259(%rsp)
	movb	228(%rdx), %r9b
	movb	%r9b, 260(%rsp)
	movb	229(%rdx), %r9b
	movb	%r9b, 261(%rsp)
	movb	230(%rdx), %r9b
	movb	%r9b, 262(%rsp)
	movb	231(%rdx), %r9b
	movb	%r9b, 263(%rsp)
	movb	232(%rdx), %r9b
	movb	%r9b, 264(%rsp)
	movb	233(%rdx), %r9b
	movb	%r9b, 265(%rsp)
	movb	234(%rdx), %r9b
	movb	%r9b, 266(%rsp)
	movb	235(%rdx), %r9b
	movb	%r9b, 267(%rsp)
	movb	236(%rdx), %r9b
	movb	%r9b, 268(%rsp)
	movb	237(%rdx), %r9b
	movb	%r9b, 269(%rsp)
	movb	238(%rdx), %r9b
	movb	%r9b, 270(%rsp)
	movb	239(%rdx), %r9b
	movb	%r9b, 271(%rsp)
	movb	240(%rdx), %r9b
	movb	%r9b, 272(%rsp)
	movb	241(%rdx), %r9b
	movb	%r9b, 273(%rsp)
	movb	242(%rdx), %r9b
	movb	%r9b, 274(%rsp)
	movb	243(%rdx), %r9b
	movb	%r9b, 275(%rsp)
	movb	244(%rdx), %r9b
	movb	%r9b, 276(%rsp)
	movb	245(%rdx), %r9b
	movb	%r9b, 277(%rsp)
	movb	246(%rdx), %r9b
	movb	%r9b, 278(%rsp)
	movb	247(%rdx), %r9b
	movb	%r9b, 279(%rsp)
	movb	248(%rdx), %r9b
	movb	%r9b, 280(%rsp)
	movb	249(%rdx), %r9b
	movb	%r9b, 281(%rsp)
	movb	250(%rdx), %r9b
	movb	%r9b, 282(%rsp)
	movb	251(%rdx), %r9b
	movb	%r9b, 283(%rsp)
	movb	252(%rdx), %r9b
	movb	%r9b, 284(%rsp)
	movb	253(%rdx), %r9b
	movb	%r9b, 285(%rsp)
	movb	254(%rdx), %r9b
	movb	%r9b, 286(%rsp)
	movb	255(%rdx), %r9b
	movb	%r9b, 287(%rsp)
	movb	256(%rdx), %r9b
	movb	%r9b, 288(%rsp)
	movb	257(%rdx), %r9b
	movb	%r9b, 289(%rsp)
	movb	258(%rdx), %r9b
	movb	%r9b, 290(%rsp)
	movb	259(%rdx), %r9b
	movb	%r9b, 291(%rsp)
	movb	260(%rdx), %r9b
	movb	%r9b, 292(%rsp)
	movb	261(%rdx), %r9b
	movb	%r9b, 293(%rsp)
	movb	262(%rdx), %r9b
	movb	%r9b, 294(%rsp)
	movb	263(%rdx), %r9b
	movb	%r9b, 295(%rsp)
	movb	264(%rdx), %r9b
	movb	%r9b, 296(%rsp)
	movb	265(%rdx), %r9b
	movb	%r9b, 297(%rsp)
	movb	266(%rdx), %r9b
	movb	%r9b, 298(%rsp)
	movb	267(%rdx), %r9b
	movb	%r9b, 299(%rsp)
	movb	268(%rdx), %r9b
	movb	%r9b, 300(%rsp)
	movb	269(%rdx), %r9b
	movb	%r9b, 301(%rsp)
	movb	270(%rdx), %r9b
	movb	%r9b, 302(%rsp)
	movb	271(%rdx), %r9b
	movb	%r9b, 303(%rsp)
	movb	272(%rdx), %r9b
	movb	%r9b, 304(%rsp)
	movb	273(%rdx), %r9b
	movb	%r9b, 305(%rsp)
	movb	274(%rdx), %r9b
	movb	%r9b, 306(%rsp)
	movb	275(%rdx), %r9b
	movb	%r9b, 307(%rsp)
	movb	276(%rdx), %r9b
	movb	%r9b, 308(%rsp)
	movb	277(%rdx), %r9b
	movb	%r9b, 309(%rsp)
	movb	278(%rdx), %r9b
	movb	%r9b, 310(%rsp)
	movb	279(%rdx), %r9b
	movb	%r9b, 311(%rsp)
	movb	280(%rdx), %r9b
	movb	%r9b, 312(%rsp)
	movb	281(%rdx), %r9b
	movb	%r9b, 313(%rsp)
	movb	282(%rdx), %r9b
	movb	%r9b, 314(%rsp)
	movb	283(%rdx), %r9b
	movb	%r9b, 315(%rsp)
	movb	284(%rdx), %r9b
	movb	%r9b, 316(%rsp)
	movb	285(%rdx), %r9b
	movb	%r9b, 317(%rsp)
	movb	286(%rdx), %r9b
	movb	%r9b, 318(%rsp)
	movb	287(%rdx), %r9b
	movb	%r9b, 319(%rsp)
	movb	288(%rdx), %r9b
	movb	%r9b, 320(%rsp)
	movb	289(%rdx), %r9b
	movb	%r9b, 321(%rsp)
	movb	290(%rdx), %r9b
	movb	%r9b, 322(%rsp)
	movb	291(%rdx), %r9b
	movb	%r9b, 323(%rsp)
	movb	292(%rdx), %r9b
	movb	%r9b, 324(%rsp)
	movb	293(%rdx), %r9b
	movb	%r9b, 325(%rsp)
	movb	294(%rdx), %r9b
	movb	%r9b, 326(%rsp)
	movb	295(%rdx), %r9b
	movb	%r9b, 327(%rsp)
	movb	296(%rdx), %r9b
	movb	%r9b, 328(%rsp)
	movb	297(%rdx), %r9b
	movb	%r9b, 329(%rsp)
	movb	298(%rdx), %r9b
	movb	%r9b, 330(%rsp)
	movb	299(%rdx), %r9b
	movb	%r9b, 331(%rsp)
	movb	300(%rdx), %r9b
	movb	%r9b, 332(%rsp)
	movb	301(%rdx), %r9b
	movb	%r9b, 333(%rsp)
	movb	302(%rdx), %r9b
	movb	%r9b, 334(%rsp)
	movb	303(%rdx), %r9b
	movb	%r9b, 335(%rsp)
	movb	304(%rdx), %r9b
	movb	%r9b, 336(%rsp)
	movb	305(%rdx), %r9b
	movb	%r9b, 337(%rsp)
	movb	306(%rdx), %r9b
	movb	%r9b, 338(%rsp)
	movb	307(%rdx), %r9b
	movb	%r9b, 339(%rsp)
	movb	308(%rdx), %r9b
	movb	%r9b, 340(%rsp)
	movb	309(%rdx), %r9b
	movb	%r9b, 341(%rsp)
	movb	310(%rdx), %r9b
	movb	%r9b, 342(%rsp)
	movb	311(%rdx), %r9b
	movb	%r9b, 343(%rsp)
	movb	312(%rdx), %r9b
	movb	%r9b, 344(%rsp)
	movb	313(%rdx), %r9b
	movb	%r9b, 345(%rsp)
	movb	314(%rdx), %r9b
	movb	%r9b, 346(%rsp)
	movb	315(%rdx), %r9b
	movb	%r9b, 347(%rsp)
	movb	316(%rdx), %r9b
	movb	%r9b, 348(%rsp)
	movb	317(%rdx), %r9b
	movb	%r9b, 349(%rsp)
	movb	318(%rdx), %r9b
	movb	%r9b, 350(%rsp)
	movb	319(%rdx), %r9b
	movb	%r9b, 351(%rsp)
	movb	320(%rdx), %r9b
	movb	%r9b, 352(%rsp)
	movb	321(%rdx), %r9b
	movb	%r9b, 353(%rsp)
	movb	322(%rdx), %r9b
	movb	%r9b, 354(%rsp)
	movb	323(%rdx), %r9b
	movb	%r9b, 355(%rsp)
	movb	324(%rdx), %r9b
	movb	%r9b, 356(%rsp)
	movb	325(%rdx), %r9b
	movb	%r9b, 357(%rsp)
	movb	326(%rdx), %r9b
	movb	%r9b, 358(%rsp)
	movb	327(%rdx), %r9b
	movb	%r9b, 359(%rsp)
	movb	328(%rdx), %r9b
	movb	%r9b, 360(%rsp)
	movb	329(%rdx), %r9b
	movb	%r9b, 361(%rsp)
	movb	330(%rdx), %r9b
	movb	%r9b, 362(%rsp)
	movb	331(%rdx), %r9b
	movb	%r9b, 363(%rsp)
	movb	332(%rdx), %r9b
	movb	%r9b, 364(%rsp)
	movb	333(%rdx), %r9b
	movb	%r9b, 365(%rsp)
	movb	334(%rdx), %r9b
	movb	%r9b, 366(%rsp)
	movb	335(%rdx), %r9b
	movb	%r9b, 367(%rsp)
	movb	336(%rdx), %r9b
	movb	%r9b, 368(%rsp)
	movb	337(%rdx), %r9b
	movb	%r9b, 369(%rsp)
	movb	338(%rdx), %r9b
	movb	%r9b, 370(%rsp)
	movb	339(%rdx), %r9b
	movb	%r9b, 371(%rsp)
	movb	340(%rdx), %r9b
	movb	%r9b, 372(%rsp)
	movb	341(%rdx), %r9b
	movb	%r9b, 373(%rsp)
	movb	342(%rdx), %r9b
	movb	%r9b, 374(%rsp)
	movb	343(%rdx), %r9b
	movb	%r9b, 375(%rsp)
	movb	344(%rdx), %r9b
	movb	%r9b, 376(%rsp)
	movb	345(%rdx), %r9b
	movb	%r9b, 377(%rsp)
	movb	346(%rdx), %r9b
	movb	%r9b, 378(%rsp)
	movb	347(%rdx), %r9b
	movb	%r9b, 379(%rsp)
	movb	348(%rdx), %r9b
	movb	%r9b, 380(%rsp)
	movb	349(%rdx), %r9b
	movb	%r9b, 381(%rsp)
	movb	350(%rdx), %r9b
	movb	%r9b, 382(%rsp)
	movb	351(%rdx), %r9b
	movb	%r9b, 383(%rsp)
	movb	352(%rdx), %r9b
	movb	%r9b, 384(%rsp)
	movb	353(%rdx), %r9b
	movb	%r9b, 385(%rsp)
	movb	354(%rdx), %r9b
	movb	%r9b, 386(%rsp)
	movb	355(%rdx), %r9b
	movb	%r9b, 387(%rsp)
	movb	356(%rdx), %r9b
	movb	%r9b, 388(%rsp)
	movb	357(%rdx), %r9b
	movb	%r9b, 389(%rsp)
	movb	358(%rdx), %r9b
	movb	%r9b, 390(%rsp)
	movb	359(%rdx), %r9b
	movb	%r9b, 391(%rsp)
	movb	360(%rdx), %r9b
	movb	%r9b, 392(%rsp)
	movb	361(%rdx), %r9b
	movb	%r9b, 393(%rsp)
	movb	362(%rdx), %r9b
	movb	%r9b, 394(%rsp)
	movb	363(%rdx), %r9b
	movb	%r9b, 395(%rsp)
	movb	364(%rdx), %r9b
	movb	%r9b, 396(%rsp)
	movb	365(%rdx), %r9b
	movb	%r9b, 397(%rsp)
	movb	366(%rdx), %r9b
	movb	%r9b, 398(%rsp)
	movb	367(%rdx), %r9b
	movb	%r9b, 399(%rsp)
	movb	368(%rdx), %r9b
	movb	%r9b, 400(%rsp)
	movb	369(%rdx), %r9b
	movb	%r9b, 401(%rsp)
	movb	370(%rdx), %r9b
	movb	%r9b, 402(%rsp)
	movb	371(%rdx), %r9b
	movb	%r9b, 403(%rsp)
	movb	372(%rdx), %r9b
	movb	%r9b, 404(%rsp)
	movb	373(%rdx), %r9b
	movb	%r9b, 405(%rsp)
	movb	374(%rdx), %r9b
	movb	%r9b, 406(%rsp)
	movb	375(%rdx), %r9b
	movb	%r9b, 407(%rsp)
	movb	376(%rdx), %r9b
	movb	%r9b, 408(%rsp)
	movb	377(%rdx), %r9b
	movb	%r9b, 409(%rsp)
	movb	378(%rdx), %r9b
	movb	%r9b, 410(%rsp)
	movb	379(%rdx), %r9b
	movb	%r9b, 411(%rsp)
	movb	380(%rdx), %r9b
	movb	%r9b, 412(%rsp)
	movb	381(%rdx), %r9b
	movb	%r9b, 413(%rsp)
	movb	382(%rdx), %r9b
	movb	%r9b, 414(%rsp)
	movb	383(%rdx), %r9b
	movb	%r9b, 415(%rsp)
	movb	384(%rdx), %r9b
	movb	%r9b, 416(%rsp)
	movb	385(%rdx), %r9b
	movb	%r9b, 417(%rsp)
	movb	386(%rdx), %r9b
	movb	%r9b, 418(%rsp)
	movb	387(%rdx), %r9b
	movb	%r9b, 419(%rsp)
	movb	388(%rdx), %r9b
	movb	%r9b, 420(%rsp)
	movb	389(%rdx), %r9b
	movb	%r9b, 421(%rsp)
	movb	390(%rdx), %r9b
	movb	%r9b, 422(%rsp)
	movb	391(%rdx), %r9b
	movb	%r9b, 423(%rsp)
	movb	392(%rdx), %r9b
	movb	%r9b, 424(%rsp)
	movb	393(%rdx), %r9b
	movb	%r9b, 425(%rsp)
	movb	394(%rdx), %r9b
	movb	%r9b, 426(%rsp)
	movb	395(%rdx), %r9b
	movb	%r9b, 427(%rsp)
	movb	396(%rdx), %r9b
	movb	%r9b, 428(%rsp)
	movb	397(%rdx), %r9b
	movb	%r9b, 429(%rsp)
	movb	398(%rdx), %r9b
	movb	%r9b, 430(%rsp)
	movb	399(%rdx), %r9b
	movb	%r9b, 431(%rsp)
	movb	400(%rdx), %r9b
	movb	%r9b, 432(%rsp)
	movb	401(%rdx), %r9b
	movb	%r9b, 433(%rsp)
	movb	402(%rdx), %r9b
	movb	%r9b, 434(%rsp)
	movb	403(%rdx), %r9b
	movb	%r9b, 435(%rsp)
	movb	404(%rdx), %r9b
	movb	%r9b, 436(%rsp)
	movb	405(%rdx), %r9b
	movb	%r9b, 437(%rsp)
	movb	406(%rdx), %r9b
	movb	%r9b, 438(%rsp)
	movb	407(%rdx), %r9b
	movb	%r9b, 439(%rsp)
	movb	408(%rdx), %r9b
	movb	%r9b, 440(%rsp)
	movb	409(%rdx), %r9b
	movb	%r9b, 441(%rsp)
	movb	410(%rdx), %r9b
	movb	%r9b, 442(%rsp)
	movb	411(%rdx), %r9b
	movb	%r9b, 443(%rsp)
	movb	412(%rdx), %r9b
	movb	%r9b, 444(%rsp)
	movb	413(%rdx), %r9b
	movb	%r9b, 445(%rsp)
	movb	414(%rdx), %r9b
	movb	%r9b, 446(%rsp)
	movb	415(%rdx), %r9b
	movb	%r9b, 447(%rsp)
	movb	416(%rdx), %r9b
	movb	%r9b, 448(%rsp)
	movb	417(%rdx), %r9b
	movb	%r9b, 449(%rsp)
	movb	418(%rdx), %r9b
	movb	%r9b, 450(%rsp)
	movb	419(%rdx), %r9b
	movb	%r9b, 451(%rsp)
	movb	420(%rdx), %r9b
	movb	%r9b, 452(%rsp)
	movb	421(%rdx), %r9b
	movb	%r9b, 453(%rsp)
	movb	422(%rdx), %r9b
	movb	%r9b, 454(%rsp)
	movb	423(%rdx), %r9b
	movb	%r9b, 455(%rsp)
	movb	424(%rdx), %r9b
	movb	%r9b, 456(%rsp)
	movb	425(%rdx), %r9b
	movb	%r9b, 457(%rsp)
	movb	426(%rdx), %r9b
	movb	%r9b, 458(%rsp)
	movb	427(%rdx), %r9b
	movb	%r9b, 459(%rsp)
	movb	428(%rdx), %r9b
	movb	%r9b, 460(%rsp)
	movb	429(%rdx), %r9b
	movb	%r9b, 461(%rsp)
	movb	430(%rdx), %r9b
	movb	%r9b, 462(%rsp)
	movb	431(%rdx), %r9b
	movb	%r9b, 463(%rsp)
	movb	432(%rdx), %r9b
	movb	%r9b, 464(%rsp)
	movb	433(%rdx), %r9b
	movb	%r9b, 465(%rsp)
	movb	434(%rdx), %r9b
	movb	%r9b, 466(%rsp)
	movb	435(%rdx), %r9b
	movb	%r9b, 467(%rsp)
	movb	436(%rdx), %r9b
	movb	%r9b, 468(%rsp)
	movb	437(%rdx), %r9b
	movb	%r9b, 469(%rsp)
	movb	438(%rdx), %r9b
	movb	%r9b, 470(%rsp)
	movb	439(%rdx), %r9b
	movb	%r9b, 471(%rsp)
	movb	440(%rdx), %r9b
	movb	%r9b, 472(%rsp)
	movb	441(%rdx), %r9b
	movb	%r9b, 473(%rsp)
	movb	442(%rdx), %r9b
	movb	%r9b, 474(%rsp)
	movb	443(%rdx), %r9b
	movb	%r9b, 475(%rsp)
	movb	444(%rdx), %r9b
	movb	%r9b, 476(%rsp)
	movb	445(%rdx), %r9b
	movb	%r9b, 477(%rsp)
	movb	446(%rdx), %r9b
	movb	%r9b, 478(%rsp)
	movb	447(%rdx), %r9b
	movb	%r9b, 479(%rsp)
	movb	448(%rdx), %r9b
	movb	%r9b, 480(%rsp)
	movb	449(%rdx), %r9b
	movb	%r9b, 481(%rsp)
	movb	450(%rdx), %r9b
	movb	%r9b, 482(%rsp)
	movb	451(%rdx), %r9b
	movb	%r9b, 483(%rsp)
	movb	452(%rdx), %r9b
	movb	%r9b, 484(%rsp)
	movb	453(%rdx), %r9b
	movb	%r9b, 485(%rsp)
	movb	454(%rdx), %r9b
	movb	%r9b, 486(%rsp)
	movb	455(%rdx), %r9b
	movb	%r9b, 487(%rsp)
	movb	456(%rdx), %r9b
	movb	%r9b, 488(%rsp)
	movb	457(%rdx), %r9b
	movb	%r9b, 489(%rsp)
	movb	458(%rdx), %r9b
	movb	%r9b, 490(%rsp)
	movb	459(%rdx), %r9b
	movb	%r9b, 491(%rsp)
	movb	460(%rdx), %r9b
	movb	%r9b, 492(%rsp)
	movb	461(%rdx), %r9b
	movb	%r9b, 493(%rsp)
	movb	462(%rdx), %r9b
	movb	%r9b, 494(%rsp)
	movb	463(%rdx), %r9b
	movb	%r9b, 495(%rsp)
	movb	464(%rdx), %r9b
	movb	%r9b, 496(%rsp)
	movb	465(%rdx), %r9b
	movb	%r9b, 497(%rsp)
	movb	466(%rdx), %r9b
	movb	%r9b, 498(%rsp)
	movb	467(%rdx), %r9b
	movb	%r9b, 499(%rsp)
	movb	468(%rdx), %r9b
	movb	%r9b, 500(%rsp)
	movb	469(%rdx), %r9b
	movb	%r9b, 501(%rsp)
	movb	470(%rdx), %r9b
	movb	%r9b, 502(%rsp)
	movb	471(%rdx), %r9b
	movb	%r9b, 503(%rsp)
	movb	472(%rdx), %r9b
	movb	%r9b, 504(%rsp)
	movb	473(%rdx), %r9b
	movb	%r9b, 505(%rsp)
	movb	474(%rdx), %r9b
	movb	%r9b, 506(%rsp)
	movb	475(%rdx), %r9b
	movb	%r9b, 507(%rsp)
	movb	476(%rdx), %r9b
	movb	%r9b, 508(%rsp)
	movb	477(%rdx), %r9b
	movb	%r9b, 509(%rsp)
	movb	478(%rdx), %r9b
	movb	%r9b, 510(%rsp)
	movb	479(%rdx), %r9b
	movb	%r9b, 511(%rsp)
	movb	480(%rdx), %r9b
	movb	%r9b, 512(%rsp)
	movb	481(%rdx), %r9b
	movb	%r9b, 513(%rsp)
	movb	482(%rdx), %r9b
	movb	%r9b, 514(%rsp)
	movb	483(%rdx), %r9b
	movb	%r9b, 515(%rsp)
	movb	484(%rdx), %r9b
	movb	%r9b, 516(%rsp)
	movb	485(%rdx), %r9b
	movb	%r9b, 517(%rsp)
	movb	486(%rdx), %r9b
	movb	%r9b, 518(%rsp)
	movb	487(%rdx), %r9b
	movb	%r9b, 519(%rsp)
	movb	488(%rdx), %r9b
	movb	%r9b, 520(%rsp)
	movb	489(%rdx), %r9b
	movb	%r9b, 521(%rsp)
	movb	490(%rdx), %r9b
	movb	%r9b, 522(%rsp)
	movb	491(%rdx), %r9b
	movb	%r9b, 523(%rsp)
	movb	492(%rdx), %r9b
	movb	%r9b, 524(%rsp)
	movb	493(%rdx), %r9b
	movb	%r9b, 525(%rsp)
	movb	494(%rdx), %r9b
	movb	%r9b, 526(%rsp)
	movb	495(%rdx), %r9b
	movb	%r9b, 527(%rsp)
	movb	496(%rdx), %r9b
	movb	%r9b, 528(%rsp)
	movb	497(%rdx), %r9b
	movb	%r9b, 529(%rsp)
	movb	498(%rdx), %r9b
	movb	%r9b, 530(%rsp)
	movb	499(%rdx), %r9b
	movb	%r9b, 531(%rsp)
	movb	500(%rdx), %r9b
	movb	%r9b, 532(%rsp)
	movb	501(%rdx), %r9b
	movb	%r9b, 533(%rsp)
	movb	502(%rdx), %r9b
	movb	%r9b, 534(%rsp)
	movb	503(%rdx), %r9b
	movb	%r9b, 535(%rsp)
	movb	504(%rdx), %r9b
	movb	%r9b, 536(%rsp)
	movb	505(%rdx), %r9b
	movb	%r9b, 537(%rsp)
	movb	506(%rdx), %r9b
	movb	%r9b, 538(%rsp)
	movb	507(%rdx), %r9b
	movb	%r9b, 539(%rsp)
	movb	508(%rdx), %r9b
	movb	%r9b, 540(%rsp)
	movb	509(%rdx), %r9b
	movb	%r9b, 541(%rsp)
	movb	510(%rdx), %r9b
	movb	%r9b, 542(%rsp)
	movb	511(%rdx), %r9b
	movb	%r9b, 543(%rsp)
	movb	512(%rdx), %r9b
	movb	%r9b, 544(%rsp)
	movb	513(%rdx), %r9b
	movb	%r9b, 545(%rsp)
	movb	514(%rdx), %r9b
	movb	%r9b, 546(%rsp)
	movb	515(%rdx), %r9b
	movb	%r9b, 547(%rsp)
	movb	516(%rdx), %r9b
	movb	%r9b, 548(%rsp)
	movb	517(%rdx), %r9b
	movb	%r9b, 549(%rsp)
	movb	518(%rdx), %r9b
	movb	%r9b, 550(%rsp)
	movb	519(%rdx), %r9b
	movb	%r9b, 551(%rsp)
	movb	520(%rdx), %r9b
	movb	%r9b, 552(%rsp)
	movb	521(%rdx), %r9b
	movb	%r9b, 553(%rsp)
	movb	522(%rdx), %r9b
	movb	%r9b, 554(%rsp)
	movb	523(%rdx), %r9b
	movb	%r9b, 555(%rsp)
	movb	524(%rdx), %r9b
	movb	%r9b, 556(%rsp)
	movb	525(%rdx), %r9b
	movb	%r9b, 557(%rsp)
	movb	526(%rdx), %r9b
	movb	%r9b, 558(%rsp)
	movb	527(%rdx), %r9b
	movb	%r9b, 559(%rsp)
	movb	528(%rdx), %r9b
	movb	%r9b, 560(%rsp)
	movb	529(%rdx), %r9b
	movb	%r9b, 561(%rsp)
	movb	530(%rdx), %r9b
	movb	%r9b, 562(%rsp)
	movb	531(%rdx), %r9b
	movb	%r9b, 563(%rsp)
	movb	532(%rdx), %r9b
	movb	%r9b, 564(%rsp)
	movb	533(%rdx), %r9b
	movb	%r9b, 565(%rsp)
	movb	534(%rdx), %r9b
	movb	%r9b, 566(%rsp)
	movb	535(%rdx), %r9b
	movb	%r9b, 567(%rsp)
	movb	536(%rdx), %r9b
	movb	%r9b, 568(%rsp)
	movb	537(%rdx), %r9b
	movb	%r9b, 569(%rsp)
	movb	538(%rdx), %r9b
	movb	%r9b, 570(%rsp)
	movb	539(%rdx), %r9b
	movb	%r9b, 571(%rsp)
	movb	540(%rdx), %r9b
	movb	%r9b, 572(%rsp)
	movb	541(%rdx), %r9b
	movb	%r9b, 573(%rsp)
	movb	542(%rdx), %r9b
	movb	%r9b, 574(%rsp)
	movb	543(%rdx), %r9b
	movb	%r9b, 575(%rsp)
	movb	544(%rdx), %r9b
	movb	%r9b, 576(%rsp)
	movb	545(%rdx), %r9b
	movb	%r9b, 577(%rsp)
	movb	546(%rdx), %r9b
	movb	%r9b, 578(%rsp)
	movb	547(%rdx), %r9b
	movb	%r9b, 579(%rsp)
	movb	548(%rdx), %r9b
	movb	%r9b, 580(%rsp)
	movb	549(%rdx), %r9b
	movb	%r9b, 581(%rsp)
	movb	550(%rdx), %r9b
	movb	%r9b, 582(%rsp)
	movb	551(%rdx), %r9b
	movb	%r9b, 583(%rsp)
	movb	552(%rdx), %r9b
	movb	%r9b, 584(%rsp)
	movb	553(%rdx), %r9b
	movb	%r9b, 585(%rsp)
	movb	554(%rdx), %r9b
	movb	%r9b, 586(%rsp)
	movb	555(%rdx), %r9b
	movb	%r9b, 587(%rsp)
	movb	556(%rdx), %r9b
	movb	%r9b, 588(%rsp)
	movb	557(%rdx), %r9b
	movb	%r9b, 589(%rsp)
	movb	558(%rdx), %r9b
	movb	%r9b, 590(%rsp)
	movb	559(%rdx), %dl
	movb	%dl, 591(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkfromsig$3
.Lwots_pkfromsig$4:
	movq	%r10, 600(%rsp)
	movl	%ecx, 648(%rsp)
	movq	%rdx, 608(%rsp)
	movl	%ecx, %eax
	movl	%eax, 24(%r11)
	movl	%ecx, %eax
	movl	652(%rsp,%rax,4), %ecx
	lfence
	movq	$0, %rax
	movl	$15, %eax
	subl	%ecx, %eax
	leaq	32(%rsp,%rdx), %rdi
	movl	%eax, %edx
	movq	%r10, %r9
	movq	%r11, %r8
	leaq	-8(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkfromsig$5:
	leaq	8(%rsp), %rsp
	movq	%r8, %r11
	movq	600(%rsp), %r10
	movl	648(%rsp), %ecx
	movq	608(%rsp), %rdx
	lfence
	movq	$0, %rax
	incl	%ecx
	addq	$16, %rdx
.Lwots_pkfromsig$3:
	cmpl	$35, %ecx
	jb  	.Lwots_pkfromsig$4
	leaq	616(%rsp), %rax
	movq	(%r11), %rdx
	movq	%rdx, (%rax)
	movq	8(%r11), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r11), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r11), %rdx
	movq	%rdx, 24(%rax)
	leaq	616(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$1, 16(%rcx)
	movl	20(%r11), %edx
	leaq	616(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movq	592(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	%r11, 592(%rsp)
	leaq	616(%rsp), %r8
	leaq	32(%rsp), %rax
	movq	%rcx, %rdi
	movq	%r10, %rsi
	movq	%rax, %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkfromsig$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rdx
	movq	592(%rsp), %rcx
	lfence
	movq	$0, %rax
	ret
.Lwots_sign$1:
	leaq	84(%rsp), %rsi
	movq	%rsi, %rdx
	movq	$0, %rdi
	movl	$0, %ecx
	movl	$0, %r9d
	jmp 	.Lwots_sign$76
.Lwots_sign$77:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$76:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$77
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, (%rdx)
	jmp 	.Lwots_sign$74
.Lwots_sign$75:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$74:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$75
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 4(%rdx)
	jmp 	.Lwots_sign$72
.Lwots_sign$73:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$72:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$73
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 8(%rdx)
	jmp 	.Lwots_sign$70
.Lwots_sign$71:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$70:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$71
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 12(%rdx)
	jmp 	.Lwots_sign$68
.Lwots_sign$69:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$68:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$69
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 16(%rdx)
	jmp 	.Lwots_sign$66
.Lwots_sign$67:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$66:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$67
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 20(%rdx)
	jmp 	.Lwots_sign$64
.Lwots_sign$65:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$64:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$65
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 24(%rdx)
	jmp 	.Lwots_sign$62
.Lwots_sign$63:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$62:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$63
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 28(%rdx)
	jmp 	.Lwots_sign$60
.Lwots_sign$61:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$60:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$61
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 32(%rdx)
	jmp 	.Lwots_sign$58
.Lwots_sign$59:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$58:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$59
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 36(%rdx)
	jmp 	.Lwots_sign$56
.Lwots_sign$57:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$56:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$57
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 40(%rdx)
	jmp 	.Lwots_sign$54
.Lwots_sign$55:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$54:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$55
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 44(%rdx)
	jmp 	.Lwots_sign$52
.Lwots_sign$53:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$52:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$53
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 48(%rdx)
	jmp 	.Lwots_sign$50
.Lwots_sign$51:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$50:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$51
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 52(%rdx)
	jmp 	.Lwots_sign$48
.Lwots_sign$49:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$48:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$49
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 56(%rdx)
	jmp 	.Lwots_sign$46
.Lwots_sign$47:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$46:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$47
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 60(%rdx)
	jmp 	.Lwots_sign$44
.Lwots_sign$45:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$44:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$45
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 64(%rdx)
	jmp 	.Lwots_sign$42
.Lwots_sign$43:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$42:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$43
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 68(%rdx)
	jmp 	.Lwots_sign$40
.Lwots_sign$41:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$40:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$41
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 72(%rdx)
	jmp 	.Lwots_sign$38
.Lwots_sign$39:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$38:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$39
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 76(%rdx)
	jmp 	.Lwots_sign$36
.Lwots_sign$37:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$36:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$37
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 80(%rdx)
	jmp 	.Lwots_sign$34
.Lwots_sign$35:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$34:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$35
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 84(%rdx)
	jmp 	.Lwots_sign$32
.Lwots_sign$33:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$32:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$33
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 88(%rdx)
	jmp 	.Lwots_sign$30
.Lwots_sign$31:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$30:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$31
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 92(%rdx)
	jmp 	.Lwots_sign$28
.Lwots_sign$29:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$28:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$29
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 96(%rdx)
	jmp 	.Lwots_sign$26
.Lwots_sign$27:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$26:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$27
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 100(%rdx)
	jmp 	.Lwots_sign$24
.Lwots_sign$25:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$24:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$25
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 104(%rdx)
	jmp 	.Lwots_sign$22
.Lwots_sign$23:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$22:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$23
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 108(%rdx)
	jmp 	.Lwots_sign$20
.Lwots_sign$21:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$20:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$21
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 112(%rdx)
	jmp 	.Lwots_sign$18
.Lwots_sign$19:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$18:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$19
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 116(%rdx)
	jmp 	.Lwots_sign$16
.Lwots_sign$17:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$16:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$17
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 120(%rdx)
	jmp 	.Lwots_sign$14
.Lwots_sign$15:
	shll	$8, %r9d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r9d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$14:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$15
	movl	%r9d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 124(%rdx)
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
	movb	%al, 225(%rsp)
	shrl	$8, %ecx
	andl	$255, %ecx
	movb	%cl, 224(%rsp)
	leaq	128(%rsi), %rdx
	leaq	224(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r9d
	orl 	%r9d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lwots_sign$12:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$13
	movl	%edi, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, (%rdx)
	jmp 	.Lwots_sign$10
.Lwots_sign$11:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r9d
	orl 	%r9d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lwots_sign$10:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$11
	movl	%edi, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, 4(%rdx)
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r9d
	orl 	%r9d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lwots_sign$8:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$9
	movl	%edi, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 8(%rdx)
	leaq	48(%rsp), %rax
	movq	(%r8), %rdx
	movq	%rdx, (%rax)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rax)
	leaq	48(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%r8), %edx
	leaq	48(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movq	%r8, 8(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_sign$5
.Lwots_sign$6:
	movq	%r11, 16(%rsp)
	movq	%r10, 24(%rsp)
	movl	%ecx, 80(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%ecx, %eax
	leaq	48(%rsp), %rcx
	movl	%eax, 24(%rcx)
	leaq	(%rbx,%rdx), %rcx
	movq	%rbx, 40(%rsp)
	leaq	48(%rsp), %r8
	movq	%r10, %rsi
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lwots_sign$7:
	leaq	40(%rsp), %rsp
	movq	40(%rsp), %rbx
	lfence
	movq	$0, %rax
	movq	16(%rsp), %r11
	movq	24(%rsp), %r10
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rdx
	lfence
	movq	$0, %rax
	incl	%ecx
	addq	$16, %rdx
.Lwots_sign$5:
	cmpl	$35, %ecx
	jb  	.Lwots_sign$6
	movq	8(%rsp), %r8
	lfence
	movq	$0, %rax
	movq	$0, %rsi
	movl	$0, %edx
	jmp 	.Lwots_sign$2
.Lwots_sign$3:
	movq	%r10, 8(%rsp)
	movl	%edx, 80(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%edx, %eax
	movl	%eax, 24(%r8)
	movl	$0, %ecx
	movl	%edx, %eax
	movl	84(%rsp,%rax,4), %eax
	lfence
	movq	$0, %rdx
	leaq	(%rbx,%rsi), %rdi
	movq	%rbx, 24(%rsp)
	movl	%eax, %edx
	movq	%r10, %r9
	leaq	-8(%rsp), %rsp
	call	.Lchain$1
.Lwots_sign$4:
	leaq	8(%rsp), %rsp
	movq	24(%rsp), %rbx
	lfence
	movq	$0, %rax
	movq	8(%rsp), %r10
	movl	80(%rsp), %edx
	movq	32(%rsp), %rsi
	lfence
	movq	$0, %rax
	incl	%edx
	addq	$16, %rsi
.Lwots_sign$2:
	cmpl	$35, %edx
	jb  	.Lwots_sign$3
	ret
.Lwots_pkgen$1:
	movq	%rdi, 592(%rsp)
	leaq	632(%rsp), %rcx
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rcx)
	leaq	632(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%r8), %edx
	leaq	632(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movl	%edx, 664(%rsp)
	movq	%r8, 600(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$6
.Lwots_pkgen$7:
	movq	%r11, 608(%rsp)
	movq	%rsi, 616(%rsp)
	movl	%ecx, 668(%rsp)
	movq	%rdx, 624(%rsp)
	leaq	632(%rsp), %r8
	movl	%ecx, 24(%r8)
	leaq	32(%rsp,%rdx), %rcx
	leaq	632(%rsp), %r8
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lwots_pkgen$8:
	leaq	40(%rsp), %rsp
	movq	608(%rsp), %r11
	movq	616(%rsp), %rsi
	movl	668(%rsp), %ecx
	movq	624(%rsp), %rdx
	lfence
	movq	$0, %r8
	incl	%ecx
	addq	$16, %rdx
.Lwots_pkgen$6:
	cmpl	$35, %ecx
	jb  	.Lwots_pkgen$7
	movq	600(%rsp), %r8
	lfence
	movq	$0, %rcx
	movq	$0, %rdi
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$3
.Lwots_pkgen$4:
	movq	%rsi, 600(%rsp)
	movl	%ecx, 668(%rsp)
	movq	%rdi, 624(%rsp)
	movl	%ecx, 24(%r8)
	movl	$0, %ecx
	movl	$15, %edx
	leaq	32(%rsp,%rdi), %rdi
	movq	%rsi, %r9
	leaq	-8(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkgen$5:
	leaq	8(%rsp), %rsp
	movq	600(%rsp), %rsi
	movl	668(%rsp), %ecx
	movq	624(%rsp), %rdi
	lfence
	movq	$0, %rdx
	incl	%ecx
	addq	$16, %rdi
.Lwots_pkgen$3:
	cmpl	$35, %ecx
	jb  	.Lwots_pkgen$4
	leaq	632(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$1, 16(%rcx)
	movl	664(%rsp), %edx
	lfence
	movq	$0, %rcx
	leaq	632(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movq	592(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	%r8, 592(%rsp)
	leaq	632(%rsp), %r8
	leaq	32(%rsp), %rdx
	movq	%rcx, %rdi
	movq	%rdx, %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rdi
	movq	592(%rsp), %rcx
	lfence
	movq	$0, %rdx
	ret
.Lchain$1:
	movl	%ecx, %esi
	addl	%edx, %esi
	jmp 	.Lchain$2
.Lchain$3:
	movl	%ecx, 28(%r8)
	movq	%r9, %mm0
	movq	%r8, %mm1
	movd	%ecx, %mm2
	movd	%esi, %mm3
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lchain$4:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rdi
	movq	%mm0, %r9
	movq	%mm1, %r8
	movd	%mm2, %ecx
	movd	%mm3, %esi
	incl	%ecx
.Lchain$2:
	cmpl	%esi, %ecx
	jb  	.Lchain$3
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
	movq	$0, %rdi
	vpbroadcastq	(%r9,%rdi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r9,%rdi), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r8), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%r8), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%r8), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%r8), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%r8), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%r8), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%r8), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%r8), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %rdi
	vmovdqu	(%rcx,%rdi), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vmovdqu	8(%rcx,%rdi), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rcx,%rdi), %rcx
	vmovq	%rcx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rdi
	movq	$0, %rcx
	vmovq	%rcx, %xmm7
	vmovdqu	(%rax,%rdi), %ymm14
	movq	32(%rax,%rdi), %rcx
	vmovq	%rcx, %xmm8
	vmovdqu	40(%rax,%rdi), %ymm13
	movq	72(%rax,%rdi), %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	movq	80(%rax,%rdi), %rcx
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
	addq	$88, %rdi
	call	.L_keccakf1600_avx2$1
.LT_k$9:
	movq	$0, %rcx
	jmp 	.LT_k$6
.LT_k$7:
	vpbroadcastq	(%rax,%rdi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rdi), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rax,%rdi), %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	48(%rax,%rdi), %ymm14
	movq	80(%rax,%rdi), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	88(%rax,%rdi), %ymm13
	movq	120(%rax,%rdi), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	128(%rax,%rdi), %rdx
	vmovq	%rdx, %xmm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm8
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
	addq	$136, %rdi
	call	.L_keccakf1600_avx2$1
.LT_k$8:
	incq	%rcx
.LT_k$6:
	cmpq	$3, %rcx
	jb  	.LT_k$7
	vpbroadcastq	(%rax,%rdi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rdi), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%rax,%rdi), %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	$1, %rax
	shlq	$63, %rax
	vmovq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rcx
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	.LT_k$3
.LT_k$4:
	call	.L_keccakf1600_avx2$1
.LT_k$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rax)
	vmovdqu	%ymm4, 8(%rcx,%rax)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rax)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rax)
	movq	%xmm9, %rdx
	movq	%rdx, 80(%rcx,%rax)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rcx,%rax)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rax)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rax)
	addq	$136, %rax
	incq	%rdi
.LT_k$3:
	cmpq	$0, %rdi
	jb  	.LT_k$4
	call	.L_keccakf1600_avx2$1
.LT_k$2:
	movq	%xmm5, (%rcx,%rax)
	movq	%xmm4, 8(%rcx,%rax)
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
	movq	$0, %rdi
	vpbroadcastq	(%rsi,%rdi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%rsi,%rdi), %rdx
	vmovq	%rdx, %xmm7
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rdx
	movl	(%r8), %esi
	bswapl	%esi
	movl	%esi, (%rdx)
	movl	4(%r8), %esi
	bswapl	%esi
	movl	%esi, 4(%rdx)
	movl	8(%r8), %esi
	bswapl	%esi
	movl	%esi, 8(%rdx)
	movl	12(%r8), %esi
	bswapl	%esi
	movl	%esi, 12(%rdx)
	movl	16(%r8), %esi
	bswapl	%esi
	movl	%esi, 16(%rdx)
	movl	20(%r8), %esi
	bswapl	%esi
	movl	%esi, 20(%rdx)
	movl	24(%r8), %esi
	bswapl	%esi
	movl	%esi, 24(%rdx)
	movl	28(%r8), %esi
	bswapl	%esi
	movl	%esi, 28(%rdx)
	leaq	16(%rsp), %rdx
	movq	$0, %rdi
	vmovdqu	(%rdx,%rdi), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vmovdqu	8(%rdx,%rdi), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rdx,%rdi), %rdx
	vmovq	%rdx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rdi
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	(%rcx,%rdi), %ymm14
	movq	32(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	40(%rcx,%rdi), %ymm13
	movq	72(%rcx,%rdi), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	80(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm8
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
	addq	$88, %rdi
	call	.L_keccakf1600_avx2$1
.LT_len$9:
	movq	$0, %r10
	jmp 	.LT_len$6
.LT_len$7:
	vpbroadcastq	(%rcx,%rdi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rdi), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	48(%rcx,%rdi), %ymm14
	movq	80(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	88(%rcx,%rdi), %ymm13
	movq	120(%rcx,%rdi), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	128(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm8
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
	addq	$136, %rdi
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%r10
.LT_len$6:
	cmpq	$3, %r10
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%rdi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rdi), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	48(%rcx,%rdi), %xmm9
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
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rcx
	movq	$0, %rdi
	movq	$0, %r10
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm4, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm9, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rdi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdi)
	addq	$136, %rdi
	incq	%r10
.LT_len$3:
	cmpq	$0, %r10
	jb  	.LT_len$4
	call	.L_keccakf1600_avx2$1
.LT_len$2:
	movq	%xmm5, (%rcx,%rdi)
	movq	%xmm4, 8(%rcx,%rdi)
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
	movq	$0, %rdi
	vpbroadcastq	(%rsi,%rdi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%rsi,%rdi), %rsi
	vmovq	%rsi, %xmm7
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rsi
	movl	(%r8), %edi
	bswapl	%edi
	movl	%edi, (%rsi)
	movl	4(%r8), %edi
	bswapl	%edi
	movl	%edi, 4(%rsi)
	movl	8(%r8), %edi
	bswapl	%edi
	movl	%edi, 8(%rsi)
	movl	12(%r8), %edi
	bswapl	%edi
	movl	%edi, 12(%rsi)
	movl	16(%r8), %edi
	bswapl	%edi
	movl	%edi, 16(%rsi)
	movl	20(%r8), %edi
	bswapl	%edi
	movl	%edi, 20(%rsi)
	movl	24(%r8), %edi
	bswapl	%edi
	movl	%edi, 24(%rsi)
	movl	28(%r8), %edi
	bswapl	%edi
	movl	%edi, 28(%rsi)
	leaq	16(%rsp), %rsi
	movq	$0, %rdi
	vmovdqu	(%rsi,%rdi), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vmovdqu	8(%rsi,%rdi), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rsi,%rdi), %rsi
	vmovq	%rsi, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rdi
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	(%rcx,%rdi), %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm8, %xmm8, %xmm8
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
	movq	$0, %rdi
	movq	$0, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	vmovdqu	(%rdx,%rdi), %xmm8
	vinserti128	$1, %xmm8, %ymm9, %ymm14
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
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
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rcx
	movq	$0, %rdi
	movq	$0, %r10
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm4, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rdi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdi)
	addq	$136, %rdi
	incq	%r10
.LH$3:
	cmpq	$0, %r10
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm5, (%rcx,%rdi)
	movq	%xmm4, 8(%rcx,%rdi)
	ret
.LF$1:
	movq	%rdi, %mm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%r9,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r9,%rcx), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r8), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%r8), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%r8), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%r8), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%r8), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%r8), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%r8), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%r8), %edx
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
	movq	$0, %rcx
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	(%rdi,%rcx), %xmm9
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
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm4, %rcx
	movq	$0, %rdi
	movq	$0, %r10
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm4, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm9, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rdi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdi)
	addq	$136, %rdi
	incq	%r10
.LF$3:
	cmpq	$0, %r10
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm5, (%rcx,%rdi)
	movq	%xmm4, 8(%rcx,%rdi)
	ret
.LPRF$1:
	movq	%rcx, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%rsi,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%rsi,%rcx), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r8), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%r8), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%r8), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%r8), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%r8), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%r8), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%r8), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%r8), %edx
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
	movq	$0, %rcx
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	(%r11,%rcx), %xmm9
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
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rcx
	movq	$0, %rdi
	movq	$0, %r10
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm4, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm9, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rdi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdi)
	addq	$136, %rdi
	incq	%r10
.LPRF$3:
	cmpq	$0, %r10
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm5, (%rcx,%rdi)
	movq	%xmm4, 8(%rcx,%rdi)
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
	movq	$34, %rdi
	movq	$0, %rdx
	movq	232(%rsp), %r11
	movq	240(%rsp), %rsi
	lfence
	movq	$0, %rax
	jmp 	.LPRF_msg$11
.LPRF_msg$12:
	cmpq	$136, %rdi
	jb  	.LPRF_msg$13
	movq	%r11, 240(%rsp)
	movq	%rdx, 232(%rsp)
	movq	%rsi, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$14:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %r11
	movq	232(%rsp), %rdx
	movq	264(%rsp), %rsi
	lfence
	movq	$0, %rcx
	movq	$0, %rdi
.LPRF_msg$13:
	movb	(%r11,%rdx), %r9b
	incq	%rdx
	xorb	%r9b, 32(%rsp,%rdi)
	incq	%rdi
.LPRF_msg$11:
	cmpq	%rsi, %rdx
	jb  	.LPRF_msg$12
	movq	$0, %rcx
	movq	248(%rsp), %rdx
	movq	256(%rsp), %rsi
	lfence
	movq	$0, %rax
	jmp 	.LPRF_msg$7
.LPRF_msg$8:
	cmpq	$136, %rdi
	jb  	.LPRF_msg$9
	movq	%rdx, 256(%rsp)
	movq	%rcx, 248(%rsp)
	movq	%rsi, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$10:
	leaq	200(%rsp), %rsp
	movq	256(%rsp), %rdx
	movq	248(%rsp), %rcx
	movq	264(%rsp), %rsi
	lfence
	movq	$0, %rax
	movq	$0, %rdi
.LPRF_msg$9:
	movb	(%rdx,%rcx), %r9b
	incq	%rcx
	xorb	%r9b, 32(%rsp,%rdi)
	incq	%rdi
.LPRF_msg$7:
	cmpq	%rsi, %rcx
	jb  	.LPRF_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rdi
	jb  	.LPRF_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %rdi
.LPRF_msg$5:
	xorb	$31, 32(%rsp,%rdi)
	leaq	32(%rsp), %rax
	cmpq	$136, %rdi
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
	movq	%mm0, %rcx
	vmovdqu	32(%rsp), %xmm0
	vmovdqu	%xmm0, (%rcx)
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
	movq	$50, %rdi
	movq	$0, %rsi
	movq	232(%rsp), %r11
	movq	240(%rsp), %rdx
	lfence
	movq	$0, %rax
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %rdi
	jb  	.LH_msg$13
	movq	%r11, 240(%rsp)
	movq	%rsi, 232(%rsp)
	movq	%rdx, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$14:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %r11
	movq	232(%rsp), %rsi
	movq	264(%rsp), %rdx
	lfence
	movq	$0, %rcx
	movq	$0, %rdi
.LH_msg$13:
	movb	(%r11,%rsi), %r9b
	incq	%rsi
	xorb	%r9b, 32(%rsp,%rdi)
	incq	%rdi
.LH_msg$11:
	cmpq	%rdx, %rsi
	jb  	.LH_msg$12
	movq	$0, %rcx
	movq	248(%rsp), %rdx
	movq	256(%rsp), %rsi
	lfence
	movq	$0, %rax
	jmp 	.LH_msg$7
.LH_msg$8:
	cmpq	$136, %rdi
	jb  	.LH_msg$9
	movq	%rdx, 256(%rsp)
	movq	%rcx, 248(%rsp)
	movq	%rsi, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$10:
	leaq	200(%rsp), %rsp
	movq	256(%rsp), %rdx
	movq	248(%rsp), %rcx
	movq	264(%rsp), %rsi
	lfence
	movq	$0, %rax
	movq	$0, %rdi
.LH_msg$9:
	movb	(%rdx,%rcx), %r9b
	incq	%rcx
	xorb	%r9b, 32(%rsp,%rdi)
	incq	%rdi
.LH_msg$7:
	cmpq	%rsi, %rcx
	jb  	.LH_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rdi
	jb  	.LH_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %rdi
.LH_msg$5:
	xorb	$31, 32(%rsp,%rdi)
	leaq	32(%rsp), %rax
	cmpq	$136, %rdi
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
.L_keccakf1600_avx2$1:
	call	.L__keccakf1600_avx2$1
.L_keccakf1600_avx2$2:
	ret
.L__keccakf1600_avx2$1:
	leaq	glob_data + 384(%rip), %rdx
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
	vpsllvq	glob_data + 192(%rip), %ymm6, %ymm7
	vpsrlvq	glob_data + 0(%rip), %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vpxor	%ymm10, %ymm0, %ymm0
	vpsllvq	glob_data + 256(%rip), %ymm0, %ymm7
	vpsrlvq	glob_data + 64(%rip), %ymm0, %ymm0
	vpor	%ymm7, %ymm0, %ymm0
	vpxor	%ymm10, %ymm2, %ymm2
	vpsllvq	glob_data + 288(%rip), %ymm2, %ymm7
	vpsrlvq	glob_data + 96(%rip), %ymm2, %ymm2
	vpor	%ymm7, %ymm2, %ymm9
	vpxor	%ymm10, %ymm1, %ymm1
	vpsllvq	glob_data + 320(%rip), %ymm1, %ymm2
	vpsrlvq	glob_data + 128(%rip), %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vpermq	$141, %ymm6, %ymm2
	vpermq	$141, %ymm0, %ymm7
	vpsllvq	glob_data + 352(%rip), %ymm3, %ymm0
	vpsrlvq	glob_data + 160(%rip), %ymm3, %ymm8
	vpor	%ymm0, %ymm8, %ymm8
	vpxor	%ymm10, %ymm4, %ymm11
	vpermq	$27, %ymm9, %ymm4
	vpermq	$114, %ymm1, %ymm9
	vpsllvq	glob_data + 224(%rip), %ymm11, %ymm0
	vpsrlvq	glob_data + 32(%rip), %ymm11, %ymm10
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
	vpbroadcastq	(%rdx,%r8,8), %ymm7
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
	leaq	glob_data + 384(%rip), %rbp
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
	leaq	glob_data + 384(%rip), %r14
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
