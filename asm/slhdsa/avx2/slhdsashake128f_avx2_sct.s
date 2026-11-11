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
	movq	(%rsi), %rax
	movq	8(%rsi), %rsi
	movq	%rcx, %r9
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
	movq	%rdi, %rax
	movq	(%rdx), %rdi
	movq	8(%rdx), %rdx
	movq	%rcx, %r10
	cmpq	$255, %rdx
	jbe 	.Lslh_dsa_shake128f_sign$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake128f_sign$2
.Lslh_dsa_shake128f_sign$1:
	movq	%rdi, %rcx
	movq	%r10, %rdi
	leaq	-184(%rsp), %rsp
	call	.Lslh_sign_internal_$1
.Lslh_dsa_shake128f_sign$3:
	leaq	184(%rsp), %rsp
	movq	%rcx, %rax
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
	movq	%rdi, %r10
	leaq	16(%rdi), %r9
	movq	%r8, %r11
	movq	%r10, 48(%rsp)
	movq	%r9, 56(%rsp)
	movq	%r8, 64(%rsp)
	leaq	120(%rsp), %rdi
	movq	%r11, %r8
	movq	%rax, %r11
	movq	%rcx, %rbx
	leaq	-264(%rsp), %rsp
	call	.LH_msg$1
.Lslh_verify_internal_$4:
	leaq	264(%rsp), %rsp
	movq	48(%rsp), %r10
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	leaq	120(%rsp), %rdx
	leaq	145(%rsp), %rsi
	leaq	153(%rsp), %rdi
	movl	$0, 108(%rsp)
	movl	$0, 112(%rsp)
	movl	$0, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	(%rsi), %r8d
	orl 	%r8d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	1(%rsi), %r8d
	orl 	%r8d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	2(%rsi), %r8d
	orl 	%r8d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	3(%rsi), %r8d
	orl 	%r8d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	4(%rsi), %r8d
	orl 	%r8d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	5(%rsi), %r8d
	orl 	%r8d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	6(%rsi), %r8d
	orl 	%r8d, 116(%rsp)
	shll	$8, 108(%rsp)
	movl	112(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 108(%rsp)
	shll	$8, 112(%rsp)
	movl	116(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 112(%rsp)
	shll	$8, 116(%rsp)
	movzbl	7(%rsi), %r8d
	orl 	%r8d, 116(%rsp)
	movl	$0, 108(%rsp)
	andl	$2147483647, 112(%rsp)
	movl	$0, %esi
	shll	$8, %esi
	movzbl	(%rdi), %r8d
	orl 	%r8d, %esi
	andl	$7, %esi
	leaq	72(%rsp), %rdi
	movl	108(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	112(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	116(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	leaq	72(%rsp), %rdi
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$3, 16(%rdi)
	leaq	72(%rsp), %rdi
	movl	%esi, 20(%rdi)
	leaq	16(%rcx), %r9
	movq	%r10, 64(%rsp)
	movq	%rax, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movl	%esi, 104(%rsp)
	leaq	32(%rsp), %rax
	leaq	72(%rsp), %r8
	leaq	-888(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	888(%rsp), %rsp
	movq	64(%rsp), %r10
	movq	56(%rsp), %r9
	movq	48(%rsp), %rax
	movl	104(%rsp), %edx
	leaq	32(%rsp), %rcx
	leaq	3712(%rax), %rsi
	leaq	108(%rsp), %rdi
	movq	%rcx, %rax
	movq	%rsi, %rcx
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
	movq	%rcx, 48(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rdi, 64(%rsp)
	movq	%r8, 72(%rsp)
	leaq	16(%rsi), %r10
	movq	%rax, %r11
	movq	%rax, 80(%rsp)
	movq	%rsi, 88(%rsp)
	leaq	-264(%rsp), %rsp
	call	.LPRF_msg$1
.Lslh_sign_internal_$6:
	leaq	264(%rsp), %rsp
	movq	%rcx, %r8
	movq	80(%rsp), %rax
	movq	88(%rsp), %rcx
	movq	48(%rsp), %r11
	movq	56(%rsp), %rbx
	movq	64(%rsp), %rdx
	movq	72(%rsp), %rsi
	leaq	32(%rcx), %r10
	leaq	48(%rcx), %r9
	movq	%r10, 72(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rcx, 56(%rsp)
	leaq	144(%rsp), %rdi
	leaq	-264(%rsp), %rsp
	call	.LH_msg$1
.Lslh_sign_internal_$5:
	leaq	264(%rsp), %rsp
	movq	72(%rsp), %r10
	movq	64(%rsp), %rax
	movq	56(%rsp), %rcx
	leaq	144(%rsp), %rdx
	leaq	169(%rsp), %rsi
	leaq	177(%rsp), %rdi
	movl	$0, 132(%rsp)
	movl	$0, 136(%rsp)
	movl	$0, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	(%rsi), %r8d
	orl 	%r8d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	1(%rsi), %r8d
	orl 	%r8d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	2(%rsi), %r8d
	orl 	%r8d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	3(%rsi), %r8d
	orl 	%r8d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	4(%rsi), %r8d
	orl 	%r8d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	5(%rsi), %r8d
	orl 	%r8d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	6(%rsi), %r8d
	orl 	%r8d, 140(%rsp)
	shll	$8, 132(%rsp)
	movl	136(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 136(%rsp)
	movl	140(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 136(%rsp)
	shll	$8, 140(%rsp)
	movzbl	7(%rsi), %r8d
	orl 	%r8d, 140(%rsp)
	movl	$0, 132(%rsp)
	andl	$2147483647, 136(%rsp)
	movl	$0, %esi
	shll	$8, %esi
	movzbl	(%rdi), %r8d
	orl 	%r8d, %esi
	andl	$7, %esi
	leaq	96(%rsp), %rdi
	movl	132(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	136(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	140(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	leaq	96(%rsp), %rdi
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$3, 16(%rdi)
	leaq	96(%rsp), %rdi
	movl	%esi, 20(%rdi)
	leaq	16(%rax), %r9
	movq	%rcx, 56(%rsp)
	movq	%r10, 64(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rdx, 48(%rsp)
	movl	%esi, 128(%rsp)
	leaq	96(%rsp), %rdi
	movq	%rcx, %r11
	leaq	-216(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	216(%rsp), %rsp
	movq	56(%rsp), %rcx
	movq	64(%rsp), %r10
	movq	72(%rsp), %rax
	movq	48(%rsp), %rdx
	movl	128(%rsp), %esi
	movq	%rcx, 48(%rsp)
	movq	%r10, 72(%rsp)
	movq	%rax, 64(%rsp)
	movl	%esi, 128(%rsp)
	leaq	32(%rsp), %rax
	leaq	96(%rsp), %r8
	leaq	-888(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	888(%rsp), %rsp
	movq	48(%rsp), %r11
	movq	72(%rsp), %r10
	movq	64(%rsp), %rax
	movl	128(%rsp), %edx
	leaq	3712(%rax), %rcx
	movq	%rax, 64(%rsp)
	leaq	32(%rsp), %rax
	leaq	132(%rsp), %rdi
	leaq	-120(%rsp), %rsp
	call	.Lht_sign$1
.Lslh_sign_internal_$2:
	leaq	120(%rsp), %rsp
	movq	64(%rsp), %rax
	movq	$0, %rcx
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
	leaq	32(%rax), %r10
	leaq	24(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$21, %ecx
	leaq	24(%rsp), %r8
	movl	%ecx, (%r8)
	movl	$0, %esi
	movl	$3, %edx
	leaq	48(%rax), %rcx
	movq	%rax, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rdi
	movl	%edx, %r8d
	leaq	-376(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	376(%rsp), %rsp
	movq	%rcx, %rax
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdi
	leaq	16(%rdi), %r11
	movq	(%rax), %rdx
	movq	%rdx, (%r11)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%r11)
	ret
.Lfors_pkfromsig$1:
	movq	%rax, 656(%rsp)
	leaq	752(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lfors_pkfromsig$75
.Lfors_pkfromsig$76:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, (%rax)
	jmp 	.Lfors_pkfromsig$73
.Lfors_pkfromsig$74:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 4(%rax)
	jmp 	.Lfors_pkfromsig$71
.Lfors_pkfromsig$72:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 8(%rax)
	jmp 	.Lfors_pkfromsig$69
.Lfors_pkfromsig$70:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 12(%rax)
	jmp 	.Lfors_pkfromsig$67
.Lfors_pkfromsig$68:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 16(%rax)
	jmp 	.Lfors_pkfromsig$65
.Lfors_pkfromsig$66:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 20(%rax)
	jmp 	.Lfors_pkfromsig$63
.Lfors_pkfromsig$64:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 24(%rax)
	jmp 	.Lfors_pkfromsig$61
.Lfors_pkfromsig$62:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 28(%rax)
	jmp 	.Lfors_pkfromsig$59
.Lfors_pkfromsig$60:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 32(%rax)
	jmp 	.Lfors_pkfromsig$57
.Lfors_pkfromsig$58:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 36(%rax)
	jmp 	.Lfors_pkfromsig$55
.Lfors_pkfromsig$56:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 40(%rax)
	jmp 	.Lfors_pkfromsig$53
.Lfors_pkfromsig$54:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 44(%rax)
	jmp 	.Lfors_pkfromsig$51
.Lfors_pkfromsig$52:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 48(%rax)
	jmp 	.Lfors_pkfromsig$49
.Lfors_pkfromsig$50:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 52(%rax)
	jmp 	.Lfors_pkfromsig$47
.Lfors_pkfromsig$48:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 56(%rax)
	jmp 	.Lfors_pkfromsig$45
.Lfors_pkfromsig$46:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 60(%rax)
	jmp 	.Lfors_pkfromsig$43
.Lfors_pkfromsig$44:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 64(%rax)
	jmp 	.Lfors_pkfromsig$41
.Lfors_pkfromsig$42:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 68(%rax)
	jmp 	.Lfors_pkfromsig$39
.Lfors_pkfromsig$40:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 72(%rax)
	jmp 	.Lfors_pkfromsig$37
.Lfors_pkfromsig$38:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 76(%rax)
	jmp 	.Lfors_pkfromsig$35
.Lfors_pkfromsig$36:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 80(%rax)
	jmp 	.Lfors_pkfromsig$33
.Lfors_pkfromsig$34:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 84(%rax)
	jmp 	.Lfors_pkfromsig$31
.Lfors_pkfromsig$32:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 88(%rax)
	jmp 	.Lfors_pkfromsig$29
.Lfors_pkfromsig$30:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 92(%rax)
	jmp 	.Lfors_pkfromsig$27
.Lfors_pkfromsig$28:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 96(%rax)
	jmp 	.Lfors_pkfromsig$25
.Lfors_pkfromsig$26:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 100(%rax)
	jmp 	.Lfors_pkfromsig$23
.Lfors_pkfromsig$24:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 104(%rax)
	jmp 	.Lfors_pkfromsig$21
.Lfors_pkfromsig$22:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 108(%rax)
	jmp 	.Lfors_pkfromsig$19
.Lfors_pkfromsig$20:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 112(%rax)
	jmp 	.Lfors_pkfromsig$17
.Lfors_pkfromsig$18:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 116(%rax)
	jmp 	.Lfors_pkfromsig$15
.Lfors_pkfromsig$16:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 120(%rax)
	jmp 	.Lfors_pkfromsig$13
.Lfors_pkfromsig$14:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 124(%rax)
	jmp 	.Lfors_pkfromsig$11
.Lfors_pkfromsig$12:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
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
	movl	%r11d, 128(%rax)
	movq	$0, %rax
	movq	$0, %rcx
	movq	$0, %rsi
	jmp 	.Lfors_pkfromsig$3
.Lfors_pkfromsig$4:
	movq	%rcx, 664(%rsp)
	leaq	(%r9,%rax), %rcx
	leaq	64(%rsp), %rdi
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	movl	$0, %ecx
	movl	%ecx, 24(%r8)
	movl	%esi, %edx
	shll	$6, %edx
	addl	752(%rsp,%rsi,4), %edx
	movl	%edx, 28(%r8)
	movq	%r10, 672(%rsp)
	movq	%r8, 680(%rsp)
	movq	%r9, 688(%rsp)
	movq	%rsi, 696(%rsp)
	movq	%rax, 704(%rsp)
	leaq	64(%rsp), %rcx
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	56(%rsp), %rsp
	movq	672(%rsp), %r10
	movq	680(%rsp), %r8
	movq	688(%rsp), %r9
	movq	696(%rsp), %rsi
	movq	704(%rsp), %rax
	addq	$16, %rax
	movl	752(%rsp,%rsi,4), %edi
	movl	$0, %edx
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movl	%edx, %ecx
	incl	%ecx
	movl	%ecx, 24(%r8)
	movl	%edi, %ecx
	andl	$1, %ecx
	movl	%edx, 744(%rsp)
	movl	%edi, 748(%rsp)
	cmpl	$0, %ecx
	je  	.Lfors_pkfromsig$8
	movl	28(%r8), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
	leaq	640(%rsp), %rcx
	leaq	(%r9,%rax), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	624(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	jmp 	.Lfors_pkfromsig$9
.Lfors_pkfromsig$8:
	movl	28(%r8), %edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
	leaq	640(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	624(%rsp), %rcx
	leaq	(%r9,%rax), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
.Lfors_pkfromsig$9:
	movq	%r10, 704(%rsp)
	movq	%r8, 696(%rsp)
	movq	%r9, 688(%rsp)
	movq	%rsi, 680(%rsp)
	movq	%rax, 672(%rsp)
	leaq	32(%rsp), %rcx
	leaq	640(%rsp), %rdx
	leaq	624(%rsp), %rsi
	movq	%r8, %rdi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	56(%rsp), %rsp
	movq	704(%rsp), %r10
	movq	696(%rsp), %r8
	movq	688(%rsp), %r9
	movq	680(%rsp), %rsi
	movq	672(%rsp), %rax
	leaq	64(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	movl	744(%rsp), %edx
	movl	748(%rsp), %edi
	shrl	$1, %edi
	addq	$16, %rax
	incl	%edx
.Lfors_pkfromsig$5:
	cmpl	$6, %edx
	jb  	.Lfors_pkfromsig$6
	movq	664(%rsp), %rcx
	leaq	96(%rsp,%rcx), %rdi
	leaq	64(%rsp), %rdx
	movq	(%rdx), %r11
	movq	%r11, (%rdi)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rdi)
	addq	$16, %rcx
	incq	%rsi
.Lfors_pkfromsig$3:
	cmpq	$33, %rsi
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
	leaq	712(%rsp), %rdi
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$4, 16(%rdi)
	movl	20(%r8), %esi
	leaq	712(%rsp), %rdi
	movl	%esi, 20(%rdi)
	movq	656(%rsp), %rcx
	leaq	712(%rsp), %rdi
	leaq	96(%rsp), %rax
	leaq	-56(%rsp), %rsp
	call	.LT_k$1
.Lfors_pkfromsig$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lfors_sign$1:
	leaq	64(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %r8d
	jmp 	.Lfors_sign$72
.Lfors_sign$73:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$72:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$73
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, (%rax)
	jmp 	.Lfors_sign$70
.Lfors_sign$71:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$70:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$71
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 4(%rax)
	jmp 	.Lfors_sign$68
.Lfors_sign$69:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$68:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$69
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 8(%rax)
	jmp 	.Lfors_sign$66
.Lfors_sign$67:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$66:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$67
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 12(%rax)
	jmp 	.Lfors_sign$64
.Lfors_sign$65:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$64:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$65
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 16(%rax)
	jmp 	.Lfors_sign$62
.Lfors_sign$63:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$62:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$63
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 20(%rax)
	jmp 	.Lfors_sign$60
.Lfors_sign$61:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$60:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$61
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 24(%rax)
	jmp 	.Lfors_sign$58
.Lfors_sign$59:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$58:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$59
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 28(%rax)
	jmp 	.Lfors_sign$56
.Lfors_sign$57:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$56:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$57
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 32(%rax)
	jmp 	.Lfors_sign$54
.Lfors_sign$55:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$54:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$55
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 36(%rax)
	jmp 	.Lfors_sign$52
.Lfors_sign$53:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$52:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$53
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 40(%rax)
	jmp 	.Lfors_sign$50
.Lfors_sign$51:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$50:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$51
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 44(%rax)
	jmp 	.Lfors_sign$48
.Lfors_sign$49:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$48:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$49
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 48(%rax)
	jmp 	.Lfors_sign$46
.Lfors_sign$47:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$46:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$47
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 52(%rax)
	jmp 	.Lfors_sign$44
.Lfors_sign$45:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$44:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$45
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 56(%rax)
	jmp 	.Lfors_sign$42
.Lfors_sign$43:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$42:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$43
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 60(%rax)
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$41
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 64(%rax)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$39
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 68(%rax)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$37
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 72(%rax)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$35
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 76(%rax)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$33
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 80(%rax)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$31
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 84(%rax)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$29
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 88(%rax)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$27
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 92(%rax)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$25
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 96(%rax)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$23
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 100(%rax)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$21
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 104(%rax)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$19
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 108(%rax)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$17
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 112(%rax)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$15
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 116(%rax)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$13
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 120(%rax)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$11
	movl	%r8d, %ebx
	addl	$-6, %ecx
	shrq	%cl, %rbx
	andq	$63, %rbx
	movl	%ebx, 124(%rax)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$6, %ecx
	jb  	.Lfors_sign$9
	movl	%r8d, %edx
	addl	$-6, %ecx
	shrq	%cl, %rdx
	andq	$63, %rdx
	movl	%edx, 128(%rax)
	movq	$0, %r8
	movq	$0, %rsi
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%esi, %edx
	shll	$6, %edx
	addl	64(%rsp,%rsi,4), %edx
	leaq	(%r9,%r8), %rax
	movq	%r11, 8(%rsp)
	movq	%r10, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%r9, 32(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%r8, 48(%rsp)
	movl	%edx, %r8d
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %r11
	movq	16(%rsp), %r10
	movq	24(%rsp), %rdi
	movq	32(%rsp), %r9
	movq	40(%rsp), %rsi
	movq	48(%rsp), %r8
	addq	$16, %r8
	movl	64(%rsp,%rsi,4), %eax
	xorl	$1, %eax
	movl	$0, %edx
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%r11, 48(%rsp)
	movq	%r10, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%edx, 56(%rsp)
	movq	%r8, 24(%rsp)
	movl	%eax, 60(%rsp)
	movl	$6, %ecx
	subl	%edx, %ecx
	shlq	%cl, %rsi
	addl	%eax, %esi
	leaq	(%r9,%r8), %rcx
	movq	%r9, 16(%rsp)
	leaq	-2168(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	2168(%rsp), %rsp
	movq	16(%rsp), %r9
	movq	48(%rsp), %r11
	movq	40(%rsp), %r10
	movq	32(%rsp), %rsi
	movl	56(%rsp), %edx
	movq	24(%rsp), %r8
	movl	60(%rsp), %eax
	shrl	$1, %eax
	xorl	$1, %eax
	addq	$16, %r8
	incl	%edx
.Lfors_sign$4:
	cmpl	$6, %edx
	jb  	.Lfors_sign$5
	incq	%rsi
.Lfors_sign$2:
	cmpq	$33, %rsi
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rcx, 2096(%rsp)
	movl	$0, %r9d
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%edx, 2136(%rsp)
	movl	%edx, %ecx
	subl	%r9d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r8d
	imull	%esi, %r8d
	addl	%r8d, %edx
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%r11, 2104(%rsp)
	movl	%edx, 2140(%rsp)
	cmpl	$0, %r9d
	je  	.Lfors_node$6
	movl	%r8d, %eax
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
	movl	%r9d, 24(%rdi)
	movl	%r8d, 28(%rdi)
	movl	$7, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %r11
	subl	%r9d, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %r11
	shrq	$1, %rbp
	movl	%r8d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %r11
	imulq	$16, %r11, %rax
	movq	%r10, 2112(%rsp)
	movq	%rdi, 2120(%rsp)
	movl	%esi, 2144(%rsp)
	movl	%r9d, 2148(%rsp)
	movl	%r8d, 2152(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	2080(%rsp), %rdx
	leaq	2064(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_node$10:
	leaq	56(%rsp), %rsp
	movq	2112(%rsp), %r10
	movq	2120(%rsp), %rdi
	movl	2144(%rsp), %esi
	movl	2148(%rsp), %r9d
	movl	2152(%rsp), %r8d
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%r9d, 24(%rdi)
	movl	%r8d, 28(%rdi)
	movl	$7, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbx
	subl	%r9d, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %rbx
	shrq	$1, %rbp
	movl	%r8d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %rbx
	imulq	$16, %rbx, %rax
	movq	%r10, 2112(%rsp)
	movq	%rdi, 2120(%rsp)
	movl	%esi, 2144(%rsp)
	movl	%r9d, 2148(%rsp)
	movl	%r8d, 2152(%rsp)
	movq	%rax, 2128(%rsp)
	leaq	32(%rsp,%rax), %rax
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$9:
	leaq	40(%rsp), %rsp
	movq	2112(%rsp), %r10
	movq	2120(%rsp), %rdi
	movl	2144(%rsp), %esi
	movl	2148(%rsp), %ecx
	movl	2152(%rsp), %r8d
	movq	2128(%rsp), %rax
	movq	%r10, 2128(%rsp)
	movq	%rdi, 2120(%rsp)
	movl	%esi, 2152(%rsp)
	movl	%ecx, 2148(%rsp)
	movl	%r8d, 2144(%rsp)
	movq	%rax, 2112(%rsp)
	leaq	32(%rsp,%rax), %rcx
	movq	%rdi, %r8
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_node$8:
	leaq	56(%rsp), %rsp
	movq	2128(%rsp), %r10
	movq	2120(%rsp), %rdi
	movl	2152(%rsp), %esi
	movl	2148(%rsp), %r9d
	movl	2144(%rsp), %r8d
	movq	2112(%rsp), %rax
.Lfors_node$7:
	movq	2104(%rsp), %r11
	movl	2140(%rsp), %edx
	incl	%r8d
.Lfors_node$4:
	cmpl	%edx, %r8d
	jb  	.Lfors_node$5
	movl	2136(%rsp), %edx
	incl	%r9d
.Lfors_node$2:
	cmpl	%edx, %r9d
	jbe 	.Lfors_node$3
	movq	2096(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	ret
.Lfors_skgen$1:
	leaq	8(%rsp), %rcx
	movq	(%rdi), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rdi), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rdi), %rdx
	movq	%rdx, 24(%rcx)
	leaq	8(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$6, 16(%rcx)
	movl	20(%rdi), %esi
	leaq	8(%rsp), %rcx
	movl	%esi, 20(%rcx)
	leaq	8(%rsp), %rcx
	movl	%r8d, 28(%rcx)
	leaq	8(%rsp), %rdi
	movq	%rax, %rcx
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lht_verify$1:
	movq	%r9, 8(%rsp)
	movl	(%rdi), %r8d
	movl	%r8d, 108(%rsp)
	movl	4(%rdi), %r8d
	movl	%r8d, 112(%rsp)
	movl	8(%rdi), %edi
	movl	%edi, 116(%rsp)
	leaq	72(%rsp), %rdi
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	leaq	72(%rsp), %rdi
	movl	108(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	112(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	116(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	movq	%rcx, %rsi
	movq	%r10, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	40(%rsp), %rcx
	leaq	72(%rsp), %rdi
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	152(%rsp), %rsp
	movq	16(%rsp), %r10
	movq	24(%rsp), %rcx
	movq	$608, %rax
	movl	$1, %r9d
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%r9d, 104(%rsp)
	movq	%rax, 24(%rsp)
	leaq	108(%rsp), %rsi
	movl	8(%rsi), %edx
	andl	$7, %edx
	shrl	$3, 8(%rsi)
	movl	4(%rsi), %r8d
	shll	$29, %r8d
	orl 	%r8d, 8(%rsi)
	shrl	$3, 4(%rsi)
	movl	(%rsi), %r8d
	shll	$29, %r8d
	orl 	%r8d, 4(%rsi)
	shrl	$3, (%rsi)
	leaq	72(%rsp), %rdi
	movl	%r9d, (%rdi)
	leaq	72(%rsp), %rdi
	movl	108(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	112(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	116(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	leaq	56(%rsp), %rdi
	leaq	40(%rsp), %rsi
	movq	(%rsi), %r8
	movq	%r8, (%rdi)
	movq	8(%rsi), %r8
	movq	%r8, 8(%rdi)
	leaq	(%rcx,%rax), %rsi
	movq	%r10, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	40(%rsp), %rcx
	leaq	56(%rsp), %rax
	leaq	72(%rsp), %rdi
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	152(%rsp), %rsp
	movq	16(%rsp), %r10
	movq	32(%rsp), %rcx
	movl	104(%rsp), %r9d
	movq	24(%rsp), %rax
	addq	$608, %rax
	incl	%r9d
.Lht_verify$2:
	cmpl	$22, %r9d
	jb  	.Lht_verify$3
	movq	8(%rsp), %rax
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
	movl	(%rdi), %r8d
	movl	%r8d, 112(%rsp)
	movl	4(%rdi), %r8d
	movl	%r8d, 116(%rsp)
	movl	8(%rdi), %edi
	movl	%edi, 120(%rsp)
	leaq	72(%rsp), %rdi
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	leaq	72(%rsp), %rdi
	movl	112(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	116(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	120(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	movq	%rcx, %rsi
	movq	%rcx, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%r10, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%edx, 104(%rsp)
	leaq	72(%rsp), %rdi
	movl	%edx, %r8d
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %r11
	movq	24(%rsp), %r10
	movq	32(%rsp), %rax
	movl	104(%rsp), %edx
	movq	%r11, 32(%rsp)
	movq	%r10, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	40(%rsp), %rcx
	leaq	72(%rsp), %rdi
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	152(%rsp), %rsp
	movq	32(%rsp), %r11
	movq	24(%rsp), %r10
	movq	16(%rsp), %rcx
	movq	$608, %rsi
	movl	$1, %eax
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%r11, 16(%rsp)
	leaq	112(%rsp), %rdi
	movl	8(%rdi), %edx
	andl	$7, %edx
	shrl	$3, 8(%rdi)
	movl	4(%rdi), %r8d
	shll	$29, %r8d
	orl 	%r8d, 8(%rdi)
	shrl	$3, 4(%rdi)
	movl	(%rdi), %r8d
	shll	$29, %r8d
	orl 	%r8d, 4(%rdi)
	shrl	$3, (%rdi)
	leaq	72(%rsp), %rdi
	movl	%eax, (%rdi)
	leaq	72(%rsp), %rdi
	movl	112(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	116(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	120(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	leaq	56(%rsp), %rdi
	leaq	40(%rsp), %r8
	movq	(%r8), %r9
	movq	%r9, (%rdi)
	movq	8(%r8), %r8
	movq	%r8, 8(%rdi)
	leaq	(%rcx,%rsi), %rdi
	movq	%rcx, 24(%rsp)
	movq	%r10, 32(%rsp)
	movl	%eax, 104(%rsp)
	movq	%rsi, 8(%rsp)
	movl	%edx, 108(%rsp)
	leaq	56(%rsp), %rax
	leaq	72(%rsp), %rcx
	movq	%rdi, %rsi
	movl	%edx, %r8d
	movq	%rcx, %rdi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	%rsi, %rdi
	movq	24(%rsp), %rcx
	movq	32(%rsp), %r10
	movl	104(%rsp), %eax
	movq	8(%rsp), %rsi
	movl	108(%rsp), %edx
	cmpl	$21, %eax
	jnb 	.Lht_sign$4
	movq	%r10, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%eax, 108(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	40(%rsp), %rcx
	leaq	56(%rsp), %rax
	leaq	72(%rsp), %r8
	movq	%rdi, %rsi
	movq	%r8, %rdi
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	152(%rsp), %rsp
	movq	8(%rsp), %r10
	movq	32(%rsp), %rcx
	movl	108(%rsp), %eax
	movq	24(%rsp), %rsi
.Lht_sign$4:
	movq	16(%rsp), %r11
	addq	$608, %rsi
	incl	%eax
.Lht_sign$2:
	cmpl	$22, %eax
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 112(%rsp)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%edx, 20(%rdi)
	movq	%rsi, %rcx
	movq	%r10, 120(%rsp)
	movl	%edx, 152(%rsp)
	movq	%rsi, 128(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	movq	%rdi, %r11
	leaq	-792(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	792(%rsp), %rsp
	movq	%rcx, %rdi
	movq	120(%rsp), %r10
	movl	152(%rsp), %edx
	movq	128(%rsp), %rsi
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%edx, 28(%rdi)
	movq	$560, %rax
	movl	%edx, %r8d
	movl	$0, %edx
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%edx, %ecx
	incl	%ecx
	movl	%ecx, 24(%rdi)
	movl	%r8d, %ecx
	andl	$1, %ecx
	movl	%edx, 152(%rsp)
	movl	%r8d, 156(%rsp)
	cmpl	$0, %ecx
	je  	.Lxmss_pkfromsig$5
	movl	28(%rdi), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	96(%rsp), %rcx
	leaq	(%rsi,%rax), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	80(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	jmp 	.Lxmss_pkfromsig$6
.Lxmss_pkfromsig$5:
	movl	28(%rdi), %edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	80(%rsp), %rcx
	leaq	(%rsi,%rax), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
.Lxmss_pkfromsig$6:
	movq	%r10, 128(%rsp)
	movq	%rdi, 120(%rsp)
	movq	%rsi, 136(%rsp)
	movq	%rax, 144(%rsp)
	leaq	64(%rsp), %rcx
	leaq	96(%rsp), %rdx
	leaq	80(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	56(%rsp), %rsp
	movq	128(%rsp), %r10
	movq	120(%rsp), %rdi
	movq	136(%rsp), %rsi
	movq	144(%rsp), %rax
	leaq	32(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	movl	152(%rsp), %edx
	movl	156(%rsp), %r8d
	shrl	$1, %r8d
	addq	$16, %rax
	incl	%edx
.Lxmss_pkfromsig$2:
	cmpl	$3, %edx
	jb  	.Lxmss_pkfromsig$3
	movq	112(%rsp), %rcx
	leaq	32(%rsp), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	ret
.Lxmss_sign$1:
	movq	%rax, 8(%rsp)
	movq	$560, %rcx
	movl	%r8d, %edx
	xorl	$1, %edx
	movl	$0, %eax
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%r11, 16(%rsp)
	movq	%r10, 24(%rsp)
	movl	%r8d, 48(%rsp)
	movl	%eax, 52(%rsp)
	movl	%edx, 56(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	(%rsi,%rcx), %rcx
	movq	%rsi, 40(%rsp)
	movl	%edx, %esi
	movl	%eax, %r8d
	leaq	-376(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	376(%rsp), %rsp
	movq	40(%rsp), %rsi
	movq	16(%rsp), %r11
	movq	24(%rsp), %r10
	movl	48(%rsp), %r8d
	movl	52(%rsp), %eax
	movl	56(%rsp), %edx
	movq	32(%rsp), %rcx
	shrl	$1, %edx
	xorl	$1, %edx
	addq	$16, %rcx
	incl	%eax
.Lxmss_sign$3:
	cmpl	$3, %eax
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rax
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%r8d, 20(%rdi)
	movq	%rsi, %rbx
	movq	%rsi, 8(%rsp)
	leaq	-232(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	232(%rsp), %rsp
	movq	%rdi, %rcx
	movq	8(%rsp), %rsi
	ret
.Lxmss_node$1:
	movq	%rcx, 304(%rsp)
	movl	$0, %edx
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%r8d, 336(%rsp)
	movl	%r8d, %ecx
	subl	%edx, %ecx
	movq	$1, %r9
	shlq	%cl, %r9
	movl	%r9d, %r8d
	imull	%esi, %r8d
	addl	%r8d, %r9d
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%r11, 312(%rsp)
	movq	%r10, 320(%rsp)
	movl	%esi, 340(%rsp)
	movl	%edx, 344(%rsp)
	movl	%r8d, 348(%rsp)
	movl	%r9d, 352(%rsp)
	cmpl	$0, %edx
	je  	.Lxmss_node$6
	movl	%r8d, %eax
	imull	$2, %eax, %eax
	movl	%edx, %esi
	decl	%esi
	movl	$4, %ecx
	movq	$1, %r9
	shlq	%cl, %r9
	subl	%esi, %ecx
	movq	$1, %rsi
	shlq	%cl, %rsi
	subq	%rsi, %r9
	movl	%eax, %eax
	addq	%rax, %r9
	imulq	$16, %r9, %r9
	movq	%r9, %rax
	addq	$16, %rax
	leaq	288(%rsp), %rcx
	leaq	32(%rsp,%r9), %rsi
	movq	(%rsi), %r9
	movq	%r9, (%rcx)
	movq	8(%rsi), %r9
	movq	%r9, 8(%rcx)
	leaq	272(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %r9
	movq	%r9, (%rcx)
	movq	8(%rax), %r9
	movq	%r9, 8(%rcx)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%edx, 24(%rdi)
	movl	%r8d, 28(%rdi)
	movl	$4, %ecx
	movq	$1, %rsi
	shlq	%cl, %rsi
	subl	%edx, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %rsi
	movl	%r8d, %eax
	addq	%rax, %rsi
	imulq	$16, %rsi, %rax
	movq	%rdi, 328(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	288(%rsp), %rdx
	leaq	272(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_node$9:
	leaq	56(%rsp), %rsp
	movq	328(%rsp), %rdi
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%r8d, 20(%rdi)
	movl	%r8d, %eax
	imulq	$16, %rax, %rax
	leaq	32(%rsp,%rax), %rcx
	leaq	-664(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	664(%rsp), %rsp
.Lxmss_node$7:
	movq	312(%rsp), %r11
	movq	320(%rsp), %r10
	movl	340(%rsp), %esi
	movl	344(%rsp), %edx
	movl	348(%rsp), %r8d
	movl	352(%rsp), %r9d
	incl	%r8d
.Lxmss_node$4:
	cmpl	%r9d, %r8d
	jb  	.Lxmss_node$5
	movl	336(%rsp), %r8d
	incl	%edx
.Lxmss_node$2:
	cmpl	%r8d, %edx
	jbe 	.Lxmss_node$3
	movq	304(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	ret
.Lwots_pkfromsig$1:
	movq	%rsi, 592(%rsp)
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
	leaq	128(%rsi), %rax
	leaq	792(%rsp), %rsi
	movq	$0, %r8
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lwots_pkfromsig$10
.Lwots_pkfromsig$11:
	shll	$8, %edi
	movzbl	(%rsi,%r8), %r9d
	orl 	%r9d, %edi
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$10:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$11
	movl	%edi, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, (%rax)
	jmp 	.Lwots_pkfromsig$8
.Lwots_pkfromsig$9:
	shll	$8, %edi
	movzbl	(%rsi,%r8), %r9d
	orl 	%r9d, %edi
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$8:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$9
	movl	%edi, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, 4(%rax)
	jmp 	.Lwots_pkfromsig$6
.Lwots_pkfromsig$7:
	shll	$8, %edi
	movzbl	(%rsi,%r8), %r9d
	orl 	%r9d, %edi
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$6:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$7
	movl	%edi, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, 8(%rax)
	movb	(%rdx), %dil
	movb	%dil, 32(%rsp)
	movb	1(%rdx), %dil
	movb	%dil, 33(%rsp)
	movb	2(%rdx), %dil
	movb	%dil, 34(%rsp)
	movb	3(%rdx), %dil
	movb	%dil, 35(%rsp)
	movb	4(%rdx), %dil
	movb	%dil, 36(%rsp)
	movb	5(%rdx), %dil
	movb	%dil, 37(%rsp)
	movb	6(%rdx), %dil
	movb	%dil, 38(%rsp)
	movb	7(%rdx), %dil
	movb	%dil, 39(%rsp)
	movb	8(%rdx), %dil
	movb	%dil, 40(%rsp)
	movb	9(%rdx), %dil
	movb	%dil, 41(%rsp)
	movb	10(%rdx), %dil
	movb	%dil, 42(%rsp)
	movb	11(%rdx), %dil
	movb	%dil, 43(%rsp)
	movb	12(%rdx), %dil
	movb	%dil, 44(%rsp)
	movb	13(%rdx), %dil
	movb	%dil, 45(%rsp)
	movb	14(%rdx), %dil
	movb	%dil, 46(%rsp)
	movb	15(%rdx), %dil
	movb	%dil, 47(%rsp)
	movb	16(%rdx), %dil
	movb	%dil, 48(%rsp)
	movb	17(%rdx), %dil
	movb	%dil, 49(%rsp)
	movb	18(%rdx), %dil
	movb	%dil, 50(%rsp)
	movb	19(%rdx), %dil
	movb	%dil, 51(%rsp)
	movb	20(%rdx), %dil
	movb	%dil, 52(%rsp)
	movb	21(%rdx), %dil
	movb	%dil, 53(%rsp)
	movb	22(%rdx), %dil
	movb	%dil, 54(%rsp)
	movb	23(%rdx), %dil
	movb	%dil, 55(%rsp)
	movb	24(%rdx), %dil
	movb	%dil, 56(%rsp)
	movb	25(%rdx), %dil
	movb	%dil, 57(%rsp)
	movb	26(%rdx), %dil
	movb	%dil, 58(%rsp)
	movb	27(%rdx), %dil
	movb	%dil, 59(%rsp)
	movb	28(%rdx), %dil
	movb	%dil, 60(%rsp)
	movb	29(%rdx), %dil
	movb	%dil, 61(%rsp)
	movb	30(%rdx), %dil
	movb	%dil, 62(%rsp)
	movb	31(%rdx), %dil
	movb	%dil, 63(%rsp)
	movb	32(%rdx), %dil
	movb	%dil, 64(%rsp)
	movb	33(%rdx), %dil
	movb	%dil, 65(%rsp)
	movb	34(%rdx), %dil
	movb	%dil, 66(%rsp)
	movb	35(%rdx), %dil
	movb	%dil, 67(%rsp)
	movb	36(%rdx), %dil
	movb	%dil, 68(%rsp)
	movb	37(%rdx), %dil
	movb	%dil, 69(%rsp)
	movb	38(%rdx), %dil
	movb	%dil, 70(%rsp)
	movb	39(%rdx), %dil
	movb	%dil, 71(%rsp)
	movb	40(%rdx), %dil
	movb	%dil, 72(%rsp)
	movb	41(%rdx), %dil
	movb	%dil, 73(%rsp)
	movb	42(%rdx), %dil
	movb	%dil, 74(%rsp)
	movb	43(%rdx), %dil
	movb	%dil, 75(%rsp)
	movb	44(%rdx), %dil
	movb	%dil, 76(%rsp)
	movb	45(%rdx), %dil
	movb	%dil, 77(%rsp)
	movb	46(%rdx), %dil
	movb	%dil, 78(%rsp)
	movb	47(%rdx), %dil
	movb	%dil, 79(%rsp)
	movb	48(%rdx), %dil
	movb	%dil, 80(%rsp)
	movb	49(%rdx), %dil
	movb	%dil, 81(%rsp)
	movb	50(%rdx), %dil
	movb	%dil, 82(%rsp)
	movb	51(%rdx), %dil
	movb	%dil, 83(%rsp)
	movb	52(%rdx), %dil
	movb	%dil, 84(%rsp)
	movb	53(%rdx), %dil
	movb	%dil, 85(%rsp)
	movb	54(%rdx), %dil
	movb	%dil, 86(%rsp)
	movb	55(%rdx), %dil
	movb	%dil, 87(%rsp)
	movb	56(%rdx), %dil
	movb	%dil, 88(%rsp)
	movb	57(%rdx), %dil
	movb	%dil, 89(%rsp)
	movb	58(%rdx), %dil
	movb	%dil, 90(%rsp)
	movb	59(%rdx), %dil
	movb	%dil, 91(%rsp)
	movb	60(%rdx), %dil
	movb	%dil, 92(%rsp)
	movb	61(%rdx), %dil
	movb	%dil, 93(%rsp)
	movb	62(%rdx), %dil
	movb	%dil, 94(%rsp)
	movb	63(%rdx), %dil
	movb	%dil, 95(%rsp)
	movb	64(%rdx), %dil
	movb	%dil, 96(%rsp)
	movb	65(%rdx), %dil
	movb	%dil, 97(%rsp)
	movb	66(%rdx), %dil
	movb	%dil, 98(%rsp)
	movb	67(%rdx), %dil
	movb	%dil, 99(%rsp)
	movb	68(%rdx), %dil
	movb	%dil, 100(%rsp)
	movb	69(%rdx), %dil
	movb	%dil, 101(%rsp)
	movb	70(%rdx), %dil
	movb	%dil, 102(%rsp)
	movb	71(%rdx), %dil
	movb	%dil, 103(%rsp)
	movb	72(%rdx), %dil
	movb	%dil, 104(%rsp)
	movb	73(%rdx), %dil
	movb	%dil, 105(%rsp)
	movb	74(%rdx), %dil
	movb	%dil, 106(%rsp)
	movb	75(%rdx), %dil
	movb	%dil, 107(%rsp)
	movb	76(%rdx), %dil
	movb	%dil, 108(%rsp)
	movb	77(%rdx), %dil
	movb	%dil, 109(%rsp)
	movb	78(%rdx), %dil
	movb	%dil, 110(%rsp)
	movb	79(%rdx), %dil
	movb	%dil, 111(%rsp)
	movb	80(%rdx), %dil
	movb	%dil, 112(%rsp)
	movb	81(%rdx), %dil
	movb	%dil, 113(%rsp)
	movb	82(%rdx), %dil
	movb	%dil, 114(%rsp)
	movb	83(%rdx), %dil
	movb	%dil, 115(%rsp)
	movb	84(%rdx), %dil
	movb	%dil, 116(%rsp)
	movb	85(%rdx), %dil
	movb	%dil, 117(%rsp)
	movb	86(%rdx), %dil
	movb	%dil, 118(%rsp)
	movb	87(%rdx), %dil
	movb	%dil, 119(%rsp)
	movb	88(%rdx), %dil
	movb	%dil, 120(%rsp)
	movb	89(%rdx), %dil
	movb	%dil, 121(%rsp)
	movb	90(%rdx), %dil
	movb	%dil, 122(%rsp)
	movb	91(%rdx), %dil
	movb	%dil, 123(%rsp)
	movb	92(%rdx), %dil
	movb	%dil, 124(%rsp)
	movb	93(%rdx), %dil
	movb	%dil, 125(%rsp)
	movb	94(%rdx), %dil
	movb	%dil, 126(%rsp)
	movb	95(%rdx), %dil
	movb	%dil, 127(%rsp)
	movb	96(%rdx), %dil
	movb	%dil, 128(%rsp)
	movb	97(%rdx), %dil
	movb	%dil, 129(%rsp)
	movb	98(%rdx), %dil
	movb	%dil, 130(%rsp)
	movb	99(%rdx), %dil
	movb	%dil, 131(%rsp)
	movb	100(%rdx), %dil
	movb	%dil, 132(%rsp)
	movb	101(%rdx), %dil
	movb	%dil, 133(%rsp)
	movb	102(%rdx), %dil
	movb	%dil, 134(%rsp)
	movb	103(%rdx), %dil
	movb	%dil, 135(%rsp)
	movb	104(%rdx), %dil
	movb	%dil, 136(%rsp)
	movb	105(%rdx), %dil
	movb	%dil, 137(%rsp)
	movb	106(%rdx), %dil
	movb	%dil, 138(%rsp)
	movb	107(%rdx), %dil
	movb	%dil, 139(%rsp)
	movb	108(%rdx), %dil
	movb	%dil, 140(%rsp)
	movb	109(%rdx), %dil
	movb	%dil, 141(%rsp)
	movb	110(%rdx), %dil
	movb	%dil, 142(%rsp)
	movb	111(%rdx), %dil
	movb	%dil, 143(%rsp)
	movb	112(%rdx), %dil
	movb	%dil, 144(%rsp)
	movb	113(%rdx), %dil
	movb	%dil, 145(%rsp)
	movb	114(%rdx), %dil
	movb	%dil, 146(%rsp)
	movb	115(%rdx), %dil
	movb	%dil, 147(%rsp)
	movb	116(%rdx), %dil
	movb	%dil, 148(%rsp)
	movb	117(%rdx), %dil
	movb	%dil, 149(%rsp)
	movb	118(%rdx), %dil
	movb	%dil, 150(%rsp)
	movb	119(%rdx), %dil
	movb	%dil, 151(%rsp)
	movb	120(%rdx), %dil
	movb	%dil, 152(%rsp)
	movb	121(%rdx), %dil
	movb	%dil, 153(%rsp)
	movb	122(%rdx), %dil
	movb	%dil, 154(%rsp)
	movb	123(%rdx), %dil
	movb	%dil, 155(%rsp)
	movb	124(%rdx), %dil
	movb	%dil, 156(%rsp)
	movb	125(%rdx), %dil
	movb	%dil, 157(%rsp)
	movb	126(%rdx), %dil
	movb	%dil, 158(%rsp)
	movb	127(%rdx), %dil
	movb	%dil, 159(%rsp)
	movb	128(%rdx), %dil
	movb	%dil, 160(%rsp)
	movb	129(%rdx), %dil
	movb	%dil, 161(%rsp)
	movb	130(%rdx), %dil
	movb	%dil, 162(%rsp)
	movb	131(%rdx), %dil
	movb	%dil, 163(%rsp)
	movb	132(%rdx), %dil
	movb	%dil, 164(%rsp)
	movb	133(%rdx), %dil
	movb	%dil, 165(%rsp)
	movb	134(%rdx), %dil
	movb	%dil, 166(%rsp)
	movb	135(%rdx), %dil
	movb	%dil, 167(%rsp)
	movb	136(%rdx), %dil
	movb	%dil, 168(%rsp)
	movb	137(%rdx), %dil
	movb	%dil, 169(%rsp)
	movb	138(%rdx), %dil
	movb	%dil, 170(%rsp)
	movb	139(%rdx), %dil
	movb	%dil, 171(%rsp)
	movb	140(%rdx), %dil
	movb	%dil, 172(%rsp)
	movb	141(%rdx), %dil
	movb	%dil, 173(%rsp)
	movb	142(%rdx), %dil
	movb	%dil, 174(%rsp)
	movb	143(%rdx), %dil
	movb	%dil, 175(%rsp)
	movb	144(%rdx), %dil
	movb	%dil, 176(%rsp)
	movb	145(%rdx), %dil
	movb	%dil, 177(%rsp)
	movb	146(%rdx), %dil
	movb	%dil, 178(%rsp)
	movb	147(%rdx), %dil
	movb	%dil, 179(%rsp)
	movb	148(%rdx), %dil
	movb	%dil, 180(%rsp)
	movb	149(%rdx), %dil
	movb	%dil, 181(%rsp)
	movb	150(%rdx), %dil
	movb	%dil, 182(%rsp)
	movb	151(%rdx), %dil
	movb	%dil, 183(%rsp)
	movb	152(%rdx), %dil
	movb	%dil, 184(%rsp)
	movb	153(%rdx), %dil
	movb	%dil, 185(%rsp)
	movb	154(%rdx), %dil
	movb	%dil, 186(%rsp)
	movb	155(%rdx), %dil
	movb	%dil, 187(%rsp)
	movb	156(%rdx), %dil
	movb	%dil, 188(%rsp)
	movb	157(%rdx), %dil
	movb	%dil, 189(%rsp)
	movb	158(%rdx), %dil
	movb	%dil, 190(%rsp)
	movb	159(%rdx), %dil
	movb	%dil, 191(%rsp)
	movb	160(%rdx), %dil
	movb	%dil, 192(%rsp)
	movb	161(%rdx), %dil
	movb	%dil, 193(%rsp)
	movb	162(%rdx), %dil
	movb	%dil, 194(%rsp)
	movb	163(%rdx), %dil
	movb	%dil, 195(%rsp)
	movb	164(%rdx), %dil
	movb	%dil, 196(%rsp)
	movb	165(%rdx), %dil
	movb	%dil, 197(%rsp)
	movb	166(%rdx), %dil
	movb	%dil, 198(%rsp)
	movb	167(%rdx), %dil
	movb	%dil, 199(%rsp)
	movb	168(%rdx), %dil
	movb	%dil, 200(%rsp)
	movb	169(%rdx), %dil
	movb	%dil, 201(%rsp)
	movb	170(%rdx), %dil
	movb	%dil, 202(%rsp)
	movb	171(%rdx), %dil
	movb	%dil, 203(%rsp)
	movb	172(%rdx), %dil
	movb	%dil, 204(%rsp)
	movb	173(%rdx), %dil
	movb	%dil, 205(%rsp)
	movb	174(%rdx), %dil
	movb	%dil, 206(%rsp)
	movb	175(%rdx), %dil
	movb	%dil, 207(%rsp)
	movb	176(%rdx), %dil
	movb	%dil, 208(%rsp)
	movb	177(%rdx), %dil
	movb	%dil, 209(%rsp)
	movb	178(%rdx), %dil
	movb	%dil, 210(%rsp)
	movb	179(%rdx), %dil
	movb	%dil, 211(%rsp)
	movb	180(%rdx), %dil
	movb	%dil, 212(%rsp)
	movb	181(%rdx), %dil
	movb	%dil, 213(%rsp)
	movb	182(%rdx), %dil
	movb	%dil, 214(%rsp)
	movb	183(%rdx), %dil
	movb	%dil, 215(%rsp)
	movb	184(%rdx), %dil
	movb	%dil, 216(%rsp)
	movb	185(%rdx), %dil
	movb	%dil, 217(%rsp)
	movb	186(%rdx), %dil
	movb	%dil, 218(%rsp)
	movb	187(%rdx), %dil
	movb	%dil, 219(%rsp)
	movb	188(%rdx), %dil
	movb	%dil, 220(%rsp)
	movb	189(%rdx), %dil
	movb	%dil, 221(%rsp)
	movb	190(%rdx), %dil
	movb	%dil, 222(%rsp)
	movb	191(%rdx), %dil
	movb	%dil, 223(%rsp)
	movb	192(%rdx), %dil
	movb	%dil, 224(%rsp)
	movb	193(%rdx), %dil
	movb	%dil, 225(%rsp)
	movb	194(%rdx), %dil
	movb	%dil, 226(%rsp)
	movb	195(%rdx), %dil
	movb	%dil, 227(%rsp)
	movb	196(%rdx), %dil
	movb	%dil, 228(%rsp)
	movb	197(%rdx), %dil
	movb	%dil, 229(%rsp)
	movb	198(%rdx), %dil
	movb	%dil, 230(%rsp)
	movb	199(%rdx), %dil
	movb	%dil, 231(%rsp)
	movb	200(%rdx), %dil
	movb	%dil, 232(%rsp)
	movb	201(%rdx), %dil
	movb	%dil, 233(%rsp)
	movb	202(%rdx), %dil
	movb	%dil, 234(%rsp)
	movb	203(%rdx), %dil
	movb	%dil, 235(%rsp)
	movb	204(%rdx), %dil
	movb	%dil, 236(%rsp)
	movb	205(%rdx), %dil
	movb	%dil, 237(%rsp)
	movb	206(%rdx), %dil
	movb	%dil, 238(%rsp)
	movb	207(%rdx), %dil
	movb	%dil, 239(%rsp)
	movb	208(%rdx), %dil
	movb	%dil, 240(%rsp)
	movb	209(%rdx), %dil
	movb	%dil, 241(%rsp)
	movb	210(%rdx), %dil
	movb	%dil, 242(%rsp)
	movb	211(%rdx), %dil
	movb	%dil, 243(%rsp)
	movb	212(%rdx), %dil
	movb	%dil, 244(%rsp)
	movb	213(%rdx), %dil
	movb	%dil, 245(%rsp)
	movb	214(%rdx), %dil
	movb	%dil, 246(%rsp)
	movb	215(%rdx), %dil
	movb	%dil, 247(%rsp)
	movb	216(%rdx), %dil
	movb	%dil, 248(%rsp)
	movb	217(%rdx), %dil
	movb	%dil, 249(%rsp)
	movb	218(%rdx), %dil
	movb	%dil, 250(%rsp)
	movb	219(%rdx), %dil
	movb	%dil, 251(%rsp)
	movb	220(%rdx), %dil
	movb	%dil, 252(%rsp)
	movb	221(%rdx), %dil
	movb	%dil, 253(%rsp)
	movb	222(%rdx), %dil
	movb	%dil, 254(%rsp)
	movb	223(%rdx), %dil
	movb	%dil, 255(%rsp)
	movb	224(%rdx), %dil
	movb	%dil, 256(%rsp)
	movb	225(%rdx), %dil
	movb	%dil, 257(%rsp)
	movb	226(%rdx), %dil
	movb	%dil, 258(%rsp)
	movb	227(%rdx), %dil
	movb	%dil, 259(%rsp)
	movb	228(%rdx), %dil
	movb	%dil, 260(%rsp)
	movb	229(%rdx), %dil
	movb	%dil, 261(%rsp)
	movb	230(%rdx), %dil
	movb	%dil, 262(%rsp)
	movb	231(%rdx), %dil
	movb	%dil, 263(%rsp)
	movb	232(%rdx), %dil
	movb	%dil, 264(%rsp)
	movb	233(%rdx), %dil
	movb	%dil, 265(%rsp)
	movb	234(%rdx), %dil
	movb	%dil, 266(%rsp)
	movb	235(%rdx), %dil
	movb	%dil, 267(%rsp)
	movb	236(%rdx), %dil
	movb	%dil, 268(%rsp)
	movb	237(%rdx), %dil
	movb	%dil, 269(%rsp)
	movb	238(%rdx), %dil
	movb	%dil, 270(%rsp)
	movb	239(%rdx), %dil
	movb	%dil, 271(%rsp)
	movb	240(%rdx), %dil
	movb	%dil, 272(%rsp)
	movb	241(%rdx), %dil
	movb	%dil, 273(%rsp)
	movb	242(%rdx), %dil
	movb	%dil, 274(%rsp)
	movb	243(%rdx), %dil
	movb	%dil, 275(%rsp)
	movb	244(%rdx), %dil
	movb	%dil, 276(%rsp)
	movb	245(%rdx), %dil
	movb	%dil, 277(%rsp)
	movb	246(%rdx), %dil
	movb	%dil, 278(%rsp)
	movb	247(%rdx), %dil
	movb	%dil, 279(%rsp)
	movb	248(%rdx), %dil
	movb	%dil, 280(%rsp)
	movb	249(%rdx), %dil
	movb	%dil, 281(%rsp)
	movb	250(%rdx), %dil
	movb	%dil, 282(%rsp)
	movb	251(%rdx), %dil
	movb	%dil, 283(%rsp)
	movb	252(%rdx), %dil
	movb	%dil, 284(%rsp)
	movb	253(%rdx), %dil
	movb	%dil, 285(%rsp)
	movb	254(%rdx), %dil
	movb	%dil, 286(%rsp)
	movb	255(%rdx), %dil
	movb	%dil, 287(%rsp)
	movb	256(%rdx), %dil
	movb	%dil, 288(%rsp)
	movb	257(%rdx), %dil
	movb	%dil, 289(%rsp)
	movb	258(%rdx), %dil
	movb	%dil, 290(%rsp)
	movb	259(%rdx), %dil
	movb	%dil, 291(%rsp)
	movb	260(%rdx), %dil
	movb	%dil, 292(%rsp)
	movb	261(%rdx), %dil
	movb	%dil, 293(%rsp)
	movb	262(%rdx), %dil
	movb	%dil, 294(%rsp)
	movb	263(%rdx), %dil
	movb	%dil, 295(%rsp)
	movb	264(%rdx), %dil
	movb	%dil, 296(%rsp)
	movb	265(%rdx), %dil
	movb	%dil, 297(%rsp)
	movb	266(%rdx), %dil
	movb	%dil, 298(%rsp)
	movb	267(%rdx), %dil
	movb	%dil, 299(%rsp)
	movb	268(%rdx), %dil
	movb	%dil, 300(%rsp)
	movb	269(%rdx), %dil
	movb	%dil, 301(%rsp)
	movb	270(%rdx), %dil
	movb	%dil, 302(%rsp)
	movb	271(%rdx), %dil
	movb	%dil, 303(%rsp)
	movb	272(%rdx), %dil
	movb	%dil, 304(%rsp)
	movb	273(%rdx), %dil
	movb	%dil, 305(%rsp)
	movb	274(%rdx), %dil
	movb	%dil, 306(%rsp)
	movb	275(%rdx), %dil
	movb	%dil, 307(%rsp)
	movb	276(%rdx), %dil
	movb	%dil, 308(%rsp)
	movb	277(%rdx), %dil
	movb	%dil, 309(%rsp)
	movb	278(%rdx), %dil
	movb	%dil, 310(%rsp)
	movb	279(%rdx), %dil
	movb	%dil, 311(%rsp)
	movb	280(%rdx), %dil
	movb	%dil, 312(%rsp)
	movb	281(%rdx), %dil
	movb	%dil, 313(%rsp)
	movb	282(%rdx), %dil
	movb	%dil, 314(%rsp)
	movb	283(%rdx), %dil
	movb	%dil, 315(%rsp)
	movb	284(%rdx), %dil
	movb	%dil, 316(%rsp)
	movb	285(%rdx), %dil
	movb	%dil, 317(%rsp)
	movb	286(%rdx), %dil
	movb	%dil, 318(%rsp)
	movb	287(%rdx), %dil
	movb	%dil, 319(%rsp)
	movb	288(%rdx), %dil
	movb	%dil, 320(%rsp)
	movb	289(%rdx), %dil
	movb	%dil, 321(%rsp)
	movb	290(%rdx), %dil
	movb	%dil, 322(%rsp)
	movb	291(%rdx), %dil
	movb	%dil, 323(%rsp)
	movb	292(%rdx), %dil
	movb	%dil, 324(%rsp)
	movb	293(%rdx), %dil
	movb	%dil, 325(%rsp)
	movb	294(%rdx), %dil
	movb	%dil, 326(%rsp)
	movb	295(%rdx), %dil
	movb	%dil, 327(%rsp)
	movb	296(%rdx), %dil
	movb	%dil, 328(%rsp)
	movb	297(%rdx), %dil
	movb	%dil, 329(%rsp)
	movb	298(%rdx), %dil
	movb	%dil, 330(%rsp)
	movb	299(%rdx), %dil
	movb	%dil, 331(%rsp)
	movb	300(%rdx), %dil
	movb	%dil, 332(%rsp)
	movb	301(%rdx), %dil
	movb	%dil, 333(%rsp)
	movb	302(%rdx), %dil
	movb	%dil, 334(%rsp)
	movb	303(%rdx), %dil
	movb	%dil, 335(%rsp)
	movb	304(%rdx), %dil
	movb	%dil, 336(%rsp)
	movb	305(%rdx), %dil
	movb	%dil, 337(%rsp)
	movb	306(%rdx), %dil
	movb	%dil, 338(%rsp)
	movb	307(%rdx), %dil
	movb	%dil, 339(%rsp)
	movb	308(%rdx), %dil
	movb	%dil, 340(%rsp)
	movb	309(%rdx), %dil
	movb	%dil, 341(%rsp)
	movb	310(%rdx), %dil
	movb	%dil, 342(%rsp)
	movb	311(%rdx), %dil
	movb	%dil, 343(%rsp)
	movb	312(%rdx), %dil
	movb	%dil, 344(%rsp)
	movb	313(%rdx), %dil
	movb	%dil, 345(%rsp)
	movb	314(%rdx), %dil
	movb	%dil, 346(%rsp)
	movb	315(%rdx), %dil
	movb	%dil, 347(%rsp)
	movb	316(%rdx), %dil
	movb	%dil, 348(%rsp)
	movb	317(%rdx), %dil
	movb	%dil, 349(%rsp)
	movb	318(%rdx), %dil
	movb	%dil, 350(%rsp)
	movb	319(%rdx), %dil
	movb	%dil, 351(%rsp)
	movb	320(%rdx), %dil
	movb	%dil, 352(%rsp)
	movb	321(%rdx), %dil
	movb	%dil, 353(%rsp)
	movb	322(%rdx), %dil
	movb	%dil, 354(%rsp)
	movb	323(%rdx), %dil
	movb	%dil, 355(%rsp)
	movb	324(%rdx), %dil
	movb	%dil, 356(%rsp)
	movb	325(%rdx), %dil
	movb	%dil, 357(%rsp)
	movb	326(%rdx), %dil
	movb	%dil, 358(%rsp)
	movb	327(%rdx), %dil
	movb	%dil, 359(%rsp)
	movb	328(%rdx), %dil
	movb	%dil, 360(%rsp)
	movb	329(%rdx), %dil
	movb	%dil, 361(%rsp)
	movb	330(%rdx), %dil
	movb	%dil, 362(%rsp)
	movb	331(%rdx), %dil
	movb	%dil, 363(%rsp)
	movb	332(%rdx), %dil
	movb	%dil, 364(%rsp)
	movb	333(%rdx), %dil
	movb	%dil, 365(%rsp)
	movb	334(%rdx), %dil
	movb	%dil, 366(%rsp)
	movb	335(%rdx), %dil
	movb	%dil, 367(%rsp)
	movb	336(%rdx), %dil
	movb	%dil, 368(%rsp)
	movb	337(%rdx), %dil
	movb	%dil, 369(%rsp)
	movb	338(%rdx), %dil
	movb	%dil, 370(%rsp)
	movb	339(%rdx), %dil
	movb	%dil, 371(%rsp)
	movb	340(%rdx), %dil
	movb	%dil, 372(%rsp)
	movb	341(%rdx), %dil
	movb	%dil, 373(%rsp)
	movb	342(%rdx), %dil
	movb	%dil, 374(%rsp)
	movb	343(%rdx), %dil
	movb	%dil, 375(%rsp)
	movb	344(%rdx), %dil
	movb	%dil, 376(%rsp)
	movb	345(%rdx), %dil
	movb	%dil, 377(%rsp)
	movb	346(%rdx), %dil
	movb	%dil, 378(%rsp)
	movb	347(%rdx), %dil
	movb	%dil, 379(%rsp)
	movb	348(%rdx), %dil
	movb	%dil, 380(%rsp)
	movb	349(%rdx), %dil
	movb	%dil, 381(%rsp)
	movb	350(%rdx), %dil
	movb	%dil, 382(%rsp)
	movb	351(%rdx), %dil
	movb	%dil, 383(%rsp)
	movb	352(%rdx), %dil
	movb	%dil, 384(%rsp)
	movb	353(%rdx), %dil
	movb	%dil, 385(%rsp)
	movb	354(%rdx), %dil
	movb	%dil, 386(%rsp)
	movb	355(%rdx), %dil
	movb	%dil, 387(%rsp)
	movb	356(%rdx), %dil
	movb	%dil, 388(%rsp)
	movb	357(%rdx), %dil
	movb	%dil, 389(%rsp)
	movb	358(%rdx), %dil
	movb	%dil, 390(%rsp)
	movb	359(%rdx), %dil
	movb	%dil, 391(%rsp)
	movb	360(%rdx), %dil
	movb	%dil, 392(%rsp)
	movb	361(%rdx), %dil
	movb	%dil, 393(%rsp)
	movb	362(%rdx), %dil
	movb	%dil, 394(%rsp)
	movb	363(%rdx), %dil
	movb	%dil, 395(%rsp)
	movb	364(%rdx), %dil
	movb	%dil, 396(%rsp)
	movb	365(%rdx), %dil
	movb	%dil, 397(%rsp)
	movb	366(%rdx), %dil
	movb	%dil, 398(%rsp)
	movb	367(%rdx), %dil
	movb	%dil, 399(%rsp)
	movb	368(%rdx), %dil
	movb	%dil, 400(%rsp)
	movb	369(%rdx), %dil
	movb	%dil, 401(%rsp)
	movb	370(%rdx), %dil
	movb	%dil, 402(%rsp)
	movb	371(%rdx), %dil
	movb	%dil, 403(%rsp)
	movb	372(%rdx), %dil
	movb	%dil, 404(%rsp)
	movb	373(%rdx), %dil
	movb	%dil, 405(%rsp)
	movb	374(%rdx), %dil
	movb	%dil, 406(%rsp)
	movb	375(%rdx), %dil
	movb	%dil, 407(%rsp)
	movb	376(%rdx), %dil
	movb	%dil, 408(%rsp)
	movb	377(%rdx), %dil
	movb	%dil, 409(%rsp)
	movb	378(%rdx), %dil
	movb	%dil, 410(%rsp)
	movb	379(%rdx), %dil
	movb	%dil, 411(%rsp)
	movb	380(%rdx), %dil
	movb	%dil, 412(%rsp)
	movb	381(%rdx), %dil
	movb	%dil, 413(%rsp)
	movb	382(%rdx), %dil
	movb	%dil, 414(%rsp)
	movb	383(%rdx), %dil
	movb	%dil, 415(%rsp)
	movb	384(%rdx), %dil
	movb	%dil, 416(%rsp)
	movb	385(%rdx), %dil
	movb	%dil, 417(%rsp)
	movb	386(%rdx), %dil
	movb	%dil, 418(%rsp)
	movb	387(%rdx), %dil
	movb	%dil, 419(%rsp)
	movb	388(%rdx), %dil
	movb	%dil, 420(%rsp)
	movb	389(%rdx), %dil
	movb	%dil, 421(%rsp)
	movb	390(%rdx), %dil
	movb	%dil, 422(%rsp)
	movb	391(%rdx), %dil
	movb	%dil, 423(%rsp)
	movb	392(%rdx), %dil
	movb	%dil, 424(%rsp)
	movb	393(%rdx), %dil
	movb	%dil, 425(%rsp)
	movb	394(%rdx), %dil
	movb	%dil, 426(%rsp)
	movb	395(%rdx), %dil
	movb	%dil, 427(%rsp)
	movb	396(%rdx), %dil
	movb	%dil, 428(%rsp)
	movb	397(%rdx), %dil
	movb	%dil, 429(%rsp)
	movb	398(%rdx), %dil
	movb	%dil, 430(%rsp)
	movb	399(%rdx), %dil
	movb	%dil, 431(%rsp)
	movb	400(%rdx), %dil
	movb	%dil, 432(%rsp)
	movb	401(%rdx), %dil
	movb	%dil, 433(%rsp)
	movb	402(%rdx), %dil
	movb	%dil, 434(%rsp)
	movb	403(%rdx), %dil
	movb	%dil, 435(%rsp)
	movb	404(%rdx), %dil
	movb	%dil, 436(%rsp)
	movb	405(%rdx), %dil
	movb	%dil, 437(%rsp)
	movb	406(%rdx), %dil
	movb	%dil, 438(%rsp)
	movb	407(%rdx), %dil
	movb	%dil, 439(%rsp)
	movb	408(%rdx), %dil
	movb	%dil, 440(%rsp)
	movb	409(%rdx), %dil
	movb	%dil, 441(%rsp)
	movb	410(%rdx), %dil
	movb	%dil, 442(%rsp)
	movb	411(%rdx), %dil
	movb	%dil, 443(%rsp)
	movb	412(%rdx), %dil
	movb	%dil, 444(%rsp)
	movb	413(%rdx), %dil
	movb	%dil, 445(%rsp)
	movb	414(%rdx), %dil
	movb	%dil, 446(%rsp)
	movb	415(%rdx), %dil
	movb	%dil, 447(%rsp)
	movb	416(%rdx), %dil
	movb	%dil, 448(%rsp)
	movb	417(%rdx), %dil
	movb	%dil, 449(%rsp)
	movb	418(%rdx), %dil
	movb	%dil, 450(%rsp)
	movb	419(%rdx), %dil
	movb	%dil, 451(%rsp)
	movb	420(%rdx), %dil
	movb	%dil, 452(%rsp)
	movb	421(%rdx), %dil
	movb	%dil, 453(%rsp)
	movb	422(%rdx), %dil
	movb	%dil, 454(%rsp)
	movb	423(%rdx), %dil
	movb	%dil, 455(%rsp)
	movb	424(%rdx), %dil
	movb	%dil, 456(%rsp)
	movb	425(%rdx), %dil
	movb	%dil, 457(%rsp)
	movb	426(%rdx), %dil
	movb	%dil, 458(%rsp)
	movb	427(%rdx), %dil
	movb	%dil, 459(%rsp)
	movb	428(%rdx), %dil
	movb	%dil, 460(%rsp)
	movb	429(%rdx), %dil
	movb	%dil, 461(%rsp)
	movb	430(%rdx), %dil
	movb	%dil, 462(%rsp)
	movb	431(%rdx), %dil
	movb	%dil, 463(%rsp)
	movb	432(%rdx), %dil
	movb	%dil, 464(%rsp)
	movb	433(%rdx), %dil
	movb	%dil, 465(%rsp)
	movb	434(%rdx), %dil
	movb	%dil, 466(%rsp)
	movb	435(%rdx), %dil
	movb	%dil, 467(%rsp)
	movb	436(%rdx), %dil
	movb	%dil, 468(%rsp)
	movb	437(%rdx), %dil
	movb	%dil, 469(%rsp)
	movb	438(%rdx), %dil
	movb	%dil, 470(%rsp)
	movb	439(%rdx), %dil
	movb	%dil, 471(%rsp)
	movb	440(%rdx), %dil
	movb	%dil, 472(%rsp)
	movb	441(%rdx), %dil
	movb	%dil, 473(%rsp)
	movb	442(%rdx), %dil
	movb	%dil, 474(%rsp)
	movb	443(%rdx), %dil
	movb	%dil, 475(%rsp)
	movb	444(%rdx), %dil
	movb	%dil, 476(%rsp)
	movb	445(%rdx), %dil
	movb	%dil, 477(%rsp)
	movb	446(%rdx), %dil
	movb	%dil, 478(%rsp)
	movb	447(%rdx), %dil
	movb	%dil, 479(%rsp)
	movb	448(%rdx), %dil
	movb	%dil, 480(%rsp)
	movb	449(%rdx), %dil
	movb	%dil, 481(%rsp)
	movb	450(%rdx), %dil
	movb	%dil, 482(%rsp)
	movb	451(%rdx), %dil
	movb	%dil, 483(%rsp)
	movb	452(%rdx), %dil
	movb	%dil, 484(%rsp)
	movb	453(%rdx), %dil
	movb	%dil, 485(%rsp)
	movb	454(%rdx), %dil
	movb	%dil, 486(%rsp)
	movb	455(%rdx), %dil
	movb	%dil, 487(%rsp)
	movb	456(%rdx), %dil
	movb	%dil, 488(%rsp)
	movb	457(%rdx), %dil
	movb	%dil, 489(%rsp)
	movb	458(%rdx), %dil
	movb	%dil, 490(%rsp)
	movb	459(%rdx), %dil
	movb	%dil, 491(%rsp)
	movb	460(%rdx), %dil
	movb	%dil, 492(%rsp)
	movb	461(%rdx), %dil
	movb	%dil, 493(%rsp)
	movb	462(%rdx), %dil
	movb	%dil, 494(%rsp)
	movb	463(%rdx), %dil
	movb	%dil, 495(%rsp)
	movb	464(%rdx), %dil
	movb	%dil, 496(%rsp)
	movb	465(%rdx), %dil
	movb	%dil, 497(%rsp)
	movb	466(%rdx), %dil
	movb	%dil, 498(%rsp)
	movb	467(%rdx), %dil
	movb	%dil, 499(%rsp)
	movb	468(%rdx), %dil
	movb	%dil, 500(%rsp)
	movb	469(%rdx), %dil
	movb	%dil, 501(%rsp)
	movb	470(%rdx), %dil
	movb	%dil, 502(%rsp)
	movb	471(%rdx), %dil
	movb	%dil, 503(%rsp)
	movb	472(%rdx), %dil
	movb	%dil, 504(%rsp)
	movb	473(%rdx), %dil
	movb	%dil, 505(%rsp)
	movb	474(%rdx), %dil
	movb	%dil, 506(%rsp)
	movb	475(%rdx), %dil
	movb	%dil, 507(%rsp)
	movb	476(%rdx), %dil
	movb	%dil, 508(%rsp)
	movb	477(%rdx), %dil
	movb	%dil, 509(%rsp)
	movb	478(%rdx), %dil
	movb	%dil, 510(%rsp)
	movb	479(%rdx), %dil
	movb	%dil, 511(%rsp)
	movb	480(%rdx), %dil
	movb	%dil, 512(%rsp)
	movb	481(%rdx), %dil
	movb	%dil, 513(%rsp)
	movb	482(%rdx), %dil
	movb	%dil, 514(%rsp)
	movb	483(%rdx), %dil
	movb	%dil, 515(%rsp)
	movb	484(%rdx), %dil
	movb	%dil, 516(%rsp)
	movb	485(%rdx), %dil
	movb	%dil, 517(%rsp)
	movb	486(%rdx), %dil
	movb	%dil, 518(%rsp)
	movb	487(%rdx), %dil
	movb	%dil, 519(%rsp)
	movb	488(%rdx), %dil
	movb	%dil, 520(%rsp)
	movb	489(%rdx), %dil
	movb	%dil, 521(%rsp)
	movb	490(%rdx), %dil
	movb	%dil, 522(%rsp)
	movb	491(%rdx), %dil
	movb	%dil, 523(%rsp)
	movb	492(%rdx), %dil
	movb	%dil, 524(%rsp)
	movb	493(%rdx), %dil
	movb	%dil, 525(%rsp)
	movb	494(%rdx), %dil
	movb	%dil, 526(%rsp)
	movb	495(%rdx), %dil
	movb	%dil, 527(%rsp)
	movb	496(%rdx), %dil
	movb	%dil, 528(%rsp)
	movb	497(%rdx), %dil
	movb	%dil, 529(%rsp)
	movb	498(%rdx), %dil
	movb	%dil, 530(%rsp)
	movb	499(%rdx), %dil
	movb	%dil, 531(%rsp)
	movb	500(%rdx), %dil
	movb	%dil, 532(%rsp)
	movb	501(%rdx), %dil
	movb	%dil, 533(%rsp)
	movb	502(%rdx), %dil
	movb	%dil, 534(%rsp)
	movb	503(%rdx), %dil
	movb	%dil, 535(%rsp)
	movb	504(%rdx), %dil
	movb	%dil, 536(%rsp)
	movb	505(%rdx), %dil
	movb	%dil, 537(%rsp)
	movb	506(%rdx), %dil
	movb	%dil, 538(%rsp)
	movb	507(%rdx), %dil
	movb	%dil, 539(%rsp)
	movb	508(%rdx), %dil
	movb	%dil, 540(%rsp)
	movb	509(%rdx), %dil
	movb	%dil, 541(%rsp)
	movb	510(%rdx), %dil
	movb	%dil, 542(%rsp)
	movb	511(%rdx), %dil
	movb	%dil, 543(%rsp)
	movb	512(%rdx), %dil
	movb	%dil, 544(%rsp)
	movb	513(%rdx), %dil
	movb	%dil, 545(%rsp)
	movb	514(%rdx), %dil
	movb	%dil, 546(%rsp)
	movb	515(%rdx), %dil
	movb	%dil, 547(%rsp)
	movb	516(%rdx), %dil
	movb	%dil, 548(%rsp)
	movb	517(%rdx), %dil
	movb	%dil, 549(%rsp)
	movb	518(%rdx), %dil
	movb	%dil, 550(%rsp)
	movb	519(%rdx), %dil
	movb	%dil, 551(%rsp)
	movb	520(%rdx), %dil
	movb	%dil, 552(%rsp)
	movb	521(%rdx), %dil
	movb	%dil, 553(%rsp)
	movb	522(%rdx), %dil
	movb	%dil, 554(%rsp)
	movb	523(%rdx), %dil
	movb	%dil, 555(%rsp)
	movb	524(%rdx), %dil
	movb	%dil, 556(%rsp)
	movb	525(%rdx), %dil
	movb	%dil, 557(%rsp)
	movb	526(%rdx), %dil
	movb	%dil, 558(%rsp)
	movb	527(%rdx), %dil
	movb	%dil, 559(%rsp)
	movb	528(%rdx), %dil
	movb	%dil, 560(%rsp)
	movb	529(%rdx), %dil
	movb	%dil, 561(%rsp)
	movb	530(%rdx), %dil
	movb	%dil, 562(%rsp)
	movb	531(%rdx), %dil
	movb	%dil, 563(%rsp)
	movb	532(%rdx), %dil
	movb	%dil, 564(%rsp)
	movb	533(%rdx), %dil
	movb	%dil, 565(%rsp)
	movb	534(%rdx), %dil
	movb	%dil, 566(%rsp)
	movb	535(%rdx), %dil
	movb	%dil, 567(%rsp)
	movb	536(%rdx), %dil
	movb	%dil, 568(%rsp)
	movb	537(%rdx), %dil
	movb	%dil, 569(%rsp)
	movb	538(%rdx), %dil
	movb	%dil, 570(%rsp)
	movb	539(%rdx), %dil
	movb	%dil, 571(%rsp)
	movb	540(%rdx), %dil
	movb	%dil, 572(%rsp)
	movb	541(%rdx), %dil
	movb	%dil, 573(%rsp)
	movb	542(%rdx), %dil
	movb	%dil, 574(%rsp)
	movb	543(%rdx), %dil
	movb	%dil, 575(%rsp)
	movb	544(%rdx), %dil
	movb	%dil, 576(%rsp)
	movb	545(%rdx), %dil
	movb	%dil, 577(%rsp)
	movb	546(%rdx), %dil
	movb	%dil, 578(%rsp)
	movb	547(%rdx), %dil
	movb	%dil, 579(%rsp)
	movb	548(%rdx), %dil
	movb	%dil, 580(%rsp)
	movb	549(%rdx), %dil
	movb	%dil, 581(%rsp)
	movb	550(%rdx), %dil
	movb	%dil, 582(%rsp)
	movb	551(%rdx), %dil
	movb	%dil, 583(%rsp)
	movb	552(%rdx), %dil
	movb	%dil, 584(%rsp)
	movb	553(%rdx), %dil
	movb	%dil, 585(%rsp)
	movb	554(%rdx), %dil
	movb	%dil, 586(%rsp)
	movb	555(%rdx), %dil
	movb	%dil, 587(%rsp)
	movb	556(%rdx), %dil
	movb	%dil, 588(%rsp)
	movb	557(%rdx), %dil
	movb	%dil, 589(%rsp)
	movb	558(%rdx), %dil
	movb	%dil, 590(%rsp)
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
	movl	652(%rsp,%rax,4), %esi
	movl	$15, %eax
	subl	%esi, %eax
	leaq	32(%rsp,%rdx), %rcx
	movl	%eax, %edx
	movq	%r11, %r8
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkfromsig$5:
	leaq	24(%rsp), %rsp
	movq	%r8, %r11
	movq	600(%rsp), %r10
	movl	648(%rsp), %ecx
	movq	608(%rsp), %rdx
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
	movl	20(%r11), %esi
	leaq	616(%rsp), %rcx
	movl	%esi, 20(%rcx)
	movq	592(%rsp), %rcx
	movq	%r11, 592(%rsp)
	leaq	616(%rsp), %rdi
	leaq	32(%rsp), %rax
	movq	%rcx, %r11
	movq	%rax, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkfromsig$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdx
	movq	592(%rsp), %rcx
	ret
.Lwots_sign$1:
	leaq	84(%rsp), %rsi
	movq	%rsi, %rdx
	movq	$0, %r8
	movl	$0, %ecx
	movl	$0, %r9d
	jmp 	.Lwots_sign$76
.Lwots_sign$77:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
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
	leaq	128(%rsi), %rax
	leaq	224(%rsp), %rsi
	movq	$0, %rdx
	movl	$0, %ecx
	movl	$0, %r8d
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %r8d
	movzbl	(%rsi,%rdx), %r9d
	orl 	%r9d, %r8d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$12:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$13
	movl	%r8d, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, (%rax)
	jmp 	.Lwots_sign$10
.Lwots_sign$11:
	shll	$8, %r8d
	movzbl	(%rsi,%rdx), %r9d
	orl 	%r9d, %r8d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$10:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$11
	movl	%r8d, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, 4(%rax)
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %r8d
	movzbl	(%rsi,%rdx), %r9d
	orl 	%r9d, %r8d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$8:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$9
	movl	%r8d, %edx
	addl	$-4, %ecx
	shrq	%cl, %rdx
	andq	$15, %rdx
	movl	%edx, 8(%rax)
	leaq	48(%rsp), %rax
	movq	(%rdi), %rdx
	movq	%rdx, (%rax)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rdi), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rdi), %rdx
	movq	%rdx, 24(%rax)
	leaq	48(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%rdi), %esi
	leaq	48(%rsp), %rcx
	movl	%esi, 20(%rcx)
	movq	%rdi, 8(%rsp)
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
	leaq	48(%rsp), %rdi
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_sign$7:
	leaq	56(%rsp), %rsp
	movq	40(%rsp), %rbx
	movq	16(%rsp), %r11
	movq	24(%rsp), %r10
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rdx
	incl	%ecx
	addq	$16, %rdx
.Lwots_sign$5:
	cmpl	$35, %ecx
	jb  	.Lwots_sign$6
	movq	8(%rsp), %rdi
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_sign$2
.Lwots_sign$3:
	movq	%r10, 8(%rsp)
	movl	%ecx, 80(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%ecx, %eax
	movl	%eax, 24(%rdi)
	movl	$0, %esi
	movl	%ecx, %eax
	movl	84(%rsp,%rax,4), %eax
	leaq	(%rbx,%rdx), %rcx
	movq	%rbx, 24(%rsp)
	movl	%eax, %edx
	movq	%rdi, %r8
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_sign$4:
	leaq	24(%rsp), %rsp
	movq	%r8, %rdi
	movq	24(%rsp), %rbx
	movq	8(%rsp), %r10
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rdx
	incl	%ecx
	addq	$16, %rdx
.Lwots_sign$2:
	cmpl	$35, %ecx
	jb  	.Lwots_sign$3
	ret
.Lwots_pkgen$1:
	movq	%rcx, 592(%rsp)
	leaq	632(%rsp), %rcx
	movq	(%rdi), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rdi), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rdi), %rdx
	movq	%rdx, 24(%rcx)
	leaq	632(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%rdi), %esi
	leaq	632(%rsp), %rcx
	movl	%esi, 20(%rcx)
	movl	%esi, 664(%rsp)
	movq	%rdi, 600(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$6
.Lwots_pkgen$7:
	movq	%r11, 608(%rsp)
	movq	%r10, 616(%rsp)
	movl	%ecx, 668(%rsp)
	movq	%rdx, 624(%rsp)
	leaq	632(%rsp), %rdi
	movl	%ecx, 24(%rdi)
	leaq	32(%rsp,%rdx), %rcx
	leaq	632(%rsp), %rdi
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_pkgen$8:
	leaq	56(%rsp), %rsp
	movq	608(%rsp), %r11
	movq	616(%rsp), %r10
	movl	668(%rsp), %ecx
	movq	624(%rsp), %rdx
	incl	%ecx
	addq	$16, %rdx
.Lwots_pkgen$6:
	cmpl	$35, %ecx
	jb  	.Lwots_pkgen$7
	movq	600(%rsp), %rdi
	movq	$0, %r8
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$3
.Lwots_pkgen$4:
	movq	%r10, 600(%rsp)
	movl	%ecx, 668(%rsp)
	movq	%r8, 624(%rsp)
	movl	%ecx, 24(%rdi)
	movl	$0, %esi
	movl	$15, %edx
	leaq	32(%rsp,%r8), %rcx
	movq	%rdi, %r8
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkgen$5:
	leaq	24(%rsp), %rsp
	movq	%r8, %rdi
	movq	600(%rsp), %r10
	movl	668(%rsp), %ecx
	movq	624(%rsp), %r8
	incl	%ecx
	addq	$16, %r8
.Lwots_pkgen$3:
	cmpl	$35, %ecx
	jb  	.Lwots_pkgen$4
	leaq	632(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$1, 16(%rcx)
	movl	664(%rsp), %esi
	leaq	632(%rsp), %rcx
	movl	%esi, 20(%rcx)
	movq	592(%rsp), %rcx
	movq	%rdi, 592(%rsp)
	leaq	632(%rsp), %rdi
	leaq	32(%rsp), %rdx
	movq	%rcx, %r11
	movq	%rdx, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	56(%rsp), %rsp
	movq	592(%rsp), %rdi
	ret
.Lchain$1:
	movl	%esi, %edi
	addl	%edx, %edi
	jmp 	.Lchain$2
.Lchain$3:
	movl	%esi, 28(%r8)
	movq	%r10, 8(%rsp)
	movq	%r8, 16(%rsp)
	movl	%esi, 24(%rsp)
	movl	%edi, 28(%rsp)
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lchain$4:
	leaq	56(%rsp), %rsp
	movq	8(%rsp), %r10
	movq	16(%rsp), %r8
	movl	24(%rsp), %esi
	movl	28(%rsp), %edi
	incl	%esi
.Lchain$2:
	cmpl	%edi, %esi
	jb  	.Lchain$3
	ret
.LT_k$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%r10,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r10,%rcx), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%rdi), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%rdi), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%rdi), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%rdi), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%rdi), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%rdi), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%rdi), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%rdi), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %rsi
	vmovdqu	(%rcx,%rsi), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	8(%rcx,%rsi), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rcx,%rsi), %rcx
	vmovq	%rcx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rsi
	movq	$0, %rcx
	vmovq	%rcx, %xmm7
	vmovdqu	(%rax,%rsi), %ymm14
	movq	32(%rax,%rsi), %rcx
	vmovq	%rcx, %xmm8
	vmovdqu	40(%rax,%rsi), %ymm13
	movq	72(%rax,%rsi), %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	movq	80(%rax,%rsi), %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm9
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
	addq	$88, %rsi
	call	.L_keccakf1600_avx2$1
.LT_k$9:
	movq	$0, %rcx
	jmp 	.LT_k$6
.LT_k$7:
	vpbroadcastq	(%rax,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rsi), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rax,%rsi), %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	48(%rax,%rsi), %ymm14
	movq	80(%rax,%rsi), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	88(%rax,%rsi), %ymm13
	movq	120(%rax,%rsi), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	128(%rax,%rsi), %rdx
	vmovq	%rdx, %xmm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm9
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
	addq	$136, %rsi
	call	.L_keccakf1600_avx2$1
.LT_k$8:
	incq	%rcx
.LT_k$6:
	cmpq	$3, %rcx
	jb  	.LT_k$7
	vpbroadcastq	(%rax,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rsi), %xmm7
	movq	24(%rax,%rsi), %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	movq	$31, %rax
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
	movq	48(%rsp), %rcx
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	.LT_k$3
.LT_k$4:
	call	.L_keccakf1600_avx2$1
.LT_k$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rax)
	vmovdqu	%ymm4, 8(%rcx,%rax)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%rax)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rax)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%rax)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rax)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%rax)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rax)
	addq	$136, %rax
	incq	%rsi
.LT_k$3:
	cmpq	$0, %rsi
	jb  	.LT_k$4
	call	.L_keccakf1600_avx2$1
.LT_k$2:
	movq	%xmm5, (%rcx,%rax)
	movq	%xmm4, 8(%rcx,%rax)
	ret
.LT_len$1:
	movq	%r11, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rsi
	vpbroadcastq	(%r10,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r10,%rsi), %rdx
	vmovq	%rdx, %xmm7
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rdx
	movl	(%rdi), %esi
	bswapl	%esi
	movl	%esi, (%rdx)
	movl	4(%rdi), %esi
	bswapl	%esi
	movl	%esi, 4(%rdx)
	movl	8(%rdi), %esi
	bswapl	%esi
	movl	%esi, 8(%rdx)
	movl	12(%rdi), %esi
	bswapl	%esi
	movl	%esi, 12(%rdx)
	movl	16(%rdi), %esi
	bswapl	%esi
	movl	%esi, 16(%rdx)
	movl	20(%rdi), %esi
	bswapl	%esi
	movl	%esi, 20(%rdx)
	movl	24(%rdi), %esi
	bswapl	%esi
	movl	%esi, 24(%rdx)
	movl	28(%rdi), %esi
	bswapl	%esi
	movl	%esi, 28(%rdx)
	leaq	16(%rsp), %rdx
	movq	$0, %rsi
	vmovdqu	(%rdx,%rsi), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	8(%rdx,%rsi), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rdx,%rsi), %rdx
	vmovq	%rdx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rsi
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	(%rcx,%rsi), %ymm14
	movq	32(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	40(%rcx,%rsi), %ymm13
	movq	72(%rcx,%rsi), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	80(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm9
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
	addq	$88, %rsi
	call	.L_keccakf1600_avx2$1
.LT_len$9:
	movq	$0, %rdi
	jmp 	.LT_len$6
.LT_len$7:
	vpbroadcastq	(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	48(%rcx,%rsi), %ymm14
	movq	80(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	88(%rcx,%rsi), %ymm13
	movq	120(%rcx,%rsi), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	128(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm9
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
	addq	$136, %rsi
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%rdi
.LT_len$6:
	cmpq	$3, %rdi
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	48(%rcx,%rsi), %xmm9
	movq	$0, %rcx
	movq	$31, %rdx
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
	movq	48(%rsp), %rcx
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rsi)
	vmovdqu	%ymm4, 8(%rcx,%rsi)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%rsi)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rsi)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%rsi)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rsi)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%rsi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rsi)
	addq	$136, %rsi
	incq	%rdi
.LT_len$3:
	cmpq	$0, %rdi
	jb  	.LT_len$4
	call	.L_keccakf1600_avx2$1
.LT_len$2:
	movq	%xmm5, (%rcx,%rsi)
	movq	%xmm4, 8(%rcx,%rsi)
	ret
.LH$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%r10,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r10,%rcx), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%rdi), %r8d
	bswapl	%r8d
	movl	%r8d, (%rcx)
	movl	4(%rdi), %r8d
	bswapl	%r8d
	movl	%r8d, 4(%rcx)
	movl	8(%rdi), %r8d
	bswapl	%r8d
	movl	%r8d, 8(%rcx)
	movl	12(%rdi), %r8d
	bswapl	%r8d
	movl	%r8d, 12(%rcx)
	movl	16(%rdi), %r8d
	bswapl	%r8d
	movl	%r8d, 16(%rcx)
	movl	20(%rdi), %r8d
	bswapl	%r8d
	movl	%r8d, 20(%rcx)
	movl	24(%rdi), %r8d
	bswapl	%r8d
	movl	%r8d, 24(%rcx)
	movl	28(%rdi), %r8d
	bswapl	%r8d
	movl	%r8d, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %r8
	vmovdqu	(%rcx,%r8), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	8(%rcx,%r8), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rcx,%r8), %rcx
	vmovq	%rcx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rcx
	movq	$0, %rdi
	vmovq	%rdi, %xmm7
	vmovdqu	(%rdx,%rcx), %xmm9
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
	movq	$0, %rcx
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	vmovdqu	(%rsi,%rcx), %xmm8
	vinserti128	$1, %xmm8, %ymm9, %ymm14
	movq	$0, %rcx
	movq	$31, %rdx
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
	movq	48(%rsp), %rcx
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rsi)
	vmovdqu	%ymm4, 8(%rcx,%rsi)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%rsi)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rsi)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%rsi)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rsi)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%rsi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rsi)
	addq	$136, %rsi
	incq	%rdi
.LH$3:
	cmpq	$0, %rdi
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm5, (%rcx,%rsi)
	movq	%xmm4, 8(%rcx,%rsi)
	ret
.LF$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rsi
	vpbroadcastq	(%r10,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r10,%rsi), %rdx
	vmovq	%rdx, %xmm7
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
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
	movq	$0, %rsi
	vmovdqu	(%rdx,%rsi), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	8(%rdx,%rsi), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rdx,%rsi), %rdx
	vmovq	%rdx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rsi
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	(%rcx,%rsi), %xmm9
	movq	$0, %rcx
	movq	$31, %rdx
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
	movq	48(%rsp), %rcx
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rsi)
	vmovdqu	%ymm4, 8(%rcx,%rsi)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%rsi)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rsi)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%rsi)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rsi)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%rsi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rsi)
	addq	$136, %rsi
	incq	%rdi
.LF$3:
	cmpq	$0, %rdi
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm5, (%rcx,%rsi)
	movq	%xmm4, 8(%rcx,%rsi)
	ret
.LPRF$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%r10,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%r10,%rcx), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%rdi), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%rdi), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%rdi), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%rdi), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%rdi), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%rdi), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%rdi), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%rdi), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %rsi
	vmovdqu	(%rcx,%rsi), %xmm7
	vpslldq	$8, %xmm7, %xmm7
	vmovdqu	8(%rcx,%rsi), %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	24(%rcx,%rsi), %rcx
	vmovq	%rcx, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rcx
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	(%r11,%rcx), %xmm9
	movq	$0, %rcx
	movq	$31, %rdx
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
	movq	48(%rsp), %rcx
	movq	$0, %rsi
	movq	$0, %rdi
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rsi)
	vmovdqu	%ymm4, 8(%rcx,%rsi)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%rsi)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rsi)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%rsi)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rsi)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%rsi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rsi)
	addq	$136, %rsi
	incq	%rdi
.LPRF$3:
	cmpq	$0, %rdi
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm5, (%rcx,%rsi)
	movq	%xmm4, 8(%rcx,%rsi)
	ret
.LPRF_msg$1:
	movq	%r11, 216(%rsp)
	movq	%rcx, 224(%rsp)
	movq	%rdx, 232(%rsp)
	movq	%rdi, 240(%rsp)
	movq	%r8, 248(%rsp)
	leaq	16(%rsp), %rax
	xorl	%esi, %esi
	movq	%rsi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rsi, 16(%rax)
	movq	%rsi, 24(%rax)
	movq	%rsi, 32(%rax)
	movq	%rsi, 40(%rax)
	movq	%rsi, 48(%rax)
	movq	%rsi, 56(%rax)
	movq	%rsi, 64(%rax)
	movq	%rsi, 72(%rax)
	movq	%rsi, 80(%rax)
	movq	%rsi, 88(%rax)
	movq	%rsi, 96(%rax)
	movq	%rsi, 104(%rax)
	movq	%rsi, 112(%rax)
	movq	%rsi, 120(%rax)
	movq	%rsi, 128(%rax)
	movq	%rsi, 136(%rax)
	movq	%rsi, 144(%rax)
	movq	%rsi, 152(%rax)
	movq	%rsi, 160(%rax)
	movq	%rsi, 168(%rax)
	movq	%rsi, 176(%rax)
	movq	%rsi, 184(%rax)
	movq	%rsi, 192(%rax)
	vmovdqu	(%r10), %xmm0
	vmovdqu	%xmm0, 16(%rsp)
	vmovdqu	(%r9), %xmm0
	vmovdqu	%xmm0, 32(%rsp)
	movb	$0, 48(%rsp)
	movb	%dl, 49(%rsp)
	movq	$34, %rsi
	movq	$0, %rax
	movq	224(%rsp), %rdi
	movq	232(%rsp), %rcx
	jmp 	.LPRF_msg$11
.LPRF_msg$12:
	cmpq	$136, %rsi
	jb  	.LPRF_msg$13
	movq	%rdi, 232(%rsp)
	movq	%rax, 224(%rsp)
	movq	%rcx, 256(%rsp)
	leaq	16(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$14:
	leaq	208(%rsp), %rsp
	movq	232(%rsp), %rdi
	movq	224(%rsp), %rax
	movq	256(%rsp), %rcx
	movq	$0, %rsi
.LPRF_msg$13:
	movb	(%rdi,%rax), %r8b
	incq	%rax
	xorb	%r8b, 16(%rsp,%rsi)
	incq	%rsi
.LPRF_msg$11:
	cmpq	%rcx, %rax
	jb  	.LPRF_msg$12
	movq	$0, %rax
	movq	240(%rsp), %rdx
	movq	248(%rsp), %r8
	jmp 	.LPRF_msg$7
.LPRF_msg$8:
	cmpq	$136, %rsi
	jb  	.LPRF_msg$9
	movq	%rdx, 248(%rsp)
	movq	%rax, 240(%rsp)
	movq	%r8, 256(%rsp)
	leaq	16(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$10:
	leaq	208(%rsp), %rsp
	movq	248(%rsp), %rdx
	movq	240(%rsp), %rax
	movq	256(%rsp), %r8
	movq	$0, %rsi
.LPRF_msg$9:
	movb	(%rdx,%rax), %cl
	incq	%rax
	xorb	%cl, 16(%rsp,%rsi)
	incq	%rsi
.LPRF_msg$7:
	cmpq	%r8, %rax
	jb  	.LPRF_msg$8
	leaq	16(%rsp), %rax
	cmpq	$136, %rsi
	jb  	.LPRF_msg$5
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$6:
	leaq	208(%rsp), %rsp
	movq	$0, %rsi
.LPRF_msg$5:
	xorb	$31, 16(%rsp,%rsi)
	leaq	16(%rsp), %rax
	cmpq	$136, %rsi
	jb  	.LPRF_msg$3
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$4:
	leaq	208(%rsp), %rsp
.LPRF_msg$3:
	xorb	$128, 151(%rsp)
	leaq	16(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$2:
	leaq	208(%rsp), %rsp
	movq	216(%rsp), %rcx
	vmovdqu	16(%rsp), %xmm0
	vmovdqu	%xmm0, (%rcx)
	ret
.LH_msg$1:
	movq	%rdi, 216(%rsp)
	movq	%r11, 224(%rsp)
	movq	%rbx, 232(%rsp)
	movq	%rdx, 240(%rsp)
	movq	%rsi, 248(%rsp)
	leaq	16(%rsp), %rax
	xorl	%esi, %esi
	movq	%rsi, (%rax)
	movq	%rsi, 8(%rax)
	movq	%rsi, 16(%rax)
	movq	%rsi, 24(%rax)
	movq	%rsi, 32(%rax)
	movq	%rsi, 40(%rax)
	movq	%rsi, 48(%rax)
	movq	%rsi, 56(%rax)
	movq	%rsi, 64(%rax)
	movq	%rsi, 72(%rax)
	movq	%rsi, 80(%rax)
	movq	%rsi, 88(%rax)
	movq	%rsi, 96(%rax)
	movq	%rsi, 104(%rax)
	movq	%rsi, 112(%rax)
	movq	%rsi, 120(%rax)
	movq	%rsi, 128(%rax)
	movq	%rsi, 136(%rax)
	movq	%rsi, 144(%rax)
	movq	%rsi, 152(%rax)
	movq	%rsi, 160(%rax)
	movq	%rsi, 168(%rax)
	movq	%rsi, 176(%rax)
	movq	%rsi, 184(%rax)
	movq	%rsi, 192(%rax)
	vmovdqu	(%r8), %xmm0
	vmovdqu	%xmm0, 16(%rsp)
	vmovdqu	(%r10), %xmm0
	vmovdqu	%xmm0, 32(%rsp)
	vmovdqu	(%r9), %xmm0
	vmovdqu	%xmm0, 48(%rsp)
	movb	$0, 64(%rsp)
	movb	%bl, 65(%rsp)
	movq	$50, %rsi
	movq	$0, %rax
	movq	224(%rsp), %rdi
	movq	232(%rsp), %rcx
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %rsi
	jb  	.LH_msg$13
	movq	%rdi, 232(%rsp)
	movq	%rax, 224(%rsp)
	movq	%rcx, 256(%rsp)
	leaq	16(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$14:
	leaq	208(%rsp), %rsp
	movq	232(%rsp), %rdi
	movq	224(%rsp), %rax
	movq	256(%rsp), %rcx
	movq	$0, %rsi
.LH_msg$13:
	movb	(%rdi,%rax), %r8b
	incq	%rax
	xorb	%r8b, 16(%rsp,%rsi)
	incq	%rsi
.LH_msg$11:
	cmpq	%rcx, %rax
	jb  	.LH_msg$12
	movq	$0, %rax
	movq	240(%rsp), %rdx
	movq	248(%rsp), %r8
	jmp 	.LH_msg$7
.LH_msg$8:
	cmpq	$136, %rsi
	jb  	.LH_msg$9
	movq	%rdx, 248(%rsp)
	movq	%rax, 240(%rsp)
	movq	%r8, 256(%rsp)
	leaq	16(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$10:
	leaq	208(%rsp), %rsp
	movq	248(%rsp), %rdx
	movq	240(%rsp), %rax
	movq	256(%rsp), %r8
	movq	$0, %rsi
.LH_msg$9:
	movb	(%rdx,%rax), %cl
	incq	%rax
	xorb	%cl, 16(%rsp,%rsi)
	incq	%rsi
.LH_msg$7:
	cmpq	%r8, %rax
	jb  	.LH_msg$8
	leaq	16(%rsp), %rax
	cmpq	$136, %rsi
	jb  	.LH_msg$5
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$6:
	leaq	208(%rsp), %rsp
	movq	$0, %rsi
.LH_msg$5:
	xorb	$31, 16(%rsp,%rsi)
	leaq	16(%rsp), %rax
	cmpq	$136, %rsi
	jb  	.LH_msg$3
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$4:
	leaq	208(%rsp), %rsp
.LH_msg$3:
	xorb	$128, 151(%rsp)
	leaq	16(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$2:
	leaq	208(%rsp), %rsp
	movq	216(%rsp), %rcx
	movb	16(%rsp), %r8b
	movb	%r8b, (%rcx)
	movb	17(%rsp), %r8b
	movb	%r8b, 1(%rcx)
	movb	18(%rsp), %r8b
	movb	%r8b, 2(%rcx)
	movb	19(%rsp), %r8b
	movb	%r8b, 3(%rcx)
	movb	20(%rsp), %r8b
	movb	%r8b, 4(%rcx)
	movb	21(%rsp), %r8b
	movb	%r8b, 5(%rcx)
	movb	22(%rsp), %r8b
	movb	%r8b, 6(%rcx)
	movb	23(%rsp), %r8b
	movb	%r8b, 7(%rcx)
	movb	24(%rsp), %r8b
	movb	%r8b, 8(%rcx)
	movb	25(%rsp), %r8b
	movb	%r8b, 9(%rcx)
	movb	26(%rsp), %r8b
	movb	%r8b, 10(%rcx)
	movb	27(%rsp), %r8b
	movb	%r8b, 11(%rcx)
	movb	28(%rsp), %r8b
	movb	%r8b, 12(%rcx)
	movb	29(%rsp), %r8b
	movb	%r8b, 13(%rcx)
	movb	30(%rsp), %r8b
	movb	%r8b, 14(%rcx)
	movb	31(%rsp), %r8b
	movb	%r8b, 15(%rcx)
	movb	32(%rsp), %r8b
	movb	%r8b, 16(%rcx)
	movb	33(%rsp), %r8b
	movb	%r8b, 17(%rcx)
	movb	34(%rsp), %r8b
	movb	%r8b, 18(%rcx)
	movb	35(%rsp), %r8b
	movb	%r8b, 19(%rcx)
	movb	36(%rsp), %r8b
	movb	%r8b, 20(%rcx)
	movb	37(%rsp), %r8b
	movb	%r8b, 21(%rcx)
	movb	38(%rsp), %r8b
	movb	%r8b, 22(%rcx)
	movb	39(%rsp), %r8b
	movb	%r8b, 23(%rcx)
	movb	40(%rsp), %r8b
	movb	%r8b, 24(%rcx)
	movb	41(%rsp), %r8b
	movb	%r8b, 25(%rcx)
	movb	42(%rsp), %r8b
	movb	%r8b, 26(%rcx)
	movb	43(%rsp), %r8b
	movb	%r8b, 27(%rcx)
	movb	44(%rsp), %r8b
	movb	%r8b, 28(%rcx)
	movb	45(%rsp), %r8b
	movb	%r8b, 29(%rcx)
	movb	46(%rsp), %r8b
	movb	%r8b, 30(%rcx)
	movb	47(%rsp), %r8b
	movb	%r8b, 31(%rcx)
	movb	48(%rsp), %r8b
	movb	%r8b, 32(%rcx)
	movb	49(%rsp), %r8b
	movb	%r8b, 33(%rcx)
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
.L_keccakf1600_ref1$1:
	leaq	glob_data + 384(%rip), %rcx
	leaq	16(%rsp), %rdx
	movq	$0, %rsi
	jmp 	.L_keccakf1600_ref1$2
.L_keccakf1600_ref1$3:
	movq	(%rcx,%rsi,8), %rdi
	movq	%rdi, 8(%rsp)
	movq	(%rax), %r11
	movq	8(%rax), %r10
	movq	16(%rax), %rbx
	movq	24(%rax), %rbp
	movq	32(%rax), %r12
	xorq	40(%rax), %r11
	xorq	48(%rax), %r10
	xorq	56(%rax), %rbx
	xorq	64(%rax), %rbp
	xorq	72(%rax), %r12
	xorq	80(%rax), %r11
	xorq	88(%rax), %r10
	xorq	96(%rax), %rbx
	xorq	104(%rax), %rbp
	xorq	112(%rax), %r12
	xorq	120(%rax), %r11
	xorq	128(%rax), %r10
	xorq	136(%rax), %rbx
	xorq	144(%rax), %rbp
	xorq	152(%rax), %r12
	xorq	160(%rax), %r11
	xorq	168(%rax), %r10
	xorq	176(%rax), %rbx
	xorq	184(%rax), %rbp
	xorq	192(%rax), %r12
	movq	%r10, %rdi
	movq	%rdi, %r8
	shrq	$63, %r8
	shlq	$1, %rdi
	orq 	%r8, %rdi
	xorq	%r12, %rdi
	movq	%rbx, %r8
	movq	%r8, %r9
	shrq	$63, %r9
	shlq	$1, %r8
	orq 	%r9, %r8
	xorq	%r11, %r8
	movq	%rbp, %r9
	movq	%r9, %r13
	shrq	$63, %r13
	shlq	$1, %r9
	orq 	%r13, %r9
	xorq	%r10, %r9
	movq	%r12, %r10
	movq	%r10, %r13
	shrq	$63, %r13
	shlq	$1, %r10
	orq 	%r13, %r10
	xorq	%rbx, %r10
	movq	%r11, %r13
	shrq	$63, %r13
	shlq	$1, %r11
	orq 	%r13, %r11
	xorq	%rbp, %r11
	movq	(%rax), %rbx
	xorq	%rdi, %rbx
	movq	48(%rax), %rbp
	xorq	%r8, %rbp
	movq	%rbp, %r13
	shrq	$20, %r13
	shlq	$44, %rbp
	orq 	%r13, %rbp
	movq	96(%rax), %r12
	xorq	%r9, %r12
	movq	%r12, %r13
	shrq	$21, %r13
	shlq	$43, %r12
	orq 	%r13, %r12
	movq	144(%rax), %r13
	xorq	%r10, %r13
	movq	%r13, %r14
	shrq	$43, %r14
	shlq	$21, %r13
	orq 	%r14, %r13
	movq	192(%rax), %r14
	xorq	%r11, %r14
	movq	%r14, %r15
	shrq	$50, %r15
	shlq	$14, %r14
	orq 	%r15, %r14
	movq	%rbp, %r15
	notq	%r15
	andq	%r12, %r15
	xorq	%rbx, %r15
	xorq	8(%rsp), %r15
	movq	%r15, (%rdx)
	movq	%r12, %r15
	notq	%r15
	andq	%r13, %r15
	xorq	%rbp, %r15
	movq	%r15, 8(%rdx)
	movq	%r13, %r15
	notq	%r15
	andq	%r14, %r15
	xorq	%r12, %r15
	movq	%r15, 16(%rdx)
	movq	%r14, %r15
	notq	%r15
	andq	%rbx, %r15
	xorq	%r13, %r15
	movq	%r15, 24(%rdx)
	notq	%rbx
	andq	%rbp, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 32(%rdx)
	movq	24(%rax), %rbx
	xorq	%r10, %rbx
	movq	%rbx, %r13
	shrq	$36, %r13
	shlq	$28, %rbx
	orq 	%r13, %rbx
	movq	72(%rax), %rbp
	xorq	%r11, %rbp
	movq	%rbp, %r13
	shrq	$44, %r13
	shlq	$20, %rbp
	orq 	%r13, %rbp
	movq	80(%rax), %r12
	xorq	%rdi, %r12
	movq	%r12, %r13
	shrq	$61, %r13
	shlq	$3, %r12
	orq 	%r13, %r12
	movq	128(%rax), %r13
	xorq	%r8, %r13
	movq	%r13, %r14
	shrq	$19, %r14
	shlq	$45, %r13
	orq 	%r14, %r13
	movq	176(%rax), %r14
	xorq	%r9, %r14
	movq	%r14, %r15
	shrq	$3, %r15
	shlq	$61, %r14
	orq 	%r15, %r14
	movq	%rbp, %r15
	notq	%r15
	andq	%r12, %r15
	xorq	%rbx, %r15
	movq	%r15, 40(%rdx)
	movq	%r12, %r15
	notq	%r15
	andq	%r13, %r15
	xorq	%rbp, %r15
	movq	%r15, 48(%rdx)
	movq	%r13, %r15
	notq	%r15
	andq	%r14, %r15
	xorq	%r12, %r15
	movq	%r15, 56(%rdx)
	movq	%r14, %r15
	notq	%r15
	andq	%rbx, %r15
	xorq	%r13, %r15
	movq	%r15, 64(%rdx)
	notq	%rbx
	andq	%rbp, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 72(%rdx)
	movq	8(%rax), %rbx
	xorq	%r8, %rbx
	movq	%rbx, %r13
	shrq	$63, %r13
	shlq	$1, %rbx
	orq 	%r13, %rbx
	movq	56(%rax), %rbp
	xorq	%r9, %rbp
	movq	%rbp, %r13
	shrq	$58, %r13
	shlq	$6, %rbp
	orq 	%r13, %rbp
	movq	104(%rax), %r12
	xorq	%r10, %r12
	movq	%r12, %r13
	shrq	$39, %r13
	shlq	$25, %r12
	orq 	%r13, %r12
	movq	152(%rax), %r13
	xorq	%r11, %r13
	movq	%r13, %r14
	shrq	$56, %r14
	shlq	$8, %r13
	orq 	%r14, %r13
	movq	160(%rax), %r14
	xorq	%rdi, %r14
	movq	%r14, %r15
	shrq	$46, %r15
	shlq	$18, %r14
	orq 	%r15, %r14
	movq	%rbp, %r15
	notq	%r15
	andq	%r12, %r15
	xorq	%rbx, %r15
	movq	%r15, 80(%rdx)
	movq	%r12, %r15
	notq	%r15
	andq	%r13, %r15
	xorq	%rbp, %r15
	movq	%r15, 88(%rdx)
	movq	%r13, %r15
	notq	%r15
	andq	%r14, %r15
	xorq	%r12, %r15
	movq	%r15, 96(%rdx)
	movq	%r14, %r15
	notq	%r15
	andq	%rbx, %r15
	xorq	%r13, %r15
	movq	%r15, 104(%rdx)
	notq	%rbx
	andq	%rbp, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 112(%rdx)
	movq	32(%rax), %rbx
	xorq	%r11, %rbx
	movq	%rbx, %r13
	shrq	$37, %r13
	shlq	$27, %rbx
	orq 	%r13, %rbx
	movq	40(%rax), %rbp
	xorq	%rdi, %rbp
	movq	%rbp, %r13
	shrq	$28, %r13
	shlq	$36, %rbp
	orq 	%r13, %rbp
	movq	88(%rax), %r12
	xorq	%r8, %r12
	movq	%r12, %r13
	shrq	$54, %r13
	shlq	$10, %r12
	orq 	%r13, %r12
	movq	136(%rax), %r13
	xorq	%r9, %r13
	movq	%r13, %r14
	shrq	$49, %r14
	shlq	$15, %r13
	orq 	%r14, %r13
	movq	184(%rax), %r14
	xorq	%r10, %r14
	movq	%r14, %r15
	shrq	$8, %r15
	shlq	$56, %r14
	orq 	%r15, %r14
	movq	%rbp, %r15
	notq	%r15
	andq	%r12, %r15
	xorq	%rbx, %r15
	movq	%r15, 120(%rdx)
	movq	%r12, %r15
	notq	%r15
	andq	%r13, %r15
	xorq	%rbp, %r15
	movq	%r15, 128(%rdx)
	movq	%r13, %r15
	notq	%r15
	andq	%r14, %r15
	xorq	%r12, %r15
	movq	%r15, 136(%rdx)
	movq	%r14, %r15
	notq	%r15
	andq	%rbx, %r15
	xorq	%r13, %r15
	movq	%r15, 144(%rdx)
	notq	%rbx
	andq	%rbp, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 152(%rdx)
	movq	16(%rax), %rbx
	xorq	%r9, %rbx
	movq	%rbx, %r9
	shrq	$2, %r9
	shlq	$62, %rbx
	orq 	%r9, %rbx
	movq	64(%rax), %r9
	xorq	%r10, %r9
	movq	%r9, %r10
	shrq	$9, %r10
	shlq	$55, %r9
	orq 	%r10, %r9
	movq	112(%rax), %r10
	xorq	%r11, %r10
	movq	%r10, %r11
	shrq	$25, %r11
	shlq	$39, %r10
	orq 	%r11, %r10
	movq	120(%rax), %r11
	xorq	%rdi, %r11
	movq	%r11, %rdi
	shrq	$23, %rdi
	shlq	$41, %r11
	orq 	%rdi, %r11
	movq	168(%rax), %rdi
	xorq	%r8, %rdi
	movq	%rdi, %r8
	shrq	$62, %r8
	shlq	$2, %rdi
	orq 	%r8, %rdi
	movq	%r9, %r8
	notq	%r8
	andq	%r10, %r8
	xorq	%rbx, %r8
	movq	%r8, 160(%rdx)
	movq	%r10, %r8
	notq	%r8
	andq	%r11, %r8
	xorq	%r9, %r8
	movq	%r8, 168(%rdx)
	movq	%r11, %r8
	notq	%r8
	andq	%rdi, %r8
	xorq	%r10, %r8
	movq	%r8, 176(%rdx)
	movq	%rdi, %r8
	notq	%r8
	andq	%rbx, %r8
	xorq	%r11, %r8
	movq	%r8, 184(%rdx)
	notq	%rbx
	andq	%r9, %rbx
	xorq	%rdi, %rbx
	movq	%rbx, 192(%rdx)
	movq	8(%rcx,%rsi,8), %rdi
	movq	%rdi, 8(%rsp)
	movq	(%rdx), %r11
	movq	8(%rdx), %r10
	movq	16(%rdx), %rbx
	movq	24(%rdx), %rbp
	movq	32(%rdx), %r12
	xorq	40(%rdx), %r11
	xorq	48(%rdx), %r10
	xorq	56(%rdx), %rbx
	xorq	64(%rdx), %rbp
	xorq	72(%rdx), %r12
	xorq	80(%rdx), %r11
	xorq	88(%rdx), %r10
	xorq	96(%rdx), %rbx
	xorq	104(%rdx), %rbp
	xorq	112(%rdx), %r12
	xorq	120(%rdx), %r11
	xorq	128(%rdx), %r10
	xorq	136(%rdx), %rbx
	xorq	144(%rdx), %rbp
	xorq	152(%rdx), %r12
	xorq	160(%rdx), %r11
	xorq	168(%rdx), %r10
	xorq	176(%rdx), %rbx
	xorq	184(%rdx), %rbp
	xorq	192(%rdx), %r12
	movq	%r10, %rdi
	movq	%rdi, %r8
	shrq	$63, %r8
	shlq	$1, %rdi
	orq 	%r8, %rdi
	xorq	%r12, %rdi
	movq	%rbx, %r8
	movq	%r8, %r9
	shrq	$63, %r9
	shlq	$1, %r8
	orq 	%r9, %r8
	xorq	%r11, %r8
	movq	%rbp, %r9
	movq	%r9, %r13
	shrq	$63, %r13
	shlq	$1, %r9
	orq 	%r13, %r9
	xorq	%r10, %r9
	movq	%r12, %r10
	movq	%r10, %r13
	shrq	$63, %r13
	shlq	$1, %r10
	orq 	%r13, %r10
	xorq	%rbx, %r10
	movq	%r11, %r13
	shrq	$63, %r13
	shlq	$1, %r11
	orq 	%r13, %r11
	xorq	%rbp, %r11
	movq	(%rdx), %rbx
	xorq	%rdi, %rbx
	movq	48(%rdx), %rbp
	xorq	%r8, %rbp
	movq	%rbp, %r13
	shrq	$20, %r13
	shlq	$44, %rbp
	orq 	%r13, %rbp
	movq	96(%rdx), %r12
	xorq	%r9, %r12
	movq	%r12, %r13
	shrq	$21, %r13
	shlq	$43, %r12
	orq 	%r13, %r12
	movq	144(%rdx), %r13
	xorq	%r10, %r13
	movq	%r13, %r14
	shrq	$43, %r14
	shlq	$21, %r13
	orq 	%r14, %r13
	movq	192(%rdx), %r14
	xorq	%r11, %r14
	movq	%r14, %r15
	shrq	$50, %r15
	shlq	$14, %r14
	orq 	%r15, %r14
	movq	%rbp, %r15
	notq	%r15
	andq	%r12, %r15
	xorq	%rbx, %r15
	xorq	8(%rsp), %r15
	movq	%r15, (%rax)
	movq	%r12, %r15
	notq	%r15
	andq	%r13, %r15
	xorq	%rbp, %r15
	movq	%r15, 8(%rax)
	movq	%r13, %r15
	notq	%r15
	andq	%r14, %r15
	xorq	%r12, %r15
	movq	%r15, 16(%rax)
	movq	%r14, %r15
	notq	%r15
	andq	%rbx, %r15
	xorq	%r13, %r15
	movq	%r15, 24(%rax)
	notq	%rbx
	andq	%rbp, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 32(%rax)
	movq	24(%rdx), %rbx
	xorq	%r10, %rbx
	movq	%rbx, %r13
	shrq	$36, %r13
	shlq	$28, %rbx
	orq 	%r13, %rbx
	movq	72(%rdx), %rbp
	xorq	%r11, %rbp
	movq	%rbp, %r13
	shrq	$44, %r13
	shlq	$20, %rbp
	orq 	%r13, %rbp
	movq	80(%rdx), %r12
	xorq	%rdi, %r12
	movq	%r12, %r13
	shrq	$61, %r13
	shlq	$3, %r12
	orq 	%r13, %r12
	movq	128(%rdx), %r13
	xorq	%r8, %r13
	movq	%r13, %r14
	shrq	$19, %r14
	shlq	$45, %r13
	orq 	%r14, %r13
	movq	176(%rdx), %r14
	xorq	%r9, %r14
	movq	%r14, %r15
	shrq	$3, %r15
	shlq	$61, %r14
	orq 	%r15, %r14
	movq	%rbp, %r15
	notq	%r15
	andq	%r12, %r15
	xorq	%rbx, %r15
	movq	%r15, 40(%rax)
	movq	%r12, %r15
	notq	%r15
	andq	%r13, %r15
	xorq	%rbp, %r15
	movq	%r15, 48(%rax)
	movq	%r13, %r15
	notq	%r15
	andq	%r14, %r15
	xorq	%r12, %r15
	movq	%r15, 56(%rax)
	movq	%r14, %r15
	notq	%r15
	andq	%rbx, %r15
	xorq	%r13, %r15
	movq	%r15, 64(%rax)
	notq	%rbx
	andq	%rbp, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 72(%rax)
	movq	8(%rdx), %rbx
	xorq	%r8, %rbx
	movq	%rbx, %r13
	shrq	$63, %r13
	shlq	$1, %rbx
	orq 	%r13, %rbx
	movq	56(%rdx), %rbp
	xorq	%r9, %rbp
	movq	%rbp, %r13
	shrq	$58, %r13
	shlq	$6, %rbp
	orq 	%r13, %rbp
	movq	104(%rdx), %r12
	xorq	%r10, %r12
	movq	%r12, %r13
	shrq	$39, %r13
	shlq	$25, %r12
	orq 	%r13, %r12
	movq	152(%rdx), %r13
	xorq	%r11, %r13
	movq	%r13, %r14
	shrq	$56, %r14
	shlq	$8, %r13
	orq 	%r14, %r13
	movq	160(%rdx), %r14
	xorq	%rdi, %r14
	movq	%r14, %r15
	shrq	$46, %r15
	shlq	$18, %r14
	orq 	%r15, %r14
	movq	%rbp, %r15
	notq	%r15
	andq	%r12, %r15
	xorq	%rbx, %r15
	movq	%r15, 80(%rax)
	movq	%r12, %r15
	notq	%r15
	andq	%r13, %r15
	xorq	%rbp, %r15
	movq	%r15, 88(%rax)
	movq	%r13, %r15
	notq	%r15
	andq	%r14, %r15
	xorq	%r12, %r15
	movq	%r15, 96(%rax)
	movq	%r14, %r15
	notq	%r15
	andq	%rbx, %r15
	xorq	%r13, %r15
	movq	%r15, 104(%rax)
	notq	%rbx
	andq	%rbp, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 112(%rax)
	movq	32(%rdx), %rbx
	xorq	%r11, %rbx
	movq	%rbx, %r13
	shrq	$37, %r13
	shlq	$27, %rbx
	orq 	%r13, %rbx
	movq	40(%rdx), %rbp
	xorq	%rdi, %rbp
	movq	%rbp, %r13
	shrq	$28, %r13
	shlq	$36, %rbp
	orq 	%r13, %rbp
	movq	88(%rdx), %r12
	xorq	%r8, %r12
	movq	%r12, %r13
	shrq	$54, %r13
	shlq	$10, %r12
	orq 	%r13, %r12
	movq	136(%rdx), %r13
	xorq	%r9, %r13
	movq	%r13, %r14
	shrq	$49, %r14
	shlq	$15, %r13
	orq 	%r14, %r13
	movq	184(%rdx), %r14
	xorq	%r10, %r14
	movq	%r14, %r15
	shrq	$8, %r15
	shlq	$56, %r14
	orq 	%r15, %r14
	movq	%rbp, %r15
	notq	%r15
	andq	%r12, %r15
	xorq	%rbx, %r15
	movq	%r15, 120(%rax)
	movq	%r12, %r15
	notq	%r15
	andq	%r13, %r15
	xorq	%rbp, %r15
	movq	%r15, 128(%rax)
	movq	%r13, %r15
	notq	%r15
	andq	%r14, %r15
	xorq	%r12, %r15
	movq	%r15, 136(%rax)
	movq	%r14, %r15
	notq	%r15
	andq	%rbx, %r15
	xorq	%r13, %r15
	movq	%r15, 144(%rax)
	notq	%rbx
	andq	%rbp, %rbx
	xorq	%r14, %rbx
	movq	%rbx, 152(%rax)
	movq	16(%rdx), %rbx
	xorq	%r9, %rbx
	movq	%rbx, %r9
	shrq	$2, %r9
	shlq	$62, %rbx
	orq 	%r9, %rbx
	movq	64(%rdx), %r9
	xorq	%r10, %r9
	movq	%r9, %r10
	shrq	$9, %r10
	shlq	$55, %r9
	orq 	%r10, %r9
	movq	112(%rdx), %r10
	xorq	%r11, %r10
	movq	%r10, %r11
	shrq	$25, %r11
	shlq	$39, %r10
	orq 	%r11, %r10
	movq	120(%rdx), %r11
	xorq	%rdi, %r11
	movq	%r11, %rdi
	shrq	$23, %rdi
	shlq	$41, %r11
	orq 	%rdi, %r11
	movq	168(%rdx), %rdi
	xorq	%r8, %rdi
	movq	%rdi, %r8
	shrq	$62, %r8
	shlq	$2, %rdi
	orq 	%r8, %rdi
	movq	%r9, %r8
	notq	%r8
	andq	%r10, %r8
	xorq	%rbx, %r8
	movq	%r8, 160(%rax)
	movq	%r10, %r8
	notq	%r8
	andq	%r11, %r8
	xorq	%r9, %r8
	movq	%r8, 168(%rax)
	movq	%r11, %r8
	notq	%r8
	andq	%rdi, %r8
	xorq	%r10, %r8
	movq	%r8, 176(%rax)
	movq	%rdi, %r8
	notq	%r8
	andq	%rbx, %r8
	xorq	%r11, %r8
	movq	%r8, 184(%rax)
	notq	%rbx
	andq	%r9, %rbx
	xorq	%rdi, %rbx
	movq	%rbx, 192(%rax)
	addq	$2, %rsi
.L_keccakf1600_ref1$2:
	cmpq	$23, %rsi
	jb  	.L_keccakf1600_ref1$3
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
