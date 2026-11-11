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
	leaq	88(%rsp), %rdi
	movl	124(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	128(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	132(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	leaq	88(%rsp), %rdi
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$3, 16(%rdi)
	leaq	88(%rsp), %rdi
	movl	%esi, 20(%rdi)
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
	leaq	112(%rsp), %rdi
	movl	148(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	152(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	156(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	leaq	112(%rsp), %rdi
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$3, 16(%rdi)
	leaq	112(%rsp), %rdi
	movl	%ecx, 20(%rdi)
	leaq	32(%rax), %r10
	movq	%rsi, 72(%rsp)
	movq	%r9, 80(%rsp)
	movq	%rax, 88(%rsp)
	movq	%rdx, 64(%rsp)
	movl	%ecx, 144(%rsp)
	leaq	112(%rsp), %rdi
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
	movq	%rsi, %rcx
	movq	%rax, %r8
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rcx)
	leaq	32(%rsi), %rcx
	leaq	32(%rax), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rcx)
	leaq	64(%rsi), %rcx
	leaq	64(%rax), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rcx)
	movq	%rdi, %rcx
	leaq	64(%rax), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rcx)
	movq	%rsi, %r11
	leaq	64(%rsi), %r9
	leaq	24(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$7, %r8d
	leaq	24(%rsp), %rax
	movl	%r8d, (%rax)
	movl	$0, %r10d
	movl	$8, %eax
	leaq	96(%rsi), %rcx
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rdi
	movl	%r10d, %esi
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
	movq	$0, %rsi
	jmp 	.Lfors_pkfromsig$3
.Lfors_pkfromsig$4:
	movq	%rcx, 872(%rsp)
	leaq	(%r10,%rax), %rcx
	leaq	64(%rsp), %rdi
	movq	(%rcx), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rcx), %rdx
	movq	%rdx, 8(%rdi)
	movq	16(%rcx), %rdx
	movq	%rdx, 16(%rdi)
	movq	24(%rcx), %rdx
	movq	%rdx, 24(%rdi)
	movl	$0, %ecx
	movl	%ecx, 24(%r8)
	movl	%esi, %ecx
	shll	$14, %ecx
	addl	928(%rsp,%rsi,4), %ecx
	movl	%ecx, 28(%r8)
	movq	%r9, 880(%rsp)
	movq	%r8, 888(%rsp)
	movq	%r10, 896(%rsp)
	movq	%rsi, 904(%rsp)
	movq	%rax, 912(%rsp)
	leaq	64(%rsp), %rcx
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	56(%rsp), %rsp
	movq	880(%rsp), %r9
	movq	888(%rsp), %r8
	movq	896(%rsp), %r10
	movq	904(%rsp), %rsi
	movq	912(%rsp), %rax
	addq	$32, %rax
	movl	928(%rsp,%rsi,4), %edi
	movl	$0, %edx
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movl	%edx, %ecx
	incl	%ecx
	movl	%ecx, 24(%r8)
	movl	%edi, %ecx
	andl	$1, %ecx
	movl	%edx, 920(%rsp)
	movl	%edi, 924(%rsp)
	cmpl	$0, %ecx
	je  	.Lfors_pkfromsig$8
	movl	28(%r8), %ecx
	decl	%ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r8)
	leaq	832(%rsp), %rcx
	leaq	(%r10,%rax), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	800(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	jmp 	.Lfors_pkfromsig$9
.Lfors_pkfromsig$8:
	movl	28(%r8), %ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%r8)
	leaq	832(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	800(%rsp), %rcx
	leaq	(%r10,%rax), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
.Lfors_pkfromsig$9:
	movq	%r9, 912(%rsp)
	movq	%r8, 904(%rsp)
	movq	%r10, 896(%rsp)
	movq	%rsi, 888(%rsp)
	movq	%rax, 880(%rsp)
	leaq	32(%rsp), %rcx
	leaq	832(%rsp), %rdx
	leaq	800(%rsp), %rsi
	movq	%r8, %rdi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	56(%rsp), %rsp
	movq	912(%rsp), %r9
	movq	904(%rsp), %r8
	movq	896(%rsp), %r10
	movq	888(%rsp), %rsi
	movq	880(%rsp), %rax
	leaq	64(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, (%rcx)
	movq	8(%rdx), %rdi
	movq	%rdi, 8(%rcx)
	movq	16(%rdx), %rdi
	movq	%rdi, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	movl	920(%rsp), %edx
	movl	924(%rsp), %edi
	shrl	$1, %edi
	addq	$32, %rax
	incl	%edx
.Lfors_pkfromsig$5:
	cmpl	$14, %edx
	jb  	.Lfors_pkfromsig$6
	movq	872(%rsp), %rcx
	leaq	96(%rsp,%rcx), %rdi
	leaq	64(%rsp), %rdx
	movq	(%rdx), %r11
	movq	%r11, (%rdi)
	movq	8(%rdx), %r11
	movq	%r11, 8(%rdi)
	movq	16(%rdx), %r11
	movq	%r11, 16(%rdi)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rdi)
	addq	$32, %rcx
	incq	%rsi
.Lfors_pkfromsig$3:
	cmpq	$22, %rsi
	jb  	.Lfors_pkfromsig$4
	leaq	64(%rsp), %rax
	movq	(%r8), %rdx
	movq	%rdx, (%rax)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rax)
	leaq	64(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$4, 16(%rax)
	movl	20(%r8), %ecx
	leaq	64(%rsp), %rax
	movl	%ecx, 20(%rax)
	movq	864(%rsp), %rcx
	leaq	64(%rsp), %rdi
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
	jmp 	.Lfors_sign$50
.Lfors_sign$51:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$50:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$51
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, (%rax)
	jmp 	.Lfors_sign$48
.Lfors_sign$49:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$48:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$49
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 4(%rax)
	jmp 	.Lfors_sign$46
.Lfors_sign$47:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$46:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$47
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 8(%rax)
	jmp 	.Lfors_sign$44
.Lfors_sign$45:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$44:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$45
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 12(%rax)
	jmp 	.Lfors_sign$42
.Lfors_sign$43:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$42:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$43
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 16(%rax)
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$41
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 20(%rax)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$39
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 24(%rax)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$37
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 28(%rax)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$35
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 32(%rax)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$33
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 36(%rax)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$31
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 40(%rax)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$29
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 44(%rax)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$27
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 48(%rax)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$25
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 52(%rax)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$23
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 56(%rax)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$21
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 60(%rax)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$19
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 64(%rax)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$17
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 68(%rax)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$15
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 72(%rax)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$13
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 76(%rax)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$11
	movl	%r8d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 80(%rax)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %r8d
	movzbl	(%rdx,%rsi), %ebx
	orl 	%ebx, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$9
	movl	%r8d, %edx
	addl	$-14, %ecx
	shrq	%cl, %rdx
	andq	$16383, %rdx
	movl	%edx, 84(%rax)
	movq	$0, %r8
	movq	$0, %rax
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%eax, %edx
	shll	$14, %edx
	addl	64(%rsp,%rax,4), %edx
	leaq	(%r10,%r8), %rsi
	movq	%r11, 8(%rsp)
	movq	%r9, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%r10, 32(%rsp)
	movq	%rax, 40(%rsp)
	movq	%r8, 48(%rsp)
	movl	%edx, %r10d
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %r11
	movq	16(%rsp), %r9
	movq	24(%rsp), %rdi
	movq	32(%rsp), %r10
	movq	40(%rsp), %rax
	movq	48(%rsp), %r8
	addq	$32, %r8
	movl	64(%rsp,%rax,4), %edx
	xorl	$1, %edx
	movl	$0, %ebx
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%r11, 48(%rsp)
	movq	%r9, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	%ebx, 56(%rsp)
	movq	%r8, 24(%rsp)
	movl	%edx, 60(%rsp)
	movl	$14, %ecx
	subl	%ebx, %ecx
	shlq	%cl, %rax
	addl	%edx, %eax
	leaq	(%r10,%r8), %rcx
	movq	%r10, 16(%rsp)
	movl	%eax, %esi
	movl	%ebx, %edx
	leaq	-1048696(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	1048696(%rsp), %rsp
	movq	16(%rsp), %r10
	movq	48(%rsp), %r11
	movq	40(%rsp), %r9
	movq	32(%rsp), %rax
	movl	56(%rsp), %ebx
	movq	24(%rsp), %r8
	movl	60(%rsp), %edx
	shrl	$1, %edx
	xorl	$1, %edx
	addq	$32, %r8
	incl	%ebx
.Lfors_sign$4:
	cmpl	$14, %ebx
	jb  	.Lfors_sign$5
	incq	%rax
.Lfors_sign$2:
	cmpq	$22, %rax
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rcx, 1048640(%rsp)
	movl	$0, %r8d
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%edx, 1048680(%rsp)
	movl	%edx, %ecx
	subl	%r8d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r10d
	imull	%esi, %r10d
	addl	%r10d, %edx
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%r11, 1048648(%rsp)
	movl	%edx, 1048684(%rsp)
	cmpl	$0, %r8d
	je  	.Lfors_node$6
	movl	%r10d, %eax
	imull	$2, %eax, %eax
	movl	%r8d, %edx
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
	movl	%r8d, 24(%rdi)
	movl	%r10d, 28(%rdi)
	movl	$15, %ecx
	movq	$1, %rax
	shlq	%cl, %rax
	movq	%rax, %r11
	subl	%r8d, %ecx
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
	movq	%rdi, 1048664(%rsp)
	movl	%esi, 1048688(%rsp)
	movl	%r8d, 1048692(%rsp)
	movl	%r10d, 1048696(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	1048608(%rsp), %rdx
	leaq	1048576(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_node$10:
	leaq	56(%rsp), %rsp
	movq	1048656(%rsp), %r9
	movq	1048664(%rsp), %rdi
	movl	1048688(%rsp), %esi
	movl	1048692(%rsp), %r8d
	movl	1048696(%rsp), %r10d
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%r8d, 24(%rdi)
	movl	%r10d, 28(%rdi)
	movl	$15, %ecx
	movq	$1, %rax
	shlq	%cl, %rax
	movq	%rax, %rbx
	subl	%r8d, %ecx
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
	movq	%rdi, 1048664(%rsp)
	movl	%esi, 1048688(%rsp)
	movl	%r8d, 1048692(%rsp)
	movl	%r10d, 1048696(%rsp)
	movq	%rax, 1048672(%rsp)
	leaq	32(%rsp,%rax), %rsi
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$9:
	leaq	40(%rsp), %rsp
	movq	1048656(%rsp), %r9
	movq	1048664(%rsp), %rax
	movl	1048688(%rsp), %esi
	movl	1048692(%rsp), %r8d
	movl	1048696(%rsp), %r10d
	movq	1048672(%rsp), %rcx
	movq	%r9, 1048672(%rsp)
	movq	%rax, 1048664(%rsp)
	movl	%esi, 1048696(%rsp)
	movl	%r8d, 1048692(%rsp)
	movl	%r10d, 1048688(%rsp)
	movq	%rcx, 1048656(%rsp)
	leaq	32(%rsp,%rcx), %rcx
	movq	%rax, %r8
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_node$8:
	leaq	56(%rsp), %rsp
	movq	1048672(%rsp), %r9
	movq	1048664(%rsp), %rdi
	movl	1048696(%rsp), %esi
	movl	1048692(%rsp), %r8d
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
	incl	%r8d
.Lfors_node$2:
	cmpl	%edx, %r8d
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
	movq	(%rdi), %rdx
	movq	%rdx, (%rax)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rdi), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rdi), %rdx
	movq	%rdx, 24(%rax)
	leaq	8(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$6, 16(%rax)
	movl	20(%rdi), %ecx
	leaq	8(%rsp), %rax
	movl	%ecx, 20(%rax)
	leaq	8(%rsp), %rax
	movl	%r10d, 28(%rax)
	leaq	8(%rsp), %rdi
	movq	%rsi, %rcx
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	56(%rsp), %rsp
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%rdi), %r8d
	movl	%r8d, 140(%rsp)
	movl	4(%rdi), %r8d
	movl	%r8d, 144(%rsp)
	movl	8(%rdi), %edi
	movl	%edi, 148(%rsp)
	leaq	40(%rsp), %rdi
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	leaq	40(%rsp), %rdi
	movl	140(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	144(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	148(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	movq	%rcx, %rsi
	movq	%r9, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	72(%rsp), %rcx
	leaq	40(%rsp), %rdi
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %r9
	movq	24(%rsp), %rcx
	movq	$2400, %rax
	movl	$1, %r10d
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%r10d, 136(%rsp)
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
	leaq	40(%rsp), %rdi
	movl	%r10d, (%rdi)
	leaq	40(%rsp), %rdi
	movl	140(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	144(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	148(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	leaq	104(%rsp), %rdi
	leaq	72(%rsp), %rsi
	movq	(%rsi), %r8
	movq	%r8, (%rdi)
	movq	8(%rsi), %r8
	movq	%r8, 8(%rdi)
	movq	16(%rsi), %r8
	movq	%r8, 16(%rdi)
	movq	24(%rsi), %r8
	movq	%r8, 24(%rdi)
	leaq	(%rcx,%rax), %rsi
	movq	%r9, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	72(%rsp), %rcx
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %rdi
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %r9
	movq	32(%rsp), %rcx
	movl	136(%rsp), %r10d
	movq	24(%rsp), %rax
	addq	$2400, %rax
	incl	%r10d
.Lht_verify$2:
	cmpl	$8, %r10d
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
	movl	(%rdi), %r8d
	movl	%r8d, 144(%rsp)
	movl	4(%rdi), %r8d
	movl	%r8d, 148(%rsp)
	movl	8(%rdi), %edi
	movl	%edi, 152(%rsp)
	leaq	40(%rsp), %rdi
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	leaq	40(%rsp), %rdi
	movl	144(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	148(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	152(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	movq	%rcx, %rsi
	movq	%rcx, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%r9, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%edx, 136(%rsp)
	leaq	40(%rsp), %rdi
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
	leaq	40(%rsp), %rdi
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	216(%rsp), %rsp
	movq	32(%rsp), %r11
	movq	24(%rsp), %r9
	movq	16(%rsp), %rcx
	movq	$2400, %rax
	movl	$1, %r8d
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%r11, 16(%rsp)
	leaq	144(%rsp), %rsi
	movl	8(%rsi), %edx
	andl	$255, %edx
	shrl	$8, 8(%rsi)
	movl	4(%rsi), %edi
	shll	$24, %edi
	orl 	%edi, 8(%rsi)
	shrl	$8, 4(%rsi)
	movl	(%rsi), %edi
	shll	$24, %edi
	orl 	%edi, 4(%rsi)
	shrl	$8, (%rsi)
	leaq	40(%rsp), %rdi
	movl	%r8d, (%rdi)
	leaq	40(%rsp), %rdi
	movl	144(%rsp), %esi
	movl	%esi, 4(%rdi)
	movl	148(%rsp), %esi
	movl	%esi, 8(%rdi)
	movl	152(%rsp), %esi
	movl	%esi, 12(%rdi)
	leaq	104(%rsp), %rdi
	leaq	72(%rsp), %rsi
	movq	(%rsi), %r10
	movq	%r10, (%rdi)
	movq	8(%rsi), %r10
	movq	%r10, 8(%rdi)
	movq	16(%rsi), %r10
	movq	%r10, 16(%rdi)
	movq	24(%rsi), %rsi
	movq	%rsi, 24(%rdi)
	leaq	(%rcx,%rax), %rsi
	movq	%rcx, 24(%rsp)
	movq	%r9, 32(%rsp)
	movl	%r8d, 136(%rsp)
	movq	%rax, 8(%rsp)
	movl	%edx, 140(%rsp)
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %rdi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	24(%rsp), %rcx
	movq	32(%rsp), %r9
	movl	136(%rsp), %r8d
	movq	8(%rsp), %rax
	movl	140(%rsp), %edx
	cmpl	$7, %r8d
	jnb 	.Lht_sign$4
	movq	%r9, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%r8d, 140(%rsp)
	movq	%rax, 24(%rsp)
	leaq	72(%rsp), %rcx
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %rdi
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	216(%rsp), %rsp
	movq	8(%rsp), %r9
	movq	32(%rsp), %rcx
	movl	140(%rsp), %r8d
	movq	24(%rsp), %rax
.Lht_sign$4:
	movq	16(%rsp), %r11
	addq	$2400, %rax
	incl	%r8d
.Lht_sign$2:
	cmpl	$8, %r8d
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 160(%rsp)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%edx, 20(%rdi)
	movq	%rsi, %rcx
	movq	%r9, 168(%rsp)
	movl	%edx, 200(%rsp)
	movq	%rsi, 176(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	movq	%r9, %r10
	movq	%rdi, %r11
	leaq	-2520(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	2520(%rsp), %rsp
	movq	%rax, %rdi
	movq	168(%rsp), %r9
	movl	200(%rsp), %ecx
	movq	176(%rsp), %rsi
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%ecx, 28(%rdi)
	movq	$2144, %rax
	movl	%ecx, %r8d
	movl	$0, %edx
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%edx, %ecx
	incl	%ecx
	movl	%ecx, 24(%rdi)
	movl	%r8d, %ecx
	andl	$1, %ecx
	movl	%edx, 200(%rsp)
	movl	%r8d, 204(%rsp)
	cmpl	$0, %ecx
	je  	.Lxmss_pkfromsig$5
	movl	28(%rdi), %ecx
	decl	%ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%rdi)
	leaq	128(%rsp), %rcx
	leaq	(%rsi,%rax), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rdx), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rdx), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	jmp 	.Lxmss_pkfromsig$6
.Lxmss_pkfromsig$5:
	movl	28(%rdi), %ecx
	shrl	$1, %ecx
	movl	%ecx, 28(%rdi)
	leaq	128(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rdx), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	leaq	96(%rsp), %rcx
	leaq	(%rsi,%rax), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rdx), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
.Lxmss_pkfromsig$6:
	movq	%r9, 176(%rsp)
	movq	%rdi, 168(%rsp)
	movq	%rsi, 184(%rsp)
	movq	%rax, 192(%rsp)
	leaq	64(%rsp), %rcx
	leaq	128(%rsp), %rdx
	leaq	96(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	56(%rsp), %rsp
	movq	176(%rsp), %r9
	movq	168(%rsp), %rdi
	movq	184(%rsp), %rsi
	movq	192(%rsp), %rax
	leaq	32(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rdx), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
	movl	200(%rsp), %edx
	movl	204(%rsp), %r8d
	shrl	$1, %r8d
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
	movl	$0, %r8d
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%r11, 16(%rsp)
	movq	%r9, 24(%rsp)
	movl	%edx, 48(%rsp)
	movl	%r8d, 52(%rsp)
	movl	%eax, 56(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	(%rsi,%rcx), %rcx
	movq	%rsi, 40(%rsp)
	movl	%eax, %esi
	movl	%r8d, %edx
	leaq	-16504(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	16504(%rsp), %rsp
	movq	40(%rsp), %rsi
	movq	16(%rsp), %r11
	movq	24(%rsp), %r9
	movl	48(%rsp), %edx
	movl	52(%rsp), %r8d
	movl	56(%rsp), %eax
	movq	32(%rsp), %rcx
	shrl	$1, %eax
	xorl	$1, %eax
	addq	$32, %rcx
	incl	%r8d
.Lxmss_sign$3:
	cmpl	$8, %r8d
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rax
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%edx, 20(%rdi)
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
	movl	$0, %r8d
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%edx, 16480(%rsp)
	movl	%edx, %ecx
	subl	%r8d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r10d
	imull	%esi, %r10d
	addl	%r10d, %edx
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%r11, 16456(%rsp)
	movq	%r9, 16464(%rsp)
	movl	%esi, 16484(%rsp)
	movl	%r8d, 16488(%rsp)
	movl	%r10d, 16492(%rsp)
	movl	%edx, 16496(%rsp)
	cmpl	$0, %r8d
	je  	.Lxmss_node$6
	movl	%r10d, %eax
	imull	$2, %eax, %eax
	movl	%r8d, %edx
	decl	%edx
	movl	$9, %ecx
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
	leaq	16416(%rsp), %rcx
	leaq	32(%rsp,%r11), %rdx
	movq	(%rdx), %rsi
	movq	%rsi, (%rcx)
	movq	8(%rdx), %rsi
	movq	%rsi, 8(%rcx)
	movq	16(%rdx), %rsi
	movq	%rsi, 16(%rcx)
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
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%r8d, 24(%rdi)
	movl	%r10d, 28(%rdi)
	movl	$9, %ecx
	movq	$1, %rax
	shlq	%cl, %rax
	subl	%r8d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %rax
	movl	%r10d, %ecx
	addq	%rcx, %rax
	imulq	$32, %rax, %rax
	movq	%rdi, 16472(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	16416(%rsp), %rdx
	leaq	16384(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_node$9:
	leaq	56(%rsp), %rsp
	movq	16472(%rsp), %rdi
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%r10d, 20(%rdi)
	movl	%r10d, %eax
	imulq	$32, %rax, %rax
	leaq	32(%rsp,%rax), %rcx
	leaq	-2264(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	2264(%rsp), %rsp
.Lxmss_node$7:
	movq	16456(%rsp), %r11
	movq	16464(%rsp), %r9
	movl	16484(%rsp), %esi
	movl	16488(%rsp), %r8d
	movl	16492(%rsp), %r10d
	movl	16496(%rsp), %edx
	incl	%r10d
.Lxmss_node$4:
	cmpl	%edx, %r10d
	jb  	.Lxmss_node$5
	movl	16480(%rsp), %edx
	incl	%r8d
.Lxmss_node$2:
	cmpl	%edx, %r8d
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
	movb	(%rdx), %sil
	movb	%sil, 32(%rsp)
	movb	1(%rdx), %sil
	movb	%sil, 33(%rsp)
	movb	2(%rdx), %sil
	movb	%sil, 34(%rsp)
	movb	3(%rdx), %sil
	movb	%sil, 35(%rsp)
	movb	4(%rdx), %sil
	movb	%sil, 36(%rsp)
	movb	5(%rdx), %sil
	movb	%sil, 37(%rsp)
	movb	6(%rdx), %sil
	movb	%sil, 38(%rsp)
	movb	7(%rdx), %sil
	movb	%sil, 39(%rsp)
	movb	8(%rdx), %sil
	movb	%sil, 40(%rsp)
	movb	9(%rdx), %sil
	movb	%sil, 41(%rsp)
	movb	10(%rdx), %sil
	movb	%sil, 42(%rsp)
	movb	11(%rdx), %sil
	movb	%sil, 43(%rsp)
	movb	12(%rdx), %sil
	movb	%sil, 44(%rsp)
	movb	13(%rdx), %sil
	movb	%sil, 45(%rsp)
	movb	14(%rdx), %sil
	movb	%sil, 46(%rsp)
	movb	15(%rdx), %sil
	movb	%sil, 47(%rsp)
	movb	16(%rdx), %sil
	movb	%sil, 48(%rsp)
	movb	17(%rdx), %sil
	movb	%sil, 49(%rsp)
	movb	18(%rdx), %sil
	movb	%sil, 50(%rsp)
	movb	19(%rdx), %sil
	movb	%sil, 51(%rsp)
	movb	20(%rdx), %sil
	movb	%sil, 52(%rsp)
	movb	21(%rdx), %sil
	movb	%sil, 53(%rsp)
	movb	22(%rdx), %sil
	movb	%sil, 54(%rsp)
	movb	23(%rdx), %sil
	movb	%sil, 55(%rsp)
	movb	24(%rdx), %sil
	movb	%sil, 56(%rsp)
	movb	25(%rdx), %sil
	movb	%sil, 57(%rsp)
	movb	26(%rdx), %sil
	movb	%sil, 58(%rsp)
	movb	27(%rdx), %sil
	movb	%sil, 59(%rsp)
	movb	28(%rdx), %sil
	movb	%sil, 60(%rsp)
	movb	29(%rdx), %sil
	movb	%sil, 61(%rsp)
	movb	30(%rdx), %sil
	movb	%sil, 62(%rsp)
	movb	31(%rdx), %sil
	movb	%sil, 63(%rsp)
	movb	32(%rdx), %sil
	movb	%sil, 64(%rsp)
	movb	33(%rdx), %sil
	movb	%sil, 65(%rsp)
	movb	34(%rdx), %sil
	movb	%sil, 66(%rsp)
	movb	35(%rdx), %sil
	movb	%sil, 67(%rsp)
	movb	36(%rdx), %sil
	movb	%sil, 68(%rsp)
	movb	37(%rdx), %sil
	movb	%sil, 69(%rsp)
	movb	38(%rdx), %sil
	movb	%sil, 70(%rsp)
	movb	39(%rdx), %sil
	movb	%sil, 71(%rsp)
	movb	40(%rdx), %sil
	movb	%sil, 72(%rsp)
	movb	41(%rdx), %sil
	movb	%sil, 73(%rsp)
	movb	42(%rdx), %sil
	movb	%sil, 74(%rsp)
	movb	43(%rdx), %sil
	movb	%sil, 75(%rsp)
	movb	44(%rdx), %sil
	movb	%sil, 76(%rsp)
	movb	45(%rdx), %sil
	movb	%sil, 77(%rsp)
	movb	46(%rdx), %sil
	movb	%sil, 78(%rsp)
	movb	47(%rdx), %sil
	movb	%sil, 79(%rsp)
	movb	48(%rdx), %sil
	movb	%sil, 80(%rsp)
	movb	49(%rdx), %sil
	movb	%sil, 81(%rsp)
	movb	50(%rdx), %sil
	movb	%sil, 82(%rsp)
	movb	51(%rdx), %sil
	movb	%sil, 83(%rsp)
	movb	52(%rdx), %sil
	movb	%sil, 84(%rsp)
	movb	53(%rdx), %sil
	movb	%sil, 85(%rsp)
	movb	54(%rdx), %sil
	movb	%sil, 86(%rsp)
	movb	55(%rdx), %sil
	movb	%sil, 87(%rsp)
	movb	56(%rdx), %sil
	movb	%sil, 88(%rsp)
	movb	57(%rdx), %sil
	movb	%sil, 89(%rsp)
	movb	58(%rdx), %sil
	movb	%sil, 90(%rsp)
	movb	59(%rdx), %sil
	movb	%sil, 91(%rsp)
	movb	60(%rdx), %sil
	movb	%sil, 92(%rsp)
	movb	61(%rdx), %sil
	movb	%sil, 93(%rsp)
	movb	62(%rdx), %sil
	movb	%sil, 94(%rsp)
	movb	63(%rdx), %sil
	movb	%sil, 95(%rsp)
	movb	64(%rdx), %sil
	movb	%sil, 96(%rsp)
	movb	65(%rdx), %sil
	movb	%sil, 97(%rsp)
	movb	66(%rdx), %sil
	movb	%sil, 98(%rsp)
	movb	67(%rdx), %sil
	movb	%sil, 99(%rsp)
	movb	68(%rdx), %sil
	movb	%sil, 100(%rsp)
	movb	69(%rdx), %sil
	movb	%sil, 101(%rsp)
	movb	70(%rdx), %sil
	movb	%sil, 102(%rsp)
	movb	71(%rdx), %sil
	movb	%sil, 103(%rsp)
	movb	72(%rdx), %sil
	movb	%sil, 104(%rsp)
	movb	73(%rdx), %sil
	movb	%sil, 105(%rsp)
	movb	74(%rdx), %sil
	movb	%sil, 106(%rsp)
	movb	75(%rdx), %sil
	movb	%sil, 107(%rsp)
	movb	76(%rdx), %sil
	movb	%sil, 108(%rsp)
	movb	77(%rdx), %sil
	movb	%sil, 109(%rsp)
	movb	78(%rdx), %sil
	movb	%sil, 110(%rsp)
	movb	79(%rdx), %sil
	movb	%sil, 111(%rsp)
	movb	80(%rdx), %sil
	movb	%sil, 112(%rsp)
	movb	81(%rdx), %sil
	movb	%sil, 113(%rsp)
	movb	82(%rdx), %sil
	movb	%sil, 114(%rsp)
	movb	83(%rdx), %sil
	movb	%sil, 115(%rsp)
	movb	84(%rdx), %sil
	movb	%sil, 116(%rsp)
	movb	85(%rdx), %sil
	movb	%sil, 117(%rsp)
	movb	86(%rdx), %sil
	movb	%sil, 118(%rsp)
	movb	87(%rdx), %sil
	movb	%sil, 119(%rsp)
	movb	88(%rdx), %sil
	movb	%sil, 120(%rsp)
	movb	89(%rdx), %sil
	movb	%sil, 121(%rsp)
	movb	90(%rdx), %sil
	movb	%sil, 122(%rsp)
	movb	91(%rdx), %sil
	movb	%sil, 123(%rsp)
	movb	92(%rdx), %sil
	movb	%sil, 124(%rsp)
	movb	93(%rdx), %sil
	movb	%sil, 125(%rsp)
	movb	94(%rdx), %sil
	movb	%sil, 126(%rsp)
	movb	95(%rdx), %sil
	movb	%sil, 127(%rsp)
	movb	96(%rdx), %sil
	movb	%sil, 128(%rsp)
	movb	97(%rdx), %sil
	movb	%sil, 129(%rsp)
	movb	98(%rdx), %sil
	movb	%sil, 130(%rsp)
	movb	99(%rdx), %sil
	movb	%sil, 131(%rsp)
	movb	100(%rdx), %sil
	movb	%sil, 132(%rsp)
	movb	101(%rdx), %sil
	movb	%sil, 133(%rsp)
	movb	102(%rdx), %sil
	movb	%sil, 134(%rsp)
	movb	103(%rdx), %sil
	movb	%sil, 135(%rsp)
	movb	104(%rdx), %sil
	movb	%sil, 136(%rsp)
	movb	105(%rdx), %sil
	movb	%sil, 137(%rsp)
	movb	106(%rdx), %sil
	movb	%sil, 138(%rsp)
	movb	107(%rdx), %sil
	movb	%sil, 139(%rsp)
	movb	108(%rdx), %sil
	movb	%sil, 140(%rsp)
	movb	109(%rdx), %sil
	movb	%sil, 141(%rsp)
	movb	110(%rdx), %sil
	movb	%sil, 142(%rsp)
	movb	111(%rdx), %sil
	movb	%sil, 143(%rsp)
	movb	112(%rdx), %sil
	movb	%sil, 144(%rsp)
	movb	113(%rdx), %sil
	movb	%sil, 145(%rsp)
	movb	114(%rdx), %sil
	movb	%sil, 146(%rsp)
	movb	115(%rdx), %sil
	movb	%sil, 147(%rsp)
	movb	116(%rdx), %sil
	movb	%sil, 148(%rsp)
	movb	117(%rdx), %sil
	movb	%sil, 149(%rsp)
	movb	118(%rdx), %sil
	movb	%sil, 150(%rsp)
	movb	119(%rdx), %sil
	movb	%sil, 151(%rsp)
	movb	120(%rdx), %sil
	movb	%sil, 152(%rsp)
	movb	121(%rdx), %sil
	movb	%sil, 153(%rsp)
	movb	122(%rdx), %sil
	movb	%sil, 154(%rsp)
	movb	123(%rdx), %sil
	movb	%sil, 155(%rsp)
	movb	124(%rdx), %sil
	movb	%sil, 156(%rsp)
	movb	125(%rdx), %sil
	movb	%sil, 157(%rsp)
	movb	126(%rdx), %sil
	movb	%sil, 158(%rsp)
	movb	127(%rdx), %sil
	movb	%sil, 159(%rsp)
	movb	128(%rdx), %sil
	movb	%sil, 160(%rsp)
	movb	129(%rdx), %sil
	movb	%sil, 161(%rsp)
	movb	130(%rdx), %sil
	movb	%sil, 162(%rsp)
	movb	131(%rdx), %sil
	movb	%sil, 163(%rsp)
	movb	132(%rdx), %sil
	movb	%sil, 164(%rsp)
	movb	133(%rdx), %sil
	movb	%sil, 165(%rsp)
	movb	134(%rdx), %sil
	movb	%sil, 166(%rsp)
	movb	135(%rdx), %sil
	movb	%sil, 167(%rsp)
	movb	136(%rdx), %sil
	movb	%sil, 168(%rsp)
	movb	137(%rdx), %sil
	movb	%sil, 169(%rsp)
	movb	138(%rdx), %sil
	movb	%sil, 170(%rsp)
	movb	139(%rdx), %sil
	movb	%sil, 171(%rsp)
	movb	140(%rdx), %sil
	movb	%sil, 172(%rsp)
	movb	141(%rdx), %sil
	movb	%sil, 173(%rsp)
	movb	142(%rdx), %sil
	movb	%sil, 174(%rsp)
	movb	143(%rdx), %sil
	movb	%sil, 175(%rsp)
	movb	144(%rdx), %sil
	movb	%sil, 176(%rsp)
	movb	145(%rdx), %sil
	movb	%sil, 177(%rsp)
	movb	146(%rdx), %sil
	movb	%sil, 178(%rsp)
	movb	147(%rdx), %sil
	movb	%sil, 179(%rsp)
	movb	148(%rdx), %sil
	movb	%sil, 180(%rsp)
	movb	149(%rdx), %sil
	movb	%sil, 181(%rsp)
	movb	150(%rdx), %sil
	movb	%sil, 182(%rsp)
	movb	151(%rdx), %sil
	movb	%sil, 183(%rsp)
	movb	152(%rdx), %sil
	movb	%sil, 184(%rsp)
	movb	153(%rdx), %sil
	movb	%sil, 185(%rsp)
	movb	154(%rdx), %sil
	movb	%sil, 186(%rsp)
	movb	155(%rdx), %sil
	movb	%sil, 187(%rsp)
	movb	156(%rdx), %sil
	movb	%sil, 188(%rsp)
	movb	157(%rdx), %sil
	movb	%sil, 189(%rsp)
	movb	158(%rdx), %sil
	movb	%sil, 190(%rsp)
	movb	159(%rdx), %sil
	movb	%sil, 191(%rsp)
	movb	160(%rdx), %sil
	movb	%sil, 192(%rsp)
	movb	161(%rdx), %sil
	movb	%sil, 193(%rsp)
	movb	162(%rdx), %sil
	movb	%sil, 194(%rsp)
	movb	163(%rdx), %sil
	movb	%sil, 195(%rsp)
	movb	164(%rdx), %sil
	movb	%sil, 196(%rsp)
	movb	165(%rdx), %sil
	movb	%sil, 197(%rsp)
	movb	166(%rdx), %sil
	movb	%sil, 198(%rsp)
	movb	167(%rdx), %sil
	movb	%sil, 199(%rsp)
	movb	168(%rdx), %sil
	movb	%sil, 200(%rsp)
	movb	169(%rdx), %sil
	movb	%sil, 201(%rsp)
	movb	170(%rdx), %sil
	movb	%sil, 202(%rsp)
	movb	171(%rdx), %sil
	movb	%sil, 203(%rsp)
	movb	172(%rdx), %sil
	movb	%sil, 204(%rsp)
	movb	173(%rdx), %sil
	movb	%sil, 205(%rsp)
	movb	174(%rdx), %sil
	movb	%sil, 206(%rsp)
	movb	175(%rdx), %sil
	movb	%sil, 207(%rsp)
	movb	176(%rdx), %sil
	movb	%sil, 208(%rsp)
	movb	177(%rdx), %sil
	movb	%sil, 209(%rsp)
	movb	178(%rdx), %sil
	movb	%sil, 210(%rsp)
	movb	179(%rdx), %sil
	movb	%sil, 211(%rsp)
	movb	180(%rdx), %sil
	movb	%sil, 212(%rsp)
	movb	181(%rdx), %sil
	movb	%sil, 213(%rsp)
	movb	182(%rdx), %sil
	movb	%sil, 214(%rsp)
	movb	183(%rdx), %sil
	movb	%sil, 215(%rsp)
	movb	184(%rdx), %sil
	movb	%sil, 216(%rsp)
	movb	185(%rdx), %sil
	movb	%sil, 217(%rsp)
	movb	186(%rdx), %sil
	movb	%sil, 218(%rsp)
	movb	187(%rdx), %sil
	movb	%sil, 219(%rsp)
	movb	188(%rdx), %sil
	movb	%sil, 220(%rsp)
	movb	189(%rdx), %sil
	movb	%sil, 221(%rsp)
	movb	190(%rdx), %sil
	movb	%sil, 222(%rsp)
	movb	191(%rdx), %sil
	movb	%sil, 223(%rsp)
	movb	192(%rdx), %sil
	movb	%sil, 224(%rsp)
	movb	193(%rdx), %sil
	movb	%sil, 225(%rsp)
	movb	194(%rdx), %sil
	movb	%sil, 226(%rsp)
	movb	195(%rdx), %sil
	movb	%sil, 227(%rsp)
	movb	196(%rdx), %sil
	movb	%sil, 228(%rsp)
	movb	197(%rdx), %sil
	movb	%sil, 229(%rsp)
	movb	198(%rdx), %sil
	movb	%sil, 230(%rsp)
	movb	199(%rdx), %sil
	movb	%sil, 231(%rsp)
	movb	200(%rdx), %sil
	movb	%sil, 232(%rsp)
	movb	201(%rdx), %sil
	movb	%sil, 233(%rsp)
	movb	202(%rdx), %sil
	movb	%sil, 234(%rsp)
	movb	203(%rdx), %sil
	movb	%sil, 235(%rsp)
	movb	204(%rdx), %sil
	movb	%sil, 236(%rsp)
	movb	205(%rdx), %sil
	movb	%sil, 237(%rsp)
	movb	206(%rdx), %sil
	movb	%sil, 238(%rsp)
	movb	207(%rdx), %sil
	movb	%sil, 239(%rsp)
	movb	208(%rdx), %sil
	movb	%sil, 240(%rsp)
	movb	209(%rdx), %sil
	movb	%sil, 241(%rsp)
	movb	210(%rdx), %sil
	movb	%sil, 242(%rsp)
	movb	211(%rdx), %sil
	movb	%sil, 243(%rsp)
	movb	212(%rdx), %sil
	movb	%sil, 244(%rsp)
	movb	213(%rdx), %sil
	movb	%sil, 245(%rsp)
	movb	214(%rdx), %sil
	movb	%sil, 246(%rsp)
	movb	215(%rdx), %sil
	movb	%sil, 247(%rsp)
	movb	216(%rdx), %sil
	movb	%sil, 248(%rsp)
	movb	217(%rdx), %sil
	movb	%sil, 249(%rsp)
	movb	218(%rdx), %sil
	movb	%sil, 250(%rsp)
	movb	219(%rdx), %sil
	movb	%sil, 251(%rsp)
	movb	220(%rdx), %sil
	movb	%sil, 252(%rsp)
	movb	221(%rdx), %sil
	movb	%sil, 253(%rsp)
	movb	222(%rdx), %sil
	movb	%sil, 254(%rsp)
	movb	223(%rdx), %sil
	movb	%sil, 255(%rsp)
	movb	224(%rdx), %sil
	movb	%sil, 256(%rsp)
	movb	225(%rdx), %sil
	movb	%sil, 257(%rsp)
	movb	226(%rdx), %sil
	movb	%sil, 258(%rsp)
	movb	227(%rdx), %sil
	movb	%sil, 259(%rsp)
	movb	228(%rdx), %sil
	movb	%sil, 260(%rsp)
	movb	229(%rdx), %sil
	movb	%sil, 261(%rsp)
	movb	230(%rdx), %sil
	movb	%sil, 262(%rsp)
	movb	231(%rdx), %sil
	movb	%sil, 263(%rsp)
	movb	232(%rdx), %sil
	movb	%sil, 264(%rsp)
	movb	233(%rdx), %sil
	movb	%sil, 265(%rsp)
	movb	234(%rdx), %sil
	movb	%sil, 266(%rsp)
	movb	235(%rdx), %sil
	movb	%sil, 267(%rsp)
	movb	236(%rdx), %sil
	movb	%sil, 268(%rsp)
	movb	237(%rdx), %sil
	movb	%sil, 269(%rsp)
	movb	238(%rdx), %sil
	movb	%sil, 270(%rsp)
	movb	239(%rdx), %sil
	movb	%sil, 271(%rsp)
	movb	240(%rdx), %sil
	movb	%sil, 272(%rsp)
	movb	241(%rdx), %sil
	movb	%sil, 273(%rsp)
	movb	242(%rdx), %sil
	movb	%sil, 274(%rsp)
	movb	243(%rdx), %sil
	movb	%sil, 275(%rsp)
	movb	244(%rdx), %sil
	movb	%sil, 276(%rsp)
	movb	245(%rdx), %sil
	movb	%sil, 277(%rsp)
	movb	246(%rdx), %sil
	movb	%sil, 278(%rsp)
	movb	247(%rdx), %sil
	movb	%sil, 279(%rsp)
	movb	248(%rdx), %sil
	movb	%sil, 280(%rsp)
	movb	249(%rdx), %sil
	movb	%sil, 281(%rsp)
	movb	250(%rdx), %sil
	movb	%sil, 282(%rsp)
	movb	251(%rdx), %sil
	movb	%sil, 283(%rsp)
	movb	252(%rdx), %sil
	movb	%sil, 284(%rsp)
	movb	253(%rdx), %sil
	movb	%sil, 285(%rsp)
	movb	254(%rdx), %sil
	movb	%sil, 286(%rsp)
	movb	255(%rdx), %sil
	movb	%sil, 287(%rsp)
	movb	256(%rdx), %sil
	movb	%sil, 288(%rsp)
	movb	257(%rdx), %sil
	movb	%sil, 289(%rsp)
	movb	258(%rdx), %sil
	movb	%sil, 290(%rsp)
	movb	259(%rdx), %sil
	movb	%sil, 291(%rsp)
	movb	260(%rdx), %sil
	movb	%sil, 292(%rsp)
	movb	261(%rdx), %sil
	movb	%sil, 293(%rsp)
	movb	262(%rdx), %sil
	movb	%sil, 294(%rsp)
	movb	263(%rdx), %sil
	movb	%sil, 295(%rsp)
	movb	264(%rdx), %sil
	movb	%sil, 296(%rsp)
	movb	265(%rdx), %sil
	movb	%sil, 297(%rsp)
	movb	266(%rdx), %sil
	movb	%sil, 298(%rsp)
	movb	267(%rdx), %sil
	movb	%sil, 299(%rsp)
	movb	268(%rdx), %sil
	movb	%sil, 300(%rsp)
	movb	269(%rdx), %sil
	movb	%sil, 301(%rsp)
	movb	270(%rdx), %sil
	movb	%sil, 302(%rsp)
	movb	271(%rdx), %sil
	movb	%sil, 303(%rsp)
	movb	272(%rdx), %sil
	movb	%sil, 304(%rsp)
	movb	273(%rdx), %sil
	movb	%sil, 305(%rsp)
	movb	274(%rdx), %sil
	movb	%sil, 306(%rsp)
	movb	275(%rdx), %sil
	movb	%sil, 307(%rsp)
	movb	276(%rdx), %sil
	movb	%sil, 308(%rsp)
	movb	277(%rdx), %sil
	movb	%sil, 309(%rsp)
	movb	278(%rdx), %sil
	movb	%sil, 310(%rsp)
	movb	279(%rdx), %sil
	movb	%sil, 311(%rsp)
	movb	280(%rdx), %sil
	movb	%sil, 312(%rsp)
	movb	281(%rdx), %sil
	movb	%sil, 313(%rsp)
	movb	282(%rdx), %sil
	movb	%sil, 314(%rsp)
	movb	283(%rdx), %sil
	movb	%sil, 315(%rsp)
	movb	284(%rdx), %sil
	movb	%sil, 316(%rsp)
	movb	285(%rdx), %sil
	movb	%sil, 317(%rsp)
	movb	286(%rdx), %sil
	movb	%sil, 318(%rsp)
	movb	287(%rdx), %sil
	movb	%sil, 319(%rsp)
	movb	288(%rdx), %sil
	movb	%sil, 320(%rsp)
	movb	289(%rdx), %sil
	movb	%sil, 321(%rsp)
	movb	290(%rdx), %sil
	movb	%sil, 322(%rsp)
	movb	291(%rdx), %sil
	movb	%sil, 323(%rsp)
	movb	292(%rdx), %sil
	movb	%sil, 324(%rsp)
	movb	293(%rdx), %sil
	movb	%sil, 325(%rsp)
	movb	294(%rdx), %sil
	movb	%sil, 326(%rsp)
	movb	295(%rdx), %sil
	movb	%sil, 327(%rsp)
	movb	296(%rdx), %sil
	movb	%sil, 328(%rsp)
	movb	297(%rdx), %sil
	movb	%sil, 329(%rsp)
	movb	298(%rdx), %sil
	movb	%sil, 330(%rsp)
	movb	299(%rdx), %sil
	movb	%sil, 331(%rsp)
	movb	300(%rdx), %sil
	movb	%sil, 332(%rsp)
	movb	301(%rdx), %sil
	movb	%sil, 333(%rsp)
	movb	302(%rdx), %sil
	movb	%sil, 334(%rsp)
	movb	303(%rdx), %sil
	movb	%sil, 335(%rsp)
	movb	304(%rdx), %sil
	movb	%sil, 336(%rsp)
	movb	305(%rdx), %sil
	movb	%sil, 337(%rsp)
	movb	306(%rdx), %sil
	movb	%sil, 338(%rsp)
	movb	307(%rdx), %sil
	movb	%sil, 339(%rsp)
	movb	308(%rdx), %sil
	movb	%sil, 340(%rsp)
	movb	309(%rdx), %sil
	movb	%sil, 341(%rsp)
	movb	310(%rdx), %sil
	movb	%sil, 342(%rsp)
	movb	311(%rdx), %sil
	movb	%sil, 343(%rsp)
	movb	312(%rdx), %sil
	movb	%sil, 344(%rsp)
	movb	313(%rdx), %sil
	movb	%sil, 345(%rsp)
	movb	314(%rdx), %sil
	movb	%sil, 346(%rsp)
	movb	315(%rdx), %sil
	movb	%sil, 347(%rsp)
	movb	316(%rdx), %sil
	movb	%sil, 348(%rsp)
	movb	317(%rdx), %sil
	movb	%sil, 349(%rsp)
	movb	318(%rdx), %sil
	movb	%sil, 350(%rsp)
	movb	319(%rdx), %sil
	movb	%sil, 351(%rsp)
	movb	320(%rdx), %sil
	movb	%sil, 352(%rsp)
	movb	321(%rdx), %sil
	movb	%sil, 353(%rsp)
	movb	322(%rdx), %sil
	movb	%sil, 354(%rsp)
	movb	323(%rdx), %sil
	movb	%sil, 355(%rsp)
	movb	324(%rdx), %sil
	movb	%sil, 356(%rsp)
	movb	325(%rdx), %sil
	movb	%sil, 357(%rsp)
	movb	326(%rdx), %sil
	movb	%sil, 358(%rsp)
	movb	327(%rdx), %sil
	movb	%sil, 359(%rsp)
	movb	328(%rdx), %sil
	movb	%sil, 360(%rsp)
	movb	329(%rdx), %sil
	movb	%sil, 361(%rsp)
	movb	330(%rdx), %sil
	movb	%sil, 362(%rsp)
	movb	331(%rdx), %sil
	movb	%sil, 363(%rsp)
	movb	332(%rdx), %sil
	movb	%sil, 364(%rsp)
	movb	333(%rdx), %sil
	movb	%sil, 365(%rsp)
	movb	334(%rdx), %sil
	movb	%sil, 366(%rsp)
	movb	335(%rdx), %sil
	movb	%sil, 367(%rsp)
	movb	336(%rdx), %sil
	movb	%sil, 368(%rsp)
	movb	337(%rdx), %sil
	movb	%sil, 369(%rsp)
	movb	338(%rdx), %sil
	movb	%sil, 370(%rsp)
	movb	339(%rdx), %sil
	movb	%sil, 371(%rsp)
	movb	340(%rdx), %sil
	movb	%sil, 372(%rsp)
	movb	341(%rdx), %sil
	movb	%sil, 373(%rsp)
	movb	342(%rdx), %sil
	movb	%sil, 374(%rsp)
	movb	343(%rdx), %sil
	movb	%sil, 375(%rsp)
	movb	344(%rdx), %sil
	movb	%sil, 376(%rsp)
	movb	345(%rdx), %sil
	movb	%sil, 377(%rsp)
	movb	346(%rdx), %sil
	movb	%sil, 378(%rsp)
	movb	347(%rdx), %sil
	movb	%sil, 379(%rsp)
	movb	348(%rdx), %sil
	movb	%sil, 380(%rsp)
	movb	349(%rdx), %sil
	movb	%sil, 381(%rsp)
	movb	350(%rdx), %sil
	movb	%sil, 382(%rsp)
	movb	351(%rdx), %sil
	movb	%sil, 383(%rsp)
	movb	352(%rdx), %sil
	movb	%sil, 384(%rsp)
	movb	353(%rdx), %sil
	movb	%sil, 385(%rsp)
	movb	354(%rdx), %sil
	movb	%sil, 386(%rsp)
	movb	355(%rdx), %sil
	movb	%sil, 387(%rsp)
	movb	356(%rdx), %sil
	movb	%sil, 388(%rsp)
	movb	357(%rdx), %sil
	movb	%sil, 389(%rsp)
	movb	358(%rdx), %sil
	movb	%sil, 390(%rsp)
	movb	359(%rdx), %sil
	movb	%sil, 391(%rsp)
	movb	360(%rdx), %sil
	movb	%sil, 392(%rsp)
	movb	361(%rdx), %sil
	movb	%sil, 393(%rsp)
	movb	362(%rdx), %sil
	movb	%sil, 394(%rsp)
	movb	363(%rdx), %sil
	movb	%sil, 395(%rsp)
	movb	364(%rdx), %sil
	movb	%sil, 396(%rsp)
	movb	365(%rdx), %sil
	movb	%sil, 397(%rsp)
	movb	366(%rdx), %sil
	movb	%sil, 398(%rsp)
	movb	367(%rdx), %sil
	movb	%sil, 399(%rsp)
	movb	368(%rdx), %sil
	movb	%sil, 400(%rsp)
	movb	369(%rdx), %sil
	movb	%sil, 401(%rsp)
	movb	370(%rdx), %sil
	movb	%sil, 402(%rsp)
	movb	371(%rdx), %sil
	movb	%sil, 403(%rsp)
	movb	372(%rdx), %sil
	movb	%sil, 404(%rsp)
	movb	373(%rdx), %sil
	movb	%sil, 405(%rsp)
	movb	374(%rdx), %sil
	movb	%sil, 406(%rsp)
	movb	375(%rdx), %sil
	movb	%sil, 407(%rsp)
	movb	376(%rdx), %sil
	movb	%sil, 408(%rsp)
	movb	377(%rdx), %sil
	movb	%sil, 409(%rsp)
	movb	378(%rdx), %sil
	movb	%sil, 410(%rsp)
	movb	379(%rdx), %sil
	movb	%sil, 411(%rsp)
	movb	380(%rdx), %sil
	movb	%sil, 412(%rsp)
	movb	381(%rdx), %sil
	movb	%sil, 413(%rsp)
	movb	382(%rdx), %sil
	movb	%sil, 414(%rsp)
	movb	383(%rdx), %sil
	movb	%sil, 415(%rsp)
	movb	384(%rdx), %sil
	movb	%sil, 416(%rsp)
	movb	385(%rdx), %sil
	movb	%sil, 417(%rsp)
	movb	386(%rdx), %sil
	movb	%sil, 418(%rsp)
	movb	387(%rdx), %sil
	movb	%sil, 419(%rsp)
	movb	388(%rdx), %sil
	movb	%sil, 420(%rsp)
	movb	389(%rdx), %sil
	movb	%sil, 421(%rsp)
	movb	390(%rdx), %sil
	movb	%sil, 422(%rsp)
	movb	391(%rdx), %sil
	movb	%sil, 423(%rsp)
	movb	392(%rdx), %sil
	movb	%sil, 424(%rsp)
	movb	393(%rdx), %sil
	movb	%sil, 425(%rsp)
	movb	394(%rdx), %sil
	movb	%sil, 426(%rsp)
	movb	395(%rdx), %sil
	movb	%sil, 427(%rsp)
	movb	396(%rdx), %sil
	movb	%sil, 428(%rsp)
	movb	397(%rdx), %sil
	movb	%sil, 429(%rsp)
	movb	398(%rdx), %sil
	movb	%sil, 430(%rsp)
	movb	399(%rdx), %sil
	movb	%sil, 431(%rsp)
	movb	400(%rdx), %sil
	movb	%sil, 432(%rsp)
	movb	401(%rdx), %sil
	movb	%sil, 433(%rsp)
	movb	402(%rdx), %sil
	movb	%sil, 434(%rsp)
	movb	403(%rdx), %sil
	movb	%sil, 435(%rsp)
	movb	404(%rdx), %sil
	movb	%sil, 436(%rsp)
	movb	405(%rdx), %sil
	movb	%sil, 437(%rsp)
	movb	406(%rdx), %sil
	movb	%sil, 438(%rsp)
	movb	407(%rdx), %sil
	movb	%sil, 439(%rsp)
	movb	408(%rdx), %sil
	movb	%sil, 440(%rsp)
	movb	409(%rdx), %sil
	movb	%sil, 441(%rsp)
	movb	410(%rdx), %sil
	movb	%sil, 442(%rsp)
	movb	411(%rdx), %sil
	movb	%sil, 443(%rsp)
	movb	412(%rdx), %sil
	movb	%sil, 444(%rsp)
	movb	413(%rdx), %sil
	movb	%sil, 445(%rsp)
	movb	414(%rdx), %sil
	movb	%sil, 446(%rsp)
	movb	415(%rdx), %sil
	movb	%sil, 447(%rsp)
	movb	416(%rdx), %sil
	movb	%sil, 448(%rsp)
	movb	417(%rdx), %sil
	movb	%sil, 449(%rsp)
	movb	418(%rdx), %sil
	movb	%sil, 450(%rsp)
	movb	419(%rdx), %sil
	movb	%sil, 451(%rsp)
	movb	420(%rdx), %sil
	movb	%sil, 452(%rsp)
	movb	421(%rdx), %sil
	movb	%sil, 453(%rsp)
	movb	422(%rdx), %sil
	movb	%sil, 454(%rsp)
	movb	423(%rdx), %sil
	movb	%sil, 455(%rsp)
	movb	424(%rdx), %sil
	movb	%sil, 456(%rsp)
	movb	425(%rdx), %sil
	movb	%sil, 457(%rsp)
	movb	426(%rdx), %sil
	movb	%sil, 458(%rsp)
	movb	427(%rdx), %sil
	movb	%sil, 459(%rsp)
	movb	428(%rdx), %sil
	movb	%sil, 460(%rsp)
	movb	429(%rdx), %sil
	movb	%sil, 461(%rsp)
	movb	430(%rdx), %sil
	movb	%sil, 462(%rsp)
	movb	431(%rdx), %sil
	movb	%sil, 463(%rsp)
	movb	432(%rdx), %sil
	movb	%sil, 464(%rsp)
	movb	433(%rdx), %sil
	movb	%sil, 465(%rsp)
	movb	434(%rdx), %sil
	movb	%sil, 466(%rsp)
	movb	435(%rdx), %sil
	movb	%sil, 467(%rsp)
	movb	436(%rdx), %sil
	movb	%sil, 468(%rsp)
	movb	437(%rdx), %sil
	movb	%sil, 469(%rsp)
	movb	438(%rdx), %sil
	movb	%sil, 470(%rsp)
	movb	439(%rdx), %sil
	movb	%sil, 471(%rsp)
	movb	440(%rdx), %sil
	movb	%sil, 472(%rsp)
	movb	441(%rdx), %sil
	movb	%sil, 473(%rsp)
	movb	442(%rdx), %sil
	movb	%sil, 474(%rsp)
	movb	443(%rdx), %sil
	movb	%sil, 475(%rsp)
	movb	444(%rdx), %sil
	movb	%sil, 476(%rsp)
	movb	445(%rdx), %sil
	movb	%sil, 477(%rsp)
	movb	446(%rdx), %sil
	movb	%sil, 478(%rsp)
	movb	447(%rdx), %sil
	movb	%sil, 479(%rsp)
	movb	448(%rdx), %sil
	movb	%sil, 480(%rsp)
	movb	449(%rdx), %sil
	movb	%sil, 481(%rsp)
	movb	450(%rdx), %sil
	movb	%sil, 482(%rsp)
	movb	451(%rdx), %sil
	movb	%sil, 483(%rsp)
	movb	452(%rdx), %sil
	movb	%sil, 484(%rsp)
	movb	453(%rdx), %sil
	movb	%sil, 485(%rsp)
	movb	454(%rdx), %sil
	movb	%sil, 486(%rsp)
	movb	455(%rdx), %sil
	movb	%sil, 487(%rsp)
	movb	456(%rdx), %sil
	movb	%sil, 488(%rsp)
	movb	457(%rdx), %sil
	movb	%sil, 489(%rsp)
	movb	458(%rdx), %sil
	movb	%sil, 490(%rsp)
	movb	459(%rdx), %sil
	movb	%sil, 491(%rsp)
	movb	460(%rdx), %sil
	movb	%sil, 492(%rsp)
	movb	461(%rdx), %sil
	movb	%sil, 493(%rsp)
	movb	462(%rdx), %sil
	movb	%sil, 494(%rsp)
	movb	463(%rdx), %sil
	movb	%sil, 495(%rsp)
	movb	464(%rdx), %sil
	movb	%sil, 496(%rsp)
	movb	465(%rdx), %sil
	movb	%sil, 497(%rsp)
	movb	466(%rdx), %sil
	movb	%sil, 498(%rsp)
	movb	467(%rdx), %sil
	movb	%sil, 499(%rsp)
	movb	468(%rdx), %sil
	movb	%sil, 500(%rsp)
	movb	469(%rdx), %sil
	movb	%sil, 501(%rsp)
	movb	470(%rdx), %sil
	movb	%sil, 502(%rsp)
	movb	471(%rdx), %sil
	movb	%sil, 503(%rsp)
	movb	472(%rdx), %sil
	movb	%sil, 504(%rsp)
	movb	473(%rdx), %sil
	movb	%sil, 505(%rsp)
	movb	474(%rdx), %sil
	movb	%sil, 506(%rsp)
	movb	475(%rdx), %sil
	movb	%sil, 507(%rsp)
	movb	476(%rdx), %sil
	movb	%sil, 508(%rsp)
	movb	477(%rdx), %sil
	movb	%sil, 509(%rsp)
	movb	478(%rdx), %sil
	movb	%sil, 510(%rsp)
	movb	479(%rdx), %sil
	movb	%sil, 511(%rsp)
	movb	480(%rdx), %sil
	movb	%sil, 512(%rsp)
	movb	481(%rdx), %sil
	movb	%sil, 513(%rsp)
	movb	482(%rdx), %sil
	movb	%sil, 514(%rsp)
	movb	483(%rdx), %sil
	movb	%sil, 515(%rsp)
	movb	484(%rdx), %sil
	movb	%sil, 516(%rsp)
	movb	485(%rdx), %sil
	movb	%sil, 517(%rsp)
	movb	486(%rdx), %sil
	movb	%sil, 518(%rsp)
	movb	487(%rdx), %sil
	movb	%sil, 519(%rsp)
	movb	488(%rdx), %sil
	movb	%sil, 520(%rsp)
	movb	489(%rdx), %sil
	movb	%sil, 521(%rsp)
	movb	490(%rdx), %sil
	movb	%sil, 522(%rsp)
	movb	491(%rdx), %sil
	movb	%sil, 523(%rsp)
	movb	492(%rdx), %sil
	movb	%sil, 524(%rsp)
	movb	493(%rdx), %sil
	movb	%sil, 525(%rsp)
	movb	494(%rdx), %sil
	movb	%sil, 526(%rsp)
	movb	495(%rdx), %sil
	movb	%sil, 527(%rsp)
	movb	496(%rdx), %sil
	movb	%sil, 528(%rsp)
	movb	497(%rdx), %sil
	movb	%sil, 529(%rsp)
	movb	498(%rdx), %sil
	movb	%sil, 530(%rsp)
	movb	499(%rdx), %sil
	movb	%sil, 531(%rsp)
	movb	500(%rdx), %sil
	movb	%sil, 532(%rsp)
	movb	501(%rdx), %sil
	movb	%sil, 533(%rsp)
	movb	502(%rdx), %sil
	movb	%sil, 534(%rsp)
	movb	503(%rdx), %sil
	movb	%sil, 535(%rsp)
	movb	504(%rdx), %sil
	movb	%sil, 536(%rsp)
	movb	505(%rdx), %sil
	movb	%sil, 537(%rsp)
	movb	506(%rdx), %sil
	movb	%sil, 538(%rsp)
	movb	507(%rdx), %sil
	movb	%sil, 539(%rsp)
	movb	508(%rdx), %sil
	movb	%sil, 540(%rsp)
	movb	509(%rdx), %sil
	movb	%sil, 541(%rsp)
	movb	510(%rdx), %sil
	movb	%sil, 542(%rsp)
	movb	511(%rdx), %sil
	movb	%sil, 543(%rsp)
	movb	512(%rdx), %sil
	movb	%sil, 544(%rsp)
	movb	513(%rdx), %sil
	movb	%sil, 545(%rsp)
	movb	514(%rdx), %sil
	movb	%sil, 546(%rsp)
	movb	515(%rdx), %sil
	movb	%sil, 547(%rsp)
	movb	516(%rdx), %sil
	movb	%sil, 548(%rsp)
	movb	517(%rdx), %sil
	movb	%sil, 549(%rsp)
	movb	518(%rdx), %sil
	movb	%sil, 550(%rsp)
	movb	519(%rdx), %sil
	movb	%sil, 551(%rsp)
	movb	520(%rdx), %sil
	movb	%sil, 552(%rsp)
	movb	521(%rdx), %sil
	movb	%sil, 553(%rsp)
	movb	522(%rdx), %sil
	movb	%sil, 554(%rsp)
	movb	523(%rdx), %sil
	movb	%sil, 555(%rsp)
	movb	524(%rdx), %sil
	movb	%sil, 556(%rsp)
	movb	525(%rdx), %sil
	movb	%sil, 557(%rsp)
	movb	526(%rdx), %sil
	movb	%sil, 558(%rsp)
	movb	527(%rdx), %sil
	movb	%sil, 559(%rsp)
	movb	528(%rdx), %sil
	movb	%sil, 560(%rsp)
	movb	529(%rdx), %sil
	movb	%sil, 561(%rsp)
	movb	530(%rdx), %sil
	movb	%sil, 562(%rsp)
	movb	531(%rdx), %sil
	movb	%sil, 563(%rsp)
	movb	532(%rdx), %sil
	movb	%sil, 564(%rsp)
	movb	533(%rdx), %sil
	movb	%sil, 565(%rsp)
	movb	534(%rdx), %sil
	movb	%sil, 566(%rsp)
	movb	535(%rdx), %sil
	movb	%sil, 567(%rsp)
	movb	536(%rdx), %sil
	movb	%sil, 568(%rsp)
	movb	537(%rdx), %sil
	movb	%sil, 569(%rsp)
	movb	538(%rdx), %sil
	movb	%sil, 570(%rsp)
	movb	539(%rdx), %sil
	movb	%sil, 571(%rsp)
	movb	540(%rdx), %sil
	movb	%sil, 572(%rsp)
	movb	541(%rdx), %sil
	movb	%sil, 573(%rsp)
	movb	542(%rdx), %sil
	movb	%sil, 574(%rsp)
	movb	543(%rdx), %sil
	movb	%sil, 575(%rsp)
	movb	544(%rdx), %sil
	movb	%sil, 576(%rsp)
	movb	545(%rdx), %sil
	movb	%sil, 577(%rsp)
	movb	546(%rdx), %sil
	movb	%sil, 578(%rsp)
	movb	547(%rdx), %sil
	movb	%sil, 579(%rsp)
	movb	548(%rdx), %sil
	movb	%sil, 580(%rsp)
	movb	549(%rdx), %sil
	movb	%sil, 581(%rsp)
	movb	550(%rdx), %sil
	movb	%sil, 582(%rsp)
	movb	551(%rdx), %sil
	movb	%sil, 583(%rsp)
	movb	552(%rdx), %sil
	movb	%sil, 584(%rsp)
	movb	553(%rdx), %sil
	movb	%sil, 585(%rsp)
	movb	554(%rdx), %sil
	movb	%sil, 586(%rsp)
	movb	555(%rdx), %sil
	movb	%sil, 587(%rsp)
	movb	556(%rdx), %sil
	movb	%sil, 588(%rsp)
	movb	557(%rdx), %sil
	movb	%sil, 589(%rsp)
	movb	558(%rdx), %sil
	movb	%sil, 590(%rsp)
	movb	559(%rdx), %sil
	movb	%sil, 591(%rsp)
	movb	560(%rdx), %sil
	movb	%sil, 592(%rsp)
	movb	561(%rdx), %sil
	movb	%sil, 593(%rsp)
	movb	562(%rdx), %sil
	movb	%sil, 594(%rsp)
	movb	563(%rdx), %sil
	movb	%sil, 595(%rsp)
	movb	564(%rdx), %sil
	movb	%sil, 596(%rsp)
	movb	565(%rdx), %sil
	movb	%sil, 597(%rsp)
	movb	566(%rdx), %sil
	movb	%sil, 598(%rsp)
	movb	567(%rdx), %sil
	movb	%sil, 599(%rsp)
	movb	568(%rdx), %sil
	movb	%sil, 600(%rsp)
	movb	569(%rdx), %sil
	movb	%sil, 601(%rsp)
	movb	570(%rdx), %sil
	movb	%sil, 602(%rsp)
	movb	571(%rdx), %sil
	movb	%sil, 603(%rsp)
	movb	572(%rdx), %sil
	movb	%sil, 604(%rsp)
	movb	573(%rdx), %sil
	movb	%sil, 605(%rsp)
	movb	574(%rdx), %sil
	movb	%sil, 606(%rsp)
	movb	575(%rdx), %sil
	movb	%sil, 607(%rsp)
	movb	576(%rdx), %sil
	movb	%sil, 608(%rsp)
	movb	577(%rdx), %sil
	movb	%sil, 609(%rsp)
	movb	578(%rdx), %sil
	movb	%sil, 610(%rsp)
	movb	579(%rdx), %sil
	movb	%sil, 611(%rsp)
	movb	580(%rdx), %sil
	movb	%sil, 612(%rsp)
	movb	581(%rdx), %sil
	movb	%sil, 613(%rsp)
	movb	582(%rdx), %sil
	movb	%sil, 614(%rsp)
	movb	583(%rdx), %sil
	movb	%sil, 615(%rsp)
	movb	584(%rdx), %sil
	movb	%sil, 616(%rsp)
	movb	585(%rdx), %sil
	movb	%sil, 617(%rsp)
	movb	586(%rdx), %sil
	movb	%sil, 618(%rsp)
	movb	587(%rdx), %sil
	movb	%sil, 619(%rsp)
	movb	588(%rdx), %sil
	movb	%sil, 620(%rsp)
	movb	589(%rdx), %sil
	movb	%sil, 621(%rsp)
	movb	590(%rdx), %sil
	movb	%sil, 622(%rsp)
	movb	591(%rdx), %sil
	movb	%sil, 623(%rsp)
	movb	592(%rdx), %sil
	movb	%sil, 624(%rsp)
	movb	593(%rdx), %sil
	movb	%sil, 625(%rsp)
	movb	594(%rdx), %sil
	movb	%sil, 626(%rsp)
	movb	595(%rdx), %sil
	movb	%sil, 627(%rsp)
	movb	596(%rdx), %sil
	movb	%sil, 628(%rsp)
	movb	597(%rdx), %sil
	movb	%sil, 629(%rsp)
	movb	598(%rdx), %sil
	movb	%sil, 630(%rsp)
	movb	599(%rdx), %sil
	movb	%sil, 631(%rsp)
	movb	600(%rdx), %sil
	movb	%sil, 632(%rsp)
	movb	601(%rdx), %sil
	movb	%sil, 633(%rsp)
	movb	602(%rdx), %sil
	movb	%sil, 634(%rsp)
	movb	603(%rdx), %sil
	movb	%sil, 635(%rsp)
	movb	604(%rdx), %sil
	movb	%sil, 636(%rsp)
	movb	605(%rdx), %sil
	movb	%sil, 637(%rsp)
	movb	606(%rdx), %sil
	movb	%sil, 638(%rsp)
	movb	607(%rdx), %sil
	movb	%sil, 639(%rsp)
	movb	608(%rdx), %sil
	movb	%sil, 640(%rsp)
	movb	609(%rdx), %sil
	movb	%sil, 641(%rsp)
	movb	610(%rdx), %sil
	movb	%sil, 642(%rsp)
	movb	611(%rdx), %sil
	movb	%sil, 643(%rsp)
	movb	612(%rdx), %sil
	movb	%sil, 644(%rsp)
	movb	613(%rdx), %sil
	movb	%sil, 645(%rsp)
	movb	614(%rdx), %sil
	movb	%sil, 646(%rsp)
	movb	615(%rdx), %sil
	movb	%sil, 647(%rsp)
	movb	616(%rdx), %sil
	movb	%sil, 648(%rsp)
	movb	617(%rdx), %sil
	movb	%sil, 649(%rsp)
	movb	618(%rdx), %sil
	movb	%sil, 650(%rsp)
	movb	619(%rdx), %sil
	movb	%sil, 651(%rsp)
	movb	620(%rdx), %sil
	movb	%sil, 652(%rsp)
	movb	621(%rdx), %sil
	movb	%sil, 653(%rsp)
	movb	622(%rdx), %sil
	movb	%sil, 654(%rsp)
	movb	623(%rdx), %sil
	movb	%sil, 655(%rsp)
	movb	624(%rdx), %sil
	movb	%sil, 656(%rsp)
	movb	625(%rdx), %sil
	movb	%sil, 657(%rsp)
	movb	626(%rdx), %sil
	movb	%sil, 658(%rsp)
	movb	627(%rdx), %sil
	movb	%sil, 659(%rsp)
	movb	628(%rdx), %sil
	movb	%sil, 660(%rsp)
	movb	629(%rdx), %sil
	movb	%sil, 661(%rsp)
	movb	630(%rdx), %sil
	movb	%sil, 662(%rsp)
	movb	631(%rdx), %sil
	movb	%sil, 663(%rsp)
	movb	632(%rdx), %sil
	movb	%sil, 664(%rsp)
	movb	633(%rdx), %sil
	movb	%sil, 665(%rsp)
	movb	634(%rdx), %sil
	movb	%sil, 666(%rsp)
	movb	635(%rdx), %sil
	movb	%sil, 667(%rsp)
	movb	636(%rdx), %sil
	movb	%sil, 668(%rsp)
	movb	637(%rdx), %sil
	movb	%sil, 669(%rsp)
	movb	638(%rdx), %sil
	movb	%sil, 670(%rsp)
	movb	639(%rdx), %sil
	movb	%sil, 671(%rsp)
	movb	640(%rdx), %sil
	movb	%sil, 672(%rsp)
	movb	641(%rdx), %sil
	movb	%sil, 673(%rsp)
	movb	642(%rdx), %sil
	movb	%sil, 674(%rsp)
	movb	643(%rdx), %sil
	movb	%sil, 675(%rsp)
	movb	644(%rdx), %sil
	movb	%sil, 676(%rsp)
	movb	645(%rdx), %sil
	movb	%sil, 677(%rsp)
	movb	646(%rdx), %sil
	movb	%sil, 678(%rsp)
	movb	647(%rdx), %sil
	movb	%sil, 679(%rsp)
	movb	648(%rdx), %sil
	movb	%sil, 680(%rsp)
	movb	649(%rdx), %sil
	movb	%sil, 681(%rsp)
	movb	650(%rdx), %sil
	movb	%sil, 682(%rsp)
	movb	651(%rdx), %sil
	movb	%sil, 683(%rsp)
	movb	652(%rdx), %sil
	movb	%sil, 684(%rsp)
	movb	653(%rdx), %sil
	movb	%sil, 685(%rsp)
	movb	654(%rdx), %sil
	movb	%sil, 686(%rsp)
	movb	655(%rdx), %sil
	movb	%sil, 687(%rsp)
	movb	656(%rdx), %sil
	movb	%sil, 688(%rsp)
	movb	657(%rdx), %sil
	movb	%sil, 689(%rsp)
	movb	658(%rdx), %sil
	movb	%sil, 690(%rsp)
	movb	659(%rdx), %sil
	movb	%sil, 691(%rsp)
	movb	660(%rdx), %sil
	movb	%sil, 692(%rsp)
	movb	661(%rdx), %sil
	movb	%sil, 693(%rsp)
	movb	662(%rdx), %sil
	movb	%sil, 694(%rsp)
	movb	663(%rdx), %sil
	movb	%sil, 695(%rsp)
	movb	664(%rdx), %sil
	movb	%sil, 696(%rsp)
	movb	665(%rdx), %sil
	movb	%sil, 697(%rsp)
	movb	666(%rdx), %sil
	movb	%sil, 698(%rsp)
	movb	667(%rdx), %sil
	movb	%sil, 699(%rsp)
	movb	668(%rdx), %sil
	movb	%sil, 700(%rsp)
	movb	669(%rdx), %sil
	movb	%sil, 701(%rsp)
	movb	670(%rdx), %sil
	movb	%sil, 702(%rsp)
	movb	671(%rdx), %sil
	movb	%sil, 703(%rsp)
	movb	672(%rdx), %sil
	movb	%sil, 704(%rsp)
	movb	673(%rdx), %sil
	movb	%sil, 705(%rsp)
	movb	674(%rdx), %sil
	movb	%sil, 706(%rsp)
	movb	675(%rdx), %sil
	movb	%sil, 707(%rsp)
	movb	676(%rdx), %sil
	movb	%sil, 708(%rsp)
	movb	677(%rdx), %sil
	movb	%sil, 709(%rsp)
	movb	678(%rdx), %sil
	movb	%sil, 710(%rsp)
	movb	679(%rdx), %sil
	movb	%sil, 711(%rsp)
	movb	680(%rdx), %sil
	movb	%sil, 712(%rsp)
	movb	681(%rdx), %sil
	movb	%sil, 713(%rsp)
	movb	682(%rdx), %sil
	movb	%sil, 714(%rsp)
	movb	683(%rdx), %sil
	movb	%sil, 715(%rsp)
	movb	684(%rdx), %sil
	movb	%sil, 716(%rsp)
	movb	685(%rdx), %sil
	movb	%sil, 717(%rsp)
	movb	686(%rdx), %sil
	movb	%sil, 718(%rsp)
	movb	687(%rdx), %sil
	movb	%sil, 719(%rsp)
	movb	688(%rdx), %sil
	movb	%sil, 720(%rsp)
	movb	689(%rdx), %sil
	movb	%sil, 721(%rsp)
	movb	690(%rdx), %sil
	movb	%sil, 722(%rsp)
	movb	691(%rdx), %sil
	movb	%sil, 723(%rsp)
	movb	692(%rdx), %sil
	movb	%sil, 724(%rsp)
	movb	693(%rdx), %sil
	movb	%sil, 725(%rsp)
	movb	694(%rdx), %sil
	movb	%sil, 726(%rsp)
	movb	695(%rdx), %sil
	movb	%sil, 727(%rsp)
	movb	696(%rdx), %sil
	movb	%sil, 728(%rsp)
	movb	697(%rdx), %sil
	movb	%sil, 729(%rsp)
	movb	698(%rdx), %sil
	movb	%sil, 730(%rsp)
	movb	699(%rdx), %sil
	movb	%sil, 731(%rsp)
	movb	700(%rdx), %sil
	movb	%sil, 732(%rsp)
	movb	701(%rdx), %sil
	movb	%sil, 733(%rsp)
	movb	702(%rdx), %sil
	movb	%sil, 734(%rsp)
	movb	703(%rdx), %sil
	movb	%sil, 735(%rsp)
	movb	704(%rdx), %sil
	movb	%sil, 736(%rsp)
	movb	705(%rdx), %sil
	movb	%sil, 737(%rsp)
	movb	706(%rdx), %sil
	movb	%sil, 738(%rsp)
	movb	707(%rdx), %sil
	movb	%sil, 739(%rsp)
	movb	708(%rdx), %sil
	movb	%sil, 740(%rsp)
	movb	709(%rdx), %sil
	movb	%sil, 741(%rsp)
	movb	710(%rdx), %sil
	movb	%sil, 742(%rsp)
	movb	711(%rdx), %sil
	movb	%sil, 743(%rsp)
	movb	712(%rdx), %sil
	movb	%sil, 744(%rsp)
	movb	713(%rdx), %sil
	movb	%sil, 745(%rsp)
	movb	714(%rdx), %sil
	movb	%sil, 746(%rsp)
	movb	715(%rdx), %sil
	movb	%sil, 747(%rsp)
	movb	716(%rdx), %sil
	movb	%sil, 748(%rsp)
	movb	717(%rdx), %sil
	movb	%sil, 749(%rsp)
	movb	718(%rdx), %sil
	movb	%sil, 750(%rsp)
	movb	719(%rdx), %sil
	movb	%sil, 751(%rsp)
	movb	720(%rdx), %sil
	movb	%sil, 752(%rsp)
	movb	721(%rdx), %sil
	movb	%sil, 753(%rsp)
	movb	722(%rdx), %sil
	movb	%sil, 754(%rsp)
	movb	723(%rdx), %sil
	movb	%sil, 755(%rsp)
	movb	724(%rdx), %sil
	movb	%sil, 756(%rsp)
	movb	725(%rdx), %sil
	movb	%sil, 757(%rsp)
	movb	726(%rdx), %sil
	movb	%sil, 758(%rsp)
	movb	727(%rdx), %sil
	movb	%sil, 759(%rsp)
	movb	728(%rdx), %sil
	movb	%sil, 760(%rsp)
	movb	729(%rdx), %sil
	movb	%sil, 761(%rsp)
	movb	730(%rdx), %sil
	movb	%sil, 762(%rsp)
	movb	731(%rdx), %sil
	movb	%sil, 763(%rsp)
	movb	732(%rdx), %sil
	movb	%sil, 764(%rsp)
	movb	733(%rdx), %sil
	movb	%sil, 765(%rsp)
	movb	734(%rdx), %sil
	movb	%sil, 766(%rsp)
	movb	735(%rdx), %sil
	movb	%sil, 767(%rsp)
	movb	736(%rdx), %sil
	movb	%sil, 768(%rsp)
	movb	737(%rdx), %sil
	movb	%sil, 769(%rsp)
	movb	738(%rdx), %sil
	movb	%sil, 770(%rsp)
	movb	739(%rdx), %sil
	movb	%sil, 771(%rsp)
	movb	740(%rdx), %sil
	movb	%sil, 772(%rsp)
	movb	741(%rdx), %sil
	movb	%sil, 773(%rsp)
	movb	742(%rdx), %sil
	movb	%sil, 774(%rsp)
	movb	743(%rdx), %sil
	movb	%sil, 775(%rsp)
	movb	744(%rdx), %sil
	movb	%sil, 776(%rsp)
	movb	745(%rdx), %sil
	movb	%sil, 777(%rsp)
	movb	746(%rdx), %sil
	movb	%sil, 778(%rsp)
	movb	747(%rdx), %sil
	movb	%sil, 779(%rsp)
	movb	748(%rdx), %sil
	movb	%sil, 780(%rsp)
	movb	749(%rdx), %sil
	movb	%sil, 781(%rsp)
	movb	750(%rdx), %sil
	movb	%sil, 782(%rsp)
	movb	751(%rdx), %sil
	movb	%sil, 783(%rsp)
	movb	752(%rdx), %sil
	movb	%sil, 784(%rsp)
	movb	753(%rdx), %sil
	movb	%sil, 785(%rsp)
	movb	754(%rdx), %sil
	movb	%sil, 786(%rsp)
	movb	755(%rdx), %sil
	movb	%sil, 787(%rsp)
	movb	756(%rdx), %sil
	movb	%sil, 788(%rsp)
	movb	757(%rdx), %sil
	movb	%sil, 789(%rsp)
	movb	758(%rdx), %sil
	movb	%sil, 790(%rsp)
	movb	759(%rdx), %sil
	movb	%sil, 791(%rsp)
	movb	760(%rdx), %sil
	movb	%sil, 792(%rsp)
	movb	761(%rdx), %sil
	movb	%sil, 793(%rsp)
	movb	762(%rdx), %sil
	movb	%sil, 794(%rsp)
	movb	763(%rdx), %sil
	movb	%sil, 795(%rsp)
	movb	764(%rdx), %sil
	movb	%sil, 796(%rsp)
	movb	765(%rdx), %sil
	movb	%sil, 797(%rsp)
	movb	766(%rdx), %sil
	movb	%sil, 798(%rsp)
	movb	767(%rdx), %sil
	movb	%sil, 799(%rsp)
	movb	768(%rdx), %sil
	movb	%sil, 800(%rsp)
	movb	769(%rdx), %sil
	movb	%sil, 801(%rsp)
	movb	770(%rdx), %sil
	movb	%sil, 802(%rsp)
	movb	771(%rdx), %sil
	movb	%sil, 803(%rsp)
	movb	772(%rdx), %sil
	movb	%sil, 804(%rsp)
	movb	773(%rdx), %sil
	movb	%sil, 805(%rsp)
	movb	774(%rdx), %sil
	movb	%sil, 806(%rsp)
	movb	775(%rdx), %sil
	movb	%sil, 807(%rsp)
	movb	776(%rdx), %sil
	movb	%sil, 808(%rsp)
	movb	777(%rdx), %sil
	movb	%sil, 809(%rsp)
	movb	778(%rdx), %sil
	movb	%sil, 810(%rsp)
	movb	779(%rdx), %sil
	movb	%sil, 811(%rsp)
	movb	780(%rdx), %sil
	movb	%sil, 812(%rsp)
	movb	781(%rdx), %sil
	movb	%sil, 813(%rsp)
	movb	782(%rdx), %sil
	movb	%sil, 814(%rsp)
	movb	783(%rdx), %sil
	movb	%sil, 815(%rsp)
	movb	784(%rdx), %sil
	movb	%sil, 816(%rsp)
	movb	785(%rdx), %sil
	movb	%sil, 817(%rsp)
	movb	786(%rdx), %sil
	movb	%sil, 818(%rsp)
	movb	787(%rdx), %sil
	movb	%sil, 819(%rsp)
	movb	788(%rdx), %sil
	movb	%sil, 820(%rsp)
	movb	789(%rdx), %sil
	movb	%sil, 821(%rsp)
	movb	790(%rdx), %sil
	movb	%sil, 822(%rsp)
	movb	791(%rdx), %sil
	movb	%sil, 823(%rsp)
	movb	792(%rdx), %sil
	movb	%sil, 824(%rsp)
	movb	793(%rdx), %sil
	movb	%sil, 825(%rsp)
	movb	794(%rdx), %sil
	movb	%sil, 826(%rsp)
	movb	795(%rdx), %sil
	movb	%sil, 827(%rsp)
	movb	796(%rdx), %sil
	movb	%sil, 828(%rsp)
	movb	797(%rdx), %sil
	movb	%sil, 829(%rsp)
	movb	798(%rdx), %sil
	movb	%sil, 830(%rsp)
	movb	799(%rdx), %sil
	movb	%sil, 831(%rsp)
	movb	800(%rdx), %sil
	movb	%sil, 832(%rsp)
	movb	801(%rdx), %sil
	movb	%sil, 833(%rsp)
	movb	802(%rdx), %sil
	movb	%sil, 834(%rsp)
	movb	803(%rdx), %sil
	movb	%sil, 835(%rsp)
	movb	804(%rdx), %sil
	movb	%sil, 836(%rsp)
	movb	805(%rdx), %sil
	movb	%sil, 837(%rsp)
	movb	806(%rdx), %sil
	movb	%sil, 838(%rsp)
	movb	807(%rdx), %sil
	movb	%sil, 839(%rsp)
	movb	808(%rdx), %sil
	movb	%sil, 840(%rsp)
	movb	809(%rdx), %sil
	movb	%sil, 841(%rsp)
	movb	810(%rdx), %sil
	movb	%sil, 842(%rsp)
	movb	811(%rdx), %sil
	movb	%sil, 843(%rsp)
	movb	812(%rdx), %sil
	movb	%sil, 844(%rsp)
	movb	813(%rdx), %sil
	movb	%sil, 845(%rsp)
	movb	814(%rdx), %sil
	movb	%sil, 846(%rsp)
	movb	815(%rdx), %sil
	movb	%sil, 847(%rsp)
	movb	816(%rdx), %sil
	movb	%sil, 848(%rsp)
	movb	817(%rdx), %sil
	movb	%sil, 849(%rsp)
	movb	818(%rdx), %sil
	movb	%sil, 850(%rsp)
	movb	819(%rdx), %sil
	movb	%sil, 851(%rsp)
	movb	820(%rdx), %sil
	movb	%sil, 852(%rsp)
	movb	821(%rdx), %sil
	movb	%sil, 853(%rsp)
	movb	822(%rdx), %sil
	movb	%sil, 854(%rsp)
	movb	823(%rdx), %sil
	movb	%sil, 855(%rsp)
	movb	824(%rdx), %sil
	movb	%sil, 856(%rsp)
	movb	825(%rdx), %sil
	movb	%sil, 857(%rsp)
	movb	826(%rdx), %sil
	movb	%sil, 858(%rsp)
	movb	827(%rdx), %sil
	movb	%sil, 859(%rsp)
	movb	828(%rdx), %sil
	movb	%sil, 860(%rsp)
	movb	829(%rdx), %sil
	movb	%sil, 861(%rsp)
	movb	830(%rdx), %sil
	movb	%sil, 862(%rsp)
	movb	831(%rdx), %sil
	movb	%sil, 863(%rsp)
	movb	832(%rdx), %sil
	movb	%sil, 864(%rsp)
	movb	833(%rdx), %sil
	movb	%sil, 865(%rsp)
	movb	834(%rdx), %sil
	movb	%sil, 866(%rsp)
	movb	835(%rdx), %sil
	movb	%sil, 867(%rsp)
	movb	836(%rdx), %sil
	movb	%sil, 868(%rsp)
	movb	837(%rdx), %sil
	movb	%sil, 869(%rsp)
	movb	838(%rdx), %sil
	movb	%sil, 870(%rsp)
	movb	839(%rdx), %sil
	movb	%sil, 871(%rsp)
	movb	840(%rdx), %sil
	movb	%sil, 872(%rsp)
	movb	841(%rdx), %sil
	movb	%sil, 873(%rsp)
	movb	842(%rdx), %sil
	movb	%sil, 874(%rsp)
	movb	843(%rdx), %sil
	movb	%sil, 875(%rsp)
	movb	844(%rdx), %sil
	movb	%sil, 876(%rsp)
	movb	845(%rdx), %sil
	movb	%sil, 877(%rsp)
	movb	846(%rdx), %sil
	movb	%sil, 878(%rsp)
	movb	847(%rdx), %sil
	movb	%sil, 879(%rsp)
	movb	848(%rdx), %sil
	movb	%sil, 880(%rsp)
	movb	849(%rdx), %sil
	movb	%sil, 881(%rsp)
	movb	850(%rdx), %sil
	movb	%sil, 882(%rsp)
	movb	851(%rdx), %sil
	movb	%sil, 883(%rsp)
	movb	852(%rdx), %sil
	movb	%sil, 884(%rsp)
	movb	853(%rdx), %sil
	movb	%sil, 885(%rsp)
	movb	854(%rdx), %sil
	movb	%sil, 886(%rsp)
	movb	855(%rdx), %sil
	movb	%sil, 887(%rsp)
	movb	856(%rdx), %sil
	movb	%sil, 888(%rsp)
	movb	857(%rdx), %sil
	movb	%sil, 889(%rsp)
	movb	858(%rdx), %sil
	movb	%sil, 890(%rsp)
	movb	859(%rdx), %sil
	movb	%sil, 891(%rsp)
	movb	860(%rdx), %sil
	movb	%sil, 892(%rsp)
	movb	861(%rdx), %sil
	movb	%sil, 893(%rsp)
	movb	862(%rdx), %sil
	movb	%sil, 894(%rsp)
	movb	863(%rdx), %sil
	movb	%sil, 895(%rsp)
	movb	864(%rdx), %sil
	movb	%sil, 896(%rsp)
	movb	865(%rdx), %sil
	movb	%sil, 897(%rsp)
	movb	866(%rdx), %sil
	movb	%sil, 898(%rsp)
	movb	867(%rdx), %sil
	movb	%sil, 899(%rsp)
	movb	868(%rdx), %sil
	movb	%sil, 900(%rsp)
	movb	869(%rdx), %sil
	movb	%sil, 901(%rsp)
	movb	870(%rdx), %sil
	movb	%sil, 902(%rsp)
	movb	871(%rdx), %sil
	movb	%sil, 903(%rsp)
	movb	872(%rdx), %sil
	movb	%sil, 904(%rsp)
	movb	873(%rdx), %sil
	movb	%sil, 905(%rsp)
	movb	874(%rdx), %sil
	movb	%sil, 906(%rsp)
	movb	875(%rdx), %sil
	movb	%sil, 907(%rsp)
	movb	876(%rdx), %sil
	movb	%sil, 908(%rsp)
	movb	877(%rdx), %sil
	movb	%sil, 909(%rsp)
	movb	878(%rdx), %sil
	movb	%sil, 910(%rsp)
	movb	879(%rdx), %sil
	movb	%sil, 911(%rsp)
	movb	880(%rdx), %sil
	movb	%sil, 912(%rsp)
	movb	881(%rdx), %sil
	movb	%sil, 913(%rsp)
	movb	882(%rdx), %sil
	movb	%sil, 914(%rsp)
	movb	883(%rdx), %sil
	movb	%sil, 915(%rsp)
	movb	884(%rdx), %sil
	movb	%sil, 916(%rsp)
	movb	885(%rdx), %sil
	movb	%sil, 917(%rsp)
	movb	886(%rdx), %sil
	movb	%sil, 918(%rsp)
	movb	887(%rdx), %sil
	movb	%sil, 919(%rsp)
	movb	888(%rdx), %sil
	movb	%sil, 920(%rsp)
	movb	889(%rdx), %sil
	movb	%sil, 921(%rsp)
	movb	890(%rdx), %sil
	movb	%sil, 922(%rsp)
	movb	891(%rdx), %sil
	movb	%sil, 923(%rsp)
	movb	892(%rdx), %sil
	movb	%sil, 924(%rsp)
	movb	893(%rdx), %sil
	movb	%sil, 925(%rsp)
	movb	894(%rdx), %sil
	movb	%sil, 926(%rsp)
	movb	895(%rdx), %sil
	movb	%sil, 927(%rsp)
	movb	896(%rdx), %sil
	movb	%sil, 928(%rsp)
	movb	897(%rdx), %sil
	movb	%sil, 929(%rsp)
	movb	898(%rdx), %sil
	movb	%sil, 930(%rsp)
	movb	899(%rdx), %sil
	movb	%sil, 931(%rsp)
	movb	900(%rdx), %sil
	movb	%sil, 932(%rsp)
	movb	901(%rdx), %sil
	movb	%sil, 933(%rsp)
	movb	902(%rdx), %sil
	movb	%sil, 934(%rsp)
	movb	903(%rdx), %sil
	movb	%sil, 935(%rsp)
	movb	904(%rdx), %sil
	movb	%sil, 936(%rsp)
	movb	905(%rdx), %sil
	movb	%sil, 937(%rsp)
	movb	906(%rdx), %sil
	movb	%sil, 938(%rsp)
	movb	907(%rdx), %sil
	movb	%sil, 939(%rsp)
	movb	908(%rdx), %sil
	movb	%sil, 940(%rsp)
	movb	909(%rdx), %sil
	movb	%sil, 941(%rsp)
	movb	910(%rdx), %sil
	movb	%sil, 942(%rsp)
	movb	911(%rdx), %sil
	movb	%sil, 943(%rsp)
	movb	912(%rdx), %sil
	movb	%sil, 944(%rsp)
	movb	913(%rdx), %sil
	movb	%sil, 945(%rsp)
	movb	914(%rdx), %sil
	movb	%sil, 946(%rsp)
	movb	915(%rdx), %sil
	movb	%sil, 947(%rsp)
	movb	916(%rdx), %sil
	movb	%sil, 948(%rsp)
	movb	917(%rdx), %sil
	movb	%sil, 949(%rsp)
	movb	918(%rdx), %sil
	movb	%sil, 950(%rsp)
	movb	919(%rdx), %sil
	movb	%sil, 951(%rsp)
	movb	920(%rdx), %sil
	movb	%sil, 952(%rsp)
	movb	921(%rdx), %sil
	movb	%sil, 953(%rsp)
	movb	922(%rdx), %sil
	movb	%sil, 954(%rsp)
	movb	923(%rdx), %sil
	movb	%sil, 955(%rsp)
	movb	924(%rdx), %sil
	movb	%sil, 956(%rsp)
	movb	925(%rdx), %sil
	movb	%sil, 957(%rsp)
	movb	926(%rdx), %sil
	movb	%sil, 958(%rsp)
	movb	927(%rdx), %sil
	movb	%sil, 959(%rsp)
	movb	928(%rdx), %sil
	movb	%sil, 960(%rsp)
	movb	929(%rdx), %sil
	movb	%sil, 961(%rsp)
	movb	930(%rdx), %sil
	movb	%sil, 962(%rsp)
	movb	931(%rdx), %sil
	movb	%sil, 963(%rsp)
	movb	932(%rdx), %sil
	movb	%sil, 964(%rsp)
	movb	933(%rdx), %sil
	movb	%sil, 965(%rsp)
	movb	934(%rdx), %sil
	movb	%sil, 966(%rsp)
	movb	935(%rdx), %sil
	movb	%sil, 967(%rsp)
	movb	936(%rdx), %sil
	movb	%sil, 968(%rsp)
	movb	937(%rdx), %sil
	movb	%sil, 969(%rsp)
	movb	938(%rdx), %sil
	movb	%sil, 970(%rsp)
	movb	939(%rdx), %sil
	movb	%sil, 971(%rsp)
	movb	940(%rdx), %sil
	movb	%sil, 972(%rsp)
	movb	941(%rdx), %sil
	movb	%sil, 973(%rsp)
	movb	942(%rdx), %sil
	movb	%sil, 974(%rsp)
	movb	943(%rdx), %sil
	movb	%sil, 975(%rsp)
	movb	944(%rdx), %sil
	movb	%sil, 976(%rsp)
	movb	945(%rdx), %sil
	movb	%sil, 977(%rsp)
	movb	946(%rdx), %sil
	movb	%sil, 978(%rsp)
	movb	947(%rdx), %sil
	movb	%sil, 979(%rsp)
	movb	948(%rdx), %sil
	movb	%sil, 980(%rsp)
	movb	949(%rdx), %sil
	movb	%sil, 981(%rsp)
	movb	950(%rdx), %sil
	movb	%sil, 982(%rsp)
	movb	951(%rdx), %sil
	movb	%sil, 983(%rsp)
	movb	952(%rdx), %sil
	movb	%sil, 984(%rsp)
	movb	953(%rdx), %sil
	movb	%sil, 985(%rsp)
	movb	954(%rdx), %sil
	movb	%sil, 986(%rsp)
	movb	955(%rdx), %sil
	movb	%sil, 987(%rsp)
	movb	956(%rdx), %sil
	movb	%sil, 988(%rsp)
	movb	957(%rdx), %sil
	movb	%sil, 989(%rsp)
	movb	958(%rdx), %sil
	movb	%sil, 990(%rsp)
	movb	959(%rdx), %sil
	movb	%sil, 991(%rsp)
	movb	960(%rdx), %sil
	movb	%sil, 992(%rsp)
	movb	961(%rdx), %sil
	movb	%sil, 993(%rsp)
	movb	962(%rdx), %sil
	movb	%sil, 994(%rsp)
	movb	963(%rdx), %sil
	movb	%sil, 995(%rsp)
	movb	964(%rdx), %sil
	movb	%sil, 996(%rsp)
	movb	965(%rdx), %sil
	movb	%sil, 997(%rsp)
	movb	966(%rdx), %sil
	movb	%sil, 998(%rsp)
	movb	967(%rdx), %sil
	movb	%sil, 999(%rsp)
	movb	968(%rdx), %sil
	movb	%sil, 1000(%rsp)
	movb	969(%rdx), %sil
	movb	%sil, 1001(%rsp)
	movb	970(%rdx), %sil
	movb	%sil, 1002(%rsp)
	movb	971(%rdx), %sil
	movb	%sil, 1003(%rsp)
	movb	972(%rdx), %sil
	movb	%sil, 1004(%rsp)
	movb	973(%rdx), %sil
	movb	%sil, 1005(%rsp)
	movb	974(%rdx), %sil
	movb	%sil, 1006(%rsp)
	movb	975(%rdx), %sil
	movb	%sil, 1007(%rsp)
	movb	976(%rdx), %sil
	movb	%sil, 1008(%rsp)
	movb	977(%rdx), %sil
	movb	%sil, 1009(%rsp)
	movb	978(%rdx), %sil
	movb	%sil, 1010(%rsp)
	movb	979(%rdx), %sil
	movb	%sil, 1011(%rsp)
	movb	980(%rdx), %sil
	movb	%sil, 1012(%rsp)
	movb	981(%rdx), %sil
	movb	%sil, 1013(%rsp)
	movb	982(%rdx), %sil
	movb	%sil, 1014(%rsp)
	movb	983(%rdx), %sil
	movb	%sil, 1015(%rsp)
	movb	984(%rdx), %sil
	movb	%sil, 1016(%rsp)
	movb	985(%rdx), %sil
	movb	%sil, 1017(%rsp)
	movb	986(%rdx), %sil
	movb	%sil, 1018(%rsp)
	movb	987(%rdx), %sil
	movb	%sil, 1019(%rsp)
	movb	988(%rdx), %sil
	movb	%sil, 1020(%rsp)
	movb	989(%rdx), %sil
	movb	%sil, 1021(%rsp)
	movb	990(%rdx), %sil
	movb	%sil, 1022(%rsp)
	movb	991(%rdx), %sil
	movb	%sil, 1023(%rsp)
	movb	992(%rdx), %sil
	movb	%sil, 1024(%rsp)
	movb	993(%rdx), %sil
	movb	%sil, 1025(%rsp)
	movb	994(%rdx), %sil
	movb	%sil, 1026(%rsp)
	movb	995(%rdx), %sil
	movb	%sil, 1027(%rsp)
	movb	996(%rdx), %sil
	movb	%sil, 1028(%rsp)
	movb	997(%rdx), %sil
	movb	%sil, 1029(%rsp)
	movb	998(%rdx), %sil
	movb	%sil, 1030(%rsp)
	movb	999(%rdx), %sil
	movb	%sil, 1031(%rsp)
	movb	1000(%rdx), %sil
	movb	%sil, 1032(%rsp)
	movb	1001(%rdx), %sil
	movb	%sil, 1033(%rsp)
	movb	1002(%rdx), %sil
	movb	%sil, 1034(%rsp)
	movb	1003(%rdx), %sil
	movb	%sil, 1035(%rsp)
	movb	1004(%rdx), %sil
	movb	%sil, 1036(%rsp)
	movb	1005(%rdx), %sil
	movb	%sil, 1037(%rsp)
	movb	1006(%rdx), %sil
	movb	%sil, 1038(%rsp)
	movb	1007(%rdx), %sil
	movb	%sil, 1039(%rsp)
	movb	1008(%rdx), %sil
	movb	%sil, 1040(%rsp)
	movb	1009(%rdx), %sil
	movb	%sil, 1041(%rsp)
	movb	1010(%rdx), %sil
	movb	%sil, 1042(%rsp)
	movb	1011(%rdx), %sil
	movb	%sil, 1043(%rsp)
	movb	1012(%rdx), %sil
	movb	%sil, 1044(%rsp)
	movb	1013(%rdx), %sil
	movb	%sil, 1045(%rsp)
	movb	1014(%rdx), %sil
	movb	%sil, 1046(%rsp)
	movb	1015(%rdx), %sil
	movb	%sil, 1047(%rsp)
	movb	1016(%rdx), %sil
	movb	%sil, 1048(%rsp)
	movb	1017(%rdx), %sil
	movb	%sil, 1049(%rsp)
	movb	1018(%rdx), %sil
	movb	%sil, 1050(%rsp)
	movb	1019(%rdx), %sil
	movb	%sil, 1051(%rsp)
	movb	1020(%rdx), %sil
	movb	%sil, 1052(%rsp)
	movb	1021(%rdx), %sil
	movb	%sil, 1053(%rsp)
	movb	1022(%rdx), %sil
	movb	%sil, 1054(%rsp)
	movb	1023(%rdx), %sil
	movb	%sil, 1055(%rsp)
	movb	1024(%rdx), %sil
	movb	%sil, 1056(%rsp)
	movb	1025(%rdx), %sil
	movb	%sil, 1057(%rsp)
	movb	1026(%rdx), %sil
	movb	%sil, 1058(%rsp)
	movb	1027(%rdx), %sil
	movb	%sil, 1059(%rsp)
	movb	1028(%rdx), %sil
	movb	%sil, 1060(%rsp)
	movb	1029(%rdx), %sil
	movb	%sil, 1061(%rsp)
	movb	1030(%rdx), %sil
	movb	%sil, 1062(%rsp)
	movb	1031(%rdx), %sil
	movb	%sil, 1063(%rsp)
	movb	1032(%rdx), %sil
	movb	%sil, 1064(%rsp)
	movb	1033(%rdx), %sil
	movb	%sil, 1065(%rsp)
	movb	1034(%rdx), %sil
	movb	%sil, 1066(%rsp)
	movb	1035(%rdx), %sil
	movb	%sil, 1067(%rsp)
	movb	1036(%rdx), %sil
	movb	%sil, 1068(%rsp)
	movb	1037(%rdx), %sil
	movb	%sil, 1069(%rsp)
	movb	1038(%rdx), %sil
	movb	%sil, 1070(%rsp)
	movb	1039(%rdx), %sil
	movb	%sil, 1071(%rsp)
	movb	1040(%rdx), %sil
	movb	%sil, 1072(%rsp)
	movb	1041(%rdx), %sil
	movb	%sil, 1073(%rsp)
	movb	1042(%rdx), %sil
	movb	%sil, 1074(%rsp)
	movb	1043(%rdx), %sil
	movb	%sil, 1075(%rsp)
	movb	1044(%rdx), %sil
	movb	%sil, 1076(%rsp)
	movb	1045(%rdx), %sil
	movb	%sil, 1077(%rsp)
	movb	1046(%rdx), %sil
	movb	%sil, 1078(%rsp)
	movb	1047(%rdx), %sil
	movb	%sil, 1079(%rsp)
	movb	1048(%rdx), %sil
	movb	%sil, 1080(%rsp)
	movb	1049(%rdx), %sil
	movb	%sil, 1081(%rsp)
	movb	1050(%rdx), %sil
	movb	%sil, 1082(%rsp)
	movb	1051(%rdx), %sil
	movb	%sil, 1083(%rsp)
	movb	1052(%rdx), %sil
	movb	%sil, 1084(%rsp)
	movb	1053(%rdx), %sil
	movb	%sil, 1085(%rsp)
	movb	1054(%rdx), %sil
	movb	%sil, 1086(%rsp)
	movb	1055(%rdx), %sil
	movb	%sil, 1087(%rsp)
	movb	1056(%rdx), %sil
	movb	%sil, 1088(%rsp)
	movb	1057(%rdx), %sil
	movb	%sil, 1089(%rsp)
	movb	1058(%rdx), %sil
	movb	%sil, 1090(%rsp)
	movb	1059(%rdx), %sil
	movb	%sil, 1091(%rsp)
	movb	1060(%rdx), %sil
	movb	%sil, 1092(%rsp)
	movb	1061(%rdx), %sil
	movb	%sil, 1093(%rsp)
	movb	1062(%rdx), %sil
	movb	%sil, 1094(%rsp)
	movb	1063(%rdx), %sil
	movb	%sil, 1095(%rsp)
	movb	1064(%rdx), %sil
	movb	%sil, 1096(%rsp)
	movb	1065(%rdx), %sil
	movb	%sil, 1097(%rsp)
	movb	1066(%rdx), %sil
	movb	%sil, 1098(%rsp)
	movb	1067(%rdx), %sil
	movb	%sil, 1099(%rsp)
	movb	1068(%rdx), %sil
	movb	%sil, 1100(%rsp)
	movb	1069(%rdx), %sil
	movb	%sil, 1101(%rsp)
	movb	1070(%rdx), %sil
	movb	%sil, 1102(%rsp)
	movb	1071(%rdx), %sil
	movb	%sil, 1103(%rsp)
	movb	1072(%rdx), %sil
	movb	%sil, 1104(%rsp)
	movb	1073(%rdx), %sil
	movb	%sil, 1105(%rsp)
	movb	1074(%rdx), %sil
	movb	%sil, 1106(%rsp)
	movb	1075(%rdx), %sil
	movb	%sil, 1107(%rsp)
	movb	1076(%rdx), %sil
	movb	%sil, 1108(%rsp)
	movb	1077(%rdx), %sil
	movb	%sil, 1109(%rsp)
	movb	1078(%rdx), %sil
	movb	%sil, 1110(%rsp)
	movb	1079(%rdx), %sil
	movb	%sil, 1111(%rsp)
	movb	1080(%rdx), %sil
	movb	%sil, 1112(%rsp)
	movb	1081(%rdx), %sil
	movb	%sil, 1113(%rsp)
	movb	1082(%rdx), %sil
	movb	%sil, 1114(%rsp)
	movb	1083(%rdx), %sil
	movb	%sil, 1115(%rsp)
	movb	1084(%rdx), %sil
	movb	%sil, 1116(%rsp)
	movb	1085(%rdx), %sil
	movb	%sil, 1117(%rsp)
	movb	1086(%rdx), %sil
	movb	%sil, 1118(%rsp)
	movb	1087(%rdx), %sil
	movb	%sil, 1119(%rsp)
	movb	1088(%rdx), %sil
	movb	%sil, 1120(%rsp)
	movb	1089(%rdx), %sil
	movb	%sil, 1121(%rsp)
	movb	1090(%rdx), %sil
	movb	%sil, 1122(%rsp)
	movb	1091(%rdx), %sil
	movb	%sil, 1123(%rsp)
	movb	1092(%rdx), %sil
	movb	%sil, 1124(%rsp)
	movb	1093(%rdx), %sil
	movb	%sil, 1125(%rsp)
	movb	1094(%rdx), %sil
	movb	%sil, 1126(%rsp)
	movb	1095(%rdx), %sil
	movb	%sil, 1127(%rsp)
	movb	1096(%rdx), %sil
	movb	%sil, 1128(%rsp)
	movb	1097(%rdx), %sil
	movb	%sil, 1129(%rsp)
	movb	1098(%rdx), %sil
	movb	%sil, 1130(%rsp)
	movb	1099(%rdx), %sil
	movb	%sil, 1131(%rsp)
	movb	1100(%rdx), %sil
	movb	%sil, 1132(%rsp)
	movb	1101(%rdx), %sil
	movb	%sil, 1133(%rsp)
	movb	1102(%rdx), %sil
	movb	%sil, 1134(%rsp)
	movb	1103(%rdx), %sil
	movb	%sil, 1135(%rsp)
	movb	1104(%rdx), %sil
	movb	%sil, 1136(%rsp)
	movb	1105(%rdx), %sil
	movb	%sil, 1137(%rsp)
	movb	1106(%rdx), %sil
	movb	%sil, 1138(%rsp)
	movb	1107(%rdx), %sil
	movb	%sil, 1139(%rsp)
	movb	1108(%rdx), %sil
	movb	%sil, 1140(%rsp)
	movb	1109(%rdx), %sil
	movb	%sil, 1141(%rsp)
	movb	1110(%rdx), %sil
	movb	%sil, 1142(%rsp)
	movb	1111(%rdx), %sil
	movb	%sil, 1143(%rsp)
	movb	1112(%rdx), %sil
	movb	%sil, 1144(%rsp)
	movb	1113(%rdx), %sil
	movb	%sil, 1145(%rsp)
	movb	1114(%rdx), %sil
	movb	%sil, 1146(%rsp)
	movb	1115(%rdx), %sil
	movb	%sil, 1147(%rsp)
	movb	1116(%rdx), %sil
	movb	%sil, 1148(%rsp)
	movb	1117(%rdx), %sil
	movb	%sil, 1149(%rsp)
	movb	1118(%rdx), %sil
	movb	%sil, 1150(%rsp)
	movb	1119(%rdx), %sil
	movb	%sil, 1151(%rsp)
	movb	1120(%rdx), %sil
	movb	%sil, 1152(%rsp)
	movb	1121(%rdx), %sil
	movb	%sil, 1153(%rsp)
	movb	1122(%rdx), %sil
	movb	%sil, 1154(%rsp)
	movb	1123(%rdx), %sil
	movb	%sil, 1155(%rsp)
	movb	1124(%rdx), %sil
	movb	%sil, 1156(%rsp)
	movb	1125(%rdx), %sil
	movb	%sil, 1157(%rsp)
	movb	1126(%rdx), %sil
	movb	%sil, 1158(%rsp)
	movb	1127(%rdx), %sil
	movb	%sil, 1159(%rsp)
	movb	1128(%rdx), %sil
	movb	%sil, 1160(%rsp)
	movb	1129(%rdx), %sil
	movb	%sil, 1161(%rsp)
	movb	1130(%rdx), %sil
	movb	%sil, 1162(%rsp)
	movb	1131(%rdx), %sil
	movb	%sil, 1163(%rsp)
	movb	1132(%rdx), %sil
	movb	%sil, 1164(%rsp)
	movb	1133(%rdx), %sil
	movb	%sil, 1165(%rsp)
	movb	1134(%rdx), %sil
	movb	%sil, 1166(%rsp)
	movb	1135(%rdx), %sil
	movb	%sil, 1167(%rsp)
	movb	1136(%rdx), %sil
	movb	%sil, 1168(%rsp)
	movb	1137(%rdx), %sil
	movb	%sil, 1169(%rsp)
	movb	1138(%rdx), %sil
	movb	%sil, 1170(%rsp)
	movb	1139(%rdx), %sil
	movb	%sil, 1171(%rsp)
	movb	1140(%rdx), %sil
	movb	%sil, 1172(%rsp)
	movb	1141(%rdx), %sil
	movb	%sil, 1173(%rsp)
	movb	1142(%rdx), %sil
	movb	%sil, 1174(%rsp)
	movb	1143(%rdx), %sil
	movb	%sil, 1175(%rsp)
	movb	1144(%rdx), %sil
	movb	%sil, 1176(%rsp)
	movb	1145(%rdx), %sil
	movb	%sil, 1177(%rsp)
	movb	1146(%rdx), %sil
	movb	%sil, 1178(%rsp)
	movb	1147(%rdx), %sil
	movb	%sil, 1179(%rsp)
	movb	1148(%rdx), %sil
	movb	%sil, 1180(%rsp)
	movb	1149(%rdx), %sil
	movb	%sil, 1181(%rsp)
	movb	1150(%rdx), %sil
	movb	%sil, 1182(%rsp)
	movb	1151(%rdx), %sil
	movb	%sil, 1183(%rsp)
	movb	1152(%rdx), %sil
	movb	%sil, 1184(%rsp)
	movb	1153(%rdx), %sil
	movb	%sil, 1185(%rsp)
	movb	1154(%rdx), %sil
	movb	%sil, 1186(%rsp)
	movb	1155(%rdx), %sil
	movb	%sil, 1187(%rsp)
	movb	1156(%rdx), %sil
	movb	%sil, 1188(%rsp)
	movb	1157(%rdx), %sil
	movb	%sil, 1189(%rsp)
	movb	1158(%rdx), %sil
	movb	%sil, 1190(%rsp)
	movb	1159(%rdx), %sil
	movb	%sil, 1191(%rsp)
	movb	1160(%rdx), %sil
	movb	%sil, 1192(%rsp)
	movb	1161(%rdx), %sil
	movb	%sil, 1193(%rsp)
	movb	1162(%rdx), %sil
	movb	%sil, 1194(%rsp)
	movb	1163(%rdx), %sil
	movb	%sil, 1195(%rsp)
	movb	1164(%rdx), %sil
	movb	%sil, 1196(%rsp)
	movb	1165(%rdx), %sil
	movb	%sil, 1197(%rsp)
	movb	1166(%rdx), %sil
	movb	%sil, 1198(%rsp)
	movb	1167(%rdx), %sil
	movb	%sil, 1199(%rsp)
	movb	1168(%rdx), %sil
	movb	%sil, 1200(%rsp)
	movb	1169(%rdx), %sil
	movb	%sil, 1201(%rsp)
	movb	1170(%rdx), %sil
	movb	%sil, 1202(%rsp)
	movb	1171(%rdx), %sil
	movb	%sil, 1203(%rsp)
	movb	1172(%rdx), %sil
	movb	%sil, 1204(%rsp)
	movb	1173(%rdx), %sil
	movb	%sil, 1205(%rsp)
	movb	1174(%rdx), %sil
	movb	%sil, 1206(%rsp)
	movb	1175(%rdx), %sil
	movb	%sil, 1207(%rsp)
	movb	1176(%rdx), %sil
	movb	%sil, 1208(%rsp)
	movb	1177(%rdx), %sil
	movb	%sil, 1209(%rsp)
	movb	1178(%rdx), %sil
	movb	%sil, 1210(%rsp)
	movb	1179(%rdx), %sil
	movb	%sil, 1211(%rsp)
	movb	1180(%rdx), %sil
	movb	%sil, 1212(%rsp)
	movb	1181(%rdx), %sil
	movb	%sil, 1213(%rsp)
	movb	1182(%rdx), %sil
	movb	%sil, 1214(%rsp)
	movb	1183(%rdx), %sil
	movb	%sil, 1215(%rsp)
	movb	1184(%rdx), %sil
	movb	%sil, 1216(%rsp)
	movb	1185(%rdx), %sil
	movb	%sil, 1217(%rsp)
	movb	1186(%rdx), %sil
	movb	%sil, 1218(%rsp)
	movb	1187(%rdx), %sil
	movb	%sil, 1219(%rsp)
	movb	1188(%rdx), %sil
	movb	%sil, 1220(%rsp)
	movb	1189(%rdx), %sil
	movb	%sil, 1221(%rsp)
	movb	1190(%rdx), %sil
	movb	%sil, 1222(%rsp)
	movb	1191(%rdx), %sil
	movb	%sil, 1223(%rsp)
	movb	1192(%rdx), %sil
	movb	%sil, 1224(%rsp)
	movb	1193(%rdx), %sil
	movb	%sil, 1225(%rsp)
	movb	1194(%rdx), %sil
	movb	%sil, 1226(%rsp)
	movb	1195(%rdx), %sil
	movb	%sil, 1227(%rsp)
	movb	1196(%rdx), %sil
	movb	%sil, 1228(%rsp)
	movb	1197(%rdx), %sil
	movb	%sil, 1229(%rsp)
	movb	1198(%rdx), %sil
	movb	%sil, 1230(%rsp)
	movb	1199(%rdx), %sil
	movb	%sil, 1231(%rsp)
	movb	1200(%rdx), %sil
	movb	%sil, 1232(%rsp)
	movb	1201(%rdx), %sil
	movb	%sil, 1233(%rsp)
	movb	1202(%rdx), %sil
	movb	%sil, 1234(%rsp)
	movb	1203(%rdx), %sil
	movb	%sil, 1235(%rsp)
	movb	1204(%rdx), %sil
	movb	%sil, 1236(%rsp)
	movb	1205(%rdx), %sil
	movb	%sil, 1237(%rsp)
	movb	1206(%rdx), %sil
	movb	%sil, 1238(%rsp)
	movb	1207(%rdx), %sil
	movb	%sil, 1239(%rsp)
	movb	1208(%rdx), %sil
	movb	%sil, 1240(%rsp)
	movb	1209(%rdx), %sil
	movb	%sil, 1241(%rsp)
	movb	1210(%rdx), %sil
	movb	%sil, 1242(%rsp)
	movb	1211(%rdx), %sil
	movb	%sil, 1243(%rsp)
	movb	1212(%rdx), %sil
	movb	%sil, 1244(%rsp)
	movb	1213(%rdx), %sil
	movb	%sil, 1245(%rsp)
	movb	1214(%rdx), %sil
	movb	%sil, 1246(%rsp)
	movb	1215(%rdx), %sil
	movb	%sil, 1247(%rsp)
	movb	1216(%rdx), %sil
	movb	%sil, 1248(%rsp)
	movb	1217(%rdx), %sil
	movb	%sil, 1249(%rsp)
	movb	1218(%rdx), %sil
	movb	%sil, 1250(%rsp)
	movb	1219(%rdx), %sil
	movb	%sil, 1251(%rsp)
	movb	1220(%rdx), %sil
	movb	%sil, 1252(%rsp)
	movb	1221(%rdx), %sil
	movb	%sil, 1253(%rsp)
	movb	1222(%rdx), %sil
	movb	%sil, 1254(%rsp)
	movb	1223(%rdx), %sil
	movb	%sil, 1255(%rsp)
	movb	1224(%rdx), %sil
	movb	%sil, 1256(%rsp)
	movb	1225(%rdx), %sil
	movb	%sil, 1257(%rsp)
	movb	1226(%rdx), %sil
	movb	%sil, 1258(%rsp)
	movb	1227(%rdx), %sil
	movb	%sil, 1259(%rsp)
	movb	1228(%rdx), %sil
	movb	%sil, 1260(%rsp)
	movb	1229(%rdx), %sil
	movb	%sil, 1261(%rsp)
	movb	1230(%rdx), %sil
	movb	%sil, 1262(%rsp)
	movb	1231(%rdx), %sil
	movb	%sil, 1263(%rsp)
	movb	1232(%rdx), %sil
	movb	%sil, 1264(%rsp)
	movb	1233(%rdx), %sil
	movb	%sil, 1265(%rsp)
	movb	1234(%rdx), %sil
	movb	%sil, 1266(%rsp)
	movb	1235(%rdx), %sil
	movb	%sil, 1267(%rsp)
	movb	1236(%rdx), %sil
	movb	%sil, 1268(%rsp)
	movb	1237(%rdx), %sil
	movb	%sil, 1269(%rsp)
	movb	1238(%rdx), %sil
	movb	%sil, 1270(%rsp)
	movb	1239(%rdx), %sil
	movb	%sil, 1271(%rsp)
	movb	1240(%rdx), %sil
	movb	%sil, 1272(%rsp)
	movb	1241(%rdx), %sil
	movb	%sil, 1273(%rsp)
	movb	1242(%rdx), %sil
	movb	%sil, 1274(%rsp)
	movb	1243(%rdx), %sil
	movb	%sil, 1275(%rsp)
	movb	1244(%rdx), %sil
	movb	%sil, 1276(%rsp)
	movb	1245(%rdx), %sil
	movb	%sil, 1277(%rsp)
	movb	1246(%rdx), %sil
	movb	%sil, 1278(%rsp)
	movb	1247(%rdx), %sil
	movb	%sil, 1279(%rsp)
	movb	1248(%rdx), %sil
	movb	%sil, 1280(%rsp)
	movb	1249(%rdx), %sil
	movb	%sil, 1281(%rsp)
	movb	1250(%rdx), %sil
	movb	%sil, 1282(%rsp)
	movb	1251(%rdx), %sil
	movb	%sil, 1283(%rsp)
	movb	1252(%rdx), %sil
	movb	%sil, 1284(%rsp)
	movb	1253(%rdx), %sil
	movb	%sil, 1285(%rsp)
	movb	1254(%rdx), %sil
	movb	%sil, 1286(%rsp)
	movb	1255(%rdx), %sil
	movb	%sil, 1287(%rsp)
	movb	1256(%rdx), %sil
	movb	%sil, 1288(%rsp)
	movb	1257(%rdx), %sil
	movb	%sil, 1289(%rsp)
	movb	1258(%rdx), %sil
	movb	%sil, 1290(%rsp)
	movb	1259(%rdx), %sil
	movb	%sil, 1291(%rsp)
	movb	1260(%rdx), %sil
	movb	%sil, 1292(%rsp)
	movb	1261(%rdx), %sil
	movb	%sil, 1293(%rsp)
	movb	1262(%rdx), %sil
	movb	%sil, 1294(%rsp)
	movb	1263(%rdx), %sil
	movb	%sil, 1295(%rsp)
	movb	1264(%rdx), %sil
	movb	%sil, 1296(%rsp)
	movb	1265(%rdx), %sil
	movb	%sil, 1297(%rsp)
	movb	1266(%rdx), %sil
	movb	%sil, 1298(%rsp)
	movb	1267(%rdx), %sil
	movb	%sil, 1299(%rsp)
	movb	1268(%rdx), %sil
	movb	%sil, 1300(%rsp)
	movb	1269(%rdx), %sil
	movb	%sil, 1301(%rsp)
	movb	1270(%rdx), %sil
	movb	%sil, 1302(%rsp)
	movb	1271(%rdx), %sil
	movb	%sil, 1303(%rsp)
	movb	1272(%rdx), %sil
	movb	%sil, 1304(%rsp)
	movb	1273(%rdx), %sil
	movb	%sil, 1305(%rsp)
	movb	1274(%rdx), %sil
	movb	%sil, 1306(%rsp)
	movb	1275(%rdx), %sil
	movb	%sil, 1307(%rsp)
	movb	1276(%rdx), %sil
	movb	%sil, 1308(%rsp)
	movb	1277(%rdx), %sil
	movb	%sil, 1309(%rsp)
	movb	1278(%rdx), %sil
	movb	%sil, 1310(%rsp)
	movb	1279(%rdx), %sil
	movb	%sil, 1311(%rsp)
	movb	1280(%rdx), %sil
	movb	%sil, 1312(%rsp)
	movb	1281(%rdx), %sil
	movb	%sil, 1313(%rsp)
	movb	1282(%rdx), %sil
	movb	%sil, 1314(%rsp)
	movb	1283(%rdx), %sil
	movb	%sil, 1315(%rsp)
	movb	1284(%rdx), %sil
	movb	%sil, 1316(%rsp)
	movb	1285(%rdx), %sil
	movb	%sil, 1317(%rsp)
	movb	1286(%rdx), %sil
	movb	%sil, 1318(%rsp)
	movb	1287(%rdx), %sil
	movb	%sil, 1319(%rsp)
	movb	1288(%rdx), %sil
	movb	%sil, 1320(%rsp)
	movb	1289(%rdx), %sil
	movb	%sil, 1321(%rsp)
	movb	1290(%rdx), %sil
	movb	%sil, 1322(%rsp)
	movb	1291(%rdx), %sil
	movb	%sil, 1323(%rsp)
	movb	1292(%rdx), %sil
	movb	%sil, 1324(%rsp)
	movb	1293(%rdx), %sil
	movb	%sil, 1325(%rsp)
	movb	1294(%rdx), %sil
	movb	%sil, 1326(%rsp)
	movb	1295(%rdx), %sil
	movb	%sil, 1327(%rsp)
	movb	1296(%rdx), %sil
	movb	%sil, 1328(%rsp)
	movb	1297(%rdx), %sil
	movb	%sil, 1329(%rsp)
	movb	1298(%rdx), %sil
	movb	%sil, 1330(%rsp)
	movb	1299(%rdx), %sil
	movb	%sil, 1331(%rsp)
	movb	1300(%rdx), %sil
	movb	%sil, 1332(%rsp)
	movb	1301(%rdx), %sil
	movb	%sil, 1333(%rsp)
	movb	1302(%rdx), %sil
	movb	%sil, 1334(%rsp)
	movb	1303(%rdx), %sil
	movb	%sil, 1335(%rsp)
	movb	1304(%rdx), %sil
	movb	%sil, 1336(%rsp)
	movb	1305(%rdx), %sil
	movb	%sil, 1337(%rsp)
	movb	1306(%rdx), %sil
	movb	%sil, 1338(%rsp)
	movb	1307(%rdx), %sil
	movb	%sil, 1339(%rsp)
	movb	1308(%rdx), %sil
	movb	%sil, 1340(%rsp)
	movb	1309(%rdx), %sil
	movb	%sil, 1341(%rsp)
	movb	1310(%rdx), %sil
	movb	%sil, 1342(%rsp)
	movb	1311(%rdx), %sil
	movb	%sil, 1343(%rsp)
	movb	1312(%rdx), %sil
	movb	%sil, 1344(%rsp)
	movb	1313(%rdx), %sil
	movb	%sil, 1345(%rsp)
	movb	1314(%rdx), %sil
	movb	%sil, 1346(%rsp)
	movb	1315(%rdx), %sil
	movb	%sil, 1347(%rsp)
	movb	1316(%rdx), %sil
	movb	%sil, 1348(%rsp)
	movb	1317(%rdx), %sil
	movb	%sil, 1349(%rsp)
	movb	1318(%rdx), %sil
	movb	%sil, 1350(%rsp)
	movb	1319(%rdx), %sil
	movb	%sil, 1351(%rsp)
	movb	1320(%rdx), %sil
	movb	%sil, 1352(%rsp)
	movb	1321(%rdx), %sil
	movb	%sil, 1353(%rsp)
	movb	1322(%rdx), %sil
	movb	%sil, 1354(%rsp)
	movb	1323(%rdx), %sil
	movb	%sil, 1355(%rsp)
	movb	1324(%rdx), %sil
	movb	%sil, 1356(%rsp)
	movb	1325(%rdx), %sil
	movb	%sil, 1357(%rsp)
	movb	1326(%rdx), %sil
	movb	%sil, 1358(%rsp)
	movb	1327(%rdx), %sil
	movb	%sil, 1359(%rsp)
	movb	1328(%rdx), %sil
	movb	%sil, 1360(%rsp)
	movb	1329(%rdx), %sil
	movb	%sil, 1361(%rsp)
	movb	1330(%rdx), %sil
	movb	%sil, 1362(%rsp)
	movb	1331(%rdx), %sil
	movb	%sil, 1363(%rsp)
	movb	1332(%rdx), %sil
	movb	%sil, 1364(%rsp)
	movb	1333(%rdx), %sil
	movb	%sil, 1365(%rsp)
	movb	1334(%rdx), %sil
	movb	%sil, 1366(%rsp)
	movb	1335(%rdx), %sil
	movb	%sil, 1367(%rsp)
	movb	1336(%rdx), %sil
	movb	%sil, 1368(%rsp)
	movb	1337(%rdx), %sil
	movb	%sil, 1369(%rsp)
	movb	1338(%rdx), %sil
	movb	%sil, 1370(%rsp)
	movb	1339(%rdx), %sil
	movb	%sil, 1371(%rsp)
	movb	1340(%rdx), %sil
	movb	%sil, 1372(%rsp)
	movb	1341(%rdx), %sil
	movb	%sil, 1373(%rsp)
	movb	1342(%rdx), %sil
	movb	%sil, 1374(%rsp)
	movb	1343(%rdx), %sil
	movb	%sil, 1375(%rsp)
	movb	1344(%rdx), %sil
	movb	%sil, 1376(%rsp)
	movb	1345(%rdx), %sil
	movb	%sil, 1377(%rsp)
	movb	1346(%rdx), %sil
	movb	%sil, 1378(%rsp)
	movb	1347(%rdx), %sil
	movb	%sil, 1379(%rsp)
	movb	1348(%rdx), %sil
	movb	%sil, 1380(%rsp)
	movb	1349(%rdx), %sil
	movb	%sil, 1381(%rsp)
	movb	1350(%rdx), %sil
	movb	%sil, 1382(%rsp)
	movb	1351(%rdx), %sil
	movb	%sil, 1383(%rsp)
	movb	1352(%rdx), %sil
	movb	%sil, 1384(%rsp)
	movb	1353(%rdx), %sil
	movb	%sil, 1385(%rsp)
	movb	1354(%rdx), %sil
	movb	%sil, 1386(%rsp)
	movb	1355(%rdx), %sil
	movb	%sil, 1387(%rsp)
	movb	1356(%rdx), %sil
	movb	%sil, 1388(%rsp)
	movb	1357(%rdx), %sil
	movb	%sil, 1389(%rsp)
	movb	1358(%rdx), %sil
	movb	%sil, 1390(%rsp)
	movb	1359(%rdx), %sil
	movb	%sil, 1391(%rsp)
	movb	1360(%rdx), %sil
	movb	%sil, 1392(%rsp)
	movb	1361(%rdx), %sil
	movb	%sil, 1393(%rsp)
	movb	1362(%rdx), %sil
	movb	%sil, 1394(%rsp)
	movb	1363(%rdx), %sil
	movb	%sil, 1395(%rsp)
	movb	1364(%rdx), %sil
	movb	%sil, 1396(%rsp)
	movb	1365(%rdx), %sil
	movb	%sil, 1397(%rsp)
	movb	1366(%rdx), %sil
	movb	%sil, 1398(%rsp)
	movb	1367(%rdx), %sil
	movb	%sil, 1399(%rsp)
	movb	1368(%rdx), %sil
	movb	%sil, 1400(%rsp)
	movb	1369(%rdx), %sil
	movb	%sil, 1401(%rsp)
	movb	1370(%rdx), %sil
	movb	%sil, 1402(%rsp)
	movb	1371(%rdx), %sil
	movb	%sil, 1403(%rsp)
	movb	1372(%rdx), %sil
	movb	%sil, 1404(%rsp)
	movb	1373(%rdx), %sil
	movb	%sil, 1405(%rsp)
	movb	1374(%rdx), %sil
	movb	%sil, 1406(%rsp)
	movb	1375(%rdx), %sil
	movb	%sil, 1407(%rsp)
	movb	1376(%rdx), %sil
	movb	%sil, 1408(%rsp)
	movb	1377(%rdx), %sil
	movb	%sil, 1409(%rsp)
	movb	1378(%rdx), %sil
	movb	%sil, 1410(%rsp)
	movb	1379(%rdx), %sil
	movb	%sil, 1411(%rsp)
	movb	1380(%rdx), %sil
	movb	%sil, 1412(%rsp)
	movb	1381(%rdx), %sil
	movb	%sil, 1413(%rsp)
	movb	1382(%rdx), %sil
	movb	%sil, 1414(%rsp)
	movb	1383(%rdx), %sil
	movb	%sil, 1415(%rsp)
	movb	1384(%rdx), %sil
	movb	%sil, 1416(%rsp)
	movb	1385(%rdx), %sil
	movb	%sil, 1417(%rsp)
	movb	1386(%rdx), %sil
	movb	%sil, 1418(%rsp)
	movb	1387(%rdx), %sil
	movb	%sil, 1419(%rsp)
	movb	1388(%rdx), %sil
	movb	%sil, 1420(%rsp)
	movb	1389(%rdx), %sil
	movb	%sil, 1421(%rsp)
	movb	1390(%rdx), %sil
	movb	%sil, 1422(%rsp)
	movb	1391(%rdx), %sil
	movb	%sil, 1423(%rsp)
	movb	1392(%rdx), %sil
	movb	%sil, 1424(%rsp)
	movb	1393(%rdx), %sil
	movb	%sil, 1425(%rsp)
	movb	1394(%rdx), %sil
	movb	%sil, 1426(%rsp)
	movb	1395(%rdx), %sil
	movb	%sil, 1427(%rsp)
	movb	1396(%rdx), %sil
	movb	%sil, 1428(%rsp)
	movb	1397(%rdx), %sil
	movb	%sil, 1429(%rsp)
	movb	1398(%rdx), %sil
	movb	%sil, 1430(%rsp)
	movb	1399(%rdx), %sil
	movb	%sil, 1431(%rsp)
	movb	1400(%rdx), %sil
	movb	%sil, 1432(%rsp)
	movb	1401(%rdx), %sil
	movb	%sil, 1433(%rsp)
	movb	1402(%rdx), %sil
	movb	%sil, 1434(%rsp)
	movb	1403(%rdx), %sil
	movb	%sil, 1435(%rsp)
	movb	1404(%rdx), %sil
	movb	%sil, 1436(%rsp)
	movb	1405(%rdx), %sil
	movb	%sil, 1437(%rsp)
	movb	1406(%rdx), %sil
	movb	%sil, 1438(%rsp)
	movb	1407(%rdx), %sil
	movb	%sil, 1439(%rsp)
	movb	1408(%rdx), %sil
	movb	%sil, 1440(%rsp)
	movb	1409(%rdx), %sil
	movb	%sil, 1441(%rsp)
	movb	1410(%rdx), %sil
	movb	%sil, 1442(%rsp)
	movb	1411(%rdx), %sil
	movb	%sil, 1443(%rsp)
	movb	1412(%rdx), %sil
	movb	%sil, 1444(%rsp)
	movb	1413(%rdx), %sil
	movb	%sil, 1445(%rsp)
	movb	1414(%rdx), %sil
	movb	%sil, 1446(%rsp)
	movb	1415(%rdx), %sil
	movb	%sil, 1447(%rsp)
	movb	1416(%rdx), %sil
	movb	%sil, 1448(%rsp)
	movb	1417(%rdx), %sil
	movb	%sil, 1449(%rsp)
	movb	1418(%rdx), %sil
	movb	%sil, 1450(%rsp)
	movb	1419(%rdx), %sil
	movb	%sil, 1451(%rsp)
	movb	1420(%rdx), %sil
	movb	%sil, 1452(%rsp)
	movb	1421(%rdx), %sil
	movb	%sil, 1453(%rsp)
	movb	1422(%rdx), %sil
	movb	%sil, 1454(%rsp)
	movb	1423(%rdx), %sil
	movb	%sil, 1455(%rsp)
	movb	1424(%rdx), %sil
	movb	%sil, 1456(%rsp)
	movb	1425(%rdx), %sil
	movb	%sil, 1457(%rsp)
	movb	1426(%rdx), %sil
	movb	%sil, 1458(%rsp)
	movb	1427(%rdx), %sil
	movb	%sil, 1459(%rsp)
	movb	1428(%rdx), %sil
	movb	%sil, 1460(%rsp)
	movb	1429(%rdx), %sil
	movb	%sil, 1461(%rsp)
	movb	1430(%rdx), %sil
	movb	%sil, 1462(%rsp)
	movb	1431(%rdx), %sil
	movb	%sil, 1463(%rsp)
	movb	1432(%rdx), %sil
	movb	%sil, 1464(%rsp)
	movb	1433(%rdx), %sil
	movb	%sil, 1465(%rsp)
	movb	1434(%rdx), %sil
	movb	%sil, 1466(%rsp)
	movb	1435(%rdx), %sil
	movb	%sil, 1467(%rsp)
	movb	1436(%rdx), %sil
	movb	%sil, 1468(%rsp)
	movb	1437(%rdx), %sil
	movb	%sil, 1469(%rsp)
	movb	1438(%rdx), %sil
	movb	%sil, 1470(%rsp)
	movb	1439(%rdx), %sil
	movb	%sil, 1471(%rsp)
	movb	1440(%rdx), %sil
	movb	%sil, 1472(%rsp)
	movb	1441(%rdx), %sil
	movb	%sil, 1473(%rsp)
	movb	1442(%rdx), %sil
	movb	%sil, 1474(%rsp)
	movb	1443(%rdx), %sil
	movb	%sil, 1475(%rsp)
	movb	1444(%rdx), %sil
	movb	%sil, 1476(%rsp)
	movb	1445(%rdx), %sil
	movb	%sil, 1477(%rsp)
	movb	1446(%rdx), %sil
	movb	%sil, 1478(%rsp)
	movb	1447(%rdx), %sil
	movb	%sil, 1479(%rsp)
	movb	1448(%rdx), %sil
	movb	%sil, 1480(%rsp)
	movb	1449(%rdx), %sil
	movb	%sil, 1481(%rsp)
	movb	1450(%rdx), %sil
	movb	%sil, 1482(%rsp)
	movb	1451(%rdx), %sil
	movb	%sil, 1483(%rsp)
	movb	1452(%rdx), %sil
	movb	%sil, 1484(%rsp)
	movb	1453(%rdx), %sil
	movb	%sil, 1485(%rsp)
	movb	1454(%rdx), %sil
	movb	%sil, 1486(%rsp)
	movb	1455(%rdx), %sil
	movb	%sil, 1487(%rsp)
	movb	1456(%rdx), %sil
	movb	%sil, 1488(%rsp)
	movb	1457(%rdx), %sil
	movb	%sil, 1489(%rsp)
	movb	1458(%rdx), %sil
	movb	%sil, 1490(%rsp)
	movb	1459(%rdx), %sil
	movb	%sil, 1491(%rsp)
	movb	1460(%rdx), %sil
	movb	%sil, 1492(%rsp)
	movb	1461(%rdx), %sil
	movb	%sil, 1493(%rsp)
	movb	1462(%rdx), %sil
	movb	%sil, 1494(%rsp)
	movb	1463(%rdx), %sil
	movb	%sil, 1495(%rsp)
	movb	1464(%rdx), %sil
	movb	%sil, 1496(%rsp)
	movb	1465(%rdx), %sil
	movb	%sil, 1497(%rsp)
	movb	1466(%rdx), %sil
	movb	%sil, 1498(%rsp)
	movb	1467(%rdx), %sil
	movb	%sil, 1499(%rsp)
	movb	1468(%rdx), %sil
	movb	%sil, 1500(%rsp)
	movb	1469(%rdx), %sil
	movb	%sil, 1501(%rsp)
	movb	1470(%rdx), %sil
	movb	%sil, 1502(%rsp)
	movb	1471(%rdx), %sil
	movb	%sil, 1503(%rsp)
	movb	1472(%rdx), %sil
	movb	%sil, 1504(%rsp)
	movb	1473(%rdx), %sil
	movb	%sil, 1505(%rsp)
	movb	1474(%rdx), %sil
	movb	%sil, 1506(%rsp)
	movb	1475(%rdx), %sil
	movb	%sil, 1507(%rsp)
	movb	1476(%rdx), %sil
	movb	%sil, 1508(%rsp)
	movb	1477(%rdx), %sil
	movb	%sil, 1509(%rsp)
	movb	1478(%rdx), %sil
	movb	%sil, 1510(%rsp)
	movb	1479(%rdx), %sil
	movb	%sil, 1511(%rsp)
	movb	1480(%rdx), %sil
	movb	%sil, 1512(%rsp)
	movb	1481(%rdx), %sil
	movb	%sil, 1513(%rsp)
	movb	1482(%rdx), %sil
	movb	%sil, 1514(%rsp)
	movb	1483(%rdx), %sil
	movb	%sil, 1515(%rsp)
	movb	1484(%rdx), %sil
	movb	%sil, 1516(%rsp)
	movb	1485(%rdx), %sil
	movb	%sil, 1517(%rsp)
	movb	1486(%rdx), %sil
	movb	%sil, 1518(%rsp)
	movb	1487(%rdx), %sil
	movb	%sil, 1519(%rsp)
	movb	1488(%rdx), %sil
	movb	%sil, 1520(%rsp)
	movb	1489(%rdx), %sil
	movb	%sil, 1521(%rsp)
	movb	1490(%rdx), %sil
	movb	%sil, 1522(%rsp)
	movb	1491(%rdx), %sil
	movb	%sil, 1523(%rsp)
	movb	1492(%rdx), %sil
	movb	%sil, 1524(%rsp)
	movb	1493(%rdx), %sil
	movb	%sil, 1525(%rsp)
	movb	1494(%rdx), %sil
	movb	%sil, 1526(%rsp)
	movb	1495(%rdx), %sil
	movb	%sil, 1527(%rsp)
	movb	1496(%rdx), %sil
	movb	%sil, 1528(%rsp)
	movb	1497(%rdx), %sil
	movb	%sil, 1529(%rsp)
	movb	1498(%rdx), %sil
	movb	%sil, 1530(%rsp)
	movb	1499(%rdx), %sil
	movb	%sil, 1531(%rsp)
	movb	1500(%rdx), %sil
	movb	%sil, 1532(%rsp)
	movb	1501(%rdx), %sil
	movb	%sil, 1533(%rsp)
	movb	1502(%rdx), %sil
	movb	%sil, 1534(%rsp)
	movb	1503(%rdx), %sil
	movb	%sil, 1535(%rsp)
	movb	1504(%rdx), %sil
	movb	%sil, 1536(%rsp)
	movb	1505(%rdx), %sil
	movb	%sil, 1537(%rsp)
	movb	1506(%rdx), %sil
	movb	%sil, 1538(%rsp)
	movb	1507(%rdx), %sil
	movb	%sil, 1539(%rsp)
	movb	1508(%rdx), %sil
	movb	%sil, 1540(%rsp)
	movb	1509(%rdx), %sil
	movb	%sil, 1541(%rsp)
	movb	1510(%rdx), %sil
	movb	%sil, 1542(%rsp)
	movb	1511(%rdx), %sil
	movb	%sil, 1543(%rsp)
	movb	1512(%rdx), %sil
	movb	%sil, 1544(%rsp)
	movb	1513(%rdx), %sil
	movb	%sil, 1545(%rsp)
	movb	1514(%rdx), %sil
	movb	%sil, 1546(%rsp)
	movb	1515(%rdx), %sil
	movb	%sil, 1547(%rsp)
	movb	1516(%rdx), %sil
	movb	%sil, 1548(%rsp)
	movb	1517(%rdx), %sil
	movb	%sil, 1549(%rsp)
	movb	1518(%rdx), %sil
	movb	%sil, 1550(%rsp)
	movb	1519(%rdx), %sil
	movb	%sil, 1551(%rsp)
	movb	1520(%rdx), %sil
	movb	%sil, 1552(%rsp)
	movb	1521(%rdx), %sil
	movb	%sil, 1553(%rsp)
	movb	1522(%rdx), %sil
	movb	%sil, 1554(%rsp)
	movb	1523(%rdx), %sil
	movb	%sil, 1555(%rsp)
	movb	1524(%rdx), %sil
	movb	%sil, 1556(%rsp)
	movb	1525(%rdx), %sil
	movb	%sil, 1557(%rsp)
	movb	1526(%rdx), %sil
	movb	%sil, 1558(%rsp)
	movb	1527(%rdx), %sil
	movb	%sil, 1559(%rsp)
	movb	1528(%rdx), %sil
	movb	%sil, 1560(%rsp)
	movb	1529(%rdx), %sil
	movb	%sil, 1561(%rsp)
	movb	1530(%rdx), %sil
	movb	%sil, 1562(%rsp)
	movb	1531(%rdx), %sil
	movb	%sil, 1563(%rsp)
	movb	1532(%rdx), %sil
	movb	%sil, 1564(%rsp)
	movb	1533(%rdx), %sil
	movb	%sil, 1565(%rsp)
	movb	1534(%rdx), %sil
	movb	%sil, 1566(%rsp)
	movb	1535(%rdx), %sil
	movb	%sil, 1567(%rsp)
	movb	1536(%rdx), %sil
	movb	%sil, 1568(%rsp)
	movb	1537(%rdx), %sil
	movb	%sil, 1569(%rsp)
	movb	1538(%rdx), %sil
	movb	%sil, 1570(%rsp)
	movb	1539(%rdx), %sil
	movb	%sil, 1571(%rsp)
	movb	1540(%rdx), %sil
	movb	%sil, 1572(%rsp)
	movb	1541(%rdx), %sil
	movb	%sil, 1573(%rsp)
	movb	1542(%rdx), %sil
	movb	%sil, 1574(%rsp)
	movb	1543(%rdx), %sil
	movb	%sil, 1575(%rsp)
	movb	1544(%rdx), %sil
	movb	%sil, 1576(%rsp)
	movb	1545(%rdx), %sil
	movb	%sil, 1577(%rsp)
	movb	1546(%rdx), %sil
	movb	%sil, 1578(%rsp)
	movb	1547(%rdx), %sil
	movb	%sil, 1579(%rsp)
	movb	1548(%rdx), %sil
	movb	%sil, 1580(%rsp)
	movb	1549(%rdx), %sil
	movb	%sil, 1581(%rsp)
	movb	1550(%rdx), %sil
	movb	%sil, 1582(%rsp)
	movb	1551(%rdx), %sil
	movb	%sil, 1583(%rsp)
	movb	1552(%rdx), %sil
	movb	%sil, 1584(%rsp)
	movb	1553(%rdx), %sil
	movb	%sil, 1585(%rsp)
	movb	1554(%rdx), %sil
	movb	%sil, 1586(%rsp)
	movb	1555(%rdx), %sil
	movb	%sil, 1587(%rsp)
	movb	1556(%rdx), %sil
	movb	%sil, 1588(%rsp)
	movb	1557(%rdx), %sil
	movb	%sil, 1589(%rsp)
	movb	1558(%rdx), %sil
	movb	%sil, 1590(%rsp)
	movb	1559(%rdx), %sil
	movb	%sil, 1591(%rsp)
	movb	1560(%rdx), %sil
	movb	%sil, 1592(%rsp)
	movb	1561(%rdx), %sil
	movb	%sil, 1593(%rsp)
	movb	1562(%rdx), %sil
	movb	%sil, 1594(%rsp)
	movb	1563(%rdx), %sil
	movb	%sil, 1595(%rsp)
	movb	1564(%rdx), %sil
	movb	%sil, 1596(%rsp)
	movb	1565(%rdx), %sil
	movb	%sil, 1597(%rsp)
	movb	1566(%rdx), %sil
	movb	%sil, 1598(%rsp)
	movb	1567(%rdx), %sil
	movb	%sil, 1599(%rsp)
	movb	1568(%rdx), %sil
	movb	%sil, 1600(%rsp)
	movb	1569(%rdx), %sil
	movb	%sil, 1601(%rsp)
	movb	1570(%rdx), %sil
	movb	%sil, 1602(%rsp)
	movb	1571(%rdx), %sil
	movb	%sil, 1603(%rsp)
	movb	1572(%rdx), %sil
	movb	%sil, 1604(%rsp)
	movb	1573(%rdx), %sil
	movb	%sil, 1605(%rsp)
	movb	1574(%rdx), %sil
	movb	%sil, 1606(%rsp)
	movb	1575(%rdx), %sil
	movb	%sil, 1607(%rsp)
	movb	1576(%rdx), %sil
	movb	%sil, 1608(%rsp)
	movb	1577(%rdx), %sil
	movb	%sil, 1609(%rsp)
	movb	1578(%rdx), %sil
	movb	%sil, 1610(%rsp)
	movb	1579(%rdx), %sil
	movb	%sil, 1611(%rsp)
	movb	1580(%rdx), %sil
	movb	%sil, 1612(%rsp)
	movb	1581(%rdx), %sil
	movb	%sil, 1613(%rsp)
	movb	1582(%rdx), %sil
	movb	%sil, 1614(%rsp)
	movb	1583(%rdx), %sil
	movb	%sil, 1615(%rsp)
	movb	1584(%rdx), %sil
	movb	%sil, 1616(%rsp)
	movb	1585(%rdx), %sil
	movb	%sil, 1617(%rsp)
	movb	1586(%rdx), %sil
	movb	%sil, 1618(%rsp)
	movb	1587(%rdx), %sil
	movb	%sil, 1619(%rsp)
	movb	1588(%rdx), %sil
	movb	%sil, 1620(%rsp)
	movb	1589(%rdx), %sil
	movb	%sil, 1621(%rsp)
	movb	1590(%rdx), %sil
	movb	%sil, 1622(%rsp)
	movb	1591(%rdx), %sil
	movb	%sil, 1623(%rsp)
	movb	1592(%rdx), %sil
	movb	%sil, 1624(%rsp)
	movb	1593(%rdx), %sil
	movb	%sil, 1625(%rsp)
	movb	1594(%rdx), %sil
	movb	%sil, 1626(%rsp)
	movb	1595(%rdx), %sil
	movb	%sil, 1627(%rsp)
	movb	1596(%rdx), %sil
	movb	%sil, 1628(%rsp)
	movb	1597(%rdx), %sil
	movb	%sil, 1629(%rsp)
	movb	1598(%rdx), %sil
	movb	%sil, 1630(%rsp)
	movb	1599(%rdx), %sil
	movb	%sil, 1631(%rsp)
	movb	1600(%rdx), %sil
	movb	%sil, 1632(%rsp)
	movb	1601(%rdx), %sil
	movb	%sil, 1633(%rsp)
	movb	1602(%rdx), %sil
	movb	%sil, 1634(%rsp)
	movb	1603(%rdx), %sil
	movb	%sil, 1635(%rsp)
	movb	1604(%rdx), %sil
	movb	%sil, 1636(%rsp)
	movb	1605(%rdx), %sil
	movb	%sil, 1637(%rsp)
	movb	1606(%rdx), %sil
	movb	%sil, 1638(%rsp)
	movb	1607(%rdx), %sil
	movb	%sil, 1639(%rsp)
	movb	1608(%rdx), %sil
	movb	%sil, 1640(%rsp)
	movb	1609(%rdx), %sil
	movb	%sil, 1641(%rsp)
	movb	1610(%rdx), %sil
	movb	%sil, 1642(%rsp)
	movb	1611(%rdx), %sil
	movb	%sil, 1643(%rsp)
	movb	1612(%rdx), %sil
	movb	%sil, 1644(%rsp)
	movb	1613(%rdx), %sil
	movb	%sil, 1645(%rsp)
	movb	1614(%rdx), %sil
	movb	%sil, 1646(%rsp)
	movb	1615(%rdx), %sil
	movb	%sil, 1647(%rsp)
	movb	1616(%rdx), %sil
	movb	%sil, 1648(%rsp)
	movb	1617(%rdx), %sil
	movb	%sil, 1649(%rsp)
	movb	1618(%rdx), %sil
	movb	%sil, 1650(%rsp)
	movb	1619(%rdx), %sil
	movb	%sil, 1651(%rsp)
	movb	1620(%rdx), %sil
	movb	%sil, 1652(%rsp)
	movb	1621(%rdx), %sil
	movb	%sil, 1653(%rsp)
	movb	1622(%rdx), %sil
	movb	%sil, 1654(%rsp)
	movb	1623(%rdx), %sil
	movb	%sil, 1655(%rsp)
	movb	1624(%rdx), %sil
	movb	%sil, 1656(%rsp)
	movb	1625(%rdx), %sil
	movb	%sil, 1657(%rsp)
	movb	1626(%rdx), %sil
	movb	%sil, 1658(%rsp)
	movb	1627(%rdx), %sil
	movb	%sil, 1659(%rsp)
	movb	1628(%rdx), %sil
	movb	%sil, 1660(%rsp)
	movb	1629(%rdx), %sil
	movb	%sil, 1661(%rsp)
	movb	1630(%rdx), %sil
	movb	%sil, 1662(%rsp)
	movb	1631(%rdx), %sil
	movb	%sil, 1663(%rsp)
	movb	1632(%rdx), %sil
	movb	%sil, 1664(%rsp)
	movb	1633(%rdx), %sil
	movb	%sil, 1665(%rsp)
	movb	1634(%rdx), %sil
	movb	%sil, 1666(%rsp)
	movb	1635(%rdx), %sil
	movb	%sil, 1667(%rsp)
	movb	1636(%rdx), %sil
	movb	%sil, 1668(%rsp)
	movb	1637(%rdx), %sil
	movb	%sil, 1669(%rsp)
	movb	1638(%rdx), %sil
	movb	%sil, 1670(%rsp)
	movb	1639(%rdx), %sil
	movb	%sil, 1671(%rsp)
	movb	1640(%rdx), %sil
	movb	%sil, 1672(%rsp)
	movb	1641(%rdx), %sil
	movb	%sil, 1673(%rsp)
	movb	1642(%rdx), %sil
	movb	%sil, 1674(%rsp)
	movb	1643(%rdx), %sil
	movb	%sil, 1675(%rsp)
	movb	1644(%rdx), %sil
	movb	%sil, 1676(%rsp)
	movb	1645(%rdx), %sil
	movb	%sil, 1677(%rsp)
	movb	1646(%rdx), %sil
	movb	%sil, 1678(%rsp)
	movb	1647(%rdx), %sil
	movb	%sil, 1679(%rsp)
	movb	1648(%rdx), %sil
	movb	%sil, 1680(%rsp)
	movb	1649(%rdx), %sil
	movb	%sil, 1681(%rsp)
	movb	1650(%rdx), %sil
	movb	%sil, 1682(%rsp)
	movb	1651(%rdx), %sil
	movb	%sil, 1683(%rsp)
	movb	1652(%rdx), %sil
	movb	%sil, 1684(%rsp)
	movb	1653(%rdx), %sil
	movb	%sil, 1685(%rsp)
	movb	1654(%rdx), %sil
	movb	%sil, 1686(%rsp)
	movb	1655(%rdx), %sil
	movb	%sil, 1687(%rsp)
	movb	1656(%rdx), %sil
	movb	%sil, 1688(%rsp)
	movb	1657(%rdx), %sil
	movb	%sil, 1689(%rsp)
	movb	1658(%rdx), %sil
	movb	%sil, 1690(%rsp)
	movb	1659(%rdx), %sil
	movb	%sil, 1691(%rsp)
	movb	1660(%rdx), %sil
	movb	%sil, 1692(%rsp)
	movb	1661(%rdx), %sil
	movb	%sil, 1693(%rsp)
	movb	1662(%rdx), %sil
	movb	%sil, 1694(%rsp)
	movb	1663(%rdx), %sil
	movb	%sil, 1695(%rsp)
	movb	1664(%rdx), %sil
	movb	%sil, 1696(%rsp)
	movb	1665(%rdx), %sil
	movb	%sil, 1697(%rsp)
	movb	1666(%rdx), %sil
	movb	%sil, 1698(%rsp)
	movb	1667(%rdx), %sil
	movb	%sil, 1699(%rsp)
	movb	1668(%rdx), %sil
	movb	%sil, 1700(%rsp)
	movb	1669(%rdx), %sil
	movb	%sil, 1701(%rsp)
	movb	1670(%rdx), %sil
	movb	%sil, 1702(%rsp)
	movb	1671(%rdx), %sil
	movb	%sil, 1703(%rsp)
	movb	1672(%rdx), %sil
	movb	%sil, 1704(%rsp)
	movb	1673(%rdx), %sil
	movb	%sil, 1705(%rsp)
	movb	1674(%rdx), %sil
	movb	%sil, 1706(%rsp)
	movb	1675(%rdx), %sil
	movb	%sil, 1707(%rsp)
	movb	1676(%rdx), %sil
	movb	%sil, 1708(%rsp)
	movb	1677(%rdx), %sil
	movb	%sil, 1709(%rsp)
	movb	1678(%rdx), %sil
	movb	%sil, 1710(%rsp)
	movb	1679(%rdx), %sil
	movb	%sil, 1711(%rsp)
	movb	1680(%rdx), %sil
	movb	%sil, 1712(%rsp)
	movb	1681(%rdx), %sil
	movb	%sil, 1713(%rsp)
	movb	1682(%rdx), %sil
	movb	%sil, 1714(%rsp)
	movb	1683(%rdx), %sil
	movb	%sil, 1715(%rsp)
	movb	1684(%rdx), %sil
	movb	%sil, 1716(%rsp)
	movb	1685(%rdx), %sil
	movb	%sil, 1717(%rsp)
	movb	1686(%rdx), %sil
	movb	%sil, 1718(%rsp)
	movb	1687(%rdx), %sil
	movb	%sil, 1719(%rsp)
	movb	1688(%rdx), %sil
	movb	%sil, 1720(%rsp)
	movb	1689(%rdx), %sil
	movb	%sil, 1721(%rsp)
	movb	1690(%rdx), %sil
	movb	%sil, 1722(%rsp)
	movb	1691(%rdx), %sil
	movb	%sil, 1723(%rsp)
	movb	1692(%rdx), %sil
	movb	%sil, 1724(%rsp)
	movb	1693(%rdx), %sil
	movb	%sil, 1725(%rsp)
	movb	1694(%rdx), %sil
	movb	%sil, 1726(%rsp)
	movb	1695(%rdx), %sil
	movb	%sil, 1727(%rsp)
	movb	1696(%rdx), %sil
	movb	%sil, 1728(%rsp)
	movb	1697(%rdx), %sil
	movb	%sil, 1729(%rsp)
	movb	1698(%rdx), %sil
	movb	%sil, 1730(%rsp)
	movb	1699(%rdx), %sil
	movb	%sil, 1731(%rsp)
	movb	1700(%rdx), %sil
	movb	%sil, 1732(%rsp)
	movb	1701(%rdx), %sil
	movb	%sil, 1733(%rsp)
	movb	1702(%rdx), %sil
	movb	%sil, 1734(%rsp)
	movb	1703(%rdx), %sil
	movb	%sil, 1735(%rsp)
	movb	1704(%rdx), %sil
	movb	%sil, 1736(%rsp)
	movb	1705(%rdx), %sil
	movb	%sil, 1737(%rsp)
	movb	1706(%rdx), %sil
	movb	%sil, 1738(%rsp)
	movb	1707(%rdx), %sil
	movb	%sil, 1739(%rsp)
	movb	1708(%rdx), %sil
	movb	%sil, 1740(%rsp)
	movb	1709(%rdx), %sil
	movb	%sil, 1741(%rsp)
	movb	1710(%rdx), %sil
	movb	%sil, 1742(%rsp)
	movb	1711(%rdx), %sil
	movb	%sil, 1743(%rsp)
	movb	1712(%rdx), %sil
	movb	%sil, 1744(%rsp)
	movb	1713(%rdx), %sil
	movb	%sil, 1745(%rsp)
	movb	1714(%rdx), %sil
	movb	%sil, 1746(%rsp)
	movb	1715(%rdx), %sil
	movb	%sil, 1747(%rsp)
	movb	1716(%rdx), %sil
	movb	%sil, 1748(%rsp)
	movb	1717(%rdx), %sil
	movb	%sil, 1749(%rsp)
	movb	1718(%rdx), %sil
	movb	%sil, 1750(%rsp)
	movb	1719(%rdx), %sil
	movb	%sil, 1751(%rsp)
	movb	1720(%rdx), %sil
	movb	%sil, 1752(%rsp)
	movb	1721(%rdx), %sil
	movb	%sil, 1753(%rsp)
	movb	1722(%rdx), %sil
	movb	%sil, 1754(%rsp)
	movb	1723(%rdx), %sil
	movb	%sil, 1755(%rsp)
	movb	1724(%rdx), %sil
	movb	%sil, 1756(%rsp)
	movb	1725(%rdx), %sil
	movb	%sil, 1757(%rsp)
	movb	1726(%rdx), %sil
	movb	%sil, 1758(%rsp)
	movb	1727(%rdx), %sil
	movb	%sil, 1759(%rsp)
	movb	1728(%rdx), %sil
	movb	%sil, 1760(%rsp)
	movb	1729(%rdx), %sil
	movb	%sil, 1761(%rsp)
	movb	1730(%rdx), %sil
	movb	%sil, 1762(%rsp)
	movb	1731(%rdx), %sil
	movb	%sil, 1763(%rsp)
	movb	1732(%rdx), %sil
	movb	%sil, 1764(%rsp)
	movb	1733(%rdx), %sil
	movb	%sil, 1765(%rsp)
	movb	1734(%rdx), %sil
	movb	%sil, 1766(%rsp)
	movb	1735(%rdx), %sil
	movb	%sil, 1767(%rsp)
	movb	1736(%rdx), %sil
	movb	%sil, 1768(%rsp)
	movb	1737(%rdx), %sil
	movb	%sil, 1769(%rsp)
	movb	1738(%rdx), %sil
	movb	%sil, 1770(%rsp)
	movb	1739(%rdx), %sil
	movb	%sil, 1771(%rsp)
	movb	1740(%rdx), %sil
	movb	%sil, 1772(%rsp)
	movb	1741(%rdx), %sil
	movb	%sil, 1773(%rsp)
	movb	1742(%rdx), %sil
	movb	%sil, 1774(%rsp)
	movb	1743(%rdx), %sil
	movb	%sil, 1775(%rsp)
	movb	1744(%rdx), %sil
	movb	%sil, 1776(%rsp)
	movb	1745(%rdx), %sil
	movb	%sil, 1777(%rsp)
	movb	1746(%rdx), %sil
	movb	%sil, 1778(%rsp)
	movb	1747(%rdx), %sil
	movb	%sil, 1779(%rsp)
	movb	1748(%rdx), %sil
	movb	%sil, 1780(%rsp)
	movb	1749(%rdx), %sil
	movb	%sil, 1781(%rsp)
	movb	1750(%rdx), %sil
	movb	%sil, 1782(%rsp)
	movb	1751(%rdx), %sil
	movb	%sil, 1783(%rsp)
	movb	1752(%rdx), %sil
	movb	%sil, 1784(%rsp)
	movb	1753(%rdx), %sil
	movb	%sil, 1785(%rsp)
	movb	1754(%rdx), %sil
	movb	%sil, 1786(%rsp)
	movb	1755(%rdx), %sil
	movb	%sil, 1787(%rsp)
	movb	1756(%rdx), %sil
	movb	%sil, 1788(%rsp)
	movb	1757(%rdx), %sil
	movb	%sil, 1789(%rsp)
	movb	1758(%rdx), %sil
	movb	%sil, 1790(%rsp)
	movb	1759(%rdx), %sil
	movb	%sil, 1791(%rsp)
	movb	1760(%rdx), %sil
	movb	%sil, 1792(%rsp)
	movb	1761(%rdx), %sil
	movb	%sil, 1793(%rsp)
	movb	1762(%rdx), %sil
	movb	%sil, 1794(%rsp)
	movb	1763(%rdx), %sil
	movb	%sil, 1795(%rsp)
	movb	1764(%rdx), %sil
	movb	%sil, 1796(%rsp)
	movb	1765(%rdx), %sil
	movb	%sil, 1797(%rsp)
	movb	1766(%rdx), %sil
	movb	%sil, 1798(%rsp)
	movb	1767(%rdx), %sil
	movb	%sil, 1799(%rsp)
	movb	1768(%rdx), %sil
	movb	%sil, 1800(%rsp)
	movb	1769(%rdx), %sil
	movb	%sil, 1801(%rsp)
	movb	1770(%rdx), %sil
	movb	%sil, 1802(%rsp)
	movb	1771(%rdx), %sil
	movb	%sil, 1803(%rsp)
	movb	1772(%rdx), %sil
	movb	%sil, 1804(%rsp)
	movb	1773(%rdx), %sil
	movb	%sil, 1805(%rsp)
	movb	1774(%rdx), %sil
	movb	%sil, 1806(%rsp)
	movb	1775(%rdx), %sil
	movb	%sil, 1807(%rsp)
	movb	1776(%rdx), %sil
	movb	%sil, 1808(%rsp)
	movb	1777(%rdx), %sil
	movb	%sil, 1809(%rsp)
	movb	1778(%rdx), %sil
	movb	%sil, 1810(%rsp)
	movb	1779(%rdx), %sil
	movb	%sil, 1811(%rsp)
	movb	1780(%rdx), %sil
	movb	%sil, 1812(%rsp)
	movb	1781(%rdx), %sil
	movb	%sil, 1813(%rsp)
	movb	1782(%rdx), %sil
	movb	%sil, 1814(%rsp)
	movb	1783(%rdx), %sil
	movb	%sil, 1815(%rsp)
	movb	1784(%rdx), %sil
	movb	%sil, 1816(%rsp)
	movb	1785(%rdx), %sil
	movb	%sil, 1817(%rsp)
	movb	1786(%rdx), %sil
	movb	%sil, 1818(%rsp)
	movb	1787(%rdx), %sil
	movb	%sil, 1819(%rsp)
	movb	1788(%rdx), %sil
	movb	%sil, 1820(%rsp)
	movb	1789(%rdx), %sil
	movb	%sil, 1821(%rsp)
	movb	1790(%rdx), %sil
	movb	%sil, 1822(%rsp)
	movb	1791(%rdx), %sil
	movb	%sil, 1823(%rsp)
	movb	1792(%rdx), %sil
	movb	%sil, 1824(%rsp)
	movb	1793(%rdx), %sil
	movb	%sil, 1825(%rsp)
	movb	1794(%rdx), %sil
	movb	%sil, 1826(%rsp)
	movb	1795(%rdx), %sil
	movb	%sil, 1827(%rsp)
	movb	1796(%rdx), %sil
	movb	%sil, 1828(%rsp)
	movb	1797(%rdx), %sil
	movb	%sil, 1829(%rsp)
	movb	1798(%rdx), %sil
	movb	%sil, 1830(%rsp)
	movb	1799(%rdx), %sil
	movb	%sil, 1831(%rsp)
	movb	1800(%rdx), %sil
	movb	%sil, 1832(%rsp)
	movb	1801(%rdx), %sil
	movb	%sil, 1833(%rsp)
	movb	1802(%rdx), %sil
	movb	%sil, 1834(%rsp)
	movb	1803(%rdx), %sil
	movb	%sil, 1835(%rsp)
	movb	1804(%rdx), %sil
	movb	%sil, 1836(%rsp)
	movb	1805(%rdx), %sil
	movb	%sil, 1837(%rsp)
	movb	1806(%rdx), %sil
	movb	%sil, 1838(%rsp)
	movb	1807(%rdx), %sil
	movb	%sil, 1839(%rsp)
	movb	1808(%rdx), %sil
	movb	%sil, 1840(%rsp)
	movb	1809(%rdx), %sil
	movb	%sil, 1841(%rsp)
	movb	1810(%rdx), %sil
	movb	%sil, 1842(%rsp)
	movb	1811(%rdx), %sil
	movb	%sil, 1843(%rsp)
	movb	1812(%rdx), %sil
	movb	%sil, 1844(%rsp)
	movb	1813(%rdx), %sil
	movb	%sil, 1845(%rsp)
	movb	1814(%rdx), %sil
	movb	%sil, 1846(%rsp)
	movb	1815(%rdx), %sil
	movb	%sil, 1847(%rsp)
	movb	1816(%rdx), %sil
	movb	%sil, 1848(%rsp)
	movb	1817(%rdx), %sil
	movb	%sil, 1849(%rsp)
	movb	1818(%rdx), %sil
	movb	%sil, 1850(%rsp)
	movb	1819(%rdx), %sil
	movb	%sil, 1851(%rsp)
	movb	1820(%rdx), %sil
	movb	%sil, 1852(%rsp)
	movb	1821(%rdx), %sil
	movb	%sil, 1853(%rsp)
	movb	1822(%rdx), %sil
	movb	%sil, 1854(%rsp)
	movb	1823(%rdx), %sil
	movb	%sil, 1855(%rsp)
	movb	1824(%rdx), %sil
	movb	%sil, 1856(%rsp)
	movb	1825(%rdx), %sil
	movb	%sil, 1857(%rsp)
	movb	1826(%rdx), %sil
	movb	%sil, 1858(%rsp)
	movb	1827(%rdx), %sil
	movb	%sil, 1859(%rsp)
	movb	1828(%rdx), %sil
	movb	%sil, 1860(%rsp)
	movb	1829(%rdx), %sil
	movb	%sil, 1861(%rsp)
	movb	1830(%rdx), %sil
	movb	%sil, 1862(%rsp)
	movb	1831(%rdx), %sil
	movb	%sil, 1863(%rsp)
	movb	1832(%rdx), %sil
	movb	%sil, 1864(%rsp)
	movb	1833(%rdx), %sil
	movb	%sil, 1865(%rsp)
	movb	1834(%rdx), %sil
	movb	%sil, 1866(%rsp)
	movb	1835(%rdx), %sil
	movb	%sil, 1867(%rsp)
	movb	1836(%rdx), %sil
	movb	%sil, 1868(%rsp)
	movb	1837(%rdx), %sil
	movb	%sil, 1869(%rsp)
	movb	1838(%rdx), %sil
	movb	%sil, 1870(%rsp)
	movb	1839(%rdx), %sil
	movb	%sil, 1871(%rsp)
	movb	1840(%rdx), %sil
	movb	%sil, 1872(%rsp)
	movb	1841(%rdx), %sil
	movb	%sil, 1873(%rsp)
	movb	1842(%rdx), %sil
	movb	%sil, 1874(%rsp)
	movb	1843(%rdx), %sil
	movb	%sil, 1875(%rsp)
	movb	1844(%rdx), %sil
	movb	%sil, 1876(%rsp)
	movb	1845(%rdx), %sil
	movb	%sil, 1877(%rsp)
	movb	1846(%rdx), %sil
	movb	%sil, 1878(%rsp)
	movb	1847(%rdx), %sil
	movb	%sil, 1879(%rsp)
	movb	1848(%rdx), %sil
	movb	%sil, 1880(%rsp)
	movb	1849(%rdx), %sil
	movb	%sil, 1881(%rsp)
	movb	1850(%rdx), %sil
	movb	%sil, 1882(%rsp)
	movb	1851(%rdx), %sil
	movb	%sil, 1883(%rsp)
	movb	1852(%rdx), %sil
	movb	%sil, 1884(%rsp)
	movb	1853(%rdx), %sil
	movb	%sil, 1885(%rsp)
	movb	1854(%rdx), %sil
	movb	%sil, 1886(%rsp)
	movb	1855(%rdx), %sil
	movb	%sil, 1887(%rsp)
	movb	1856(%rdx), %sil
	movb	%sil, 1888(%rsp)
	movb	1857(%rdx), %sil
	movb	%sil, 1889(%rsp)
	movb	1858(%rdx), %sil
	movb	%sil, 1890(%rsp)
	movb	1859(%rdx), %sil
	movb	%sil, 1891(%rsp)
	movb	1860(%rdx), %sil
	movb	%sil, 1892(%rsp)
	movb	1861(%rdx), %sil
	movb	%sil, 1893(%rsp)
	movb	1862(%rdx), %sil
	movb	%sil, 1894(%rsp)
	movb	1863(%rdx), %sil
	movb	%sil, 1895(%rsp)
	movb	1864(%rdx), %sil
	movb	%sil, 1896(%rsp)
	movb	1865(%rdx), %sil
	movb	%sil, 1897(%rsp)
	movb	1866(%rdx), %sil
	movb	%sil, 1898(%rsp)
	movb	1867(%rdx), %sil
	movb	%sil, 1899(%rsp)
	movb	1868(%rdx), %sil
	movb	%sil, 1900(%rsp)
	movb	1869(%rdx), %sil
	movb	%sil, 1901(%rsp)
	movb	1870(%rdx), %sil
	movb	%sil, 1902(%rsp)
	movb	1871(%rdx), %sil
	movb	%sil, 1903(%rsp)
	movb	1872(%rdx), %sil
	movb	%sil, 1904(%rsp)
	movb	1873(%rdx), %sil
	movb	%sil, 1905(%rsp)
	movb	1874(%rdx), %sil
	movb	%sil, 1906(%rsp)
	movb	1875(%rdx), %sil
	movb	%sil, 1907(%rsp)
	movb	1876(%rdx), %sil
	movb	%sil, 1908(%rsp)
	movb	1877(%rdx), %sil
	movb	%sil, 1909(%rsp)
	movb	1878(%rdx), %sil
	movb	%sil, 1910(%rsp)
	movb	1879(%rdx), %sil
	movb	%sil, 1911(%rsp)
	movb	1880(%rdx), %sil
	movb	%sil, 1912(%rsp)
	movb	1881(%rdx), %sil
	movb	%sil, 1913(%rsp)
	movb	1882(%rdx), %sil
	movb	%sil, 1914(%rsp)
	movb	1883(%rdx), %sil
	movb	%sil, 1915(%rsp)
	movb	1884(%rdx), %sil
	movb	%sil, 1916(%rsp)
	movb	1885(%rdx), %sil
	movb	%sil, 1917(%rsp)
	movb	1886(%rdx), %sil
	movb	%sil, 1918(%rsp)
	movb	1887(%rdx), %sil
	movb	%sil, 1919(%rsp)
	movb	1888(%rdx), %sil
	movb	%sil, 1920(%rsp)
	movb	1889(%rdx), %sil
	movb	%sil, 1921(%rsp)
	movb	1890(%rdx), %sil
	movb	%sil, 1922(%rsp)
	movb	1891(%rdx), %sil
	movb	%sil, 1923(%rsp)
	movb	1892(%rdx), %sil
	movb	%sil, 1924(%rsp)
	movb	1893(%rdx), %sil
	movb	%sil, 1925(%rsp)
	movb	1894(%rdx), %sil
	movb	%sil, 1926(%rsp)
	movb	1895(%rdx), %sil
	movb	%sil, 1927(%rsp)
	movb	1896(%rdx), %sil
	movb	%sil, 1928(%rsp)
	movb	1897(%rdx), %sil
	movb	%sil, 1929(%rsp)
	movb	1898(%rdx), %sil
	movb	%sil, 1930(%rsp)
	movb	1899(%rdx), %sil
	movb	%sil, 1931(%rsp)
	movb	1900(%rdx), %sil
	movb	%sil, 1932(%rsp)
	movb	1901(%rdx), %sil
	movb	%sil, 1933(%rsp)
	movb	1902(%rdx), %sil
	movb	%sil, 1934(%rsp)
	movb	1903(%rdx), %sil
	movb	%sil, 1935(%rsp)
	movb	1904(%rdx), %sil
	movb	%sil, 1936(%rsp)
	movb	1905(%rdx), %sil
	movb	%sil, 1937(%rsp)
	movb	1906(%rdx), %sil
	movb	%sil, 1938(%rsp)
	movb	1907(%rdx), %sil
	movb	%sil, 1939(%rsp)
	movb	1908(%rdx), %sil
	movb	%sil, 1940(%rsp)
	movb	1909(%rdx), %sil
	movb	%sil, 1941(%rsp)
	movb	1910(%rdx), %sil
	movb	%sil, 1942(%rsp)
	movb	1911(%rdx), %sil
	movb	%sil, 1943(%rsp)
	movb	1912(%rdx), %sil
	movb	%sil, 1944(%rsp)
	movb	1913(%rdx), %sil
	movb	%sil, 1945(%rsp)
	movb	1914(%rdx), %sil
	movb	%sil, 1946(%rsp)
	movb	1915(%rdx), %sil
	movb	%sil, 1947(%rsp)
	movb	1916(%rdx), %sil
	movb	%sil, 1948(%rsp)
	movb	1917(%rdx), %sil
	movb	%sil, 1949(%rsp)
	movb	1918(%rdx), %sil
	movb	%sil, 1950(%rsp)
	movb	1919(%rdx), %sil
	movb	%sil, 1951(%rsp)
	movb	1920(%rdx), %sil
	movb	%sil, 1952(%rsp)
	movb	1921(%rdx), %sil
	movb	%sil, 1953(%rsp)
	movb	1922(%rdx), %sil
	movb	%sil, 1954(%rsp)
	movb	1923(%rdx), %sil
	movb	%sil, 1955(%rsp)
	movb	1924(%rdx), %sil
	movb	%sil, 1956(%rsp)
	movb	1925(%rdx), %sil
	movb	%sil, 1957(%rsp)
	movb	1926(%rdx), %sil
	movb	%sil, 1958(%rsp)
	movb	1927(%rdx), %sil
	movb	%sil, 1959(%rsp)
	movb	1928(%rdx), %sil
	movb	%sil, 1960(%rsp)
	movb	1929(%rdx), %sil
	movb	%sil, 1961(%rsp)
	movb	1930(%rdx), %sil
	movb	%sil, 1962(%rsp)
	movb	1931(%rdx), %sil
	movb	%sil, 1963(%rsp)
	movb	1932(%rdx), %sil
	movb	%sil, 1964(%rsp)
	movb	1933(%rdx), %sil
	movb	%sil, 1965(%rsp)
	movb	1934(%rdx), %sil
	movb	%sil, 1966(%rsp)
	movb	1935(%rdx), %sil
	movb	%sil, 1967(%rsp)
	movb	1936(%rdx), %sil
	movb	%sil, 1968(%rsp)
	movb	1937(%rdx), %sil
	movb	%sil, 1969(%rsp)
	movb	1938(%rdx), %sil
	movb	%sil, 1970(%rsp)
	movb	1939(%rdx), %sil
	movb	%sil, 1971(%rsp)
	movb	1940(%rdx), %sil
	movb	%sil, 1972(%rsp)
	movb	1941(%rdx), %sil
	movb	%sil, 1973(%rsp)
	movb	1942(%rdx), %sil
	movb	%sil, 1974(%rsp)
	movb	1943(%rdx), %sil
	movb	%sil, 1975(%rsp)
	movb	1944(%rdx), %sil
	movb	%sil, 1976(%rsp)
	movb	1945(%rdx), %sil
	movb	%sil, 1977(%rsp)
	movb	1946(%rdx), %sil
	movb	%sil, 1978(%rsp)
	movb	1947(%rdx), %sil
	movb	%sil, 1979(%rsp)
	movb	1948(%rdx), %sil
	movb	%sil, 1980(%rsp)
	movb	1949(%rdx), %sil
	movb	%sil, 1981(%rsp)
	movb	1950(%rdx), %sil
	movb	%sil, 1982(%rsp)
	movb	1951(%rdx), %sil
	movb	%sil, 1983(%rsp)
	movb	1952(%rdx), %sil
	movb	%sil, 1984(%rsp)
	movb	1953(%rdx), %sil
	movb	%sil, 1985(%rsp)
	movb	1954(%rdx), %sil
	movb	%sil, 1986(%rsp)
	movb	1955(%rdx), %sil
	movb	%sil, 1987(%rsp)
	movb	1956(%rdx), %sil
	movb	%sil, 1988(%rsp)
	movb	1957(%rdx), %sil
	movb	%sil, 1989(%rsp)
	movb	1958(%rdx), %sil
	movb	%sil, 1990(%rsp)
	movb	1959(%rdx), %sil
	movb	%sil, 1991(%rsp)
	movb	1960(%rdx), %sil
	movb	%sil, 1992(%rsp)
	movb	1961(%rdx), %sil
	movb	%sil, 1993(%rsp)
	movb	1962(%rdx), %sil
	movb	%sil, 1994(%rsp)
	movb	1963(%rdx), %sil
	movb	%sil, 1995(%rsp)
	movb	1964(%rdx), %sil
	movb	%sil, 1996(%rsp)
	movb	1965(%rdx), %sil
	movb	%sil, 1997(%rsp)
	movb	1966(%rdx), %sil
	movb	%sil, 1998(%rsp)
	movb	1967(%rdx), %sil
	movb	%sil, 1999(%rsp)
	movb	1968(%rdx), %sil
	movb	%sil, 2000(%rsp)
	movb	1969(%rdx), %sil
	movb	%sil, 2001(%rsp)
	movb	1970(%rdx), %sil
	movb	%sil, 2002(%rsp)
	movb	1971(%rdx), %sil
	movb	%sil, 2003(%rsp)
	movb	1972(%rdx), %sil
	movb	%sil, 2004(%rsp)
	movb	1973(%rdx), %sil
	movb	%sil, 2005(%rsp)
	movb	1974(%rdx), %sil
	movb	%sil, 2006(%rsp)
	movb	1975(%rdx), %sil
	movb	%sil, 2007(%rsp)
	movb	1976(%rdx), %sil
	movb	%sil, 2008(%rsp)
	movb	1977(%rdx), %sil
	movb	%sil, 2009(%rsp)
	movb	1978(%rdx), %sil
	movb	%sil, 2010(%rsp)
	movb	1979(%rdx), %sil
	movb	%sil, 2011(%rsp)
	movb	1980(%rdx), %sil
	movb	%sil, 2012(%rsp)
	movb	1981(%rdx), %sil
	movb	%sil, 2013(%rsp)
	movb	1982(%rdx), %sil
	movb	%sil, 2014(%rsp)
	movb	1983(%rdx), %sil
	movb	%sil, 2015(%rsp)
	movb	1984(%rdx), %sil
	movb	%sil, 2016(%rsp)
	movb	1985(%rdx), %sil
	movb	%sil, 2017(%rsp)
	movb	1986(%rdx), %sil
	movb	%sil, 2018(%rsp)
	movb	1987(%rdx), %sil
	movb	%sil, 2019(%rsp)
	movb	1988(%rdx), %sil
	movb	%sil, 2020(%rsp)
	movb	1989(%rdx), %sil
	movb	%sil, 2021(%rsp)
	movb	1990(%rdx), %sil
	movb	%sil, 2022(%rsp)
	movb	1991(%rdx), %sil
	movb	%sil, 2023(%rsp)
	movb	1992(%rdx), %sil
	movb	%sil, 2024(%rsp)
	movb	1993(%rdx), %sil
	movb	%sil, 2025(%rsp)
	movb	1994(%rdx), %sil
	movb	%sil, 2026(%rsp)
	movb	1995(%rdx), %sil
	movb	%sil, 2027(%rsp)
	movb	1996(%rdx), %sil
	movb	%sil, 2028(%rsp)
	movb	1997(%rdx), %sil
	movb	%sil, 2029(%rsp)
	movb	1998(%rdx), %sil
	movb	%sil, 2030(%rsp)
	movb	1999(%rdx), %sil
	movb	%sil, 2031(%rsp)
	movb	2000(%rdx), %sil
	movb	%sil, 2032(%rsp)
	movb	2001(%rdx), %sil
	movb	%sil, 2033(%rsp)
	movb	2002(%rdx), %sil
	movb	%sil, 2034(%rsp)
	movb	2003(%rdx), %sil
	movb	%sil, 2035(%rsp)
	movb	2004(%rdx), %sil
	movb	%sil, 2036(%rsp)
	movb	2005(%rdx), %sil
	movb	%sil, 2037(%rsp)
	movb	2006(%rdx), %sil
	movb	%sil, 2038(%rsp)
	movb	2007(%rdx), %sil
	movb	%sil, 2039(%rsp)
	movb	2008(%rdx), %sil
	movb	%sil, 2040(%rsp)
	movb	2009(%rdx), %sil
	movb	%sil, 2041(%rsp)
	movb	2010(%rdx), %sil
	movb	%sil, 2042(%rsp)
	movb	2011(%rdx), %sil
	movb	%sil, 2043(%rsp)
	movb	2012(%rdx), %sil
	movb	%sil, 2044(%rsp)
	movb	2013(%rdx), %sil
	movb	%sil, 2045(%rsp)
	movb	2014(%rdx), %sil
	movb	%sil, 2046(%rsp)
	movb	2015(%rdx), %sil
	movb	%sil, 2047(%rsp)
	movb	2016(%rdx), %sil
	movb	%sil, 2048(%rsp)
	movb	2017(%rdx), %sil
	movb	%sil, 2049(%rsp)
	movb	2018(%rdx), %sil
	movb	%sil, 2050(%rsp)
	movb	2019(%rdx), %sil
	movb	%sil, 2051(%rsp)
	movb	2020(%rdx), %sil
	movb	%sil, 2052(%rsp)
	movb	2021(%rdx), %sil
	movb	%sil, 2053(%rsp)
	movb	2022(%rdx), %sil
	movb	%sil, 2054(%rsp)
	movb	2023(%rdx), %sil
	movb	%sil, 2055(%rsp)
	movb	2024(%rdx), %sil
	movb	%sil, 2056(%rsp)
	movb	2025(%rdx), %sil
	movb	%sil, 2057(%rsp)
	movb	2026(%rdx), %sil
	movb	%sil, 2058(%rsp)
	movb	2027(%rdx), %sil
	movb	%sil, 2059(%rsp)
	movb	2028(%rdx), %sil
	movb	%sil, 2060(%rsp)
	movb	2029(%rdx), %sil
	movb	%sil, 2061(%rsp)
	movb	2030(%rdx), %sil
	movb	%sil, 2062(%rsp)
	movb	2031(%rdx), %sil
	movb	%sil, 2063(%rsp)
	movb	2032(%rdx), %sil
	movb	%sil, 2064(%rsp)
	movb	2033(%rdx), %sil
	movb	%sil, 2065(%rsp)
	movb	2034(%rdx), %sil
	movb	%sil, 2066(%rsp)
	movb	2035(%rdx), %sil
	movb	%sil, 2067(%rsp)
	movb	2036(%rdx), %sil
	movb	%sil, 2068(%rsp)
	movb	2037(%rdx), %sil
	movb	%sil, 2069(%rsp)
	movb	2038(%rdx), %sil
	movb	%sil, 2070(%rsp)
	movb	2039(%rdx), %sil
	movb	%sil, 2071(%rsp)
	movb	2040(%rdx), %sil
	movb	%sil, 2072(%rsp)
	movb	2041(%rdx), %sil
	movb	%sil, 2073(%rsp)
	movb	2042(%rdx), %sil
	movb	%sil, 2074(%rsp)
	movb	2043(%rdx), %sil
	movb	%sil, 2075(%rsp)
	movb	2044(%rdx), %sil
	movb	%sil, 2076(%rsp)
	movb	2045(%rdx), %sil
	movb	%sil, 2077(%rsp)
	movb	2046(%rdx), %sil
	movb	%sil, 2078(%rsp)
	movb	2047(%rdx), %sil
	movb	%sil, 2079(%rsp)
	movb	2048(%rdx), %sil
	movb	%sil, 2080(%rsp)
	movb	2049(%rdx), %sil
	movb	%sil, 2081(%rsp)
	movb	2050(%rdx), %sil
	movb	%sil, 2082(%rsp)
	movb	2051(%rdx), %sil
	movb	%sil, 2083(%rsp)
	movb	2052(%rdx), %sil
	movb	%sil, 2084(%rsp)
	movb	2053(%rdx), %sil
	movb	%sil, 2085(%rsp)
	movb	2054(%rdx), %sil
	movb	%sil, 2086(%rsp)
	movb	2055(%rdx), %sil
	movb	%sil, 2087(%rsp)
	movb	2056(%rdx), %sil
	movb	%sil, 2088(%rsp)
	movb	2057(%rdx), %sil
	movb	%sil, 2089(%rsp)
	movb	2058(%rdx), %sil
	movb	%sil, 2090(%rsp)
	movb	2059(%rdx), %sil
	movb	%sil, 2091(%rsp)
	movb	2060(%rdx), %sil
	movb	%sil, 2092(%rsp)
	movb	2061(%rdx), %sil
	movb	%sil, 2093(%rsp)
	movb	2062(%rdx), %sil
	movb	%sil, 2094(%rsp)
	movb	2063(%rdx), %sil
	movb	%sil, 2095(%rsp)
	movb	2064(%rdx), %sil
	movb	%sil, 2096(%rsp)
	movb	2065(%rdx), %sil
	movb	%sil, 2097(%rsp)
	movb	2066(%rdx), %sil
	movb	%sil, 2098(%rsp)
	movb	2067(%rdx), %sil
	movb	%sil, 2099(%rsp)
	movb	2068(%rdx), %sil
	movb	%sil, 2100(%rsp)
	movb	2069(%rdx), %sil
	movb	%sil, 2101(%rsp)
	movb	2070(%rdx), %sil
	movb	%sil, 2102(%rsp)
	movb	2071(%rdx), %sil
	movb	%sil, 2103(%rsp)
	movb	2072(%rdx), %sil
	movb	%sil, 2104(%rsp)
	movb	2073(%rdx), %sil
	movb	%sil, 2105(%rsp)
	movb	2074(%rdx), %sil
	movb	%sil, 2106(%rsp)
	movb	2075(%rdx), %sil
	movb	%sil, 2107(%rsp)
	movb	2076(%rdx), %sil
	movb	%sil, 2108(%rsp)
	movb	2077(%rdx), %sil
	movb	%sil, 2109(%rsp)
	movb	2078(%rdx), %sil
	movb	%sil, 2110(%rsp)
	movb	2079(%rdx), %sil
	movb	%sil, 2111(%rsp)
	movb	2080(%rdx), %sil
	movb	%sil, 2112(%rsp)
	movb	2081(%rdx), %sil
	movb	%sil, 2113(%rsp)
	movb	2082(%rdx), %sil
	movb	%sil, 2114(%rsp)
	movb	2083(%rdx), %sil
	movb	%sil, 2115(%rsp)
	movb	2084(%rdx), %sil
	movb	%sil, 2116(%rsp)
	movb	2085(%rdx), %sil
	movb	%sil, 2117(%rsp)
	movb	2086(%rdx), %sil
	movb	%sil, 2118(%rsp)
	movb	2087(%rdx), %sil
	movb	%sil, 2119(%rsp)
	movb	2088(%rdx), %sil
	movb	%sil, 2120(%rsp)
	movb	2089(%rdx), %sil
	movb	%sil, 2121(%rsp)
	movb	2090(%rdx), %sil
	movb	%sil, 2122(%rsp)
	movb	2091(%rdx), %sil
	movb	%sil, 2123(%rsp)
	movb	2092(%rdx), %sil
	movb	%sil, 2124(%rsp)
	movb	2093(%rdx), %sil
	movb	%sil, 2125(%rsp)
	movb	2094(%rdx), %sil
	movb	%sil, 2126(%rsp)
	movb	2095(%rdx), %sil
	movb	%sil, 2127(%rsp)
	movb	2096(%rdx), %sil
	movb	%sil, 2128(%rsp)
	movb	2097(%rdx), %sil
	movb	%sil, 2129(%rsp)
	movb	2098(%rdx), %sil
	movb	%sil, 2130(%rsp)
	movb	2099(%rdx), %sil
	movb	%sil, 2131(%rsp)
	movb	2100(%rdx), %sil
	movb	%sil, 2132(%rsp)
	movb	2101(%rdx), %sil
	movb	%sil, 2133(%rsp)
	movb	2102(%rdx), %sil
	movb	%sil, 2134(%rsp)
	movb	2103(%rdx), %sil
	movb	%sil, 2135(%rsp)
	movb	2104(%rdx), %sil
	movb	%sil, 2136(%rsp)
	movb	2105(%rdx), %sil
	movb	%sil, 2137(%rsp)
	movb	2106(%rdx), %sil
	movb	%sil, 2138(%rsp)
	movb	2107(%rdx), %sil
	movb	%sil, 2139(%rsp)
	movb	2108(%rdx), %sil
	movb	%sil, 2140(%rsp)
	movb	2109(%rdx), %sil
	movb	%sil, 2141(%rsp)
	movb	2110(%rdx), %sil
	movb	%sil, 2142(%rsp)
	movb	2111(%rdx), %sil
	movb	%sil, 2143(%rsp)
	movb	2112(%rdx), %sil
	movb	%sil, 2144(%rsp)
	movb	2113(%rdx), %sil
	movb	%sil, 2145(%rsp)
	movb	2114(%rdx), %sil
	movb	%sil, 2146(%rsp)
	movb	2115(%rdx), %sil
	movb	%sil, 2147(%rsp)
	movb	2116(%rdx), %sil
	movb	%sil, 2148(%rsp)
	movb	2117(%rdx), %sil
	movb	%sil, 2149(%rsp)
	movb	2118(%rdx), %sil
	movb	%sil, 2150(%rsp)
	movb	2119(%rdx), %sil
	movb	%sil, 2151(%rsp)
	movb	2120(%rdx), %sil
	movb	%sil, 2152(%rsp)
	movb	2121(%rdx), %sil
	movb	%sil, 2153(%rsp)
	movb	2122(%rdx), %sil
	movb	%sil, 2154(%rsp)
	movb	2123(%rdx), %sil
	movb	%sil, 2155(%rsp)
	movb	2124(%rdx), %sil
	movb	%sil, 2156(%rsp)
	movb	2125(%rdx), %sil
	movb	%sil, 2157(%rsp)
	movb	2126(%rdx), %sil
	movb	%sil, 2158(%rsp)
	movb	2127(%rdx), %sil
	movb	%sil, 2159(%rsp)
	movb	2128(%rdx), %sil
	movb	%sil, 2160(%rsp)
	movb	2129(%rdx), %sil
	movb	%sil, 2161(%rsp)
	movb	2130(%rdx), %sil
	movb	%sil, 2162(%rsp)
	movb	2131(%rdx), %sil
	movb	%sil, 2163(%rsp)
	movb	2132(%rdx), %sil
	movb	%sil, 2164(%rsp)
	movb	2133(%rdx), %sil
	movb	%sil, 2165(%rsp)
	movb	2134(%rdx), %sil
	movb	%sil, 2166(%rsp)
	movb	2135(%rdx), %sil
	movb	%sil, 2167(%rsp)
	movb	2136(%rdx), %sil
	movb	%sil, 2168(%rsp)
	movb	2137(%rdx), %sil
	movb	%sil, 2169(%rsp)
	movb	2138(%rdx), %sil
	movb	%sil, 2170(%rsp)
	movb	2139(%rdx), %sil
	movb	%sil, 2171(%rsp)
	movb	2140(%rdx), %sil
	movb	%sil, 2172(%rsp)
	movb	2141(%rdx), %sil
	movb	%sil, 2173(%rsp)
	movb	2142(%rdx), %sil
	movb	%sil, 2174(%rsp)
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
	movl	2236(%rsp,%rax,4), %esi
	movl	$15, %eax
	subl	%esi, %eax
	leaq	32(%rsp,%rdx), %rcx
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
	movq	(%r11), %rdx
	movq	%rdx, (%rax)
	movq	8(%r11), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r11), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r11), %rdx
	movq	%rdx, 24(%rax)
	leaq	2200(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$1, 16(%rax)
	movl	20(%r11), %ecx
	leaq	2200(%rsp), %rax
	movl	%ecx, 20(%rax)
	movq	2176(%rsp), %rcx
	movq	%r11, 2176(%rsp)
	leaq	2200(%rsp), %rdi
	leaq	32(%rsp), %rax
	movq	%rcx, %r11
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
	movq	%rsi, %rdx
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
	movl	%ebp, (%rdx)
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
	movl	%ebp, 4(%rdx)
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
	movl	%ebp, 8(%rdx)
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
	movl	%ebp, 12(%rdx)
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
	movl	%ebp, 16(%rdx)
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
	movl	%ebp, 20(%rdx)
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
	movl	%ebp, 24(%rdx)
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
	movl	%ebp, 28(%rdx)
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
	movl	%ebp, 32(%rdx)
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
	movl	%ebp, 36(%rdx)
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
	movl	%ebp, 40(%rdx)
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
	movl	%ebp, 44(%rdx)
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
	movl	%ebp, 48(%rdx)
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
	movl	%ebp, 52(%rdx)
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
	movl	%ebp, 56(%rdx)
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
	movl	%ebp, 60(%rdx)
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
	movl	%ebp, 64(%rdx)
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
	movl	%ebp, 68(%rdx)
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
	movl	%ebp, 72(%rdx)
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
	movl	%ebp, 76(%rdx)
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
	movl	%ebp, 80(%rdx)
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
	movl	%ebp, 84(%rdx)
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
	movl	%ebp, 88(%rdx)
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
	movl	%ebp, 92(%rdx)
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
	movl	%ebp, 96(%rdx)
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
	movl	%ebp, 100(%rdx)
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
	movl	%ebp, 104(%rdx)
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
	movl	%ebp, 108(%rdx)
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
	movl	%ebp, 112(%rdx)
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
	movl	%ebp, 116(%rdx)
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
	movl	%ebp, 120(%rdx)
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
	movl	%ebp, 124(%rdx)
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
	movl	%ebp, 128(%rdx)
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
	movl	%ebp, 132(%rdx)
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
	movl	%ebp, 136(%rdx)
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
	movl	%ebp, 140(%rdx)
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
	movl	%ebp, 144(%rdx)
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
	movl	%ebp, 148(%rdx)
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
	movl	%ebp, 152(%rdx)
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
	movl	%ebp, 156(%rdx)
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
	movl	%ebp, 160(%rdx)
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
	movl	%ebp, 164(%rdx)
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
	movl	%ebp, 168(%rdx)
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
	movl	%ebp, 172(%rdx)
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
	movl	%ebp, 176(%rdx)
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
	movl	%ebp, 180(%rdx)
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
	movl	%ebp, 184(%rdx)
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
	movl	%ebp, 188(%rdx)
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
	movl	%ebp, 192(%rdx)
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
	movl	%ebp, 196(%rdx)
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
	movl	%ebp, 200(%rdx)
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
	movl	%ebp, 204(%rdx)
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
	movl	%ebp, 208(%rdx)
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
	movl	%ebp, 212(%rdx)
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
	movl	%ebp, 216(%rdx)
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
	movl	%ebp, 220(%rdx)
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
	movl	%ebp, 224(%rdx)
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
	movl	%ebp, 228(%rdx)
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
	movl	%ebp, 232(%rdx)
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
	movl	%ebp, 236(%rdx)
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
	movl	%ebp, 240(%rdx)
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
	movl	%ebp, 244(%rdx)
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
	movl	%ebp, 248(%rdx)
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
	movl	%eax, 252(%rdx)
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
	leaq	48(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$5, 16(%rax)
	movl	20(%rdi), %ecx
	leaq	48(%rsp), %rax
	movl	%ecx, 20(%rax)
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
	leaq	48(%rsp), %rdi
	movl	%eax, 24(%rdi)
	leaq	(%rbx,%rdx), %rcx
	movq	%rbx, 40(%rsp)
	leaq	48(%rsp), %rdi
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
	movq	$0, %rdi
	movl	$0, %edx
	jmp 	.Lwots_sign$2
.Lwots_sign$3:
	movq	%r10, 8(%rsp)
	movl	%edx, 80(%rsp)
	movq	%rdi, 32(%rsp)
	movl	%edx, %ecx
	movl	%ecx, 24(%rax)
	movl	$0, %esi
	movl	%edx, %ecx
	movl	84(%rsp,%rcx,4), %edx
	leaq	(%rbx,%rdi), %rcx
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
	movq	32(%rsp), %rdi
	incl	%edx
	addq	$32, %rdi
.Lwots_sign$2:
	cmpl	$67, %edx
	jb  	.Lwots_sign$3
	ret
.Lwots_pkgen$1:
	movq	%rcx, 2176(%rsp)
	leaq	2216(%rsp), %rcx
	movq	(%rdi), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rdi), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rdi), %rdx
	movq	%rdx, 24(%rcx)
	leaq	2216(%rsp), %r8
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$5, 16(%r8)
	movl	20(%rdi), %ecx
	leaq	2216(%rsp), %r8
	movl	%ecx, 20(%r8)
	movl	%ecx, 2248(%rsp)
	movq	%rdi, 2184(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$6
.Lwots_pkgen$7:
	movq	%r11, 2192(%rsp)
	movq	%r9, 2200(%rsp)
	movl	%ecx, 2252(%rsp)
	movq	%rdx, 2208(%rsp)
	leaq	2216(%rsp), %rdi
	movl	%ecx, 24(%rdi)
	leaq	32(%rsp,%rdx), %rcx
	leaq	2216(%rsp), %rdi
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_pkgen$8:
	leaq	56(%rsp), %rsp
	movq	2192(%rsp), %r11
	movq	2200(%rsp), %r9
	movl	2252(%rsp), %ecx
	movq	2208(%rsp), %rdx
	incl	%ecx
	addq	$32, %rdx
.Lwots_pkgen$6:
	cmpl	$67, %ecx
	jb  	.Lwots_pkgen$7
	movq	2184(%rsp), %rdi
	movq	$0, %r8
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$3
.Lwots_pkgen$4:
	movq	%r9, 2184(%rsp)
	movl	%ecx, 2252(%rsp)
	movq	%r8, 2208(%rsp)
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
	movq	2184(%rsp), %r9
	movl	2252(%rsp), %ecx
	movq	2208(%rsp), %r8
	incl	%ecx
	addq	$32, %r8
.Lwots_pkgen$3:
	cmpl	$67, %ecx
	jb  	.Lwots_pkgen$4
	leaq	2216(%rsp), %r8
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$1, 16(%r8)
	movl	2248(%rsp), %ecx
	leaq	2216(%rsp), %r8
	movl	%ecx, 20(%r8)
	movq	2176(%rsp), %rcx
	movq	%rdi, 2176(%rsp)
	leaq	2216(%rsp), %rdi
	leaq	32(%rsp), %rdx
	movq	%rcx, %r11
	movq	%rdx, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	56(%rsp), %rsp
	movq	2176(%rsp), %rdi
	ret
.Lchain$1:
	movl	%esi, %edi
	addl	%edx, %edi
	jmp 	.Lchain$2
.Lchain$3:
	movl	%esi, 28(%r8)
	movq	%r9, 8(%rsp)
	movq	%r8, 16(%rsp)
	movl	%esi, 24(%rsp)
	movl	%edi, 28(%rsp)
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lchain$4:
	leaq	56(%rsp), %rsp
	movq	8(%rsp), %r9
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
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	movq	$0, %rcx
	vpbroadcastq	(%r9,%rcx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%r9,%rcx), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%r9,%rcx), %rcx
	vmovq	%rcx, %xmm8
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	movq	$0, %rdx
	vpxor	%ymm7, %ymm7, %ymm7
	vmovdqu	(%rcx,%rdx), %xmm8
	vpslldq	$8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	8(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	16(%rcx,%rdx), %xmm8
	vmovdqu	%xmm8, %xmm8
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rcx
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vmovdqu	(%rax,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	16(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	24(%rax,%rcx), %ymm13
	movq	56(%rax,%rcx), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	64(%rax,%rcx), %rdx
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	addq	$72, %rcx
	call	.L_keccakf1600_avx2$1
.LT_k$9:
	movq	$0, %r10
	jmp 	.LT_k$6
.LT_k$7:
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	40(%rax,%rcx), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	48(%rax,%rcx), %ymm14
	movq	80(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	88(%rax,%rcx), %ymm13
	movq	120(%rax,%rcx), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	128(%rax,%rcx), %rdx
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	addq	$136, %rcx
	call	.L_keccakf1600_avx2$1
.LT_k$8:
	incq	%r10
.LT_k$6:
	cmpq	$4, %r10
	jb  	.LT_k$7
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	40(%rax,%rcx), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	48(%rax,%rcx), %ymm14
	movq	80(%rax,%rcx), %rcx
	vmovq	%rcx, %xmm8
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rax
	shlq	$63, %rax
	vmovq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm2, %ymm2
	movq	48(%rsp), %rcx
	movq	$0, %rax
	movq	$0, %r10
	jmp 	.LT_k$3
.LT_k$4:
	call	.L_keccakf1600_avx2$1
.LT_k$5:
	vmovdqu	%xmm1, %xmm7
	movq	%xmm7, (%rcx,%rax)
	vmovdqu	%ymm0, 8(%rcx,%rax)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm8
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rax)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm3, %ymm2, %ymm10
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$240, %ymm5, %ymm4, %ymm13
	vpblendd	$240, %ymm4, %ymm5, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rax)
	movq	%xmm8, %rdx
	movq	%rdx, 80(%rcx,%rax)
	vpblendd	$195, %ymm12, %ymm9, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rax)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rax)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rax)
	addq	$136, %rax
	incq	%r10
.LT_k$3:
	cmpq	$0, %r10
	jb  	.LT_k$4
	call	.L_keccakf1600_avx2$1
.LT_k$2:
	movq	%xmm1, (%rcx,%rax)
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rax)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, 24(%rcx,%rax)
	ret
.LT_len$1:
	movq	%r11, 48(%rsp)
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	movq	$0, %rdx
	vpbroadcastq	(%r9,%rdx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%r9,%rdx), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%r9,%rdx), %rdx
	vmovq	%rdx, %xmm8
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	movq	$0, %r8
	vpxor	%ymm7, %ymm7, %ymm7
	vmovdqu	(%rdx,%r8), %xmm8
	vpslldq	$8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	8(%rdx,%r8), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	16(%rdx,%r8), %xmm8
	vmovdqu	%xmm8, %xmm8
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	$0, %rdx
	vmovq	%rdx, %xmm8
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rdx
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vmovdqu	(%rcx,%rdx), %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	16(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm8
	vmovdqu	24(%rcx,%rdx), %ymm13
	movq	56(%rcx,%rdx), %rsi
	vpinsrq	$1, %rsi, %xmm7, %xmm7
	movq	64(%rcx,%rdx), %rsi
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	addq	$72, %rdx
	call	.L_keccakf1600_avx2$1
.LT_len$9:
	movq	$0, %r10
	jmp 	.LT_len$6
.LT_len$7:
	vpbroadcastq	(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	addq	$136, %rdx
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%r10
.LT_len$6:
	cmpq	$15, %r10
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rcx,%rdx), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%rcx,%rdx), %rcx
	vmovq	%rcx, %xmm8
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm2, %ymm2
	movq	48(%rsp), %rcx
	movq	$0, %rdx
	movq	$0, %r10
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm1, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm0, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm8
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm3, %ymm2, %ymm10
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$240, %ymm5, %ymm4, %ymm13
	vpblendd	$240, %ymm4, %ymm5, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm8, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm9, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%r10
.LT_len$3:
	cmpq	$0, %r10
	jb  	.LT_len$4
	call	.L_keccakf1600_avx2$1
.LT_len$2:
	movq	%xmm1, (%rcx,%rdx)
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rdx)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, 24(%rcx,%rdx)
	ret
.LH$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	movq	$0, %rcx
	vpbroadcastq	(%r9,%rcx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%r9,%rcx), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%r9,%rcx), %rcx
	vmovq	%rcx, %xmm8
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	vpxor	%ymm7, %ymm7, %ymm7
	vmovdqu	(%rcx,%r8), %xmm8
	vpslldq	$8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	8(%rcx,%r8), %rdi
	vmovq	%rdi, %xmm7
	vmovdqu	16(%rcx,%r8), %xmm8
	vmovdqu	%xmm8, %xmm8
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rcx
	movq	$0, %rdi
	vmovq	%rdi, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vmovdqu	(%rdx,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	16(%rdx,%rcx), %rdi
	vmovq	%rdi, %xmm8
	movq	24(%rdx,%rcx), %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rcx
	movq	$0, %rdi
	vmovq	%rdi, %xmm7
	vpxor	%ymm14, %ymm14, %ymm14
	movq	$0, %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	(%rsi,%rcx), %xmm9
	vpslldq	$8, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vmovdqu	8(%rsi,%rcx), %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
	movq	24(%rsi,%rcx), %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm2, %ymm2
	movq	48(%rsp), %rcx
	movq	$0, %rdx
	movq	$0, %r10
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm1, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm0, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm8
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm3, %ymm2, %ymm10
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$240, %ymm5, %ymm4, %ymm13
	vpblendd	$240, %ymm4, %ymm5, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm8, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm9, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%r10
.LH$3:
	cmpq	$0, %r10
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm1, (%rcx,%rdx)
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rdx)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, 24(%rcx,%rdx)
	ret
.LF$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	movq	$0, %rdx
	vpbroadcastq	(%r9,%rdx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%r9,%rdx), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%r9,%rdx), %rdx
	vmovq	%rdx, %xmm8
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	movq	$0, %r8
	vpxor	%ymm7, %ymm7, %ymm7
	vmovdqu	(%rdx,%r8), %xmm8
	vpslldq	$8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	8(%rdx,%r8), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	16(%rdx,%r8), %xmm8
	vmovdqu	%xmm8, %xmm8
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	$0, %rdx
	vmovq	%rdx, %xmm8
	vpxor	%ymm13, %ymm13, %ymm13
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rdx
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vmovdqu	(%rcx,%rdx), %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	16(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm8
	movq	24(%rcx,%rdx), %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm2, %ymm2
	movq	48(%rsp), %rcx
	movq	$0, %rdx
	movq	$0, %r10
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm1, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm0, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm8
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm3, %ymm2, %ymm10
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$240, %ymm5, %ymm4, %ymm13
	vpblendd	$240, %ymm4, %ymm5, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm8, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm9, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%r10
.LF$3:
	cmpq	$0, %r10
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm1, (%rcx,%rdx)
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rdx)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, 24(%rcx,%rdx)
	ret
.LPRF$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	movq	$0, %rcx
	vpbroadcastq	(%r9,%rcx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%r9,%rcx), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%r9,%rcx), %rcx
	vmovq	%rcx, %xmm8
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	movq	$0, %rdx
	vpxor	%ymm7, %ymm7, %ymm7
	vmovdqu	(%rcx,%rdx), %xmm8
	vpslldq	$8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	8(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	16(%rcx,%rdx), %xmm8
	vmovdqu	%xmm8, %xmm8
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rcx
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vmovdqu	(%r11,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	16(%r11,%rcx), %rdx
	vmovq	%rdx, %xmm8
	movq	24(%r11,%rcx), %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vpxor	%xmm10, %xmm10, %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm2, %ymm2
	movq	48(%rsp), %rcx
	movq	$0, %rdx
	movq	$0, %r10
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm1, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm0, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm8
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm3, %ymm2, %ymm10
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$240, %ymm5, %ymm4, %ymm13
	vpblendd	$240, %ymm4, %ymm5, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm8, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm9, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%r10
.LPRF$3:
	cmpq	$0, %r10
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm1, (%rcx,%rdx)
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rdx)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, 24(%rcx,%rdx)
	ret
.LPRF_msg$1:
	movq	%r11, 232(%rsp)
	movq	%rcx, 240(%rsp)
	movq	%rdx, 248(%rsp)
	movq	%rdi, 256(%rsp)
	movq	%r8, 264(%rsp)
	leaq	32(%rsp), %rax
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, 192(%rax)
	vmovdqu	(%r10), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vmovdqu	(%r9), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	movb	$0, 96(%rsp)
	movb	%dl, 97(%rsp)
	movq	$66, %rdx
	movq	$0, %rax
	movq	240(%rsp), %rdi
	movq	248(%rsp), %rcx
	jmp 	.LPRF_msg$11
.LPRF_msg$12:
	cmpq	$136, %rdx
	jb  	.LPRF_msg$13
	movq	%rdi, 248(%rsp)
	movq	%rax, 240(%rsp)
	movq	%rcx, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$14:
	leaq	200(%rsp), %rsp
	movq	248(%rsp), %rdi
	movq	240(%rsp), %rax
	movq	272(%rsp), %rcx
	movq	$0, %rdx
.LPRF_msg$13:
	movb	(%rdi,%rax), %r8b
	incq	%rax
	xorb	%r8b, 32(%rsp,%rdx)
	incq	%rdx
.LPRF_msg$11:
	cmpq	%rcx, %rax
	jb  	.LPRF_msg$12
	movq	$0, %rax
	movq	256(%rsp), %rdi
	movq	264(%rsp), %rsi
	jmp 	.LPRF_msg$7
.LPRF_msg$8:
	cmpq	$136, %rdx
	jb  	.LPRF_msg$9
	movq	%rdi, 264(%rsp)
	movq	%rax, 256(%rsp)
	movq	%rsi, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$10:
	leaq	200(%rsp), %rsp
	movq	264(%rsp), %rdi
	movq	256(%rsp), %rax
	movq	272(%rsp), %rsi
	movq	$0, %rdx
.LPRF_msg$9:
	movb	(%rdi,%rax), %r8b
	incq	%rax
	xorb	%r8b, 32(%rsp,%rdx)
	incq	%rdx
.LPRF_msg$7:
	cmpq	%rsi, %rax
	jb  	.LPRF_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rdx
	jb  	.LPRF_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %rdx
.LPRF_msg$5:
	xorb	$31, 32(%rsp,%rdx)
	leaq	32(%rsp), %rax
	cmpq	$136, %rdx
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
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rax)
	vmovdqu	%ymm0, 32(%rax)
	vmovdqu	%ymm0, 64(%rax)
	vmovdqu	%ymm0, 96(%rax)
	vmovdqu	%ymm0, 128(%rax)
	vmovdqu	%ymm0, 160(%rax)
	movq	$0, 192(%rax)
	vmovdqu	(%r8), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vmovdqu	(%r9), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	vmovdqu	(%r10), %ymm0
	vmovdqu	%ymm0, 96(%rsp)
	movb	$0, 128(%rsp)
	movb	%bl, 129(%rsp)
	movq	$98, %rdx
	movq	$0, %rax
	movq	240(%rsp), %rdi
	movq	248(%rsp), %rcx
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %rdx
	jb  	.LH_msg$13
	movq	%rdi, 248(%rsp)
	movq	%rax, 240(%rsp)
	movq	%rcx, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$14:
	leaq	200(%rsp), %rsp
	movq	248(%rsp), %rdi
	movq	240(%rsp), %rax
	movq	272(%rsp), %rcx
	movq	$0, %rdx
.LH_msg$13:
	movb	(%rdi,%rax), %r8b
	incq	%rax
	xorb	%r8b, 32(%rsp,%rdx)
	incq	%rdx
.LH_msg$11:
	cmpq	%rcx, %rax
	jb  	.LH_msg$12
	movq	$0, %rax
	movq	256(%rsp), %rdi
	movq	264(%rsp), %rsi
	jmp 	.LH_msg$7
.LH_msg$8:
	cmpq	$136, %rdx
	jb  	.LH_msg$9
	movq	%rdi, 264(%rsp)
	movq	%rax, 256(%rsp)
	movq	%rsi, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$10:
	leaq	200(%rsp), %rsp
	movq	264(%rsp), %rdi
	movq	256(%rsp), %rax
	movq	272(%rsp), %rsi
	movq	$0, %rdx
.LH_msg$9:
	movb	(%rdi,%rax), %r8b
	incq	%rax
	xorb	%r8b, 32(%rsp,%rdx)
	incq	%rdx
.LH_msg$7:
	cmpq	%rsi, %rax
	jb  	.LH_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rdx
	jb  	.LH_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %rdx
.LH_msg$5:
	xorb	$31, 32(%rsp,%rdx)
	leaq	32(%rsp), %rax
	cmpq	$136, %rdx
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
	movq	232(%rsp), %rcx
	movb	32(%rsp), %r8b
	movb	%r8b, (%rcx)
	movb	33(%rsp), %r8b
	movb	%r8b, 1(%rcx)
	movb	34(%rsp), %r8b
	movb	%r8b, 2(%rcx)
	movb	35(%rsp), %r8b
	movb	%r8b, 3(%rcx)
	movb	36(%rsp), %r8b
	movb	%r8b, 4(%rcx)
	movb	37(%rsp), %r8b
	movb	%r8b, 5(%rcx)
	movb	38(%rsp), %r8b
	movb	%r8b, 6(%rcx)
	movb	39(%rsp), %r8b
	movb	%r8b, 7(%rcx)
	movb	40(%rsp), %r8b
	movb	%r8b, 8(%rcx)
	movb	41(%rsp), %r8b
	movb	%r8b, 9(%rcx)
	movb	42(%rsp), %r8b
	movb	%r8b, 10(%rcx)
	movb	43(%rsp), %r8b
	movb	%r8b, 11(%rcx)
	movb	44(%rsp), %r8b
	movb	%r8b, 12(%rcx)
	movb	45(%rsp), %r8b
	movb	%r8b, 13(%rcx)
	movb	46(%rsp), %r8b
	movb	%r8b, 14(%rcx)
	movb	47(%rsp), %r8b
	movb	%r8b, 15(%rcx)
	movb	48(%rsp), %r8b
	movb	%r8b, 16(%rcx)
	movb	49(%rsp), %r8b
	movb	%r8b, 17(%rcx)
	movb	50(%rsp), %r8b
	movb	%r8b, 18(%rcx)
	movb	51(%rsp), %r8b
	movb	%r8b, 19(%rcx)
	movb	52(%rsp), %r8b
	movb	%r8b, 20(%rcx)
	movb	53(%rsp), %r8b
	movb	%r8b, 21(%rcx)
	movb	54(%rsp), %r8b
	movb	%r8b, 22(%rcx)
	movb	55(%rsp), %r8b
	movb	%r8b, 23(%rcx)
	movb	56(%rsp), %r8b
	movb	%r8b, 24(%rcx)
	movb	57(%rsp), %r8b
	movb	%r8b, 25(%rcx)
	movb	58(%rsp), %r8b
	movb	%r8b, 26(%rcx)
	movb	59(%rsp), %r8b
	movb	%r8b, 27(%rcx)
	movb	60(%rsp), %r8b
	movb	%r8b, 28(%rcx)
	movb	61(%rsp), %r8b
	movb	%r8b, 29(%rcx)
	movb	62(%rsp), %r8b
	movb	%r8b, 30(%rcx)
	movb	63(%rsp), %r8b
	movb	%r8b, 31(%rcx)
	movb	64(%rsp), %r8b
	movb	%r8b, 32(%rcx)
	movb	65(%rsp), %r8b
	movb	%r8b, 33(%rcx)
	movb	66(%rsp), %r8b
	movb	%r8b, 34(%rcx)
	movb	67(%rsp), %r8b
	movb	%r8b, 35(%rcx)
	movb	68(%rsp), %r8b
	movb	%r8b, 36(%rcx)
	movb	69(%rsp), %r8b
	movb	%r8b, 37(%rcx)
	movb	70(%rsp), %r8b
	movb	%r8b, 38(%rcx)
	movb	71(%rsp), %r8b
	movb	%r8b, 39(%rcx)
	movb	72(%rsp), %r8b
	movb	%r8b, 40(%rcx)
	movb	73(%rsp), %r8b
	movb	%r8b, 41(%rcx)
	movb	74(%rsp), %r8b
	movb	%r8b, 42(%rcx)
	movb	75(%rsp), %r8b
	movb	%r8b, 43(%rcx)
	movb	76(%rsp), %r8b
	movb	%r8b, 44(%rcx)
	movb	77(%rsp), %r8b
	movb	%r8b, 45(%rcx)
	movb	78(%rsp), %r8b
	movb	%r8b, 46(%rcx)
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
	vpxor	%ymm2, %ymm4, %ymm7
	vpxor	%ymm5, %ymm3, %ymm10
	vpxor	%ymm0, %ymm7, %ymm7
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
	vpxor	%ymm1, %ymm8, %ymm8
	vpxor	%ymm9, %ymm8, %ymm8
	vpsrlq	$63, %ymm8, %ymm9
	vpaddq	%ymm8, %ymm8, %ymm12
	vpor	%ymm9, %ymm12, %ymm12
	vpxor	%ymm11, %ymm6, %ymm6
	vpxor	%ymm11, %ymm1, %ymm1
	vpblendd	$192, %ymm12, %ymm10, %ymm10
	vpblendd	$3, %ymm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm10, %ymm10
	vpsllvq	glob_data + 192(%rip), %ymm6, %ymm7
	vpsrlvq	glob_data + 0(%rip), %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vpxor	%ymm10, %ymm2, %ymm2
	vpsllvq	glob_data + 256(%rip), %ymm2, %ymm7
	vpsrlvq	glob_data + 64(%rip), %ymm2, %ymm2
	vpor	%ymm7, %ymm2, %ymm2
	vpxor	%ymm10, %ymm3, %ymm3
	vpsllvq	glob_data + 288(%rip), %ymm3, %ymm7
	vpsrlvq	glob_data + 96(%rip), %ymm3, %ymm3
	vpor	%ymm7, %ymm3, %ymm9
	vpxor	%ymm10, %ymm4, %ymm4
	vpsllvq	glob_data + 320(%rip), %ymm4, %ymm3
	vpsrlvq	glob_data + 128(%rip), %ymm4, %ymm4
	vpor	%ymm3, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vpermq	$141, %ymm6, %ymm3
	vpermq	$141, %ymm2, %ymm7
	vpsllvq	glob_data + 352(%rip), %ymm5, %ymm2
	vpsrlvq	glob_data + 160(%rip), %ymm5, %ymm8
	vpor	%ymm2, %ymm8, %ymm8
	vpxor	%ymm10, %ymm0, %ymm11
	vpermq	$27, %ymm9, %ymm0
	vpermq	$114, %ymm4, %ymm9
	vpsllvq	glob_data + 224(%rip), %ymm11, %ymm2
	vpsrlvq	glob_data + 32(%rip), %ymm11, %ymm10
	vpor	%ymm2, %ymm10, %ymm10
	vpsrldq	$8, %ymm8, %ymm2
	vpandn	%ymm2, %ymm8, %ymm2
	vpblendd	$12, %ymm9, %ymm10, %ymm4
	vpblendd	$12, %ymm10, %ymm7, %ymm5
	vpblendd	$12, %ymm7, %ymm3, %ymm6
	vpblendd	$12, %ymm3, %ymm10, %ymm11
	vpblendd	$48, %ymm7, %ymm4, %ymm4
	vpblendd	$48, %ymm0, %ymm5, %ymm5
	vpblendd	$48, %ymm10, %ymm6, %ymm6
	vpblendd	$48, %ymm9, %ymm11, %ymm11
	vpblendd	$192, %ymm0, %ymm4, %ymm4
	vpblendd	$192, %ymm9, %ymm5, %ymm5
	vpblendd	$192, %ymm9, %ymm6, %ymm6
	vpblendd	$192, %ymm7, %ymm11, %ymm11
	vpandn	%ymm5, %ymm4, %ymm4
	vpandn	%ymm11, %ymm6, %ymm5
	vpblendd	$12, %ymm10, %ymm0, %ymm12
	vpblendd	$12, %ymm0, %ymm3, %ymm6
	vpxor	%ymm3, %ymm4, %ymm4
	vpblendd	$48, %ymm3, %ymm12, %ymm12
	vpblendd	$48, %ymm7, %ymm6, %ymm6
	vpxor	%ymm0, %ymm5, %ymm5
	vpblendd	$192, %ymm7, %ymm12, %ymm12
	vpblendd	$192, %ymm10, %ymm6, %ymm6
	vpandn	%ymm6, %ymm12, %ymm12
	vpxor	%ymm9, %ymm12, %ymm12
	vpermq	$30, %ymm8, %ymm6
	vpblendd	$48, %ymm1, %ymm6, %ymm6
	vpermq	$57, %ymm8, %ymm11
	vpblendd	$192, %ymm1, %ymm11, %ymm11
	vpandn	%ymm6, %ymm11, %ymm11
	vpblendd	$12, %ymm0, %ymm7, %ymm6
	vpblendd	$12, %ymm7, %ymm9, %ymm13
	vpblendd	$48, %ymm9, %ymm6, %ymm6
	vpblendd	$48, %ymm3, %ymm13, %ymm13
	vpblendd	$192, %ymm3, %ymm6, %ymm6
	vpblendd	$192, %ymm0, %ymm13, %ymm13
	vpandn	%ymm13, %ymm6, %ymm6
	vpxor	%ymm10, %ymm6, %ymm6
	vpermq	$0, %ymm2, %ymm13
	vpermq	$27, %ymm4, %ymm2
	vpermq	$141, %ymm5, %ymm4
	vpermq	$114, %ymm12, %ymm5
	vpblendd	$12, %ymm3, %ymm9, %ymm12
	vpblendd	$12, %ymm9, %ymm0, %ymm9
	vpblendd	$48, %ymm0, %ymm12, %ymm12
	vpblendd	$48, %ymm10, %ymm9, %ymm9
	vpblendd	$192, %ymm10, %ymm12, %ymm12
	vpblendd	$192, %ymm3, %ymm9, %ymm9
	vpandn	%ymm9, %ymm12, %ymm3
	vpxor	%ymm13, %ymm1, %ymm1
	vpxor	%ymm8, %ymm11, %ymm0
	vpxor	%ymm7, %ymm3, %ymm3
	vpbroadcastq	(%rsi,%r8,8), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
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
	movq	%r10, %mm0
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
	movq	%mm0, %r13
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
	movq	%mm0, %rsi
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
	movq	%mm0, %rcx
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
