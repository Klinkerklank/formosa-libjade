	.att_syntax
	.text
	.p2align	5
	.global	slh_dsa_shake256f_verify
	.global	slh_dsa_shake256f_sign
	.global	slh_dsa_shake256f_keygen
	.type	slh_dsa_shake256f_verify, %function
slh_dsa_shake256f_verify:
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
	jbe 	.Lslh_dsa_shake256f_verify$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake256f_verify$2
.Lslh_dsa_shake256f_verify$1:
	movq	%rsi, %rcx
	movq	%r9, %rsi
	leaq	-184(%rsp), %rsp
	call	.Lslh_verify_internal_$1
.Lslh_dsa_shake256f_verify$3:
	leaq	184(%rsp), %rsp
.Lslh_dsa_shake256f_verify$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake256f_sign, %function
slh_dsa_shake256f_sign:
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
	jbe 	.Lslh_dsa_shake256f_sign$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake256f_sign$2
.Lslh_dsa_shake256f_sign$1:
	movq	%rdi, %rcx
	movq	%r10, %rdi
	leaq	-216(%rsp), %rsp
	call	.Lslh_sign_internal_$1
.Lslh_dsa_shake256f_sign$3:
	leaq	216(%rsp), %rsp
	movq	%rcx, %rax
.Lslh_dsa_shake256f_sign$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake256f_keygen, %function
slh_dsa_shake256f_keygen:
	movq	%rsp, %rax
	leaq	-8(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rax, (%rsp)
	movq	%rdx, %rax
	leaq	-56(%rsp), %rsp
	call	.Lslh_keygen_internal_$1
.Lslh_dsa_shake256f_keygen$1:
	leaq	56(%rsp), %rsp
	movq	(%rsp), %rsp
	ret
.Lslh_verify_internal_$1:
	leaq	88(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movq	%rdi, %r9
	leaq	32(%rdi), %r10
	movq	%r8, %r11
	movq	%r9, 64(%rsp)
	movq	%r10, 72(%rsp)
	movq	%r8, 80(%rsp)
	leaq	136(%rsp), %rdi
	movq	%r11, %r8
	movq	%rax, %r11
	movq	%rcx, %rbx
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_verify_internal_$4:
	leaq	280(%rsp), %rsp
	movq	64(%rsp), %r9
	movq	72(%rsp), %rax
	movq	80(%rsp), %rcx
	leaq	136(%rsp), %rdx
	leaq	176(%rsp), %rsi
	leaq	184(%rsp), %rdi
	movl	$0, 124(%rsp)
	movl	$0, 128(%rsp)
	movl	$0, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	(%rsi), %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	1(%rsi), %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	2(%rsi), %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	3(%rsi), %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	4(%rsi), %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	5(%rsi), %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	6(%rsi), %r8d
	orl 	%r8d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	7(%rsi), %r8d
	orl 	%r8d, 132(%rsp)
	movl	$0, 124(%rsp)
	andl	$-1, 128(%rsp)
	movl	$0, %esi
	shll	$8, %esi
	movzbl	(%rdi), %r8d
	orl 	%r8d, %esi
	andl	$15, %esi
	leaq	88(%rsp), %r10
	movl	124(%rsp), %edi
	movl	%edi, 4(%r10)
	movl	128(%rsp), %edi
	movl	%edi, 8(%r10)
	movl	132(%rsp), %edi
	movl	%edi, 12(%r10)
	leaq	88(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$3, 16(%r10)
	leaq	88(%rsp), %r10
	movl	%esi, 20(%r10)
	leaq	32(%rcx), %r8
	movq	%r9, 80(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rcx, 64(%rsp)
	movl	%esi, 120(%rsp)
	leaq	32(%rsp), %rax
	leaq	88(%rsp), %r10
	leaq	-1496(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	1496(%rsp), %rsp
	movq	80(%rsp), %r9
	movq	72(%rsp), %r10
	movq	64(%rsp), %rax
	movl	120(%rsp), %edx
	leaq	32(%rsp), %rcx
	leaq	11232(%rax), %rsi
	leaq	124(%rsp), %rdi
	movq	%rcx, %rax
	movq	%rsi, %rcx
	leaq	-152(%rsp), %rsp
	call	.Lht_verify$1
.Lslh_verify_internal_$2:
	leaq	152(%rsp), %rsp
	ret
.Lslh_sign_internal_$1:
	leaq	112(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movq	%rcx, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%r8, 88(%rsp)
	leaq	32(%rsi), %r10
	movq	%rax, %r11
	movq	%rax, 96(%rsp)
	movq	%rsi, 104(%rsp)
	leaq	-280(%rsp), %rsp
	call	.LPRF_msg$1
.Lslh_sign_internal_$6:
	leaq	280(%rsp), %rsp
	movq	%rcx, %r8
	movq	96(%rsp), %rax
	movq	104(%rsp), %rcx
	movq	64(%rsp), %r11
	movq	72(%rsp), %rbx
	movq	80(%rsp), %rdx
	movq	88(%rsp), %rsi
	leaq	64(%rcx), %r9
	leaq	96(%rcx), %r10
	movq	%r9, 88(%rsp)
	movq	%rax, 80(%rsp)
	movq	%rcx, 72(%rsp)
	leaq	160(%rsp), %rdi
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_sign_internal_$5:
	leaq	280(%rsp), %rsp
	movq	88(%rsp), %r9
	movq	80(%rsp), %rax
	movq	72(%rsp), %rsi
	leaq	160(%rsp), %rdx
	leaq	200(%rsp), %rcx
	leaq	208(%rsp), %rdi
	movl	$0, 148(%rsp)
	movl	$0, 152(%rsp)
	movl	$0, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	(%rcx), %r8d
	orl 	%r8d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	1(%rcx), %r8d
	orl 	%r8d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	2(%rcx), %r8d
	orl 	%r8d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	3(%rcx), %r8d
	orl 	%r8d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	4(%rcx), %r8d
	orl 	%r8d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	5(%rcx), %r8d
	orl 	%r8d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	6(%rcx), %r8d
	orl 	%r8d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r8d
	shrl	$24, %r8d
	orl 	%r8d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	7(%rcx), %r8d
	orl 	%r8d, 156(%rsp)
	movl	$0, 148(%rsp)
	andl	$-1, 152(%rsp)
	movl	$0, %ecx
	shll	$8, %ecx
	movzbl	(%rdi), %r8d
	orl 	%r8d, %ecx
	andl	$15, %ecx
	leaq	112(%rsp), %r10
	movl	148(%rsp), %edi
	movl	%edi, 4(%r10)
	movl	152(%rsp), %edi
	movl	%edi, 8(%r10)
	movl	156(%rsp), %edi
	movl	%edi, 12(%r10)
	leaq	112(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$3, 16(%r10)
	leaq	112(%rsp), %r10
	movl	%ecx, 20(%r10)
	leaq	32(%rax), %r8
	movq	%rsi, 72(%rsp)
	movq	%r9, 80(%rsp)
	movq	%rax, 88(%rsp)
	movq	%rdx, 64(%rsp)
	movl	%ecx, 144(%rsp)
	leaq	112(%rsp), %r10
	movq	%rsi, %r11
	leaq	-216(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	216(%rsp), %rsp
	movq	72(%rsp), %rsi
	movq	80(%rsp), %r9
	movq	88(%rsp), %rax
	movq	64(%rsp), %rdx
	movl	144(%rsp), %ecx
	movq	%rsi, 64(%rsp)
	movq	%r9, 88(%rsp)
	movq	%rax, 80(%rsp)
	movl	%ecx, 144(%rsp)
	leaq	32(%rsp), %rax
	leaq	112(%rsp), %r10
	leaq	-1496(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	1496(%rsp), %rsp
	movq	64(%rsp), %r11
	movq	88(%rsp), %r9
	movq	80(%rsp), %rax
	movl	144(%rsp), %esi
	leaq	11232(%rax), %rcx
	movq	%rax, 80(%rsp)
	leaq	32(%rsp), %rax
	leaq	148(%rsp), %rdi
	leaq	-152(%rsp), %rsp
	call	.Lht_sign$1
.Lslh_sign_internal_$2:
	leaq	152(%rsp), %rsp
	movq	80(%rsp), %rax
	movq	$0, %rcx
	ret
.Lslh_keygen_internal_$1:
	movq	%rsi, %r11
	movq	%rax, %r8
	movq	(%r8), %rdx
	movq	%rdx, (%r11)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%r11)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%r11)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%r11)
	leaq	32(%rsi), %r11
	leaq	32(%rax), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%r11)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%r11)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%r11)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%r11)
	leaq	64(%rsi), %r11
	leaq	64(%rax), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%r11)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%r11)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%r11)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%r11)
	movq	%rdi, %r11
	leaq	64(%rax), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%r11)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%r11)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%r11)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%r11)
	movq	%rsi, %r11
	leaq	64(%rsi), %r9
	leaq	24(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$16, %eax
	leaq	24(%rsp), %r10
	movl	%eax, (%r10)
	movl	$0, %r8d
	movl	$4, %eax
	leaq	96(%rsi), %rcx
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %r10
	movl	%eax, %edx
	leaq	-1144(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	1144(%rsp), %rsp
	movq	%rcx, %rax
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdi
	leaq	32(%rdi), %r11
	movq	(%rax), %rdx
	movq	%rdx, (%r11)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%r11)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%r11)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%r11)
	ret
.Lfors_pkfromsig$1:
	movq	%rax, 1280(%rsp)
	leaq	1344(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lfors_pkfromsig$79
.Lfors_pkfromsig$80:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$79:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$80
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, (%rax)
	jmp 	.Lfors_pkfromsig$77
.Lfors_pkfromsig$78:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$77:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$78
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 4(%rax)
	jmp 	.Lfors_pkfromsig$75
.Lfors_pkfromsig$76:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$75:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$76
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 8(%rax)
	jmp 	.Lfors_pkfromsig$73
.Lfors_pkfromsig$74:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$73:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$74
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 12(%rax)
	jmp 	.Lfors_pkfromsig$71
.Lfors_pkfromsig$72:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$71:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$72
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 16(%rax)
	jmp 	.Lfors_pkfromsig$69
.Lfors_pkfromsig$70:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$69:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$70
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 20(%rax)
	jmp 	.Lfors_pkfromsig$67
.Lfors_pkfromsig$68:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$67:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$68
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 24(%rax)
	jmp 	.Lfors_pkfromsig$65
.Lfors_pkfromsig$66:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$65:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$66
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 28(%rax)
	jmp 	.Lfors_pkfromsig$63
.Lfors_pkfromsig$64:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$63:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$64
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 32(%rax)
	jmp 	.Lfors_pkfromsig$61
.Lfors_pkfromsig$62:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$61:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$62
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 36(%rax)
	jmp 	.Lfors_pkfromsig$59
.Lfors_pkfromsig$60:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$59:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$60
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 40(%rax)
	jmp 	.Lfors_pkfromsig$57
.Lfors_pkfromsig$58:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$57:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$58
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 44(%rax)
	jmp 	.Lfors_pkfromsig$55
.Lfors_pkfromsig$56:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$55:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$56
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 48(%rax)
	jmp 	.Lfors_pkfromsig$53
.Lfors_pkfromsig$54:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$53:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$54
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 52(%rax)
	jmp 	.Lfors_pkfromsig$51
.Lfors_pkfromsig$52:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$51:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$52
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 56(%rax)
	jmp 	.Lfors_pkfromsig$49
.Lfors_pkfromsig$50:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$49:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$50
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 60(%rax)
	jmp 	.Lfors_pkfromsig$47
.Lfors_pkfromsig$48:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$47:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$48
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 64(%rax)
	jmp 	.Lfors_pkfromsig$45
.Lfors_pkfromsig$46:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$45:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$46
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 68(%rax)
	jmp 	.Lfors_pkfromsig$43
.Lfors_pkfromsig$44:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$43:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$44
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 72(%rax)
	jmp 	.Lfors_pkfromsig$41
.Lfors_pkfromsig$42:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$41:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$42
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 76(%rax)
	jmp 	.Lfors_pkfromsig$39
.Lfors_pkfromsig$40:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$39:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$40
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 80(%rax)
	jmp 	.Lfors_pkfromsig$37
.Lfors_pkfromsig$38:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$37:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$38
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 84(%rax)
	jmp 	.Lfors_pkfromsig$35
.Lfors_pkfromsig$36:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$35:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$36
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 88(%rax)
	jmp 	.Lfors_pkfromsig$33
.Lfors_pkfromsig$34:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$33:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$34
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 92(%rax)
	jmp 	.Lfors_pkfromsig$31
.Lfors_pkfromsig$32:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$31:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$32
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 96(%rax)
	jmp 	.Lfors_pkfromsig$29
.Lfors_pkfromsig$30:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$29:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$30
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 100(%rax)
	jmp 	.Lfors_pkfromsig$27
.Lfors_pkfromsig$28:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$27:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$28
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 104(%rax)
	jmp 	.Lfors_pkfromsig$25
.Lfors_pkfromsig$26:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$25:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$26
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 108(%rax)
	jmp 	.Lfors_pkfromsig$23
.Lfors_pkfromsig$24:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$23:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$24
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 112(%rax)
	jmp 	.Lfors_pkfromsig$21
.Lfors_pkfromsig$22:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$21:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$22
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 116(%rax)
	jmp 	.Lfors_pkfromsig$19
.Lfors_pkfromsig$20:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$19:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$20
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 120(%rax)
	jmp 	.Lfors_pkfromsig$17
.Lfors_pkfromsig$18:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$17:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$18
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 124(%rax)
	jmp 	.Lfors_pkfromsig$15
.Lfors_pkfromsig$16:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$15:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$16
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 128(%rax)
	jmp 	.Lfors_pkfromsig$13
.Lfors_pkfromsig$14:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$13:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$14
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 132(%rax)
	jmp 	.Lfors_pkfromsig$11
.Lfors_pkfromsig$12:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$11:
	cmpl	$9, %ecx
	jb  	.Lfors_pkfromsig$12
	movl	%edi, %r11d
	addl	$-9, %ecx
	shrq	%cl, %r11
	andq	$511, %r11
	movl	%r11d, 136(%rax)
	movq	$0, %rcx
	movq	$0, %rdx
	movq	$0, %rax
	jmp 	.Lfors_pkfromsig$3
.Lfors_pkfromsig$4:
	movq	%rdx, 1288(%rsp)
	leaq	(%r8,%rcx), %rsi
	leaq	64(%rsp), %rdi
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%rdi)
	movq	16(%rsi), %rdx
	movq	%rdx, 16(%rdi)
	movq	24(%rsi), %rdx
	movq	%rdx, 24(%rdi)
	movl	$0, %edx
	movl	%edx, 24(%r10)
	movl	%eax, %esi
	shll	$9, %esi
	addl	1344(%rsp,%rax,4), %esi
	movl	%esi, 28(%r10)
	movq	%r9, 1296(%rsp)
	movq	%r10, 1304(%rsp)
	movq	%r8, 1312(%rsp)
	movq	%rax, 1320(%rsp)
	movq	%rcx, 1328(%rsp)
	leaq	64(%rsp), %rdi
	movq	%r9, %rdx
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	56(%rsp), %rsp
	movq	1296(%rsp), %r9
	movq	1304(%rsp), %r10
	movq	1312(%rsp), %r8
	movq	1320(%rsp), %rax
	movq	1328(%rsp), %rcx
	addq	$32, %rcx
	movl	1344(%rsp,%rax,4), %esi
	movl	$0, %edi
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movl	%edi, %edx
	incl	%edx
	movl	%edx, 24(%r10)
	movl	%esi, %edx
	andl	$1, %edx
	movl	%edi, 1336(%rsp)
	movl	%esi, 1340(%rsp)
	cmpl	$0, %edx
	je  	.Lfors_pkfromsig$8
	movl	28(%r10), %esi
	decl	%esi
	shrl	$1, %esi
	movl	%esi, 28(%r10)
	leaq	1248(%rsp), %rdi
	leaq	(%r8,%rcx), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%rdi)
	movq	16(%rsi), %rdx
	movq	%rdx, 16(%rdi)
	movq	24(%rsi), %rdx
	movq	%rdx, 24(%rdi)
	leaq	1216(%rsp), %rdi
	leaq	64(%rsp), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%rdi)
	movq	16(%rsi), %rdx
	movq	%rdx, 16(%rdi)
	movq	24(%rsi), %rdx
	movq	%rdx, 24(%rdi)
	jmp 	.Lfors_pkfromsig$9
.Lfors_pkfromsig$8:
	movl	28(%r10), %esi
	shrl	$1, %esi
	movl	%esi, 28(%r10)
	leaq	1248(%rsp), %rdi
	leaq	64(%rsp), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%rdi)
	movq	16(%rsi), %rdx
	movq	%rdx, 16(%rdi)
	movq	24(%rsi), %rdx
	movq	%rdx, 24(%rdi)
	leaq	1216(%rsp), %rdi
	leaq	(%r8,%rcx), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%rdi)
	movq	16(%rsi), %rdx
	movq	%rdx, 16(%rdi)
	movq	24(%rsi), %rdx
	movq	%rdx, 24(%rdi)
.Lfors_pkfromsig$9:
	movq	%r9, 1328(%rsp)
	movq	%r10, 1320(%rsp)
	movq	%r8, 1312(%rsp)
	movq	%rax, 1304(%rsp)
	movq	%rcx, 1296(%rsp)
	leaq	32(%rsp), %rdi
	leaq	1248(%rsp), %rcx
	leaq	1216(%rsp), %rdx
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	56(%rsp), %rsp
	movq	1328(%rsp), %r9
	movq	1320(%rsp), %r10
	movq	1312(%rsp), %r8
	movq	1304(%rsp), %rax
	movq	1296(%rsp), %rcx
	leaq	64(%rsp), %rdi
	leaq	32(%rsp), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%rdi)
	movq	16(%rsi), %rdx
	movq	%rdx, 16(%rdi)
	movq	24(%rsi), %rdx
	movq	%rdx, 24(%rdi)
	movl	1336(%rsp), %edi
	movl	1340(%rsp), %esi
	shrl	$1, %esi
	addq	$32, %rcx
	incl	%edi
.Lfors_pkfromsig$5:
	cmpl	$9, %edi
	jb  	.Lfors_pkfromsig$6
	movq	1288(%rsp), %rdx
	leaq	96(%rsp,%rdx), %rdi
	leaq	64(%rsp), %rsi
	movq	(%rsi), %r11
	movq	%r11, (%rdi)
	movq	8(%rsi), %r11
	movq	%r11, 8(%rdi)
	movq	16(%rsi), %r11
	movq	%r11, 16(%rdi)
	movq	24(%rsi), %r11
	movq	%r11, 24(%rdi)
	addq	$32, %rdx
	incq	%rax
.Lfors_pkfromsig$3:
	cmpq	$35, %rax
	jb  	.Lfors_pkfromsig$4
	leaq	64(%rsp), %rax
	movq	(%r10), %rdx
	movq	%rdx, (%rax)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r10), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r10), %rdx
	movq	%rdx, 24(%rax)
	leaq	64(%rsp), %r11
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$4, 16(%r11)
	movl	20(%r10), %ecx
	leaq	64(%rsp), %r10
	movl	%ecx, 20(%r10)
	movq	1280(%rsp), %rdi
	leaq	64(%rsp), %r10
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
	movl	$0, %edi
	jmp 	.Lfors_sign$76
.Lfors_sign$77:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$76:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$77
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, (%rax)
	jmp 	.Lfors_sign$74
.Lfors_sign$75:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$74:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$75
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 4(%rax)
	jmp 	.Lfors_sign$72
.Lfors_sign$73:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$72:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$73
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 8(%rax)
	jmp 	.Lfors_sign$70
.Lfors_sign$71:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$70:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$71
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 12(%rax)
	jmp 	.Lfors_sign$68
.Lfors_sign$69:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$68:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$69
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 16(%rax)
	jmp 	.Lfors_sign$66
.Lfors_sign$67:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$66:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$67
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 20(%rax)
	jmp 	.Lfors_sign$64
.Lfors_sign$65:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$64:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$65
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 24(%rax)
	jmp 	.Lfors_sign$62
.Lfors_sign$63:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$62:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$63
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 28(%rax)
	jmp 	.Lfors_sign$60
.Lfors_sign$61:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$60:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$61
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 32(%rax)
	jmp 	.Lfors_sign$58
.Lfors_sign$59:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$58:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$59
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 36(%rax)
	jmp 	.Lfors_sign$56
.Lfors_sign$57:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$56:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$57
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 40(%rax)
	jmp 	.Lfors_sign$54
.Lfors_sign$55:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$54:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$55
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 44(%rax)
	jmp 	.Lfors_sign$52
.Lfors_sign$53:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$52:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$53
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 48(%rax)
	jmp 	.Lfors_sign$50
.Lfors_sign$51:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$50:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$51
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 52(%rax)
	jmp 	.Lfors_sign$48
.Lfors_sign$49:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$48:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$49
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 56(%rax)
	jmp 	.Lfors_sign$46
.Lfors_sign$47:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$46:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$47
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 60(%rax)
	jmp 	.Lfors_sign$44
.Lfors_sign$45:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$44:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$45
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 64(%rax)
	jmp 	.Lfors_sign$42
.Lfors_sign$43:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$42:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$43
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 68(%rax)
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$41
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 72(%rax)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$39
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 76(%rax)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$37
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 80(%rax)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$35
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 84(%rax)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$33
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 88(%rax)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$31
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 92(%rax)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$29
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 96(%rax)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$27
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 100(%rax)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$25
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 104(%rax)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$23
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 108(%rax)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$21
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 112(%rax)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$19
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 116(%rax)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$17
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 120(%rax)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$15
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 124(%rax)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$13
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 128(%rax)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$11
	movl	%edi, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 132(%rax)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$9
	movl	%edi, %edx
	addl	$-9, %ecx
	shrq	%cl, %rdx
	andq	$511, %rdx
	movl	%edx, 136(%rax)
	movq	$0, %rdi
	movq	$0, %rdx
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%edx, %esi
	shll	$9, %esi
	addl	64(%rsp,%rdx,4), %esi
	leaq	(%r8,%rdi), %rax
	movq	%r11, 8(%rsp)
	movq	%r9, 16(%rsp)
	movq	%r10, 24(%rsp)
	movq	%r8, 32(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rdi, 48(%rsp)
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %r11
	movq	16(%rsp), %r9
	movq	24(%rsp), %r10
	movq	32(%rsp), %r8
	movq	40(%rsp), %rdx
	movq	48(%rsp), %rdi
	addq	$32, %rdi
	movl	64(%rsp,%rdx,4), %eax
	xorl	$1, %eax
	movl	$0, %esi
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%r11, 48(%rsp)
	movq	%r9, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%esi, 56(%rsp)
	movq	%rdi, 24(%rsp)
	movl	%eax, 60(%rsp)
	movl	$9, %ecx
	subl	%esi, %ecx
	shlq	%cl, %rdx
	addl	%eax, %edx
	leaq	(%r8,%rdi), %rcx
	movq	%r8, 16(%rsp)
	movl	%edx, %r8d
	movl	%esi, %edx
	leaq	-32888(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	32888(%rsp), %rsp
	movq	16(%rsp), %r8
	movq	48(%rsp), %r11
	movq	40(%rsp), %r9
	movq	32(%rsp), %rdx
	movl	56(%rsp), %esi
	movq	24(%rsp), %rdi
	movl	60(%rsp), %eax
	shrl	$1, %eax
	xorl	$1, %eax
	addq	$32, %rdi
	incl	%esi
.Lfors_sign$4:
	cmpl	$9, %esi
	jb  	.Lfors_sign$5
	incq	%rdx
.Lfors_sign$2:
	cmpq	$35, %rdx
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rcx, 32832(%rsp)
	movl	$0, %edi
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%edx, 32872(%rsp)
	movl	%edx, %ecx
	subl	%edi, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %esi
	imull	%r8d, %esi
	addl	%esi, %edx
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%r11, 32840(%rsp)
	movl	%edx, 32876(%rsp)
	cmpl	$0, %edi
	je  	.Lfors_node$6
	movl	%esi, %eax
	imull	$2, %eax, %eax
	movl	%edi, %edx
	decl	%edx
	movl	$10, %ecx
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
	imulq	$32, %r11, %r11
	movq	%r11, %rax
	addq	$32, %rax
	leaq	32800(%rsp), %rcx
	leaq	32(%rsp,%r11), %rdx
	movq	(%rdx), %r11
	movq	%r11, (%rcx)
	movq	8(%rdx), %r11
	movq	%r11, 8(%rcx)
	movq	16(%rdx), %r11
	movq	%r11, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	32768(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
	movl	%edi, 24(%r10)
	movl	%esi, 28(%r10)
	movl	$10, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %r11
	subl	%edi, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %r11
	shrq	$1, %rbp
	movl	%esi, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %r11
	imulq	$32, %r11, %rax
	movq	%r9, 32848(%rsp)
	movq	%r10, 32856(%rsp)
	movl	%r8d, 32880(%rsp)
	movl	%edi, 32884(%rsp)
	movl	%esi, 32888(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	32800(%rsp), %rcx
	leaq	32768(%rsp), %rdx
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_node$10:
	leaq	56(%rsp), %rsp
	movq	32848(%rsp), %r9
	movq	32856(%rsp), %r10
	movl	32880(%rsp), %r8d
	movl	32884(%rsp), %edi
	movl	32888(%rsp), %esi
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%edi, 24(%r10)
	movl	%esi, 28(%r10)
	movl	$10, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbx
	subl	%edi, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %rbx
	shrq	$1, %rbp
	movl	%esi, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %rbx
	imulq	$32, %rbx, %rax
	movq	%r9, 32848(%rsp)
	movq	%r10, 32856(%rsp)
	movl	%r8d, 32880(%rsp)
	movl	%edi, 32884(%rsp)
	movl	%esi, 32888(%rsp)
	movq	%rax, 32864(%rsp)
	leaq	32(%rsp,%rax), %rax
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$9:
	leaq	40(%rsp), %rsp
	movq	32848(%rsp), %rdx
	movq	32856(%rsp), %r10
	movl	32880(%rsp), %eax
	movl	32884(%rsp), %edi
	movl	32888(%rsp), %esi
	movq	32864(%rsp), %rcx
	movq	%rdx, 32864(%rsp)
	movq	%r10, 32856(%rsp)
	movl	%eax, 32888(%rsp)
	movl	%edi, 32884(%rsp)
	movl	%esi, 32880(%rsp)
	movq	%rcx, 32848(%rsp)
	leaq	32(%rsp,%rcx), %rdi
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_node$8:
	leaq	56(%rsp), %rsp
	movq	32864(%rsp), %r9
	movq	32856(%rsp), %r10
	movl	32888(%rsp), %r8d
	movl	32884(%rsp), %edi
	movl	32880(%rsp), %esi
	movq	32848(%rsp), %rax
.Lfors_node$7:
	movq	32840(%rsp), %r11
	movl	32876(%rsp), %edx
	incl	%esi
.Lfors_node$4:
	cmpl	%edx, %esi
	jb  	.Lfors_node$5
	movl	32872(%rsp), %edx
	incl	%edi
.Lfors_node$2:
	cmpl	%edx, %edi
	jbe 	.Lfors_node$3
	movq	32832(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
	ret
.Lfors_skgen$1:
	leaq	8(%rsp), %rcx
	movq	(%r10), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r10), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r10), %rdx
	movq	%rdx, 24(%rcx)
	leaq	8(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$6, 16(%rcx)
	movl	20(%r10), %ecx
	leaq	8(%rsp), %r10
	movl	%ecx, 20(%r10)
	leaq	8(%rsp), %rcx
	movl	%esi, 28(%rcx)
	leaq	8(%rsp), %r10
	movq	%rax, %rcx
	movq	%r9, %rdx
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	%edx, %esi
	movl	(%rdi), %edx
	movl	%edx, 140(%rsp)
	movl	4(%rdi), %edx
	movl	%edx, 144(%rsp)
	movl	8(%rdi), %edx
	movl	%edx, 148(%rsp)
	leaq	40(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	leaq	40(%rsp), %r10
	movl	140(%rsp), %edx
	movl	%edx, 4(%r10)
	movl	144(%rsp), %edx
	movl	%edx, 8(%r10)
	movl	148(%rsp), %edx
	movl	%edx, 12(%r10)
	movq	%rcx, %rdx
	movq	%r9, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	72(%rsp), %rcx
	leaq	40(%rsp), %r10
	movq	%r10, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %r9
	movq	24(%rsp), %rcx
	movq	$2272, %rax
	movl	$1, %edi
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%edi, 136(%rsp)
	movq	%rax, 24(%rsp)
	leaq	140(%rsp), %rdx
	movl	8(%rdx), %esi
	andl	$15, %esi
	shrl	$4, 8(%rdx)
	movl	4(%rdx), %r8d
	shll	$28, %r8d
	orl 	%r8d, 8(%rdx)
	shrl	$4, 4(%rdx)
	movl	(%rdx), %r8d
	shll	$28, %r8d
	orl 	%r8d, 4(%rdx)
	shrl	$4, (%rdx)
	leaq	40(%rsp), %r10
	movl	%edi, (%r10)
	leaq	40(%rsp), %r10
	movl	140(%rsp), %edx
	movl	%edx, 4(%r10)
	movl	144(%rsp), %edx
	movl	%edx, 8(%r10)
	movl	148(%rsp), %edx
	movl	%edx, 12(%r10)
	leaq	104(%rsp), %rdi
	leaq	72(%rsp), %rdx
	movq	(%rdx), %r11
	movq	%r11, (%rdi)
	movq	8(%rdx), %r11
	movq	%r11, 8(%rdi)
	movq	16(%rdx), %r11
	movq	%r11, 16(%rdi)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rdi)
	leaq	(%rcx,%rax), %rdx
	movq	%r9, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	72(%rsp), %rcx
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %r10
	movq	%r10, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %r9
	movq	32(%rsp), %rcx
	movl	136(%rsp), %edi
	movq	24(%rsp), %rax
	addq	$2272, %rax
	incl	%edi
.Lht_verify$2:
	cmpl	$17, %edi
	jb  	.Lht_verify$3
	movq	8(%rsp), %rax
	leaq	72(%rsp), %rcx
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
	movb	16(%rax), %sil
	xorb	16(%rcx), %sil
	orb 	%sil, %dl
	movb	17(%rax), %sil
	xorb	17(%rcx), %sil
	orb 	%sil, %dl
	movb	18(%rax), %sil
	xorb	18(%rcx), %sil
	orb 	%sil, %dl
	movb	19(%rax), %sil
	xorb	19(%rcx), %sil
	orb 	%sil, %dl
	movb	20(%rax), %sil
	xorb	20(%rcx), %sil
	orb 	%sil, %dl
	movb	21(%rax), %sil
	xorb	21(%rcx), %sil
	orb 	%sil, %dl
	movb	22(%rax), %sil
	xorb	22(%rcx), %sil
	orb 	%sil, %dl
	movb	23(%rax), %sil
	xorb	23(%rcx), %sil
	orb 	%sil, %dl
	movb	24(%rax), %sil
	xorb	24(%rcx), %sil
	orb 	%sil, %dl
	movb	25(%rax), %sil
	xorb	25(%rcx), %sil
	orb 	%sil, %dl
	movb	26(%rax), %sil
	xorb	26(%rcx), %sil
	orb 	%sil, %dl
	movb	27(%rax), %sil
	xorb	27(%rcx), %sil
	orb 	%sil, %dl
	movb	28(%rax), %sil
	xorb	28(%rcx), %sil
	orb 	%sil, %dl
	movb	29(%rax), %sil
	xorb	29(%rcx), %sil
	orb 	%sil, %dl
	movb	30(%rax), %sil
	xorb	30(%rcx), %sil
	orb 	%sil, %dl
	movb	31(%rax), %sil
	xorb	31(%rcx), %sil
	orb 	%sil, %dl
	movzbq	%dl, %rax
	ret
.Lht_sign$1:
	movl	(%rdi), %edx
	movl	%edx, 144(%rsp)
	movl	4(%rdi), %edx
	movl	%edx, 148(%rsp)
	movl	8(%rdi), %edx
	movl	%edx, 152(%rsp)
	leaq	40(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	leaq	40(%rsp), %r10
	movl	144(%rsp), %edx
	movl	%edx, 4(%r10)
	movl	148(%rsp), %edx
	movl	%edx, 8(%r10)
	movl	152(%rsp), %edx
	movl	%edx, 12(%r10)
	movq	%rcx, %rdx
	movq	%rcx, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%r9, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%esi, 136(%rsp)
	leaq	40(%rsp), %r10
	movl	%esi, %edi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rsi
	movq	24(%rsp), %r9
	movq	32(%rsp), %rax
	movl	136(%rsp), %edi
	movq	%rsi, 32(%rsp)
	movq	%r9, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	72(%rsp), %rcx
	leaq	40(%rsp), %r10
	movl	%edi, %esi
	movq	%r10, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	216(%rsp), %rsp
	movq	32(%rsp), %r11
	movq	24(%rsp), %r9
	movq	16(%rsp), %rcx
	movq	$2272, %rax
	movl	$1, %edi
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%r11, 16(%rsp)
	leaq	144(%rsp), %rdx
	movl	8(%rdx), %esi
	andl	$15, %esi
	shrl	$4, 8(%rdx)
	movl	4(%rdx), %r8d
	shll	$28, %r8d
	orl 	%r8d, 8(%rdx)
	shrl	$4, 4(%rdx)
	movl	(%rdx), %r8d
	shll	$28, %r8d
	orl 	%r8d, 4(%rdx)
	shrl	$4, (%rdx)
	leaq	40(%rsp), %r10
	movl	%edi, (%r10)
	leaq	40(%rsp), %r10
	movl	144(%rsp), %edx
	movl	%edx, 4(%r10)
	movl	148(%rsp), %edx
	movl	%edx, 8(%r10)
	movl	152(%rsp), %edx
	movl	%edx, 12(%r10)
	leaq	104(%rsp), %rdx
	leaq	72(%rsp), %r8
	movq	(%r8), %r10
	movq	%r10, (%rdx)
	movq	8(%r8), %r10
	movq	%r10, 8(%rdx)
	movq	16(%r8), %r10
	movq	%r10, 16(%rdx)
	movq	24(%r8), %r10
	movq	%r10, 24(%rdx)
	leaq	(%rcx,%rax), %rdx
	movq	%rcx, 24(%rsp)
	movq	%r9, 32(%rsp)
	movl	%edi, 136(%rsp)
	movq	%rax, 8(%rsp)
	movl	%esi, 140(%rsp)
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %r10
	movl	%esi, %edi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	24(%rsp), %rcx
	movq	32(%rsp), %r9
	movl	136(%rsp), %edi
	movq	8(%rsp), %rax
	movl	140(%rsp), %esi
	cmpl	$16, %edi
	jnb 	.Lht_sign$4
	movq	%r9, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%edi, 140(%rsp)
	movq	%rax, 24(%rsp)
	leaq	72(%rsp), %rcx
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	216(%rsp), %rsp
	movq	8(%rsp), %r9
	movq	32(%rsp), %rcx
	movl	140(%rsp), %edi
	movq	24(%rsp), %rax
.Lht_sign$4:
	movq	16(%rsp), %r11
	addq	$2272, %rax
	incl	%edi
.Lht_sign$2:
	cmpl	$17, %edi
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 160(%rsp)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$0, 16(%r11)
	movl	%esi, 20(%r11)
	movq	%rdx, %rcx
	movq	%r9, 168(%rsp)
	movl	%esi, 200(%rsp)
	movq	%rdx, 176(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	movq	%r9, %r10
	leaq	-2520(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	2520(%rsp), %rsp
	movq	%rax, %r10
	movq	168(%rsp), %r9
	movl	200(%rsp), %esi
	movq	176(%rsp), %rdx
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$2, 16(%r10)
	movl	%esi, 28(%r10)
	movq	$2144, %rax
	movl	%esi, %edi
	movl	$0, %esi
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%esi, %ecx
	incl	%ecx
	movl	%ecx, 24(%r10)
	movl	%edi, %ecx
	andl	$1, %ecx
	movl	%esi, 200(%rsp)
	movl	%edi, 204(%rsp)
	cmpl	$0, %ecx
	je  	.Lxmss_pkfromsig$5
	movl	28(%r10), %esi
	decl	%esi
	shrl	$1, %esi
	movl	%esi, 28(%r10)
	leaq	128(%rsp), %rcx
	leaq	(%rdx,%rax), %rsi
	movq	(%rsi), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rsi), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rsi), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rsi), %rdi
	movq	%rdi, 24(%rcx)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rsi
	movq	(%rsi), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rsi), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rsi), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rsi), %rdi
	movq	%rdi, 24(%rcx)
	jmp 	.Lxmss_pkfromsig$6
.Lxmss_pkfromsig$5:
	movl	28(%r10), %esi
	shrl	$1, %esi
	movl	%esi, 28(%r10)
	leaq	128(%rsp), %rcx
	leaq	32(%rsp), %rsi
	movq	(%rsi), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rsi), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rsi), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rsi), %rdi
	movq	%rdi, 24(%rcx)
	leaq	96(%rsp), %rcx
	leaq	(%rdx,%rax), %rsi
	movq	(%rsi), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rsi), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rsi), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rsi), %rdi
	movq	%rdi, 24(%rcx)
.Lxmss_pkfromsig$6:
	movq	%r9, 176(%rsp)
	movq	%r10, 168(%rsp)
	movq	%rdx, 184(%rsp)
	movq	%rax, 192(%rsp)
	leaq	64(%rsp), %rdi
	leaq	128(%rsp), %rcx
	leaq	96(%rsp), %rdx
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	56(%rsp), %rsp
	movq	176(%rsp), %r9
	movq	168(%rsp), %r10
	movq	184(%rsp), %rdx
	movq	192(%rsp), %rax
	leaq	32(%rsp), %rcx
	leaq	64(%rsp), %rsi
	movq	(%rsi), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rsi), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rsi), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rsi), %rdi
	movq	%rdi, 24(%rcx)
	movl	200(%rsp), %esi
	movl	204(%rsp), %edi
	shrl	$1, %edi
	addq	$32, %rax
	incl	%esi
.Lxmss_pkfromsig$2:
	cmpl	$4, %esi
	jb  	.Lxmss_pkfromsig$3
	movq	160(%rsp), %rcx
	leaq	32(%rsp), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
	ret
.Lxmss_sign$1:
	movq	%rax, 8(%rsp)
	movq	$2144, %rcx
	movl	%edi, %esi
	xorl	$1, %esi
	movl	$0, %eax
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%r11, 16(%rsp)
	movq	%r9, 24(%rsp)
	movl	%edi, 48(%rsp)
	movl	%eax, 52(%rsp)
	movl	%esi, 56(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	(%rdx,%rcx), %rcx
	movq	%rdx, 40(%rsp)
	movl	%esi, %r8d
	movl	%eax, %edx
	leaq	-1144(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	1144(%rsp), %rsp
	movq	40(%rsp), %rdx
	movq	16(%rsp), %r11
	movq	24(%rsp), %r9
	movl	48(%rsp), %edi
	movl	52(%rsp), %eax
	movl	56(%rsp), %esi
	movq	32(%rsp), %rcx
	shrl	$1, %esi
	xorl	$1, %esi
	addq	$32, %rcx
	incl	%eax
.Lxmss_sign$3:
	cmpl	$4, %eax
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rax
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$0, 16(%r10)
	movl	%edi, 20(%r10)
	movq	%rdx, %rbx
	movq	%rdx, 8(%rsp)
	movq	%r9, %rdx
	leaq	-360(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	360(%rsp), %rsp
	movq	%rax, %rcx
	movq	8(%rsp), %rdx
	ret
.Lxmss_node$1:
	movq	%rcx, 1088(%rsp)
	movl	$0, %edi
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%edx, 1120(%rsp)
	movl	%edx, %ecx
	subl	%edi, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %esi
	imull	%r8d, %esi
	addl	%esi, %edx
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%r11, 1096(%rsp)
	movq	%r9, 1104(%rsp)
	movl	%r8d, 1124(%rsp)
	movl	%edi, 1128(%rsp)
	movl	%esi, 1132(%rsp)
	movl	%edx, 1136(%rsp)
	cmpl	$0, %edi
	je  	.Lxmss_node$6
	movl	%esi, %eax
	imull	$2, %eax, %eax
	movl	%edi, %edx
	decl	%edx
	movl	$5, %ecx
	movq	$1, %r11
	shlq	%cl, %r11
	subl	%edx, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %r11
	movl	%eax, %eax
	addq	%rax, %r11
	imulq	$32, %r11, %r11
	movq	%r11, %rax
	addq	$32, %rax
	leaq	1056(%rsp), %rcx
	leaq	32(%rsp,%r11), %rdx
	movq	(%rdx), %r11
	movq	%r11, (%rcx)
	movq	8(%rdx), %r11
	movq	%r11, 8(%rcx)
	movq	16(%rdx), %r11
	movq	%r11, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	1024(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$2, 16(%r10)
	movl	%edi, 24(%r10)
	movl	%esi, 28(%r10)
	movl	$5, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subl	%edi, %ecx
	movq	$1, %r11
	shlq	%cl, %r11
	subq	%r11, %rdx
	movl	%esi, %eax
	addq	%rax, %rdx
	imulq	$32, %rdx, %rax
	movq	%r10, 1112(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	1056(%rsp), %rcx
	leaq	1024(%rsp), %rdx
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_node$9:
	leaq	56(%rsp), %rsp
	movq	1112(%rsp), %r10
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$0, 16(%r10)
	movl	%esi, 20(%r10)
	movl	%esi, %eax
	imulq	$32, %rax, %rax
	leaq	32(%rsp,%rax), %rdi
	movq	%r9, %rdx
	leaq	-2264(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	2264(%rsp), %rsp
	movq	%rcx, %r10
.Lxmss_node$7:
	movq	1096(%rsp), %r11
	movq	1104(%rsp), %r9
	movl	1124(%rsp), %r8d
	movl	1128(%rsp), %edi
	movl	1132(%rsp), %esi
	movl	1136(%rsp), %edx
	incl	%esi
.Lxmss_node$4:
	cmpl	%edx, %esi
	jb  	.Lxmss_node$5
	movl	1120(%rsp), %edx
	incl	%edi
.Lxmss_node$2:
	cmpl	%edx, %edi
	jbe 	.Lxmss_node$3
	movq	1088(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
	ret
.Lwots_pkfromsig$1:
	movq	%rsi, 2176(%rsp)
	leaq	2236(%rsp), %rsi
	movq	%rsi, %rdi
	movq	$0, %r8
	movl	$0, %ecx
	movl	$0, %r9d
	jmp 	.Lwots_pkfromsig$138
.Lwots_pkfromsig$139:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$138:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$139
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, (%rdi)
	jmp 	.Lwots_pkfromsig$136
.Lwots_pkfromsig$137:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$136:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$137
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 4(%rdi)
	jmp 	.Lwots_pkfromsig$134
.Lwots_pkfromsig$135:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$134:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$135
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 8(%rdi)
	jmp 	.Lwots_pkfromsig$132
.Lwots_pkfromsig$133:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$132:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$133
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 12(%rdi)
	jmp 	.Lwots_pkfromsig$130
.Lwots_pkfromsig$131:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$130:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$131
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 16(%rdi)
	jmp 	.Lwots_pkfromsig$128
.Lwots_pkfromsig$129:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$128:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$129
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 20(%rdi)
	jmp 	.Lwots_pkfromsig$126
.Lwots_pkfromsig$127:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$126:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$127
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 24(%rdi)
	jmp 	.Lwots_pkfromsig$124
.Lwots_pkfromsig$125:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$124:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$125
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 28(%rdi)
	jmp 	.Lwots_pkfromsig$122
.Lwots_pkfromsig$123:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$122:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$123
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 32(%rdi)
	jmp 	.Lwots_pkfromsig$120
.Lwots_pkfromsig$121:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$120:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$121
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 36(%rdi)
	jmp 	.Lwots_pkfromsig$118
.Lwots_pkfromsig$119:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$118:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$119
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 40(%rdi)
	jmp 	.Lwots_pkfromsig$116
.Lwots_pkfromsig$117:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$116:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$117
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 44(%rdi)
	jmp 	.Lwots_pkfromsig$114
.Lwots_pkfromsig$115:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$114:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$115
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 48(%rdi)
	jmp 	.Lwots_pkfromsig$112
.Lwots_pkfromsig$113:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$112:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$113
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 52(%rdi)
	jmp 	.Lwots_pkfromsig$110
.Lwots_pkfromsig$111:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$110:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$111
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 56(%rdi)
	jmp 	.Lwots_pkfromsig$108
.Lwots_pkfromsig$109:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$108:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$109
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 60(%rdi)
	jmp 	.Lwots_pkfromsig$106
.Lwots_pkfromsig$107:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$106:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$107
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 64(%rdi)
	jmp 	.Lwots_pkfromsig$104
.Lwots_pkfromsig$105:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$104:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$105
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 68(%rdi)
	jmp 	.Lwots_pkfromsig$102
.Lwots_pkfromsig$103:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$102:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$103
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 72(%rdi)
	jmp 	.Lwots_pkfromsig$100
.Lwots_pkfromsig$101:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$100:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$101
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 76(%rdi)
	jmp 	.Lwots_pkfromsig$98
.Lwots_pkfromsig$99:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$98:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$99
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 80(%rdi)
	jmp 	.Lwots_pkfromsig$96
.Lwots_pkfromsig$97:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$96:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$97
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 84(%rdi)
	jmp 	.Lwots_pkfromsig$94
.Lwots_pkfromsig$95:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$94:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$95
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 88(%rdi)
	jmp 	.Lwots_pkfromsig$92
.Lwots_pkfromsig$93:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$92:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$93
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 92(%rdi)
	jmp 	.Lwots_pkfromsig$90
.Lwots_pkfromsig$91:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$90:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$91
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 96(%rdi)
	jmp 	.Lwots_pkfromsig$88
.Lwots_pkfromsig$89:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$88:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$89
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 100(%rdi)
	jmp 	.Lwots_pkfromsig$86
.Lwots_pkfromsig$87:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$86:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$87
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 104(%rdi)
	jmp 	.Lwots_pkfromsig$84
.Lwots_pkfromsig$85:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$84:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$85
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 108(%rdi)
	jmp 	.Lwots_pkfromsig$82
.Lwots_pkfromsig$83:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$82:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$83
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 112(%rdi)
	jmp 	.Lwots_pkfromsig$80
.Lwots_pkfromsig$81:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$80:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$81
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 116(%rdi)
	jmp 	.Lwots_pkfromsig$78
.Lwots_pkfromsig$79:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$78:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$79
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 120(%rdi)
	jmp 	.Lwots_pkfromsig$76
.Lwots_pkfromsig$77:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebx
	orl 	%ebx, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$76:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$77
	movl	%r9d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 124(%rdi)
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
	movl	%ebx, 128(%rdi)
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
	movl	%ebx, 132(%rdi)
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
	movl	%ebx, 136(%rdi)
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
	movl	%ebx, 140(%rdi)
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
	movl	%ebx, 144(%rdi)
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
	movl	%ebx, 148(%rdi)
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
	movl	%ebx, 152(%rdi)
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
	movl	%ebx, 156(%rdi)
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
	movl	%ebx, 160(%rdi)
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
	movl	%ebx, 164(%rdi)
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
	movl	%ebx, 168(%rdi)
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
	movl	%ebx, 172(%rdi)
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
	movl	%ebx, 176(%rdi)
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
	movl	%ebx, 180(%rdi)
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
	movl	%ebx, 184(%rdi)
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
	movl	%ebx, 188(%rdi)
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
	movl	%ebx, 192(%rdi)
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
	movl	%ebx, 196(%rdi)
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
	movl	%ebx, 200(%rdi)
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
	movl	%ebx, 204(%rdi)
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
	movl	%ebx, 208(%rdi)
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
	movl	%ebx, 212(%rdi)
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
	movl	%ebx, 216(%rdi)
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
	movl	%ebx, 220(%rdi)
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
	movl	%ebx, 224(%rdi)
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
	movl	%ebx, 228(%rdi)
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
	movl	%ebx, 232(%rdi)
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
	movl	%ebx, 236(%rdi)
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
	movl	%ebx, 240(%rdi)
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
	movl	%ebx, 244(%rdi)
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
	movl	%ebx, 248(%rdi)
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
	movl	%eax, 252(%rdi)
	movq	%rsi, %rax
	movl	$960, %ecx
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
	subl	128(%rax), %ecx
	subl	132(%rax), %ecx
	subl	136(%rax), %ecx
	subl	140(%rax), %ecx
	subl	144(%rax), %ecx
	subl	148(%rax), %ecx
	subl	152(%rax), %ecx
	subl	156(%rax), %ecx
	subl	160(%rax), %ecx
	subl	164(%rax), %ecx
	subl	168(%rax), %ecx
	subl	172(%rax), %ecx
	subl	176(%rax), %ecx
	subl	180(%rax), %ecx
	subl	184(%rax), %ecx
	subl	188(%rax), %ecx
	subl	192(%rax), %ecx
	subl	196(%rax), %ecx
	subl	200(%rax), %ecx
	subl	204(%rax), %ecx
	subl	208(%rax), %ecx
	subl	212(%rax), %ecx
	subl	216(%rax), %ecx
	subl	220(%rax), %ecx
	subl	224(%rax), %ecx
	subl	228(%rax), %ecx
	subl	232(%rax), %ecx
	subl	236(%rax), %ecx
	subl	240(%rax), %ecx
	subl	244(%rax), %ecx
	subl	248(%rax), %ecx
	subl	252(%rax), %ecx
	shll	$4, %ecx
	movl	%ecx, %eax
	shrl	$0, %eax
	andl	$255, %eax
	movb	%al, 2505(%rsp)
	shrl	$8, %ecx
	andl	$255, %ecx
	movb	%cl, 2504(%rsp)
	leaq	256(%rsi), %rax
	leaq	2504(%rsp), %rsi
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
	movb	559(%rdx), %dil
	movb	%dil, 591(%rsp)
	movb	560(%rdx), %dil
	movb	%dil, 592(%rsp)
	movb	561(%rdx), %dil
	movb	%dil, 593(%rsp)
	movb	562(%rdx), %dil
	movb	%dil, 594(%rsp)
	movb	563(%rdx), %dil
	movb	%dil, 595(%rsp)
	movb	564(%rdx), %dil
	movb	%dil, 596(%rsp)
	movb	565(%rdx), %dil
	movb	%dil, 597(%rsp)
	movb	566(%rdx), %dil
	movb	%dil, 598(%rsp)
	movb	567(%rdx), %dil
	movb	%dil, 599(%rsp)
	movb	568(%rdx), %dil
	movb	%dil, 600(%rsp)
	movb	569(%rdx), %dil
	movb	%dil, 601(%rsp)
	movb	570(%rdx), %dil
	movb	%dil, 602(%rsp)
	movb	571(%rdx), %dil
	movb	%dil, 603(%rsp)
	movb	572(%rdx), %dil
	movb	%dil, 604(%rsp)
	movb	573(%rdx), %dil
	movb	%dil, 605(%rsp)
	movb	574(%rdx), %dil
	movb	%dil, 606(%rsp)
	movb	575(%rdx), %dil
	movb	%dil, 607(%rsp)
	movb	576(%rdx), %dil
	movb	%dil, 608(%rsp)
	movb	577(%rdx), %dil
	movb	%dil, 609(%rsp)
	movb	578(%rdx), %dil
	movb	%dil, 610(%rsp)
	movb	579(%rdx), %dil
	movb	%dil, 611(%rsp)
	movb	580(%rdx), %dil
	movb	%dil, 612(%rsp)
	movb	581(%rdx), %dil
	movb	%dil, 613(%rsp)
	movb	582(%rdx), %dil
	movb	%dil, 614(%rsp)
	movb	583(%rdx), %dil
	movb	%dil, 615(%rsp)
	movb	584(%rdx), %dil
	movb	%dil, 616(%rsp)
	movb	585(%rdx), %dil
	movb	%dil, 617(%rsp)
	movb	586(%rdx), %dil
	movb	%dil, 618(%rsp)
	movb	587(%rdx), %dil
	movb	%dil, 619(%rsp)
	movb	588(%rdx), %dil
	movb	%dil, 620(%rsp)
	movb	589(%rdx), %dil
	movb	%dil, 621(%rsp)
	movb	590(%rdx), %dil
	movb	%dil, 622(%rsp)
	movb	591(%rdx), %dil
	movb	%dil, 623(%rsp)
	movb	592(%rdx), %dil
	movb	%dil, 624(%rsp)
	movb	593(%rdx), %dil
	movb	%dil, 625(%rsp)
	movb	594(%rdx), %dil
	movb	%dil, 626(%rsp)
	movb	595(%rdx), %dil
	movb	%dil, 627(%rsp)
	movb	596(%rdx), %dil
	movb	%dil, 628(%rsp)
	movb	597(%rdx), %dil
	movb	%dil, 629(%rsp)
	movb	598(%rdx), %dil
	movb	%dil, 630(%rsp)
	movb	599(%rdx), %dil
	movb	%dil, 631(%rsp)
	movb	600(%rdx), %dil
	movb	%dil, 632(%rsp)
	movb	601(%rdx), %dil
	movb	%dil, 633(%rsp)
	movb	602(%rdx), %dil
	movb	%dil, 634(%rsp)
	movb	603(%rdx), %dil
	movb	%dil, 635(%rsp)
	movb	604(%rdx), %dil
	movb	%dil, 636(%rsp)
	movb	605(%rdx), %dil
	movb	%dil, 637(%rsp)
	movb	606(%rdx), %dil
	movb	%dil, 638(%rsp)
	movb	607(%rdx), %dil
	movb	%dil, 639(%rsp)
	movb	608(%rdx), %dil
	movb	%dil, 640(%rsp)
	movb	609(%rdx), %dil
	movb	%dil, 641(%rsp)
	movb	610(%rdx), %dil
	movb	%dil, 642(%rsp)
	movb	611(%rdx), %dil
	movb	%dil, 643(%rsp)
	movb	612(%rdx), %dil
	movb	%dil, 644(%rsp)
	movb	613(%rdx), %dil
	movb	%dil, 645(%rsp)
	movb	614(%rdx), %dil
	movb	%dil, 646(%rsp)
	movb	615(%rdx), %dil
	movb	%dil, 647(%rsp)
	movb	616(%rdx), %dil
	movb	%dil, 648(%rsp)
	movb	617(%rdx), %dil
	movb	%dil, 649(%rsp)
	movb	618(%rdx), %dil
	movb	%dil, 650(%rsp)
	movb	619(%rdx), %dil
	movb	%dil, 651(%rsp)
	movb	620(%rdx), %dil
	movb	%dil, 652(%rsp)
	movb	621(%rdx), %dil
	movb	%dil, 653(%rsp)
	movb	622(%rdx), %dil
	movb	%dil, 654(%rsp)
	movb	623(%rdx), %dil
	movb	%dil, 655(%rsp)
	movb	624(%rdx), %dil
	movb	%dil, 656(%rsp)
	movb	625(%rdx), %dil
	movb	%dil, 657(%rsp)
	movb	626(%rdx), %dil
	movb	%dil, 658(%rsp)
	movb	627(%rdx), %dil
	movb	%dil, 659(%rsp)
	movb	628(%rdx), %dil
	movb	%dil, 660(%rsp)
	movb	629(%rdx), %dil
	movb	%dil, 661(%rsp)
	movb	630(%rdx), %dil
	movb	%dil, 662(%rsp)
	movb	631(%rdx), %dil
	movb	%dil, 663(%rsp)
	movb	632(%rdx), %dil
	movb	%dil, 664(%rsp)
	movb	633(%rdx), %dil
	movb	%dil, 665(%rsp)
	movb	634(%rdx), %dil
	movb	%dil, 666(%rsp)
	movb	635(%rdx), %dil
	movb	%dil, 667(%rsp)
	movb	636(%rdx), %dil
	movb	%dil, 668(%rsp)
	movb	637(%rdx), %dil
	movb	%dil, 669(%rsp)
	movb	638(%rdx), %dil
	movb	%dil, 670(%rsp)
	movb	639(%rdx), %dil
	movb	%dil, 671(%rsp)
	movb	640(%rdx), %dil
	movb	%dil, 672(%rsp)
	movb	641(%rdx), %dil
	movb	%dil, 673(%rsp)
	movb	642(%rdx), %dil
	movb	%dil, 674(%rsp)
	movb	643(%rdx), %dil
	movb	%dil, 675(%rsp)
	movb	644(%rdx), %dil
	movb	%dil, 676(%rsp)
	movb	645(%rdx), %dil
	movb	%dil, 677(%rsp)
	movb	646(%rdx), %dil
	movb	%dil, 678(%rsp)
	movb	647(%rdx), %dil
	movb	%dil, 679(%rsp)
	movb	648(%rdx), %dil
	movb	%dil, 680(%rsp)
	movb	649(%rdx), %dil
	movb	%dil, 681(%rsp)
	movb	650(%rdx), %dil
	movb	%dil, 682(%rsp)
	movb	651(%rdx), %dil
	movb	%dil, 683(%rsp)
	movb	652(%rdx), %dil
	movb	%dil, 684(%rsp)
	movb	653(%rdx), %dil
	movb	%dil, 685(%rsp)
	movb	654(%rdx), %dil
	movb	%dil, 686(%rsp)
	movb	655(%rdx), %dil
	movb	%dil, 687(%rsp)
	movb	656(%rdx), %dil
	movb	%dil, 688(%rsp)
	movb	657(%rdx), %dil
	movb	%dil, 689(%rsp)
	movb	658(%rdx), %dil
	movb	%dil, 690(%rsp)
	movb	659(%rdx), %dil
	movb	%dil, 691(%rsp)
	movb	660(%rdx), %dil
	movb	%dil, 692(%rsp)
	movb	661(%rdx), %dil
	movb	%dil, 693(%rsp)
	movb	662(%rdx), %dil
	movb	%dil, 694(%rsp)
	movb	663(%rdx), %dil
	movb	%dil, 695(%rsp)
	movb	664(%rdx), %dil
	movb	%dil, 696(%rsp)
	movb	665(%rdx), %dil
	movb	%dil, 697(%rsp)
	movb	666(%rdx), %dil
	movb	%dil, 698(%rsp)
	movb	667(%rdx), %dil
	movb	%dil, 699(%rsp)
	movb	668(%rdx), %dil
	movb	%dil, 700(%rsp)
	movb	669(%rdx), %dil
	movb	%dil, 701(%rsp)
	movb	670(%rdx), %dil
	movb	%dil, 702(%rsp)
	movb	671(%rdx), %dil
	movb	%dil, 703(%rsp)
	movb	672(%rdx), %dil
	movb	%dil, 704(%rsp)
	movb	673(%rdx), %dil
	movb	%dil, 705(%rsp)
	movb	674(%rdx), %dil
	movb	%dil, 706(%rsp)
	movb	675(%rdx), %dil
	movb	%dil, 707(%rsp)
	movb	676(%rdx), %dil
	movb	%dil, 708(%rsp)
	movb	677(%rdx), %dil
	movb	%dil, 709(%rsp)
	movb	678(%rdx), %dil
	movb	%dil, 710(%rsp)
	movb	679(%rdx), %dil
	movb	%dil, 711(%rsp)
	movb	680(%rdx), %dil
	movb	%dil, 712(%rsp)
	movb	681(%rdx), %dil
	movb	%dil, 713(%rsp)
	movb	682(%rdx), %dil
	movb	%dil, 714(%rsp)
	movb	683(%rdx), %dil
	movb	%dil, 715(%rsp)
	movb	684(%rdx), %dil
	movb	%dil, 716(%rsp)
	movb	685(%rdx), %dil
	movb	%dil, 717(%rsp)
	movb	686(%rdx), %dil
	movb	%dil, 718(%rsp)
	movb	687(%rdx), %dil
	movb	%dil, 719(%rsp)
	movb	688(%rdx), %dil
	movb	%dil, 720(%rsp)
	movb	689(%rdx), %dil
	movb	%dil, 721(%rsp)
	movb	690(%rdx), %dil
	movb	%dil, 722(%rsp)
	movb	691(%rdx), %dil
	movb	%dil, 723(%rsp)
	movb	692(%rdx), %dil
	movb	%dil, 724(%rsp)
	movb	693(%rdx), %dil
	movb	%dil, 725(%rsp)
	movb	694(%rdx), %dil
	movb	%dil, 726(%rsp)
	movb	695(%rdx), %dil
	movb	%dil, 727(%rsp)
	movb	696(%rdx), %dil
	movb	%dil, 728(%rsp)
	movb	697(%rdx), %dil
	movb	%dil, 729(%rsp)
	movb	698(%rdx), %dil
	movb	%dil, 730(%rsp)
	movb	699(%rdx), %dil
	movb	%dil, 731(%rsp)
	movb	700(%rdx), %dil
	movb	%dil, 732(%rsp)
	movb	701(%rdx), %dil
	movb	%dil, 733(%rsp)
	movb	702(%rdx), %dil
	movb	%dil, 734(%rsp)
	movb	703(%rdx), %dil
	movb	%dil, 735(%rsp)
	movb	704(%rdx), %dil
	movb	%dil, 736(%rsp)
	movb	705(%rdx), %dil
	movb	%dil, 737(%rsp)
	movb	706(%rdx), %dil
	movb	%dil, 738(%rsp)
	movb	707(%rdx), %dil
	movb	%dil, 739(%rsp)
	movb	708(%rdx), %dil
	movb	%dil, 740(%rsp)
	movb	709(%rdx), %dil
	movb	%dil, 741(%rsp)
	movb	710(%rdx), %dil
	movb	%dil, 742(%rsp)
	movb	711(%rdx), %dil
	movb	%dil, 743(%rsp)
	movb	712(%rdx), %dil
	movb	%dil, 744(%rsp)
	movb	713(%rdx), %dil
	movb	%dil, 745(%rsp)
	movb	714(%rdx), %dil
	movb	%dil, 746(%rsp)
	movb	715(%rdx), %dil
	movb	%dil, 747(%rsp)
	movb	716(%rdx), %dil
	movb	%dil, 748(%rsp)
	movb	717(%rdx), %dil
	movb	%dil, 749(%rsp)
	movb	718(%rdx), %dil
	movb	%dil, 750(%rsp)
	movb	719(%rdx), %dil
	movb	%dil, 751(%rsp)
	movb	720(%rdx), %dil
	movb	%dil, 752(%rsp)
	movb	721(%rdx), %dil
	movb	%dil, 753(%rsp)
	movb	722(%rdx), %dil
	movb	%dil, 754(%rsp)
	movb	723(%rdx), %dil
	movb	%dil, 755(%rsp)
	movb	724(%rdx), %dil
	movb	%dil, 756(%rsp)
	movb	725(%rdx), %dil
	movb	%dil, 757(%rsp)
	movb	726(%rdx), %dil
	movb	%dil, 758(%rsp)
	movb	727(%rdx), %dil
	movb	%dil, 759(%rsp)
	movb	728(%rdx), %dil
	movb	%dil, 760(%rsp)
	movb	729(%rdx), %dil
	movb	%dil, 761(%rsp)
	movb	730(%rdx), %dil
	movb	%dil, 762(%rsp)
	movb	731(%rdx), %dil
	movb	%dil, 763(%rsp)
	movb	732(%rdx), %dil
	movb	%dil, 764(%rsp)
	movb	733(%rdx), %dil
	movb	%dil, 765(%rsp)
	movb	734(%rdx), %dil
	movb	%dil, 766(%rsp)
	movb	735(%rdx), %dil
	movb	%dil, 767(%rsp)
	movb	736(%rdx), %dil
	movb	%dil, 768(%rsp)
	movb	737(%rdx), %dil
	movb	%dil, 769(%rsp)
	movb	738(%rdx), %dil
	movb	%dil, 770(%rsp)
	movb	739(%rdx), %dil
	movb	%dil, 771(%rsp)
	movb	740(%rdx), %dil
	movb	%dil, 772(%rsp)
	movb	741(%rdx), %dil
	movb	%dil, 773(%rsp)
	movb	742(%rdx), %dil
	movb	%dil, 774(%rsp)
	movb	743(%rdx), %dil
	movb	%dil, 775(%rsp)
	movb	744(%rdx), %dil
	movb	%dil, 776(%rsp)
	movb	745(%rdx), %dil
	movb	%dil, 777(%rsp)
	movb	746(%rdx), %dil
	movb	%dil, 778(%rsp)
	movb	747(%rdx), %dil
	movb	%dil, 779(%rsp)
	movb	748(%rdx), %dil
	movb	%dil, 780(%rsp)
	movb	749(%rdx), %dil
	movb	%dil, 781(%rsp)
	movb	750(%rdx), %dil
	movb	%dil, 782(%rsp)
	movb	751(%rdx), %dil
	movb	%dil, 783(%rsp)
	movb	752(%rdx), %dil
	movb	%dil, 784(%rsp)
	movb	753(%rdx), %dil
	movb	%dil, 785(%rsp)
	movb	754(%rdx), %dil
	movb	%dil, 786(%rsp)
	movb	755(%rdx), %dil
	movb	%dil, 787(%rsp)
	movb	756(%rdx), %dil
	movb	%dil, 788(%rsp)
	movb	757(%rdx), %dil
	movb	%dil, 789(%rsp)
	movb	758(%rdx), %dil
	movb	%dil, 790(%rsp)
	movb	759(%rdx), %dil
	movb	%dil, 791(%rsp)
	movb	760(%rdx), %dil
	movb	%dil, 792(%rsp)
	movb	761(%rdx), %dil
	movb	%dil, 793(%rsp)
	movb	762(%rdx), %dil
	movb	%dil, 794(%rsp)
	movb	763(%rdx), %dil
	movb	%dil, 795(%rsp)
	movb	764(%rdx), %dil
	movb	%dil, 796(%rsp)
	movb	765(%rdx), %dil
	movb	%dil, 797(%rsp)
	movb	766(%rdx), %dil
	movb	%dil, 798(%rsp)
	movb	767(%rdx), %dil
	movb	%dil, 799(%rsp)
	movb	768(%rdx), %dil
	movb	%dil, 800(%rsp)
	movb	769(%rdx), %dil
	movb	%dil, 801(%rsp)
	movb	770(%rdx), %dil
	movb	%dil, 802(%rsp)
	movb	771(%rdx), %dil
	movb	%dil, 803(%rsp)
	movb	772(%rdx), %dil
	movb	%dil, 804(%rsp)
	movb	773(%rdx), %dil
	movb	%dil, 805(%rsp)
	movb	774(%rdx), %dil
	movb	%dil, 806(%rsp)
	movb	775(%rdx), %dil
	movb	%dil, 807(%rsp)
	movb	776(%rdx), %dil
	movb	%dil, 808(%rsp)
	movb	777(%rdx), %dil
	movb	%dil, 809(%rsp)
	movb	778(%rdx), %dil
	movb	%dil, 810(%rsp)
	movb	779(%rdx), %dil
	movb	%dil, 811(%rsp)
	movb	780(%rdx), %dil
	movb	%dil, 812(%rsp)
	movb	781(%rdx), %dil
	movb	%dil, 813(%rsp)
	movb	782(%rdx), %dil
	movb	%dil, 814(%rsp)
	movb	783(%rdx), %dil
	movb	%dil, 815(%rsp)
	movb	784(%rdx), %dil
	movb	%dil, 816(%rsp)
	movb	785(%rdx), %dil
	movb	%dil, 817(%rsp)
	movb	786(%rdx), %dil
	movb	%dil, 818(%rsp)
	movb	787(%rdx), %dil
	movb	%dil, 819(%rsp)
	movb	788(%rdx), %dil
	movb	%dil, 820(%rsp)
	movb	789(%rdx), %dil
	movb	%dil, 821(%rsp)
	movb	790(%rdx), %dil
	movb	%dil, 822(%rsp)
	movb	791(%rdx), %dil
	movb	%dil, 823(%rsp)
	movb	792(%rdx), %dil
	movb	%dil, 824(%rsp)
	movb	793(%rdx), %dil
	movb	%dil, 825(%rsp)
	movb	794(%rdx), %dil
	movb	%dil, 826(%rsp)
	movb	795(%rdx), %dil
	movb	%dil, 827(%rsp)
	movb	796(%rdx), %dil
	movb	%dil, 828(%rsp)
	movb	797(%rdx), %dil
	movb	%dil, 829(%rsp)
	movb	798(%rdx), %dil
	movb	%dil, 830(%rsp)
	movb	799(%rdx), %dil
	movb	%dil, 831(%rsp)
	movb	800(%rdx), %dil
	movb	%dil, 832(%rsp)
	movb	801(%rdx), %dil
	movb	%dil, 833(%rsp)
	movb	802(%rdx), %dil
	movb	%dil, 834(%rsp)
	movb	803(%rdx), %dil
	movb	%dil, 835(%rsp)
	movb	804(%rdx), %dil
	movb	%dil, 836(%rsp)
	movb	805(%rdx), %dil
	movb	%dil, 837(%rsp)
	movb	806(%rdx), %dil
	movb	%dil, 838(%rsp)
	movb	807(%rdx), %dil
	movb	%dil, 839(%rsp)
	movb	808(%rdx), %dil
	movb	%dil, 840(%rsp)
	movb	809(%rdx), %dil
	movb	%dil, 841(%rsp)
	movb	810(%rdx), %dil
	movb	%dil, 842(%rsp)
	movb	811(%rdx), %dil
	movb	%dil, 843(%rsp)
	movb	812(%rdx), %dil
	movb	%dil, 844(%rsp)
	movb	813(%rdx), %dil
	movb	%dil, 845(%rsp)
	movb	814(%rdx), %dil
	movb	%dil, 846(%rsp)
	movb	815(%rdx), %dil
	movb	%dil, 847(%rsp)
	movb	816(%rdx), %dil
	movb	%dil, 848(%rsp)
	movb	817(%rdx), %dil
	movb	%dil, 849(%rsp)
	movb	818(%rdx), %dil
	movb	%dil, 850(%rsp)
	movb	819(%rdx), %dil
	movb	%dil, 851(%rsp)
	movb	820(%rdx), %dil
	movb	%dil, 852(%rsp)
	movb	821(%rdx), %dil
	movb	%dil, 853(%rsp)
	movb	822(%rdx), %dil
	movb	%dil, 854(%rsp)
	movb	823(%rdx), %dil
	movb	%dil, 855(%rsp)
	movb	824(%rdx), %dil
	movb	%dil, 856(%rsp)
	movb	825(%rdx), %dil
	movb	%dil, 857(%rsp)
	movb	826(%rdx), %dil
	movb	%dil, 858(%rsp)
	movb	827(%rdx), %dil
	movb	%dil, 859(%rsp)
	movb	828(%rdx), %dil
	movb	%dil, 860(%rsp)
	movb	829(%rdx), %dil
	movb	%dil, 861(%rsp)
	movb	830(%rdx), %dil
	movb	%dil, 862(%rsp)
	movb	831(%rdx), %dil
	movb	%dil, 863(%rsp)
	movb	832(%rdx), %dil
	movb	%dil, 864(%rsp)
	movb	833(%rdx), %dil
	movb	%dil, 865(%rsp)
	movb	834(%rdx), %dil
	movb	%dil, 866(%rsp)
	movb	835(%rdx), %dil
	movb	%dil, 867(%rsp)
	movb	836(%rdx), %dil
	movb	%dil, 868(%rsp)
	movb	837(%rdx), %dil
	movb	%dil, 869(%rsp)
	movb	838(%rdx), %dil
	movb	%dil, 870(%rsp)
	movb	839(%rdx), %dil
	movb	%dil, 871(%rsp)
	movb	840(%rdx), %dil
	movb	%dil, 872(%rsp)
	movb	841(%rdx), %dil
	movb	%dil, 873(%rsp)
	movb	842(%rdx), %dil
	movb	%dil, 874(%rsp)
	movb	843(%rdx), %dil
	movb	%dil, 875(%rsp)
	movb	844(%rdx), %dil
	movb	%dil, 876(%rsp)
	movb	845(%rdx), %dil
	movb	%dil, 877(%rsp)
	movb	846(%rdx), %dil
	movb	%dil, 878(%rsp)
	movb	847(%rdx), %dil
	movb	%dil, 879(%rsp)
	movb	848(%rdx), %dil
	movb	%dil, 880(%rsp)
	movb	849(%rdx), %dil
	movb	%dil, 881(%rsp)
	movb	850(%rdx), %dil
	movb	%dil, 882(%rsp)
	movb	851(%rdx), %dil
	movb	%dil, 883(%rsp)
	movb	852(%rdx), %dil
	movb	%dil, 884(%rsp)
	movb	853(%rdx), %dil
	movb	%dil, 885(%rsp)
	movb	854(%rdx), %dil
	movb	%dil, 886(%rsp)
	movb	855(%rdx), %dil
	movb	%dil, 887(%rsp)
	movb	856(%rdx), %dil
	movb	%dil, 888(%rsp)
	movb	857(%rdx), %dil
	movb	%dil, 889(%rsp)
	movb	858(%rdx), %dil
	movb	%dil, 890(%rsp)
	movb	859(%rdx), %dil
	movb	%dil, 891(%rsp)
	movb	860(%rdx), %dil
	movb	%dil, 892(%rsp)
	movb	861(%rdx), %dil
	movb	%dil, 893(%rsp)
	movb	862(%rdx), %dil
	movb	%dil, 894(%rsp)
	movb	863(%rdx), %dil
	movb	%dil, 895(%rsp)
	movb	864(%rdx), %dil
	movb	%dil, 896(%rsp)
	movb	865(%rdx), %dil
	movb	%dil, 897(%rsp)
	movb	866(%rdx), %dil
	movb	%dil, 898(%rsp)
	movb	867(%rdx), %dil
	movb	%dil, 899(%rsp)
	movb	868(%rdx), %dil
	movb	%dil, 900(%rsp)
	movb	869(%rdx), %dil
	movb	%dil, 901(%rsp)
	movb	870(%rdx), %dil
	movb	%dil, 902(%rsp)
	movb	871(%rdx), %dil
	movb	%dil, 903(%rsp)
	movb	872(%rdx), %dil
	movb	%dil, 904(%rsp)
	movb	873(%rdx), %dil
	movb	%dil, 905(%rsp)
	movb	874(%rdx), %dil
	movb	%dil, 906(%rsp)
	movb	875(%rdx), %dil
	movb	%dil, 907(%rsp)
	movb	876(%rdx), %dil
	movb	%dil, 908(%rsp)
	movb	877(%rdx), %dil
	movb	%dil, 909(%rsp)
	movb	878(%rdx), %dil
	movb	%dil, 910(%rsp)
	movb	879(%rdx), %dil
	movb	%dil, 911(%rsp)
	movb	880(%rdx), %dil
	movb	%dil, 912(%rsp)
	movb	881(%rdx), %dil
	movb	%dil, 913(%rsp)
	movb	882(%rdx), %dil
	movb	%dil, 914(%rsp)
	movb	883(%rdx), %dil
	movb	%dil, 915(%rsp)
	movb	884(%rdx), %dil
	movb	%dil, 916(%rsp)
	movb	885(%rdx), %dil
	movb	%dil, 917(%rsp)
	movb	886(%rdx), %dil
	movb	%dil, 918(%rsp)
	movb	887(%rdx), %dil
	movb	%dil, 919(%rsp)
	movb	888(%rdx), %dil
	movb	%dil, 920(%rsp)
	movb	889(%rdx), %dil
	movb	%dil, 921(%rsp)
	movb	890(%rdx), %dil
	movb	%dil, 922(%rsp)
	movb	891(%rdx), %dil
	movb	%dil, 923(%rsp)
	movb	892(%rdx), %dil
	movb	%dil, 924(%rsp)
	movb	893(%rdx), %dil
	movb	%dil, 925(%rsp)
	movb	894(%rdx), %dil
	movb	%dil, 926(%rsp)
	movb	895(%rdx), %dil
	movb	%dil, 927(%rsp)
	movb	896(%rdx), %dil
	movb	%dil, 928(%rsp)
	movb	897(%rdx), %dil
	movb	%dil, 929(%rsp)
	movb	898(%rdx), %dil
	movb	%dil, 930(%rsp)
	movb	899(%rdx), %dil
	movb	%dil, 931(%rsp)
	movb	900(%rdx), %dil
	movb	%dil, 932(%rsp)
	movb	901(%rdx), %dil
	movb	%dil, 933(%rsp)
	movb	902(%rdx), %dil
	movb	%dil, 934(%rsp)
	movb	903(%rdx), %dil
	movb	%dil, 935(%rsp)
	movb	904(%rdx), %dil
	movb	%dil, 936(%rsp)
	movb	905(%rdx), %dil
	movb	%dil, 937(%rsp)
	movb	906(%rdx), %dil
	movb	%dil, 938(%rsp)
	movb	907(%rdx), %dil
	movb	%dil, 939(%rsp)
	movb	908(%rdx), %dil
	movb	%dil, 940(%rsp)
	movb	909(%rdx), %dil
	movb	%dil, 941(%rsp)
	movb	910(%rdx), %dil
	movb	%dil, 942(%rsp)
	movb	911(%rdx), %dil
	movb	%dil, 943(%rsp)
	movb	912(%rdx), %dil
	movb	%dil, 944(%rsp)
	movb	913(%rdx), %dil
	movb	%dil, 945(%rsp)
	movb	914(%rdx), %dil
	movb	%dil, 946(%rsp)
	movb	915(%rdx), %dil
	movb	%dil, 947(%rsp)
	movb	916(%rdx), %dil
	movb	%dil, 948(%rsp)
	movb	917(%rdx), %dil
	movb	%dil, 949(%rsp)
	movb	918(%rdx), %dil
	movb	%dil, 950(%rsp)
	movb	919(%rdx), %dil
	movb	%dil, 951(%rsp)
	movb	920(%rdx), %dil
	movb	%dil, 952(%rsp)
	movb	921(%rdx), %dil
	movb	%dil, 953(%rsp)
	movb	922(%rdx), %dil
	movb	%dil, 954(%rsp)
	movb	923(%rdx), %dil
	movb	%dil, 955(%rsp)
	movb	924(%rdx), %dil
	movb	%dil, 956(%rsp)
	movb	925(%rdx), %dil
	movb	%dil, 957(%rsp)
	movb	926(%rdx), %dil
	movb	%dil, 958(%rsp)
	movb	927(%rdx), %dil
	movb	%dil, 959(%rsp)
	movb	928(%rdx), %dil
	movb	%dil, 960(%rsp)
	movb	929(%rdx), %dil
	movb	%dil, 961(%rsp)
	movb	930(%rdx), %dil
	movb	%dil, 962(%rsp)
	movb	931(%rdx), %dil
	movb	%dil, 963(%rsp)
	movb	932(%rdx), %dil
	movb	%dil, 964(%rsp)
	movb	933(%rdx), %dil
	movb	%dil, 965(%rsp)
	movb	934(%rdx), %dil
	movb	%dil, 966(%rsp)
	movb	935(%rdx), %dil
	movb	%dil, 967(%rsp)
	movb	936(%rdx), %dil
	movb	%dil, 968(%rsp)
	movb	937(%rdx), %dil
	movb	%dil, 969(%rsp)
	movb	938(%rdx), %dil
	movb	%dil, 970(%rsp)
	movb	939(%rdx), %dil
	movb	%dil, 971(%rsp)
	movb	940(%rdx), %dil
	movb	%dil, 972(%rsp)
	movb	941(%rdx), %dil
	movb	%dil, 973(%rsp)
	movb	942(%rdx), %dil
	movb	%dil, 974(%rsp)
	movb	943(%rdx), %dil
	movb	%dil, 975(%rsp)
	movb	944(%rdx), %dil
	movb	%dil, 976(%rsp)
	movb	945(%rdx), %dil
	movb	%dil, 977(%rsp)
	movb	946(%rdx), %dil
	movb	%dil, 978(%rsp)
	movb	947(%rdx), %dil
	movb	%dil, 979(%rsp)
	movb	948(%rdx), %dil
	movb	%dil, 980(%rsp)
	movb	949(%rdx), %dil
	movb	%dil, 981(%rsp)
	movb	950(%rdx), %dil
	movb	%dil, 982(%rsp)
	movb	951(%rdx), %dil
	movb	%dil, 983(%rsp)
	movb	952(%rdx), %dil
	movb	%dil, 984(%rsp)
	movb	953(%rdx), %dil
	movb	%dil, 985(%rsp)
	movb	954(%rdx), %dil
	movb	%dil, 986(%rsp)
	movb	955(%rdx), %dil
	movb	%dil, 987(%rsp)
	movb	956(%rdx), %dil
	movb	%dil, 988(%rsp)
	movb	957(%rdx), %dil
	movb	%dil, 989(%rsp)
	movb	958(%rdx), %dil
	movb	%dil, 990(%rsp)
	movb	959(%rdx), %dil
	movb	%dil, 991(%rsp)
	movb	960(%rdx), %dil
	movb	%dil, 992(%rsp)
	movb	961(%rdx), %dil
	movb	%dil, 993(%rsp)
	movb	962(%rdx), %dil
	movb	%dil, 994(%rsp)
	movb	963(%rdx), %dil
	movb	%dil, 995(%rsp)
	movb	964(%rdx), %dil
	movb	%dil, 996(%rsp)
	movb	965(%rdx), %dil
	movb	%dil, 997(%rsp)
	movb	966(%rdx), %dil
	movb	%dil, 998(%rsp)
	movb	967(%rdx), %dil
	movb	%dil, 999(%rsp)
	movb	968(%rdx), %dil
	movb	%dil, 1000(%rsp)
	movb	969(%rdx), %dil
	movb	%dil, 1001(%rsp)
	movb	970(%rdx), %dil
	movb	%dil, 1002(%rsp)
	movb	971(%rdx), %dil
	movb	%dil, 1003(%rsp)
	movb	972(%rdx), %dil
	movb	%dil, 1004(%rsp)
	movb	973(%rdx), %dil
	movb	%dil, 1005(%rsp)
	movb	974(%rdx), %dil
	movb	%dil, 1006(%rsp)
	movb	975(%rdx), %dil
	movb	%dil, 1007(%rsp)
	movb	976(%rdx), %dil
	movb	%dil, 1008(%rsp)
	movb	977(%rdx), %dil
	movb	%dil, 1009(%rsp)
	movb	978(%rdx), %dil
	movb	%dil, 1010(%rsp)
	movb	979(%rdx), %dil
	movb	%dil, 1011(%rsp)
	movb	980(%rdx), %dil
	movb	%dil, 1012(%rsp)
	movb	981(%rdx), %dil
	movb	%dil, 1013(%rsp)
	movb	982(%rdx), %dil
	movb	%dil, 1014(%rsp)
	movb	983(%rdx), %dil
	movb	%dil, 1015(%rsp)
	movb	984(%rdx), %dil
	movb	%dil, 1016(%rsp)
	movb	985(%rdx), %dil
	movb	%dil, 1017(%rsp)
	movb	986(%rdx), %dil
	movb	%dil, 1018(%rsp)
	movb	987(%rdx), %dil
	movb	%dil, 1019(%rsp)
	movb	988(%rdx), %dil
	movb	%dil, 1020(%rsp)
	movb	989(%rdx), %dil
	movb	%dil, 1021(%rsp)
	movb	990(%rdx), %dil
	movb	%dil, 1022(%rsp)
	movb	991(%rdx), %dil
	movb	%dil, 1023(%rsp)
	movb	992(%rdx), %dil
	movb	%dil, 1024(%rsp)
	movb	993(%rdx), %dil
	movb	%dil, 1025(%rsp)
	movb	994(%rdx), %dil
	movb	%dil, 1026(%rsp)
	movb	995(%rdx), %dil
	movb	%dil, 1027(%rsp)
	movb	996(%rdx), %dil
	movb	%dil, 1028(%rsp)
	movb	997(%rdx), %dil
	movb	%dil, 1029(%rsp)
	movb	998(%rdx), %dil
	movb	%dil, 1030(%rsp)
	movb	999(%rdx), %dil
	movb	%dil, 1031(%rsp)
	movb	1000(%rdx), %dil
	movb	%dil, 1032(%rsp)
	movb	1001(%rdx), %dil
	movb	%dil, 1033(%rsp)
	movb	1002(%rdx), %dil
	movb	%dil, 1034(%rsp)
	movb	1003(%rdx), %dil
	movb	%dil, 1035(%rsp)
	movb	1004(%rdx), %dil
	movb	%dil, 1036(%rsp)
	movb	1005(%rdx), %dil
	movb	%dil, 1037(%rsp)
	movb	1006(%rdx), %dil
	movb	%dil, 1038(%rsp)
	movb	1007(%rdx), %dil
	movb	%dil, 1039(%rsp)
	movb	1008(%rdx), %dil
	movb	%dil, 1040(%rsp)
	movb	1009(%rdx), %dil
	movb	%dil, 1041(%rsp)
	movb	1010(%rdx), %dil
	movb	%dil, 1042(%rsp)
	movb	1011(%rdx), %dil
	movb	%dil, 1043(%rsp)
	movb	1012(%rdx), %dil
	movb	%dil, 1044(%rsp)
	movb	1013(%rdx), %dil
	movb	%dil, 1045(%rsp)
	movb	1014(%rdx), %dil
	movb	%dil, 1046(%rsp)
	movb	1015(%rdx), %dil
	movb	%dil, 1047(%rsp)
	movb	1016(%rdx), %dil
	movb	%dil, 1048(%rsp)
	movb	1017(%rdx), %dil
	movb	%dil, 1049(%rsp)
	movb	1018(%rdx), %dil
	movb	%dil, 1050(%rsp)
	movb	1019(%rdx), %dil
	movb	%dil, 1051(%rsp)
	movb	1020(%rdx), %dil
	movb	%dil, 1052(%rsp)
	movb	1021(%rdx), %dil
	movb	%dil, 1053(%rsp)
	movb	1022(%rdx), %dil
	movb	%dil, 1054(%rsp)
	movb	1023(%rdx), %dil
	movb	%dil, 1055(%rsp)
	movb	1024(%rdx), %dil
	movb	%dil, 1056(%rsp)
	movb	1025(%rdx), %dil
	movb	%dil, 1057(%rsp)
	movb	1026(%rdx), %dil
	movb	%dil, 1058(%rsp)
	movb	1027(%rdx), %dil
	movb	%dil, 1059(%rsp)
	movb	1028(%rdx), %dil
	movb	%dil, 1060(%rsp)
	movb	1029(%rdx), %dil
	movb	%dil, 1061(%rsp)
	movb	1030(%rdx), %dil
	movb	%dil, 1062(%rsp)
	movb	1031(%rdx), %dil
	movb	%dil, 1063(%rsp)
	movb	1032(%rdx), %dil
	movb	%dil, 1064(%rsp)
	movb	1033(%rdx), %dil
	movb	%dil, 1065(%rsp)
	movb	1034(%rdx), %dil
	movb	%dil, 1066(%rsp)
	movb	1035(%rdx), %dil
	movb	%dil, 1067(%rsp)
	movb	1036(%rdx), %dil
	movb	%dil, 1068(%rsp)
	movb	1037(%rdx), %dil
	movb	%dil, 1069(%rsp)
	movb	1038(%rdx), %dil
	movb	%dil, 1070(%rsp)
	movb	1039(%rdx), %dil
	movb	%dil, 1071(%rsp)
	movb	1040(%rdx), %dil
	movb	%dil, 1072(%rsp)
	movb	1041(%rdx), %dil
	movb	%dil, 1073(%rsp)
	movb	1042(%rdx), %dil
	movb	%dil, 1074(%rsp)
	movb	1043(%rdx), %dil
	movb	%dil, 1075(%rsp)
	movb	1044(%rdx), %dil
	movb	%dil, 1076(%rsp)
	movb	1045(%rdx), %dil
	movb	%dil, 1077(%rsp)
	movb	1046(%rdx), %dil
	movb	%dil, 1078(%rsp)
	movb	1047(%rdx), %dil
	movb	%dil, 1079(%rsp)
	movb	1048(%rdx), %dil
	movb	%dil, 1080(%rsp)
	movb	1049(%rdx), %dil
	movb	%dil, 1081(%rsp)
	movb	1050(%rdx), %dil
	movb	%dil, 1082(%rsp)
	movb	1051(%rdx), %dil
	movb	%dil, 1083(%rsp)
	movb	1052(%rdx), %dil
	movb	%dil, 1084(%rsp)
	movb	1053(%rdx), %dil
	movb	%dil, 1085(%rsp)
	movb	1054(%rdx), %dil
	movb	%dil, 1086(%rsp)
	movb	1055(%rdx), %dil
	movb	%dil, 1087(%rsp)
	movb	1056(%rdx), %dil
	movb	%dil, 1088(%rsp)
	movb	1057(%rdx), %dil
	movb	%dil, 1089(%rsp)
	movb	1058(%rdx), %dil
	movb	%dil, 1090(%rsp)
	movb	1059(%rdx), %dil
	movb	%dil, 1091(%rsp)
	movb	1060(%rdx), %dil
	movb	%dil, 1092(%rsp)
	movb	1061(%rdx), %dil
	movb	%dil, 1093(%rsp)
	movb	1062(%rdx), %dil
	movb	%dil, 1094(%rsp)
	movb	1063(%rdx), %dil
	movb	%dil, 1095(%rsp)
	movb	1064(%rdx), %dil
	movb	%dil, 1096(%rsp)
	movb	1065(%rdx), %dil
	movb	%dil, 1097(%rsp)
	movb	1066(%rdx), %dil
	movb	%dil, 1098(%rsp)
	movb	1067(%rdx), %dil
	movb	%dil, 1099(%rsp)
	movb	1068(%rdx), %dil
	movb	%dil, 1100(%rsp)
	movb	1069(%rdx), %dil
	movb	%dil, 1101(%rsp)
	movb	1070(%rdx), %dil
	movb	%dil, 1102(%rsp)
	movb	1071(%rdx), %dil
	movb	%dil, 1103(%rsp)
	movb	1072(%rdx), %dil
	movb	%dil, 1104(%rsp)
	movb	1073(%rdx), %dil
	movb	%dil, 1105(%rsp)
	movb	1074(%rdx), %dil
	movb	%dil, 1106(%rsp)
	movb	1075(%rdx), %dil
	movb	%dil, 1107(%rsp)
	movb	1076(%rdx), %dil
	movb	%dil, 1108(%rsp)
	movb	1077(%rdx), %dil
	movb	%dil, 1109(%rsp)
	movb	1078(%rdx), %dil
	movb	%dil, 1110(%rsp)
	movb	1079(%rdx), %dil
	movb	%dil, 1111(%rsp)
	movb	1080(%rdx), %dil
	movb	%dil, 1112(%rsp)
	movb	1081(%rdx), %dil
	movb	%dil, 1113(%rsp)
	movb	1082(%rdx), %dil
	movb	%dil, 1114(%rsp)
	movb	1083(%rdx), %dil
	movb	%dil, 1115(%rsp)
	movb	1084(%rdx), %dil
	movb	%dil, 1116(%rsp)
	movb	1085(%rdx), %dil
	movb	%dil, 1117(%rsp)
	movb	1086(%rdx), %dil
	movb	%dil, 1118(%rsp)
	movb	1087(%rdx), %dil
	movb	%dil, 1119(%rsp)
	movb	1088(%rdx), %dil
	movb	%dil, 1120(%rsp)
	movb	1089(%rdx), %dil
	movb	%dil, 1121(%rsp)
	movb	1090(%rdx), %dil
	movb	%dil, 1122(%rsp)
	movb	1091(%rdx), %dil
	movb	%dil, 1123(%rsp)
	movb	1092(%rdx), %dil
	movb	%dil, 1124(%rsp)
	movb	1093(%rdx), %dil
	movb	%dil, 1125(%rsp)
	movb	1094(%rdx), %dil
	movb	%dil, 1126(%rsp)
	movb	1095(%rdx), %dil
	movb	%dil, 1127(%rsp)
	movb	1096(%rdx), %dil
	movb	%dil, 1128(%rsp)
	movb	1097(%rdx), %dil
	movb	%dil, 1129(%rsp)
	movb	1098(%rdx), %dil
	movb	%dil, 1130(%rsp)
	movb	1099(%rdx), %dil
	movb	%dil, 1131(%rsp)
	movb	1100(%rdx), %dil
	movb	%dil, 1132(%rsp)
	movb	1101(%rdx), %dil
	movb	%dil, 1133(%rsp)
	movb	1102(%rdx), %dil
	movb	%dil, 1134(%rsp)
	movb	1103(%rdx), %dil
	movb	%dil, 1135(%rsp)
	movb	1104(%rdx), %dil
	movb	%dil, 1136(%rsp)
	movb	1105(%rdx), %dil
	movb	%dil, 1137(%rsp)
	movb	1106(%rdx), %dil
	movb	%dil, 1138(%rsp)
	movb	1107(%rdx), %dil
	movb	%dil, 1139(%rsp)
	movb	1108(%rdx), %dil
	movb	%dil, 1140(%rsp)
	movb	1109(%rdx), %dil
	movb	%dil, 1141(%rsp)
	movb	1110(%rdx), %dil
	movb	%dil, 1142(%rsp)
	movb	1111(%rdx), %dil
	movb	%dil, 1143(%rsp)
	movb	1112(%rdx), %dil
	movb	%dil, 1144(%rsp)
	movb	1113(%rdx), %dil
	movb	%dil, 1145(%rsp)
	movb	1114(%rdx), %dil
	movb	%dil, 1146(%rsp)
	movb	1115(%rdx), %dil
	movb	%dil, 1147(%rsp)
	movb	1116(%rdx), %dil
	movb	%dil, 1148(%rsp)
	movb	1117(%rdx), %dil
	movb	%dil, 1149(%rsp)
	movb	1118(%rdx), %dil
	movb	%dil, 1150(%rsp)
	movb	1119(%rdx), %dil
	movb	%dil, 1151(%rsp)
	movb	1120(%rdx), %dil
	movb	%dil, 1152(%rsp)
	movb	1121(%rdx), %dil
	movb	%dil, 1153(%rsp)
	movb	1122(%rdx), %dil
	movb	%dil, 1154(%rsp)
	movb	1123(%rdx), %dil
	movb	%dil, 1155(%rsp)
	movb	1124(%rdx), %dil
	movb	%dil, 1156(%rsp)
	movb	1125(%rdx), %dil
	movb	%dil, 1157(%rsp)
	movb	1126(%rdx), %dil
	movb	%dil, 1158(%rsp)
	movb	1127(%rdx), %dil
	movb	%dil, 1159(%rsp)
	movb	1128(%rdx), %dil
	movb	%dil, 1160(%rsp)
	movb	1129(%rdx), %dil
	movb	%dil, 1161(%rsp)
	movb	1130(%rdx), %dil
	movb	%dil, 1162(%rsp)
	movb	1131(%rdx), %dil
	movb	%dil, 1163(%rsp)
	movb	1132(%rdx), %dil
	movb	%dil, 1164(%rsp)
	movb	1133(%rdx), %dil
	movb	%dil, 1165(%rsp)
	movb	1134(%rdx), %dil
	movb	%dil, 1166(%rsp)
	movb	1135(%rdx), %dil
	movb	%dil, 1167(%rsp)
	movb	1136(%rdx), %dil
	movb	%dil, 1168(%rsp)
	movb	1137(%rdx), %dil
	movb	%dil, 1169(%rsp)
	movb	1138(%rdx), %dil
	movb	%dil, 1170(%rsp)
	movb	1139(%rdx), %dil
	movb	%dil, 1171(%rsp)
	movb	1140(%rdx), %dil
	movb	%dil, 1172(%rsp)
	movb	1141(%rdx), %dil
	movb	%dil, 1173(%rsp)
	movb	1142(%rdx), %dil
	movb	%dil, 1174(%rsp)
	movb	1143(%rdx), %dil
	movb	%dil, 1175(%rsp)
	movb	1144(%rdx), %dil
	movb	%dil, 1176(%rsp)
	movb	1145(%rdx), %dil
	movb	%dil, 1177(%rsp)
	movb	1146(%rdx), %dil
	movb	%dil, 1178(%rsp)
	movb	1147(%rdx), %dil
	movb	%dil, 1179(%rsp)
	movb	1148(%rdx), %dil
	movb	%dil, 1180(%rsp)
	movb	1149(%rdx), %dil
	movb	%dil, 1181(%rsp)
	movb	1150(%rdx), %dil
	movb	%dil, 1182(%rsp)
	movb	1151(%rdx), %dil
	movb	%dil, 1183(%rsp)
	movb	1152(%rdx), %dil
	movb	%dil, 1184(%rsp)
	movb	1153(%rdx), %dil
	movb	%dil, 1185(%rsp)
	movb	1154(%rdx), %dil
	movb	%dil, 1186(%rsp)
	movb	1155(%rdx), %dil
	movb	%dil, 1187(%rsp)
	movb	1156(%rdx), %dil
	movb	%dil, 1188(%rsp)
	movb	1157(%rdx), %dil
	movb	%dil, 1189(%rsp)
	movb	1158(%rdx), %dil
	movb	%dil, 1190(%rsp)
	movb	1159(%rdx), %dil
	movb	%dil, 1191(%rsp)
	movb	1160(%rdx), %dil
	movb	%dil, 1192(%rsp)
	movb	1161(%rdx), %dil
	movb	%dil, 1193(%rsp)
	movb	1162(%rdx), %dil
	movb	%dil, 1194(%rsp)
	movb	1163(%rdx), %dil
	movb	%dil, 1195(%rsp)
	movb	1164(%rdx), %dil
	movb	%dil, 1196(%rsp)
	movb	1165(%rdx), %dil
	movb	%dil, 1197(%rsp)
	movb	1166(%rdx), %dil
	movb	%dil, 1198(%rsp)
	movb	1167(%rdx), %dil
	movb	%dil, 1199(%rsp)
	movb	1168(%rdx), %dil
	movb	%dil, 1200(%rsp)
	movb	1169(%rdx), %dil
	movb	%dil, 1201(%rsp)
	movb	1170(%rdx), %dil
	movb	%dil, 1202(%rsp)
	movb	1171(%rdx), %dil
	movb	%dil, 1203(%rsp)
	movb	1172(%rdx), %dil
	movb	%dil, 1204(%rsp)
	movb	1173(%rdx), %dil
	movb	%dil, 1205(%rsp)
	movb	1174(%rdx), %dil
	movb	%dil, 1206(%rsp)
	movb	1175(%rdx), %dil
	movb	%dil, 1207(%rsp)
	movb	1176(%rdx), %dil
	movb	%dil, 1208(%rsp)
	movb	1177(%rdx), %dil
	movb	%dil, 1209(%rsp)
	movb	1178(%rdx), %dil
	movb	%dil, 1210(%rsp)
	movb	1179(%rdx), %dil
	movb	%dil, 1211(%rsp)
	movb	1180(%rdx), %dil
	movb	%dil, 1212(%rsp)
	movb	1181(%rdx), %dil
	movb	%dil, 1213(%rsp)
	movb	1182(%rdx), %dil
	movb	%dil, 1214(%rsp)
	movb	1183(%rdx), %dil
	movb	%dil, 1215(%rsp)
	movb	1184(%rdx), %dil
	movb	%dil, 1216(%rsp)
	movb	1185(%rdx), %dil
	movb	%dil, 1217(%rsp)
	movb	1186(%rdx), %dil
	movb	%dil, 1218(%rsp)
	movb	1187(%rdx), %dil
	movb	%dil, 1219(%rsp)
	movb	1188(%rdx), %dil
	movb	%dil, 1220(%rsp)
	movb	1189(%rdx), %dil
	movb	%dil, 1221(%rsp)
	movb	1190(%rdx), %dil
	movb	%dil, 1222(%rsp)
	movb	1191(%rdx), %dil
	movb	%dil, 1223(%rsp)
	movb	1192(%rdx), %dil
	movb	%dil, 1224(%rsp)
	movb	1193(%rdx), %dil
	movb	%dil, 1225(%rsp)
	movb	1194(%rdx), %dil
	movb	%dil, 1226(%rsp)
	movb	1195(%rdx), %dil
	movb	%dil, 1227(%rsp)
	movb	1196(%rdx), %dil
	movb	%dil, 1228(%rsp)
	movb	1197(%rdx), %dil
	movb	%dil, 1229(%rsp)
	movb	1198(%rdx), %dil
	movb	%dil, 1230(%rsp)
	movb	1199(%rdx), %dil
	movb	%dil, 1231(%rsp)
	movb	1200(%rdx), %dil
	movb	%dil, 1232(%rsp)
	movb	1201(%rdx), %dil
	movb	%dil, 1233(%rsp)
	movb	1202(%rdx), %dil
	movb	%dil, 1234(%rsp)
	movb	1203(%rdx), %dil
	movb	%dil, 1235(%rsp)
	movb	1204(%rdx), %dil
	movb	%dil, 1236(%rsp)
	movb	1205(%rdx), %dil
	movb	%dil, 1237(%rsp)
	movb	1206(%rdx), %dil
	movb	%dil, 1238(%rsp)
	movb	1207(%rdx), %dil
	movb	%dil, 1239(%rsp)
	movb	1208(%rdx), %dil
	movb	%dil, 1240(%rsp)
	movb	1209(%rdx), %dil
	movb	%dil, 1241(%rsp)
	movb	1210(%rdx), %dil
	movb	%dil, 1242(%rsp)
	movb	1211(%rdx), %dil
	movb	%dil, 1243(%rsp)
	movb	1212(%rdx), %dil
	movb	%dil, 1244(%rsp)
	movb	1213(%rdx), %dil
	movb	%dil, 1245(%rsp)
	movb	1214(%rdx), %dil
	movb	%dil, 1246(%rsp)
	movb	1215(%rdx), %dil
	movb	%dil, 1247(%rsp)
	movb	1216(%rdx), %dil
	movb	%dil, 1248(%rsp)
	movb	1217(%rdx), %dil
	movb	%dil, 1249(%rsp)
	movb	1218(%rdx), %dil
	movb	%dil, 1250(%rsp)
	movb	1219(%rdx), %dil
	movb	%dil, 1251(%rsp)
	movb	1220(%rdx), %dil
	movb	%dil, 1252(%rsp)
	movb	1221(%rdx), %dil
	movb	%dil, 1253(%rsp)
	movb	1222(%rdx), %dil
	movb	%dil, 1254(%rsp)
	movb	1223(%rdx), %dil
	movb	%dil, 1255(%rsp)
	movb	1224(%rdx), %dil
	movb	%dil, 1256(%rsp)
	movb	1225(%rdx), %dil
	movb	%dil, 1257(%rsp)
	movb	1226(%rdx), %dil
	movb	%dil, 1258(%rsp)
	movb	1227(%rdx), %dil
	movb	%dil, 1259(%rsp)
	movb	1228(%rdx), %dil
	movb	%dil, 1260(%rsp)
	movb	1229(%rdx), %dil
	movb	%dil, 1261(%rsp)
	movb	1230(%rdx), %dil
	movb	%dil, 1262(%rsp)
	movb	1231(%rdx), %dil
	movb	%dil, 1263(%rsp)
	movb	1232(%rdx), %dil
	movb	%dil, 1264(%rsp)
	movb	1233(%rdx), %dil
	movb	%dil, 1265(%rsp)
	movb	1234(%rdx), %dil
	movb	%dil, 1266(%rsp)
	movb	1235(%rdx), %dil
	movb	%dil, 1267(%rsp)
	movb	1236(%rdx), %dil
	movb	%dil, 1268(%rsp)
	movb	1237(%rdx), %dil
	movb	%dil, 1269(%rsp)
	movb	1238(%rdx), %dil
	movb	%dil, 1270(%rsp)
	movb	1239(%rdx), %dil
	movb	%dil, 1271(%rsp)
	movb	1240(%rdx), %dil
	movb	%dil, 1272(%rsp)
	movb	1241(%rdx), %dil
	movb	%dil, 1273(%rsp)
	movb	1242(%rdx), %dil
	movb	%dil, 1274(%rsp)
	movb	1243(%rdx), %dil
	movb	%dil, 1275(%rsp)
	movb	1244(%rdx), %dil
	movb	%dil, 1276(%rsp)
	movb	1245(%rdx), %dil
	movb	%dil, 1277(%rsp)
	movb	1246(%rdx), %dil
	movb	%dil, 1278(%rsp)
	movb	1247(%rdx), %dil
	movb	%dil, 1279(%rsp)
	movb	1248(%rdx), %dil
	movb	%dil, 1280(%rsp)
	movb	1249(%rdx), %dil
	movb	%dil, 1281(%rsp)
	movb	1250(%rdx), %dil
	movb	%dil, 1282(%rsp)
	movb	1251(%rdx), %dil
	movb	%dil, 1283(%rsp)
	movb	1252(%rdx), %dil
	movb	%dil, 1284(%rsp)
	movb	1253(%rdx), %dil
	movb	%dil, 1285(%rsp)
	movb	1254(%rdx), %dil
	movb	%dil, 1286(%rsp)
	movb	1255(%rdx), %dil
	movb	%dil, 1287(%rsp)
	movb	1256(%rdx), %dil
	movb	%dil, 1288(%rsp)
	movb	1257(%rdx), %dil
	movb	%dil, 1289(%rsp)
	movb	1258(%rdx), %dil
	movb	%dil, 1290(%rsp)
	movb	1259(%rdx), %dil
	movb	%dil, 1291(%rsp)
	movb	1260(%rdx), %dil
	movb	%dil, 1292(%rsp)
	movb	1261(%rdx), %dil
	movb	%dil, 1293(%rsp)
	movb	1262(%rdx), %dil
	movb	%dil, 1294(%rsp)
	movb	1263(%rdx), %dil
	movb	%dil, 1295(%rsp)
	movb	1264(%rdx), %dil
	movb	%dil, 1296(%rsp)
	movb	1265(%rdx), %dil
	movb	%dil, 1297(%rsp)
	movb	1266(%rdx), %dil
	movb	%dil, 1298(%rsp)
	movb	1267(%rdx), %dil
	movb	%dil, 1299(%rsp)
	movb	1268(%rdx), %dil
	movb	%dil, 1300(%rsp)
	movb	1269(%rdx), %dil
	movb	%dil, 1301(%rsp)
	movb	1270(%rdx), %dil
	movb	%dil, 1302(%rsp)
	movb	1271(%rdx), %dil
	movb	%dil, 1303(%rsp)
	movb	1272(%rdx), %dil
	movb	%dil, 1304(%rsp)
	movb	1273(%rdx), %dil
	movb	%dil, 1305(%rsp)
	movb	1274(%rdx), %dil
	movb	%dil, 1306(%rsp)
	movb	1275(%rdx), %dil
	movb	%dil, 1307(%rsp)
	movb	1276(%rdx), %dil
	movb	%dil, 1308(%rsp)
	movb	1277(%rdx), %dil
	movb	%dil, 1309(%rsp)
	movb	1278(%rdx), %dil
	movb	%dil, 1310(%rsp)
	movb	1279(%rdx), %dil
	movb	%dil, 1311(%rsp)
	movb	1280(%rdx), %dil
	movb	%dil, 1312(%rsp)
	movb	1281(%rdx), %dil
	movb	%dil, 1313(%rsp)
	movb	1282(%rdx), %dil
	movb	%dil, 1314(%rsp)
	movb	1283(%rdx), %dil
	movb	%dil, 1315(%rsp)
	movb	1284(%rdx), %dil
	movb	%dil, 1316(%rsp)
	movb	1285(%rdx), %dil
	movb	%dil, 1317(%rsp)
	movb	1286(%rdx), %dil
	movb	%dil, 1318(%rsp)
	movb	1287(%rdx), %dil
	movb	%dil, 1319(%rsp)
	movb	1288(%rdx), %dil
	movb	%dil, 1320(%rsp)
	movb	1289(%rdx), %dil
	movb	%dil, 1321(%rsp)
	movb	1290(%rdx), %dil
	movb	%dil, 1322(%rsp)
	movb	1291(%rdx), %dil
	movb	%dil, 1323(%rsp)
	movb	1292(%rdx), %dil
	movb	%dil, 1324(%rsp)
	movb	1293(%rdx), %dil
	movb	%dil, 1325(%rsp)
	movb	1294(%rdx), %dil
	movb	%dil, 1326(%rsp)
	movb	1295(%rdx), %dil
	movb	%dil, 1327(%rsp)
	movb	1296(%rdx), %dil
	movb	%dil, 1328(%rsp)
	movb	1297(%rdx), %dil
	movb	%dil, 1329(%rsp)
	movb	1298(%rdx), %dil
	movb	%dil, 1330(%rsp)
	movb	1299(%rdx), %dil
	movb	%dil, 1331(%rsp)
	movb	1300(%rdx), %dil
	movb	%dil, 1332(%rsp)
	movb	1301(%rdx), %dil
	movb	%dil, 1333(%rsp)
	movb	1302(%rdx), %dil
	movb	%dil, 1334(%rsp)
	movb	1303(%rdx), %dil
	movb	%dil, 1335(%rsp)
	movb	1304(%rdx), %dil
	movb	%dil, 1336(%rsp)
	movb	1305(%rdx), %dil
	movb	%dil, 1337(%rsp)
	movb	1306(%rdx), %dil
	movb	%dil, 1338(%rsp)
	movb	1307(%rdx), %dil
	movb	%dil, 1339(%rsp)
	movb	1308(%rdx), %dil
	movb	%dil, 1340(%rsp)
	movb	1309(%rdx), %dil
	movb	%dil, 1341(%rsp)
	movb	1310(%rdx), %dil
	movb	%dil, 1342(%rsp)
	movb	1311(%rdx), %dil
	movb	%dil, 1343(%rsp)
	movb	1312(%rdx), %dil
	movb	%dil, 1344(%rsp)
	movb	1313(%rdx), %dil
	movb	%dil, 1345(%rsp)
	movb	1314(%rdx), %dil
	movb	%dil, 1346(%rsp)
	movb	1315(%rdx), %dil
	movb	%dil, 1347(%rsp)
	movb	1316(%rdx), %dil
	movb	%dil, 1348(%rsp)
	movb	1317(%rdx), %dil
	movb	%dil, 1349(%rsp)
	movb	1318(%rdx), %dil
	movb	%dil, 1350(%rsp)
	movb	1319(%rdx), %dil
	movb	%dil, 1351(%rsp)
	movb	1320(%rdx), %dil
	movb	%dil, 1352(%rsp)
	movb	1321(%rdx), %dil
	movb	%dil, 1353(%rsp)
	movb	1322(%rdx), %dil
	movb	%dil, 1354(%rsp)
	movb	1323(%rdx), %dil
	movb	%dil, 1355(%rsp)
	movb	1324(%rdx), %dil
	movb	%dil, 1356(%rsp)
	movb	1325(%rdx), %dil
	movb	%dil, 1357(%rsp)
	movb	1326(%rdx), %dil
	movb	%dil, 1358(%rsp)
	movb	1327(%rdx), %dil
	movb	%dil, 1359(%rsp)
	movb	1328(%rdx), %dil
	movb	%dil, 1360(%rsp)
	movb	1329(%rdx), %dil
	movb	%dil, 1361(%rsp)
	movb	1330(%rdx), %dil
	movb	%dil, 1362(%rsp)
	movb	1331(%rdx), %dil
	movb	%dil, 1363(%rsp)
	movb	1332(%rdx), %dil
	movb	%dil, 1364(%rsp)
	movb	1333(%rdx), %dil
	movb	%dil, 1365(%rsp)
	movb	1334(%rdx), %dil
	movb	%dil, 1366(%rsp)
	movb	1335(%rdx), %dil
	movb	%dil, 1367(%rsp)
	movb	1336(%rdx), %dil
	movb	%dil, 1368(%rsp)
	movb	1337(%rdx), %dil
	movb	%dil, 1369(%rsp)
	movb	1338(%rdx), %dil
	movb	%dil, 1370(%rsp)
	movb	1339(%rdx), %dil
	movb	%dil, 1371(%rsp)
	movb	1340(%rdx), %dil
	movb	%dil, 1372(%rsp)
	movb	1341(%rdx), %dil
	movb	%dil, 1373(%rsp)
	movb	1342(%rdx), %dil
	movb	%dil, 1374(%rsp)
	movb	1343(%rdx), %dil
	movb	%dil, 1375(%rsp)
	movb	1344(%rdx), %dil
	movb	%dil, 1376(%rsp)
	movb	1345(%rdx), %dil
	movb	%dil, 1377(%rsp)
	movb	1346(%rdx), %dil
	movb	%dil, 1378(%rsp)
	movb	1347(%rdx), %dil
	movb	%dil, 1379(%rsp)
	movb	1348(%rdx), %dil
	movb	%dil, 1380(%rsp)
	movb	1349(%rdx), %dil
	movb	%dil, 1381(%rsp)
	movb	1350(%rdx), %dil
	movb	%dil, 1382(%rsp)
	movb	1351(%rdx), %dil
	movb	%dil, 1383(%rsp)
	movb	1352(%rdx), %dil
	movb	%dil, 1384(%rsp)
	movb	1353(%rdx), %dil
	movb	%dil, 1385(%rsp)
	movb	1354(%rdx), %dil
	movb	%dil, 1386(%rsp)
	movb	1355(%rdx), %dil
	movb	%dil, 1387(%rsp)
	movb	1356(%rdx), %dil
	movb	%dil, 1388(%rsp)
	movb	1357(%rdx), %dil
	movb	%dil, 1389(%rsp)
	movb	1358(%rdx), %dil
	movb	%dil, 1390(%rsp)
	movb	1359(%rdx), %dil
	movb	%dil, 1391(%rsp)
	movb	1360(%rdx), %dil
	movb	%dil, 1392(%rsp)
	movb	1361(%rdx), %dil
	movb	%dil, 1393(%rsp)
	movb	1362(%rdx), %dil
	movb	%dil, 1394(%rsp)
	movb	1363(%rdx), %dil
	movb	%dil, 1395(%rsp)
	movb	1364(%rdx), %dil
	movb	%dil, 1396(%rsp)
	movb	1365(%rdx), %dil
	movb	%dil, 1397(%rsp)
	movb	1366(%rdx), %dil
	movb	%dil, 1398(%rsp)
	movb	1367(%rdx), %dil
	movb	%dil, 1399(%rsp)
	movb	1368(%rdx), %dil
	movb	%dil, 1400(%rsp)
	movb	1369(%rdx), %dil
	movb	%dil, 1401(%rsp)
	movb	1370(%rdx), %dil
	movb	%dil, 1402(%rsp)
	movb	1371(%rdx), %dil
	movb	%dil, 1403(%rsp)
	movb	1372(%rdx), %dil
	movb	%dil, 1404(%rsp)
	movb	1373(%rdx), %dil
	movb	%dil, 1405(%rsp)
	movb	1374(%rdx), %dil
	movb	%dil, 1406(%rsp)
	movb	1375(%rdx), %dil
	movb	%dil, 1407(%rsp)
	movb	1376(%rdx), %dil
	movb	%dil, 1408(%rsp)
	movb	1377(%rdx), %dil
	movb	%dil, 1409(%rsp)
	movb	1378(%rdx), %dil
	movb	%dil, 1410(%rsp)
	movb	1379(%rdx), %dil
	movb	%dil, 1411(%rsp)
	movb	1380(%rdx), %dil
	movb	%dil, 1412(%rsp)
	movb	1381(%rdx), %dil
	movb	%dil, 1413(%rsp)
	movb	1382(%rdx), %dil
	movb	%dil, 1414(%rsp)
	movb	1383(%rdx), %dil
	movb	%dil, 1415(%rsp)
	movb	1384(%rdx), %dil
	movb	%dil, 1416(%rsp)
	movb	1385(%rdx), %dil
	movb	%dil, 1417(%rsp)
	movb	1386(%rdx), %dil
	movb	%dil, 1418(%rsp)
	movb	1387(%rdx), %dil
	movb	%dil, 1419(%rsp)
	movb	1388(%rdx), %dil
	movb	%dil, 1420(%rsp)
	movb	1389(%rdx), %dil
	movb	%dil, 1421(%rsp)
	movb	1390(%rdx), %dil
	movb	%dil, 1422(%rsp)
	movb	1391(%rdx), %dil
	movb	%dil, 1423(%rsp)
	movb	1392(%rdx), %dil
	movb	%dil, 1424(%rsp)
	movb	1393(%rdx), %dil
	movb	%dil, 1425(%rsp)
	movb	1394(%rdx), %dil
	movb	%dil, 1426(%rsp)
	movb	1395(%rdx), %dil
	movb	%dil, 1427(%rsp)
	movb	1396(%rdx), %dil
	movb	%dil, 1428(%rsp)
	movb	1397(%rdx), %dil
	movb	%dil, 1429(%rsp)
	movb	1398(%rdx), %dil
	movb	%dil, 1430(%rsp)
	movb	1399(%rdx), %dil
	movb	%dil, 1431(%rsp)
	movb	1400(%rdx), %dil
	movb	%dil, 1432(%rsp)
	movb	1401(%rdx), %dil
	movb	%dil, 1433(%rsp)
	movb	1402(%rdx), %dil
	movb	%dil, 1434(%rsp)
	movb	1403(%rdx), %dil
	movb	%dil, 1435(%rsp)
	movb	1404(%rdx), %dil
	movb	%dil, 1436(%rsp)
	movb	1405(%rdx), %dil
	movb	%dil, 1437(%rsp)
	movb	1406(%rdx), %dil
	movb	%dil, 1438(%rsp)
	movb	1407(%rdx), %dil
	movb	%dil, 1439(%rsp)
	movb	1408(%rdx), %dil
	movb	%dil, 1440(%rsp)
	movb	1409(%rdx), %dil
	movb	%dil, 1441(%rsp)
	movb	1410(%rdx), %dil
	movb	%dil, 1442(%rsp)
	movb	1411(%rdx), %dil
	movb	%dil, 1443(%rsp)
	movb	1412(%rdx), %dil
	movb	%dil, 1444(%rsp)
	movb	1413(%rdx), %dil
	movb	%dil, 1445(%rsp)
	movb	1414(%rdx), %dil
	movb	%dil, 1446(%rsp)
	movb	1415(%rdx), %dil
	movb	%dil, 1447(%rsp)
	movb	1416(%rdx), %dil
	movb	%dil, 1448(%rsp)
	movb	1417(%rdx), %dil
	movb	%dil, 1449(%rsp)
	movb	1418(%rdx), %dil
	movb	%dil, 1450(%rsp)
	movb	1419(%rdx), %dil
	movb	%dil, 1451(%rsp)
	movb	1420(%rdx), %dil
	movb	%dil, 1452(%rsp)
	movb	1421(%rdx), %dil
	movb	%dil, 1453(%rsp)
	movb	1422(%rdx), %dil
	movb	%dil, 1454(%rsp)
	movb	1423(%rdx), %dil
	movb	%dil, 1455(%rsp)
	movb	1424(%rdx), %dil
	movb	%dil, 1456(%rsp)
	movb	1425(%rdx), %dil
	movb	%dil, 1457(%rsp)
	movb	1426(%rdx), %dil
	movb	%dil, 1458(%rsp)
	movb	1427(%rdx), %dil
	movb	%dil, 1459(%rsp)
	movb	1428(%rdx), %dil
	movb	%dil, 1460(%rsp)
	movb	1429(%rdx), %dil
	movb	%dil, 1461(%rsp)
	movb	1430(%rdx), %dil
	movb	%dil, 1462(%rsp)
	movb	1431(%rdx), %dil
	movb	%dil, 1463(%rsp)
	movb	1432(%rdx), %dil
	movb	%dil, 1464(%rsp)
	movb	1433(%rdx), %dil
	movb	%dil, 1465(%rsp)
	movb	1434(%rdx), %dil
	movb	%dil, 1466(%rsp)
	movb	1435(%rdx), %dil
	movb	%dil, 1467(%rsp)
	movb	1436(%rdx), %dil
	movb	%dil, 1468(%rsp)
	movb	1437(%rdx), %dil
	movb	%dil, 1469(%rsp)
	movb	1438(%rdx), %dil
	movb	%dil, 1470(%rsp)
	movb	1439(%rdx), %dil
	movb	%dil, 1471(%rsp)
	movb	1440(%rdx), %dil
	movb	%dil, 1472(%rsp)
	movb	1441(%rdx), %dil
	movb	%dil, 1473(%rsp)
	movb	1442(%rdx), %dil
	movb	%dil, 1474(%rsp)
	movb	1443(%rdx), %dil
	movb	%dil, 1475(%rsp)
	movb	1444(%rdx), %dil
	movb	%dil, 1476(%rsp)
	movb	1445(%rdx), %dil
	movb	%dil, 1477(%rsp)
	movb	1446(%rdx), %dil
	movb	%dil, 1478(%rsp)
	movb	1447(%rdx), %dil
	movb	%dil, 1479(%rsp)
	movb	1448(%rdx), %dil
	movb	%dil, 1480(%rsp)
	movb	1449(%rdx), %dil
	movb	%dil, 1481(%rsp)
	movb	1450(%rdx), %dil
	movb	%dil, 1482(%rsp)
	movb	1451(%rdx), %dil
	movb	%dil, 1483(%rsp)
	movb	1452(%rdx), %dil
	movb	%dil, 1484(%rsp)
	movb	1453(%rdx), %dil
	movb	%dil, 1485(%rsp)
	movb	1454(%rdx), %dil
	movb	%dil, 1486(%rsp)
	movb	1455(%rdx), %dil
	movb	%dil, 1487(%rsp)
	movb	1456(%rdx), %dil
	movb	%dil, 1488(%rsp)
	movb	1457(%rdx), %dil
	movb	%dil, 1489(%rsp)
	movb	1458(%rdx), %dil
	movb	%dil, 1490(%rsp)
	movb	1459(%rdx), %dil
	movb	%dil, 1491(%rsp)
	movb	1460(%rdx), %dil
	movb	%dil, 1492(%rsp)
	movb	1461(%rdx), %dil
	movb	%dil, 1493(%rsp)
	movb	1462(%rdx), %dil
	movb	%dil, 1494(%rsp)
	movb	1463(%rdx), %dil
	movb	%dil, 1495(%rsp)
	movb	1464(%rdx), %dil
	movb	%dil, 1496(%rsp)
	movb	1465(%rdx), %dil
	movb	%dil, 1497(%rsp)
	movb	1466(%rdx), %dil
	movb	%dil, 1498(%rsp)
	movb	1467(%rdx), %dil
	movb	%dil, 1499(%rsp)
	movb	1468(%rdx), %dil
	movb	%dil, 1500(%rsp)
	movb	1469(%rdx), %dil
	movb	%dil, 1501(%rsp)
	movb	1470(%rdx), %dil
	movb	%dil, 1502(%rsp)
	movb	1471(%rdx), %dil
	movb	%dil, 1503(%rsp)
	movb	1472(%rdx), %dil
	movb	%dil, 1504(%rsp)
	movb	1473(%rdx), %dil
	movb	%dil, 1505(%rsp)
	movb	1474(%rdx), %dil
	movb	%dil, 1506(%rsp)
	movb	1475(%rdx), %dil
	movb	%dil, 1507(%rsp)
	movb	1476(%rdx), %dil
	movb	%dil, 1508(%rsp)
	movb	1477(%rdx), %dil
	movb	%dil, 1509(%rsp)
	movb	1478(%rdx), %dil
	movb	%dil, 1510(%rsp)
	movb	1479(%rdx), %dil
	movb	%dil, 1511(%rsp)
	movb	1480(%rdx), %dil
	movb	%dil, 1512(%rsp)
	movb	1481(%rdx), %dil
	movb	%dil, 1513(%rsp)
	movb	1482(%rdx), %dil
	movb	%dil, 1514(%rsp)
	movb	1483(%rdx), %dil
	movb	%dil, 1515(%rsp)
	movb	1484(%rdx), %dil
	movb	%dil, 1516(%rsp)
	movb	1485(%rdx), %dil
	movb	%dil, 1517(%rsp)
	movb	1486(%rdx), %dil
	movb	%dil, 1518(%rsp)
	movb	1487(%rdx), %dil
	movb	%dil, 1519(%rsp)
	movb	1488(%rdx), %dil
	movb	%dil, 1520(%rsp)
	movb	1489(%rdx), %dil
	movb	%dil, 1521(%rsp)
	movb	1490(%rdx), %dil
	movb	%dil, 1522(%rsp)
	movb	1491(%rdx), %dil
	movb	%dil, 1523(%rsp)
	movb	1492(%rdx), %dil
	movb	%dil, 1524(%rsp)
	movb	1493(%rdx), %dil
	movb	%dil, 1525(%rsp)
	movb	1494(%rdx), %dil
	movb	%dil, 1526(%rsp)
	movb	1495(%rdx), %dil
	movb	%dil, 1527(%rsp)
	movb	1496(%rdx), %dil
	movb	%dil, 1528(%rsp)
	movb	1497(%rdx), %dil
	movb	%dil, 1529(%rsp)
	movb	1498(%rdx), %dil
	movb	%dil, 1530(%rsp)
	movb	1499(%rdx), %dil
	movb	%dil, 1531(%rsp)
	movb	1500(%rdx), %dil
	movb	%dil, 1532(%rsp)
	movb	1501(%rdx), %dil
	movb	%dil, 1533(%rsp)
	movb	1502(%rdx), %dil
	movb	%dil, 1534(%rsp)
	movb	1503(%rdx), %dil
	movb	%dil, 1535(%rsp)
	movb	1504(%rdx), %dil
	movb	%dil, 1536(%rsp)
	movb	1505(%rdx), %dil
	movb	%dil, 1537(%rsp)
	movb	1506(%rdx), %dil
	movb	%dil, 1538(%rsp)
	movb	1507(%rdx), %dil
	movb	%dil, 1539(%rsp)
	movb	1508(%rdx), %dil
	movb	%dil, 1540(%rsp)
	movb	1509(%rdx), %dil
	movb	%dil, 1541(%rsp)
	movb	1510(%rdx), %dil
	movb	%dil, 1542(%rsp)
	movb	1511(%rdx), %dil
	movb	%dil, 1543(%rsp)
	movb	1512(%rdx), %dil
	movb	%dil, 1544(%rsp)
	movb	1513(%rdx), %dil
	movb	%dil, 1545(%rsp)
	movb	1514(%rdx), %dil
	movb	%dil, 1546(%rsp)
	movb	1515(%rdx), %dil
	movb	%dil, 1547(%rsp)
	movb	1516(%rdx), %dil
	movb	%dil, 1548(%rsp)
	movb	1517(%rdx), %dil
	movb	%dil, 1549(%rsp)
	movb	1518(%rdx), %dil
	movb	%dil, 1550(%rsp)
	movb	1519(%rdx), %dil
	movb	%dil, 1551(%rsp)
	movb	1520(%rdx), %dil
	movb	%dil, 1552(%rsp)
	movb	1521(%rdx), %dil
	movb	%dil, 1553(%rsp)
	movb	1522(%rdx), %dil
	movb	%dil, 1554(%rsp)
	movb	1523(%rdx), %dil
	movb	%dil, 1555(%rsp)
	movb	1524(%rdx), %dil
	movb	%dil, 1556(%rsp)
	movb	1525(%rdx), %dil
	movb	%dil, 1557(%rsp)
	movb	1526(%rdx), %dil
	movb	%dil, 1558(%rsp)
	movb	1527(%rdx), %dil
	movb	%dil, 1559(%rsp)
	movb	1528(%rdx), %dil
	movb	%dil, 1560(%rsp)
	movb	1529(%rdx), %dil
	movb	%dil, 1561(%rsp)
	movb	1530(%rdx), %dil
	movb	%dil, 1562(%rsp)
	movb	1531(%rdx), %dil
	movb	%dil, 1563(%rsp)
	movb	1532(%rdx), %dil
	movb	%dil, 1564(%rsp)
	movb	1533(%rdx), %dil
	movb	%dil, 1565(%rsp)
	movb	1534(%rdx), %dil
	movb	%dil, 1566(%rsp)
	movb	1535(%rdx), %dil
	movb	%dil, 1567(%rsp)
	movb	1536(%rdx), %dil
	movb	%dil, 1568(%rsp)
	movb	1537(%rdx), %dil
	movb	%dil, 1569(%rsp)
	movb	1538(%rdx), %dil
	movb	%dil, 1570(%rsp)
	movb	1539(%rdx), %dil
	movb	%dil, 1571(%rsp)
	movb	1540(%rdx), %dil
	movb	%dil, 1572(%rsp)
	movb	1541(%rdx), %dil
	movb	%dil, 1573(%rsp)
	movb	1542(%rdx), %dil
	movb	%dil, 1574(%rsp)
	movb	1543(%rdx), %dil
	movb	%dil, 1575(%rsp)
	movb	1544(%rdx), %dil
	movb	%dil, 1576(%rsp)
	movb	1545(%rdx), %dil
	movb	%dil, 1577(%rsp)
	movb	1546(%rdx), %dil
	movb	%dil, 1578(%rsp)
	movb	1547(%rdx), %dil
	movb	%dil, 1579(%rsp)
	movb	1548(%rdx), %dil
	movb	%dil, 1580(%rsp)
	movb	1549(%rdx), %dil
	movb	%dil, 1581(%rsp)
	movb	1550(%rdx), %dil
	movb	%dil, 1582(%rsp)
	movb	1551(%rdx), %dil
	movb	%dil, 1583(%rsp)
	movb	1552(%rdx), %dil
	movb	%dil, 1584(%rsp)
	movb	1553(%rdx), %dil
	movb	%dil, 1585(%rsp)
	movb	1554(%rdx), %dil
	movb	%dil, 1586(%rsp)
	movb	1555(%rdx), %dil
	movb	%dil, 1587(%rsp)
	movb	1556(%rdx), %dil
	movb	%dil, 1588(%rsp)
	movb	1557(%rdx), %dil
	movb	%dil, 1589(%rsp)
	movb	1558(%rdx), %dil
	movb	%dil, 1590(%rsp)
	movb	1559(%rdx), %dil
	movb	%dil, 1591(%rsp)
	movb	1560(%rdx), %dil
	movb	%dil, 1592(%rsp)
	movb	1561(%rdx), %dil
	movb	%dil, 1593(%rsp)
	movb	1562(%rdx), %dil
	movb	%dil, 1594(%rsp)
	movb	1563(%rdx), %dil
	movb	%dil, 1595(%rsp)
	movb	1564(%rdx), %dil
	movb	%dil, 1596(%rsp)
	movb	1565(%rdx), %dil
	movb	%dil, 1597(%rsp)
	movb	1566(%rdx), %dil
	movb	%dil, 1598(%rsp)
	movb	1567(%rdx), %dil
	movb	%dil, 1599(%rsp)
	movb	1568(%rdx), %dil
	movb	%dil, 1600(%rsp)
	movb	1569(%rdx), %dil
	movb	%dil, 1601(%rsp)
	movb	1570(%rdx), %dil
	movb	%dil, 1602(%rsp)
	movb	1571(%rdx), %dil
	movb	%dil, 1603(%rsp)
	movb	1572(%rdx), %dil
	movb	%dil, 1604(%rsp)
	movb	1573(%rdx), %dil
	movb	%dil, 1605(%rsp)
	movb	1574(%rdx), %dil
	movb	%dil, 1606(%rsp)
	movb	1575(%rdx), %dil
	movb	%dil, 1607(%rsp)
	movb	1576(%rdx), %dil
	movb	%dil, 1608(%rsp)
	movb	1577(%rdx), %dil
	movb	%dil, 1609(%rsp)
	movb	1578(%rdx), %dil
	movb	%dil, 1610(%rsp)
	movb	1579(%rdx), %dil
	movb	%dil, 1611(%rsp)
	movb	1580(%rdx), %dil
	movb	%dil, 1612(%rsp)
	movb	1581(%rdx), %dil
	movb	%dil, 1613(%rsp)
	movb	1582(%rdx), %dil
	movb	%dil, 1614(%rsp)
	movb	1583(%rdx), %dil
	movb	%dil, 1615(%rsp)
	movb	1584(%rdx), %dil
	movb	%dil, 1616(%rsp)
	movb	1585(%rdx), %dil
	movb	%dil, 1617(%rsp)
	movb	1586(%rdx), %dil
	movb	%dil, 1618(%rsp)
	movb	1587(%rdx), %dil
	movb	%dil, 1619(%rsp)
	movb	1588(%rdx), %dil
	movb	%dil, 1620(%rsp)
	movb	1589(%rdx), %dil
	movb	%dil, 1621(%rsp)
	movb	1590(%rdx), %dil
	movb	%dil, 1622(%rsp)
	movb	1591(%rdx), %dil
	movb	%dil, 1623(%rsp)
	movb	1592(%rdx), %dil
	movb	%dil, 1624(%rsp)
	movb	1593(%rdx), %dil
	movb	%dil, 1625(%rsp)
	movb	1594(%rdx), %dil
	movb	%dil, 1626(%rsp)
	movb	1595(%rdx), %dil
	movb	%dil, 1627(%rsp)
	movb	1596(%rdx), %dil
	movb	%dil, 1628(%rsp)
	movb	1597(%rdx), %dil
	movb	%dil, 1629(%rsp)
	movb	1598(%rdx), %dil
	movb	%dil, 1630(%rsp)
	movb	1599(%rdx), %dil
	movb	%dil, 1631(%rsp)
	movb	1600(%rdx), %dil
	movb	%dil, 1632(%rsp)
	movb	1601(%rdx), %dil
	movb	%dil, 1633(%rsp)
	movb	1602(%rdx), %dil
	movb	%dil, 1634(%rsp)
	movb	1603(%rdx), %dil
	movb	%dil, 1635(%rsp)
	movb	1604(%rdx), %dil
	movb	%dil, 1636(%rsp)
	movb	1605(%rdx), %dil
	movb	%dil, 1637(%rsp)
	movb	1606(%rdx), %dil
	movb	%dil, 1638(%rsp)
	movb	1607(%rdx), %dil
	movb	%dil, 1639(%rsp)
	movb	1608(%rdx), %dil
	movb	%dil, 1640(%rsp)
	movb	1609(%rdx), %dil
	movb	%dil, 1641(%rsp)
	movb	1610(%rdx), %dil
	movb	%dil, 1642(%rsp)
	movb	1611(%rdx), %dil
	movb	%dil, 1643(%rsp)
	movb	1612(%rdx), %dil
	movb	%dil, 1644(%rsp)
	movb	1613(%rdx), %dil
	movb	%dil, 1645(%rsp)
	movb	1614(%rdx), %dil
	movb	%dil, 1646(%rsp)
	movb	1615(%rdx), %dil
	movb	%dil, 1647(%rsp)
	movb	1616(%rdx), %dil
	movb	%dil, 1648(%rsp)
	movb	1617(%rdx), %dil
	movb	%dil, 1649(%rsp)
	movb	1618(%rdx), %dil
	movb	%dil, 1650(%rsp)
	movb	1619(%rdx), %dil
	movb	%dil, 1651(%rsp)
	movb	1620(%rdx), %dil
	movb	%dil, 1652(%rsp)
	movb	1621(%rdx), %dil
	movb	%dil, 1653(%rsp)
	movb	1622(%rdx), %dil
	movb	%dil, 1654(%rsp)
	movb	1623(%rdx), %dil
	movb	%dil, 1655(%rsp)
	movb	1624(%rdx), %dil
	movb	%dil, 1656(%rsp)
	movb	1625(%rdx), %dil
	movb	%dil, 1657(%rsp)
	movb	1626(%rdx), %dil
	movb	%dil, 1658(%rsp)
	movb	1627(%rdx), %dil
	movb	%dil, 1659(%rsp)
	movb	1628(%rdx), %dil
	movb	%dil, 1660(%rsp)
	movb	1629(%rdx), %dil
	movb	%dil, 1661(%rsp)
	movb	1630(%rdx), %dil
	movb	%dil, 1662(%rsp)
	movb	1631(%rdx), %dil
	movb	%dil, 1663(%rsp)
	movb	1632(%rdx), %dil
	movb	%dil, 1664(%rsp)
	movb	1633(%rdx), %dil
	movb	%dil, 1665(%rsp)
	movb	1634(%rdx), %dil
	movb	%dil, 1666(%rsp)
	movb	1635(%rdx), %dil
	movb	%dil, 1667(%rsp)
	movb	1636(%rdx), %dil
	movb	%dil, 1668(%rsp)
	movb	1637(%rdx), %dil
	movb	%dil, 1669(%rsp)
	movb	1638(%rdx), %dil
	movb	%dil, 1670(%rsp)
	movb	1639(%rdx), %dil
	movb	%dil, 1671(%rsp)
	movb	1640(%rdx), %dil
	movb	%dil, 1672(%rsp)
	movb	1641(%rdx), %dil
	movb	%dil, 1673(%rsp)
	movb	1642(%rdx), %dil
	movb	%dil, 1674(%rsp)
	movb	1643(%rdx), %dil
	movb	%dil, 1675(%rsp)
	movb	1644(%rdx), %dil
	movb	%dil, 1676(%rsp)
	movb	1645(%rdx), %dil
	movb	%dil, 1677(%rsp)
	movb	1646(%rdx), %dil
	movb	%dil, 1678(%rsp)
	movb	1647(%rdx), %dil
	movb	%dil, 1679(%rsp)
	movb	1648(%rdx), %dil
	movb	%dil, 1680(%rsp)
	movb	1649(%rdx), %dil
	movb	%dil, 1681(%rsp)
	movb	1650(%rdx), %dil
	movb	%dil, 1682(%rsp)
	movb	1651(%rdx), %dil
	movb	%dil, 1683(%rsp)
	movb	1652(%rdx), %dil
	movb	%dil, 1684(%rsp)
	movb	1653(%rdx), %dil
	movb	%dil, 1685(%rsp)
	movb	1654(%rdx), %dil
	movb	%dil, 1686(%rsp)
	movb	1655(%rdx), %dil
	movb	%dil, 1687(%rsp)
	movb	1656(%rdx), %dil
	movb	%dil, 1688(%rsp)
	movb	1657(%rdx), %dil
	movb	%dil, 1689(%rsp)
	movb	1658(%rdx), %dil
	movb	%dil, 1690(%rsp)
	movb	1659(%rdx), %dil
	movb	%dil, 1691(%rsp)
	movb	1660(%rdx), %dil
	movb	%dil, 1692(%rsp)
	movb	1661(%rdx), %dil
	movb	%dil, 1693(%rsp)
	movb	1662(%rdx), %dil
	movb	%dil, 1694(%rsp)
	movb	1663(%rdx), %dil
	movb	%dil, 1695(%rsp)
	movb	1664(%rdx), %dil
	movb	%dil, 1696(%rsp)
	movb	1665(%rdx), %dil
	movb	%dil, 1697(%rsp)
	movb	1666(%rdx), %dil
	movb	%dil, 1698(%rsp)
	movb	1667(%rdx), %dil
	movb	%dil, 1699(%rsp)
	movb	1668(%rdx), %dil
	movb	%dil, 1700(%rsp)
	movb	1669(%rdx), %dil
	movb	%dil, 1701(%rsp)
	movb	1670(%rdx), %dil
	movb	%dil, 1702(%rsp)
	movb	1671(%rdx), %dil
	movb	%dil, 1703(%rsp)
	movb	1672(%rdx), %dil
	movb	%dil, 1704(%rsp)
	movb	1673(%rdx), %dil
	movb	%dil, 1705(%rsp)
	movb	1674(%rdx), %dil
	movb	%dil, 1706(%rsp)
	movb	1675(%rdx), %dil
	movb	%dil, 1707(%rsp)
	movb	1676(%rdx), %dil
	movb	%dil, 1708(%rsp)
	movb	1677(%rdx), %dil
	movb	%dil, 1709(%rsp)
	movb	1678(%rdx), %dil
	movb	%dil, 1710(%rsp)
	movb	1679(%rdx), %dil
	movb	%dil, 1711(%rsp)
	movb	1680(%rdx), %dil
	movb	%dil, 1712(%rsp)
	movb	1681(%rdx), %dil
	movb	%dil, 1713(%rsp)
	movb	1682(%rdx), %dil
	movb	%dil, 1714(%rsp)
	movb	1683(%rdx), %dil
	movb	%dil, 1715(%rsp)
	movb	1684(%rdx), %dil
	movb	%dil, 1716(%rsp)
	movb	1685(%rdx), %dil
	movb	%dil, 1717(%rsp)
	movb	1686(%rdx), %dil
	movb	%dil, 1718(%rsp)
	movb	1687(%rdx), %dil
	movb	%dil, 1719(%rsp)
	movb	1688(%rdx), %dil
	movb	%dil, 1720(%rsp)
	movb	1689(%rdx), %dil
	movb	%dil, 1721(%rsp)
	movb	1690(%rdx), %dil
	movb	%dil, 1722(%rsp)
	movb	1691(%rdx), %dil
	movb	%dil, 1723(%rsp)
	movb	1692(%rdx), %dil
	movb	%dil, 1724(%rsp)
	movb	1693(%rdx), %dil
	movb	%dil, 1725(%rsp)
	movb	1694(%rdx), %dil
	movb	%dil, 1726(%rsp)
	movb	1695(%rdx), %dil
	movb	%dil, 1727(%rsp)
	movb	1696(%rdx), %dil
	movb	%dil, 1728(%rsp)
	movb	1697(%rdx), %dil
	movb	%dil, 1729(%rsp)
	movb	1698(%rdx), %dil
	movb	%dil, 1730(%rsp)
	movb	1699(%rdx), %dil
	movb	%dil, 1731(%rsp)
	movb	1700(%rdx), %dil
	movb	%dil, 1732(%rsp)
	movb	1701(%rdx), %dil
	movb	%dil, 1733(%rsp)
	movb	1702(%rdx), %dil
	movb	%dil, 1734(%rsp)
	movb	1703(%rdx), %dil
	movb	%dil, 1735(%rsp)
	movb	1704(%rdx), %dil
	movb	%dil, 1736(%rsp)
	movb	1705(%rdx), %dil
	movb	%dil, 1737(%rsp)
	movb	1706(%rdx), %dil
	movb	%dil, 1738(%rsp)
	movb	1707(%rdx), %dil
	movb	%dil, 1739(%rsp)
	movb	1708(%rdx), %dil
	movb	%dil, 1740(%rsp)
	movb	1709(%rdx), %dil
	movb	%dil, 1741(%rsp)
	movb	1710(%rdx), %dil
	movb	%dil, 1742(%rsp)
	movb	1711(%rdx), %dil
	movb	%dil, 1743(%rsp)
	movb	1712(%rdx), %dil
	movb	%dil, 1744(%rsp)
	movb	1713(%rdx), %dil
	movb	%dil, 1745(%rsp)
	movb	1714(%rdx), %dil
	movb	%dil, 1746(%rsp)
	movb	1715(%rdx), %dil
	movb	%dil, 1747(%rsp)
	movb	1716(%rdx), %dil
	movb	%dil, 1748(%rsp)
	movb	1717(%rdx), %dil
	movb	%dil, 1749(%rsp)
	movb	1718(%rdx), %dil
	movb	%dil, 1750(%rsp)
	movb	1719(%rdx), %dil
	movb	%dil, 1751(%rsp)
	movb	1720(%rdx), %dil
	movb	%dil, 1752(%rsp)
	movb	1721(%rdx), %dil
	movb	%dil, 1753(%rsp)
	movb	1722(%rdx), %dil
	movb	%dil, 1754(%rsp)
	movb	1723(%rdx), %dil
	movb	%dil, 1755(%rsp)
	movb	1724(%rdx), %dil
	movb	%dil, 1756(%rsp)
	movb	1725(%rdx), %dil
	movb	%dil, 1757(%rsp)
	movb	1726(%rdx), %dil
	movb	%dil, 1758(%rsp)
	movb	1727(%rdx), %dil
	movb	%dil, 1759(%rsp)
	movb	1728(%rdx), %dil
	movb	%dil, 1760(%rsp)
	movb	1729(%rdx), %dil
	movb	%dil, 1761(%rsp)
	movb	1730(%rdx), %dil
	movb	%dil, 1762(%rsp)
	movb	1731(%rdx), %dil
	movb	%dil, 1763(%rsp)
	movb	1732(%rdx), %dil
	movb	%dil, 1764(%rsp)
	movb	1733(%rdx), %dil
	movb	%dil, 1765(%rsp)
	movb	1734(%rdx), %dil
	movb	%dil, 1766(%rsp)
	movb	1735(%rdx), %dil
	movb	%dil, 1767(%rsp)
	movb	1736(%rdx), %dil
	movb	%dil, 1768(%rsp)
	movb	1737(%rdx), %dil
	movb	%dil, 1769(%rsp)
	movb	1738(%rdx), %dil
	movb	%dil, 1770(%rsp)
	movb	1739(%rdx), %dil
	movb	%dil, 1771(%rsp)
	movb	1740(%rdx), %dil
	movb	%dil, 1772(%rsp)
	movb	1741(%rdx), %dil
	movb	%dil, 1773(%rsp)
	movb	1742(%rdx), %dil
	movb	%dil, 1774(%rsp)
	movb	1743(%rdx), %dil
	movb	%dil, 1775(%rsp)
	movb	1744(%rdx), %dil
	movb	%dil, 1776(%rsp)
	movb	1745(%rdx), %dil
	movb	%dil, 1777(%rsp)
	movb	1746(%rdx), %dil
	movb	%dil, 1778(%rsp)
	movb	1747(%rdx), %dil
	movb	%dil, 1779(%rsp)
	movb	1748(%rdx), %dil
	movb	%dil, 1780(%rsp)
	movb	1749(%rdx), %dil
	movb	%dil, 1781(%rsp)
	movb	1750(%rdx), %dil
	movb	%dil, 1782(%rsp)
	movb	1751(%rdx), %dil
	movb	%dil, 1783(%rsp)
	movb	1752(%rdx), %dil
	movb	%dil, 1784(%rsp)
	movb	1753(%rdx), %dil
	movb	%dil, 1785(%rsp)
	movb	1754(%rdx), %dil
	movb	%dil, 1786(%rsp)
	movb	1755(%rdx), %dil
	movb	%dil, 1787(%rsp)
	movb	1756(%rdx), %dil
	movb	%dil, 1788(%rsp)
	movb	1757(%rdx), %dil
	movb	%dil, 1789(%rsp)
	movb	1758(%rdx), %dil
	movb	%dil, 1790(%rsp)
	movb	1759(%rdx), %dil
	movb	%dil, 1791(%rsp)
	movb	1760(%rdx), %dil
	movb	%dil, 1792(%rsp)
	movb	1761(%rdx), %dil
	movb	%dil, 1793(%rsp)
	movb	1762(%rdx), %dil
	movb	%dil, 1794(%rsp)
	movb	1763(%rdx), %dil
	movb	%dil, 1795(%rsp)
	movb	1764(%rdx), %dil
	movb	%dil, 1796(%rsp)
	movb	1765(%rdx), %dil
	movb	%dil, 1797(%rsp)
	movb	1766(%rdx), %dil
	movb	%dil, 1798(%rsp)
	movb	1767(%rdx), %dil
	movb	%dil, 1799(%rsp)
	movb	1768(%rdx), %dil
	movb	%dil, 1800(%rsp)
	movb	1769(%rdx), %dil
	movb	%dil, 1801(%rsp)
	movb	1770(%rdx), %dil
	movb	%dil, 1802(%rsp)
	movb	1771(%rdx), %dil
	movb	%dil, 1803(%rsp)
	movb	1772(%rdx), %dil
	movb	%dil, 1804(%rsp)
	movb	1773(%rdx), %dil
	movb	%dil, 1805(%rsp)
	movb	1774(%rdx), %dil
	movb	%dil, 1806(%rsp)
	movb	1775(%rdx), %dil
	movb	%dil, 1807(%rsp)
	movb	1776(%rdx), %dil
	movb	%dil, 1808(%rsp)
	movb	1777(%rdx), %dil
	movb	%dil, 1809(%rsp)
	movb	1778(%rdx), %dil
	movb	%dil, 1810(%rsp)
	movb	1779(%rdx), %dil
	movb	%dil, 1811(%rsp)
	movb	1780(%rdx), %dil
	movb	%dil, 1812(%rsp)
	movb	1781(%rdx), %dil
	movb	%dil, 1813(%rsp)
	movb	1782(%rdx), %dil
	movb	%dil, 1814(%rsp)
	movb	1783(%rdx), %dil
	movb	%dil, 1815(%rsp)
	movb	1784(%rdx), %dil
	movb	%dil, 1816(%rsp)
	movb	1785(%rdx), %dil
	movb	%dil, 1817(%rsp)
	movb	1786(%rdx), %dil
	movb	%dil, 1818(%rsp)
	movb	1787(%rdx), %dil
	movb	%dil, 1819(%rsp)
	movb	1788(%rdx), %dil
	movb	%dil, 1820(%rsp)
	movb	1789(%rdx), %dil
	movb	%dil, 1821(%rsp)
	movb	1790(%rdx), %dil
	movb	%dil, 1822(%rsp)
	movb	1791(%rdx), %dil
	movb	%dil, 1823(%rsp)
	movb	1792(%rdx), %dil
	movb	%dil, 1824(%rsp)
	movb	1793(%rdx), %dil
	movb	%dil, 1825(%rsp)
	movb	1794(%rdx), %dil
	movb	%dil, 1826(%rsp)
	movb	1795(%rdx), %dil
	movb	%dil, 1827(%rsp)
	movb	1796(%rdx), %dil
	movb	%dil, 1828(%rsp)
	movb	1797(%rdx), %dil
	movb	%dil, 1829(%rsp)
	movb	1798(%rdx), %dil
	movb	%dil, 1830(%rsp)
	movb	1799(%rdx), %dil
	movb	%dil, 1831(%rsp)
	movb	1800(%rdx), %dil
	movb	%dil, 1832(%rsp)
	movb	1801(%rdx), %dil
	movb	%dil, 1833(%rsp)
	movb	1802(%rdx), %dil
	movb	%dil, 1834(%rsp)
	movb	1803(%rdx), %dil
	movb	%dil, 1835(%rsp)
	movb	1804(%rdx), %dil
	movb	%dil, 1836(%rsp)
	movb	1805(%rdx), %dil
	movb	%dil, 1837(%rsp)
	movb	1806(%rdx), %dil
	movb	%dil, 1838(%rsp)
	movb	1807(%rdx), %dil
	movb	%dil, 1839(%rsp)
	movb	1808(%rdx), %dil
	movb	%dil, 1840(%rsp)
	movb	1809(%rdx), %dil
	movb	%dil, 1841(%rsp)
	movb	1810(%rdx), %dil
	movb	%dil, 1842(%rsp)
	movb	1811(%rdx), %dil
	movb	%dil, 1843(%rsp)
	movb	1812(%rdx), %dil
	movb	%dil, 1844(%rsp)
	movb	1813(%rdx), %dil
	movb	%dil, 1845(%rsp)
	movb	1814(%rdx), %dil
	movb	%dil, 1846(%rsp)
	movb	1815(%rdx), %dil
	movb	%dil, 1847(%rsp)
	movb	1816(%rdx), %dil
	movb	%dil, 1848(%rsp)
	movb	1817(%rdx), %dil
	movb	%dil, 1849(%rsp)
	movb	1818(%rdx), %dil
	movb	%dil, 1850(%rsp)
	movb	1819(%rdx), %dil
	movb	%dil, 1851(%rsp)
	movb	1820(%rdx), %dil
	movb	%dil, 1852(%rsp)
	movb	1821(%rdx), %dil
	movb	%dil, 1853(%rsp)
	movb	1822(%rdx), %dil
	movb	%dil, 1854(%rsp)
	movb	1823(%rdx), %dil
	movb	%dil, 1855(%rsp)
	movb	1824(%rdx), %dil
	movb	%dil, 1856(%rsp)
	movb	1825(%rdx), %dil
	movb	%dil, 1857(%rsp)
	movb	1826(%rdx), %dil
	movb	%dil, 1858(%rsp)
	movb	1827(%rdx), %dil
	movb	%dil, 1859(%rsp)
	movb	1828(%rdx), %dil
	movb	%dil, 1860(%rsp)
	movb	1829(%rdx), %dil
	movb	%dil, 1861(%rsp)
	movb	1830(%rdx), %dil
	movb	%dil, 1862(%rsp)
	movb	1831(%rdx), %dil
	movb	%dil, 1863(%rsp)
	movb	1832(%rdx), %dil
	movb	%dil, 1864(%rsp)
	movb	1833(%rdx), %dil
	movb	%dil, 1865(%rsp)
	movb	1834(%rdx), %dil
	movb	%dil, 1866(%rsp)
	movb	1835(%rdx), %dil
	movb	%dil, 1867(%rsp)
	movb	1836(%rdx), %dil
	movb	%dil, 1868(%rsp)
	movb	1837(%rdx), %dil
	movb	%dil, 1869(%rsp)
	movb	1838(%rdx), %dil
	movb	%dil, 1870(%rsp)
	movb	1839(%rdx), %dil
	movb	%dil, 1871(%rsp)
	movb	1840(%rdx), %dil
	movb	%dil, 1872(%rsp)
	movb	1841(%rdx), %dil
	movb	%dil, 1873(%rsp)
	movb	1842(%rdx), %dil
	movb	%dil, 1874(%rsp)
	movb	1843(%rdx), %dil
	movb	%dil, 1875(%rsp)
	movb	1844(%rdx), %dil
	movb	%dil, 1876(%rsp)
	movb	1845(%rdx), %dil
	movb	%dil, 1877(%rsp)
	movb	1846(%rdx), %dil
	movb	%dil, 1878(%rsp)
	movb	1847(%rdx), %dil
	movb	%dil, 1879(%rsp)
	movb	1848(%rdx), %dil
	movb	%dil, 1880(%rsp)
	movb	1849(%rdx), %dil
	movb	%dil, 1881(%rsp)
	movb	1850(%rdx), %dil
	movb	%dil, 1882(%rsp)
	movb	1851(%rdx), %dil
	movb	%dil, 1883(%rsp)
	movb	1852(%rdx), %dil
	movb	%dil, 1884(%rsp)
	movb	1853(%rdx), %dil
	movb	%dil, 1885(%rsp)
	movb	1854(%rdx), %dil
	movb	%dil, 1886(%rsp)
	movb	1855(%rdx), %dil
	movb	%dil, 1887(%rsp)
	movb	1856(%rdx), %dil
	movb	%dil, 1888(%rsp)
	movb	1857(%rdx), %dil
	movb	%dil, 1889(%rsp)
	movb	1858(%rdx), %dil
	movb	%dil, 1890(%rsp)
	movb	1859(%rdx), %dil
	movb	%dil, 1891(%rsp)
	movb	1860(%rdx), %dil
	movb	%dil, 1892(%rsp)
	movb	1861(%rdx), %dil
	movb	%dil, 1893(%rsp)
	movb	1862(%rdx), %dil
	movb	%dil, 1894(%rsp)
	movb	1863(%rdx), %dil
	movb	%dil, 1895(%rsp)
	movb	1864(%rdx), %dil
	movb	%dil, 1896(%rsp)
	movb	1865(%rdx), %dil
	movb	%dil, 1897(%rsp)
	movb	1866(%rdx), %dil
	movb	%dil, 1898(%rsp)
	movb	1867(%rdx), %dil
	movb	%dil, 1899(%rsp)
	movb	1868(%rdx), %dil
	movb	%dil, 1900(%rsp)
	movb	1869(%rdx), %dil
	movb	%dil, 1901(%rsp)
	movb	1870(%rdx), %dil
	movb	%dil, 1902(%rsp)
	movb	1871(%rdx), %dil
	movb	%dil, 1903(%rsp)
	movb	1872(%rdx), %dil
	movb	%dil, 1904(%rsp)
	movb	1873(%rdx), %dil
	movb	%dil, 1905(%rsp)
	movb	1874(%rdx), %dil
	movb	%dil, 1906(%rsp)
	movb	1875(%rdx), %dil
	movb	%dil, 1907(%rsp)
	movb	1876(%rdx), %dil
	movb	%dil, 1908(%rsp)
	movb	1877(%rdx), %dil
	movb	%dil, 1909(%rsp)
	movb	1878(%rdx), %dil
	movb	%dil, 1910(%rsp)
	movb	1879(%rdx), %dil
	movb	%dil, 1911(%rsp)
	movb	1880(%rdx), %dil
	movb	%dil, 1912(%rsp)
	movb	1881(%rdx), %dil
	movb	%dil, 1913(%rsp)
	movb	1882(%rdx), %dil
	movb	%dil, 1914(%rsp)
	movb	1883(%rdx), %dil
	movb	%dil, 1915(%rsp)
	movb	1884(%rdx), %dil
	movb	%dil, 1916(%rsp)
	movb	1885(%rdx), %dil
	movb	%dil, 1917(%rsp)
	movb	1886(%rdx), %dil
	movb	%dil, 1918(%rsp)
	movb	1887(%rdx), %dil
	movb	%dil, 1919(%rsp)
	movb	1888(%rdx), %dil
	movb	%dil, 1920(%rsp)
	movb	1889(%rdx), %dil
	movb	%dil, 1921(%rsp)
	movb	1890(%rdx), %dil
	movb	%dil, 1922(%rsp)
	movb	1891(%rdx), %dil
	movb	%dil, 1923(%rsp)
	movb	1892(%rdx), %dil
	movb	%dil, 1924(%rsp)
	movb	1893(%rdx), %dil
	movb	%dil, 1925(%rsp)
	movb	1894(%rdx), %dil
	movb	%dil, 1926(%rsp)
	movb	1895(%rdx), %dil
	movb	%dil, 1927(%rsp)
	movb	1896(%rdx), %dil
	movb	%dil, 1928(%rsp)
	movb	1897(%rdx), %dil
	movb	%dil, 1929(%rsp)
	movb	1898(%rdx), %dil
	movb	%dil, 1930(%rsp)
	movb	1899(%rdx), %dil
	movb	%dil, 1931(%rsp)
	movb	1900(%rdx), %dil
	movb	%dil, 1932(%rsp)
	movb	1901(%rdx), %dil
	movb	%dil, 1933(%rsp)
	movb	1902(%rdx), %dil
	movb	%dil, 1934(%rsp)
	movb	1903(%rdx), %dil
	movb	%dil, 1935(%rsp)
	movb	1904(%rdx), %dil
	movb	%dil, 1936(%rsp)
	movb	1905(%rdx), %dil
	movb	%dil, 1937(%rsp)
	movb	1906(%rdx), %dil
	movb	%dil, 1938(%rsp)
	movb	1907(%rdx), %dil
	movb	%dil, 1939(%rsp)
	movb	1908(%rdx), %dil
	movb	%dil, 1940(%rsp)
	movb	1909(%rdx), %dil
	movb	%dil, 1941(%rsp)
	movb	1910(%rdx), %dil
	movb	%dil, 1942(%rsp)
	movb	1911(%rdx), %dil
	movb	%dil, 1943(%rsp)
	movb	1912(%rdx), %dil
	movb	%dil, 1944(%rsp)
	movb	1913(%rdx), %dil
	movb	%dil, 1945(%rsp)
	movb	1914(%rdx), %dil
	movb	%dil, 1946(%rsp)
	movb	1915(%rdx), %dil
	movb	%dil, 1947(%rsp)
	movb	1916(%rdx), %dil
	movb	%dil, 1948(%rsp)
	movb	1917(%rdx), %dil
	movb	%dil, 1949(%rsp)
	movb	1918(%rdx), %dil
	movb	%dil, 1950(%rsp)
	movb	1919(%rdx), %dil
	movb	%dil, 1951(%rsp)
	movb	1920(%rdx), %dil
	movb	%dil, 1952(%rsp)
	movb	1921(%rdx), %dil
	movb	%dil, 1953(%rsp)
	movb	1922(%rdx), %dil
	movb	%dil, 1954(%rsp)
	movb	1923(%rdx), %dil
	movb	%dil, 1955(%rsp)
	movb	1924(%rdx), %dil
	movb	%dil, 1956(%rsp)
	movb	1925(%rdx), %dil
	movb	%dil, 1957(%rsp)
	movb	1926(%rdx), %dil
	movb	%dil, 1958(%rsp)
	movb	1927(%rdx), %dil
	movb	%dil, 1959(%rsp)
	movb	1928(%rdx), %dil
	movb	%dil, 1960(%rsp)
	movb	1929(%rdx), %dil
	movb	%dil, 1961(%rsp)
	movb	1930(%rdx), %dil
	movb	%dil, 1962(%rsp)
	movb	1931(%rdx), %dil
	movb	%dil, 1963(%rsp)
	movb	1932(%rdx), %dil
	movb	%dil, 1964(%rsp)
	movb	1933(%rdx), %dil
	movb	%dil, 1965(%rsp)
	movb	1934(%rdx), %dil
	movb	%dil, 1966(%rsp)
	movb	1935(%rdx), %dil
	movb	%dil, 1967(%rsp)
	movb	1936(%rdx), %dil
	movb	%dil, 1968(%rsp)
	movb	1937(%rdx), %dil
	movb	%dil, 1969(%rsp)
	movb	1938(%rdx), %dil
	movb	%dil, 1970(%rsp)
	movb	1939(%rdx), %dil
	movb	%dil, 1971(%rsp)
	movb	1940(%rdx), %dil
	movb	%dil, 1972(%rsp)
	movb	1941(%rdx), %dil
	movb	%dil, 1973(%rsp)
	movb	1942(%rdx), %dil
	movb	%dil, 1974(%rsp)
	movb	1943(%rdx), %dil
	movb	%dil, 1975(%rsp)
	movb	1944(%rdx), %dil
	movb	%dil, 1976(%rsp)
	movb	1945(%rdx), %dil
	movb	%dil, 1977(%rsp)
	movb	1946(%rdx), %dil
	movb	%dil, 1978(%rsp)
	movb	1947(%rdx), %dil
	movb	%dil, 1979(%rsp)
	movb	1948(%rdx), %dil
	movb	%dil, 1980(%rsp)
	movb	1949(%rdx), %dil
	movb	%dil, 1981(%rsp)
	movb	1950(%rdx), %dil
	movb	%dil, 1982(%rsp)
	movb	1951(%rdx), %dil
	movb	%dil, 1983(%rsp)
	movb	1952(%rdx), %dil
	movb	%dil, 1984(%rsp)
	movb	1953(%rdx), %dil
	movb	%dil, 1985(%rsp)
	movb	1954(%rdx), %dil
	movb	%dil, 1986(%rsp)
	movb	1955(%rdx), %dil
	movb	%dil, 1987(%rsp)
	movb	1956(%rdx), %dil
	movb	%dil, 1988(%rsp)
	movb	1957(%rdx), %dil
	movb	%dil, 1989(%rsp)
	movb	1958(%rdx), %dil
	movb	%dil, 1990(%rsp)
	movb	1959(%rdx), %dil
	movb	%dil, 1991(%rsp)
	movb	1960(%rdx), %dil
	movb	%dil, 1992(%rsp)
	movb	1961(%rdx), %dil
	movb	%dil, 1993(%rsp)
	movb	1962(%rdx), %dil
	movb	%dil, 1994(%rsp)
	movb	1963(%rdx), %dil
	movb	%dil, 1995(%rsp)
	movb	1964(%rdx), %dil
	movb	%dil, 1996(%rsp)
	movb	1965(%rdx), %dil
	movb	%dil, 1997(%rsp)
	movb	1966(%rdx), %dil
	movb	%dil, 1998(%rsp)
	movb	1967(%rdx), %dil
	movb	%dil, 1999(%rsp)
	movb	1968(%rdx), %dil
	movb	%dil, 2000(%rsp)
	movb	1969(%rdx), %dil
	movb	%dil, 2001(%rsp)
	movb	1970(%rdx), %dil
	movb	%dil, 2002(%rsp)
	movb	1971(%rdx), %dil
	movb	%dil, 2003(%rsp)
	movb	1972(%rdx), %dil
	movb	%dil, 2004(%rsp)
	movb	1973(%rdx), %dil
	movb	%dil, 2005(%rsp)
	movb	1974(%rdx), %dil
	movb	%dil, 2006(%rsp)
	movb	1975(%rdx), %dil
	movb	%dil, 2007(%rsp)
	movb	1976(%rdx), %dil
	movb	%dil, 2008(%rsp)
	movb	1977(%rdx), %dil
	movb	%dil, 2009(%rsp)
	movb	1978(%rdx), %dil
	movb	%dil, 2010(%rsp)
	movb	1979(%rdx), %dil
	movb	%dil, 2011(%rsp)
	movb	1980(%rdx), %dil
	movb	%dil, 2012(%rsp)
	movb	1981(%rdx), %dil
	movb	%dil, 2013(%rsp)
	movb	1982(%rdx), %dil
	movb	%dil, 2014(%rsp)
	movb	1983(%rdx), %dil
	movb	%dil, 2015(%rsp)
	movb	1984(%rdx), %dil
	movb	%dil, 2016(%rsp)
	movb	1985(%rdx), %dil
	movb	%dil, 2017(%rsp)
	movb	1986(%rdx), %dil
	movb	%dil, 2018(%rsp)
	movb	1987(%rdx), %dil
	movb	%dil, 2019(%rsp)
	movb	1988(%rdx), %dil
	movb	%dil, 2020(%rsp)
	movb	1989(%rdx), %dil
	movb	%dil, 2021(%rsp)
	movb	1990(%rdx), %dil
	movb	%dil, 2022(%rsp)
	movb	1991(%rdx), %dil
	movb	%dil, 2023(%rsp)
	movb	1992(%rdx), %dil
	movb	%dil, 2024(%rsp)
	movb	1993(%rdx), %dil
	movb	%dil, 2025(%rsp)
	movb	1994(%rdx), %dil
	movb	%dil, 2026(%rsp)
	movb	1995(%rdx), %dil
	movb	%dil, 2027(%rsp)
	movb	1996(%rdx), %dil
	movb	%dil, 2028(%rsp)
	movb	1997(%rdx), %dil
	movb	%dil, 2029(%rsp)
	movb	1998(%rdx), %dil
	movb	%dil, 2030(%rsp)
	movb	1999(%rdx), %dil
	movb	%dil, 2031(%rsp)
	movb	2000(%rdx), %dil
	movb	%dil, 2032(%rsp)
	movb	2001(%rdx), %dil
	movb	%dil, 2033(%rsp)
	movb	2002(%rdx), %dil
	movb	%dil, 2034(%rsp)
	movb	2003(%rdx), %dil
	movb	%dil, 2035(%rsp)
	movb	2004(%rdx), %dil
	movb	%dil, 2036(%rsp)
	movb	2005(%rdx), %dil
	movb	%dil, 2037(%rsp)
	movb	2006(%rdx), %dil
	movb	%dil, 2038(%rsp)
	movb	2007(%rdx), %dil
	movb	%dil, 2039(%rsp)
	movb	2008(%rdx), %dil
	movb	%dil, 2040(%rsp)
	movb	2009(%rdx), %dil
	movb	%dil, 2041(%rsp)
	movb	2010(%rdx), %dil
	movb	%dil, 2042(%rsp)
	movb	2011(%rdx), %dil
	movb	%dil, 2043(%rsp)
	movb	2012(%rdx), %dil
	movb	%dil, 2044(%rsp)
	movb	2013(%rdx), %dil
	movb	%dil, 2045(%rsp)
	movb	2014(%rdx), %dil
	movb	%dil, 2046(%rsp)
	movb	2015(%rdx), %dil
	movb	%dil, 2047(%rsp)
	movb	2016(%rdx), %dil
	movb	%dil, 2048(%rsp)
	movb	2017(%rdx), %dil
	movb	%dil, 2049(%rsp)
	movb	2018(%rdx), %dil
	movb	%dil, 2050(%rsp)
	movb	2019(%rdx), %dil
	movb	%dil, 2051(%rsp)
	movb	2020(%rdx), %dil
	movb	%dil, 2052(%rsp)
	movb	2021(%rdx), %dil
	movb	%dil, 2053(%rsp)
	movb	2022(%rdx), %dil
	movb	%dil, 2054(%rsp)
	movb	2023(%rdx), %dil
	movb	%dil, 2055(%rsp)
	movb	2024(%rdx), %dil
	movb	%dil, 2056(%rsp)
	movb	2025(%rdx), %dil
	movb	%dil, 2057(%rsp)
	movb	2026(%rdx), %dil
	movb	%dil, 2058(%rsp)
	movb	2027(%rdx), %dil
	movb	%dil, 2059(%rsp)
	movb	2028(%rdx), %dil
	movb	%dil, 2060(%rsp)
	movb	2029(%rdx), %dil
	movb	%dil, 2061(%rsp)
	movb	2030(%rdx), %dil
	movb	%dil, 2062(%rsp)
	movb	2031(%rdx), %dil
	movb	%dil, 2063(%rsp)
	movb	2032(%rdx), %dil
	movb	%dil, 2064(%rsp)
	movb	2033(%rdx), %dil
	movb	%dil, 2065(%rsp)
	movb	2034(%rdx), %dil
	movb	%dil, 2066(%rsp)
	movb	2035(%rdx), %dil
	movb	%dil, 2067(%rsp)
	movb	2036(%rdx), %dil
	movb	%dil, 2068(%rsp)
	movb	2037(%rdx), %dil
	movb	%dil, 2069(%rsp)
	movb	2038(%rdx), %dil
	movb	%dil, 2070(%rsp)
	movb	2039(%rdx), %dil
	movb	%dil, 2071(%rsp)
	movb	2040(%rdx), %dil
	movb	%dil, 2072(%rsp)
	movb	2041(%rdx), %dil
	movb	%dil, 2073(%rsp)
	movb	2042(%rdx), %dil
	movb	%dil, 2074(%rsp)
	movb	2043(%rdx), %dil
	movb	%dil, 2075(%rsp)
	movb	2044(%rdx), %dil
	movb	%dil, 2076(%rsp)
	movb	2045(%rdx), %dil
	movb	%dil, 2077(%rsp)
	movb	2046(%rdx), %dil
	movb	%dil, 2078(%rsp)
	movb	2047(%rdx), %dil
	movb	%dil, 2079(%rsp)
	movb	2048(%rdx), %dil
	movb	%dil, 2080(%rsp)
	movb	2049(%rdx), %dil
	movb	%dil, 2081(%rsp)
	movb	2050(%rdx), %dil
	movb	%dil, 2082(%rsp)
	movb	2051(%rdx), %dil
	movb	%dil, 2083(%rsp)
	movb	2052(%rdx), %dil
	movb	%dil, 2084(%rsp)
	movb	2053(%rdx), %dil
	movb	%dil, 2085(%rsp)
	movb	2054(%rdx), %dil
	movb	%dil, 2086(%rsp)
	movb	2055(%rdx), %dil
	movb	%dil, 2087(%rsp)
	movb	2056(%rdx), %dil
	movb	%dil, 2088(%rsp)
	movb	2057(%rdx), %dil
	movb	%dil, 2089(%rsp)
	movb	2058(%rdx), %dil
	movb	%dil, 2090(%rsp)
	movb	2059(%rdx), %dil
	movb	%dil, 2091(%rsp)
	movb	2060(%rdx), %dil
	movb	%dil, 2092(%rsp)
	movb	2061(%rdx), %dil
	movb	%dil, 2093(%rsp)
	movb	2062(%rdx), %dil
	movb	%dil, 2094(%rsp)
	movb	2063(%rdx), %dil
	movb	%dil, 2095(%rsp)
	movb	2064(%rdx), %dil
	movb	%dil, 2096(%rsp)
	movb	2065(%rdx), %dil
	movb	%dil, 2097(%rsp)
	movb	2066(%rdx), %dil
	movb	%dil, 2098(%rsp)
	movb	2067(%rdx), %dil
	movb	%dil, 2099(%rsp)
	movb	2068(%rdx), %dil
	movb	%dil, 2100(%rsp)
	movb	2069(%rdx), %dil
	movb	%dil, 2101(%rsp)
	movb	2070(%rdx), %dil
	movb	%dil, 2102(%rsp)
	movb	2071(%rdx), %dil
	movb	%dil, 2103(%rsp)
	movb	2072(%rdx), %dil
	movb	%dil, 2104(%rsp)
	movb	2073(%rdx), %dil
	movb	%dil, 2105(%rsp)
	movb	2074(%rdx), %dil
	movb	%dil, 2106(%rsp)
	movb	2075(%rdx), %dil
	movb	%dil, 2107(%rsp)
	movb	2076(%rdx), %dil
	movb	%dil, 2108(%rsp)
	movb	2077(%rdx), %dil
	movb	%dil, 2109(%rsp)
	movb	2078(%rdx), %dil
	movb	%dil, 2110(%rsp)
	movb	2079(%rdx), %dil
	movb	%dil, 2111(%rsp)
	movb	2080(%rdx), %dil
	movb	%dil, 2112(%rsp)
	movb	2081(%rdx), %dil
	movb	%dil, 2113(%rsp)
	movb	2082(%rdx), %dil
	movb	%dil, 2114(%rsp)
	movb	2083(%rdx), %dil
	movb	%dil, 2115(%rsp)
	movb	2084(%rdx), %dil
	movb	%dil, 2116(%rsp)
	movb	2085(%rdx), %dil
	movb	%dil, 2117(%rsp)
	movb	2086(%rdx), %dil
	movb	%dil, 2118(%rsp)
	movb	2087(%rdx), %dil
	movb	%dil, 2119(%rsp)
	movb	2088(%rdx), %dil
	movb	%dil, 2120(%rsp)
	movb	2089(%rdx), %dil
	movb	%dil, 2121(%rsp)
	movb	2090(%rdx), %dil
	movb	%dil, 2122(%rsp)
	movb	2091(%rdx), %dil
	movb	%dil, 2123(%rsp)
	movb	2092(%rdx), %dil
	movb	%dil, 2124(%rsp)
	movb	2093(%rdx), %dil
	movb	%dil, 2125(%rsp)
	movb	2094(%rdx), %dil
	movb	%dil, 2126(%rsp)
	movb	2095(%rdx), %dil
	movb	%dil, 2127(%rsp)
	movb	2096(%rdx), %dil
	movb	%dil, 2128(%rsp)
	movb	2097(%rdx), %dil
	movb	%dil, 2129(%rsp)
	movb	2098(%rdx), %dil
	movb	%dil, 2130(%rsp)
	movb	2099(%rdx), %dil
	movb	%dil, 2131(%rsp)
	movb	2100(%rdx), %dil
	movb	%dil, 2132(%rsp)
	movb	2101(%rdx), %dil
	movb	%dil, 2133(%rsp)
	movb	2102(%rdx), %dil
	movb	%dil, 2134(%rsp)
	movb	2103(%rdx), %dil
	movb	%dil, 2135(%rsp)
	movb	2104(%rdx), %dil
	movb	%dil, 2136(%rsp)
	movb	2105(%rdx), %dil
	movb	%dil, 2137(%rsp)
	movb	2106(%rdx), %dil
	movb	%dil, 2138(%rsp)
	movb	2107(%rdx), %dil
	movb	%dil, 2139(%rsp)
	movb	2108(%rdx), %dil
	movb	%dil, 2140(%rsp)
	movb	2109(%rdx), %dil
	movb	%dil, 2141(%rsp)
	movb	2110(%rdx), %dil
	movb	%dil, 2142(%rsp)
	movb	2111(%rdx), %dil
	movb	%dil, 2143(%rsp)
	movb	2112(%rdx), %dil
	movb	%dil, 2144(%rsp)
	movb	2113(%rdx), %dil
	movb	%dil, 2145(%rsp)
	movb	2114(%rdx), %dil
	movb	%dil, 2146(%rsp)
	movb	2115(%rdx), %dil
	movb	%dil, 2147(%rsp)
	movb	2116(%rdx), %dil
	movb	%dil, 2148(%rsp)
	movb	2117(%rdx), %dil
	movb	%dil, 2149(%rsp)
	movb	2118(%rdx), %dil
	movb	%dil, 2150(%rsp)
	movb	2119(%rdx), %dil
	movb	%dil, 2151(%rsp)
	movb	2120(%rdx), %dil
	movb	%dil, 2152(%rsp)
	movb	2121(%rdx), %dil
	movb	%dil, 2153(%rsp)
	movb	2122(%rdx), %dil
	movb	%dil, 2154(%rsp)
	movb	2123(%rdx), %dil
	movb	%dil, 2155(%rsp)
	movb	2124(%rdx), %dil
	movb	%dil, 2156(%rsp)
	movb	2125(%rdx), %dil
	movb	%dil, 2157(%rsp)
	movb	2126(%rdx), %dil
	movb	%dil, 2158(%rsp)
	movb	2127(%rdx), %dil
	movb	%dil, 2159(%rsp)
	movb	2128(%rdx), %dil
	movb	%dil, 2160(%rsp)
	movb	2129(%rdx), %dil
	movb	%dil, 2161(%rsp)
	movb	2130(%rdx), %dil
	movb	%dil, 2162(%rsp)
	movb	2131(%rdx), %dil
	movb	%dil, 2163(%rsp)
	movb	2132(%rdx), %dil
	movb	%dil, 2164(%rsp)
	movb	2133(%rdx), %dil
	movb	%dil, 2165(%rsp)
	movb	2134(%rdx), %dil
	movb	%dil, 2166(%rsp)
	movb	2135(%rdx), %dil
	movb	%dil, 2167(%rsp)
	movb	2136(%rdx), %dil
	movb	%dil, 2168(%rsp)
	movb	2137(%rdx), %dil
	movb	%dil, 2169(%rsp)
	movb	2138(%rdx), %dil
	movb	%dil, 2170(%rsp)
	movb	2139(%rdx), %dil
	movb	%dil, 2171(%rsp)
	movb	2140(%rdx), %dil
	movb	%dil, 2172(%rsp)
	movb	2141(%rdx), %dil
	movb	%dil, 2173(%rsp)
	movb	2142(%rdx), %dil
	movb	%dil, 2174(%rsp)
	movb	2143(%rdx), %dl
	movb	%dl, 2175(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkfromsig$3
.Lwots_pkfromsig$4:
	movq	%r10, 2184(%rsp)
	movl	%ecx, 2232(%rsp)
	movq	%rdx, 2192(%rsp)
	movl	%ecx, %eax
	movl	%eax, 24(%r11)
	movl	%ecx, %eax
	movl	2236(%rsp,%rax,4), %r8d
	movl	$15, %eax
	subl	%r8d, %eax
	leaq	32(%rsp,%rdx), %rdi
	movl	%eax, %ecx
	movq	%r10, %rdx
	movq	%r11, %r10
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkfromsig$5:
	leaq	24(%rsp), %rsp
	movq	%r10, %r11
	movq	2184(%rsp), %r10
	movl	2232(%rsp), %ecx
	movq	2192(%rsp), %rdx
	incl	%ecx
	addq	$32, %rdx
.Lwots_pkfromsig$3:
	cmpl	$67, %ecx
	jb  	.Lwots_pkfromsig$4
	leaq	2200(%rsp), %rax
	movq	(%r11), %rdx
	movq	%rdx, (%rax)
	movq	8(%r11), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r11), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r11), %rdx
	movq	%rdx, 24(%rax)
	leaq	2200(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$1, 16(%rcx)
	movl	20(%r11), %ecx
	leaq	2200(%rsp), %rax
	movl	%ecx, 20(%rax)
	movq	2176(%rsp), %rcx
	movq	%r11, 2176(%rsp)
	leaq	2200(%rsp), %rax
	leaq	32(%rsp), %rdx
	movq	%rcx, %rdi
	movq	%r10, %r9
	movq	%rax, %r10
	movq	%rdx, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkfromsig$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdx
	movq	2176(%rsp), %rax
	ret
.Lwots_sign$1:
	leaq	84(%rsp), %rsi
	movq	%rsi, %rdi
	movq	$0, %r8
	movl	$0, %ecx
	movl	$0, %r9d
	jmp 	.Lwots_sign$140
.Lwots_sign$141:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$140:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$141
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, (%rdi)
	jmp 	.Lwots_sign$138
.Lwots_sign$139:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$138:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$139
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 4(%rdi)
	jmp 	.Lwots_sign$136
.Lwots_sign$137:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$136:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$137
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 8(%rdi)
	jmp 	.Lwots_sign$134
.Lwots_sign$135:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$134:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$135
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 12(%rdi)
	jmp 	.Lwots_sign$132
.Lwots_sign$133:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$132:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$133
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 16(%rdi)
	jmp 	.Lwots_sign$130
.Lwots_sign$131:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$130:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$131
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 20(%rdi)
	jmp 	.Lwots_sign$128
.Lwots_sign$129:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$128:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$129
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 24(%rdi)
	jmp 	.Lwots_sign$126
.Lwots_sign$127:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$126:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$127
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 28(%rdi)
	jmp 	.Lwots_sign$124
.Lwots_sign$125:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$124:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$125
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 32(%rdi)
	jmp 	.Lwots_sign$122
.Lwots_sign$123:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$122:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$123
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 36(%rdi)
	jmp 	.Lwots_sign$120
.Lwots_sign$121:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$120:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$121
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 40(%rdi)
	jmp 	.Lwots_sign$118
.Lwots_sign$119:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$118:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$119
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 44(%rdi)
	jmp 	.Lwots_sign$116
.Lwots_sign$117:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$116:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$117
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 48(%rdi)
	jmp 	.Lwots_sign$114
.Lwots_sign$115:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$114:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$115
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 52(%rdi)
	jmp 	.Lwots_sign$112
.Lwots_sign$113:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$112:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$113
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 56(%rdi)
	jmp 	.Lwots_sign$110
.Lwots_sign$111:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$110:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$111
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 60(%rdi)
	jmp 	.Lwots_sign$108
.Lwots_sign$109:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$108:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$109
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 64(%rdi)
	jmp 	.Lwots_sign$106
.Lwots_sign$107:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$106:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$107
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 68(%rdi)
	jmp 	.Lwots_sign$104
.Lwots_sign$105:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$104:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$105
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 72(%rdi)
	jmp 	.Lwots_sign$102
.Lwots_sign$103:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$102:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$103
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 76(%rdi)
	jmp 	.Lwots_sign$100
.Lwots_sign$101:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$100:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$101
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 80(%rdi)
	jmp 	.Lwots_sign$98
.Lwots_sign$99:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$98:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$99
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 84(%rdi)
	jmp 	.Lwots_sign$96
.Lwots_sign$97:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$96:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$97
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 88(%rdi)
	jmp 	.Lwots_sign$94
.Lwots_sign$95:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$94:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$95
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 92(%rdi)
	jmp 	.Lwots_sign$92
.Lwots_sign$93:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$92:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$93
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 96(%rdi)
	jmp 	.Lwots_sign$90
.Lwots_sign$91:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$90:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$91
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 100(%rdi)
	jmp 	.Lwots_sign$88
.Lwots_sign$89:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$88:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$89
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 104(%rdi)
	jmp 	.Lwots_sign$86
.Lwots_sign$87:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$86:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$87
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 108(%rdi)
	jmp 	.Lwots_sign$84
.Lwots_sign$85:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$84:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$85
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 112(%rdi)
	jmp 	.Lwots_sign$82
.Lwots_sign$83:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$82:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$83
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 116(%rdi)
	jmp 	.Lwots_sign$80
.Lwots_sign$81:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$80:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$81
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 120(%rdi)
	jmp 	.Lwots_sign$78
.Lwots_sign$79:
	shll	$8, %r9d
	movzbl	(%rax,%r8), %ebp
	orl 	%ebp, %r9d
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$78:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$79
	movl	%r9d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 124(%rdi)
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
	movl	%ebp, 128(%rdi)
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
	movl	%ebp, 132(%rdi)
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
	movl	%ebp, 136(%rdi)
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
	movl	%ebp, 140(%rdi)
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
	movl	%ebp, 144(%rdi)
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
	movl	%ebp, 148(%rdi)
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
	movl	%ebp, 152(%rdi)
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
	movl	%ebp, 156(%rdi)
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
	movl	%ebp, 160(%rdi)
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
	movl	%ebp, 164(%rdi)
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
	movl	%ebp, 168(%rdi)
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
	movl	%ebp, 172(%rdi)
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
	movl	%ebp, 176(%rdi)
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
	movl	%ebp, 180(%rdi)
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
	movl	%ebp, 184(%rdi)
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
	movl	%ebp, 188(%rdi)
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
	movl	%ebp, 192(%rdi)
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
	movl	%ebp, 196(%rdi)
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
	movl	%ebp, 200(%rdi)
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
	movl	%ebp, 204(%rdi)
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
	movl	%ebp, 208(%rdi)
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
	movl	%ebp, 212(%rdi)
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
	movl	%ebp, 216(%rdi)
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
	movl	%ebp, 220(%rdi)
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
	movl	%ebp, 224(%rdi)
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
	movl	%ebp, 228(%rdi)
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
	movl	%ebp, 232(%rdi)
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
	movl	%ebp, 236(%rdi)
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
	movl	%ebp, 240(%rdi)
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
	movl	%ebp, 244(%rdi)
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
	movl	%ebp, 248(%rdi)
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
	movl	%eax, 252(%rdi)
	movq	%rsi, %rax
	movl	$960, %ecx
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
	subl	128(%rax), %ecx
	subl	132(%rax), %ecx
	subl	136(%rax), %ecx
	subl	140(%rax), %ecx
	subl	144(%rax), %ecx
	subl	148(%rax), %ecx
	subl	152(%rax), %ecx
	subl	156(%rax), %ecx
	subl	160(%rax), %ecx
	subl	164(%rax), %ecx
	subl	168(%rax), %ecx
	subl	172(%rax), %ecx
	subl	176(%rax), %ecx
	subl	180(%rax), %ecx
	subl	184(%rax), %ecx
	subl	188(%rax), %ecx
	subl	192(%rax), %ecx
	subl	196(%rax), %ecx
	subl	200(%rax), %ecx
	subl	204(%rax), %ecx
	subl	208(%rax), %ecx
	subl	212(%rax), %ecx
	subl	216(%rax), %ecx
	subl	220(%rax), %ecx
	subl	224(%rax), %ecx
	subl	228(%rax), %ecx
	subl	232(%rax), %ecx
	subl	236(%rax), %ecx
	subl	240(%rax), %ecx
	subl	244(%rax), %ecx
	subl	248(%rax), %ecx
	subl	252(%rax), %ecx
	shll	$4, %ecx
	movl	%ecx, %eax
	shrl	$0, %eax
	andl	$255, %eax
	movb	%al, 353(%rsp)
	shrl	$8, %ecx
	andl	$255, %ecx
	movb	%cl, 352(%rsp)
	leaq	256(%rsi), %rax
	leaq	352(%rsp), %rsi
	movq	$0, %r8
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %edi
	movzbl	(%rsi,%r8), %r9d
	orl 	%r9d, %edi
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$12:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$13
	movl	%edi, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, (%rax)
	jmp 	.Lwots_sign$10
.Lwots_sign$11:
	shll	$8, %edi
	movzbl	(%rsi,%r8), %r9d
	orl 	%r9d, %edi
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$10:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$11
	movl	%edi, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, 4(%rax)
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %edi
	movzbl	(%rsi,%r8), %r9d
	orl 	%r9d, %edi
	incq	%r8
	addl	$8, %ecx
.Lwots_sign$8:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$9
	movl	%edi, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, 8(%rax)
	leaq	48(%rsp), %rax
	movq	(%r10), %rdi
	movq	%rdi, (%rax)
	movq	8(%r10), %rdi
	movq	%rdi, 8(%rax)
	movq	16(%r10), %rdi
	movq	%rdi, 16(%rax)
	movq	24(%r10), %rdi
	movq	%rdi, 24(%rax)
	leaq	48(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$5, 16(%rax)
	movl	20(%r10), %ecx
	leaq	48(%rsp), %rax
	movl	%ecx, 20(%rax)
	movq	%r10, 8(%rsp)
	movq	$0, %rsi
	movl	$0, %ecx
	jmp 	.Lwots_sign$5
.Lwots_sign$6:
	movq	%r11, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movl	%ecx, 80(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%ecx, %eax
	leaq	48(%rsp), %rcx
	movl	%eax, 24(%rcx)
	leaq	(%rbx,%rsi), %rcx
	movq	%rbx, 40(%rsp)
	leaq	48(%rsp), %r10
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_sign$7:
	leaq	56(%rsp), %rsp
	movq	40(%rsp), %rbx
	movq	16(%rsp), %r11
	movq	24(%rsp), %rdx
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rsi
	incl	%ecx
	addq	$32, %rsi
.Lwots_sign$5:
	cmpl	$67, %ecx
	jb  	.Lwots_sign$6
	movq	8(%rsp), %rax
	movq	$0, %rdi
	movl	$0, %esi
	jmp 	.Lwots_sign$2
.Lwots_sign$3:
	movq	%rdx, 8(%rsp)
	movl	%esi, 80(%rsp)
	movq	%rdi, 32(%rsp)
	movl	%esi, %ecx
	movl	%ecx, 24(%rax)
	movl	$0, %r8d
	movl	%esi, %ecx
	movl	84(%rsp,%rcx,4), %ecx
	leaq	(%rbx,%rdi), %rdi
	movq	%rbx, 24(%rsp)
	movq	%rax, %r10
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_sign$4:
	leaq	24(%rsp), %rsp
	movq	%r10, %rax
	movq	24(%rsp), %rbx
	movq	8(%rsp), %rdx
	movl	80(%rsp), %esi
	movq	32(%rsp), %rdi
	incl	%esi
	addq	$32, %rdi
.Lwots_sign$2:
	cmpl	$67, %esi
	jb  	.Lwots_sign$3
	ret
.Lwots_pkgen$1:
	movq	%rdi, 2176(%rsp)
	leaq	2216(%rsp), %rcx
	movq	(%r10), %rdi
	movq	%rdi, (%rcx)
	movq	8(%r10), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%r10), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%r10), %rdi
	movq	%rdi, 24(%rcx)
	leaq	2216(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%r10), %ecx
	leaq	2216(%rsp), %rsi
	movl	%ecx, 20(%rsi)
	movl	%ecx, 2248(%rsp)
	movq	%r10, 2184(%rsp)
	movq	$0, %rdi
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$6
.Lwots_pkgen$7:
	movq	%r11, 2192(%rsp)
	movq	%rdx, 2200(%rsp)
	movl	%ecx, 2252(%rsp)
	movq	%rdi, 2208(%rsp)
	leaq	2216(%rsp), %rsi
	movl	%ecx, 24(%rsi)
	leaq	32(%rsp,%rdi), %rcx
	leaq	2216(%rsp), %r10
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_pkgen$8:
	leaq	56(%rsp), %rsp
	movq	2192(%rsp), %r11
	movq	2200(%rsp), %rdx
	movl	2252(%rsp), %ecx
	movq	2208(%rsp), %rdi
	incl	%ecx
	addq	$32, %rdi
.Lwots_pkgen$6:
	cmpl	$67, %ecx
	jb  	.Lwots_pkgen$7
	movq	2184(%rsp), %r10
	movq	$0, %rsi
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$3
.Lwots_pkgen$4:
	movq	%rdx, 2184(%rsp)
	movl	%ecx, 2252(%rsp)
	movq	%rsi, 2208(%rsp)
	movl	%ecx, 24(%r10)
	movl	$0, %r8d
	movl	$15, %ecx
	leaq	32(%rsp,%rsi), %rdi
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkgen$5:
	leaq	24(%rsp), %rsp
	movq	2184(%rsp), %rdx
	movl	2252(%rsp), %ecx
	movq	2208(%rsp), %rsi
	incl	%ecx
	addq	$32, %rsi
.Lwots_pkgen$3:
	cmpl	$67, %ecx
	jb  	.Lwots_pkgen$4
	leaq	2216(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$1, 16(%rcx)
	movl	2248(%rsp), %ecx
	leaq	2216(%rsp), %rsi
	movl	%ecx, 20(%rsi)
	movq	2176(%rsp), %rcx
	movq	%r10, 2176(%rsp)
	leaq	2216(%rsp), %r10
	leaq	32(%rsp), %rsi
	movq	%rcx, %rdi
	movq	%rdx, %r9
	movq	%rsi, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdi
	movq	2176(%rsp), %rcx
	ret
.Lchain$1:
	movl	%r8d, %esi
	addl	%ecx, %esi
	jmp 	.Lchain$2
.Lchain$3:
	movl	%r8d, 28(%r10)
	movq	%rdx, 8(%rsp)
	movq	%r10, 16(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%esi, 28(%rsp)
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lchain$4:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdi
	movq	8(%rsp), %rdx
	movq	16(%rsp), %r10
	movl	24(%rsp), %r8d
	movl	28(%rsp), %esi
	incl	%r8d
.Lchain$2:
	cmpl	%esi, %r8d
	jb  	.Lchain$3
	ret
.LT_k$1:
	movq	%rdi, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%r9,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r9,%rcx), %xmm2
	movq	24(%r9,%rcx), %rcx
	vmovq	%rcx, %xmm6
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r10), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%r10), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%r10), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%r10), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%r10), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%r10), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%r10), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%r10), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %rdx
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%rcx,%rdx), %xmm2
	vpslldq	$8, %xmm2, %xmm2
	vinserti128	$1, %xmm2, %ymm6, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	8(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm2
	vmovdqu	16(%rcx,%rdx), %xmm6
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rcx
	vmovq	%rcx, %xmm6
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm2, %xmm2
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm7, %ymm7
	vpxor	%ymm11, %ymm8, %ymm8
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm6, %xmm6
	vinserti128	$1, %xmm2, %ymm6, %ymm6
	vpxor	%ymm6, %ymm0, %ymm6
	movq	$0, %rcx
	movq	$0, %rsi
	vmovq	%rsi, %xmm2
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	(%rax,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm0, %ymm14
	movq	16(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	24(%rax,%rcx), %ymm13
	movq	56(%rax,%rcx), %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm9
	movq	64(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm0
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm0, %xmm2
	vpxor	%xmm0, %xmm0, %xmm0
	vinserti128	$1, %xmm0, %ymm2, %ymm0
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm10
	vpxor	%ymm2, %ymm2, %ymm2
	vpblendd	$195, %ymm0, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm2, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm2, %ymm0, %ymm0
	vpblendd	$240, %ymm13, %ymm0, %ymm12
	vpblendd	$240, %ymm0, %ymm13, %ymm13
	vpxor	%ymm14, %ymm7, %ymm0
	vpxor	%ymm11, %ymm8, %ymm2
	vpxor	%ymm12, %ymm1, %ymm1
	vpxor	%ymm13, %ymm3, %ymm3
	vmovdqu	%xmm10, %xmm7
	vinserti128	$1, %xmm9, %ymm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	addq	$72, %rcx
	call	.L_keccakf1600_avx2$1
.LT_k$9:
	movq	$0, %rdx
	jmp 	.LT_k$6
.LT_k$7:
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rax,%rcx), %rsi
	vmovq	%rsi, %xmm9
	vmovdqu	48(%rax,%rcx), %ymm14
	movq	80(%rax,%rcx), %rsi
	vmovq	%rsi, %xmm10
	vmovdqu	88(%rax,%rcx), %ymm13
	movq	120(%rax,%rcx), %rsi
	vpinsrq	$1, %rsi, %xmm9, %xmm9
	movq	128(%rax,%rcx), %rsi
	vmovq	%rsi, %xmm7
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm10, %xmm10
	vpxor	%ymm8, %ymm8, %ymm8
	vpblendd	$195, %ymm7, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm8, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm8, %ymm7, %ymm7
	vpblendd	$240, %ymm13, %ymm7, %ymm12
	vpblendd	$240, %ymm7, %ymm13, %ymm8
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm12, %ymm1, %ymm1
	vpxor	%ymm8, %ymm3, %ymm3
	vmovdqu	%xmm10, %xmm7
	vinserti128	$1, %xmm9, %ymm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	addq	$136, %rcx
	call	.L_keccakf1600_avx2$1
.LT_k$8:
	incq	%rdx
.LT_k$6:
	cmpq	$7, %rdx
	jb  	.LT_k$7
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rax,%rcx), %rsi
	vmovq	%rsi, %xmm8
	vmovdqu	48(%rax,%rcx), %ymm14
	movq	80(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm10
	movq	88(%rax,%rcx), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	movq	$31, %rax
	orq 	%rax, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm7, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm9
	vpxor	%ymm7, %ymm7, %ymm7
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm10, %xmm10
	vpxor	%ymm8, %ymm8, %ymm8
	vpblendd	$195, %ymm7, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm8, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm8, %ymm7, %ymm7
	vpblendd	$240, %ymm13, %ymm7, %ymm12
	vpblendd	$240, %ymm7, %ymm13, %ymm8
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm12, %ymm1, %ymm1
	vpxor	%ymm8, %ymm3, %ymm3
	vmovdqu	%xmm10, %xmm7
	vinserti128	$1, %xmm9, %ymm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	movq	$1, %rax
	shlq	$63, %rax
	vmovq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	48(%rsp), %rcx
	movq	$0, %rax
	movq	$0, %rdx
	jmp 	.LT_k$3
.LT_k$4:
	call	.L_keccakf1600_avx2$1
.LT_k$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rax)
	vmovdqu	%ymm4, 8(%rcx,%rax)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rsi
	movq	%rsi, 40(%rcx,%rax)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rax)
	movq	%xmm7, %rsi
	movq	%rsi, 80(%rcx,%rax)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rax)
	movq	%xmm8, %rsi
	movq	%rsi, 120(%rcx,%rax)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rax)
	addq	$136, %rax
	incq	%rdx
.LT_k$3:
	cmpq	$0, %rdx
	jb  	.LT_k$4
	call	.L_keccakf1600_avx2$1
.LT_k$2:
	movq	%xmm5, (%rcx,%rax)
	vmovdqu	%xmm4, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rax)
	vextracti128	$1, %ymm4, %xmm0
	movq	%xmm0, 24(%rcx,%rax)
	ret
.LT_len$1:
	movq	%rdi, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdx
	vpbroadcastq	(%r9,%rdx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r9,%rdx), %xmm2
	movq	24(%r9,%rdx), %rdx
	vmovq	%rdx, %xmm6
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm6, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	leaq	16(%rsp), %rdx
	movl	(%r10), %esi
	bswapl	%esi
	movl	%esi, (%rdx)
	movl	4(%r10), %esi
	bswapl	%esi
	movl	%esi, 4(%rdx)
	movl	8(%r10), %esi
	bswapl	%esi
	movl	%esi, 8(%rdx)
	movl	12(%r10), %esi
	bswapl	%esi
	movl	%esi, 12(%rdx)
	movl	16(%r10), %esi
	bswapl	%esi
	movl	%esi, 16(%rdx)
	movl	20(%r10), %esi
	bswapl	%esi
	movl	%esi, 20(%rdx)
	movl	24(%r10), %esi
	bswapl	%esi
	movl	%esi, 24(%rdx)
	movl	28(%r10), %esi
	bswapl	%esi
	movl	%esi, 28(%rdx)
	leaq	16(%rsp), %rdx
	movq	$0, %rdi
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%rdx,%rdi), %xmm2
	vpslldq	$8, %xmm2, %xmm2
	vinserti128	$1, %xmm2, %ymm6, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	8(%rdx,%rdi), %rsi
	vmovq	%rsi, %xmm2
	vmovdqu	16(%rdx,%rdi), %xmm6
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rdx
	vmovq	%rdx, %xmm6
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm2
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm7, %ymm7
	vpxor	%ymm11, %ymm8, %ymm8
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm6, %xmm6
	vinserti128	$1, %xmm2, %ymm6, %ymm6
	vpxor	%ymm6, %ymm0, %ymm6
	movq	$0, %rdx
	movq	$0, %rsi
	vmovq	%rsi, %xmm0
	vpxor	%ymm11, %ymm11, %ymm11
	vmovdqu	(%rcx,%rdx), %xmm2
	vinserti128	$1, %xmm2, %ymm11, %ymm14
	movq	16(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm10
	vmovdqu	24(%rcx,%rdx), %ymm13
	movq	56(%rcx,%rdx), %rsi
	vpinsrq	$1, %rsi, %xmm0, %xmm9
	movq	64(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm0
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm0, %xmm2
	vpxor	%xmm0, %xmm0, %xmm0
	vinserti128	$1, %xmm0, %ymm2, %ymm0
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm10, %xmm10
	vpxor	%ymm2, %ymm2, %ymm2
	vpblendd	$195, %ymm0, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm2, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm2, %ymm0, %ymm0
	vpblendd	$240, %ymm13, %ymm0, %ymm12
	vpblendd	$240, %ymm0, %ymm13, %ymm13
	vpxor	%ymm14, %ymm7, %ymm0
	vpxor	%ymm11, %ymm8, %ymm2
	vpxor	%ymm12, %ymm1, %ymm1
	vpxor	%ymm13, %ymm3, %ymm3
	vmovdqu	%xmm10, %xmm7
	vinserti128	$1, %xmm9, %ymm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	addq	$72, %rdx
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
	vmovq	%rsi, %xmm8
	vmovdqu	48(%rcx,%rdx), %ymm14
	movq	80(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm10
	vmovdqu	88(%rcx,%rdx), %ymm13
	movq	120(%rcx,%rdx), %rsi
	vpinsrq	$1, %rsi, %xmm8, %xmm9
	movq	128(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm7
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm10, %xmm10
	vpxor	%ymm8, %ymm8, %ymm8
	vpblendd	$195, %ymm7, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm8, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm8, %ymm7, %ymm7
	vpblendd	$240, %ymm13, %ymm7, %ymm12
	vpblendd	$240, %ymm7, %ymm13, %ymm8
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm12, %ymm1, %ymm1
	vpxor	%ymm8, %ymm3, %ymm3
	vmovdqu	%xmm10, %xmm7
	vinserti128	$1, %xmm9, %ymm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	addq	$136, %rdx
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%rdi
.LT_len$6:
	cmpq	$15, %rdi
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rdx), %xmm7
	movq	24(%rcx,%rdx), %rcx
	vmovq	%rcx, %xmm11
	movq	$0, %rcx
	movq	$31, %rdx
	orq 	%rdx, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	48(%rsp), %rcx
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm4, 8(%rcx,%rdx)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rdx)
	movq	%xmm8, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%rdi
.LT_len$3:
	cmpq	$0, %rdi
	jb  	.LT_len$4
	call	.L_keccakf1600_avx2$1
.LT_len$2:
	movq	%xmm5, (%rcx,%rdx)
	vmovdqu	%xmm4, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rdx)
	vextracti128	$1, %ymm4, %xmm0
	movq	%xmm0, 24(%rcx,%rdx)
	ret
.LH$1:
	movq	%rdi, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdi
	vpbroadcastq	(%r9,%rdi), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r9,%rdi), %xmm2
	movq	24(%r9,%rdi), %rsi
	vmovq	%rsi, %xmm6
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm6, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	leaq	16(%rsp), %rsi
	movl	(%r10), %edi
	bswapl	%edi
	movl	%edi, (%rsi)
	movl	4(%r10), %edi
	bswapl	%edi
	movl	%edi, 4(%rsi)
	movl	8(%r10), %edi
	bswapl	%edi
	movl	%edi, 8(%rsi)
	movl	12(%r10), %edi
	bswapl	%edi
	movl	%edi, 12(%rsi)
	movl	16(%r10), %edi
	bswapl	%edi
	movl	%edi, 16(%rsi)
	movl	20(%r10), %edi
	bswapl	%edi
	movl	%edi, 20(%rsi)
	movl	24(%r10), %edi
	bswapl	%edi
	movl	%edi, 24(%rsi)
	movl	28(%r10), %edi
	bswapl	%edi
	movl	%edi, 28(%rsi)
	leaq	16(%rsp), %rsi
	movq	$0, %rdi
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%rsi,%rdi), %xmm2
	vpslldq	$8, %xmm2, %xmm2
	vinserti128	$1, %xmm2, %ymm6, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	8(%rsi,%rdi), %r8
	vmovq	%r8, %xmm2
	vmovdqu	16(%rsi,%rdi), %xmm6
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rsi
	vmovq	%rsi, %xmm6
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm2, %xmm2
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm7, %ymm7
	vpxor	%ymm11, %ymm8, %ymm8
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm6, %xmm6
	vinserti128	$1, %xmm2, %ymm6, %ymm6
	vpxor	%ymm6, %ymm0, %ymm0
	movq	$0, %rdi
	movq	$0, %rsi
	vmovq	%rsi, %xmm2
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%rcx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	16(%rcx,%rdi), %rsi
	vmovq	%rsi, %xmm6
	movq	24(%rcx,%rdi), %rcx
	vmovq	%rcx, %xmm11
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm2, %xmm2
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm7, %ymm7
	vpxor	%ymm11, %ymm8, %ymm8
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm6, %xmm6
	vinserti128	$1, %xmm2, %ymm6, %ymm6
	vpxor	%ymm6, %ymm0, %ymm0
	movq	$0, %rcx
	movq	$0, %rsi
	vmovq	%rsi, %xmm2
	vpxor	%ymm14, %ymm14, %ymm14
	movq	$0, %rsi
	vmovq	%rsi, %xmm6
	vmovdqu	(%rdx,%rcx), %xmm9
	vpslldq	$8, %xmm9, %xmm9
	vmovdqu	8(%rdx,%rcx), %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
	movq	24(%rdx,%rcx), %rcx
	vpinsrq	$1, %rcx, %xmm2, %xmm9
	movq	$0, %rcx
	movq	$31, %rdx
	orq 	%rdx, %rcx
	vmovq	%rcx, %xmm11
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm2
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm2, %ymm2
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm2, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm2, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm12
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm7, %ymm7
	vpxor	%ymm11, %ymm8, %ymm2
	vpxor	%ymm12, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm6, %xmm6
	vinserti128	$1, %xmm9, %ymm6, %ymm6
	vpxor	%ymm6, %ymm0, %ymm6
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm8
	vpxor	%ymm8, %ymm7, %ymm0
	movq	48(%rsp), %rcx
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm4, 8(%rcx,%rdx)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rdx)
	movq	%xmm8, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%rdi
.LH$3:
	cmpq	$0, %rdi
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm5, (%rcx,%rdx)
	vmovdqu	%xmm4, %xmm0
	vmovdqu	%xmm0, 8(%rcx,%rdx)
	vextracti128	$1, %ymm4, %xmm0
	movq	%xmm0, 24(%rcx,%rdx)
	ret
.LF$1:
	movq	%rdi, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%rdx,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rdx,%rcx), %xmm2
	movq	24(%rdx,%rcx), %rcx
	vmovq	%rcx, %xmm6
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r10), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%r10), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%r10), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%r10), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%r10), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%r10), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%r10), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%r10), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %rdx
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%rcx,%rdx), %xmm2
	vpslldq	$8, %xmm2, %xmm2
	vinserti128	$1, %xmm2, %ymm6, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	8(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm2
	vmovdqu	16(%rcx,%rdx), %xmm6
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rcx
	vmovq	%rcx, %xmm6
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm2, %xmm2
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm7, %ymm7
	vpxor	%ymm11, %ymm8, %ymm8
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm6, %xmm6
	vinserti128	$1, %xmm2, %ymm6, %ymm6
	vpxor	%ymm6, %ymm0, %ymm0
	movq	$0, %rcx
	movq	$0, %rsi
	vmovq	%rsi, %xmm2
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%rdi,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	16(%rdi,%rcx), %rdx
	vmovq	%rdx, %xmm6
	movq	24(%rdi,%rcx), %rcx
	vmovq	%rcx, %xmm11
	movq	$0, %rcx
	movq	$31, %rdx
	orq 	%rdx, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm2, %xmm9
	vpxor	%ymm2, %ymm2, %ymm2
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm2, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm2, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm12
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm7, %ymm7
	vpxor	%ymm11, %ymm8, %ymm2
	vpxor	%ymm12, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm6, %xmm6
	vinserti128	$1, %xmm9, %ymm6, %ymm6
	vpxor	%ymm6, %ymm0, %ymm6
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm8
	vpxor	%ymm8, %ymm7, %ymm0
	movq	48(%rsp), %rcx
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm4, 8(%rcx,%rdx)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rdx)
	movq	%xmm8, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%rdi
.LF$3:
	cmpq	$0, %rdi
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm5, (%rcx,%rdx)
	vmovdqu	%xmm4, %xmm0
	vmovdqu	%xmm0, 8(%rcx,%rdx)
	vextracti128	$1, %ymm4, %xmm0
	movq	%xmm0, 24(%rcx,%rdx)
	ret
.LPRF$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%rdx,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rdx,%rcx), %xmm2
	movq	24(%rdx,%rcx), %rcx
	vmovq	%rcx, %xmm6
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r10), %edx
	bswapl	%edx
	movl	%edx, (%rcx)
	movl	4(%r10), %edx
	bswapl	%edx
	movl	%edx, 4(%rcx)
	movl	8(%r10), %edx
	bswapl	%edx
	movl	%edx, 8(%rcx)
	movl	12(%r10), %edx
	bswapl	%edx
	movl	%edx, 12(%rcx)
	movl	16(%r10), %edx
	bswapl	%edx
	movl	%edx, 16(%rcx)
	movl	20(%r10), %edx
	bswapl	%edx
	movl	%edx, 20(%rcx)
	movl	24(%r10), %edx
	bswapl	%edx
	movl	%edx, 24(%rcx)
	movl	28(%r10), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %rdx
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%rcx,%rdx), %xmm2
	vpslldq	$8, %xmm2, %xmm2
	vinserti128	$1, %xmm2, %ymm6, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	8(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm2
	vmovdqu	16(%rcx,%rdx), %xmm6
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rcx
	vmovq	%rcx, %xmm6
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm2, %xmm2
	vpxor	%ymm9, %ymm9, %ymm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm9, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm9, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm9
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm7, %ymm7
	vpxor	%ymm11, %ymm8, %ymm8
	vpxor	%ymm9, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm6, %xmm6
	vinserti128	$1, %xmm2, %ymm6, %ymm6
	vpxor	%ymm6, %ymm0, %ymm0
	movq	$0, %rcx
	movq	$0, %rsi
	vmovq	%rsi, %xmm2
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%r11,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	16(%r11,%rcx), %rdx
	vmovq	%rdx, %xmm6
	movq	24(%r11,%rcx), %rcx
	vmovq	%rcx, %xmm11
	movq	$0, %rcx
	movq	$31, %rdx
	orq 	%rdx, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm2, %xmm9
	vpxor	%ymm2, %ymm2, %ymm2
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vpxor	%ymm10, %ymm10, %ymm10
	vpblendd	$195, %ymm2, %ymm14, %ymm11
	vpblendd	$195, %ymm13, %ymm10, %ymm12
	vpblendd	$195, %ymm14, %ymm13, %ymm13
	vpblendd	$240, %ymm12, %ymm11, %ymm14
	vpblendd	$240, %ymm11, %ymm12, %ymm11
	vpblendd	$195, %ymm10, %ymm2, %ymm10
	vpblendd	$240, %ymm13, %ymm10, %ymm12
	vpblendd	$240, %ymm10, %ymm13, %ymm10
	vpxor	%ymm14, %ymm7, %ymm7
	vpxor	%ymm11, %ymm8, %ymm2
	vpxor	%ymm12, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vmovdqu	%xmm6, %xmm6
	vinserti128	$1, %xmm9, %ymm6, %ymm6
	vpxor	%ymm6, %ymm0, %ymm6
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm8
	vpxor	%ymm8, %ymm7, %ymm0
	movq	48(%rsp), %rcx
	movq	$0, %rdx
	movq	$0, %rdi
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm4, 8(%rcx,%rdx)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rdx)
	movq	%xmm8, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%rdi
.LPRF$3:
	cmpq	$0, %rdi
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm5, (%rcx,%rdx)
	vmovdqu	%xmm4, %xmm0
	vmovdqu	%xmm0, 8(%rcx,%rdx)
	vextracti128	$1, %ymm4, %xmm0
	movq	%xmm0, 24(%rcx,%rdx)
	ret
.LPRF_msg$1:
	movq	%r11, 232(%rsp)
	movq	%rcx, 240(%rsp)
	movq	%rdx, 248(%rsp)
	movq	%rdi, 256(%rsp)
	movq	%r8, 264(%rsp)
	leaq	32(%rsp), %rax
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
	vmovdqu	(%r10), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vmovdqu	(%r9), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	movb	$0, 96(%rsp)
	movb	%dl, 97(%rsp)
	movq	$66, %rdi
	movq	$0, %rdx
	movq	240(%rsp), %rax
	movq	248(%rsp), %rcx
	jmp 	.LPRF_msg$11
.LPRF_msg$12:
	cmpq	$136, %rdi
	jb  	.LPRF_msg$13
	movq	%rax, 248(%rsp)
	movq	%rdx, 240(%rsp)
	movq	%rcx, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$14:
	leaq	208(%rsp), %rsp
	movq	248(%rsp), %rax
	movq	240(%rsp), %rdx
	movq	272(%rsp), %rcx
	movq	$0, %rdi
.LPRF_msg$13:
	movb	(%rax,%rdx), %r8b
	incq	%rdx
	xorb	%r8b, 32(%rsp,%rdi)
	incq	%rdi
.LPRF_msg$11:
	cmpq	%rcx, %rdx
	jb  	.LPRF_msg$12
	movq	$0, %rax
	movq	256(%rsp), %rdx
	movq	264(%rsp), %rsi
	jmp 	.LPRF_msg$7
.LPRF_msg$8:
	cmpq	$136, %rdi
	jb  	.LPRF_msg$9
	movq	%rdx, 264(%rsp)
	movq	%rax, 256(%rsp)
	movq	%rsi, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$10:
	leaq	208(%rsp), %rsp
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rax
	movq	272(%rsp), %rsi
	movq	$0, %rdi
.LPRF_msg$9:
	movb	(%rdx,%rax), %r8b
	incq	%rax
	xorb	%r8b, 32(%rsp,%rdi)
	incq	%rdi
.LPRF_msg$7:
	cmpq	%rsi, %rax
	jb  	.LPRF_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rdi
	jb  	.LPRF_msg$5
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$6:
	leaq	208(%rsp), %rsp
	movq	$0, %rdi
.LPRF_msg$5:
	xorb	$31, 32(%rsp,%rdi)
	leaq	32(%rsp), %rax
	cmpq	$136, %rdi
	jb  	.LPRF_msg$3
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$4:
	leaq	208(%rsp), %rsp
.LPRF_msg$3:
	xorb	$128, 167(%rsp)
	leaq	32(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$2:
	leaq	208(%rsp), %rsp
	movq	232(%rsp), %rcx
	vmovdqu	32(%rsp), %ymm0
	vmovdqu	%ymm0, (%rcx)
	ret
.LH_msg$1:
	movq	%rdi, 232(%rsp)
	movq	%r11, 240(%rsp)
	movq	%rbx, 248(%rsp)
	movq	%rdx, 256(%rsp)
	movq	%rsi, 264(%rsp)
	leaq	32(%rsp), %rax
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
	vmovdqu	(%r8), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vmovdqu	(%r9), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	vmovdqu	(%r10), %ymm0
	vmovdqu	%ymm0, 96(%rsp)
	movb	$0, 128(%rsp)
	movb	%bl, 129(%rsp)
	movq	$98, %rdi
	movq	$0, %rdx
	movq	240(%rsp), %rax
	movq	248(%rsp), %rcx
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %rdi
	jb  	.LH_msg$13
	movq	%rax, 248(%rsp)
	movq	%rdx, 240(%rsp)
	movq	%rcx, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$14:
	leaq	208(%rsp), %rsp
	movq	248(%rsp), %rax
	movq	240(%rsp), %rdx
	movq	272(%rsp), %rcx
	movq	$0, %rdi
.LH_msg$13:
	movb	(%rax,%rdx), %r8b
	incq	%rdx
	xorb	%r8b, 32(%rsp,%rdi)
	incq	%rdi
.LH_msg$11:
	cmpq	%rcx, %rdx
	jb  	.LH_msg$12
	movq	$0, %rax
	movq	256(%rsp), %rdx
	movq	264(%rsp), %rsi
	jmp 	.LH_msg$7
.LH_msg$8:
	cmpq	$136, %rdi
	jb  	.LH_msg$9
	movq	%rdx, 264(%rsp)
	movq	%rax, 256(%rsp)
	movq	%rsi, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$10:
	leaq	208(%rsp), %rsp
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rax
	movq	272(%rsp), %rsi
	movq	$0, %rdi
.LH_msg$9:
	movb	(%rdx,%rax), %r8b
	incq	%rax
	xorb	%r8b, 32(%rsp,%rdi)
	incq	%rdi
.LH_msg$7:
	cmpq	%rsi, %rax
	jb  	.LH_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rdi
	jb  	.LH_msg$5
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$6:
	leaq	208(%rsp), %rsp
	movq	$0, %rdi
.LH_msg$5:
	xorb	$31, 32(%rsp,%rdi)
	leaq	32(%rsp), %rax
	cmpq	$136, %rdi
	jb  	.LH_msg$3
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$4:
	leaq	208(%rsp), %rsp
.LH_msg$3:
	xorb	$128, 167(%rsp)
	leaq	32(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$2:
	leaq	208(%rsp), %rsp
	movq	232(%rsp), %rdi
	movb	32(%rsp), %r8b
	movb	%r8b, (%rdi)
	movb	33(%rsp), %r8b
	movb	%r8b, 1(%rdi)
	movb	34(%rsp), %r8b
	movb	%r8b, 2(%rdi)
	movb	35(%rsp), %r8b
	movb	%r8b, 3(%rdi)
	movb	36(%rsp), %r8b
	movb	%r8b, 4(%rdi)
	movb	37(%rsp), %r8b
	movb	%r8b, 5(%rdi)
	movb	38(%rsp), %r8b
	movb	%r8b, 6(%rdi)
	movb	39(%rsp), %r8b
	movb	%r8b, 7(%rdi)
	movb	40(%rsp), %r8b
	movb	%r8b, 8(%rdi)
	movb	41(%rsp), %r8b
	movb	%r8b, 9(%rdi)
	movb	42(%rsp), %r8b
	movb	%r8b, 10(%rdi)
	movb	43(%rsp), %r8b
	movb	%r8b, 11(%rdi)
	movb	44(%rsp), %r8b
	movb	%r8b, 12(%rdi)
	movb	45(%rsp), %r8b
	movb	%r8b, 13(%rdi)
	movb	46(%rsp), %r8b
	movb	%r8b, 14(%rdi)
	movb	47(%rsp), %r8b
	movb	%r8b, 15(%rdi)
	movb	48(%rsp), %r8b
	movb	%r8b, 16(%rdi)
	movb	49(%rsp), %r8b
	movb	%r8b, 17(%rdi)
	movb	50(%rsp), %r8b
	movb	%r8b, 18(%rdi)
	movb	51(%rsp), %r8b
	movb	%r8b, 19(%rdi)
	movb	52(%rsp), %r8b
	movb	%r8b, 20(%rdi)
	movb	53(%rsp), %r8b
	movb	%r8b, 21(%rdi)
	movb	54(%rsp), %r8b
	movb	%r8b, 22(%rdi)
	movb	55(%rsp), %r8b
	movb	%r8b, 23(%rdi)
	movb	56(%rsp), %r8b
	movb	%r8b, 24(%rdi)
	movb	57(%rsp), %r8b
	movb	%r8b, 25(%rdi)
	movb	58(%rsp), %r8b
	movb	%r8b, 26(%rdi)
	movb	59(%rsp), %r8b
	movb	%r8b, 27(%rdi)
	movb	60(%rsp), %r8b
	movb	%r8b, 28(%rdi)
	movb	61(%rsp), %r8b
	movb	%r8b, 29(%rdi)
	movb	62(%rsp), %r8b
	movb	%r8b, 30(%rdi)
	movb	63(%rsp), %r8b
	movb	%r8b, 31(%rdi)
	movb	64(%rsp), %r8b
	movb	%r8b, 32(%rdi)
	movb	65(%rsp), %r8b
	movb	%r8b, 33(%rdi)
	movb	66(%rsp), %r8b
	movb	%r8b, 34(%rdi)
	movb	67(%rsp), %r8b
	movb	%r8b, 35(%rdi)
	movb	68(%rsp), %r8b
	movb	%r8b, 36(%rdi)
	movb	69(%rsp), %r8b
	movb	%r8b, 37(%rdi)
	movb	70(%rsp), %r8b
	movb	%r8b, 38(%rdi)
	movb	71(%rsp), %r8b
	movb	%r8b, 39(%rdi)
	movb	72(%rsp), %r8b
	movb	%r8b, 40(%rdi)
	movb	73(%rsp), %r8b
	movb	%r8b, 41(%rdi)
	movb	74(%rsp), %r8b
	movb	%r8b, 42(%rdi)
	movb	75(%rsp), %r8b
	movb	%r8b, 43(%rdi)
	movb	76(%rsp), %r8b
	movb	%r8b, 44(%rdi)
	movb	77(%rsp), %r8b
	movb	%r8b, 45(%rdi)
	movb	78(%rsp), %r8b
	movb	%r8b, 46(%rdi)
	movb	79(%rsp), %r8b
	movb	%r8b, 47(%rdi)
	movb	80(%rsp), %r8b
	movb	%r8b, 48(%rdi)
	ret
.L_keccakf1600_avx2$1:
	call	.L__keccakf1600_avx2$1
.L_keccakf1600_avx2$2:
	ret
.L__keccakf1600_avx2$1:
	leaq	glob_data + 384(%rip), %rsi
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
	vpbroadcastq	(%rsi,%r8,8), %ymm7
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
