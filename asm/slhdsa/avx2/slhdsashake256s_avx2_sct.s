	.att_syntax
	.text
	.p2align	5
	.global	slh_dsa_shake256s_verify
	.global	slh_dsa_shake256s_sign
	.global	slh_dsa_shake256s_keygen
	.type	slh_dsa_shake256s_verify, %function
slh_dsa_shake256s_verify:
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
	jbe 	.Lslh_dsa_shake256s_verify$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake256s_verify$2
.Lslh_dsa_shake256s_verify$1:
	movq	%rsi, %rcx
	movq	%r9, %rsi
	leaq	-184(%rsp), %rsp
	call	.Lslh_verify_internal_$1
.Lslh_dsa_shake256s_verify$3:
	leaq	184(%rsp), %rsp
.Lslh_dsa_shake256s_verify$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake256s_sign, %function
slh_dsa_shake256s_sign:
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
	jbe 	.Lslh_dsa_shake256s_sign$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake256s_sign$2
.Lslh_dsa_shake256s_sign$1:
	movq	%rdi, %rcx
	movq	%r10, %rdi
	leaq	-216(%rsp), %rsp
	call	.Lslh_sign_internal_$1
.Lslh_dsa_shake256s_sign$3:
	leaq	216(%rsp), %rsp
	movq	%rcx, %rax
.Lslh_dsa_shake256s_sign$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake256s_keygen, %function
slh_dsa_shake256s_keygen:
	movq	%rsp, %rax
	leaq	-8(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rax, (%rsp)
	movq	%rdx, %rax
	leaq	-56(%rsp), %rsp
	call	.Lslh_keygen_internal_$1
.Lslh_dsa_shake256s_keygen$1:
	leaq	56(%rsp), %rsp
	movq	(%rsp), %rsp
	ret
.Lslh_verify_internal_$1:
	leaq	88(%rsp), %r11
	movq	$0, (%r11)
	movq	$0, 8(%r11)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
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
	leaq	175(%rsp), %rsi
	leaq	182(%rsp), %rdi
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
	movl	$0, 124(%rsp)
	andl	$16777215, 128(%rsp)
	movl	$0, %esi
	shll	$8, %esi
	movzbl	(%rdi), %r8d
	orl 	%r8d, %esi
	andl	$255, %esi
	leaq	88(%rsp), %r8
	movl	124(%rsp), %edi
	movl	%edi, 4(%r8)
	movl	128(%rsp), %edi
	movl	%edi, 8(%r8)
	movl	132(%rsp), %edi
	movl	%edi, 12(%r8)
	leaq	88(%rsp), %r8
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$3, 16(%r8)
	leaq	88(%rsp), %r8
	movl	%esi, 20(%r8)
	leaq	32(%rcx), %r10
	movq	%r9, 80(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rcx, 64(%rsp)
	movl	%esi, 120(%rsp)
	leaq	32(%rsp), %rax
	leaq	88(%rsp), %r8
	leaq	-1016(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	1016(%rsp), %rsp
	movq	80(%rsp), %r9
	movq	72(%rsp), %r10
	movq	64(%rsp), %rax
	movl	120(%rsp), %edx
	leaq	32(%rsp), %rcx
	leaq	10592(%rax), %rsi
	leaq	124(%rsp), %rdi
	movq	%rcx, %rax
	movq	%rsi, %rcx
	leaq	-152(%rsp), %rsp
	call	.Lht_verify$1
.Lslh_verify_internal_$2:
	leaq	152(%rsp), %rsp
	ret
.Lslh_sign_internal_$1:
	leaq	112(%rsp), %r11
	movq	$0, (%r11)
	movq	$0, 8(%r11)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
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
	leaq	199(%rsp), %rcx
	leaq	206(%rsp), %rdi
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
	movl	$0, 148(%rsp)
	andl	$16777215, 152(%rsp)
	movl	$0, %ecx
	shll	$8, %ecx
	movzbl	(%rdi), %r8d
	orl 	%r8d, %ecx
	andl	$255, %ecx
	leaq	112(%rsp), %r8
	movl	148(%rsp), %edi
	movl	%edi, 4(%r8)
	movl	152(%rsp), %edi
	movl	%edi, 8(%r8)
	movl	156(%rsp), %edi
	movl	%edi, 12(%r8)
	leaq	112(%rsp), %r8
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$3, 16(%r8)
	leaq	112(%rsp), %r8
	movl	%ecx, 20(%r8)
	leaq	32(%rax), %r10
	movq	%rsi, 72(%rsp)
	movq	%r9, 80(%rsp)
	movq	%rax, 88(%rsp)
	movq	%rdx, 64(%rsp)
	movl	%ecx, 144(%rsp)
	leaq	112(%rsp), %r8
	movq	%rsi, %r11
	leaq	-152(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	152(%rsp), %rsp
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
	leaq	112(%rsp), %r8
	leaq	-1016(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	1016(%rsp), %rsp
	movq	64(%rsp), %r11
	movq	88(%rsp), %r9
	movq	80(%rsp), %rax
	movl	144(%rsp), %edx
	leaq	10592(%rax), %rcx
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
	movq	%rax, %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
	leaq	32(%rsi), %r11
	leaq	32(%rax), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
	leaq	64(%rsi), %r11
	leaq	64(%rax), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
	movq	%rdi, %r11
	leaq	64(%rax), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
	movq	%rsi, %r11
	leaq	64(%rsi), %r9
	leaq	24(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$7, %eax
	leaq	24(%rsp), %r8
	movl	%eax, (%r8)
	movl	$0, %r10d
	movl	$8, %eax
	leaq	96(%rsi), %rcx
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %r8
	movl	%r10d, %edi
	movl	%eax, %edx
	leaq	-16504(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	16504(%rsp), %rsp
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
	movq	%rax, 864(%rsp)
	leaq	928(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lfors_pkfromsig$53
.Lfors_pkfromsig$54:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$53:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$54
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, (%rax)
	jmp 	.Lfors_pkfromsig$51
.Lfors_pkfromsig$52:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$51:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$52
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 4(%rax)
	jmp 	.Lfors_pkfromsig$49
.Lfors_pkfromsig$50:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$49:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$50
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 8(%rax)
	jmp 	.Lfors_pkfromsig$47
.Lfors_pkfromsig$48:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$47:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$48
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 12(%rax)
	jmp 	.Lfors_pkfromsig$45
.Lfors_pkfromsig$46:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$45:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$46
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 16(%rax)
	jmp 	.Lfors_pkfromsig$43
.Lfors_pkfromsig$44:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$43:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$44
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 20(%rax)
	jmp 	.Lfors_pkfromsig$41
.Lfors_pkfromsig$42:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$41:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$42
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 24(%rax)
	jmp 	.Lfors_pkfromsig$39
.Lfors_pkfromsig$40:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$39:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$40
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 28(%rax)
	jmp 	.Lfors_pkfromsig$37
.Lfors_pkfromsig$38:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$37:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$38
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 32(%rax)
	jmp 	.Lfors_pkfromsig$35
.Lfors_pkfromsig$36:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$35:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$36
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 36(%rax)
	jmp 	.Lfors_pkfromsig$33
.Lfors_pkfromsig$34:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$33:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$34
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 40(%rax)
	jmp 	.Lfors_pkfromsig$31
.Lfors_pkfromsig$32:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$31:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$32
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 44(%rax)
	jmp 	.Lfors_pkfromsig$29
.Lfors_pkfromsig$30:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$29:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$30
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 48(%rax)
	jmp 	.Lfors_pkfromsig$27
.Lfors_pkfromsig$28:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$27:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$28
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 52(%rax)
	jmp 	.Lfors_pkfromsig$25
.Lfors_pkfromsig$26:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$25:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$26
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 56(%rax)
	jmp 	.Lfors_pkfromsig$23
.Lfors_pkfromsig$24:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$23:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$24
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 60(%rax)
	jmp 	.Lfors_pkfromsig$21
.Lfors_pkfromsig$22:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$21:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$22
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 64(%rax)
	jmp 	.Lfors_pkfromsig$19
.Lfors_pkfromsig$20:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$19:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$20
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 68(%rax)
	jmp 	.Lfors_pkfromsig$17
.Lfors_pkfromsig$18:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$17:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$18
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 72(%rax)
	jmp 	.Lfors_pkfromsig$15
.Lfors_pkfromsig$16:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$15:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$16
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 76(%rax)
	jmp 	.Lfors_pkfromsig$13
.Lfors_pkfromsig$14:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$13:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$14
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 80(%rax)
	jmp 	.Lfors_pkfromsig$11
.Lfors_pkfromsig$12:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %r11d
	orl 	%r11d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_pkfromsig$11:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$12
	movl	%edi, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 84(%rax)
	movq	$0, %rax
	movq	$0, %rcx
	movq	$0, %rdi
	jmp 	.Lfors_pkfromsig$3
.Lfors_pkfromsig$4:
	movq	%rcx, 872(%rsp)
	leaq	(%r10,%rax), %rdx
	leaq	64(%rsp), %r11
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
	movl	$0, %esi
	movl	%esi, 24(%r8)
	movl	%edi, %ecx
	shll	$14, %ecx
	addl	928(%rsp,%rdi,4), %ecx
	movl	%ecx, 28(%r8)
	movq	%r9, 880(%rsp)
	movq	%r8, 888(%rsp)
	movq	%r10, 896(%rsp)
	movq	%rdi, 904(%rsp)
	movq	%rax, 912(%rsp)
	leaq	64(%rsp), %rdi
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	56(%rsp), %rsp
	movq	880(%rsp), %r9
	movq	888(%rsp), %r8
	movq	896(%rsp), %r10
	movq	904(%rsp), %rdi
	movq	912(%rsp), %rax
	addq	$32, %rax
	movl	928(%rsp,%rdi,4), %r11d
	movl	$0, %edx
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movl	%edx, %esi
	incl	%esi
	movl	%esi, 24(%r8)
	movl	%r11d, %ecx
	andl	$1, %ecx
	movl	%edx, 920(%rsp)
	movl	%r11d, 924(%rsp)
	cmpl	$0, %ecx
	je  	.Lfors_pkfromsig$8
	movl	28(%r8), %ecx
	decl	%ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r8)
	leaq	832(%rsp), %r11
	leaq	(%r10,%rax), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
	leaq	800(%rsp), %r11
	leaq	64(%rsp), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
	jmp 	.Lfors_pkfromsig$9
.Lfors_pkfromsig$8:
	movl	28(%r8), %ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r8)
	leaq	832(%rsp), %r11
	leaq	64(%rsp), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
	leaq	800(%rsp), %r11
	leaq	(%r10,%rax), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
.Lfors_pkfromsig$9:
	movq	%r9, 912(%rsp)
	movq	%r8, 904(%rsp)
	movq	%r10, 896(%rsp)
	movq	%rdi, 888(%rsp)
	movq	%rax, 880(%rsp)
	leaq	32(%rsp), %rdi
	leaq	832(%rsp), %rcx
	leaq	800(%rsp), %rdx
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	56(%rsp), %rsp
	movq	912(%rsp), %r9
	movq	904(%rsp), %r8
	movq	896(%rsp), %r10
	movq	888(%rsp), %rdi
	movq	880(%rsp), %rax
	leaq	64(%rsp), %r11
	leaq	32(%rsp), %rdx
	movq	(%rdx), %rcx
	movq	%rcx, (%r11)
	movq	8(%rdx), %rcx
	movq	%rcx, 8(%r11)
	movq	16(%rdx), %rcx
	movq	%rcx, 16(%r11)
	movq	24(%rdx), %rcx
	movq	%rcx, 24(%r11)
	movl	920(%rsp), %edx
	movl	924(%rsp), %r11d
	shrl	$1, %r11d
	addq	$32, %rax
	incl	%edx
.Lfors_pkfromsig$5:
	cmpl	$14, %edx
	jb  	.Lfors_pkfromsig$6
	movq	872(%rsp), %rcx
	leaq	96(%rsp,%rcx), %r11
	leaq	64(%rsp), %rdx
	movq	(%rdx), %rsi
	movq	%rsi, (%r11)
	movq	8(%rdx), %rsi
	movq	%rsi, 8(%r11)
	movq	16(%rdx), %rsi
	movq	%rsi, 16(%r11)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%r11)
	addq	$32, %rcx
	incq	%rdi
.Lfors_pkfromsig$3:
	cmpq	$22, %rdi
	jb  	.Lfors_pkfromsig$4
	leaq	32(%rsp), %rax
	movq	(%r8), %rcx
	movq	%rcx, (%rax)
	movq	8(%r8), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%r8), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%r8), %rcx
	movq	%rcx, 24(%rax)
	leaq	32(%rsp), %r11
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$4, 16(%r11)
	movl	20(%r8), %ecx
	leaq	32(%rsp), %r8
	movl	%ecx, 20(%r8)
	movq	864(%rsp), %rdi
	leaq	32(%rsp), %r8
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
	jmp 	.Lfors_sign$50
.Lfors_sign$51:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$50:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$51
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, (%rax)
	jmp 	.Lfors_sign$48
.Lfors_sign$49:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$48:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$49
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 4(%rax)
	jmp 	.Lfors_sign$46
.Lfors_sign$47:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$46:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$47
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 8(%rax)
	jmp 	.Lfors_sign$44
.Lfors_sign$45:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$44:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$45
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 12(%rax)
	jmp 	.Lfors_sign$42
.Lfors_sign$43:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$42:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$43
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 16(%rax)
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$41
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 20(%rax)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$39
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 24(%rax)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$37
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 28(%rax)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$35
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 32(%rax)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$33
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 36(%rax)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$31
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 40(%rax)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$29
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 44(%rax)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$27
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 48(%rax)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$25
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 52(%rax)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$23
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 56(%rax)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$21
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 60(%rax)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$19
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 64(%rax)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$17
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 68(%rax)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$15
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 72(%rax)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$13
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 76(%rax)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$11
	movl	%edi, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 80(%rax)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %edi
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %edi
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$9
	movl	%edi, %edx
	addl	$-14, %ecx
	shrq	%cl, %rdx
	andq	$16383, %rdx
	movl	%edx, 84(%rax)
	movq	$0, %rax
	movq	$0, %rdi
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%edi, %edx
	shll	$14, %edx
	addl	64(%rsp,%rdi,4), %edx
	leaq	(%r10,%rax), %rsi
	movq	%r11, 8(%rsp)
	movq	%r9, 16(%rsp)
	movq	%r8, 24(%rsp)
	movq	%r10, 32(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	%edx, %r10d
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %r11
	movq	16(%rsp), %r9
	movq	24(%rsp), %r8
	movq	32(%rsp), %r10
	movq	40(%rsp), %rdi
	movq	48(%rsp), %rax
	addq	$32, %rax
	movl	64(%rsp,%rdi,4), %edx
	xorl	$1, %edx
	movl	$0, %esi
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%r11, 48(%rsp)
	movq	%r9, 40(%rsp)
	movq	%rdi, 32(%rsp)
	movl	%esi, 56(%rsp)
	movq	%rax, 24(%rsp)
	movl	%edx, 60(%rsp)
	movl	$14, %ecx
	subl	%esi, %ecx
	shlq	%cl, %rdi
	addl	%edx, %edi
	leaq	(%r10,%rax), %rcx
	movq	%r10, 16(%rsp)
	movl	%esi, %edx
	leaq	-1048696(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	1048696(%rsp), %rsp
	movq	16(%rsp), %r10
	movq	48(%rsp), %r11
	movq	40(%rsp), %r9
	movq	32(%rsp), %rdi
	movl	56(%rsp), %esi
	movq	24(%rsp), %rax
	movl	60(%rsp), %edx
	shrl	$1, %edx
	xorl	$1, %edx
	addq	$32, %rax
	incl	%esi
.Lfors_sign$4:
	cmpl	$14, %esi
	jb  	.Lfors_sign$5
	incq	%rdi
.Lfors_sign$2:
	cmpq	$22, %rdi
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rcx, 1048640(%rsp)
	movl	$0, %esi
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%edx, 1048680(%rsp)
	movl	%edx, %ecx
	subl	%esi, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r10d
	imull	%edi, %r10d
	addl	%r10d, %edx
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%r11, 1048648(%rsp)
	movl	%edx, 1048684(%rsp)
	cmpl	$0, %esi
	je  	.Lfors_node$6
	movl	%r10d, %eax
	imull	$2, %eax, %eax
	movl	%esi, %edx
	decl	%edx
	movl	$15, %ecx
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
	leaq	1048608(%rsp), %rcx
	leaq	32(%rsp,%r11), %rdx
	movq	(%rdx), %r11
	movq	%r11, (%rcx)
	movq	8(%rdx), %r11
	movq	%r11, 8(%rcx)
	movq	16(%rdx), %r11
	movq	%r11, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	1048576(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
	movl	%esi, 24(%r8)
	movl	%r10d, 28(%r8)
	movl	$15, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %r11
	subl	%esi, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %r11
	shrq	$1, %rbp
	movl	%r10d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %r11
	imulq	$32, %r11, %rax
	movq	%r9, 1048656(%rsp)
	movq	%r8, 1048664(%rsp)
	movl	%edi, 1048688(%rsp)
	movl	%esi, 1048692(%rsp)
	movl	%r10d, 1048696(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	1048608(%rsp), %rcx
	leaq	1048576(%rsp), %rdx
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_node$10:
	leaq	56(%rsp), %rsp
	movq	1048656(%rsp), %r9
	movq	1048664(%rsp), %r8
	movl	1048688(%rsp), %edi
	movl	1048692(%rsp), %esi
	movl	1048696(%rsp), %r10d
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%esi, 24(%r8)
	movl	%r10d, 28(%r8)
	movl	$15, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbx
	subl	%esi, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %rbx
	shrq	$1, %rbp
	movl	%r10d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %rbx
	imulq	$32, %rbx, %rax
	movq	%r9, 1048656(%rsp)
	movq	%r8, 1048664(%rsp)
	movl	%edi, 1048688(%rsp)
	movl	%esi, 1048692(%rsp)
	movl	%r10d, 1048696(%rsp)
	movq	%rax, 1048672(%rsp)
	leaq	32(%rsp,%rax), %rsi
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$9:
	leaq	40(%rsp), %rsp
	movq	1048656(%rsp), %r9
	movq	1048664(%rsp), %r8
	movl	1048688(%rsp), %ecx
	movl	1048692(%rsp), %eax
	movl	1048696(%rsp), %r10d
	movq	1048672(%rsp), %rdx
	movq	%r9, 1048672(%rsp)
	movq	%r8, 1048664(%rsp)
	movl	%ecx, 1048696(%rsp)
	movl	%eax, 1048692(%rsp)
	movl	%r10d, 1048688(%rsp)
	movq	%rdx, 1048656(%rsp)
	leaq	32(%rsp,%rdx), %rdi
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_node$8:
	leaq	56(%rsp), %rsp
	movq	1048672(%rsp), %r9
	movq	1048664(%rsp), %r8
	movl	1048696(%rsp), %edi
	movl	1048692(%rsp), %esi
	movl	1048688(%rsp), %r10d
	movq	1048656(%rsp), %rax
.Lfors_node$7:
	movq	1048648(%rsp), %r11
	movl	1048684(%rsp), %edx
	incl	%r10d
.Lfors_node$4:
	cmpl	%edx, %r10d
	jb  	.Lfors_node$5
	movl	1048680(%rsp), %edx
	incl	%esi
.Lfors_node$2:
	cmpl	%edx, %esi
	jbe 	.Lfors_node$3
	movq	1048640(%rsp), %rcx
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
	leaq	8(%rsp), %rax
	movq	(%r8), %rcx
	movq	%rcx, (%rax)
	movq	8(%r8), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%r8), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%r8), %rcx
	movq	%rcx, 24(%rax)
	leaq	8(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$6, 16(%rax)
	movl	20(%r8), %ecx
	leaq	8(%rsp), %rax
	movl	%ecx, 20(%rax)
	leaq	8(%rsp), %rax
	movl	%r10d, 28(%rax)
	leaq	8(%rsp), %r8
	movq	%rsi, %rcx
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	56(%rsp), %rsp
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%rdi), %esi
	movl	%esi, 140(%rsp)
	movl	4(%rdi), %esi
	movl	%esi, 144(%rsp)
	movl	8(%rdi), %esi
	movl	%esi, 148(%rsp)
	leaq	40(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	leaq	40(%rsp), %r8
	movl	140(%rsp), %esi
	movl	%esi, 4(%r8)
	movl	144(%rsp), %esi
	movl	%esi, 8(%r8)
	movl	148(%rsp), %esi
	movl	%esi, 12(%r8)
	movq	%rcx, %rsi
	movq	%r9, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	72(%rsp), %rcx
	leaq	40(%rsp), %r8
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %r9
	movq	24(%rsp), %rcx
	movq	$2400, %rax
	movl	$1, %edi
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%edi, 136(%rsp)
	movq	%rax, 24(%rsp)
	leaq	140(%rsp), %rsi
	movl	8(%rsi), %edx
	andl	$255, %edx
	shrl	$8, 8(%rsi)
	movl	4(%rsi), %r8d
	shll	$24, %r8d
	orl 	%r8d, 8(%rsi)
	shrl	$8, 4(%rsi)
	movl	(%rsi), %r8d
	shll	$24, %r8d
	orl 	%r8d, 4(%rsi)
	shrl	$8, (%rsi)
	leaq	40(%rsp), %r8
	movl	%edi, (%r8)
	leaq	40(%rsp), %r8
	movl	140(%rsp), %esi
	movl	%esi, 4(%r8)
	movl	144(%rsp), %esi
	movl	%esi, 8(%r8)
	movl	148(%rsp), %esi
	movl	%esi, 12(%r8)
	leaq	104(%rsp), %rdi
	leaq	72(%rsp), %rsi
	movq	(%rsi), %r11
	movq	%r11, (%rdi)
	movq	8(%rsi), %r11
	movq	%r11, 8(%rdi)
	movq	16(%rsi), %r11
	movq	%r11, 16(%rdi)
	movq	24(%rsi), %rsi
	movq	%rsi, 24(%rdi)
	leaq	(%rcx,%rax), %rsi
	movq	%r9, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	72(%rsp), %rcx
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %r8
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %r9
	movq	32(%rsp), %rcx
	movl	136(%rsp), %edi
	movq	24(%rsp), %rax
	addq	$2400, %rax
	incl	%edi
.Lht_verify$2:
	cmpl	$8, %edi
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
	movl	(%rdi), %esi
	movl	%esi, 144(%rsp)
	movl	4(%rdi), %esi
	movl	%esi, 148(%rsp)
	movl	8(%rdi), %esi
	movl	%esi, 152(%rsp)
	leaq	40(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	leaq	40(%rsp), %r8
	movl	144(%rsp), %esi
	movl	%esi, 4(%r8)
	movl	148(%rsp), %esi
	movl	%esi, 8(%r8)
	movl	152(%rsp), %esi
	movl	%esi, 12(%r8)
	movq	%rcx, %rsi
	movq	%rcx, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%r9, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%edx, 136(%rsp)
	leaq	40(%rsp), %r8
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
	movq	8(%rsp), %rcx
	movq	16(%rsp), %r11
	movq	24(%rsp), %r9
	movq	32(%rsp), %rax
	movl	136(%rsp), %edx
	movq	%r11, 32(%rsp)
	movq	%r9, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	72(%rsp), %rcx
	leaq	40(%rsp), %r8
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	216(%rsp), %rsp
	movq	32(%rsp), %r11
	movq	24(%rsp), %r9
	movq	16(%rsp), %rcx
	movq	$2400, %rax
	movl	$1, %esi
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%r11, 16(%rsp)
	leaq	144(%rsp), %rdi
	movl	8(%rdi), %edx
	andl	$255, %edx
	shrl	$8, 8(%rdi)
	movl	4(%rdi), %r8d
	shll	$24, %r8d
	orl 	%r8d, 8(%rdi)
	shrl	$8, 4(%rdi)
	movl	(%rdi), %r8d
	shll	$24, %r8d
	orl 	%r8d, 4(%rdi)
	shrl	$8, (%rdi)
	leaq	40(%rsp), %r8
	movl	%esi, (%r8)
	leaq	40(%rsp), %r8
	movl	144(%rsp), %edi
	movl	%edi, 4(%r8)
	movl	148(%rsp), %edi
	movl	%edi, 8(%r8)
	movl	152(%rsp), %edi
	movl	%edi, 12(%r8)
	leaq	104(%rsp), %rdi
	leaq	72(%rsp), %r8
	movq	(%r8), %r10
	movq	%r10, (%rdi)
	movq	8(%r8), %r10
	movq	%r10, 8(%rdi)
	movq	16(%r8), %r10
	movq	%r10, 16(%rdi)
	movq	24(%r8), %r10
	movq	%r10, 24(%rdi)
	leaq	(%rcx,%rax), %rdi
	movq	%rcx, 24(%rsp)
	movq	%r9, 32(%rsp)
	movl	%esi, 136(%rsp)
	movq	%rax, 8(%rsp)
	movl	%edx, 140(%rsp)
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %r8
	movq	%rdi, %rsi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	%rsi, %rdi
	movq	24(%rsp), %rcx
	movq	32(%rsp), %r9
	movl	136(%rsp), %esi
	movq	8(%rsp), %rax
	movl	140(%rsp), %edx
	cmpl	$7, %esi
	jnb 	.Lht_sign$4
	movq	%r9, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%esi, 140(%rsp)
	movq	%rax, 24(%rsp)
	leaq	72(%rsp), %rcx
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %r8
	movq	%rdi, %rsi
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	216(%rsp), %rsp
	movq	8(%rsp), %r9
	movq	32(%rsp), %rcx
	movl	140(%rsp), %esi
	movq	24(%rsp), %rax
.Lht_sign$4:
	movq	16(%rsp), %r11
	addq	$2400, %rax
	incl	%esi
.Lht_sign$2:
	cmpl	$8, %esi
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 160(%rsp)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$0, 16(%r8)
	movl	%edx, 20(%r8)
	movq	%rsi, %rcx
	movq	%r9, 168(%rsp)
	movl	%edx, 200(%rsp)
	movq	%rsi, 176(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	movq	%r9, %r10
	movq	%r8, %r11
	leaq	-2520(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	2520(%rsp), %rsp
	movq	%rax, %r8
	movq	168(%rsp), %r9
	movl	200(%rsp), %ecx
	movq	176(%rsp), %rsi
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$2, 16(%r8)
	movl	%ecx, 28(%r8)
	movq	$2144, %rax
	movl	%ecx, %r11d
	movl	$0, %edx
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%edx, %ecx
	incl	%ecx
	movl	%ecx, 24(%r8)
	movl	%r11d, %ecx
	andl	$1, %ecx
	movl	%edx, 200(%rsp)
	movl	%r11d, 204(%rsp)
	cmpl	$0, %ecx
	je  	.Lxmss_pkfromsig$5
	movl	28(%r8), %ecx
	decl	%ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r8)
	leaq	128(%rsp), %rcx
	leaq	(%rsi,%rax), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	jmp 	.Lxmss_pkfromsig$6
.Lxmss_pkfromsig$5:
	movl	28(%r8), %ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r8)
	leaq	128(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	96(%rsp), %rcx
	leaq	(%rsi,%rax), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
.Lxmss_pkfromsig$6:
	movq	%r9, 176(%rsp)
	movq	%r8, 168(%rsp)
	movq	%rsi, 184(%rsp)
	movq	%rax, 192(%rsp)
	leaq	64(%rsp), %rdi
	leaq	128(%rsp), %rcx
	leaq	96(%rsp), %rdx
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	56(%rsp), %rsp
	movq	176(%rsp), %r9
	movq	168(%rsp), %r8
	movq	184(%rsp), %rsi
	movq	192(%rsp), %rax
	leaq	32(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	movl	200(%rsp), %edx
	movl	204(%rsp), %r11d
	shrl	$1, %r11d
	addq	$32, %rax
	incl	%edx
.Lxmss_pkfromsig$2:
	cmpl	$8, %edx
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
	movl	%edx, %eax
	xorl	$1, %eax
	movl	$0, %r10d
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%r11, 16(%rsp)
	movq	%r9, 24(%rsp)
	movl	%edx, 48(%rsp)
	movl	%r10d, 52(%rsp)
	movl	%eax, 56(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	(%rsi,%rcx), %rcx
	movq	%rsi, 40(%rsp)
	movl	%eax, %edi
	movl	%r10d, %edx
	leaq	-16504(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	16504(%rsp), %rsp
	movq	40(%rsp), %rsi
	movq	16(%rsp), %r11
	movq	24(%rsp), %r9
	movl	48(%rsp), %edx
	movl	52(%rsp), %r10d
	movl	56(%rsp), %eax
	movq	32(%rsp), %rcx
	shrl	$1, %eax
	xorl	$1, %eax
	addq	$32, %rcx
	incl	%r10d
.Lxmss_sign$3:
	cmpl	$8, %r10d
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rax
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$0, 16(%r8)
	movl	%edx, 20(%r8)
	movq	%rsi, %rbx
	movq	%rsi, 8(%rsp)
	movq	%r9, %r10
	leaq	-360(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	360(%rsp), %rsp
	movq	8(%rsp), %rsi
	ret
.Lxmss_node$1:
	movq	%rcx, 16448(%rsp)
	movl	$0, %esi
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%edx, 16480(%rsp)
	movl	%edx, %ecx
	subl	%esi, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r10d
	imull	%edi, %r10d
	addl	%r10d, %edx
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%r11, 16456(%rsp)
	movq	%r9, 16464(%rsp)
	movl	%edi, 16484(%rsp)
	movl	%esi, 16488(%rsp)
	movl	%r10d, 16492(%rsp)
	movl	%edx, 16496(%rsp)
	cmpl	$0, %esi
	je  	.Lxmss_node$6
	movl	%r10d, %eax
	imull	$2, %eax, %eax
	movl	%esi, %edx
	decl	%edx
	movl	$9, %ecx
	movq	$1, %rdi
	shlq	%cl, %rdi
	subl	%edx, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %rdi
	movl	%eax, %eax
	addq	%rax, %rdi
	imulq	$32, %rdi, %rdi
	movq	%rdi, %rax
	addq	$32, %rax
	leaq	16416(%rsp), %rcx
	leaq	32(%rsp,%rdi), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	16384(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$2, 16(%r8)
	movl	%esi, 24(%r8)
	movl	%r10d, 28(%r8)
	movl	$9, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subl	%esi, %ecx
	movq	$1, %rdi
	shlq	%cl, %rdi
	subq	%rdi, %rdx
	movl	%r10d, %eax
	addq	%rax, %rdx
	imulq	$32, %rdx, %rax
	movq	%r8, 16472(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	16416(%rsp), %rcx
	leaq	16384(%rsp), %rdx
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_node$9:
	leaq	56(%rsp), %rsp
	movq	16472(%rsp), %r8
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$0, 16(%r8)
	movl	%r10d, 20(%r8)
	movl	%r10d, %eax
	imulq	$32, %rax, %rax
	leaq	32(%rsp,%rax), %rdi
	leaq	-2264(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	2264(%rsp), %rsp
	movq	%rcx, %r8
.Lxmss_node$7:
	movq	16456(%rsp), %r11
	movq	16464(%rsp), %r9
	movl	16484(%rsp), %edi
	movl	16488(%rsp), %esi
	movl	16492(%rsp), %r10d
	movl	16496(%rsp), %edx
	incl	%r10d
.Lxmss_node$4:
	cmpl	%edx, %r10d
	jb  	.Lxmss_node$5
	movl	16480(%rsp), %edx
	incl	%esi
.Lxmss_node$2:
	cmpl	%edx, %esi
	jbe 	.Lxmss_node$3
	movq	16448(%rsp), %rcx
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
	movb	(%rdx), %cl
	movb	%cl, 32(%rsp)
	movb	1(%rdx), %cl
	movb	%cl, 33(%rsp)
	movb	2(%rdx), %cl
	movb	%cl, 34(%rsp)
	movb	3(%rdx), %cl
	movb	%cl, 35(%rsp)
	movb	4(%rdx), %cl
	movb	%cl, 36(%rsp)
	movb	5(%rdx), %cl
	movb	%cl, 37(%rsp)
	movb	6(%rdx), %cl
	movb	%cl, 38(%rsp)
	movb	7(%rdx), %cl
	movb	%cl, 39(%rsp)
	movb	8(%rdx), %cl
	movb	%cl, 40(%rsp)
	movb	9(%rdx), %cl
	movb	%cl, 41(%rsp)
	movb	10(%rdx), %cl
	movb	%cl, 42(%rsp)
	movb	11(%rdx), %cl
	movb	%cl, 43(%rsp)
	movb	12(%rdx), %cl
	movb	%cl, 44(%rsp)
	movb	13(%rdx), %cl
	movb	%cl, 45(%rsp)
	movb	14(%rdx), %cl
	movb	%cl, 46(%rsp)
	movb	15(%rdx), %cl
	movb	%cl, 47(%rsp)
	movb	16(%rdx), %cl
	movb	%cl, 48(%rsp)
	movb	17(%rdx), %cl
	movb	%cl, 49(%rsp)
	movb	18(%rdx), %cl
	movb	%cl, 50(%rsp)
	movb	19(%rdx), %cl
	movb	%cl, 51(%rsp)
	movb	20(%rdx), %cl
	movb	%cl, 52(%rsp)
	movb	21(%rdx), %cl
	movb	%cl, 53(%rsp)
	movb	22(%rdx), %cl
	movb	%cl, 54(%rsp)
	movb	23(%rdx), %cl
	movb	%cl, 55(%rsp)
	movb	24(%rdx), %cl
	movb	%cl, 56(%rsp)
	movb	25(%rdx), %cl
	movb	%cl, 57(%rsp)
	movb	26(%rdx), %cl
	movb	%cl, 58(%rsp)
	movb	27(%rdx), %cl
	movb	%cl, 59(%rsp)
	movb	28(%rdx), %cl
	movb	%cl, 60(%rsp)
	movb	29(%rdx), %cl
	movb	%cl, 61(%rsp)
	movb	30(%rdx), %cl
	movb	%cl, 62(%rsp)
	movb	31(%rdx), %cl
	movb	%cl, 63(%rsp)
	movb	32(%rdx), %cl
	movb	%cl, 64(%rsp)
	movb	33(%rdx), %cl
	movb	%cl, 65(%rsp)
	movb	34(%rdx), %cl
	movb	%cl, 66(%rsp)
	movb	35(%rdx), %cl
	movb	%cl, 67(%rsp)
	movb	36(%rdx), %cl
	movb	%cl, 68(%rsp)
	movb	37(%rdx), %cl
	movb	%cl, 69(%rsp)
	movb	38(%rdx), %cl
	movb	%cl, 70(%rsp)
	movb	39(%rdx), %cl
	movb	%cl, 71(%rsp)
	movb	40(%rdx), %cl
	movb	%cl, 72(%rsp)
	movb	41(%rdx), %cl
	movb	%cl, 73(%rsp)
	movb	42(%rdx), %cl
	movb	%cl, 74(%rsp)
	movb	43(%rdx), %cl
	movb	%cl, 75(%rsp)
	movb	44(%rdx), %cl
	movb	%cl, 76(%rsp)
	movb	45(%rdx), %cl
	movb	%cl, 77(%rsp)
	movb	46(%rdx), %cl
	movb	%cl, 78(%rsp)
	movb	47(%rdx), %cl
	movb	%cl, 79(%rsp)
	movb	48(%rdx), %cl
	movb	%cl, 80(%rsp)
	movb	49(%rdx), %cl
	movb	%cl, 81(%rsp)
	movb	50(%rdx), %cl
	movb	%cl, 82(%rsp)
	movb	51(%rdx), %cl
	movb	%cl, 83(%rsp)
	movb	52(%rdx), %cl
	movb	%cl, 84(%rsp)
	movb	53(%rdx), %cl
	movb	%cl, 85(%rsp)
	movb	54(%rdx), %cl
	movb	%cl, 86(%rsp)
	movb	55(%rdx), %cl
	movb	%cl, 87(%rsp)
	movb	56(%rdx), %cl
	movb	%cl, 88(%rsp)
	movb	57(%rdx), %cl
	movb	%cl, 89(%rsp)
	movb	58(%rdx), %cl
	movb	%cl, 90(%rsp)
	movb	59(%rdx), %cl
	movb	%cl, 91(%rsp)
	movb	60(%rdx), %cl
	movb	%cl, 92(%rsp)
	movb	61(%rdx), %cl
	movb	%cl, 93(%rsp)
	movb	62(%rdx), %cl
	movb	%cl, 94(%rsp)
	movb	63(%rdx), %cl
	movb	%cl, 95(%rsp)
	movb	64(%rdx), %cl
	movb	%cl, 96(%rsp)
	movb	65(%rdx), %cl
	movb	%cl, 97(%rsp)
	movb	66(%rdx), %cl
	movb	%cl, 98(%rsp)
	movb	67(%rdx), %cl
	movb	%cl, 99(%rsp)
	movb	68(%rdx), %cl
	movb	%cl, 100(%rsp)
	movb	69(%rdx), %cl
	movb	%cl, 101(%rsp)
	movb	70(%rdx), %cl
	movb	%cl, 102(%rsp)
	movb	71(%rdx), %cl
	movb	%cl, 103(%rsp)
	movb	72(%rdx), %cl
	movb	%cl, 104(%rsp)
	movb	73(%rdx), %cl
	movb	%cl, 105(%rsp)
	movb	74(%rdx), %cl
	movb	%cl, 106(%rsp)
	movb	75(%rdx), %cl
	movb	%cl, 107(%rsp)
	movb	76(%rdx), %cl
	movb	%cl, 108(%rsp)
	movb	77(%rdx), %cl
	movb	%cl, 109(%rsp)
	movb	78(%rdx), %cl
	movb	%cl, 110(%rsp)
	movb	79(%rdx), %cl
	movb	%cl, 111(%rsp)
	movb	80(%rdx), %cl
	movb	%cl, 112(%rsp)
	movb	81(%rdx), %cl
	movb	%cl, 113(%rsp)
	movb	82(%rdx), %cl
	movb	%cl, 114(%rsp)
	movb	83(%rdx), %cl
	movb	%cl, 115(%rsp)
	movb	84(%rdx), %cl
	movb	%cl, 116(%rsp)
	movb	85(%rdx), %cl
	movb	%cl, 117(%rsp)
	movb	86(%rdx), %cl
	movb	%cl, 118(%rsp)
	movb	87(%rdx), %cl
	movb	%cl, 119(%rsp)
	movb	88(%rdx), %cl
	movb	%cl, 120(%rsp)
	movb	89(%rdx), %cl
	movb	%cl, 121(%rsp)
	movb	90(%rdx), %cl
	movb	%cl, 122(%rsp)
	movb	91(%rdx), %cl
	movb	%cl, 123(%rsp)
	movb	92(%rdx), %cl
	movb	%cl, 124(%rsp)
	movb	93(%rdx), %cl
	movb	%cl, 125(%rsp)
	movb	94(%rdx), %cl
	movb	%cl, 126(%rsp)
	movb	95(%rdx), %cl
	movb	%cl, 127(%rsp)
	movb	96(%rdx), %cl
	movb	%cl, 128(%rsp)
	movb	97(%rdx), %cl
	movb	%cl, 129(%rsp)
	movb	98(%rdx), %cl
	movb	%cl, 130(%rsp)
	movb	99(%rdx), %cl
	movb	%cl, 131(%rsp)
	movb	100(%rdx), %cl
	movb	%cl, 132(%rsp)
	movb	101(%rdx), %cl
	movb	%cl, 133(%rsp)
	movb	102(%rdx), %cl
	movb	%cl, 134(%rsp)
	movb	103(%rdx), %cl
	movb	%cl, 135(%rsp)
	movb	104(%rdx), %cl
	movb	%cl, 136(%rsp)
	movb	105(%rdx), %cl
	movb	%cl, 137(%rsp)
	movb	106(%rdx), %cl
	movb	%cl, 138(%rsp)
	movb	107(%rdx), %cl
	movb	%cl, 139(%rsp)
	movb	108(%rdx), %cl
	movb	%cl, 140(%rsp)
	movb	109(%rdx), %cl
	movb	%cl, 141(%rsp)
	movb	110(%rdx), %cl
	movb	%cl, 142(%rsp)
	movb	111(%rdx), %cl
	movb	%cl, 143(%rsp)
	movb	112(%rdx), %cl
	movb	%cl, 144(%rsp)
	movb	113(%rdx), %cl
	movb	%cl, 145(%rsp)
	movb	114(%rdx), %cl
	movb	%cl, 146(%rsp)
	movb	115(%rdx), %cl
	movb	%cl, 147(%rsp)
	movb	116(%rdx), %cl
	movb	%cl, 148(%rsp)
	movb	117(%rdx), %cl
	movb	%cl, 149(%rsp)
	movb	118(%rdx), %cl
	movb	%cl, 150(%rsp)
	movb	119(%rdx), %cl
	movb	%cl, 151(%rsp)
	movb	120(%rdx), %cl
	movb	%cl, 152(%rsp)
	movb	121(%rdx), %cl
	movb	%cl, 153(%rsp)
	movb	122(%rdx), %cl
	movb	%cl, 154(%rsp)
	movb	123(%rdx), %cl
	movb	%cl, 155(%rsp)
	movb	124(%rdx), %cl
	movb	%cl, 156(%rsp)
	movb	125(%rdx), %cl
	movb	%cl, 157(%rsp)
	movb	126(%rdx), %cl
	movb	%cl, 158(%rsp)
	movb	127(%rdx), %cl
	movb	%cl, 159(%rsp)
	movb	128(%rdx), %cl
	movb	%cl, 160(%rsp)
	movb	129(%rdx), %cl
	movb	%cl, 161(%rsp)
	movb	130(%rdx), %cl
	movb	%cl, 162(%rsp)
	movb	131(%rdx), %cl
	movb	%cl, 163(%rsp)
	movb	132(%rdx), %cl
	movb	%cl, 164(%rsp)
	movb	133(%rdx), %cl
	movb	%cl, 165(%rsp)
	movb	134(%rdx), %cl
	movb	%cl, 166(%rsp)
	movb	135(%rdx), %cl
	movb	%cl, 167(%rsp)
	movb	136(%rdx), %cl
	movb	%cl, 168(%rsp)
	movb	137(%rdx), %cl
	movb	%cl, 169(%rsp)
	movb	138(%rdx), %cl
	movb	%cl, 170(%rsp)
	movb	139(%rdx), %cl
	movb	%cl, 171(%rsp)
	movb	140(%rdx), %cl
	movb	%cl, 172(%rsp)
	movb	141(%rdx), %cl
	movb	%cl, 173(%rsp)
	movb	142(%rdx), %cl
	movb	%cl, 174(%rsp)
	movb	143(%rdx), %cl
	movb	%cl, 175(%rsp)
	movb	144(%rdx), %cl
	movb	%cl, 176(%rsp)
	movb	145(%rdx), %cl
	movb	%cl, 177(%rsp)
	movb	146(%rdx), %cl
	movb	%cl, 178(%rsp)
	movb	147(%rdx), %cl
	movb	%cl, 179(%rsp)
	movb	148(%rdx), %cl
	movb	%cl, 180(%rsp)
	movb	149(%rdx), %cl
	movb	%cl, 181(%rsp)
	movb	150(%rdx), %cl
	movb	%cl, 182(%rsp)
	movb	151(%rdx), %cl
	movb	%cl, 183(%rsp)
	movb	152(%rdx), %cl
	movb	%cl, 184(%rsp)
	movb	153(%rdx), %cl
	movb	%cl, 185(%rsp)
	movb	154(%rdx), %cl
	movb	%cl, 186(%rsp)
	movb	155(%rdx), %cl
	movb	%cl, 187(%rsp)
	movb	156(%rdx), %cl
	movb	%cl, 188(%rsp)
	movb	157(%rdx), %cl
	movb	%cl, 189(%rsp)
	movb	158(%rdx), %cl
	movb	%cl, 190(%rsp)
	movb	159(%rdx), %cl
	movb	%cl, 191(%rsp)
	movb	160(%rdx), %cl
	movb	%cl, 192(%rsp)
	movb	161(%rdx), %cl
	movb	%cl, 193(%rsp)
	movb	162(%rdx), %cl
	movb	%cl, 194(%rsp)
	movb	163(%rdx), %cl
	movb	%cl, 195(%rsp)
	movb	164(%rdx), %cl
	movb	%cl, 196(%rsp)
	movb	165(%rdx), %cl
	movb	%cl, 197(%rsp)
	movb	166(%rdx), %cl
	movb	%cl, 198(%rsp)
	movb	167(%rdx), %cl
	movb	%cl, 199(%rsp)
	movb	168(%rdx), %cl
	movb	%cl, 200(%rsp)
	movb	169(%rdx), %cl
	movb	%cl, 201(%rsp)
	movb	170(%rdx), %cl
	movb	%cl, 202(%rsp)
	movb	171(%rdx), %cl
	movb	%cl, 203(%rsp)
	movb	172(%rdx), %cl
	movb	%cl, 204(%rsp)
	movb	173(%rdx), %cl
	movb	%cl, 205(%rsp)
	movb	174(%rdx), %cl
	movb	%cl, 206(%rsp)
	movb	175(%rdx), %cl
	movb	%cl, 207(%rsp)
	movb	176(%rdx), %cl
	movb	%cl, 208(%rsp)
	movb	177(%rdx), %cl
	movb	%cl, 209(%rsp)
	movb	178(%rdx), %cl
	movb	%cl, 210(%rsp)
	movb	179(%rdx), %cl
	movb	%cl, 211(%rsp)
	movb	180(%rdx), %cl
	movb	%cl, 212(%rsp)
	movb	181(%rdx), %cl
	movb	%cl, 213(%rsp)
	movb	182(%rdx), %cl
	movb	%cl, 214(%rsp)
	movb	183(%rdx), %cl
	movb	%cl, 215(%rsp)
	movb	184(%rdx), %cl
	movb	%cl, 216(%rsp)
	movb	185(%rdx), %cl
	movb	%cl, 217(%rsp)
	movb	186(%rdx), %cl
	movb	%cl, 218(%rsp)
	movb	187(%rdx), %cl
	movb	%cl, 219(%rsp)
	movb	188(%rdx), %cl
	movb	%cl, 220(%rsp)
	movb	189(%rdx), %cl
	movb	%cl, 221(%rsp)
	movb	190(%rdx), %cl
	movb	%cl, 222(%rsp)
	movb	191(%rdx), %cl
	movb	%cl, 223(%rsp)
	movb	192(%rdx), %cl
	movb	%cl, 224(%rsp)
	movb	193(%rdx), %cl
	movb	%cl, 225(%rsp)
	movb	194(%rdx), %cl
	movb	%cl, 226(%rsp)
	movb	195(%rdx), %cl
	movb	%cl, 227(%rsp)
	movb	196(%rdx), %cl
	movb	%cl, 228(%rsp)
	movb	197(%rdx), %cl
	movb	%cl, 229(%rsp)
	movb	198(%rdx), %cl
	movb	%cl, 230(%rsp)
	movb	199(%rdx), %cl
	movb	%cl, 231(%rsp)
	movb	200(%rdx), %cl
	movb	%cl, 232(%rsp)
	movb	201(%rdx), %cl
	movb	%cl, 233(%rsp)
	movb	202(%rdx), %cl
	movb	%cl, 234(%rsp)
	movb	203(%rdx), %cl
	movb	%cl, 235(%rsp)
	movb	204(%rdx), %cl
	movb	%cl, 236(%rsp)
	movb	205(%rdx), %cl
	movb	%cl, 237(%rsp)
	movb	206(%rdx), %cl
	movb	%cl, 238(%rsp)
	movb	207(%rdx), %cl
	movb	%cl, 239(%rsp)
	movb	208(%rdx), %cl
	movb	%cl, 240(%rsp)
	movb	209(%rdx), %cl
	movb	%cl, 241(%rsp)
	movb	210(%rdx), %cl
	movb	%cl, 242(%rsp)
	movb	211(%rdx), %cl
	movb	%cl, 243(%rsp)
	movb	212(%rdx), %cl
	movb	%cl, 244(%rsp)
	movb	213(%rdx), %cl
	movb	%cl, 245(%rsp)
	movb	214(%rdx), %cl
	movb	%cl, 246(%rsp)
	movb	215(%rdx), %cl
	movb	%cl, 247(%rsp)
	movb	216(%rdx), %cl
	movb	%cl, 248(%rsp)
	movb	217(%rdx), %cl
	movb	%cl, 249(%rsp)
	movb	218(%rdx), %cl
	movb	%cl, 250(%rsp)
	movb	219(%rdx), %cl
	movb	%cl, 251(%rsp)
	movb	220(%rdx), %cl
	movb	%cl, 252(%rsp)
	movb	221(%rdx), %cl
	movb	%cl, 253(%rsp)
	movb	222(%rdx), %cl
	movb	%cl, 254(%rsp)
	movb	223(%rdx), %cl
	movb	%cl, 255(%rsp)
	movb	224(%rdx), %cl
	movb	%cl, 256(%rsp)
	movb	225(%rdx), %cl
	movb	%cl, 257(%rsp)
	movb	226(%rdx), %cl
	movb	%cl, 258(%rsp)
	movb	227(%rdx), %cl
	movb	%cl, 259(%rsp)
	movb	228(%rdx), %cl
	movb	%cl, 260(%rsp)
	movb	229(%rdx), %cl
	movb	%cl, 261(%rsp)
	movb	230(%rdx), %cl
	movb	%cl, 262(%rsp)
	movb	231(%rdx), %cl
	movb	%cl, 263(%rsp)
	movb	232(%rdx), %cl
	movb	%cl, 264(%rsp)
	movb	233(%rdx), %cl
	movb	%cl, 265(%rsp)
	movb	234(%rdx), %cl
	movb	%cl, 266(%rsp)
	movb	235(%rdx), %cl
	movb	%cl, 267(%rsp)
	movb	236(%rdx), %cl
	movb	%cl, 268(%rsp)
	movb	237(%rdx), %cl
	movb	%cl, 269(%rsp)
	movb	238(%rdx), %cl
	movb	%cl, 270(%rsp)
	movb	239(%rdx), %cl
	movb	%cl, 271(%rsp)
	movb	240(%rdx), %cl
	movb	%cl, 272(%rsp)
	movb	241(%rdx), %cl
	movb	%cl, 273(%rsp)
	movb	242(%rdx), %cl
	movb	%cl, 274(%rsp)
	movb	243(%rdx), %cl
	movb	%cl, 275(%rsp)
	movb	244(%rdx), %cl
	movb	%cl, 276(%rsp)
	movb	245(%rdx), %cl
	movb	%cl, 277(%rsp)
	movb	246(%rdx), %cl
	movb	%cl, 278(%rsp)
	movb	247(%rdx), %cl
	movb	%cl, 279(%rsp)
	movb	248(%rdx), %cl
	movb	%cl, 280(%rsp)
	movb	249(%rdx), %cl
	movb	%cl, 281(%rsp)
	movb	250(%rdx), %cl
	movb	%cl, 282(%rsp)
	movb	251(%rdx), %cl
	movb	%cl, 283(%rsp)
	movb	252(%rdx), %cl
	movb	%cl, 284(%rsp)
	movb	253(%rdx), %cl
	movb	%cl, 285(%rsp)
	movb	254(%rdx), %cl
	movb	%cl, 286(%rsp)
	movb	255(%rdx), %cl
	movb	%cl, 287(%rsp)
	movb	256(%rdx), %cl
	movb	%cl, 288(%rsp)
	movb	257(%rdx), %cl
	movb	%cl, 289(%rsp)
	movb	258(%rdx), %cl
	movb	%cl, 290(%rsp)
	movb	259(%rdx), %cl
	movb	%cl, 291(%rsp)
	movb	260(%rdx), %cl
	movb	%cl, 292(%rsp)
	movb	261(%rdx), %cl
	movb	%cl, 293(%rsp)
	movb	262(%rdx), %cl
	movb	%cl, 294(%rsp)
	movb	263(%rdx), %cl
	movb	%cl, 295(%rsp)
	movb	264(%rdx), %cl
	movb	%cl, 296(%rsp)
	movb	265(%rdx), %cl
	movb	%cl, 297(%rsp)
	movb	266(%rdx), %cl
	movb	%cl, 298(%rsp)
	movb	267(%rdx), %cl
	movb	%cl, 299(%rsp)
	movb	268(%rdx), %cl
	movb	%cl, 300(%rsp)
	movb	269(%rdx), %cl
	movb	%cl, 301(%rsp)
	movb	270(%rdx), %cl
	movb	%cl, 302(%rsp)
	movb	271(%rdx), %cl
	movb	%cl, 303(%rsp)
	movb	272(%rdx), %cl
	movb	%cl, 304(%rsp)
	movb	273(%rdx), %cl
	movb	%cl, 305(%rsp)
	movb	274(%rdx), %cl
	movb	%cl, 306(%rsp)
	movb	275(%rdx), %cl
	movb	%cl, 307(%rsp)
	movb	276(%rdx), %cl
	movb	%cl, 308(%rsp)
	movb	277(%rdx), %cl
	movb	%cl, 309(%rsp)
	movb	278(%rdx), %cl
	movb	%cl, 310(%rsp)
	movb	279(%rdx), %cl
	movb	%cl, 311(%rsp)
	movb	280(%rdx), %cl
	movb	%cl, 312(%rsp)
	movb	281(%rdx), %cl
	movb	%cl, 313(%rsp)
	movb	282(%rdx), %cl
	movb	%cl, 314(%rsp)
	movb	283(%rdx), %cl
	movb	%cl, 315(%rsp)
	movb	284(%rdx), %cl
	movb	%cl, 316(%rsp)
	movb	285(%rdx), %cl
	movb	%cl, 317(%rsp)
	movb	286(%rdx), %cl
	movb	%cl, 318(%rsp)
	movb	287(%rdx), %cl
	movb	%cl, 319(%rsp)
	movb	288(%rdx), %cl
	movb	%cl, 320(%rsp)
	movb	289(%rdx), %cl
	movb	%cl, 321(%rsp)
	movb	290(%rdx), %cl
	movb	%cl, 322(%rsp)
	movb	291(%rdx), %cl
	movb	%cl, 323(%rsp)
	movb	292(%rdx), %cl
	movb	%cl, 324(%rsp)
	movb	293(%rdx), %cl
	movb	%cl, 325(%rsp)
	movb	294(%rdx), %cl
	movb	%cl, 326(%rsp)
	movb	295(%rdx), %cl
	movb	%cl, 327(%rsp)
	movb	296(%rdx), %cl
	movb	%cl, 328(%rsp)
	movb	297(%rdx), %cl
	movb	%cl, 329(%rsp)
	movb	298(%rdx), %cl
	movb	%cl, 330(%rsp)
	movb	299(%rdx), %cl
	movb	%cl, 331(%rsp)
	movb	300(%rdx), %cl
	movb	%cl, 332(%rsp)
	movb	301(%rdx), %cl
	movb	%cl, 333(%rsp)
	movb	302(%rdx), %cl
	movb	%cl, 334(%rsp)
	movb	303(%rdx), %cl
	movb	%cl, 335(%rsp)
	movb	304(%rdx), %cl
	movb	%cl, 336(%rsp)
	movb	305(%rdx), %cl
	movb	%cl, 337(%rsp)
	movb	306(%rdx), %cl
	movb	%cl, 338(%rsp)
	movb	307(%rdx), %cl
	movb	%cl, 339(%rsp)
	movb	308(%rdx), %cl
	movb	%cl, 340(%rsp)
	movb	309(%rdx), %cl
	movb	%cl, 341(%rsp)
	movb	310(%rdx), %cl
	movb	%cl, 342(%rsp)
	movb	311(%rdx), %cl
	movb	%cl, 343(%rsp)
	movb	312(%rdx), %cl
	movb	%cl, 344(%rsp)
	movb	313(%rdx), %cl
	movb	%cl, 345(%rsp)
	movb	314(%rdx), %cl
	movb	%cl, 346(%rsp)
	movb	315(%rdx), %cl
	movb	%cl, 347(%rsp)
	movb	316(%rdx), %cl
	movb	%cl, 348(%rsp)
	movb	317(%rdx), %cl
	movb	%cl, 349(%rsp)
	movb	318(%rdx), %cl
	movb	%cl, 350(%rsp)
	movb	319(%rdx), %cl
	movb	%cl, 351(%rsp)
	movb	320(%rdx), %cl
	movb	%cl, 352(%rsp)
	movb	321(%rdx), %cl
	movb	%cl, 353(%rsp)
	movb	322(%rdx), %cl
	movb	%cl, 354(%rsp)
	movb	323(%rdx), %cl
	movb	%cl, 355(%rsp)
	movb	324(%rdx), %cl
	movb	%cl, 356(%rsp)
	movb	325(%rdx), %cl
	movb	%cl, 357(%rsp)
	movb	326(%rdx), %cl
	movb	%cl, 358(%rsp)
	movb	327(%rdx), %cl
	movb	%cl, 359(%rsp)
	movb	328(%rdx), %cl
	movb	%cl, 360(%rsp)
	movb	329(%rdx), %cl
	movb	%cl, 361(%rsp)
	movb	330(%rdx), %cl
	movb	%cl, 362(%rsp)
	movb	331(%rdx), %cl
	movb	%cl, 363(%rsp)
	movb	332(%rdx), %cl
	movb	%cl, 364(%rsp)
	movb	333(%rdx), %cl
	movb	%cl, 365(%rsp)
	movb	334(%rdx), %cl
	movb	%cl, 366(%rsp)
	movb	335(%rdx), %cl
	movb	%cl, 367(%rsp)
	movb	336(%rdx), %cl
	movb	%cl, 368(%rsp)
	movb	337(%rdx), %cl
	movb	%cl, 369(%rsp)
	movb	338(%rdx), %cl
	movb	%cl, 370(%rsp)
	movb	339(%rdx), %cl
	movb	%cl, 371(%rsp)
	movb	340(%rdx), %cl
	movb	%cl, 372(%rsp)
	movb	341(%rdx), %cl
	movb	%cl, 373(%rsp)
	movb	342(%rdx), %cl
	movb	%cl, 374(%rsp)
	movb	343(%rdx), %cl
	movb	%cl, 375(%rsp)
	movb	344(%rdx), %cl
	movb	%cl, 376(%rsp)
	movb	345(%rdx), %cl
	movb	%cl, 377(%rsp)
	movb	346(%rdx), %cl
	movb	%cl, 378(%rsp)
	movb	347(%rdx), %cl
	movb	%cl, 379(%rsp)
	movb	348(%rdx), %cl
	movb	%cl, 380(%rsp)
	movb	349(%rdx), %cl
	movb	%cl, 381(%rsp)
	movb	350(%rdx), %cl
	movb	%cl, 382(%rsp)
	movb	351(%rdx), %cl
	movb	%cl, 383(%rsp)
	movb	352(%rdx), %cl
	movb	%cl, 384(%rsp)
	movb	353(%rdx), %cl
	movb	%cl, 385(%rsp)
	movb	354(%rdx), %cl
	movb	%cl, 386(%rsp)
	movb	355(%rdx), %cl
	movb	%cl, 387(%rsp)
	movb	356(%rdx), %cl
	movb	%cl, 388(%rsp)
	movb	357(%rdx), %cl
	movb	%cl, 389(%rsp)
	movb	358(%rdx), %cl
	movb	%cl, 390(%rsp)
	movb	359(%rdx), %cl
	movb	%cl, 391(%rsp)
	movb	360(%rdx), %cl
	movb	%cl, 392(%rsp)
	movb	361(%rdx), %cl
	movb	%cl, 393(%rsp)
	movb	362(%rdx), %cl
	movb	%cl, 394(%rsp)
	movb	363(%rdx), %cl
	movb	%cl, 395(%rsp)
	movb	364(%rdx), %cl
	movb	%cl, 396(%rsp)
	movb	365(%rdx), %cl
	movb	%cl, 397(%rsp)
	movb	366(%rdx), %cl
	movb	%cl, 398(%rsp)
	movb	367(%rdx), %cl
	movb	%cl, 399(%rsp)
	movb	368(%rdx), %cl
	movb	%cl, 400(%rsp)
	movb	369(%rdx), %cl
	movb	%cl, 401(%rsp)
	movb	370(%rdx), %cl
	movb	%cl, 402(%rsp)
	movb	371(%rdx), %cl
	movb	%cl, 403(%rsp)
	movb	372(%rdx), %cl
	movb	%cl, 404(%rsp)
	movb	373(%rdx), %cl
	movb	%cl, 405(%rsp)
	movb	374(%rdx), %cl
	movb	%cl, 406(%rsp)
	movb	375(%rdx), %cl
	movb	%cl, 407(%rsp)
	movb	376(%rdx), %cl
	movb	%cl, 408(%rsp)
	movb	377(%rdx), %cl
	movb	%cl, 409(%rsp)
	movb	378(%rdx), %cl
	movb	%cl, 410(%rsp)
	movb	379(%rdx), %cl
	movb	%cl, 411(%rsp)
	movb	380(%rdx), %cl
	movb	%cl, 412(%rsp)
	movb	381(%rdx), %cl
	movb	%cl, 413(%rsp)
	movb	382(%rdx), %cl
	movb	%cl, 414(%rsp)
	movb	383(%rdx), %cl
	movb	%cl, 415(%rsp)
	movb	384(%rdx), %cl
	movb	%cl, 416(%rsp)
	movb	385(%rdx), %cl
	movb	%cl, 417(%rsp)
	movb	386(%rdx), %cl
	movb	%cl, 418(%rsp)
	movb	387(%rdx), %cl
	movb	%cl, 419(%rsp)
	movb	388(%rdx), %cl
	movb	%cl, 420(%rsp)
	movb	389(%rdx), %cl
	movb	%cl, 421(%rsp)
	movb	390(%rdx), %cl
	movb	%cl, 422(%rsp)
	movb	391(%rdx), %cl
	movb	%cl, 423(%rsp)
	movb	392(%rdx), %cl
	movb	%cl, 424(%rsp)
	movb	393(%rdx), %cl
	movb	%cl, 425(%rsp)
	movb	394(%rdx), %cl
	movb	%cl, 426(%rsp)
	movb	395(%rdx), %cl
	movb	%cl, 427(%rsp)
	movb	396(%rdx), %cl
	movb	%cl, 428(%rsp)
	movb	397(%rdx), %cl
	movb	%cl, 429(%rsp)
	movb	398(%rdx), %cl
	movb	%cl, 430(%rsp)
	movb	399(%rdx), %cl
	movb	%cl, 431(%rsp)
	movb	400(%rdx), %cl
	movb	%cl, 432(%rsp)
	movb	401(%rdx), %cl
	movb	%cl, 433(%rsp)
	movb	402(%rdx), %cl
	movb	%cl, 434(%rsp)
	movb	403(%rdx), %cl
	movb	%cl, 435(%rsp)
	movb	404(%rdx), %cl
	movb	%cl, 436(%rsp)
	movb	405(%rdx), %cl
	movb	%cl, 437(%rsp)
	movb	406(%rdx), %cl
	movb	%cl, 438(%rsp)
	movb	407(%rdx), %cl
	movb	%cl, 439(%rsp)
	movb	408(%rdx), %cl
	movb	%cl, 440(%rsp)
	movb	409(%rdx), %cl
	movb	%cl, 441(%rsp)
	movb	410(%rdx), %cl
	movb	%cl, 442(%rsp)
	movb	411(%rdx), %cl
	movb	%cl, 443(%rsp)
	movb	412(%rdx), %cl
	movb	%cl, 444(%rsp)
	movb	413(%rdx), %cl
	movb	%cl, 445(%rsp)
	movb	414(%rdx), %cl
	movb	%cl, 446(%rsp)
	movb	415(%rdx), %cl
	movb	%cl, 447(%rsp)
	movb	416(%rdx), %cl
	movb	%cl, 448(%rsp)
	movb	417(%rdx), %cl
	movb	%cl, 449(%rsp)
	movb	418(%rdx), %cl
	movb	%cl, 450(%rsp)
	movb	419(%rdx), %cl
	movb	%cl, 451(%rsp)
	movb	420(%rdx), %cl
	movb	%cl, 452(%rsp)
	movb	421(%rdx), %cl
	movb	%cl, 453(%rsp)
	movb	422(%rdx), %cl
	movb	%cl, 454(%rsp)
	movb	423(%rdx), %cl
	movb	%cl, 455(%rsp)
	movb	424(%rdx), %cl
	movb	%cl, 456(%rsp)
	movb	425(%rdx), %cl
	movb	%cl, 457(%rsp)
	movb	426(%rdx), %cl
	movb	%cl, 458(%rsp)
	movb	427(%rdx), %cl
	movb	%cl, 459(%rsp)
	movb	428(%rdx), %cl
	movb	%cl, 460(%rsp)
	movb	429(%rdx), %cl
	movb	%cl, 461(%rsp)
	movb	430(%rdx), %cl
	movb	%cl, 462(%rsp)
	movb	431(%rdx), %cl
	movb	%cl, 463(%rsp)
	movb	432(%rdx), %cl
	movb	%cl, 464(%rsp)
	movb	433(%rdx), %cl
	movb	%cl, 465(%rsp)
	movb	434(%rdx), %cl
	movb	%cl, 466(%rsp)
	movb	435(%rdx), %cl
	movb	%cl, 467(%rsp)
	movb	436(%rdx), %cl
	movb	%cl, 468(%rsp)
	movb	437(%rdx), %cl
	movb	%cl, 469(%rsp)
	movb	438(%rdx), %cl
	movb	%cl, 470(%rsp)
	movb	439(%rdx), %cl
	movb	%cl, 471(%rsp)
	movb	440(%rdx), %cl
	movb	%cl, 472(%rsp)
	movb	441(%rdx), %cl
	movb	%cl, 473(%rsp)
	movb	442(%rdx), %cl
	movb	%cl, 474(%rsp)
	movb	443(%rdx), %cl
	movb	%cl, 475(%rsp)
	movb	444(%rdx), %cl
	movb	%cl, 476(%rsp)
	movb	445(%rdx), %cl
	movb	%cl, 477(%rsp)
	movb	446(%rdx), %cl
	movb	%cl, 478(%rsp)
	movb	447(%rdx), %cl
	movb	%cl, 479(%rsp)
	movb	448(%rdx), %cl
	movb	%cl, 480(%rsp)
	movb	449(%rdx), %cl
	movb	%cl, 481(%rsp)
	movb	450(%rdx), %cl
	movb	%cl, 482(%rsp)
	movb	451(%rdx), %cl
	movb	%cl, 483(%rsp)
	movb	452(%rdx), %cl
	movb	%cl, 484(%rsp)
	movb	453(%rdx), %cl
	movb	%cl, 485(%rsp)
	movb	454(%rdx), %cl
	movb	%cl, 486(%rsp)
	movb	455(%rdx), %cl
	movb	%cl, 487(%rsp)
	movb	456(%rdx), %cl
	movb	%cl, 488(%rsp)
	movb	457(%rdx), %cl
	movb	%cl, 489(%rsp)
	movb	458(%rdx), %cl
	movb	%cl, 490(%rsp)
	movb	459(%rdx), %cl
	movb	%cl, 491(%rsp)
	movb	460(%rdx), %cl
	movb	%cl, 492(%rsp)
	movb	461(%rdx), %cl
	movb	%cl, 493(%rsp)
	movb	462(%rdx), %cl
	movb	%cl, 494(%rsp)
	movb	463(%rdx), %cl
	movb	%cl, 495(%rsp)
	movb	464(%rdx), %cl
	movb	%cl, 496(%rsp)
	movb	465(%rdx), %cl
	movb	%cl, 497(%rsp)
	movb	466(%rdx), %cl
	movb	%cl, 498(%rsp)
	movb	467(%rdx), %cl
	movb	%cl, 499(%rsp)
	movb	468(%rdx), %cl
	movb	%cl, 500(%rsp)
	movb	469(%rdx), %cl
	movb	%cl, 501(%rsp)
	movb	470(%rdx), %cl
	movb	%cl, 502(%rsp)
	movb	471(%rdx), %cl
	movb	%cl, 503(%rsp)
	movb	472(%rdx), %cl
	movb	%cl, 504(%rsp)
	movb	473(%rdx), %cl
	movb	%cl, 505(%rsp)
	movb	474(%rdx), %cl
	movb	%cl, 506(%rsp)
	movb	475(%rdx), %cl
	movb	%cl, 507(%rsp)
	movb	476(%rdx), %cl
	movb	%cl, 508(%rsp)
	movb	477(%rdx), %cl
	movb	%cl, 509(%rsp)
	movb	478(%rdx), %cl
	movb	%cl, 510(%rsp)
	movb	479(%rdx), %cl
	movb	%cl, 511(%rsp)
	movb	480(%rdx), %cl
	movb	%cl, 512(%rsp)
	movb	481(%rdx), %cl
	movb	%cl, 513(%rsp)
	movb	482(%rdx), %cl
	movb	%cl, 514(%rsp)
	movb	483(%rdx), %cl
	movb	%cl, 515(%rsp)
	movb	484(%rdx), %cl
	movb	%cl, 516(%rsp)
	movb	485(%rdx), %cl
	movb	%cl, 517(%rsp)
	movb	486(%rdx), %cl
	movb	%cl, 518(%rsp)
	movb	487(%rdx), %cl
	movb	%cl, 519(%rsp)
	movb	488(%rdx), %cl
	movb	%cl, 520(%rsp)
	movb	489(%rdx), %cl
	movb	%cl, 521(%rsp)
	movb	490(%rdx), %cl
	movb	%cl, 522(%rsp)
	movb	491(%rdx), %cl
	movb	%cl, 523(%rsp)
	movb	492(%rdx), %cl
	movb	%cl, 524(%rsp)
	movb	493(%rdx), %cl
	movb	%cl, 525(%rsp)
	movb	494(%rdx), %cl
	movb	%cl, 526(%rsp)
	movb	495(%rdx), %cl
	movb	%cl, 527(%rsp)
	movb	496(%rdx), %cl
	movb	%cl, 528(%rsp)
	movb	497(%rdx), %cl
	movb	%cl, 529(%rsp)
	movb	498(%rdx), %cl
	movb	%cl, 530(%rsp)
	movb	499(%rdx), %cl
	movb	%cl, 531(%rsp)
	movb	500(%rdx), %cl
	movb	%cl, 532(%rsp)
	movb	501(%rdx), %cl
	movb	%cl, 533(%rsp)
	movb	502(%rdx), %cl
	movb	%cl, 534(%rsp)
	movb	503(%rdx), %cl
	movb	%cl, 535(%rsp)
	movb	504(%rdx), %cl
	movb	%cl, 536(%rsp)
	movb	505(%rdx), %cl
	movb	%cl, 537(%rsp)
	movb	506(%rdx), %cl
	movb	%cl, 538(%rsp)
	movb	507(%rdx), %cl
	movb	%cl, 539(%rsp)
	movb	508(%rdx), %cl
	movb	%cl, 540(%rsp)
	movb	509(%rdx), %cl
	movb	%cl, 541(%rsp)
	movb	510(%rdx), %cl
	movb	%cl, 542(%rsp)
	movb	511(%rdx), %cl
	movb	%cl, 543(%rsp)
	movb	512(%rdx), %cl
	movb	%cl, 544(%rsp)
	movb	513(%rdx), %cl
	movb	%cl, 545(%rsp)
	movb	514(%rdx), %cl
	movb	%cl, 546(%rsp)
	movb	515(%rdx), %cl
	movb	%cl, 547(%rsp)
	movb	516(%rdx), %cl
	movb	%cl, 548(%rsp)
	movb	517(%rdx), %cl
	movb	%cl, 549(%rsp)
	movb	518(%rdx), %cl
	movb	%cl, 550(%rsp)
	movb	519(%rdx), %cl
	movb	%cl, 551(%rsp)
	movb	520(%rdx), %cl
	movb	%cl, 552(%rsp)
	movb	521(%rdx), %cl
	movb	%cl, 553(%rsp)
	movb	522(%rdx), %cl
	movb	%cl, 554(%rsp)
	movb	523(%rdx), %cl
	movb	%cl, 555(%rsp)
	movb	524(%rdx), %cl
	movb	%cl, 556(%rsp)
	movb	525(%rdx), %cl
	movb	%cl, 557(%rsp)
	movb	526(%rdx), %cl
	movb	%cl, 558(%rsp)
	movb	527(%rdx), %cl
	movb	%cl, 559(%rsp)
	movb	528(%rdx), %cl
	movb	%cl, 560(%rsp)
	movb	529(%rdx), %cl
	movb	%cl, 561(%rsp)
	movb	530(%rdx), %cl
	movb	%cl, 562(%rsp)
	movb	531(%rdx), %cl
	movb	%cl, 563(%rsp)
	movb	532(%rdx), %cl
	movb	%cl, 564(%rsp)
	movb	533(%rdx), %cl
	movb	%cl, 565(%rsp)
	movb	534(%rdx), %cl
	movb	%cl, 566(%rsp)
	movb	535(%rdx), %cl
	movb	%cl, 567(%rsp)
	movb	536(%rdx), %cl
	movb	%cl, 568(%rsp)
	movb	537(%rdx), %cl
	movb	%cl, 569(%rsp)
	movb	538(%rdx), %cl
	movb	%cl, 570(%rsp)
	movb	539(%rdx), %cl
	movb	%cl, 571(%rsp)
	movb	540(%rdx), %cl
	movb	%cl, 572(%rsp)
	movb	541(%rdx), %cl
	movb	%cl, 573(%rsp)
	movb	542(%rdx), %cl
	movb	%cl, 574(%rsp)
	movb	543(%rdx), %cl
	movb	%cl, 575(%rsp)
	movb	544(%rdx), %cl
	movb	%cl, 576(%rsp)
	movb	545(%rdx), %cl
	movb	%cl, 577(%rsp)
	movb	546(%rdx), %cl
	movb	%cl, 578(%rsp)
	movb	547(%rdx), %cl
	movb	%cl, 579(%rsp)
	movb	548(%rdx), %cl
	movb	%cl, 580(%rsp)
	movb	549(%rdx), %cl
	movb	%cl, 581(%rsp)
	movb	550(%rdx), %cl
	movb	%cl, 582(%rsp)
	movb	551(%rdx), %cl
	movb	%cl, 583(%rsp)
	movb	552(%rdx), %cl
	movb	%cl, 584(%rsp)
	movb	553(%rdx), %cl
	movb	%cl, 585(%rsp)
	movb	554(%rdx), %cl
	movb	%cl, 586(%rsp)
	movb	555(%rdx), %cl
	movb	%cl, 587(%rsp)
	movb	556(%rdx), %cl
	movb	%cl, 588(%rsp)
	movb	557(%rdx), %cl
	movb	%cl, 589(%rsp)
	movb	558(%rdx), %cl
	movb	%cl, 590(%rsp)
	movb	559(%rdx), %cl
	movb	%cl, 591(%rsp)
	movb	560(%rdx), %cl
	movb	%cl, 592(%rsp)
	movb	561(%rdx), %cl
	movb	%cl, 593(%rsp)
	movb	562(%rdx), %cl
	movb	%cl, 594(%rsp)
	movb	563(%rdx), %cl
	movb	%cl, 595(%rsp)
	movb	564(%rdx), %cl
	movb	%cl, 596(%rsp)
	movb	565(%rdx), %cl
	movb	%cl, 597(%rsp)
	movb	566(%rdx), %cl
	movb	%cl, 598(%rsp)
	movb	567(%rdx), %cl
	movb	%cl, 599(%rsp)
	movb	568(%rdx), %cl
	movb	%cl, 600(%rsp)
	movb	569(%rdx), %cl
	movb	%cl, 601(%rsp)
	movb	570(%rdx), %cl
	movb	%cl, 602(%rsp)
	movb	571(%rdx), %cl
	movb	%cl, 603(%rsp)
	movb	572(%rdx), %cl
	movb	%cl, 604(%rsp)
	movb	573(%rdx), %cl
	movb	%cl, 605(%rsp)
	movb	574(%rdx), %cl
	movb	%cl, 606(%rsp)
	movb	575(%rdx), %cl
	movb	%cl, 607(%rsp)
	movb	576(%rdx), %cl
	movb	%cl, 608(%rsp)
	movb	577(%rdx), %cl
	movb	%cl, 609(%rsp)
	movb	578(%rdx), %cl
	movb	%cl, 610(%rsp)
	movb	579(%rdx), %cl
	movb	%cl, 611(%rsp)
	movb	580(%rdx), %cl
	movb	%cl, 612(%rsp)
	movb	581(%rdx), %cl
	movb	%cl, 613(%rsp)
	movb	582(%rdx), %cl
	movb	%cl, 614(%rsp)
	movb	583(%rdx), %cl
	movb	%cl, 615(%rsp)
	movb	584(%rdx), %cl
	movb	%cl, 616(%rsp)
	movb	585(%rdx), %cl
	movb	%cl, 617(%rsp)
	movb	586(%rdx), %cl
	movb	%cl, 618(%rsp)
	movb	587(%rdx), %cl
	movb	%cl, 619(%rsp)
	movb	588(%rdx), %cl
	movb	%cl, 620(%rsp)
	movb	589(%rdx), %cl
	movb	%cl, 621(%rsp)
	movb	590(%rdx), %cl
	movb	%cl, 622(%rsp)
	movb	591(%rdx), %cl
	movb	%cl, 623(%rsp)
	movb	592(%rdx), %cl
	movb	%cl, 624(%rsp)
	movb	593(%rdx), %cl
	movb	%cl, 625(%rsp)
	movb	594(%rdx), %cl
	movb	%cl, 626(%rsp)
	movb	595(%rdx), %cl
	movb	%cl, 627(%rsp)
	movb	596(%rdx), %cl
	movb	%cl, 628(%rsp)
	movb	597(%rdx), %cl
	movb	%cl, 629(%rsp)
	movb	598(%rdx), %cl
	movb	%cl, 630(%rsp)
	movb	599(%rdx), %cl
	movb	%cl, 631(%rsp)
	movb	600(%rdx), %cl
	movb	%cl, 632(%rsp)
	movb	601(%rdx), %cl
	movb	%cl, 633(%rsp)
	movb	602(%rdx), %cl
	movb	%cl, 634(%rsp)
	movb	603(%rdx), %cl
	movb	%cl, 635(%rsp)
	movb	604(%rdx), %cl
	movb	%cl, 636(%rsp)
	movb	605(%rdx), %cl
	movb	%cl, 637(%rsp)
	movb	606(%rdx), %cl
	movb	%cl, 638(%rsp)
	movb	607(%rdx), %cl
	movb	%cl, 639(%rsp)
	movb	608(%rdx), %cl
	movb	%cl, 640(%rsp)
	movb	609(%rdx), %cl
	movb	%cl, 641(%rsp)
	movb	610(%rdx), %cl
	movb	%cl, 642(%rsp)
	movb	611(%rdx), %cl
	movb	%cl, 643(%rsp)
	movb	612(%rdx), %cl
	movb	%cl, 644(%rsp)
	movb	613(%rdx), %cl
	movb	%cl, 645(%rsp)
	movb	614(%rdx), %cl
	movb	%cl, 646(%rsp)
	movb	615(%rdx), %cl
	movb	%cl, 647(%rsp)
	movb	616(%rdx), %cl
	movb	%cl, 648(%rsp)
	movb	617(%rdx), %cl
	movb	%cl, 649(%rsp)
	movb	618(%rdx), %cl
	movb	%cl, 650(%rsp)
	movb	619(%rdx), %cl
	movb	%cl, 651(%rsp)
	movb	620(%rdx), %cl
	movb	%cl, 652(%rsp)
	movb	621(%rdx), %cl
	movb	%cl, 653(%rsp)
	movb	622(%rdx), %cl
	movb	%cl, 654(%rsp)
	movb	623(%rdx), %cl
	movb	%cl, 655(%rsp)
	movb	624(%rdx), %cl
	movb	%cl, 656(%rsp)
	movb	625(%rdx), %cl
	movb	%cl, 657(%rsp)
	movb	626(%rdx), %cl
	movb	%cl, 658(%rsp)
	movb	627(%rdx), %cl
	movb	%cl, 659(%rsp)
	movb	628(%rdx), %cl
	movb	%cl, 660(%rsp)
	movb	629(%rdx), %cl
	movb	%cl, 661(%rsp)
	movb	630(%rdx), %cl
	movb	%cl, 662(%rsp)
	movb	631(%rdx), %cl
	movb	%cl, 663(%rsp)
	movb	632(%rdx), %cl
	movb	%cl, 664(%rsp)
	movb	633(%rdx), %cl
	movb	%cl, 665(%rsp)
	movb	634(%rdx), %cl
	movb	%cl, 666(%rsp)
	movb	635(%rdx), %cl
	movb	%cl, 667(%rsp)
	movb	636(%rdx), %cl
	movb	%cl, 668(%rsp)
	movb	637(%rdx), %cl
	movb	%cl, 669(%rsp)
	movb	638(%rdx), %cl
	movb	%cl, 670(%rsp)
	movb	639(%rdx), %cl
	movb	%cl, 671(%rsp)
	movb	640(%rdx), %cl
	movb	%cl, 672(%rsp)
	movb	641(%rdx), %cl
	movb	%cl, 673(%rsp)
	movb	642(%rdx), %cl
	movb	%cl, 674(%rsp)
	movb	643(%rdx), %cl
	movb	%cl, 675(%rsp)
	movb	644(%rdx), %cl
	movb	%cl, 676(%rsp)
	movb	645(%rdx), %cl
	movb	%cl, 677(%rsp)
	movb	646(%rdx), %cl
	movb	%cl, 678(%rsp)
	movb	647(%rdx), %cl
	movb	%cl, 679(%rsp)
	movb	648(%rdx), %cl
	movb	%cl, 680(%rsp)
	movb	649(%rdx), %cl
	movb	%cl, 681(%rsp)
	movb	650(%rdx), %cl
	movb	%cl, 682(%rsp)
	movb	651(%rdx), %cl
	movb	%cl, 683(%rsp)
	movb	652(%rdx), %cl
	movb	%cl, 684(%rsp)
	movb	653(%rdx), %cl
	movb	%cl, 685(%rsp)
	movb	654(%rdx), %cl
	movb	%cl, 686(%rsp)
	movb	655(%rdx), %cl
	movb	%cl, 687(%rsp)
	movb	656(%rdx), %cl
	movb	%cl, 688(%rsp)
	movb	657(%rdx), %cl
	movb	%cl, 689(%rsp)
	movb	658(%rdx), %cl
	movb	%cl, 690(%rsp)
	movb	659(%rdx), %cl
	movb	%cl, 691(%rsp)
	movb	660(%rdx), %cl
	movb	%cl, 692(%rsp)
	movb	661(%rdx), %cl
	movb	%cl, 693(%rsp)
	movb	662(%rdx), %cl
	movb	%cl, 694(%rsp)
	movb	663(%rdx), %cl
	movb	%cl, 695(%rsp)
	movb	664(%rdx), %cl
	movb	%cl, 696(%rsp)
	movb	665(%rdx), %cl
	movb	%cl, 697(%rsp)
	movb	666(%rdx), %cl
	movb	%cl, 698(%rsp)
	movb	667(%rdx), %cl
	movb	%cl, 699(%rsp)
	movb	668(%rdx), %cl
	movb	%cl, 700(%rsp)
	movb	669(%rdx), %cl
	movb	%cl, 701(%rsp)
	movb	670(%rdx), %cl
	movb	%cl, 702(%rsp)
	movb	671(%rdx), %cl
	movb	%cl, 703(%rsp)
	movb	672(%rdx), %cl
	movb	%cl, 704(%rsp)
	movb	673(%rdx), %cl
	movb	%cl, 705(%rsp)
	movb	674(%rdx), %cl
	movb	%cl, 706(%rsp)
	movb	675(%rdx), %cl
	movb	%cl, 707(%rsp)
	movb	676(%rdx), %cl
	movb	%cl, 708(%rsp)
	movb	677(%rdx), %cl
	movb	%cl, 709(%rsp)
	movb	678(%rdx), %cl
	movb	%cl, 710(%rsp)
	movb	679(%rdx), %cl
	movb	%cl, 711(%rsp)
	movb	680(%rdx), %cl
	movb	%cl, 712(%rsp)
	movb	681(%rdx), %cl
	movb	%cl, 713(%rsp)
	movb	682(%rdx), %cl
	movb	%cl, 714(%rsp)
	movb	683(%rdx), %cl
	movb	%cl, 715(%rsp)
	movb	684(%rdx), %cl
	movb	%cl, 716(%rsp)
	movb	685(%rdx), %cl
	movb	%cl, 717(%rsp)
	movb	686(%rdx), %cl
	movb	%cl, 718(%rsp)
	movb	687(%rdx), %cl
	movb	%cl, 719(%rsp)
	movb	688(%rdx), %cl
	movb	%cl, 720(%rsp)
	movb	689(%rdx), %cl
	movb	%cl, 721(%rsp)
	movb	690(%rdx), %cl
	movb	%cl, 722(%rsp)
	movb	691(%rdx), %cl
	movb	%cl, 723(%rsp)
	movb	692(%rdx), %cl
	movb	%cl, 724(%rsp)
	movb	693(%rdx), %cl
	movb	%cl, 725(%rsp)
	movb	694(%rdx), %cl
	movb	%cl, 726(%rsp)
	movb	695(%rdx), %cl
	movb	%cl, 727(%rsp)
	movb	696(%rdx), %cl
	movb	%cl, 728(%rsp)
	movb	697(%rdx), %cl
	movb	%cl, 729(%rsp)
	movb	698(%rdx), %cl
	movb	%cl, 730(%rsp)
	movb	699(%rdx), %cl
	movb	%cl, 731(%rsp)
	movb	700(%rdx), %cl
	movb	%cl, 732(%rsp)
	movb	701(%rdx), %cl
	movb	%cl, 733(%rsp)
	movb	702(%rdx), %cl
	movb	%cl, 734(%rsp)
	movb	703(%rdx), %cl
	movb	%cl, 735(%rsp)
	movb	704(%rdx), %cl
	movb	%cl, 736(%rsp)
	movb	705(%rdx), %cl
	movb	%cl, 737(%rsp)
	movb	706(%rdx), %cl
	movb	%cl, 738(%rsp)
	movb	707(%rdx), %cl
	movb	%cl, 739(%rsp)
	movb	708(%rdx), %cl
	movb	%cl, 740(%rsp)
	movb	709(%rdx), %cl
	movb	%cl, 741(%rsp)
	movb	710(%rdx), %cl
	movb	%cl, 742(%rsp)
	movb	711(%rdx), %cl
	movb	%cl, 743(%rsp)
	movb	712(%rdx), %cl
	movb	%cl, 744(%rsp)
	movb	713(%rdx), %cl
	movb	%cl, 745(%rsp)
	movb	714(%rdx), %cl
	movb	%cl, 746(%rsp)
	movb	715(%rdx), %cl
	movb	%cl, 747(%rsp)
	movb	716(%rdx), %cl
	movb	%cl, 748(%rsp)
	movb	717(%rdx), %cl
	movb	%cl, 749(%rsp)
	movb	718(%rdx), %cl
	movb	%cl, 750(%rsp)
	movb	719(%rdx), %cl
	movb	%cl, 751(%rsp)
	movb	720(%rdx), %cl
	movb	%cl, 752(%rsp)
	movb	721(%rdx), %cl
	movb	%cl, 753(%rsp)
	movb	722(%rdx), %cl
	movb	%cl, 754(%rsp)
	movb	723(%rdx), %cl
	movb	%cl, 755(%rsp)
	movb	724(%rdx), %cl
	movb	%cl, 756(%rsp)
	movb	725(%rdx), %cl
	movb	%cl, 757(%rsp)
	movb	726(%rdx), %cl
	movb	%cl, 758(%rsp)
	movb	727(%rdx), %cl
	movb	%cl, 759(%rsp)
	movb	728(%rdx), %cl
	movb	%cl, 760(%rsp)
	movb	729(%rdx), %cl
	movb	%cl, 761(%rsp)
	movb	730(%rdx), %cl
	movb	%cl, 762(%rsp)
	movb	731(%rdx), %cl
	movb	%cl, 763(%rsp)
	movb	732(%rdx), %cl
	movb	%cl, 764(%rsp)
	movb	733(%rdx), %cl
	movb	%cl, 765(%rsp)
	movb	734(%rdx), %cl
	movb	%cl, 766(%rsp)
	movb	735(%rdx), %cl
	movb	%cl, 767(%rsp)
	movb	736(%rdx), %cl
	movb	%cl, 768(%rsp)
	movb	737(%rdx), %cl
	movb	%cl, 769(%rsp)
	movb	738(%rdx), %cl
	movb	%cl, 770(%rsp)
	movb	739(%rdx), %cl
	movb	%cl, 771(%rsp)
	movb	740(%rdx), %cl
	movb	%cl, 772(%rsp)
	movb	741(%rdx), %cl
	movb	%cl, 773(%rsp)
	movb	742(%rdx), %cl
	movb	%cl, 774(%rsp)
	movb	743(%rdx), %cl
	movb	%cl, 775(%rsp)
	movb	744(%rdx), %cl
	movb	%cl, 776(%rsp)
	movb	745(%rdx), %cl
	movb	%cl, 777(%rsp)
	movb	746(%rdx), %cl
	movb	%cl, 778(%rsp)
	movb	747(%rdx), %cl
	movb	%cl, 779(%rsp)
	movb	748(%rdx), %cl
	movb	%cl, 780(%rsp)
	movb	749(%rdx), %cl
	movb	%cl, 781(%rsp)
	movb	750(%rdx), %cl
	movb	%cl, 782(%rsp)
	movb	751(%rdx), %cl
	movb	%cl, 783(%rsp)
	movb	752(%rdx), %cl
	movb	%cl, 784(%rsp)
	movb	753(%rdx), %cl
	movb	%cl, 785(%rsp)
	movb	754(%rdx), %cl
	movb	%cl, 786(%rsp)
	movb	755(%rdx), %cl
	movb	%cl, 787(%rsp)
	movb	756(%rdx), %cl
	movb	%cl, 788(%rsp)
	movb	757(%rdx), %cl
	movb	%cl, 789(%rsp)
	movb	758(%rdx), %cl
	movb	%cl, 790(%rsp)
	movb	759(%rdx), %cl
	movb	%cl, 791(%rsp)
	movb	760(%rdx), %cl
	movb	%cl, 792(%rsp)
	movb	761(%rdx), %cl
	movb	%cl, 793(%rsp)
	movb	762(%rdx), %cl
	movb	%cl, 794(%rsp)
	movb	763(%rdx), %cl
	movb	%cl, 795(%rsp)
	movb	764(%rdx), %cl
	movb	%cl, 796(%rsp)
	movb	765(%rdx), %cl
	movb	%cl, 797(%rsp)
	movb	766(%rdx), %cl
	movb	%cl, 798(%rsp)
	movb	767(%rdx), %cl
	movb	%cl, 799(%rsp)
	movb	768(%rdx), %cl
	movb	%cl, 800(%rsp)
	movb	769(%rdx), %cl
	movb	%cl, 801(%rsp)
	movb	770(%rdx), %cl
	movb	%cl, 802(%rsp)
	movb	771(%rdx), %cl
	movb	%cl, 803(%rsp)
	movb	772(%rdx), %cl
	movb	%cl, 804(%rsp)
	movb	773(%rdx), %cl
	movb	%cl, 805(%rsp)
	movb	774(%rdx), %cl
	movb	%cl, 806(%rsp)
	movb	775(%rdx), %cl
	movb	%cl, 807(%rsp)
	movb	776(%rdx), %cl
	movb	%cl, 808(%rsp)
	movb	777(%rdx), %cl
	movb	%cl, 809(%rsp)
	movb	778(%rdx), %cl
	movb	%cl, 810(%rsp)
	movb	779(%rdx), %cl
	movb	%cl, 811(%rsp)
	movb	780(%rdx), %cl
	movb	%cl, 812(%rsp)
	movb	781(%rdx), %cl
	movb	%cl, 813(%rsp)
	movb	782(%rdx), %cl
	movb	%cl, 814(%rsp)
	movb	783(%rdx), %cl
	movb	%cl, 815(%rsp)
	movb	784(%rdx), %cl
	movb	%cl, 816(%rsp)
	movb	785(%rdx), %cl
	movb	%cl, 817(%rsp)
	movb	786(%rdx), %cl
	movb	%cl, 818(%rsp)
	movb	787(%rdx), %cl
	movb	%cl, 819(%rsp)
	movb	788(%rdx), %cl
	movb	%cl, 820(%rsp)
	movb	789(%rdx), %cl
	movb	%cl, 821(%rsp)
	movb	790(%rdx), %cl
	movb	%cl, 822(%rsp)
	movb	791(%rdx), %cl
	movb	%cl, 823(%rsp)
	movb	792(%rdx), %cl
	movb	%cl, 824(%rsp)
	movb	793(%rdx), %cl
	movb	%cl, 825(%rsp)
	movb	794(%rdx), %cl
	movb	%cl, 826(%rsp)
	movb	795(%rdx), %cl
	movb	%cl, 827(%rsp)
	movb	796(%rdx), %cl
	movb	%cl, 828(%rsp)
	movb	797(%rdx), %cl
	movb	%cl, 829(%rsp)
	movb	798(%rdx), %cl
	movb	%cl, 830(%rsp)
	movb	799(%rdx), %cl
	movb	%cl, 831(%rsp)
	movb	800(%rdx), %cl
	movb	%cl, 832(%rsp)
	movb	801(%rdx), %cl
	movb	%cl, 833(%rsp)
	movb	802(%rdx), %cl
	movb	%cl, 834(%rsp)
	movb	803(%rdx), %cl
	movb	%cl, 835(%rsp)
	movb	804(%rdx), %cl
	movb	%cl, 836(%rsp)
	movb	805(%rdx), %cl
	movb	%cl, 837(%rsp)
	movb	806(%rdx), %cl
	movb	%cl, 838(%rsp)
	movb	807(%rdx), %cl
	movb	%cl, 839(%rsp)
	movb	808(%rdx), %cl
	movb	%cl, 840(%rsp)
	movb	809(%rdx), %cl
	movb	%cl, 841(%rsp)
	movb	810(%rdx), %cl
	movb	%cl, 842(%rsp)
	movb	811(%rdx), %cl
	movb	%cl, 843(%rsp)
	movb	812(%rdx), %cl
	movb	%cl, 844(%rsp)
	movb	813(%rdx), %cl
	movb	%cl, 845(%rsp)
	movb	814(%rdx), %cl
	movb	%cl, 846(%rsp)
	movb	815(%rdx), %cl
	movb	%cl, 847(%rsp)
	movb	816(%rdx), %cl
	movb	%cl, 848(%rsp)
	movb	817(%rdx), %cl
	movb	%cl, 849(%rsp)
	movb	818(%rdx), %cl
	movb	%cl, 850(%rsp)
	movb	819(%rdx), %cl
	movb	%cl, 851(%rsp)
	movb	820(%rdx), %cl
	movb	%cl, 852(%rsp)
	movb	821(%rdx), %cl
	movb	%cl, 853(%rsp)
	movb	822(%rdx), %cl
	movb	%cl, 854(%rsp)
	movb	823(%rdx), %cl
	movb	%cl, 855(%rsp)
	movb	824(%rdx), %cl
	movb	%cl, 856(%rsp)
	movb	825(%rdx), %cl
	movb	%cl, 857(%rsp)
	movb	826(%rdx), %cl
	movb	%cl, 858(%rsp)
	movb	827(%rdx), %cl
	movb	%cl, 859(%rsp)
	movb	828(%rdx), %cl
	movb	%cl, 860(%rsp)
	movb	829(%rdx), %cl
	movb	%cl, 861(%rsp)
	movb	830(%rdx), %cl
	movb	%cl, 862(%rsp)
	movb	831(%rdx), %cl
	movb	%cl, 863(%rsp)
	movb	832(%rdx), %cl
	movb	%cl, 864(%rsp)
	movb	833(%rdx), %cl
	movb	%cl, 865(%rsp)
	movb	834(%rdx), %cl
	movb	%cl, 866(%rsp)
	movb	835(%rdx), %cl
	movb	%cl, 867(%rsp)
	movb	836(%rdx), %cl
	movb	%cl, 868(%rsp)
	movb	837(%rdx), %cl
	movb	%cl, 869(%rsp)
	movb	838(%rdx), %cl
	movb	%cl, 870(%rsp)
	movb	839(%rdx), %cl
	movb	%cl, 871(%rsp)
	movb	840(%rdx), %cl
	movb	%cl, 872(%rsp)
	movb	841(%rdx), %cl
	movb	%cl, 873(%rsp)
	movb	842(%rdx), %cl
	movb	%cl, 874(%rsp)
	movb	843(%rdx), %cl
	movb	%cl, 875(%rsp)
	movb	844(%rdx), %cl
	movb	%cl, 876(%rsp)
	movb	845(%rdx), %cl
	movb	%cl, 877(%rsp)
	movb	846(%rdx), %cl
	movb	%cl, 878(%rsp)
	movb	847(%rdx), %cl
	movb	%cl, 879(%rsp)
	movb	848(%rdx), %cl
	movb	%cl, 880(%rsp)
	movb	849(%rdx), %cl
	movb	%cl, 881(%rsp)
	movb	850(%rdx), %cl
	movb	%cl, 882(%rsp)
	movb	851(%rdx), %cl
	movb	%cl, 883(%rsp)
	movb	852(%rdx), %cl
	movb	%cl, 884(%rsp)
	movb	853(%rdx), %cl
	movb	%cl, 885(%rsp)
	movb	854(%rdx), %cl
	movb	%cl, 886(%rsp)
	movb	855(%rdx), %cl
	movb	%cl, 887(%rsp)
	movb	856(%rdx), %cl
	movb	%cl, 888(%rsp)
	movb	857(%rdx), %cl
	movb	%cl, 889(%rsp)
	movb	858(%rdx), %cl
	movb	%cl, 890(%rsp)
	movb	859(%rdx), %cl
	movb	%cl, 891(%rsp)
	movb	860(%rdx), %cl
	movb	%cl, 892(%rsp)
	movb	861(%rdx), %cl
	movb	%cl, 893(%rsp)
	movb	862(%rdx), %cl
	movb	%cl, 894(%rsp)
	movb	863(%rdx), %cl
	movb	%cl, 895(%rsp)
	movb	864(%rdx), %cl
	movb	%cl, 896(%rsp)
	movb	865(%rdx), %cl
	movb	%cl, 897(%rsp)
	movb	866(%rdx), %cl
	movb	%cl, 898(%rsp)
	movb	867(%rdx), %cl
	movb	%cl, 899(%rsp)
	movb	868(%rdx), %cl
	movb	%cl, 900(%rsp)
	movb	869(%rdx), %cl
	movb	%cl, 901(%rsp)
	movb	870(%rdx), %cl
	movb	%cl, 902(%rsp)
	movb	871(%rdx), %cl
	movb	%cl, 903(%rsp)
	movb	872(%rdx), %cl
	movb	%cl, 904(%rsp)
	movb	873(%rdx), %cl
	movb	%cl, 905(%rsp)
	movb	874(%rdx), %cl
	movb	%cl, 906(%rsp)
	movb	875(%rdx), %cl
	movb	%cl, 907(%rsp)
	movb	876(%rdx), %cl
	movb	%cl, 908(%rsp)
	movb	877(%rdx), %cl
	movb	%cl, 909(%rsp)
	movb	878(%rdx), %cl
	movb	%cl, 910(%rsp)
	movb	879(%rdx), %cl
	movb	%cl, 911(%rsp)
	movb	880(%rdx), %cl
	movb	%cl, 912(%rsp)
	movb	881(%rdx), %cl
	movb	%cl, 913(%rsp)
	movb	882(%rdx), %cl
	movb	%cl, 914(%rsp)
	movb	883(%rdx), %cl
	movb	%cl, 915(%rsp)
	movb	884(%rdx), %cl
	movb	%cl, 916(%rsp)
	movb	885(%rdx), %cl
	movb	%cl, 917(%rsp)
	movb	886(%rdx), %cl
	movb	%cl, 918(%rsp)
	movb	887(%rdx), %cl
	movb	%cl, 919(%rsp)
	movb	888(%rdx), %cl
	movb	%cl, 920(%rsp)
	movb	889(%rdx), %cl
	movb	%cl, 921(%rsp)
	movb	890(%rdx), %cl
	movb	%cl, 922(%rsp)
	movb	891(%rdx), %cl
	movb	%cl, 923(%rsp)
	movb	892(%rdx), %cl
	movb	%cl, 924(%rsp)
	movb	893(%rdx), %cl
	movb	%cl, 925(%rsp)
	movb	894(%rdx), %cl
	movb	%cl, 926(%rsp)
	movb	895(%rdx), %cl
	movb	%cl, 927(%rsp)
	movb	896(%rdx), %cl
	movb	%cl, 928(%rsp)
	movb	897(%rdx), %cl
	movb	%cl, 929(%rsp)
	movb	898(%rdx), %cl
	movb	%cl, 930(%rsp)
	movb	899(%rdx), %cl
	movb	%cl, 931(%rsp)
	movb	900(%rdx), %cl
	movb	%cl, 932(%rsp)
	movb	901(%rdx), %cl
	movb	%cl, 933(%rsp)
	movb	902(%rdx), %cl
	movb	%cl, 934(%rsp)
	movb	903(%rdx), %cl
	movb	%cl, 935(%rsp)
	movb	904(%rdx), %cl
	movb	%cl, 936(%rsp)
	movb	905(%rdx), %cl
	movb	%cl, 937(%rsp)
	movb	906(%rdx), %cl
	movb	%cl, 938(%rsp)
	movb	907(%rdx), %cl
	movb	%cl, 939(%rsp)
	movb	908(%rdx), %cl
	movb	%cl, 940(%rsp)
	movb	909(%rdx), %cl
	movb	%cl, 941(%rsp)
	movb	910(%rdx), %cl
	movb	%cl, 942(%rsp)
	movb	911(%rdx), %cl
	movb	%cl, 943(%rsp)
	movb	912(%rdx), %cl
	movb	%cl, 944(%rsp)
	movb	913(%rdx), %cl
	movb	%cl, 945(%rsp)
	movb	914(%rdx), %cl
	movb	%cl, 946(%rsp)
	movb	915(%rdx), %cl
	movb	%cl, 947(%rsp)
	movb	916(%rdx), %cl
	movb	%cl, 948(%rsp)
	movb	917(%rdx), %cl
	movb	%cl, 949(%rsp)
	movb	918(%rdx), %cl
	movb	%cl, 950(%rsp)
	movb	919(%rdx), %cl
	movb	%cl, 951(%rsp)
	movb	920(%rdx), %cl
	movb	%cl, 952(%rsp)
	movb	921(%rdx), %cl
	movb	%cl, 953(%rsp)
	movb	922(%rdx), %cl
	movb	%cl, 954(%rsp)
	movb	923(%rdx), %cl
	movb	%cl, 955(%rsp)
	movb	924(%rdx), %cl
	movb	%cl, 956(%rsp)
	movb	925(%rdx), %cl
	movb	%cl, 957(%rsp)
	movb	926(%rdx), %cl
	movb	%cl, 958(%rsp)
	movb	927(%rdx), %cl
	movb	%cl, 959(%rsp)
	movb	928(%rdx), %cl
	movb	%cl, 960(%rsp)
	movb	929(%rdx), %cl
	movb	%cl, 961(%rsp)
	movb	930(%rdx), %cl
	movb	%cl, 962(%rsp)
	movb	931(%rdx), %cl
	movb	%cl, 963(%rsp)
	movb	932(%rdx), %cl
	movb	%cl, 964(%rsp)
	movb	933(%rdx), %cl
	movb	%cl, 965(%rsp)
	movb	934(%rdx), %cl
	movb	%cl, 966(%rsp)
	movb	935(%rdx), %cl
	movb	%cl, 967(%rsp)
	movb	936(%rdx), %cl
	movb	%cl, 968(%rsp)
	movb	937(%rdx), %cl
	movb	%cl, 969(%rsp)
	movb	938(%rdx), %cl
	movb	%cl, 970(%rsp)
	movb	939(%rdx), %cl
	movb	%cl, 971(%rsp)
	movb	940(%rdx), %cl
	movb	%cl, 972(%rsp)
	movb	941(%rdx), %cl
	movb	%cl, 973(%rsp)
	movb	942(%rdx), %cl
	movb	%cl, 974(%rsp)
	movb	943(%rdx), %cl
	movb	%cl, 975(%rsp)
	movb	944(%rdx), %cl
	movb	%cl, 976(%rsp)
	movb	945(%rdx), %cl
	movb	%cl, 977(%rsp)
	movb	946(%rdx), %cl
	movb	%cl, 978(%rsp)
	movb	947(%rdx), %cl
	movb	%cl, 979(%rsp)
	movb	948(%rdx), %cl
	movb	%cl, 980(%rsp)
	movb	949(%rdx), %cl
	movb	%cl, 981(%rsp)
	movb	950(%rdx), %cl
	movb	%cl, 982(%rsp)
	movb	951(%rdx), %cl
	movb	%cl, 983(%rsp)
	movb	952(%rdx), %cl
	movb	%cl, 984(%rsp)
	movb	953(%rdx), %cl
	movb	%cl, 985(%rsp)
	movb	954(%rdx), %cl
	movb	%cl, 986(%rsp)
	movb	955(%rdx), %cl
	movb	%cl, 987(%rsp)
	movb	956(%rdx), %cl
	movb	%cl, 988(%rsp)
	movb	957(%rdx), %cl
	movb	%cl, 989(%rsp)
	movb	958(%rdx), %cl
	movb	%cl, 990(%rsp)
	movb	959(%rdx), %cl
	movb	%cl, 991(%rsp)
	movb	960(%rdx), %cl
	movb	%cl, 992(%rsp)
	movb	961(%rdx), %cl
	movb	%cl, 993(%rsp)
	movb	962(%rdx), %cl
	movb	%cl, 994(%rsp)
	movb	963(%rdx), %cl
	movb	%cl, 995(%rsp)
	movb	964(%rdx), %cl
	movb	%cl, 996(%rsp)
	movb	965(%rdx), %cl
	movb	%cl, 997(%rsp)
	movb	966(%rdx), %cl
	movb	%cl, 998(%rsp)
	movb	967(%rdx), %cl
	movb	%cl, 999(%rsp)
	movb	968(%rdx), %cl
	movb	%cl, 1000(%rsp)
	movb	969(%rdx), %cl
	movb	%cl, 1001(%rsp)
	movb	970(%rdx), %cl
	movb	%cl, 1002(%rsp)
	movb	971(%rdx), %cl
	movb	%cl, 1003(%rsp)
	movb	972(%rdx), %cl
	movb	%cl, 1004(%rsp)
	movb	973(%rdx), %cl
	movb	%cl, 1005(%rsp)
	movb	974(%rdx), %cl
	movb	%cl, 1006(%rsp)
	movb	975(%rdx), %cl
	movb	%cl, 1007(%rsp)
	movb	976(%rdx), %cl
	movb	%cl, 1008(%rsp)
	movb	977(%rdx), %cl
	movb	%cl, 1009(%rsp)
	movb	978(%rdx), %cl
	movb	%cl, 1010(%rsp)
	movb	979(%rdx), %cl
	movb	%cl, 1011(%rsp)
	movb	980(%rdx), %cl
	movb	%cl, 1012(%rsp)
	movb	981(%rdx), %cl
	movb	%cl, 1013(%rsp)
	movb	982(%rdx), %cl
	movb	%cl, 1014(%rsp)
	movb	983(%rdx), %cl
	movb	%cl, 1015(%rsp)
	movb	984(%rdx), %cl
	movb	%cl, 1016(%rsp)
	movb	985(%rdx), %cl
	movb	%cl, 1017(%rsp)
	movb	986(%rdx), %cl
	movb	%cl, 1018(%rsp)
	movb	987(%rdx), %cl
	movb	%cl, 1019(%rsp)
	movb	988(%rdx), %cl
	movb	%cl, 1020(%rsp)
	movb	989(%rdx), %cl
	movb	%cl, 1021(%rsp)
	movb	990(%rdx), %cl
	movb	%cl, 1022(%rsp)
	movb	991(%rdx), %cl
	movb	%cl, 1023(%rsp)
	movb	992(%rdx), %cl
	movb	%cl, 1024(%rsp)
	movb	993(%rdx), %cl
	movb	%cl, 1025(%rsp)
	movb	994(%rdx), %cl
	movb	%cl, 1026(%rsp)
	movb	995(%rdx), %cl
	movb	%cl, 1027(%rsp)
	movb	996(%rdx), %cl
	movb	%cl, 1028(%rsp)
	movb	997(%rdx), %cl
	movb	%cl, 1029(%rsp)
	movb	998(%rdx), %cl
	movb	%cl, 1030(%rsp)
	movb	999(%rdx), %cl
	movb	%cl, 1031(%rsp)
	movb	1000(%rdx), %cl
	movb	%cl, 1032(%rsp)
	movb	1001(%rdx), %cl
	movb	%cl, 1033(%rsp)
	movb	1002(%rdx), %cl
	movb	%cl, 1034(%rsp)
	movb	1003(%rdx), %cl
	movb	%cl, 1035(%rsp)
	movb	1004(%rdx), %cl
	movb	%cl, 1036(%rsp)
	movb	1005(%rdx), %cl
	movb	%cl, 1037(%rsp)
	movb	1006(%rdx), %cl
	movb	%cl, 1038(%rsp)
	movb	1007(%rdx), %cl
	movb	%cl, 1039(%rsp)
	movb	1008(%rdx), %cl
	movb	%cl, 1040(%rsp)
	movb	1009(%rdx), %cl
	movb	%cl, 1041(%rsp)
	movb	1010(%rdx), %cl
	movb	%cl, 1042(%rsp)
	movb	1011(%rdx), %cl
	movb	%cl, 1043(%rsp)
	movb	1012(%rdx), %cl
	movb	%cl, 1044(%rsp)
	movb	1013(%rdx), %cl
	movb	%cl, 1045(%rsp)
	movb	1014(%rdx), %cl
	movb	%cl, 1046(%rsp)
	movb	1015(%rdx), %cl
	movb	%cl, 1047(%rsp)
	movb	1016(%rdx), %cl
	movb	%cl, 1048(%rsp)
	movb	1017(%rdx), %cl
	movb	%cl, 1049(%rsp)
	movb	1018(%rdx), %cl
	movb	%cl, 1050(%rsp)
	movb	1019(%rdx), %cl
	movb	%cl, 1051(%rsp)
	movb	1020(%rdx), %cl
	movb	%cl, 1052(%rsp)
	movb	1021(%rdx), %cl
	movb	%cl, 1053(%rsp)
	movb	1022(%rdx), %cl
	movb	%cl, 1054(%rsp)
	movb	1023(%rdx), %cl
	movb	%cl, 1055(%rsp)
	movb	1024(%rdx), %cl
	movb	%cl, 1056(%rsp)
	movb	1025(%rdx), %cl
	movb	%cl, 1057(%rsp)
	movb	1026(%rdx), %cl
	movb	%cl, 1058(%rsp)
	movb	1027(%rdx), %cl
	movb	%cl, 1059(%rsp)
	movb	1028(%rdx), %cl
	movb	%cl, 1060(%rsp)
	movb	1029(%rdx), %cl
	movb	%cl, 1061(%rsp)
	movb	1030(%rdx), %cl
	movb	%cl, 1062(%rsp)
	movb	1031(%rdx), %cl
	movb	%cl, 1063(%rsp)
	movb	1032(%rdx), %cl
	movb	%cl, 1064(%rsp)
	movb	1033(%rdx), %cl
	movb	%cl, 1065(%rsp)
	movb	1034(%rdx), %cl
	movb	%cl, 1066(%rsp)
	movb	1035(%rdx), %cl
	movb	%cl, 1067(%rsp)
	movb	1036(%rdx), %cl
	movb	%cl, 1068(%rsp)
	movb	1037(%rdx), %cl
	movb	%cl, 1069(%rsp)
	movb	1038(%rdx), %cl
	movb	%cl, 1070(%rsp)
	movb	1039(%rdx), %cl
	movb	%cl, 1071(%rsp)
	movb	1040(%rdx), %cl
	movb	%cl, 1072(%rsp)
	movb	1041(%rdx), %cl
	movb	%cl, 1073(%rsp)
	movb	1042(%rdx), %cl
	movb	%cl, 1074(%rsp)
	movb	1043(%rdx), %cl
	movb	%cl, 1075(%rsp)
	movb	1044(%rdx), %cl
	movb	%cl, 1076(%rsp)
	movb	1045(%rdx), %cl
	movb	%cl, 1077(%rsp)
	movb	1046(%rdx), %cl
	movb	%cl, 1078(%rsp)
	movb	1047(%rdx), %cl
	movb	%cl, 1079(%rsp)
	movb	1048(%rdx), %cl
	movb	%cl, 1080(%rsp)
	movb	1049(%rdx), %cl
	movb	%cl, 1081(%rsp)
	movb	1050(%rdx), %cl
	movb	%cl, 1082(%rsp)
	movb	1051(%rdx), %cl
	movb	%cl, 1083(%rsp)
	movb	1052(%rdx), %cl
	movb	%cl, 1084(%rsp)
	movb	1053(%rdx), %cl
	movb	%cl, 1085(%rsp)
	movb	1054(%rdx), %cl
	movb	%cl, 1086(%rsp)
	movb	1055(%rdx), %cl
	movb	%cl, 1087(%rsp)
	movb	1056(%rdx), %cl
	movb	%cl, 1088(%rsp)
	movb	1057(%rdx), %cl
	movb	%cl, 1089(%rsp)
	movb	1058(%rdx), %cl
	movb	%cl, 1090(%rsp)
	movb	1059(%rdx), %cl
	movb	%cl, 1091(%rsp)
	movb	1060(%rdx), %cl
	movb	%cl, 1092(%rsp)
	movb	1061(%rdx), %cl
	movb	%cl, 1093(%rsp)
	movb	1062(%rdx), %cl
	movb	%cl, 1094(%rsp)
	movb	1063(%rdx), %cl
	movb	%cl, 1095(%rsp)
	movb	1064(%rdx), %cl
	movb	%cl, 1096(%rsp)
	movb	1065(%rdx), %cl
	movb	%cl, 1097(%rsp)
	movb	1066(%rdx), %cl
	movb	%cl, 1098(%rsp)
	movb	1067(%rdx), %cl
	movb	%cl, 1099(%rsp)
	movb	1068(%rdx), %cl
	movb	%cl, 1100(%rsp)
	movb	1069(%rdx), %cl
	movb	%cl, 1101(%rsp)
	movb	1070(%rdx), %cl
	movb	%cl, 1102(%rsp)
	movb	1071(%rdx), %cl
	movb	%cl, 1103(%rsp)
	movb	1072(%rdx), %cl
	movb	%cl, 1104(%rsp)
	movb	1073(%rdx), %cl
	movb	%cl, 1105(%rsp)
	movb	1074(%rdx), %cl
	movb	%cl, 1106(%rsp)
	movb	1075(%rdx), %cl
	movb	%cl, 1107(%rsp)
	movb	1076(%rdx), %cl
	movb	%cl, 1108(%rsp)
	movb	1077(%rdx), %cl
	movb	%cl, 1109(%rsp)
	movb	1078(%rdx), %cl
	movb	%cl, 1110(%rsp)
	movb	1079(%rdx), %cl
	movb	%cl, 1111(%rsp)
	movb	1080(%rdx), %cl
	movb	%cl, 1112(%rsp)
	movb	1081(%rdx), %cl
	movb	%cl, 1113(%rsp)
	movb	1082(%rdx), %cl
	movb	%cl, 1114(%rsp)
	movb	1083(%rdx), %cl
	movb	%cl, 1115(%rsp)
	movb	1084(%rdx), %cl
	movb	%cl, 1116(%rsp)
	movb	1085(%rdx), %cl
	movb	%cl, 1117(%rsp)
	movb	1086(%rdx), %cl
	movb	%cl, 1118(%rsp)
	movb	1087(%rdx), %cl
	movb	%cl, 1119(%rsp)
	movb	1088(%rdx), %cl
	movb	%cl, 1120(%rsp)
	movb	1089(%rdx), %cl
	movb	%cl, 1121(%rsp)
	movb	1090(%rdx), %cl
	movb	%cl, 1122(%rsp)
	movb	1091(%rdx), %cl
	movb	%cl, 1123(%rsp)
	movb	1092(%rdx), %cl
	movb	%cl, 1124(%rsp)
	movb	1093(%rdx), %cl
	movb	%cl, 1125(%rsp)
	movb	1094(%rdx), %cl
	movb	%cl, 1126(%rsp)
	movb	1095(%rdx), %cl
	movb	%cl, 1127(%rsp)
	movb	1096(%rdx), %cl
	movb	%cl, 1128(%rsp)
	movb	1097(%rdx), %cl
	movb	%cl, 1129(%rsp)
	movb	1098(%rdx), %cl
	movb	%cl, 1130(%rsp)
	movb	1099(%rdx), %cl
	movb	%cl, 1131(%rsp)
	movb	1100(%rdx), %cl
	movb	%cl, 1132(%rsp)
	movb	1101(%rdx), %cl
	movb	%cl, 1133(%rsp)
	movb	1102(%rdx), %cl
	movb	%cl, 1134(%rsp)
	movb	1103(%rdx), %cl
	movb	%cl, 1135(%rsp)
	movb	1104(%rdx), %cl
	movb	%cl, 1136(%rsp)
	movb	1105(%rdx), %cl
	movb	%cl, 1137(%rsp)
	movb	1106(%rdx), %cl
	movb	%cl, 1138(%rsp)
	movb	1107(%rdx), %cl
	movb	%cl, 1139(%rsp)
	movb	1108(%rdx), %cl
	movb	%cl, 1140(%rsp)
	movb	1109(%rdx), %cl
	movb	%cl, 1141(%rsp)
	movb	1110(%rdx), %cl
	movb	%cl, 1142(%rsp)
	movb	1111(%rdx), %cl
	movb	%cl, 1143(%rsp)
	movb	1112(%rdx), %cl
	movb	%cl, 1144(%rsp)
	movb	1113(%rdx), %cl
	movb	%cl, 1145(%rsp)
	movb	1114(%rdx), %cl
	movb	%cl, 1146(%rsp)
	movb	1115(%rdx), %cl
	movb	%cl, 1147(%rsp)
	movb	1116(%rdx), %cl
	movb	%cl, 1148(%rsp)
	movb	1117(%rdx), %cl
	movb	%cl, 1149(%rsp)
	movb	1118(%rdx), %cl
	movb	%cl, 1150(%rsp)
	movb	1119(%rdx), %cl
	movb	%cl, 1151(%rsp)
	movb	1120(%rdx), %cl
	movb	%cl, 1152(%rsp)
	movb	1121(%rdx), %cl
	movb	%cl, 1153(%rsp)
	movb	1122(%rdx), %cl
	movb	%cl, 1154(%rsp)
	movb	1123(%rdx), %cl
	movb	%cl, 1155(%rsp)
	movb	1124(%rdx), %cl
	movb	%cl, 1156(%rsp)
	movb	1125(%rdx), %cl
	movb	%cl, 1157(%rsp)
	movb	1126(%rdx), %cl
	movb	%cl, 1158(%rsp)
	movb	1127(%rdx), %cl
	movb	%cl, 1159(%rsp)
	movb	1128(%rdx), %cl
	movb	%cl, 1160(%rsp)
	movb	1129(%rdx), %cl
	movb	%cl, 1161(%rsp)
	movb	1130(%rdx), %cl
	movb	%cl, 1162(%rsp)
	movb	1131(%rdx), %cl
	movb	%cl, 1163(%rsp)
	movb	1132(%rdx), %cl
	movb	%cl, 1164(%rsp)
	movb	1133(%rdx), %cl
	movb	%cl, 1165(%rsp)
	movb	1134(%rdx), %cl
	movb	%cl, 1166(%rsp)
	movb	1135(%rdx), %cl
	movb	%cl, 1167(%rsp)
	movb	1136(%rdx), %cl
	movb	%cl, 1168(%rsp)
	movb	1137(%rdx), %cl
	movb	%cl, 1169(%rsp)
	movb	1138(%rdx), %cl
	movb	%cl, 1170(%rsp)
	movb	1139(%rdx), %cl
	movb	%cl, 1171(%rsp)
	movb	1140(%rdx), %cl
	movb	%cl, 1172(%rsp)
	movb	1141(%rdx), %cl
	movb	%cl, 1173(%rsp)
	movb	1142(%rdx), %cl
	movb	%cl, 1174(%rsp)
	movb	1143(%rdx), %cl
	movb	%cl, 1175(%rsp)
	movb	1144(%rdx), %cl
	movb	%cl, 1176(%rsp)
	movb	1145(%rdx), %cl
	movb	%cl, 1177(%rsp)
	movb	1146(%rdx), %cl
	movb	%cl, 1178(%rsp)
	movb	1147(%rdx), %cl
	movb	%cl, 1179(%rsp)
	movb	1148(%rdx), %cl
	movb	%cl, 1180(%rsp)
	movb	1149(%rdx), %cl
	movb	%cl, 1181(%rsp)
	movb	1150(%rdx), %cl
	movb	%cl, 1182(%rsp)
	movb	1151(%rdx), %cl
	movb	%cl, 1183(%rsp)
	movb	1152(%rdx), %cl
	movb	%cl, 1184(%rsp)
	movb	1153(%rdx), %cl
	movb	%cl, 1185(%rsp)
	movb	1154(%rdx), %cl
	movb	%cl, 1186(%rsp)
	movb	1155(%rdx), %cl
	movb	%cl, 1187(%rsp)
	movb	1156(%rdx), %cl
	movb	%cl, 1188(%rsp)
	movb	1157(%rdx), %cl
	movb	%cl, 1189(%rsp)
	movb	1158(%rdx), %cl
	movb	%cl, 1190(%rsp)
	movb	1159(%rdx), %cl
	movb	%cl, 1191(%rsp)
	movb	1160(%rdx), %cl
	movb	%cl, 1192(%rsp)
	movb	1161(%rdx), %cl
	movb	%cl, 1193(%rsp)
	movb	1162(%rdx), %cl
	movb	%cl, 1194(%rsp)
	movb	1163(%rdx), %cl
	movb	%cl, 1195(%rsp)
	movb	1164(%rdx), %cl
	movb	%cl, 1196(%rsp)
	movb	1165(%rdx), %cl
	movb	%cl, 1197(%rsp)
	movb	1166(%rdx), %cl
	movb	%cl, 1198(%rsp)
	movb	1167(%rdx), %cl
	movb	%cl, 1199(%rsp)
	movb	1168(%rdx), %cl
	movb	%cl, 1200(%rsp)
	movb	1169(%rdx), %cl
	movb	%cl, 1201(%rsp)
	movb	1170(%rdx), %cl
	movb	%cl, 1202(%rsp)
	movb	1171(%rdx), %cl
	movb	%cl, 1203(%rsp)
	movb	1172(%rdx), %cl
	movb	%cl, 1204(%rsp)
	movb	1173(%rdx), %cl
	movb	%cl, 1205(%rsp)
	movb	1174(%rdx), %cl
	movb	%cl, 1206(%rsp)
	movb	1175(%rdx), %cl
	movb	%cl, 1207(%rsp)
	movb	1176(%rdx), %cl
	movb	%cl, 1208(%rsp)
	movb	1177(%rdx), %cl
	movb	%cl, 1209(%rsp)
	movb	1178(%rdx), %cl
	movb	%cl, 1210(%rsp)
	movb	1179(%rdx), %cl
	movb	%cl, 1211(%rsp)
	movb	1180(%rdx), %cl
	movb	%cl, 1212(%rsp)
	movb	1181(%rdx), %cl
	movb	%cl, 1213(%rsp)
	movb	1182(%rdx), %cl
	movb	%cl, 1214(%rsp)
	movb	1183(%rdx), %cl
	movb	%cl, 1215(%rsp)
	movb	1184(%rdx), %cl
	movb	%cl, 1216(%rsp)
	movb	1185(%rdx), %cl
	movb	%cl, 1217(%rsp)
	movb	1186(%rdx), %cl
	movb	%cl, 1218(%rsp)
	movb	1187(%rdx), %cl
	movb	%cl, 1219(%rsp)
	movb	1188(%rdx), %cl
	movb	%cl, 1220(%rsp)
	movb	1189(%rdx), %cl
	movb	%cl, 1221(%rsp)
	movb	1190(%rdx), %cl
	movb	%cl, 1222(%rsp)
	movb	1191(%rdx), %cl
	movb	%cl, 1223(%rsp)
	movb	1192(%rdx), %cl
	movb	%cl, 1224(%rsp)
	movb	1193(%rdx), %cl
	movb	%cl, 1225(%rsp)
	movb	1194(%rdx), %cl
	movb	%cl, 1226(%rsp)
	movb	1195(%rdx), %cl
	movb	%cl, 1227(%rsp)
	movb	1196(%rdx), %cl
	movb	%cl, 1228(%rsp)
	movb	1197(%rdx), %cl
	movb	%cl, 1229(%rsp)
	movb	1198(%rdx), %cl
	movb	%cl, 1230(%rsp)
	movb	1199(%rdx), %cl
	movb	%cl, 1231(%rsp)
	movb	1200(%rdx), %cl
	movb	%cl, 1232(%rsp)
	movb	1201(%rdx), %cl
	movb	%cl, 1233(%rsp)
	movb	1202(%rdx), %cl
	movb	%cl, 1234(%rsp)
	movb	1203(%rdx), %cl
	movb	%cl, 1235(%rsp)
	movb	1204(%rdx), %cl
	movb	%cl, 1236(%rsp)
	movb	1205(%rdx), %cl
	movb	%cl, 1237(%rsp)
	movb	1206(%rdx), %cl
	movb	%cl, 1238(%rsp)
	movb	1207(%rdx), %cl
	movb	%cl, 1239(%rsp)
	movb	1208(%rdx), %cl
	movb	%cl, 1240(%rsp)
	movb	1209(%rdx), %cl
	movb	%cl, 1241(%rsp)
	movb	1210(%rdx), %cl
	movb	%cl, 1242(%rsp)
	movb	1211(%rdx), %cl
	movb	%cl, 1243(%rsp)
	movb	1212(%rdx), %cl
	movb	%cl, 1244(%rsp)
	movb	1213(%rdx), %cl
	movb	%cl, 1245(%rsp)
	movb	1214(%rdx), %cl
	movb	%cl, 1246(%rsp)
	movb	1215(%rdx), %cl
	movb	%cl, 1247(%rsp)
	movb	1216(%rdx), %cl
	movb	%cl, 1248(%rsp)
	movb	1217(%rdx), %cl
	movb	%cl, 1249(%rsp)
	movb	1218(%rdx), %cl
	movb	%cl, 1250(%rsp)
	movb	1219(%rdx), %cl
	movb	%cl, 1251(%rsp)
	movb	1220(%rdx), %cl
	movb	%cl, 1252(%rsp)
	movb	1221(%rdx), %cl
	movb	%cl, 1253(%rsp)
	movb	1222(%rdx), %cl
	movb	%cl, 1254(%rsp)
	movb	1223(%rdx), %cl
	movb	%cl, 1255(%rsp)
	movb	1224(%rdx), %cl
	movb	%cl, 1256(%rsp)
	movb	1225(%rdx), %cl
	movb	%cl, 1257(%rsp)
	movb	1226(%rdx), %cl
	movb	%cl, 1258(%rsp)
	movb	1227(%rdx), %cl
	movb	%cl, 1259(%rsp)
	movb	1228(%rdx), %cl
	movb	%cl, 1260(%rsp)
	movb	1229(%rdx), %cl
	movb	%cl, 1261(%rsp)
	movb	1230(%rdx), %cl
	movb	%cl, 1262(%rsp)
	movb	1231(%rdx), %cl
	movb	%cl, 1263(%rsp)
	movb	1232(%rdx), %cl
	movb	%cl, 1264(%rsp)
	movb	1233(%rdx), %cl
	movb	%cl, 1265(%rsp)
	movb	1234(%rdx), %cl
	movb	%cl, 1266(%rsp)
	movb	1235(%rdx), %cl
	movb	%cl, 1267(%rsp)
	movb	1236(%rdx), %cl
	movb	%cl, 1268(%rsp)
	movb	1237(%rdx), %cl
	movb	%cl, 1269(%rsp)
	movb	1238(%rdx), %cl
	movb	%cl, 1270(%rsp)
	movb	1239(%rdx), %cl
	movb	%cl, 1271(%rsp)
	movb	1240(%rdx), %cl
	movb	%cl, 1272(%rsp)
	movb	1241(%rdx), %cl
	movb	%cl, 1273(%rsp)
	movb	1242(%rdx), %cl
	movb	%cl, 1274(%rsp)
	movb	1243(%rdx), %cl
	movb	%cl, 1275(%rsp)
	movb	1244(%rdx), %cl
	movb	%cl, 1276(%rsp)
	movb	1245(%rdx), %cl
	movb	%cl, 1277(%rsp)
	movb	1246(%rdx), %cl
	movb	%cl, 1278(%rsp)
	movb	1247(%rdx), %cl
	movb	%cl, 1279(%rsp)
	movb	1248(%rdx), %cl
	movb	%cl, 1280(%rsp)
	movb	1249(%rdx), %cl
	movb	%cl, 1281(%rsp)
	movb	1250(%rdx), %cl
	movb	%cl, 1282(%rsp)
	movb	1251(%rdx), %cl
	movb	%cl, 1283(%rsp)
	movb	1252(%rdx), %cl
	movb	%cl, 1284(%rsp)
	movb	1253(%rdx), %cl
	movb	%cl, 1285(%rsp)
	movb	1254(%rdx), %cl
	movb	%cl, 1286(%rsp)
	movb	1255(%rdx), %cl
	movb	%cl, 1287(%rsp)
	movb	1256(%rdx), %cl
	movb	%cl, 1288(%rsp)
	movb	1257(%rdx), %cl
	movb	%cl, 1289(%rsp)
	movb	1258(%rdx), %cl
	movb	%cl, 1290(%rsp)
	movb	1259(%rdx), %cl
	movb	%cl, 1291(%rsp)
	movb	1260(%rdx), %cl
	movb	%cl, 1292(%rsp)
	movb	1261(%rdx), %cl
	movb	%cl, 1293(%rsp)
	movb	1262(%rdx), %cl
	movb	%cl, 1294(%rsp)
	movb	1263(%rdx), %cl
	movb	%cl, 1295(%rsp)
	movb	1264(%rdx), %cl
	movb	%cl, 1296(%rsp)
	movb	1265(%rdx), %cl
	movb	%cl, 1297(%rsp)
	movb	1266(%rdx), %cl
	movb	%cl, 1298(%rsp)
	movb	1267(%rdx), %cl
	movb	%cl, 1299(%rsp)
	movb	1268(%rdx), %cl
	movb	%cl, 1300(%rsp)
	movb	1269(%rdx), %cl
	movb	%cl, 1301(%rsp)
	movb	1270(%rdx), %cl
	movb	%cl, 1302(%rsp)
	movb	1271(%rdx), %cl
	movb	%cl, 1303(%rsp)
	movb	1272(%rdx), %cl
	movb	%cl, 1304(%rsp)
	movb	1273(%rdx), %cl
	movb	%cl, 1305(%rsp)
	movb	1274(%rdx), %cl
	movb	%cl, 1306(%rsp)
	movb	1275(%rdx), %cl
	movb	%cl, 1307(%rsp)
	movb	1276(%rdx), %cl
	movb	%cl, 1308(%rsp)
	movb	1277(%rdx), %cl
	movb	%cl, 1309(%rsp)
	movb	1278(%rdx), %cl
	movb	%cl, 1310(%rsp)
	movb	1279(%rdx), %cl
	movb	%cl, 1311(%rsp)
	movb	1280(%rdx), %cl
	movb	%cl, 1312(%rsp)
	movb	1281(%rdx), %cl
	movb	%cl, 1313(%rsp)
	movb	1282(%rdx), %cl
	movb	%cl, 1314(%rsp)
	movb	1283(%rdx), %cl
	movb	%cl, 1315(%rsp)
	movb	1284(%rdx), %cl
	movb	%cl, 1316(%rsp)
	movb	1285(%rdx), %cl
	movb	%cl, 1317(%rsp)
	movb	1286(%rdx), %cl
	movb	%cl, 1318(%rsp)
	movb	1287(%rdx), %cl
	movb	%cl, 1319(%rsp)
	movb	1288(%rdx), %cl
	movb	%cl, 1320(%rsp)
	movb	1289(%rdx), %cl
	movb	%cl, 1321(%rsp)
	movb	1290(%rdx), %cl
	movb	%cl, 1322(%rsp)
	movb	1291(%rdx), %cl
	movb	%cl, 1323(%rsp)
	movb	1292(%rdx), %cl
	movb	%cl, 1324(%rsp)
	movb	1293(%rdx), %cl
	movb	%cl, 1325(%rsp)
	movb	1294(%rdx), %cl
	movb	%cl, 1326(%rsp)
	movb	1295(%rdx), %cl
	movb	%cl, 1327(%rsp)
	movb	1296(%rdx), %cl
	movb	%cl, 1328(%rsp)
	movb	1297(%rdx), %cl
	movb	%cl, 1329(%rsp)
	movb	1298(%rdx), %cl
	movb	%cl, 1330(%rsp)
	movb	1299(%rdx), %cl
	movb	%cl, 1331(%rsp)
	movb	1300(%rdx), %cl
	movb	%cl, 1332(%rsp)
	movb	1301(%rdx), %cl
	movb	%cl, 1333(%rsp)
	movb	1302(%rdx), %cl
	movb	%cl, 1334(%rsp)
	movb	1303(%rdx), %cl
	movb	%cl, 1335(%rsp)
	movb	1304(%rdx), %cl
	movb	%cl, 1336(%rsp)
	movb	1305(%rdx), %cl
	movb	%cl, 1337(%rsp)
	movb	1306(%rdx), %cl
	movb	%cl, 1338(%rsp)
	movb	1307(%rdx), %cl
	movb	%cl, 1339(%rsp)
	movb	1308(%rdx), %cl
	movb	%cl, 1340(%rsp)
	movb	1309(%rdx), %cl
	movb	%cl, 1341(%rsp)
	movb	1310(%rdx), %cl
	movb	%cl, 1342(%rsp)
	movb	1311(%rdx), %cl
	movb	%cl, 1343(%rsp)
	movb	1312(%rdx), %cl
	movb	%cl, 1344(%rsp)
	movb	1313(%rdx), %cl
	movb	%cl, 1345(%rsp)
	movb	1314(%rdx), %cl
	movb	%cl, 1346(%rsp)
	movb	1315(%rdx), %cl
	movb	%cl, 1347(%rsp)
	movb	1316(%rdx), %cl
	movb	%cl, 1348(%rsp)
	movb	1317(%rdx), %cl
	movb	%cl, 1349(%rsp)
	movb	1318(%rdx), %cl
	movb	%cl, 1350(%rsp)
	movb	1319(%rdx), %cl
	movb	%cl, 1351(%rsp)
	movb	1320(%rdx), %cl
	movb	%cl, 1352(%rsp)
	movb	1321(%rdx), %cl
	movb	%cl, 1353(%rsp)
	movb	1322(%rdx), %cl
	movb	%cl, 1354(%rsp)
	movb	1323(%rdx), %cl
	movb	%cl, 1355(%rsp)
	movb	1324(%rdx), %cl
	movb	%cl, 1356(%rsp)
	movb	1325(%rdx), %cl
	movb	%cl, 1357(%rsp)
	movb	1326(%rdx), %cl
	movb	%cl, 1358(%rsp)
	movb	1327(%rdx), %cl
	movb	%cl, 1359(%rsp)
	movb	1328(%rdx), %cl
	movb	%cl, 1360(%rsp)
	movb	1329(%rdx), %cl
	movb	%cl, 1361(%rsp)
	movb	1330(%rdx), %cl
	movb	%cl, 1362(%rsp)
	movb	1331(%rdx), %cl
	movb	%cl, 1363(%rsp)
	movb	1332(%rdx), %cl
	movb	%cl, 1364(%rsp)
	movb	1333(%rdx), %cl
	movb	%cl, 1365(%rsp)
	movb	1334(%rdx), %cl
	movb	%cl, 1366(%rsp)
	movb	1335(%rdx), %cl
	movb	%cl, 1367(%rsp)
	movb	1336(%rdx), %cl
	movb	%cl, 1368(%rsp)
	movb	1337(%rdx), %cl
	movb	%cl, 1369(%rsp)
	movb	1338(%rdx), %cl
	movb	%cl, 1370(%rsp)
	movb	1339(%rdx), %cl
	movb	%cl, 1371(%rsp)
	movb	1340(%rdx), %cl
	movb	%cl, 1372(%rsp)
	movb	1341(%rdx), %cl
	movb	%cl, 1373(%rsp)
	movb	1342(%rdx), %cl
	movb	%cl, 1374(%rsp)
	movb	1343(%rdx), %cl
	movb	%cl, 1375(%rsp)
	movb	1344(%rdx), %cl
	movb	%cl, 1376(%rsp)
	movb	1345(%rdx), %cl
	movb	%cl, 1377(%rsp)
	movb	1346(%rdx), %cl
	movb	%cl, 1378(%rsp)
	movb	1347(%rdx), %cl
	movb	%cl, 1379(%rsp)
	movb	1348(%rdx), %cl
	movb	%cl, 1380(%rsp)
	movb	1349(%rdx), %cl
	movb	%cl, 1381(%rsp)
	movb	1350(%rdx), %cl
	movb	%cl, 1382(%rsp)
	movb	1351(%rdx), %cl
	movb	%cl, 1383(%rsp)
	movb	1352(%rdx), %cl
	movb	%cl, 1384(%rsp)
	movb	1353(%rdx), %cl
	movb	%cl, 1385(%rsp)
	movb	1354(%rdx), %cl
	movb	%cl, 1386(%rsp)
	movb	1355(%rdx), %cl
	movb	%cl, 1387(%rsp)
	movb	1356(%rdx), %cl
	movb	%cl, 1388(%rsp)
	movb	1357(%rdx), %cl
	movb	%cl, 1389(%rsp)
	movb	1358(%rdx), %cl
	movb	%cl, 1390(%rsp)
	movb	1359(%rdx), %cl
	movb	%cl, 1391(%rsp)
	movb	1360(%rdx), %cl
	movb	%cl, 1392(%rsp)
	movb	1361(%rdx), %cl
	movb	%cl, 1393(%rsp)
	movb	1362(%rdx), %cl
	movb	%cl, 1394(%rsp)
	movb	1363(%rdx), %cl
	movb	%cl, 1395(%rsp)
	movb	1364(%rdx), %cl
	movb	%cl, 1396(%rsp)
	movb	1365(%rdx), %cl
	movb	%cl, 1397(%rsp)
	movb	1366(%rdx), %cl
	movb	%cl, 1398(%rsp)
	movb	1367(%rdx), %cl
	movb	%cl, 1399(%rsp)
	movb	1368(%rdx), %cl
	movb	%cl, 1400(%rsp)
	movb	1369(%rdx), %cl
	movb	%cl, 1401(%rsp)
	movb	1370(%rdx), %cl
	movb	%cl, 1402(%rsp)
	movb	1371(%rdx), %cl
	movb	%cl, 1403(%rsp)
	movb	1372(%rdx), %cl
	movb	%cl, 1404(%rsp)
	movb	1373(%rdx), %cl
	movb	%cl, 1405(%rsp)
	movb	1374(%rdx), %cl
	movb	%cl, 1406(%rsp)
	movb	1375(%rdx), %cl
	movb	%cl, 1407(%rsp)
	movb	1376(%rdx), %cl
	movb	%cl, 1408(%rsp)
	movb	1377(%rdx), %cl
	movb	%cl, 1409(%rsp)
	movb	1378(%rdx), %cl
	movb	%cl, 1410(%rsp)
	movb	1379(%rdx), %cl
	movb	%cl, 1411(%rsp)
	movb	1380(%rdx), %cl
	movb	%cl, 1412(%rsp)
	movb	1381(%rdx), %cl
	movb	%cl, 1413(%rsp)
	movb	1382(%rdx), %cl
	movb	%cl, 1414(%rsp)
	movb	1383(%rdx), %cl
	movb	%cl, 1415(%rsp)
	movb	1384(%rdx), %cl
	movb	%cl, 1416(%rsp)
	movb	1385(%rdx), %cl
	movb	%cl, 1417(%rsp)
	movb	1386(%rdx), %cl
	movb	%cl, 1418(%rsp)
	movb	1387(%rdx), %cl
	movb	%cl, 1419(%rsp)
	movb	1388(%rdx), %cl
	movb	%cl, 1420(%rsp)
	movb	1389(%rdx), %cl
	movb	%cl, 1421(%rsp)
	movb	1390(%rdx), %cl
	movb	%cl, 1422(%rsp)
	movb	1391(%rdx), %cl
	movb	%cl, 1423(%rsp)
	movb	1392(%rdx), %cl
	movb	%cl, 1424(%rsp)
	movb	1393(%rdx), %cl
	movb	%cl, 1425(%rsp)
	movb	1394(%rdx), %cl
	movb	%cl, 1426(%rsp)
	movb	1395(%rdx), %cl
	movb	%cl, 1427(%rsp)
	movb	1396(%rdx), %cl
	movb	%cl, 1428(%rsp)
	movb	1397(%rdx), %cl
	movb	%cl, 1429(%rsp)
	movb	1398(%rdx), %cl
	movb	%cl, 1430(%rsp)
	movb	1399(%rdx), %cl
	movb	%cl, 1431(%rsp)
	movb	1400(%rdx), %cl
	movb	%cl, 1432(%rsp)
	movb	1401(%rdx), %cl
	movb	%cl, 1433(%rsp)
	movb	1402(%rdx), %cl
	movb	%cl, 1434(%rsp)
	movb	1403(%rdx), %cl
	movb	%cl, 1435(%rsp)
	movb	1404(%rdx), %cl
	movb	%cl, 1436(%rsp)
	movb	1405(%rdx), %cl
	movb	%cl, 1437(%rsp)
	movb	1406(%rdx), %cl
	movb	%cl, 1438(%rsp)
	movb	1407(%rdx), %cl
	movb	%cl, 1439(%rsp)
	movb	1408(%rdx), %cl
	movb	%cl, 1440(%rsp)
	movb	1409(%rdx), %cl
	movb	%cl, 1441(%rsp)
	movb	1410(%rdx), %cl
	movb	%cl, 1442(%rsp)
	movb	1411(%rdx), %cl
	movb	%cl, 1443(%rsp)
	movb	1412(%rdx), %cl
	movb	%cl, 1444(%rsp)
	movb	1413(%rdx), %cl
	movb	%cl, 1445(%rsp)
	movb	1414(%rdx), %cl
	movb	%cl, 1446(%rsp)
	movb	1415(%rdx), %cl
	movb	%cl, 1447(%rsp)
	movb	1416(%rdx), %cl
	movb	%cl, 1448(%rsp)
	movb	1417(%rdx), %cl
	movb	%cl, 1449(%rsp)
	movb	1418(%rdx), %cl
	movb	%cl, 1450(%rsp)
	movb	1419(%rdx), %cl
	movb	%cl, 1451(%rsp)
	movb	1420(%rdx), %cl
	movb	%cl, 1452(%rsp)
	movb	1421(%rdx), %cl
	movb	%cl, 1453(%rsp)
	movb	1422(%rdx), %cl
	movb	%cl, 1454(%rsp)
	movb	1423(%rdx), %cl
	movb	%cl, 1455(%rsp)
	movb	1424(%rdx), %cl
	movb	%cl, 1456(%rsp)
	movb	1425(%rdx), %cl
	movb	%cl, 1457(%rsp)
	movb	1426(%rdx), %cl
	movb	%cl, 1458(%rsp)
	movb	1427(%rdx), %cl
	movb	%cl, 1459(%rsp)
	movb	1428(%rdx), %cl
	movb	%cl, 1460(%rsp)
	movb	1429(%rdx), %cl
	movb	%cl, 1461(%rsp)
	movb	1430(%rdx), %cl
	movb	%cl, 1462(%rsp)
	movb	1431(%rdx), %cl
	movb	%cl, 1463(%rsp)
	movb	1432(%rdx), %cl
	movb	%cl, 1464(%rsp)
	movb	1433(%rdx), %cl
	movb	%cl, 1465(%rsp)
	movb	1434(%rdx), %cl
	movb	%cl, 1466(%rsp)
	movb	1435(%rdx), %cl
	movb	%cl, 1467(%rsp)
	movb	1436(%rdx), %cl
	movb	%cl, 1468(%rsp)
	movb	1437(%rdx), %cl
	movb	%cl, 1469(%rsp)
	movb	1438(%rdx), %cl
	movb	%cl, 1470(%rsp)
	movb	1439(%rdx), %cl
	movb	%cl, 1471(%rsp)
	movb	1440(%rdx), %cl
	movb	%cl, 1472(%rsp)
	movb	1441(%rdx), %cl
	movb	%cl, 1473(%rsp)
	movb	1442(%rdx), %cl
	movb	%cl, 1474(%rsp)
	movb	1443(%rdx), %cl
	movb	%cl, 1475(%rsp)
	movb	1444(%rdx), %cl
	movb	%cl, 1476(%rsp)
	movb	1445(%rdx), %cl
	movb	%cl, 1477(%rsp)
	movb	1446(%rdx), %cl
	movb	%cl, 1478(%rsp)
	movb	1447(%rdx), %cl
	movb	%cl, 1479(%rsp)
	movb	1448(%rdx), %cl
	movb	%cl, 1480(%rsp)
	movb	1449(%rdx), %cl
	movb	%cl, 1481(%rsp)
	movb	1450(%rdx), %cl
	movb	%cl, 1482(%rsp)
	movb	1451(%rdx), %cl
	movb	%cl, 1483(%rsp)
	movb	1452(%rdx), %cl
	movb	%cl, 1484(%rsp)
	movb	1453(%rdx), %cl
	movb	%cl, 1485(%rsp)
	movb	1454(%rdx), %cl
	movb	%cl, 1486(%rsp)
	movb	1455(%rdx), %cl
	movb	%cl, 1487(%rsp)
	movb	1456(%rdx), %cl
	movb	%cl, 1488(%rsp)
	movb	1457(%rdx), %cl
	movb	%cl, 1489(%rsp)
	movb	1458(%rdx), %cl
	movb	%cl, 1490(%rsp)
	movb	1459(%rdx), %cl
	movb	%cl, 1491(%rsp)
	movb	1460(%rdx), %cl
	movb	%cl, 1492(%rsp)
	movb	1461(%rdx), %cl
	movb	%cl, 1493(%rsp)
	movb	1462(%rdx), %cl
	movb	%cl, 1494(%rsp)
	movb	1463(%rdx), %cl
	movb	%cl, 1495(%rsp)
	movb	1464(%rdx), %cl
	movb	%cl, 1496(%rsp)
	movb	1465(%rdx), %cl
	movb	%cl, 1497(%rsp)
	movb	1466(%rdx), %cl
	movb	%cl, 1498(%rsp)
	movb	1467(%rdx), %cl
	movb	%cl, 1499(%rsp)
	movb	1468(%rdx), %cl
	movb	%cl, 1500(%rsp)
	movb	1469(%rdx), %cl
	movb	%cl, 1501(%rsp)
	movb	1470(%rdx), %cl
	movb	%cl, 1502(%rsp)
	movb	1471(%rdx), %cl
	movb	%cl, 1503(%rsp)
	movb	1472(%rdx), %cl
	movb	%cl, 1504(%rsp)
	movb	1473(%rdx), %cl
	movb	%cl, 1505(%rsp)
	movb	1474(%rdx), %cl
	movb	%cl, 1506(%rsp)
	movb	1475(%rdx), %cl
	movb	%cl, 1507(%rsp)
	movb	1476(%rdx), %cl
	movb	%cl, 1508(%rsp)
	movb	1477(%rdx), %cl
	movb	%cl, 1509(%rsp)
	movb	1478(%rdx), %cl
	movb	%cl, 1510(%rsp)
	movb	1479(%rdx), %cl
	movb	%cl, 1511(%rsp)
	movb	1480(%rdx), %cl
	movb	%cl, 1512(%rsp)
	movb	1481(%rdx), %cl
	movb	%cl, 1513(%rsp)
	movb	1482(%rdx), %cl
	movb	%cl, 1514(%rsp)
	movb	1483(%rdx), %cl
	movb	%cl, 1515(%rsp)
	movb	1484(%rdx), %cl
	movb	%cl, 1516(%rsp)
	movb	1485(%rdx), %cl
	movb	%cl, 1517(%rsp)
	movb	1486(%rdx), %cl
	movb	%cl, 1518(%rsp)
	movb	1487(%rdx), %cl
	movb	%cl, 1519(%rsp)
	movb	1488(%rdx), %cl
	movb	%cl, 1520(%rsp)
	movb	1489(%rdx), %cl
	movb	%cl, 1521(%rsp)
	movb	1490(%rdx), %cl
	movb	%cl, 1522(%rsp)
	movb	1491(%rdx), %cl
	movb	%cl, 1523(%rsp)
	movb	1492(%rdx), %cl
	movb	%cl, 1524(%rsp)
	movb	1493(%rdx), %cl
	movb	%cl, 1525(%rsp)
	movb	1494(%rdx), %cl
	movb	%cl, 1526(%rsp)
	movb	1495(%rdx), %cl
	movb	%cl, 1527(%rsp)
	movb	1496(%rdx), %cl
	movb	%cl, 1528(%rsp)
	movb	1497(%rdx), %cl
	movb	%cl, 1529(%rsp)
	movb	1498(%rdx), %cl
	movb	%cl, 1530(%rsp)
	movb	1499(%rdx), %cl
	movb	%cl, 1531(%rsp)
	movb	1500(%rdx), %cl
	movb	%cl, 1532(%rsp)
	movb	1501(%rdx), %cl
	movb	%cl, 1533(%rsp)
	movb	1502(%rdx), %cl
	movb	%cl, 1534(%rsp)
	movb	1503(%rdx), %cl
	movb	%cl, 1535(%rsp)
	movb	1504(%rdx), %cl
	movb	%cl, 1536(%rsp)
	movb	1505(%rdx), %cl
	movb	%cl, 1537(%rsp)
	movb	1506(%rdx), %cl
	movb	%cl, 1538(%rsp)
	movb	1507(%rdx), %cl
	movb	%cl, 1539(%rsp)
	movb	1508(%rdx), %cl
	movb	%cl, 1540(%rsp)
	movb	1509(%rdx), %cl
	movb	%cl, 1541(%rsp)
	movb	1510(%rdx), %cl
	movb	%cl, 1542(%rsp)
	movb	1511(%rdx), %cl
	movb	%cl, 1543(%rsp)
	movb	1512(%rdx), %cl
	movb	%cl, 1544(%rsp)
	movb	1513(%rdx), %cl
	movb	%cl, 1545(%rsp)
	movb	1514(%rdx), %cl
	movb	%cl, 1546(%rsp)
	movb	1515(%rdx), %cl
	movb	%cl, 1547(%rsp)
	movb	1516(%rdx), %cl
	movb	%cl, 1548(%rsp)
	movb	1517(%rdx), %cl
	movb	%cl, 1549(%rsp)
	movb	1518(%rdx), %cl
	movb	%cl, 1550(%rsp)
	movb	1519(%rdx), %cl
	movb	%cl, 1551(%rsp)
	movb	1520(%rdx), %cl
	movb	%cl, 1552(%rsp)
	movb	1521(%rdx), %cl
	movb	%cl, 1553(%rsp)
	movb	1522(%rdx), %cl
	movb	%cl, 1554(%rsp)
	movb	1523(%rdx), %cl
	movb	%cl, 1555(%rsp)
	movb	1524(%rdx), %cl
	movb	%cl, 1556(%rsp)
	movb	1525(%rdx), %cl
	movb	%cl, 1557(%rsp)
	movb	1526(%rdx), %cl
	movb	%cl, 1558(%rsp)
	movb	1527(%rdx), %cl
	movb	%cl, 1559(%rsp)
	movb	1528(%rdx), %cl
	movb	%cl, 1560(%rsp)
	movb	1529(%rdx), %cl
	movb	%cl, 1561(%rsp)
	movb	1530(%rdx), %cl
	movb	%cl, 1562(%rsp)
	movb	1531(%rdx), %cl
	movb	%cl, 1563(%rsp)
	movb	1532(%rdx), %cl
	movb	%cl, 1564(%rsp)
	movb	1533(%rdx), %cl
	movb	%cl, 1565(%rsp)
	movb	1534(%rdx), %cl
	movb	%cl, 1566(%rsp)
	movb	1535(%rdx), %cl
	movb	%cl, 1567(%rsp)
	movb	1536(%rdx), %cl
	movb	%cl, 1568(%rsp)
	movb	1537(%rdx), %cl
	movb	%cl, 1569(%rsp)
	movb	1538(%rdx), %cl
	movb	%cl, 1570(%rsp)
	movb	1539(%rdx), %cl
	movb	%cl, 1571(%rsp)
	movb	1540(%rdx), %cl
	movb	%cl, 1572(%rsp)
	movb	1541(%rdx), %cl
	movb	%cl, 1573(%rsp)
	movb	1542(%rdx), %cl
	movb	%cl, 1574(%rsp)
	movb	1543(%rdx), %cl
	movb	%cl, 1575(%rsp)
	movb	1544(%rdx), %cl
	movb	%cl, 1576(%rsp)
	movb	1545(%rdx), %cl
	movb	%cl, 1577(%rsp)
	movb	1546(%rdx), %cl
	movb	%cl, 1578(%rsp)
	movb	1547(%rdx), %cl
	movb	%cl, 1579(%rsp)
	movb	1548(%rdx), %cl
	movb	%cl, 1580(%rsp)
	movb	1549(%rdx), %cl
	movb	%cl, 1581(%rsp)
	movb	1550(%rdx), %cl
	movb	%cl, 1582(%rsp)
	movb	1551(%rdx), %cl
	movb	%cl, 1583(%rsp)
	movb	1552(%rdx), %cl
	movb	%cl, 1584(%rsp)
	movb	1553(%rdx), %cl
	movb	%cl, 1585(%rsp)
	movb	1554(%rdx), %cl
	movb	%cl, 1586(%rsp)
	movb	1555(%rdx), %cl
	movb	%cl, 1587(%rsp)
	movb	1556(%rdx), %cl
	movb	%cl, 1588(%rsp)
	movb	1557(%rdx), %cl
	movb	%cl, 1589(%rsp)
	movb	1558(%rdx), %cl
	movb	%cl, 1590(%rsp)
	movb	1559(%rdx), %cl
	movb	%cl, 1591(%rsp)
	movb	1560(%rdx), %cl
	movb	%cl, 1592(%rsp)
	movb	1561(%rdx), %cl
	movb	%cl, 1593(%rsp)
	movb	1562(%rdx), %cl
	movb	%cl, 1594(%rsp)
	movb	1563(%rdx), %cl
	movb	%cl, 1595(%rsp)
	movb	1564(%rdx), %cl
	movb	%cl, 1596(%rsp)
	movb	1565(%rdx), %cl
	movb	%cl, 1597(%rsp)
	movb	1566(%rdx), %cl
	movb	%cl, 1598(%rsp)
	movb	1567(%rdx), %cl
	movb	%cl, 1599(%rsp)
	movb	1568(%rdx), %cl
	movb	%cl, 1600(%rsp)
	movb	1569(%rdx), %cl
	movb	%cl, 1601(%rsp)
	movb	1570(%rdx), %cl
	movb	%cl, 1602(%rsp)
	movb	1571(%rdx), %cl
	movb	%cl, 1603(%rsp)
	movb	1572(%rdx), %cl
	movb	%cl, 1604(%rsp)
	movb	1573(%rdx), %cl
	movb	%cl, 1605(%rsp)
	movb	1574(%rdx), %cl
	movb	%cl, 1606(%rsp)
	movb	1575(%rdx), %cl
	movb	%cl, 1607(%rsp)
	movb	1576(%rdx), %cl
	movb	%cl, 1608(%rsp)
	movb	1577(%rdx), %cl
	movb	%cl, 1609(%rsp)
	movb	1578(%rdx), %cl
	movb	%cl, 1610(%rsp)
	movb	1579(%rdx), %cl
	movb	%cl, 1611(%rsp)
	movb	1580(%rdx), %cl
	movb	%cl, 1612(%rsp)
	movb	1581(%rdx), %cl
	movb	%cl, 1613(%rsp)
	movb	1582(%rdx), %cl
	movb	%cl, 1614(%rsp)
	movb	1583(%rdx), %cl
	movb	%cl, 1615(%rsp)
	movb	1584(%rdx), %cl
	movb	%cl, 1616(%rsp)
	movb	1585(%rdx), %cl
	movb	%cl, 1617(%rsp)
	movb	1586(%rdx), %cl
	movb	%cl, 1618(%rsp)
	movb	1587(%rdx), %cl
	movb	%cl, 1619(%rsp)
	movb	1588(%rdx), %cl
	movb	%cl, 1620(%rsp)
	movb	1589(%rdx), %cl
	movb	%cl, 1621(%rsp)
	movb	1590(%rdx), %cl
	movb	%cl, 1622(%rsp)
	movb	1591(%rdx), %cl
	movb	%cl, 1623(%rsp)
	movb	1592(%rdx), %cl
	movb	%cl, 1624(%rsp)
	movb	1593(%rdx), %cl
	movb	%cl, 1625(%rsp)
	movb	1594(%rdx), %cl
	movb	%cl, 1626(%rsp)
	movb	1595(%rdx), %cl
	movb	%cl, 1627(%rsp)
	movb	1596(%rdx), %cl
	movb	%cl, 1628(%rsp)
	movb	1597(%rdx), %cl
	movb	%cl, 1629(%rsp)
	movb	1598(%rdx), %cl
	movb	%cl, 1630(%rsp)
	movb	1599(%rdx), %cl
	movb	%cl, 1631(%rsp)
	movb	1600(%rdx), %cl
	movb	%cl, 1632(%rsp)
	movb	1601(%rdx), %cl
	movb	%cl, 1633(%rsp)
	movb	1602(%rdx), %cl
	movb	%cl, 1634(%rsp)
	movb	1603(%rdx), %cl
	movb	%cl, 1635(%rsp)
	movb	1604(%rdx), %cl
	movb	%cl, 1636(%rsp)
	movb	1605(%rdx), %cl
	movb	%cl, 1637(%rsp)
	movb	1606(%rdx), %cl
	movb	%cl, 1638(%rsp)
	movb	1607(%rdx), %cl
	movb	%cl, 1639(%rsp)
	movb	1608(%rdx), %cl
	movb	%cl, 1640(%rsp)
	movb	1609(%rdx), %cl
	movb	%cl, 1641(%rsp)
	movb	1610(%rdx), %cl
	movb	%cl, 1642(%rsp)
	movb	1611(%rdx), %cl
	movb	%cl, 1643(%rsp)
	movb	1612(%rdx), %cl
	movb	%cl, 1644(%rsp)
	movb	1613(%rdx), %cl
	movb	%cl, 1645(%rsp)
	movb	1614(%rdx), %cl
	movb	%cl, 1646(%rsp)
	movb	1615(%rdx), %cl
	movb	%cl, 1647(%rsp)
	movb	1616(%rdx), %cl
	movb	%cl, 1648(%rsp)
	movb	1617(%rdx), %cl
	movb	%cl, 1649(%rsp)
	movb	1618(%rdx), %cl
	movb	%cl, 1650(%rsp)
	movb	1619(%rdx), %cl
	movb	%cl, 1651(%rsp)
	movb	1620(%rdx), %cl
	movb	%cl, 1652(%rsp)
	movb	1621(%rdx), %cl
	movb	%cl, 1653(%rsp)
	movb	1622(%rdx), %cl
	movb	%cl, 1654(%rsp)
	movb	1623(%rdx), %cl
	movb	%cl, 1655(%rsp)
	movb	1624(%rdx), %cl
	movb	%cl, 1656(%rsp)
	movb	1625(%rdx), %cl
	movb	%cl, 1657(%rsp)
	movb	1626(%rdx), %cl
	movb	%cl, 1658(%rsp)
	movb	1627(%rdx), %cl
	movb	%cl, 1659(%rsp)
	movb	1628(%rdx), %cl
	movb	%cl, 1660(%rsp)
	movb	1629(%rdx), %cl
	movb	%cl, 1661(%rsp)
	movb	1630(%rdx), %cl
	movb	%cl, 1662(%rsp)
	movb	1631(%rdx), %cl
	movb	%cl, 1663(%rsp)
	movb	1632(%rdx), %cl
	movb	%cl, 1664(%rsp)
	movb	1633(%rdx), %cl
	movb	%cl, 1665(%rsp)
	movb	1634(%rdx), %cl
	movb	%cl, 1666(%rsp)
	movb	1635(%rdx), %cl
	movb	%cl, 1667(%rsp)
	movb	1636(%rdx), %cl
	movb	%cl, 1668(%rsp)
	movb	1637(%rdx), %cl
	movb	%cl, 1669(%rsp)
	movb	1638(%rdx), %cl
	movb	%cl, 1670(%rsp)
	movb	1639(%rdx), %cl
	movb	%cl, 1671(%rsp)
	movb	1640(%rdx), %cl
	movb	%cl, 1672(%rsp)
	movb	1641(%rdx), %cl
	movb	%cl, 1673(%rsp)
	movb	1642(%rdx), %cl
	movb	%cl, 1674(%rsp)
	movb	1643(%rdx), %cl
	movb	%cl, 1675(%rsp)
	movb	1644(%rdx), %cl
	movb	%cl, 1676(%rsp)
	movb	1645(%rdx), %cl
	movb	%cl, 1677(%rsp)
	movb	1646(%rdx), %cl
	movb	%cl, 1678(%rsp)
	movb	1647(%rdx), %cl
	movb	%cl, 1679(%rsp)
	movb	1648(%rdx), %cl
	movb	%cl, 1680(%rsp)
	movb	1649(%rdx), %cl
	movb	%cl, 1681(%rsp)
	movb	1650(%rdx), %cl
	movb	%cl, 1682(%rsp)
	movb	1651(%rdx), %cl
	movb	%cl, 1683(%rsp)
	movb	1652(%rdx), %cl
	movb	%cl, 1684(%rsp)
	movb	1653(%rdx), %cl
	movb	%cl, 1685(%rsp)
	movb	1654(%rdx), %cl
	movb	%cl, 1686(%rsp)
	movb	1655(%rdx), %cl
	movb	%cl, 1687(%rsp)
	movb	1656(%rdx), %cl
	movb	%cl, 1688(%rsp)
	movb	1657(%rdx), %cl
	movb	%cl, 1689(%rsp)
	movb	1658(%rdx), %cl
	movb	%cl, 1690(%rsp)
	movb	1659(%rdx), %cl
	movb	%cl, 1691(%rsp)
	movb	1660(%rdx), %cl
	movb	%cl, 1692(%rsp)
	movb	1661(%rdx), %cl
	movb	%cl, 1693(%rsp)
	movb	1662(%rdx), %cl
	movb	%cl, 1694(%rsp)
	movb	1663(%rdx), %cl
	movb	%cl, 1695(%rsp)
	movb	1664(%rdx), %cl
	movb	%cl, 1696(%rsp)
	movb	1665(%rdx), %cl
	movb	%cl, 1697(%rsp)
	movb	1666(%rdx), %cl
	movb	%cl, 1698(%rsp)
	movb	1667(%rdx), %cl
	movb	%cl, 1699(%rsp)
	movb	1668(%rdx), %cl
	movb	%cl, 1700(%rsp)
	movb	1669(%rdx), %cl
	movb	%cl, 1701(%rsp)
	movb	1670(%rdx), %cl
	movb	%cl, 1702(%rsp)
	movb	1671(%rdx), %cl
	movb	%cl, 1703(%rsp)
	movb	1672(%rdx), %cl
	movb	%cl, 1704(%rsp)
	movb	1673(%rdx), %cl
	movb	%cl, 1705(%rsp)
	movb	1674(%rdx), %cl
	movb	%cl, 1706(%rsp)
	movb	1675(%rdx), %cl
	movb	%cl, 1707(%rsp)
	movb	1676(%rdx), %cl
	movb	%cl, 1708(%rsp)
	movb	1677(%rdx), %cl
	movb	%cl, 1709(%rsp)
	movb	1678(%rdx), %cl
	movb	%cl, 1710(%rsp)
	movb	1679(%rdx), %cl
	movb	%cl, 1711(%rsp)
	movb	1680(%rdx), %cl
	movb	%cl, 1712(%rsp)
	movb	1681(%rdx), %cl
	movb	%cl, 1713(%rsp)
	movb	1682(%rdx), %cl
	movb	%cl, 1714(%rsp)
	movb	1683(%rdx), %cl
	movb	%cl, 1715(%rsp)
	movb	1684(%rdx), %cl
	movb	%cl, 1716(%rsp)
	movb	1685(%rdx), %cl
	movb	%cl, 1717(%rsp)
	movb	1686(%rdx), %cl
	movb	%cl, 1718(%rsp)
	movb	1687(%rdx), %cl
	movb	%cl, 1719(%rsp)
	movb	1688(%rdx), %cl
	movb	%cl, 1720(%rsp)
	movb	1689(%rdx), %cl
	movb	%cl, 1721(%rsp)
	movb	1690(%rdx), %cl
	movb	%cl, 1722(%rsp)
	movb	1691(%rdx), %cl
	movb	%cl, 1723(%rsp)
	movb	1692(%rdx), %cl
	movb	%cl, 1724(%rsp)
	movb	1693(%rdx), %cl
	movb	%cl, 1725(%rsp)
	movb	1694(%rdx), %cl
	movb	%cl, 1726(%rsp)
	movb	1695(%rdx), %cl
	movb	%cl, 1727(%rsp)
	movb	1696(%rdx), %cl
	movb	%cl, 1728(%rsp)
	movb	1697(%rdx), %cl
	movb	%cl, 1729(%rsp)
	movb	1698(%rdx), %cl
	movb	%cl, 1730(%rsp)
	movb	1699(%rdx), %cl
	movb	%cl, 1731(%rsp)
	movb	1700(%rdx), %cl
	movb	%cl, 1732(%rsp)
	movb	1701(%rdx), %cl
	movb	%cl, 1733(%rsp)
	movb	1702(%rdx), %cl
	movb	%cl, 1734(%rsp)
	movb	1703(%rdx), %cl
	movb	%cl, 1735(%rsp)
	movb	1704(%rdx), %cl
	movb	%cl, 1736(%rsp)
	movb	1705(%rdx), %cl
	movb	%cl, 1737(%rsp)
	movb	1706(%rdx), %cl
	movb	%cl, 1738(%rsp)
	movb	1707(%rdx), %cl
	movb	%cl, 1739(%rsp)
	movb	1708(%rdx), %cl
	movb	%cl, 1740(%rsp)
	movb	1709(%rdx), %cl
	movb	%cl, 1741(%rsp)
	movb	1710(%rdx), %cl
	movb	%cl, 1742(%rsp)
	movb	1711(%rdx), %cl
	movb	%cl, 1743(%rsp)
	movb	1712(%rdx), %cl
	movb	%cl, 1744(%rsp)
	movb	1713(%rdx), %cl
	movb	%cl, 1745(%rsp)
	movb	1714(%rdx), %cl
	movb	%cl, 1746(%rsp)
	movb	1715(%rdx), %cl
	movb	%cl, 1747(%rsp)
	movb	1716(%rdx), %cl
	movb	%cl, 1748(%rsp)
	movb	1717(%rdx), %cl
	movb	%cl, 1749(%rsp)
	movb	1718(%rdx), %cl
	movb	%cl, 1750(%rsp)
	movb	1719(%rdx), %cl
	movb	%cl, 1751(%rsp)
	movb	1720(%rdx), %cl
	movb	%cl, 1752(%rsp)
	movb	1721(%rdx), %cl
	movb	%cl, 1753(%rsp)
	movb	1722(%rdx), %cl
	movb	%cl, 1754(%rsp)
	movb	1723(%rdx), %cl
	movb	%cl, 1755(%rsp)
	movb	1724(%rdx), %cl
	movb	%cl, 1756(%rsp)
	movb	1725(%rdx), %cl
	movb	%cl, 1757(%rsp)
	movb	1726(%rdx), %cl
	movb	%cl, 1758(%rsp)
	movb	1727(%rdx), %cl
	movb	%cl, 1759(%rsp)
	movb	1728(%rdx), %cl
	movb	%cl, 1760(%rsp)
	movb	1729(%rdx), %cl
	movb	%cl, 1761(%rsp)
	movb	1730(%rdx), %cl
	movb	%cl, 1762(%rsp)
	movb	1731(%rdx), %cl
	movb	%cl, 1763(%rsp)
	movb	1732(%rdx), %cl
	movb	%cl, 1764(%rsp)
	movb	1733(%rdx), %cl
	movb	%cl, 1765(%rsp)
	movb	1734(%rdx), %cl
	movb	%cl, 1766(%rsp)
	movb	1735(%rdx), %cl
	movb	%cl, 1767(%rsp)
	movb	1736(%rdx), %cl
	movb	%cl, 1768(%rsp)
	movb	1737(%rdx), %cl
	movb	%cl, 1769(%rsp)
	movb	1738(%rdx), %cl
	movb	%cl, 1770(%rsp)
	movb	1739(%rdx), %cl
	movb	%cl, 1771(%rsp)
	movb	1740(%rdx), %cl
	movb	%cl, 1772(%rsp)
	movb	1741(%rdx), %cl
	movb	%cl, 1773(%rsp)
	movb	1742(%rdx), %cl
	movb	%cl, 1774(%rsp)
	movb	1743(%rdx), %cl
	movb	%cl, 1775(%rsp)
	movb	1744(%rdx), %cl
	movb	%cl, 1776(%rsp)
	movb	1745(%rdx), %cl
	movb	%cl, 1777(%rsp)
	movb	1746(%rdx), %cl
	movb	%cl, 1778(%rsp)
	movb	1747(%rdx), %cl
	movb	%cl, 1779(%rsp)
	movb	1748(%rdx), %cl
	movb	%cl, 1780(%rsp)
	movb	1749(%rdx), %cl
	movb	%cl, 1781(%rsp)
	movb	1750(%rdx), %cl
	movb	%cl, 1782(%rsp)
	movb	1751(%rdx), %cl
	movb	%cl, 1783(%rsp)
	movb	1752(%rdx), %cl
	movb	%cl, 1784(%rsp)
	movb	1753(%rdx), %cl
	movb	%cl, 1785(%rsp)
	movb	1754(%rdx), %cl
	movb	%cl, 1786(%rsp)
	movb	1755(%rdx), %cl
	movb	%cl, 1787(%rsp)
	movb	1756(%rdx), %cl
	movb	%cl, 1788(%rsp)
	movb	1757(%rdx), %cl
	movb	%cl, 1789(%rsp)
	movb	1758(%rdx), %cl
	movb	%cl, 1790(%rsp)
	movb	1759(%rdx), %cl
	movb	%cl, 1791(%rsp)
	movb	1760(%rdx), %cl
	movb	%cl, 1792(%rsp)
	movb	1761(%rdx), %cl
	movb	%cl, 1793(%rsp)
	movb	1762(%rdx), %cl
	movb	%cl, 1794(%rsp)
	movb	1763(%rdx), %cl
	movb	%cl, 1795(%rsp)
	movb	1764(%rdx), %cl
	movb	%cl, 1796(%rsp)
	movb	1765(%rdx), %cl
	movb	%cl, 1797(%rsp)
	movb	1766(%rdx), %cl
	movb	%cl, 1798(%rsp)
	movb	1767(%rdx), %cl
	movb	%cl, 1799(%rsp)
	movb	1768(%rdx), %cl
	movb	%cl, 1800(%rsp)
	movb	1769(%rdx), %cl
	movb	%cl, 1801(%rsp)
	movb	1770(%rdx), %cl
	movb	%cl, 1802(%rsp)
	movb	1771(%rdx), %cl
	movb	%cl, 1803(%rsp)
	movb	1772(%rdx), %cl
	movb	%cl, 1804(%rsp)
	movb	1773(%rdx), %cl
	movb	%cl, 1805(%rsp)
	movb	1774(%rdx), %cl
	movb	%cl, 1806(%rsp)
	movb	1775(%rdx), %cl
	movb	%cl, 1807(%rsp)
	movb	1776(%rdx), %cl
	movb	%cl, 1808(%rsp)
	movb	1777(%rdx), %cl
	movb	%cl, 1809(%rsp)
	movb	1778(%rdx), %cl
	movb	%cl, 1810(%rsp)
	movb	1779(%rdx), %cl
	movb	%cl, 1811(%rsp)
	movb	1780(%rdx), %cl
	movb	%cl, 1812(%rsp)
	movb	1781(%rdx), %cl
	movb	%cl, 1813(%rsp)
	movb	1782(%rdx), %cl
	movb	%cl, 1814(%rsp)
	movb	1783(%rdx), %cl
	movb	%cl, 1815(%rsp)
	movb	1784(%rdx), %cl
	movb	%cl, 1816(%rsp)
	movb	1785(%rdx), %cl
	movb	%cl, 1817(%rsp)
	movb	1786(%rdx), %cl
	movb	%cl, 1818(%rsp)
	movb	1787(%rdx), %cl
	movb	%cl, 1819(%rsp)
	movb	1788(%rdx), %cl
	movb	%cl, 1820(%rsp)
	movb	1789(%rdx), %cl
	movb	%cl, 1821(%rsp)
	movb	1790(%rdx), %cl
	movb	%cl, 1822(%rsp)
	movb	1791(%rdx), %cl
	movb	%cl, 1823(%rsp)
	movb	1792(%rdx), %cl
	movb	%cl, 1824(%rsp)
	movb	1793(%rdx), %cl
	movb	%cl, 1825(%rsp)
	movb	1794(%rdx), %cl
	movb	%cl, 1826(%rsp)
	movb	1795(%rdx), %cl
	movb	%cl, 1827(%rsp)
	movb	1796(%rdx), %cl
	movb	%cl, 1828(%rsp)
	movb	1797(%rdx), %cl
	movb	%cl, 1829(%rsp)
	movb	1798(%rdx), %cl
	movb	%cl, 1830(%rsp)
	movb	1799(%rdx), %cl
	movb	%cl, 1831(%rsp)
	movb	1800(%rdx), %cl
	movb	%cl, 1832(%rsp)
	movb	1801(%rdx), %cl
	movb	%cl, 1833(%rsp)
	movb	1802(%rdx), %cl
	movb	%cl, 1834(%rsp)
	movb	1803(%rdx), %cl
	movb	%cl, 1835(%rsp)
	movb	1804(%rdx), %cl
	movb	%cl, 1836(%rsp)
	movb	1805(%rdx), %cl
	movb	%cl, 1837(%rsp)
	movb	1806(%rdx), %cl
	movb	%cl, 1838(%rsp)
	movb	1807(%rdx), %cl
	movb	%cl, 1839(%rsp)
	movb	1808(%rdx), %cl
	movb	%cl, 1840(%rsp)
	movb	1809(%rdx), %cl
	movb	%cl, 1841(%rsp)
	movb	1810(%rdx), %cl
	movb	%cl, 1842(%rsp)
	movb	1811(%rdx), %cl
	movb	%cl, 1843(%rsp)
	movb	1812(%rdx), %cl
	movb	%cl, 1844(%rsp)
	movb	1813(%rdx), %cl
	movb	%cl, 1845(%rsp)
	movb	1814(%rdx), %cl
	movb	%cl, 1846(%rsp)
	movb	1815(%rdx), %cl
	movb	%cl, 1847(%rsp)
	movb	1816(%rdx), %cl
	movb	%cl, 1848(%rsp)
	movb	1817(%rdx), %cl
	movb	%cl, 1849(%rsp)
	movb	1818(%rdx), %cl
	movb	%cl, 1850(%rsp)
	movb	1819(%rdx), %cl
	movb	%cl, 1851(%rsp)
	movb	1820(%rdx), %cl
	movb	%cl, 1852(%rsp)
	movb	1821(%rdx), %cl
	movb	%cl, 1853(%rsp)
	movb	1822(%rdx), %cl
	movb	%cl, 1854(%rsp)
	movb	1823(%rdx), %cl
	movb	%cl, 1855(%rsp)
	movb	1824(%rdx), %cl
	movb	%cl, 1856(%rsp)
	movb	1825(%rdx), %cl
	movb	%cl, 1857(%rsp)
	movb	1826(%rdx), %cl
	movb	%cl, 1858(%rsp)
	movb	1827(%rdx), %cl
	movb	%cl, 1859(%rsp)
	movb	1828(%rdx), %cl
	movb	%cl, 1860(%rsp)
	movb	1829(%rdx), %cl
	movb	%cl, 1861(%rsp)
	movb	1830(%rdx), %cl
	movb	%cl, 1862(%rsp)
	movb	1831(%rdx), %cl
	movb	%cl, 1863(%rsp)
	movb	1832(%rdx), %cl
	movb	%cl, 1864(%rsp)
	movb	1833(%rdx), %cl
	movb	%cl, 1865(%rsp)
	movb	1834(%rdx), %cl
	movb	%cl, 1866(%rsp)
	movb	1835(%rdx), %cl
	movb	%cl, 1867(%rsp)
	movb	1836(%rdx), %cl
	movb	%cl, 1868(%rsp)
	movb	1837(%rdx), %cl
	movb	%cl, 1869(%rsp)
	movb	1838(%rdx), %cl
	movb	%cl, 1870(%rsp)
	movb	1839(%rdx), %cl
	movb	%cl, 1871(%rsp)
	movb	1840(%rdx), %cl
	movb	%cl, 1872(%rsp)
	movb	1841(%rdx), %cl
	movb	%cl, 1873(%rsp)
	movb	1842(%rdx), %cl
	movb	%cl, 1874(%rsp)
	movb	1843(%rdx), %cl
	movb	%cl, 1875(%rsp)
	movb	1844(%rdx), %cl
	movb	%cl, 1876(%rsp)
	movb	1845(%rdx), %cl
	movb	%cl, 1877(%rsp)
	movb	1846(%rdx), %cl
	movb	%cl, 1878(%rsp)
	movb	1847(%rdx), %cl
	movb	%cl, 1879(%rsp)
	movb	1848(%rdx), %cl
	movb	%cl, 1880(%rsp)
	movb	1849(%rdx), %cl
	movb	%cl, 1881(%rsp)
	movb	1850(%rdx), %cl
	movb	%cl, 1882(%rsp)
	movb	1851(%rdx), %cl
	movb	%cl, 1883(%rsp)
	movb	1852(%rdx), %cl
	movb	%cl, 1884(%rsp)
	movb	1853(%rdx), %cl
	movb	%cl, 1885(%rsp)
	movb	1854(%rdx), %cl
	movb	%cl, 1886(%rsp)
	movb	1855(%rdx), %cl
	movb	%cl, 1887(%rsp)
	movb	1856(%rdx), %cl
	movb	%cl, 1888(%rsp)
	movb	1857(%rdx), %cl
	movb	%cl, 1889(%rsp)
	movb	1858(%rdx), %cl
	movb	%cl, 1890(%rsp)
	movb	1859(%rdx), %cl
	movb	%cl, 1891(%rsp)
	movb	1860(%rdx), %cl
	movb	%cl, 1892(%rsp)
	movb	1861(%rdx), %cl
	movb	%cl, 1893(%rsp)
	movb	1862(%rdx), %cl
	movb	%cl, 1894(%rsp)
	movb	1863(%rdx), %cl
	movb	%cl, 1895(%rsp)
	movb	1864(%rdx), %cl
	movb	%cl, 1896(%rsp)
	movb	1865(%rdx), %cl
	movb	%cl, 1897(%rsp)
	movb	1866(%rdx), %cl
	movb	%cl, 1898(%rsp)
	movb	1867(%rdx), %cl
	movb	%cl, 1899(%rsp)
	movb	1868(%rdx), %cl
	movb	%cl, 1900(%rsp)
	movb	1869(%rdx), %cl
	movb	%cl, 1901(%rsp)
	movb	1870(%rdx), %cl
	movb	%cl, 1902(%rsp)
	movb	1871(%rdx), %cl
	movb	%cl, 1903(%rsp)
	movb	1872(%rdx), %cl
	movb	%cl, 1904(%rsp)
	movb	1873(%rdx), %cl
	movb	%cl, 1905(%rsp)
	movb	1874(%rdx), %cl
	movb	%cl, 1906(%rsp)
	movb	1875(%rdx), %cl
	movb	%cl, 1907(%rsp)
	movb	1876(%rdx), %cl
	movb	%cl, 1908(%rsp)
	movb	1877(%rdx), %cl
	movb	%cl, 1909(%rsp)
	movb	1878(%rdx), %cl
	movb	%cl, 1910(%rsp)
	movb	1879(%rdx), %cl
	movb	%cl, 1911(%rsp)
	movb	1880(%rdx), %cl
	movb	%cl, 1912(%rsp)
	movb	1881(%rdx), %cl
	movb	%cl, 1913(%rsp)
	movb	1882(%rdx), %cl
	movb	%cl, 1914(%rsp)
	movb	1883(%rdx), %cl
	movb	%cl, 1915(%rsp)
	movb	1884(%rdx), %cl
	movb	%cl, 1916(%rsp)
	movb	1885(%rdx), %cl
	movb	%cl, 1917(%rsp)
	movb	1886(%rdx), %cl
	movb	%cl, 1918(%rsp)
	movb	1887(%rdx), %cl
	movb	%cl, 1919(%rsp)
	movb	1888(%rdx), %cl
	movb	%cl, 1920(%rsp)
	movb	1889(%rdx), %cl
	movb	%cl, 1921(%rsp)
	movb	1890(%rdx), %cl
	movb	%cl, 1922(%rsp)
	movb	1891(%rdx), %cl
	movb	%cl, 1923(%rsp)
	movb	1892(%rdx), %cl
	movb	%cl, 1924(%rsp)
	movb	1893(%rdx), %cl
	movb	%cl, 1925(%rsp)
	movb	1894(%rdx), %cl
	movb	%cl, 1926(%rsp)
	movb	1895(%rdx), %cl
	movb	%cl, 1927(%rsp)
	movb	1896(%rdx), %cl
	movb	%cl, 1928(%rsp)
	movb	1897(%rdx), %cl
	movb	%cl, 1929(%rsp)
	movb	1898(%rdx), %cl
	movb	%cl, 1930(%rsp)
	movb	1899(%rdx), %cl
	movb	%cl, 1931(%rsp)
	movb	1900(%rdx), %cl
	movb	%cl, 1932(%rsp)
	movb	1901(%rdx), %cl
	movb	%cl, 1933(%rsp)
	movb	1902(%rdx), %cl
	movb	%cl, 1934(%rsp)
	movb	1903(%rdx), %cl
	movb	%cl, 1935(%rsp)
	movb	1904(%rdx), %cl
	movb	%cl, 1936(%rsp)
	movb	1905(%rdx), %cl
	movb	%cl, 1937(%rsp)
	movb	1906(%rdx), %cl
	movb	%cl, 1938(%rsp)
	movb	1907(%rdx), %cl
	movb	%cl, 1939(%rsp)
	movb	1908(%rdx), %cl
	movb	%cl, 1940(%rsp)
	movb	1909(%rdx), %cl
	movb	%cl, 1941(%rsp)
	movb	1910(%rdx), %cl
	movb	%cl, 1942(%rsp)
	movb	1911(%rdx), %cl
	movb	%cl, 1943(%rsp)
	movb	1912(%rdx), %cl
	movb	%cl, 1944(%rsp)
	movb	1913(%rdx), %cl
	movb	%cl, 1945(%rsp)
	movb	1914(%rdx), %cl
	movb	%cl, 1946(%rsp)
	movb	1915(%rdx), %cl
	movb	%cl, 1947(%rsp)
	movb	1916(%rdx), %cl
	movb	%cl, 1948(%rsp)
	movb	1917(%rdx), %cl
	movb	%cl, 1949(%rsp)
	movb	1918(%rdx), %cl
	movb	%cl, 1950(%rsp)
	movb	1919(%rdx), %cl
	movb	%cl, 1951(%rsp)
	movb	1920(%rdx), %cl
	movb	%cl, 1952(%rsp)
	movb	1921(%rdx), %cl
	movb	%cl, 1953(%rsp)
	movb	1922(%rdx), %cl
	movb	%cl, 1954(%rsp)
	movb	1923(%rdx), %cl
	movb	%cl, 1955(%rsp)
	movb	1924(%rdx), %cl
	movb	%cl, 1956(%rsp)
	movb	1925(%rdx), %cl
	movb	%cl, 1957(%rsp)
	movb	1926(%rdx), %cl
	movb	%cl, 1958(%rsp)
	movb	1927(%rdx), %cl
	movb	%cl, 1959(%rsp)
	movb	1928(%rdx), %cl
	movb	%cl, 1960(%rsp)
	movb	1929(%rdx), %cl
	movb	%cl, 1961(%rsp)
	movb	1930(%rdx), %cl
	movb	%cl, 1962(%rsp)
	movb	1931(%rdx), %cl
	movb	%cl, 1963(%rsp)
	movb	1932(%rdx), %cl
	movb	%cl, 1964(%rsp)
	movb	1933(%rdx), %cl
	movb	%cl, 1965(%rsp)
	movb	1934(%rdx), %cl
	movb	%cl, 1966(%rsp)
	movb	1935(%rdx), %cl
	movb	%cl, 1967(%rsp)
	movb	1936(%rdx), %cl
	movb	%cl, 1968(%rsp)
	movb	1937(%rdx), %cl
	movb	%cl, 1969(%rsp)
	movb	1938(%rdx), %cl
	movb	%cl, 1970(%rsp)
	movb	1939(%rdx), %cl
	movb	%cl, 1971(%rsp)
	movb	1940(%rdx), %cl
	movb	%cl, 1972(%rsp)
	movb	1941(%rdx), %cl
	movb	%cl, 1973(%rsp)
	movb	1942(%rdx), %cl
	movb	%cl, 1974(%rsp)
	movb	1943(%rdx), %cl
	movb	%cl, 1975(%rsp)
	movb	1944(%rdx), %cl
	movb	%cl, 1976(%rsp)
	movb	1945(%rdx), %cl
	movb	%cl, 1977(%rsp)
	movb	1946(%rdx), %cl
	movb	%cl, 1978(%rsp)
	movb	1947(%rdx), %cl
	movb	%cl, 1979(%rsp)
	movb	1948(%rdx), %cl
	movb	%cl, 1980(%rsp)
	movb	1949(%rdx), %cl
	movb	%cl, 1981(%rsp)
	movb	1950(%rdx), %cl
	movb	%cl, 1982(%rsp)
	movb	1951(%rdx), %cl
	movb	%cl, 1983(%rsp)
	movb	1952(%rdx), %cl
	movb	%cl, 1984(%rsp)
	movb	1953(%rdx), %cl
	movb	%cl, 1985(%rsp)
	movb	1954(%rdx), %cl
	movb	%cl, 1986(%rsp)
	movb	1955(%rdx), %cl
	movb	%cl, 1987(%rsp)
	movb	1956(%rdx), %cl
	movb	%cl, 1988(%rsp)
	movb	1957(%rdx), %cl
	movb	%cl, 1989(%rsp)
	movb	1958(%rdx), %cl
	movb	%cl, 1990(%rsp)
	movb	1959(%rdx), %cl
	movb	%cl, 1991(%rsp)
	movb	1960(%rdx), %cl
	movb	%cl, 1992(%rsp)
	movb	1961(%rdx), %cl
	movb	%cl, 1993(%rsp)
	movb	1962(%rdx), %cl
	movb	%cl, 1994(%rsp)
	movb	1963(%rdx), %cl
	movb	%cl, 1995(%rsp)
	movb	1964(%rdx), %cl
	movb	%cl, 1996(%rsp)
	movb	1965(%rdx), %cl
	movb	%cl, 1997(%rsp)
	movb	1966(%rdx), %cl
	movb	%cl, 1998(%rsp)
	movb	1967(%rdx), %cl
	movb	%cl, 1999(%rsp)
	movb	1968(%rdx), %cl
	movb	%cl, 2000(%rsp)
	movb	1969(%rdx), %cl
	movb	%cl, 2001(%rsp)
	movb	1970(%rdx), %cl
	movb	%cl, 2002(%rsp)
	movb	1971(%rdx), %cl
	movb	%cl, 2003(%rsp)
	movb	1972(%rdx), %cl
	movb	%cl, 2004(%rsp)
	movb	1973(%rdx), %cl
	movb	%cl, 2005(%rsp)
	movb	1974(%rdx), %cl
	movb	%cl, 2006(%rsp)
	movb	1975(%rdx), %cl
	movb	%cl, 2007(%rsp)
	movb	1976(%rdx), %cl
	movb	%cl, 2008(%rsp)
	movb	1977(%rdx), %cl
	movb	%cl, 2009(%rsp)
	movb	1978(%rdx), %cl
	movb	%cl, 2010(%rsp)
	movb	1979(%rdx), %cl
	movb	%cl, 2011(%rsp)
	movb	1980(%rdx), %cl
	movb	%cl, 2012(%rsp)
	movb	1981(%rdx), %cl
	movb	%cl, 2013(%rsp)
	movb	1982(%rdx), %cl
	movb	%cl, 2014(%rsp)
	movb	1983(%rdx), %cl
	movb	%cl, 2015(%rsp)
	movb	1984(%rdx), %cl
	movb	%cl, 2016(%rsp)
	movb	1985(%rdx), %cl
	movb	%cl, 2017(%rsp)
	movb	1986(%rdx), %cl
	movb	%cl, 2018(%rsp)
	movb	1987(%rdx), %cl
	movb	%cl, 2019(%rsp)
	movb	1988(%rdx), %cl
	movb	%cl, 2020(%rsp)
	movb	1989(%rdx), %cl
	movb	%cl, 2021(%rsp)
	movb	1990(%rdx), %cl
	movb	%cl, 2022(%rsp)
	movb	1991(%rdx), %cl
	movb	%cl, 2023(%rsp)
	movb	1992(%rdx), %cl
	movb	%cl, 2024(%rsp)
	movb	1993(%rdx), %cl
	movb	%cl, 2025(%rsp)
	movb	1994(%rdx), %cl
	movb	%cl, 2026(%rsp)
	movb	1995(%rdx), %cl
	movb	%cl, 2027(%rsp)
	movb	1996(%rdx), %cl
	movb	%cl, 2028(%rsp)
	movb	1997(%rdx), %cl
	movb	%cl, 2029(%rsp)
	movb	1998(%rdx), %cl
	movb	%cl, 2030(%rsp)
	movb	1999(%rdx), %cl
	movb	%cl, 2031(%rsp)
	movb	2000(%rdx), %cl
	movb	%cl, 2032(%rsp)
	movb	2001(%rdx), %cl
	movb	%cl, 2033(%rsp)
	movb	2002(%rdx), %cl
	movb	%cl, 2034(%rsp)
	movb	2003(%rdx), %cl
	movb	%cl, 2035(%rsp)
	movb	2004(%rdx), %cl
	movb	%cl, 2036(%rsp)
	movb	2005(%rdx), %cl
	movb	%cl, 2037(%rsp)
	movb	2006(%rdx), %cl
	movb	%cl, 2038(%rsp)
	movb	2007(%rdx), %cl
	movb	%cl, 2039(%rsp)
	movb	2008(%rdx), %cl
	movb	%cl, 2040(%rsp)
	movb	2009(%rdx), %cl
	movb	%cl, 2041(%rsp)
	movb	2010(%rdx), %cl
	movb	%cl, 2042(%rsp)
	movb	2011(%rdx), %cl
	movb	%cl, 2043(%rsp)
	movb	2012(%rdx), %cl
	movb	%cl, 2044(%rsp)
	movb	2013(%rdx), %cl
	movb	%cl, 2045(%rsp)
	movb	2014(%rdx), %cl
	movb	%cl, 2046(%rsp)
	movb	2015(%rdx), %cl
	movb	%cl, 2047(%rsp)
	movb	2016(%rdx), %cl
	movb	%cl, 2048(%rsp)
	movb	2017(%rdx), %cl
	movb	%cl, 2049(%rsp)
	movb	2018(%rdx), %cl
	movb	%cl, 2050(%rsp)
	movb	2019(%rdx), %cl
	movb	%cl, 2051(%rsp)
	movb	2020(%rdx), %cl
	movb	%cl, 2052(%rsp)
	movb	2021(%rdx), %cl
	movb	%cl, 2053(%rsp)
	movb	2022(%rdx), %cl
	movb	%cl, 2054(%rsp)
	movb	2023(%rdx), %cl
	movb	%cl, 2055(%rsp)
	movb	2024(%rdx), %cl
	movb	%cl, 2056(%rsp)
	movb	2025(%rdx), %cl
	movb	%cl, 2057(%rsp)
	movb	2026(%rdx), %cl
	movb	%cl, 2058(%rsp)
	movb	2027(%rdx), %cl
	movb	%cl, 2059(%rsp)
	movb	2028(%rdx), %cl
	movb	%cl, 2060(%rsp)
	movb	2029(%rdx), %cl
	movb	%cl, 2061(%rsp)
	movb	2030(%rdx), %cl
	movb	%cl, 2062(%rsp)
	movb	2031(%rdx), %cl
	movb	%cl, 2063(%rsp)
	movb	2032(%rdx), %cl
	movb	%cl, 2064(%rsp)
	movb	2033(%rdx), %cl
	movb	%cl, 2065(%rsp)
	movb	2034(%rdx), %cl
	movb	%cl, 2066(%rsp)
	movb	2035(%rdx), %cl
	movb	%cl, 2067(%rsp)
	movb	2036(%rdx), %cl
	movb	%cl, 2068(%rsp)
	movb	2037(%rdx), %cl
	movb	%cl, 2069(%rsp)
	movb	2038(%rdx), %cl
	movb	%cl, 2070(%rsp)
	movb	2039(%rdx), %cl
	movb	%cl, 2071(%rsp)
	movb	2040(%rdx), %cl
	movb	%cl, 2072(%rsp)
	movb	2041(%rdx), %cl
	movb	%cl, 2073(%rsp)
	movb	2042(%rdx), %cl
	movb	%cl, 2074(%rsp)
	movb	2043(%rdx), %cl
	movb	%cl, 2075(%rsp)
	movb	2044(%rdx), %cl
	movb	%cl, 2076(%rsp)
	movb	2045(%rdx), %cl
	movb	%cl, 2077(%rsp)
	movb	2046(%rdx), %cl
	movb	%cl, 2078(%rsp)
	movb	2047(%rdx), %cl
	movb	%cl, 2079(%rsp)
	movb	2048(%rdx), %cl
	movb	%cl, 2080(%rsp)
	movb	2049(%rdx), %cl
	movb	%cl, 2081(%rsp)
	movb	2050(%rdx), %cl
	movb	%cl, 2082(%rsp)
	movb	2051(%rdx), %cl
	movb	%cl, 2083(%rsp)
	movb	2052(%rdx), %cl
	movb	%cl, 2084(%rsp)
	movb	2053(%rdx), %cl
	movb	%cl, 2085(%rsp)
	movb	2054(%rdx), %cl
	movb	%cl, 2086(%rsp)
	movb	2055(%rdx), %cl
	movb	%cl, 2087(%rsp)
	movb	2056(%rdx), %cl
	movb	%cl, 2088(%rsp)
	movb	2057(%rdx), %cl
	movb	%cl, 2089(%rsp)
	movb	2058(%rdx), %cl
	movb	%cl, 2090(%rsp)
	movb	2059(%rdx), %cl
	movb	%cl, 2091(%rsp)
	movb	2060(%rdx), %cl
	movb	%cl, 2092(%rsp)
	movb	2061(%rdx), %cl
	movb	%cl, 2093(%rsp)
	movb	2062(%rdx), %cl
	movb	%cl, 2094(%rsp)
	movb	2063(%rdx), %cl
	movb	%cl, 2095(%rsp)
	movb	2064(%rdx), %cl
	movb	%cl, 2096(%rsp)
	movb	2065(%rdx), %cl
	movb	%cl, 2097(%rsp)
	movb	2066(%rdx), %cl
	movb	%cl, 2098(%rsp)
	movb	2067(%rdx), %cl
	movb	%cl, 2099(%rsp)
	movb	2068(%rdx), %cl
	movb	%cl, 2100(%rsp)
	movb	2069(%rdx), %cl
	movb	%cl, 2101(%rsp)
	movb	2070(%rdx), %cl
	movb	%cl, 2102(%rsp)
	movb	2071(%rdx), %cl
	movb	%cl, 2103(%rsp)
	movb	2072(%rdx), %cl
	movb	%cl, 2104(%rsp)
	movb	2073(%rdx), %cl
	movb	%cl, 2105(%rsp)
	movb	2074(%rdx), %cl
	movb	%cl, 2106(%rsp)
	movb	2075(%rdx), %cl
	movb	%cl, 2107(%rsp)
	movb	2076(%rdx), %cl
	movb	%cl, 2108(%rsp)
	movb	2077(%rdx), %cl
	movb	%cl, 2109(%rsp)
	movb	2078(%rdx), %cl
	movb	%cl, 2110(%rsp)
	movb	2079(%rdx), %cl
	movb	%cl, 2111(%rsp)
	movb	2080(%rdx), %cl
	movb	%cl, 2112(%rsp)
	movb	2081(%rdx), %cl
	movb	%cl, 2113(%rsp)
	movb	2082(%rdx), %cl
	movb	%cl, 2114(%rsp)
	movb	2083(%rdx), %cl
	movb	%cl, 2115(%rsp)
	movb	2084(%rdx), %cl
	movb	%cl, 2116(%rsp)
	movb	2085(%rdx), %cl
	movb	%cl, 2117(%rsp)
	movb	2086(%rdx), %cl
	movb	%cl, 2118(%rsp)
	movb	2087(%rdx), %cl
	movb	%cl, 2119(%rsp)
	movb	2088(%rdx), %cl
	movb	%cl, 2120(%rsp)
	movb	2089(%rdx), %cl
	movb	%cl, 2121(%rsp)
	movb	2090(%rdx), %cl
	movb	%cl, 2122(%rsp)
	movb	2091(%rdx), %cl
	movb	%cl, 2123(%rsp)
	movb	2092(%rdx), %cl
	movb	%cl, 2124(%rsp)
	movb	2093(%rdx), %cl
	movb	%cl, 2125(%rsp)
	movb	2094(%rdx), %cl
	movb	%cl, 2126(%rsp)
	movb	2095(%rdx), %cl
	movb	%cl, 2127(%rsp)
	movb	2096(%rdx), %cl
	movb	%cl, 2128(%rsp)
	movb	2097(%rdx), %cl
	movb	%cl, 2129(%rsp)
	movb	2098(%rdx), %cl
	movb	%cl, 2130(%rsp)
	movb	2099(%rdx), %cl
	movb	%cl, 2131(%rsp)
	movb	2100(%rdx), %cl
	movb	%cl, 2132(%rsp)
	movb	2101(%rdx), %cl
	movb	%cl, 2133(%rsp)
	movb	2102(%rdx), %cl
	movb	%cl, 2134(%rsp)
	movb	2103(%rdx), %cl
	movb	%cl, 2135(%rsp)
	movb	2104(%rdx), %cl
	movb	%cl, 2136(%rsp)
	movb	2105(%rdx), %cl
	movb	%cl, 2137(%rsp)
	movb	2106(%rdx), %cl
	movb	%cl, 2138(%rsp)
	movb	2107(%rdx), %cl
	movb	%cl, 2139(%rsp)
	movb	2108(%rdx), %cl
	movb	%cl, 2140(%rsp)
	movb	2109(%rdx), %cl
	movb	%cl, 2141(%rsp)
	movb	2110(%rdx), %cl
	movb	%cl, 2142(%rsp)
	movb	2111(%rdx), %cl
	movb	%cl, 2143(%rsp)
	movb	2112(%rdx), %cl
	movb	%cl, 2144(%rsp)
	movb	2113(%rdx), %cl
	movb	%cl, 2145(%rsp)
	movb	2114(%rdx), %cl
	movb	%cl, 2146(%rsp)
	movb	2115(%rdx), %cl
	movb	%cl, 2147(%rsp)
	movb	2116(%rdx), %cl
	movb	%cl, 2148(%rsp)
	movb	2117(%rdx), %cl
	movb	%cl, 2149(%rsp)
	movb	2118(%rdx), %cl
	movb	%cl, 2150(%rsp)
	movb	2119(%rdx), %cl
	movb	%cl, 2151(%rsp)
	movb	2120(%rdx), %cl
	movb	%cl, 2152(%rsp)
	movb	2121(%rdx), %cl
	movb	%cl, 2153(%rsp)
	movb	2122(%rdx), %cl
	movb	%cl, 2154(%rsp)
	movb	2123(%rdx), %cl
	movb	%cl, 2155(%rsp)
	movb	2124(%rdx), %cl
	movb	%cl, 2156(%rsp)
	movb	2125(%rdx), %cl
	movb	%cl, 2157(%rsp)
	movb	2126(%rdx), %cl
	movb	%cl, 2158(%rsp)
	movb	2127(%rdx), %cl
	movb	%cl, 2159(%rsp)
	movb	2128(%rdx), %cl
	movb	%cl, 2160(%rsp)
	movb	2129(%rdx), %cl
	movb	%cl, 2161(%rsp)
	movb	2130(%rdx), %cl
	movb	%cl, 2162(%rsp)
	movb	2131(%rdx), %cl
	movb	%cl, 2163(%rsp)
	movb	2132(%rdx), %cl
	movb	%cl, 2164(%rsp)
	movb	2133(%rdx), %cl
	movb	%cl, 2165(%rsp)
	movb	2134(%rdx), %cl
	movb	%cl, 2166(%rsp)
	movb	2135(%rdx), %cl
	movb	%cl, 2167(%rsp)
	movb	2136(%rdx), %cl
	movb	%cl, 2168(%rsp)
	movb	2137(%rdx), %cl
	movb	%cl, 2169(%rsp)
	movb	2138(%rdx), %cl
	movb	%cl, 2170(%rsp)
	movb	2139(%rdx), %cl
	movb	%cl, 2171(%rsp)
	movb	2140(%rdx), %cl
	movb	%cl, 2172(%rsp)
	movb	2141(%rdx), %cl
	movb	%cl, 2173(%rsp)
	movb	2142(%rdx), %cl
	movb	%cl, 2174(%rsp)
	movb	2143(%rdx), %cl
	movb	%cl, 2175(%rsp)
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
	movl	2236(%rsp,%rax,4), %ecx
	movl	$15, %eax
	subl	%ecx, %eax
	leaq	32(%rsp,%rdx), %rdi
	movl	%eax, %edx
	movq	%r10, %r9
	movq	%r11, %r8
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkfromsig$5:
	leaq	24(%rsp), %rsp
	movq	%r8, %r11
	movq	2184(%rsp), %r10
	movl	2232(%rsp), %ecx
	movq	2192(%rsp), %rdx
	incl	%ecx
	addq	$32, %rdx
.Lwots_pkfromsig$3:
	cmpl	$67, %ecx
	jb  	.Lwots_pkfromsig$4
	leaq	2200(%rsp), %rax
	movq	(%r11), %rcx
	movq	%rcx, (%rax)
	movq	8(%r11), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%r11), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%r11), %rcx
	movq	%rcx, 24(%rax)
	leaq	2200(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$1, 16(%rax)
	movl	20(%r11), %ecx
	leaq	2200(%rsp), %rax
	movl	%ecx, 20(%rax)
	movq	2176(%rsp), %rcx
	movq	%r11, 2176(%rsp)
	leaq	2200(%rsp), %r8
	leaq	32(%rsp), %rax
	movq	%rcx, %rdi
	movq	%r10, %r9
	movq	%rax, %rcx
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
	movq	$0, %rdx
	movl	$0, %ecx
	movl	$0, %r9d
	jmp 	.Lwots_sign$140
.Lwots_sign$141:
	shll	$8, %r9d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r9d
	incq	%rdx
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
	movq	$0, %rdx
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %edi
	movzbl	(%rsi,%rdx), %r9d
	orl 	%r9d, %edi
	incq	%rdx
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
	movzbl	(%rsi,%rdx), %r9d
	orl 	%r9d, %edi
	incq	%rdx
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
	movzbl	(%rsi,%rdx), %r9d
	orl 	%r9d, %edi
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$8:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$9
	movl	%edi, %edx
	addl	$-4, %ecx
	shrq	%cl, %rdx
	andq	$15, %rdx
	movl	%edx, 8(%rax)
	leaq	48(%rsp), %rax
	movq	(%r8), %rcx
	movq	%rcx, (%rax)
	movq	8(%r8), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%r8), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%r8), %rcx
	movq	%rcx, 24(%rax)
	leaq	48(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$5, 16(%rax)
	movl	20(%r8), %ecx
	leaq	48(%rsp), %rax
	movl	%ecx, 20(%rax)
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
	leaq	48(%rsp), %r8
	movl	%eax, 24(%r8)
	leaq	(%rbx,%rdx), %rcx
	movq	%rbx, 40(%rsp)
	leaq	48(%rsp), %r8
	movq	%r10, %r9
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
	addq	$32, %rdx
.Lwots_sign$5:
	cmpl	$67, %ecx
	jb  	.Lwots_sign$6
	movq	8(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %edx
	jmp 	.Lwots_sign$2
.Lwots_sign$3:
	movq	%r10, 8(%rsp)
	movl	%edx, 80(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%edx, %ecx
	movl	%ecx, 24(%rax)
	movl	$0, %ecx
	movl	%edx, %edx
	movl	84(%rsp,%rdx,4), %edx
	leaq	(%rbx,%rsi), %rdi
	movq	%rbx, 24(%rsp)
	movq	%r10, %r9
	movq	%rax, %r8
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_sign$4:
	leaq	24(%rsp), %rsp
	movq	%r8, %rax
	movq	24(%rsp), %rbx
	movq	8(%rsp), %r10
	movl	80(%rsp), %edx
	movq	32(%rsp), %rsi
	incl	%edx
	addq	$32, %rsi
.Lwots_sign$2:
	cmpl	$67, %edx
	jb  	.Lwots_sign$3
	ret
.Lwots_pkgen$1:
	movq	%rdi, 2176(%rsp)
	leaq	2216(%rsp), %rcx
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rcx)
	leaq	2216(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%r8), %ecx
	leaq	2216(%rsp), %rdx
	movl	%ecx, 20(%rdx)
	movl	%ecx, 2248(%rsp)
	movq	%r8, 2184(%rsp)
	movq	$0, %rsi
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$6
.Lwots_pkgen$7:
	movq	%r11, 2192(%rsp)
	movq	%r9, 2200(%rsp)
	movl	%ecx, 2252(%rsp)
	movq	%rsi, 2208(%rsp)
	leaq	2216(%rsp), %rdx
	movl	%ecx, 24(%rdx)
	leaq	32(%rsp,%rsi), %rcx
	leaq	2216(%rsp), %r8
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_pkgen$8:
	leaq	56(%rsp), %rsp
	movq	2192(%rsp), %r11
	movq	2200(%rsp), %r9
	movl	2252(%rsp), %ecx
	movq	2208(%rsp), %rsi
	incl	%ecx
	addq	$32, %rsi
.Lwots_pkgen$6:
	cmpl	$67, %ecx
	jb  	.Lwots_pkgen$7
	movq	2184(%rsp), %r8
	movq	$0, %rsi
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$3
.Lwots_pkgen$4:
	movq	%r9, 2184(%rsp)
	movl	%ecx, 2252(%rsp)
	movq	%rsi, 2208(%rsp)
	movl	%ecx, 24(%r8)
	movl	$0, %ecx
	movl	$15, %edx
	leaq	32(%rsp,%rsi), %rdi
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkgen$5:
	leaq	24(%rsp), %rsp
	movq	2184(%rsp), %r9
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
	leaq	2216(%rsp), %rdx
	movl	%ecx, 20(%rdx)
	movq	2176(%rsp), %rcx
	movq	%r8, 2176(%rsp)
	leaq	2216(%rsp), %r8
	leaq	32(%rsp), %rdx
	movq	%rcx, %rdi
	movq	%rdx, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdi
	movq	2176(%rsp), %rcx
	ret
.Lchain$1:
	movl	%ecx, %esi
	addl	%edx, %esi
	jmp 	.Lchain$2
.Lchain$3:
	movl	%ecx, 28(%r8)
	movq	%r9, 8(%rsp)
	movq	%r8, 16(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%esi, 28(%rsp)
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lchain$4:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdi
	movq	8(%rsp), %r9
	movq	16(%rsp), %r8
	movl	24(%rsp), %ecx
	movl	28(%rsp), %esi
	incl	%ecx
.Lchain$2:
	cmpl	%esi, %ecx
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
	movq	$0, %rdi
	jmp 	.LT_k$6
.LT_k$7:
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rax,%rcx), %rsi
	vmovq	%rsi, %xmm9
	vmovdqu	48(%rax,%rcx), %ymm14
	movq	80(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	88(%rax,%rcx), %ymm13
	movq	120(%rax,%rcx), %rdx
	vpinsrq	$1, %rdx, %xmm9, %xmm9
	movq	128(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm7
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	vpxor	%xmm8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm10, %xmm10
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
	incq	%rdi
.LT_k$6:
	cmpq	$4, %rdi
	jb  	.LT_k$7
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rax,%rcx), %rsi
	vmovq	%rsi, %xmm8
	vmovdqu	48(%rax,%rcx), %ymm14
	movq	80(%rax,%rcx), %rcx
	vmovq	%rcx, %xmm10
	movq	$0, %rcx
	movq	$31, %rax
	orq 	%rax, %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
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
	movq	$0, %rdi
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
	incq	%rdi
.LT_k$3:
	cmpq	$0, %rdi
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
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%rdx,%rsi), %xmm2
	vpslldq	$8, %xmm2, %xmm2
	vinserti128	$1, %xmm2, %ymm6, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	8(%rdx,%rsi), %rdi
	vmovq	%rdi, %xmm2
	vmovdqu	16(%rdx,%rsi), %xmm6
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
	movq	$0, %rsi
	vpbroadcastq	(%r9,%rsi), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r9,%rsi), %xmm2
	movq	24(%r9,%rsi), %rsi
	vmovq	%rsi, %xmm6
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm6, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
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
	movq	$0, %rsi
	movq	$0, %r8
	vmovq	%r8, %xmm2
	vpxor	%ymm6, %ymm6, %ymm6
	vmovdqu	(%rcx,%rsi), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	16(%rcx,%rsi), %rdi
	vmovq	%rdi, %xmm6
	movq	24(%rcx,%rsi), %rcx
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
	vmovdqu	(%rdx,%rcx), %xmm11
	vpslldq	$8, %xmm11, %xmm9
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
	movq	$98, %rsi
	movq	$0, %rdx
	movq	240(%rsp), %rax
	movq	248(%rsp), %rcx
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %rsi
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
	movq	$0, %rsi
.LH_msg$13:
	movb	(%rax,%rdx), %r8b
	incq	%rdx
	xorb	%r8b, 32(%rsp,%rsi)
	incq	%rsi
.LH_msg$11:
	cmpq	%rcx, %rdx
	jb  	.LH_msg$12
	movq	$0, %rax
	movq	256(%rsp), %rdx
	movq	264(%rsp), %r8
	jmp 	.LH_msg$7
.LH_msg$8:
	cmpq	$136, %rsi
	jb  	.LH_msg$9
	movq	%rdx, 264(%rsp)
	movq	%rax, 256(%rsp)
	movq	%r8, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$10:
	leaq	208(%rsp), %rsp
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rax
	movq	272(%rsp), %r8
	movq	$0, %rsi
.LH_msg$9:
	movb	(%rdx,%rax), %cl
	incq	%rax
	xorb	%cl, 32(%rsp,%rsi)
	incq	%rsi
.LH_msg$7:
	cmpq	%r8, %rax
	jb  	.LH_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rsi
	jb  	.LH_msg$5
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$6:
	leaq	208(%rsp), %rsp
	movq	$0, %rsi
.LH_msg$5:
	xorb	$31, 32(%rsp,%rsi)
	leaq	32(%rsp), %rax
	cmpq	$136, %rsi
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
	movb	32(%rsp), %cl
	movb	%cl, (%rdi)
	movb	33(%rsp), %cl
	movb	%cl, 1(%rdi)
	movb	34(%rsp), %cl
	movb	%cl, 2(%rdi)
	movb	35(%rsp), %cl
	movb	%cl, 3(%rdi)
	movb	36(%rsp), %cl
	movb	%cl, 4(%rdi)
	movb	37(%rsp), %cl
	movb	%cl, 5(%rdi)
	movb	38(%rsp), %cl
	movb	%cl, 6(%rdi)
	movb	39(%rsp), %cl
	movb	%cl, 7(%rdi)
	movb	40(%rsp), %cl
	movb	%cl, 8(%rdi)
	movb	41(%rsp), %cl
	movb	%cl, 9(%rdi)
	movb	42(%rsp), %cl
	movb	%cl, 10(%rdi)
	movb	43(%rsp), %cl
	movb	%cl, 11(%rdi)
	movb	44(%rsp), %cl
	movb	%cl, 12(%rdi)
	movb	45(%rsp), %cl
	movb	%cl, 13(%rdi)
	movb	46(%rsp), %cl
	movb	%cl, 14(%rdi)
	movb	47(%rsp), %cl
	movb	%cl, 15(%rdi)
	movb	48(%rsp), %cl
	movb	%cl, 16(%rdi)
	movb	49(%rsp), %cl
	movb	%cl, 17(%rdi)
	movb	50(%rsp), %cl
	movb	%cl, 18(%rdi)
	movb	51(%rsp), %cl
	movb	%cl, 19(%rdi)
	movb	52(%rsp), %cl
	movb	%cl, 20(%rdi)
	movb	53(%rsp), %cl
	movb	%cl, 21(%rdi)
	movb	54(%rsp), %cl
	movb	%cl, 22(%rdi)
	movb	55(%rsp), %cl
	movb	%cl, 23(%rdi)
	movb	56(%rsp), %cl
	movb	%cl, 24(%rdi)
	movb	57(%rsp), %cl
	movb	%cl, 25(%rdi)
	movb	58(%rsp), %cl
	movb	%cl, 26(%rdi)
	movb	59(%rsp), %cl
	movb	%cl, 27(%rdi)
	movb	60(%rsp), %cl
	movb	%cl, 28(%rdi)
	movb	61(%rsp), %cl
	movb	%cl, 29(%rdi)
	movb	62(%rsp), %cl
	movb	%cl, 30(%rdi)
	movb	63(%rsp), %cl
	movb	%cl, 31(%rdi)
	movb	64(%rsp), %cl
	movb	%cl, 32(%rdi)
	movb	65(%rsp), %cl
	movb	%cl, 33(%rdi)
	movb	66(%rsp), %cl
	movb	%cl, 34(%rdi)
	movb	67(%rsp), %cl
	movb	%cl, 35(%rdi)
	movb	68(%rsp), %cl
	movb	%cl, 36(%rdi)
	movb	69(%rsp), %cl
	movb	%cl, 37(%rdi)
	movb	70(%rsp), %cl
	movb	%cl, 38(%rdi)
	movb	71(%rsp), %cl
	movb	%cl, 39(%rdi)
	movb	72(%rsp), %cl
	movb	%cl, 40(%rdi)
	movb	73(%rsp), %cl
	movb	%cl, 41(%rdi)
	movb	74(%rsp), %cl
	movb	%cl, 42(%rdi)
	movb	75(%rsp), %cl
	movb	%cl, 43(%rdi)
	movb	76(%rsp), %cl
	movb	%cl, 44(%rdi)
	movb	77(%rsp), %cl
	movb	%cl, 45(%rdi)
	movb	78(%rsp), %cl
	movb	%cl, 46(%rdi)
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
