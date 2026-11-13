	.att_syntax
	.text
	.p2align	5
	.global	slh_dsa_shake128s_verify
	.global	slh_dsa_shake128s_sign
	.global	slh_dsa_shake128s_keygen
	.type	slh_dsa_shake128s_verify, %function
slh_dsa_shake128s_verify:
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
	jbe 	.Lslh_dsa_shake128s_verify$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake128s_verify$2
.Lslh_dsa_shake128s_verify$1:
	movq	%rsi, %rcx
	movq	%r9, %rsi
	leaq	-152(%rsp), %rsp
	call	.Lslh_verify_internal_$1
.Lslh_dsa_shake128s_verify$3:
	leaq	152(%rsp), %rsp
.Lslh_dsa_shake128s_verify$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake128s_sign, %function
slh_dsa_shake128s_sign:
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
	jbe 	.Lslh_dsa_shake128s_sign$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake128s_sign$2
.Lslh_dsa_shake128s_sign$1:
	movq	%rdx, %rcx
	movq	%r10, %rdx
	leaq	-184(%rsp), %rsp
	call	.Lslh_sign_internal_$1
.Lslh_dsa_shake128s_sign$3:
	leaq	184(%rsp), %rsp
.Lslh_dsa_shake128s_sign$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake128s_keygen, %function
slh_dsa_shake128s_keygen:
	movq	%rsp, %rax
	leaq	-16(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rbx, (%rsp)
	movq	%rax, 8(%rsp)
	movq	%rdx, %rax
	lfence
	movq	$0, %rcx
	leaq	-88(%rsp), %rsp
	call	.Lslh_keygen_internal_$1
.Lslh_dsa_shake128s_keygen$1:
	leaq	88(%rsp), %rsp
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
// declassify_mem 30 [RSP + 120]
	movq	48(%rsp), %rdi
	movq	56(%rsp), %rax
	movq	64(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	120(%rsp), %rdx
	leaq	141(%rsp), %rsi
	leaq	148(%rsp), %r8
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
	movzbl	(%rsi), %r9d
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
	movzbl	1(%rsi), %r9d
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
	movzbl	2(%rsi), %r9d
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
	movzbl	3(%rsi), %r9d
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
	movzbl	4(%rsi), %r9d
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
	movzbl	5(%rsi), %r9d
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
	movzbl	6(%rsi), %r9d
	orl 	%r9d, 116(%rsp)
	movl	$0, 108(%rsp)
	andl	$4194303, 112(%rsp)
	movl	$0, %esi
	shll	$8, %esi
	movzbl	(%r8), %r9d
	orl 	%r9d, %esi
	shll	$8, %esi
	movzbl	1(%r8), %r9d
	orl 	%r9d, %esi
	andl	$511, %esi
	leaq	72(%rsp), %r9
	movl	108(%rsp), %r8d
	movl	%r8d, 4(%r9)
	movl	112(%rsp), %r8d
	movl	%r8d, 8(%r9)
	movl	116(%rsp), %r8d
	movl	%r8d, 12(%r9)
	leaq	72(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$3, 16(%r9)
	leaq	72(%rsp), %r9
	movl	%esi, 20(%r9)
	leaq	16(%rcx), %r8
	movq	%rdi, 64(%rsp)
	movq	%rax, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movl	%esi, 104(%rsp)
	leaq	32(%rsp), %rax
	leaq	72(%rsp), %r9
	movq	%rax, %rcx
	movq	%r8, %rax
	leaq	-792(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	792(%rsp), %rsp
	movq	64(%rsp), %rdi
	movq	56(%rsp), %r10
	movq	48(%rsp), %rcx
	movl	104(%rsp), %edx
	lfence
	movq	$0, %rax
	leaq	32(%rsp), %rax
	leaq	2928(%rcx), %rcx
	leaq	108(%rsp), %rsi
	leaq	-120(%rsp), %rsp
	call	.Lht_verify$1
.Lslh_verify_internal_$2:
	leaq	120(%rsp), %rsp
	ret
.Lslh_sign_internal_$1:
	leaq	64(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movq	%rax, 96(%rsp)
	movq	%rcx, 104(%rsp)
	movq	%rdx, 112(%rsp)
	movq	%r8, 120(%rsp)
	leaq	16(%rsi), %r10
	movq	%rdi, %r11
	movq	%rdi, 128(%rsp)
	movq	%rsi, 136(%rsp)
	leaq	-280(%rsp), %rsp
	call	.LPRF_msg$1
.Lslh_sign_internal_$6:
	leaq	280(%rsp), %rsp
	movq	%rcx, %r8
	movq	128(%rsp), %rdi
	movq	136(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	96(%rsp), %r11
	movq	104(%rsp), %rcx
	movq	112(%rsp), %rdx
	movq	120(%rsp), %rsi
	lfence
	movq	$0, %r9
	leaq	32(%rax), %r9
	leaq	48(%rax), %r10
// declassify_mem 16 [R9]
	movq	%r9, 120(%rsp)
	movq	%rdi, 112(%rsp)
	movq	%rax, 104(%rsp)
	leaq	160(%rsp), %rdi
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_sign_internal_$5:
	leaq	280(%rsp), %rsp
// declassify_mem 30 [RSP + 160]
	movq	120(%rsp), %rdi
	movq	112(%rsp), %rcx
	movq	104(%rsp), %rsi
	lfence
	movq	$0, %rax
	leaq	160(%rsp), %rdx
	leaq	181(%rsp), %rax
	leaq	188(%rsp), %r8
	movl	$0, 148(%rsp)
	movl	$0, 152(%rsp)
	movl	$0, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	(%rax), %r9d
	orl 	%r9d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	1(%rax), %r9d
	orl 	%r9d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	2(%rax), %r9d
	orl 	%r9d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	3(%rax), %r9d
	orl 	%r9d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	4(%rax), %r9d
	orl 	%r9d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	5(%rax), %r9d
	orl 	%r9d, 156(%rsp)
	shll	$8, 148(%rsp)
	movl	152(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 152(%rsp)
	movl	156(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 152(%rsp)
	shll	$8, 156(%rsp)
	movzbl	6(%rax), %r9d
	orl 	%r9d, 156(%rsp)
	movl	$0, 148(%rsp)
	andl	$4194303, 152(%rsp)
	movl	$0, %eax
	shll	$8, %eax
	movzbl	(%r8), %r9d
	orl 	%r9d, %eax
	shll	$8, %eax
	movzbl	1(%r8), %r9d
	orl 	%r9d, %eax
	andl	$511, %eax
	leaq	64(%rsp), %r9
	movl	148(%rsp), %r8d
	movl	%r8d, 4(%r9)
	movl	152(%rsp), %r8d
	movl	%r8d, 8(%r9)
	movl	156(%rsp), %r8d
	movl	%r8d, 12(%r9)
	leaq	64(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$3, 16(%r9)
	leaq	64(%rsp), %r9
	movl	%eax, 20(%r9)
	leaq	16(%rcx), %r8
	movq	%rsi, 104(%rsp)
	movq	%rdi, 112(%rsp)
	movq	%rcx, 120(%rsp)
	movq	%rdx, 96(%rsp)
	movl	%eax, 144(%rsp)
	leaq	64(%rsp), %r9
	movq	%r8, %rax
	movq	%rsi, %rbx
	leaq	-120(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	120(%rsp), %rsp
// declassify_mem 2912 [RAX]
	movq	104(%rsp), %rdx
	movq	112(%rsp), %rdi
	movq	120(%rsp), %rcx
	movq	96(%rsp), %rsi
	movl	144(%rsp), %r8d
	lfence
	movq	$0, %r9
	movq	%rdx, 96(%rsp)
	movq	%rdi, 120(%rsp)
	movq	%rcx, 112(%rsp)
	movl	%r8d, 144(%rsp)
	leaq	32(%rsp), %rcx
	leaq	64(%rsp), %r9
	movq	%rsi, %rdx
	leaq	-792(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	792(%rsp), %rsp
	movq	96(%rsp), %rdx
	movq	120(%rsp), %rdi
	movq	112(%rsp), %rcx
	movl	144(%rsp), %esi
	lfence
	movq	$0, %rax
	leaq	2928(%rcx), %rax
	movq	%rcx, 112(%rsp)
	leaq	32(%rsp), %r8
	leaq	148(%rsp), %r9
	movq	%rax, %rcx
	movq	%r8, %rax
	leaq	-152(%rsp), %rsp
	call	.Lht_sign$1
.Lslh_sign_internal_$2:
	leaq	152(%rsp), %rsp
	movq	112(%rsp), %rcx
	lfence
	movq	$0, %rax
// declassify_mem 7856 [RCX]
	movq	$0, %rax
	ret
.Lslh_keygen_internal_$1:
	movq	%rsi, %r11
	movq	%rax, %r8
	movq	(%r8), %rdx
	movq	%rdx, (%r11)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%r11)
	leaq	16(%rsi), %r11
	leaq	16(%rax), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%r11)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%r11)
	leaq	32(%rsi), %r11
	leaq	32(%rax), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%r11)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%r11)
	movq	%rdi, %r11
	leaq	32(%rax), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%r11)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%r11)
	movq	%rsi, %rdx
	leaq	32(%rsi), %r9
	leaq	32(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$6, %r8d
	leaq	32(%rsp), %r10
	movl	%r8d, (%r10)
	movl	$0, %ecx
	movl	$9, %r8d
	leaq	48(%rsi), %rax
	movq	%rsi, 64(%rsp)
	movq	%rdi, 72(%rsp)
	leaq	32(%rsp), %r10
	movl	%ecx, %esi
	movl	%r8d, %ecx
	movq	%r9, %rdi
	movq	%r10, %r9
	leaq	-16600(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	16600(%rsp), %rsp
	movq	%rcx, %rax
	movq	64(%rsp), %rsi
	movq	72(%rsp), %rdi
	lfence
	movq	$0, %rcx
	leaq	16(%rdi), %r11
	movq	(%rax), %rdx
	movq	%rdx, (%r11)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%r11)
// declassify_mem 32 [RDI]
	ret
.Lfors_pkfromsig$1:
	movq	%rcx, 352(%rsp)
	leaq	732(%rsp), %rsi
	movq	$0, %r8
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lfors_pkfromsig$35
.Lfors_pkfromsig$36:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$35:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$36
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, (%rsi)
	jmp 	.Lfors_pkfromsig$33
.Lfors_pkfromsig$34:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$33:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$34
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 4(%rsi)
	jmp 	.Lfors_pkfromsig$31
.Lfors_pkfromsig$32:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$31:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$32
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 8(%rsi)
	jmp 	.Lfors_pkfromsig$29
.Lfors_pkfromsig$30:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$29:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$30
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 12(%rsi)
	jmp 	.Lfors_pkfromsig$27
.Lfors_pkfromsig$28:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$27:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$28
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 16(%rsi)
	jmp 	.Lfors_pkfromsig$25
.Lfors_pkfromsig$26:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$25:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$26
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 20(%rsi)
	jmp 	.Lfors_pkfromsig$23
.Lfors_pkfromsig$24:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$23:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$24
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 24(%rsi)
	jmp 	.Lfors_pkfromsig$21
.Lfors_pkfromsig$22:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$21:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$22
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 28(%rsi)
	jmp 	.Lfors_pkfromsig$19
.Lfors_pkfromsig$20:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$19:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$20
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 32(%rsi)
	jmp 	.Lfors_pkfromsig$17
.Lfors_pkfromsig$18:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$17:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$18
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 36(%rsi)
	jmp 	.Lfors_pkfromsig$15
.Lfors_pkfromsig$16:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$15:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$16
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 40(%rsi)
	jmp 	.Lfors_pkfromsig$13
.Lfors_pkfromsig$14:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$13:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$14
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 44(%rsi)
	jmp 	.Lfors_pkfromsig$11
.Lfors_pkfromsig$12:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$11:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$12
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 48(%rsi)
	jmp 	.Lfors_pkfromsig$9
.Lfors_pkfromsig$10:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_pkfromsig$9:
	cmpl	$12, %ecx
	jb  	.Lfors_pkfromsig$10
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 52(%rsi)
	leaq	376(%rsp), %r11
	movq	(%rdi), %rdx
	movq	%rdx, (%r11)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%r11)
	leaq	32(%rsp), %rcx
	movq	(%r9), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rcx)
	movq	%rax, 360(%rsp)
	movq	$0, %rax
	jmp 	.Lfors_pkfromsig$3
.Lfors_pkfromsig$4:
	movq	360(%rsp), %rdx
	lfence
	movq	$0, %rcx
	movq	%rax, %rcx
	imulq	$4, %rcx, %rcx
	movq	$13, %rsi
	cmpq	%rsi, %rcx
	cmovnbe	%rsi, %rcx
	movl	%ecx, %r8d
	shll	$12, %r8d
	addl	732(%rsp,%rcx,4), %r8d
	movl	%r8d, 716(%rsp)
	imulq	$208, %rcx, %rcx
	movq	(%rdx,%rcx), %rsi
	movq	%rsi, 520(%rsp)
	movq	8(%rdx,%rcx), %rsi
	movq	%rsi, 528(%rsp)
	movl	$0, 64(%rsp)
	movl	%r8d, 68(%rsp)
	movq	%rax, %rcx
	imulq	$4, %rcx, %rcx
	incq	%rcx
	movq	$13, %rsi
	cmpq	%rsi, %rcx
	cmovnbe	%rsi, %rcx
	movl	%ecx, %r8d
	shll	$12, %r8d
	addl	732(%rsp,%rcx,4), %r8d
	movl	%r8d, 720(%rsp)
	imulq	$208, %rcx, %rcx
	movq	(%rdx,%rcx), %rsi
	movq	%rsi, 536(%rsp)
	movq	8(%rdx,%rcx), %rsi
	movq	%rsi, 544(%rsp)
	movl	$0, 72(%rsp)
	movl	%r8d, 76(%rsp)
	movq	%rax, %rcx
	imulq	$4, %rcx, %rcx
	addq	$2, %rcx
	movq	$13, %rsi
	cmpq	%rsi, %rcx
	cmovnbe	%rsi, %rcx
	movl	%ecx, %r8d
	shll	$12, %r8d
	addl	732(%rsp,%rcx,4), %r8d
	movl	%r8d, 724(%rsp)
	imulq	$208, %rcx, %rcx
	movq	(%rdx,%rcx), %rsi
	movq	%rsi, 552(%rsp)
	movq	8(%rdx,%rcx), %rsi
	movq	%rsi, 560(%rsp)
	movl	$0, 80(%rsp)
	movl	%r8d, 84(%rsp)
	movq	%rax, %rcx
	imulq	$4, %rcx, %rcx
	addq	$3, %rcx
	movq	$13, %rsi
	cmpq	%rsi, %rcx
	cmovnbe	%rsi, %rcx
	movl	%ecx, %r8d
	shll	$12, %r8d
	addl	732(%rsp,%rcx,4), %r8d
	movl	%r8d, 728(%rsp)
	imulq	$208, %rcx, %rcx
	movq	(%rdx,%rcx), %rsi
	movq	%rsi, 568(%rsp)
	movq	8(%rdx,%rcx), %rsi
	movq	%rsi, 576(%rsp)
	movl	$0, 88(%rsp)
	movl	%r8d, 92(%rsp)
	movq	%rax, 368(%rsp)
	leaq	456(%rsp), %rcx
	leaq	520(%rsp), %r8
	leaq	376(%rsp), %rdi
	leaq	32(%rsp), %r9
	leaq	64(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lfors_pkfromsig$8:
	leaq	824(%rsp), %rsp
	movq	368(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	456(%rsp), %rsi
	movq	%rsi, 392(%rsp)
	movq	464(%rsp), %rsi
	movq	%rsi, 400(%rsp)
	movq	472(%rsp), %rsi
	movq	%rsi, 408(%rsp)
	movq	480(%rsp), %rsi
	movq	%rsi, 416(%rsp)
	movq	488(%rsp), %rsi
	movq	%rsi, 424(%rsp)
	movq	496(%rsp), %rsi
	movq	%rsi, 432(%rsp)
	movq	504(%rsp), %rsi
	movq	%rsi, 440(%rsp)
	movq	512(%rsp), %rsi
	movq	%rsi, 448(%rsp)
	movl	$0, %edi
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movq	360(%rsp), %rdx
	lfence
	movq	$0, %rcx
	movl	%edi, %esi
	incl	%esi
	movq	%rax, %rcx
	imulq	$4, %rcx, %rcx
	movq	$13, %r8
	cmpq	%r8, %rcx
	cmovnbe	%r8, %rcx
	imulq	$208, %rcx, %r10
	addq	$16, %r10
	movl	%edi, %ecx
	imulq	$16, %rcx, %rcx
	addq	%rcx, %r10
	movl	716(%rsp), %r8d
	movb	%dil, %cl
	movl	%r8d, %r9d
	shrl	%cl, %r9d
	andl	$1, %r9d
	movq	392(%rsp), %r11
	movq	(%rdx,%r10), %rbx
	movq	%r11, 584(%rsp)
	movq	%rbx, 600(%rsp)
	movq	400(%rsp), %r11
	movq	8(%rdx,%r10), %r10
	movq	%r11, 592(%rsp)
	movq	%r10, 608(%rsp)
	movq	584(%rsp), %r11
	movq	600(%rsp), %r10
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	392(%rsp), %r10
	movq	%r11, 584(%rsp)
	movq	600(%rsp), %r11
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	%r11, 600(%rsp)
	movq	592(%rsp), %r11
	movq	608(%rsp), %r10
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	400(%rsp), %r10
	movq	%r11, 592(%rsp)
	movq	608(%rsp), %r11
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	%r11, 608(%rsp)
	movl	%esi, 64(%rsp)
	shrl	%cl, %r8d
	shrl	$1, %r8d
	movl	%r8d, 68(%rsp)
	movq	%rax, %rcx
	imulq	$4, %rcx, %rcx
	incq	%rcx
	movq	$13, %r8
	cmpq	%r8, %rcx
	cmovnbe	%r8, %rcx
	imulq	$208, %rcx, %r10
	addq	$16, %r10
	movl	%edi, %ecx
	imulq	$16, %rcx, %rcx
	addq	%rcx, %r10
	movl	720(%rsp), %r8d
	movb	%dil, %cl
	movl	%r8d, %r9d
	shrl	%cl, %r9d
	andl	$1, %r9d
	movq	408(%rsp), %r11
	movq	(%rdx,%r10), %rbx
	movq	%r11, 616(%rsp)
	movq	%rbx, 632(%rsp)
	movq	416(%rsp), %r11
	movq	8(%rdx,%r10), %r10
	movq	%r11, 624(%rsp)
	movq	%r10, 640(%rsp)
	movq	616(%rsp), %r11
	movq	632(%rsp), %r10
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	408(%rsp), %r10
	movq	%r11, 616(%rsp)
	movq	632(%rsp), %r11
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	%r11, 632(%rsp)
	movq	624(%rsp), %r11
	movq	640(%rsp), %r10
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	416(%rsp), %r10
	movq	%r11, 624(%rsp)
	movq	640(%rsp), %r11
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	%r11, 640(%rsp)
	movl	%esi, 72(%rsp)
	shrl	%cl, %r8d
	shrl	$1, %r8d
	movl	%r8d, 76(%rsp)
	movq	%rax, %rcx
	imulq	$4, %rcx, %rcx
	addq	$2, %rcx
	movq	$13, %r8
	cmpq	%r8, %rcx
	cmovnbe	%r8, %rcx
	imulq	$208, %rcx, %r10
	addq	$16, %r10
	movl	%edi, %ecx
	imulq	$16, %rcx, %rcx
	addq	%rcx, %r10
	movl	724(%rsp), %r8d
	movb	%dil, %cl
	movl	%r8d, %r9d
	shrl	%cl, %r9d
	andl	$1, %r9d
	movq	424(%rsp), %r11
	movq	(%rdx,%r10), %rbx
	movq	%r11, 648(%rsp)
	movq	%rbx, 664(%rsp)
	movq	432(%rsp), %r11
	movq	8(%rdx,%r10), %r10
	movq	%r11, 656(%rsp)
	movq	%r10, 672(%rsp)
	movq	648(%rsp), %r11
	movq	664(%rsp), %r10
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	424(%rsp), %r10
	movq	%r11, 648(%rsp)
	movq	664(%rsp), %r11
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	%r11, 664(%rsp)
	movq	656(%rsp), %r11
	movq	672(%rsp), %r10
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	432(%rsp), %r10
	movq	%r11, 656(%rsp)
	movq	672(%rsp), %r11
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	%r11, 672(%rsp)
	movl	%esi, 80(%rsp)
	shrl	%cl, %r8d
	shrl	$1, %r8d
	movl	%r8d, 84(%rsp)
	movq	%rax, %rcx
	imulq	$4, %rcx, %rcx
	addq	$3, %rcx
	movq	$13, %r8
	cmpq	%r8, %rcx
	cmovnbe	%r8, %rcx
	imulq	$208, %rcx, %r10
	addq	$16, %r10
	movl	%edi, %ecx
	imulq	$16, %rcx, %rcx
	addq	%rcx, %r10
	movl	728(%rsp), %r8d
	movb	%dil, %cl
	movl	%r8d, %r9d
	shrl	%cl, %r9d
	andl	$1, %r9d
	movq	440(%rsp), %r11
	movq	(%rdx,%r10), %rbx
	movq	%r11, 680(%rsp)
	movq	%rbx, 696(%rsp)
	movq	448(%rsp), %r11
	movq	8(%rdx,%r10), %r10
	movq	%r11, 688(%rsp)
	movq	%r10, 704(%rsp)
	movq	680(%rsp), %r11
	movq	696(%rsp), %r10
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	440(%rsp), %r10
	movq	%r11, 680(%rsp)
	movq	696(%rsp), %r11
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	%r11, 696(%rsp)
	movq	688(%rsp), %r11
	movq	704(%rsp), %r10
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	448(%rsp), %r10
	movq	%r11, 688(%rsp)
	movq	704(%rsp), %r11
	cmpl	$0, %r9d
	cmovne	%r10, %r11
	movq	%r11, 704(%rsp)
	movl	%esi, 88(%rsp)
	shrl	%cl, %r8d
	shrl	$1, %r8d
	movl	%r8d, 92(%rsp)
	movq	%rax, 368(%rsp)
	movl	%edi, 712(%rsp)
	leaq	392(%rsp), %rcx
	leaq	584(%rsp), %r8
	leaq	376(%rsp), %rdi
	leaq	32(%rsp), %r9
	leaq	64(%rsp), %rax
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_2n__thash_x4$1
.Lfors_pkfromsig$7:
	leaq	824(%rsp), %rsp
	movq	368(%rsp), %rax
	movl	712(%rsp), %edi
	lfence
	movq	$0, %rcx
	incl	%edi
.Lfors_pkfromsig$5:
	cmpl	$12, %edi
	jb  	.Lfors_pkfromsig$6
	movq	%rax, %rcx
	imulq	$64, %rcx, %rcx
	movq	392(%rsp), %rsi
	movq	%rsi, 96(%rsp,%rcx)
	movq	400(%rsp), %rsi
	movq	%rsi, 104(%rsp,%rcx)
	movq	408(%rsp), %rsi
	movq	%rsi, 112(%rsp,%rcx)
	movq	416(%rsp), %rsi
	movq	%rsi, 120(%rsp,%rcx)
	movq	424(%rsp), %rsi
	movq	%rsi, 128(%rsp,%rcx)
	movq	432(%rsp), %rsi
	movq	%rsi, 136(%rsp,%rcx)
	movq	440(%rsp), %rsi
	movq	%rsi, 144(%rsp,%rcx)
	movq	448(%rsp), %rsi
	movq	%rsi, 152(%rsp,%rcx)
	incq	%rax
.Lfors_pkfromsig$3:
	cmpq	$4, %rax
	jb  	.Lfors_pkfromsig$4
	leaq	64(%rsp), %rcx
	leaq	32(%rsp), %r9
	movq	(%r9), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rcx)
	leaq	64(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$4, 16(%r9)
	leaq	32(%rsp), %r9
	movl	20(%r9), %eax
	leaq	64(%rsp), %r9
	movl	%eax, 20(%r9)
	movq	352(%rsp), %rdi
	lfence
	movq	$0, %rax
	leaq	376(%rsp), %r9
	leaq	64(%rsp), %r10
	leaq	96(%rsp), %rax
	movq	%r9, %rcx
	movq	%r10, %r9
	leaq	-40(%rsp), %rsp
	call	.LT_k$1
.Lfors_pkfromsig$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lfors_sign$1:
	leaq	64(%rsp), %rsi
	movq	$0, %r8
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$35
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, (%rsi)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$33
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 4(%rsi)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$31
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 8(%rsi)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$29
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 12(%rsi)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$27
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 16(%rsi)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$25
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 20(%rsi)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$23
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 24(%rsi)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$21
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 28(%rsi)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$19
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 32(%rsi)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$17
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 36(%rsi)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$15
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 40(%rsi)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$13
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 44(%rsi)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$11
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 48(%rsi)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %r10d
	movzbl	(%rdx,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$12, %ecx
	jb  	.Lfors_sign$9
	movl	%r10d, %r11d
	addl	$-12, %ecx
	shrq	%cl, %r11
	andq	$4095, %r11
	movl	%r11d, 52(%rsi)
	movq	$0, %rdx
	movq	$0, %r10
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%r10d, %r8d
	shll	$12, %r8d
	addl	64(%rsp,%r10,4), %r8d
	lfence
	movq	$0, %rcx
	leaq	(%rax,%rdx), %rsi
	movq	%rbx, 8(%rsp)
	movq	%rdi, 16(%rsp)
	movq	%r9, 24(%rsp)
	movq	%rax, 32(%rsp)
	movq	%r10, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movl	%r8d, %r11d
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rdi
	movq	24(%rsp), %r9
	movq	32(%rsp), %rax
	movq	40(%rsp), %r10
	movq	48(%rsp), %rdx
	lfence
	movq	$0, %rcx
	addq	$16, %rdx
	movl	64(%rsp,%r10,4), %esi
	lfence
	movq	$0, %rcx
	xorl	$1, %esi
	movl	$0, %r8d
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%rbx, 48(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%r10, 32(%rsp)
	movl	%r8d, 56(%rsp)
	movq	%rdx, 24(%rsp)
	movl	%esi, 60(%rsp)
	movl	$12, %ecx
	subl	%r8d, %ecx
	shlq	%cl, %r10
	addl	%esi, %r10d
	leaq	(%rax,%rdx), %rcx
	movq	%rax, 16(%rsp)
	movl	%r10d, %esi
	movl	%r8d, %edx
	leaq	-131288(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	131288(%rsp), %rsp
	movq	16(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	48(%rsp), %rbx
	movq	40(%rsp), %rdi
	movq	32(%rsp), %r10
	movl	56(%rsp), %r8d
	movq	24(%rsp), %rdx
	movl	60(%rsp), %esi
	lfence
	movq	$0, %rcx
	shrl	$1, %esi
	xorl	$1, %esi
	addq	$16, %rdx
	incl	%r8d
.Lfors_sign$4:
	cmpl	$12, %r8d
	jb  	.Lfors_sign$5
	incq	%r10
.Lfors_sign$2:
	cmpq	$14, %r10
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rcx, 131152(%rsp)
	movq	$0, %rax
	movl	$0, %r8d
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%edx, 131256(%rsp)
	movl	%edx, %ecx
	subl	%r8d, %ecx
	movq	$1, %r10
	shlq	%cl, %r10
	movl	%r10d, %r11d
	imull	%esi, %r11d
	addl	%r11d, %r10d
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%rbx, 131160(%rsp)
	movl	%r10d, 131260(%rsp)
	cmpl	$0, %r8d
	je  	.Lfors_node$6
	movl	%r11d, %eax
	imull	$2, %eax, %eax
	movl	%r8d, %edx
	decl	%edx
	movl	$13, %ecx
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
	movl	%r8d, 24(%r9)
	movl	%r11d, 28(%r9)
	movl	$13, %ecx
	movq	$1, %rax
	shlq	%cl, %rax
	movq	%rax, %rbp
	subl	%r8d, %ecx
	movq	$1, %r12
	shlq	%cl, %r12
	subq	%r12, %rbp
	shrq	$1, %r12
	movl	%r11d, %eax
	xorl	%edx, %edx
	divq	%r12
	addq	%rdx, %rbp
	imulq	$16, %rbp, %rax
	subl	%r11d, %r10d
	cmpl	$4, %r10d
	jnb 	.Lfors_node$13
	movq	%rbx, %rcx
	addq	$16, %rcx
	leaq	131136(%rsp), %rdx
	leaq	64(%rsp,%rbx), %r10
	movq	(%r10), %rbx
	movq	%rbx, (%rdx)
	movq	8(%r10), %r10
	movq	%r10, 8(%rdx)
	leaq	131120(%rsp), %rdx
	leaq	64(%rsp,%rcx), %r10
	movq	(%r10), %rcx
	movq	%rcx, (%rdx)
	movq	8(%r10), %rcx
	movq	%rcx, 8(%rdx)
	movq	%rdi, 131168(%rsp)
	movq	%r9, 131176(%rsp)
	movl	%esi, 131264(%rsp)
	movl	%r8d, 131268(%rsp)
	movl	%r11d, 131272(%rsp)
	movq	%rax, 131184(%rsp)
	leaq	64(%rsp,%rax), %rcx
	leaq	131136(%rsp), %rax
	leaq	131120(%rsp), %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rcx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_node$16:
	leaq	40(%rsp), %rsp
	movq	131168(%rsp), %rdi
	movq	131176(%rsp), %r9
	movl	131264(%rsp), %esi
	movl	131268(%rsp), %r8d
	movl	131272(%rsp), %r11d
	movq	131184(%rsp), %rax
	lfence
	movq	$0, %rcx
	jmp 	.Lfors_node$7
.Lfors_node$13:
	movl	%r8d, 32(%rsp)
	movl	%r11d, %ecx
	movl	%ecx, 36(%rsp)
	movl	%r8d, 40(%rsp)
	movl	%r11d, %ecx
	incl	%ecx
	movl	%ecx, 44(%rsp)
	movl	%r8d, 48(%rsp)
	movl	%r11d, %ecx
	addl	$2, %ecx
	movl	%ecx, 52(%rsp)
	movl	%r8d, 56(%rsp)
	movl	%r11d, %ecx
	addl	$3, %ecx
	movl	%ecx, 60(%rsp)
	movq	%rdi, 131184(%rsp)
	movq	%r9, 131176(%rsp)
	movl	%esi, 131272(%rsp)
	movl	%r8d, 131268(%rsp)
	movl	%r11d, 131264(%rsp)
	movq	%rax, 131168(%rsp)
	leaq	64(%rsp,%rbx), %r8
	leaq	131192(%rsp), %rcx
	leaq	32(%rsp), %rax
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_2n__thash_x4$1
.Lfors_node$15:
	leaq	824(%rsp), %rsp
	movq	131184(%rsp), %rdi
	movq	131176(%rsp), %r9
	movl	131272(%rsp), %esi
	movl	131268(%rsp), %r8d
	movl	131264(%rsp), %r11d
	movq	131168(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	64(%rsp,%rax), %rcx
	leaq	131192(%rsp), %r10
	movq	(%r10), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%rcx)
	leaq	80(%rsp,%rax), %rcx
	leaq	131208(%rsp), %r10
	movq	(%r10), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%rcx)
	leaq	96(%rsp,%rax), %rcx
	leaq	131224(%rsp), %r10
	movq	(%r10), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%rcx)
	leaq	112(%rsp,%rax), %rcx
	leaq	131240(%rsp), %r10
	movq	(%r10), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%rcx)
	addl	$3, %r11d
.Lfors_node$14:
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%r8d, 24(%r9)
	movl	%r11d, 28(%r9)
	movl	$13, %ecx
	movq	$1, %rax
	shlq	%cl, %rax
	movq	%rax, %rbp
	subl	%r8d, %ecx
	movq	$1, %r12
	shlq	%cl, %r12
	subq	%r12, %rbp
	shrq	$1, %r12
	movl	%r11d, %eax
	xorl	%edx, %edx
	divq	%r12
	addq	%rdx, %rbp
	imulq	$16, %rbp, %rax
	subl	%r11d, %r10d
	cmpl	$4, %r10d
	jnb 	.Lfors_node$8
	movq	%rdi, 131184(%rsp)
	movq	%r9, 131176(%rsp)
	movl	%esi, 131272(%rsp)
	movl	%r8d, 131268(%rsp)
	movl	%r11d, 131264(%rsp)
	movq	%rax, 131168(%rsp)
	leaq	64(%rsp,%rax), %rsi
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$12:
	leaq	40(%rsp), %rsp
	movq	131184(%rsp), %rcx
	movq	131176(%rsp), %r9
	movl	131272(%rsp), %esi
	movl	131268(%rsp), %r8d
	movl	131264(%rsp), %r11d
	movq	131168(%rsp), %rax
	lfence
	movq	$0, %rdx
	movq	%rcx, 131168(%rsp)
	movq	%r9, 131176(%rsp)
	movl	%esi, 131264(%rsp)
	movl	%r8d, 131268(%rsp)
	movl	%r11d, 131272(%rsp)
	movq	%rax, 131184(%rsp)
	leaq	64(%rsp,%rax), %rdi
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_node$11:
	leaq	40(%rsp), %rsp
	movq	131168(%rsp), %rdi
	movq	131176(%rsp), %r9
	movl	131264(%rsp), %esi
	movl	131268(%rsp), %r8d
	movl	131272(%rsp), %r11d
	movq	131184(%rsp), %rax
	lfence
	movq	$0, %rcx
	jmp 	.Lfors_node$7
.Lfors_node$8:
	movq	%rdi, 131168(%rsp)
	movq	%r9, 131176(%rsp)
	movl	%esi, 131264(%rsp)
	movl	%r8d, 131268(%rsp)
	movl	%r11d, 131272(%rsp)
	movq	%rax, 131184(%rsp)
	leaq	64(%rsp,%rax), %rax
	leaq	-248(%rsp), %rsp
	call	.Lfors_leaves_x4$1
.Lfors_node$10:
	leaq	248(%rsp), %rsp
	movq	131168(%rsp), %rdi
	movq	131176(%rsp), %r9
	movl	131264(%rsp), %esi
	movl	131268(%rsp), %r8d
	movl	131272(%rsp), %r11d
	movq	131184(%rsp), %rax
	lfence
	movq	$0, %rcx
	addl	$3, %r11d
.Lfors_node$9:
.Lfors_node$7:
	movq	131160(%rsp), %rbx
	movl	131260(%rsp), %r10d
	lfence
	movq	$0, %rcx
	incl	%r11d
.Lfors_node$4:
	cmpl	%r10d, %r11d
	jb  	.Lfors_node$5
	movl	131256(%rsp), %edx
	lfence
	movq	$0, %rcx
	incl	%r8d
.Lfors_node$2:
	cmpl	%edx, %r8d
	jbe 	.Lfors_node$3
	movq	131152(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	64(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	ret
.Lfors_leaves_x4$1:
	movq	%rax, %mm0
	leaq	112(%rsp), %rcx
	movq	(%rbx), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	128(%rsp), %rcx
	movq	(%rbx), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	144(%rsp), %rcx
	movq	(%rbx), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	160(%rsp), %rcx
	movq	(%rbx), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rcx)
	movl	$0, %esi
	movl	%esi, 32(%rsp)
	movl	%r11d, 36(%rsp)
	incl	%r11d
	movl	%esi, 40(%rsp)
	movl	%r11d, 44(%rsp)
	incl	%r11d
	movl	%esi, 48(%rsp)
	movl	%r11d, 52(%rsp)
	incl	%r11d
	movl	%esi, 56(%rsp)
	movl	%r11d, 60(%rsp)
	leaq	64(%rsp), %rcx
	movq	(%r9), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rcx)
	leaq	64(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$6, 16(%r10)
	movl	20(%r9), %eax
	leaq	64(%rsp), %r10
	movl	%eax, 20(%r10)
	movq	%rdi, 96(%rsp)
	movq	%r9, 104(%rsp)
	leaq	176(%rsp), %rcx
	leaq	112(%rsp), %r8
	leaq	64(%rsp), %r9
	leaq	32(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lfors_leaves_x4$3:
	leaq	824(%rsp), %rsp
	movq	96(%rsp), %rdi
	movq	104(%rsp), %r9
	movq	%mm0, %rcx
	lfence
	movq	$0, %rax
	leaq	176(%rsp), %r8
	leaq	32(%rsp), %rdx
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
	movl	20(%r9), %eax
	leaq	8(%rsp), %r9
	movl	%eax, 20(%r9)
	leaq	8(%rsp), %r9
	movl	%r11d, 28(%r9)
	leaq	8(%rsp), %r9
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%rsi), %r8d
	movl	%r8d, 108(%rsp)
	movl	4(%rsi), %r8d
	movl	%r8d, 112(%rsp)
	movl	8(%rsi), %r8d
	movl	%r8d, 116(%rsp)
	leaq	72(%rsp), %r9
	movq	$0, (%r9)
	movq	$0, 8(%r9)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	leaq	72(%rsp), %r9
	movl	108(%rsp), %r8d
	movl	%r8d, 4(%r9)
	movl	112(%rsp), %r8d
	movl	%r8d, 8(%r9)
	movl	116(%rsp), %r8d
	movl	%r8d, 12(%r9)
	movq	%rcx, %rsi
	movq	%rdi, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	40(%rsp), %rcx
	leaq	72(%rsp), %r9
	movl	%edx, %r11d
	movq	%rsi, %rdx
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	152(%rsp), %rsp
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	$704, %rdx
	movl	$1, %r8d
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%r8d, 104(%rsp)
	movq	%rdx, 24(%rsp)
	leaq	108(%rsp), %rsi
	movl	8(%rsi), %eax
	andl	$511, %eax
	shrl	$9, 8(%rsi)
	movl	4(%rsi), %r9d
	shll	$23, %r9d
	orl 	%r9d, 8(%rsi)
	shrl	$9, 4(%rsi)
	movl	(%rsi), %r9d
	shll	$23, %r9d
	orl 	%r9d, 4(%rsi)
	shrl	$9, (%rsi)
	leaq	72(%rsp), %r9
	movl	%r8d, (%r9)
	leaq	72(%rsp), %r9
	movl	108(%rsp), %r8d
	movl	%r8d, 4(%r9)
	movl	112(%rsp), %r8d
	movl	%r8d, 8(%r9)
	movl	116(%rsp), %r8d
	movl	%r8d, 12(%r9)
	leaq	56(%rsp), %rsi
	leaq	40(%rsp), %r8
	movq	(%r8), %r10
	movq	%r10, (%rsi)
	movq	8(%r8), %r8
	movq	%r8, 8(%rsi)
	leaq	(%rcx,%rdx), %rdx
	movq	%rdi, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	40(%rsp), %rcx
	leaq	56(%rsp), %rsi
	leaq	72(%rsp), %r9
	movl	%eax, %r11d
	movq	%rsi, %rax
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	152(%rsp), %rsp
	movq	16(%rsp), %rdi
	movq	32(%rsp), %rcx
	lfence
	movq	$0, %rax
	movl	104(%rsp), %r8d
	movq	24(%rsp), %rdx
	lfence
	movq	$0, %rax
	addq	$704, %rdx
	incl	%r8d
.Lht_verify$2:
	cmpl	$7, %r8d
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
	movl	%esi, %r11d
	movl	(%r9), %r8d
	movl	%r8d, 136(%rsp)
	movl	4(%r9), %r8d
	movl	%r8d, 140(%rsp)
	movl	8(%r9), %r8d
	movl	%r8d, 144(%rsp)
	leaq	32(%rsp), %r9
	movq	$0, (%r9)
	movq	$0, 8(%r9)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	leaq	32(%rsp), %r9
	movl	136(%rsp), %r8d
	movl	%r8d, 4(%r9)
	movl	140(%rsp), %r8d
	movl	%r8d, 8(%r9)
	movl	144(%rsp), %r8d
	movl	%r8d, 12(%r9)
	movq	%rcx, %rsi
	movq	%rcx, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%rax, 88(%rsp)
	movl	%r11d, 128(%rsp)
	leaq	32(%rsp), %r9
	movq	%rsi, %rcx
	movq	%rax, %rsi
	movl	%r11d, %eax
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdx
// declassify_mem 704 [RDX]
	movq	64(%rsp), %rax
	movq	72(%rsp), %rsi
	movq	80(%rsp), %rdi
	movq	88(%rsp), %r8
	movl	128(%rsp), %r11d
	lfence
	movq	$0, %rcx
	movq	%rsi, 88(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%rax, 72(%rsp)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %r9
	movq	%r8, %rax
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	152(%rsp), %rsp
	movq	88(%rsp), %rdx
	movq	80(%rsp), %rdi
	movq	72(%rsp), %rcx
	lfence
	movq	$0, %r9
	movq	$704, %rsi
	movl	$1, %r8d
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%rdx, 72(%rsp)
	leaq	136(%rsp), %r9
	movl	8(%r9), %eax
	andl	$511, %eax
	shrl	$9, 8(%r9)
	movl	4(%r9), %r10d
	shll	$23, %r10d
	orl 	%r10d, 8(%r9)
	shrl	$9, 4(%r9)
	movl	(%r9), %r10d
	shll	$23, %r10d
	orl 	%r10d, 4(%r9)
	shrl	$9, (%r9)
	leaq	32(%rsp), %r9
	movl	%r8d, (%r9)
	leaq	32(%rsp), %r9
	movl	136(%rsp), %r10d
	movl	%r10d, 4(%r9)
	movl	140(%rsp), %r10d
	movl	%r10d, 8(%r9)
	movl	144(%rsp), %r10d
	movl	%r10d, 12(%r9)
	leaq	112(%rsp), %r11
	leaq	96(%rsp), %r10
	movq	(%r10), %r9
	movq	%r9, (%r11)
	movq	8(%r10), %r9
	movq	%r9, 8(%r11)
	leaq	(%rcx,%rsi), %r9
	movq	%rcx, 80(%rsp)
	movq	%rdi, 88(%rsp)
	movl	%r8d, 128(%rsp)
	movq	%rsi, 64(%rsp)
	movl	%eax, 132(%rsp)
	leaq	112(%rsp), %rsi
	leaq	32(%rsp), %r10
	movq	%r9, %rcx
	movq	%r10, %r9
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdx
// declassify_mem 704 [RDX]
	movq	80(%rsp), %rcx
	movq	88(%rsp), %rdi
	movl	128(%rsp), %r8d
	movq	64(%rsp), %rsi
	movl	132(%rsp), %r11d
	lfence
	movq	$0, %rax
	cmpl	$6, %r8d
	jnb 	.Lht_sign$4
	movq	%rdi, 64(%rsp)
	movq	%rcx, 88(%rsp)
	movl	%r8d, 132(%rsp)
	movq	%rsi, 80(%rsp)
	leaq	96(%rsp), %rcx
	leaq	112(%rsp), %rax
	leaq	32(%rsp), %r9
	leaq	-152(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	152(%rsp), %rsp
	movq	64(%rsp), %rdi
	movq	88(%rsp), %rcx
	movl	132(%rsp), %r8d
	movq	80(%rsp), %rsi
	lfence
	movq	$0, %rax
.Lht_sign$4:
	movq	72(%rsp), %rdx
	lfence
	movq	$0, %rax
	addq	$704, %rsi
	incl	%r8d
.Lht_sign$2:
	cmpl	$7, %r8d
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 112(%rsp)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$0, 16(%r9)
	movl	%r11d, 20(%r9)
	movq	%rdx, %rcx
	movq	%rdi, 120(%rsp)
	movl	%r11d, 152(%rsp)
	movq	%rdx, 128(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	leaq	-952(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	952(%rsp), %rsp
	movq	120(%rsp), %rdi
	movl	152(%rsp), %eax
	movq	128(%rsp), %rdx
	lfence
	movq	$0, %rcx
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$2, 16(%r9)
	movl	%eax, 28(%r9)
	movq	$560, %rsi
	movl	%eax, %r8d
	movl	$0, %ecx
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%ecx, %eax
	incl	%eax
	movl	%eax, 24(%r9)
	movl	%r8d, %eax
	andl	$1, %eax
	movl	%ecx, 152(%rsp)
	movl	%r8d, 156(%rsp)
	cmpl	$0, %eax
	je  	.Lxmss_pkfromsig$5
	movl	28(%r9), %eax
	decl	%eax
	shrl	$1, %eax
	movl	%eax, 28(%r9)
	leaq	96(%rsp), %rcx
	leaq	(%rdx,%rsi), %rax
	movq	(%rax), %r8
	movq	%r8, (%rcx)
	movq	8(%rax), %r8
	movq	%r8, 8(%rcx)
	leaq	80(%rsp), %rcx
	leaq	32(%rsp), %rax
	movq	(%rax), %r8
	movq	%r8, (%rcx)
	movq	8(%rax), %r8
	movq	%r8, 8(%rcx)
	jmp 	.Lxmss_pkfromsig$6
.Lxmss_pkfromsig$5:
	movl	28(%r9), %eax
	shrl	$1, %eax
	movl	%eax, 28(%r9)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rax
	movq	(%rax), %r8
	movq	%r8, (%rcx)
	movq	8(%rax), %r8
	movq	%r8, 8(%rcx)
	leaq	80(%rsp), %rcx
	leaq	(%rdx,%rsi), %rax
	movq	(%rax), %r8
	movq	%r8, (%rcx)
	movq	8(%rax), %r8
	movq	%r8, 8(%rcx)
.Lxmss_pkfromsig$6:
	movq	%rdi, 128(%rsp)
	movq	%r9, 120(%rsp)
	movq	%rdx, 136(%rsp)
	movq	%rsi, 144(%rsp)
	leaq	64(%rsp), %rcx
	leaq	96(%rsp), %rax
	leaq	80(%rsp), %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rcx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	40(%rsp), %rsp
	movq	128(%rsp), %rdi
	movq	120(%rsp), %r9
	movq	136(%rsp), %rdx
	movq	144(%rsp), %rsi
	lfence
	movq	$0, %rax
	leaq	32(%rsp), %rcx
	leaq	64(%rsp), %rax
	movq	(%rax), %r8
	movq	%r8, (%rcx)
	movq	8(%rax), %r8
	movq	%r8, 8(%rcx)
	movl	152(%rsp), %ecx
	movl	156(%rsp), %r8d
	lfence
	movq	$0, %rax
	shrl	$1, %r8d
	addq	$16, %rsi
	incl	%ecx
.Lxmss_pkfromsig$2:
	cmpl	$9, %ecx
	jb  	.Lxmss_pkfromsig$3
	movq	112(%rsp), %rcx
	lfence
	movq	$0, %rax
	leaq	32(%rsp), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	ret
.Lxmss_sign$1:
	movq	%rsi, 8(%rsp)
	movq	$560, %r10
	movl	%eax, %esi
	xorl	$1, %esi
	movl	$0, %r8d
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%rdx, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movl	%eax, 48(%rsp)
	movl	%r8d, 52(%rsp)
	movl	%esi, 56(%rsp)
	movq	%r10, 32(%rsp)
	leaq	(%rcx,%r10), %rax
	movq	%rcx, 40(%rsp)
	movl	%r8d, %ecx
	leaq	-16600(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	16600(%rsp), %rsp
	movq	40(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rdi
	movl	48(%rsp), %eax
	movl	52(%rsp), %r8d
	movl	56(%rsp), %esi
	movq	32(%rsp), %r10
	lfence
	movq	$0, %r11
	shrl	$1, %esi
	xorl	$1, %esi
	addq	$16, %r10
	incl	%r8d
.Lxmss_sign$3:
	cmpl	$9, %r8d
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rsi
	lfence
	movq	$0, %r8
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
	movq	%rax, 16464(%rsp)
	movq	$0, %rax
	movl	$0, %r8d
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%ecx, 16568(%rsp)
	subl	%r8d, %ecx
	movq	$1, %r10
	shlq	%cl, %r10
	movl	%r10d, %r11d
	imull	%esi, %r11d
	addl	%r11d, %r10d
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%rdx, 16472(%rsp)
	movq	%rdi, 16480(%rsp)
	movl	%esi, 16572(%rsp)
	movl	%r8d, 16576(%rsp)
	movl	%r11d, 16580(%rsp)
	movl	%r10d, 16584(%rsp)
	cmpl	$0, %r8d
	je  	.Lxmss_node$6
	movl	%r11d, %eax
	imull	$2, %eax, %eax
	movl	%r8d, %edx
	decl	%edx
	movl	$10, %ecx
	movq	$1, %rsi
	shlq	%cl, %rsi
	subl	%edx, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %rsi
	movl	%eax, %eax
	addq	%rax, %rsi
	imulq	$16, %rsi, %rax
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$2, 16(%r9)
	movl	%r8d, 24(%r9)
	movl	%r11d, 28(%r9)
	movl	$10, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subl	%r8d, %ecx
	movq	$1, %rsi
	shlq	%cl, %rsi
	subq	%rsi, %rdx
	movl	%r11d, %ecx
	addq	%rcx, %rdx
	imulq	$16, %rdx, %rcx
	subl	%r11d, %r10d
	cmpl	$4, %r10d
	jnb 	.Lxmss_node$12
	movq	%rax, %rdx
	addq	$16, %rdx
	leaq	16448(%rsp), %rsi
	leaq	64(%rsp,%rax), %rax
	movq	(%rax), %r8
	movq	%r8, (%rsi)
	movq	8(%rax), %r8
	movq	%r8, 8(%rsi)
	leaq	16432(%rsp), %rsi
	leaq	64(%rsp,%rdx), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rsi)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rsi)
	movq	%r9, 16488(%rsp)
	movq	%rcx, 16496(%rsp)
	leaq	64(%rsp,%rcx), %rcx
	leaq	16448(%rsp), %rax
	leaq	16432(%rsp), %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rcx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_node$15:
	leaq	40(%rsp), %rsp
	movq	16488(%rsp), %r9
	movq	16496(%rsp), %rax
	lfence
	movq	$0, %rcx
	jmp 	.Lxmss_node$7
.Lxmss_node$12:
	movl	%r8d, 32(%rsp)
	movl	%r11d, %edx
	movl	%edx, 36(%rsp)
	movl	%r8d, 40(%rsp)
	movl	%r11d, %edx
	incl	%edx
	movl	%edx, 44(%rsp)
	movl	%r8d, 48(%rsp)
	movl	%r11d, %edx
	addl	$2, %edx
	movl	%edx, 52(%rsp)
	movl	%r8d, 56(%rsp)
	addl	$3, %r11d
	movl	%r11d, 60(%rsp)
	movq	%r9, 16496(%rsp)
	movq	%rcx, 16488(%rsp)
	leaq	64(%rsp,%rax), %r8
	leaq	16504(%rsp), %rcx
	leaq	32(%rsp), %rax
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_2n__thash_x4$1
.Lxmss_node$14:
	leaq	824(%rsp), %rsp
	movq	16496(%rsp), %r9
	movq	16488(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	64(%rsp,%rax), %rcx
	leaq	16504(%rsp), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	leaq	80(%rsp,%rax), %rcx
	leaq	16520(%rsp), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	leaq	96(%rsp,%rax), %rcx
	leaq	16536(%rsp), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	leaq	112(%rsp,%rax), %rcx
	leaq	16552(%rsp), %r8
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	movl	16580(%rsp), %r11d
	addl	$3, %r11d
	movl	%r11d, 16580(%rsp)
.Lxmss_node$13:
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$0, 16(%r9)
	movl	%r11d, 20(%r9)
	movl	%r11d, %eax
	imulq	$16, %rax, %rax
	subl	%r11d, %r10d
	cmpl	$4, %r10d
	jnb 	.Lxmss_node$8
	leaq	64(%rsp,%rax), %rcx
	leaq	-920(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$11:
	leaq	920(%rsp), %rsp
	jmp 	.Lxmss_node$7
.Lxmss_node$8:
	leaq	64(%rsp,%rax), %rcx
	movq	%rax, 16488(%rsp)
	movq	%r9, 16496(%rsp)
	leaq	-2648(%rsp), %rsp
	call	.Lwots_leaves_x4$1
.Lxmss_node$10:
	leaq	2648(%rsp), %rsp
	movq	16488(%rsp), %rax
	movq	16496(%rsp), %r9
	lfence
	movq	$0, %rcx
	movl	16580(%rsp), %r11d
	addl	$3, %r11d
	movl	%r11d, 16580(%rsp)
.Lxmss_node$9:
.Lxmss_node$7:
	movq	16472(%rsp), %rdx
	movq	16480(%rsp), %rdi
	movl	16572(%rsp), %esi
	movl	16576(%rsp), %r8d
	movl	16580(%rsp), %r11d
	movl	16584(%rsp), %r10d
	lfence
	movq	$0, %rcx
	incl	%r11d
.Lxmss_node$4:
	cmpl	%r10d, %r11d
	jb  	.Lxmss_node$5
	movl	16568(%rsp), %ecx
	lfence
	movq	$0, %r10
	incl	%r8d
.Lxmss_node$2:
	cmpl	%ecx, %r8d
	jbe 	.Lxmss_node$3
	movq	16464(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	64(%rsp,%rax), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	ret
.Lwots_pkfromsig$1:
	movq	%rsi, 592(%rsp)
	leaq	648(%rsp), %rsi
	movq	%rsi, %r8
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
	movl	%ebx, (%r8)
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
	movl	%ebx, 4(%r8)
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
	movl	%ebx, 8(%r8)
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
	movl	%ebx, 12(%r8)
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
	movl	%ebx, 16(%r8)
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
	movl	%ebx, 20(%r8)
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
	movl	%ebx, 24(%r8)
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
	movl	%ebx, 28(%r8)
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
	movl	%ebx, 32(%r8)
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
	movl	%ebx, 36(%r8)
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
	movl	%ebx, 40(%r8)
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
	movl	%ebx, 44(%r8)
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
	movl	%ebx, 48(%r8)
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
	movl	%ebx, 52(%r8)
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
	movl	%ebx, 56(%r8)
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
	movl	%ebx, 60(%r8)
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
	movl	%ebx, 64(%r8)
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
	movl	%ebx, 68(%r8)
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
	movl	%ebx, 72(%r8)
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
	movl	%ebx, 76(%r8)
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
	movl	%ebx, 80(%r8)
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
	movl	%ebx, 84(%r8)
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
	movl	%ebx, 88(%r8)
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
	movl	%ebx, 92(%r8)
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
	movl	%ebx, 96(%r8)
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
	movl	%ebx, 100(%r8)
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
	movl	%ebx, 104(%r8)
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
	movl	%ebx, 108(%r8)
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
	movl	%ebx, 112(%r8)
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
	movl	%ebx, 116(%r8)
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
	movl	%ebx, 120(%r8)
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
	movl	%r11d, 124(%r8)
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
	leaq	128(%rsi), %rsi
	leaq	928(%rsp), %rax
	movq	$0, %r8
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_pkfromsig$8
.Lwots_pkfromsig$9:
	shll	$8, %r10d
	movzbl	(%rax,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$8:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$9
	movl	%r10d, %r11d
	addl	$-4, %ecx
	shrq	%cl, %r11
	andq	$15, %r11
	movl	%r11d, (%rsi)
	jmp 	.Lwots_pkfromsig$6
.Lwots_pkfromsig$7:
	shll	$8, %r10d
	movzbl	(%rax,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$6:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$7
	movl	%r10d, %r11d
	addl	$-4, %ecx
	shrq	%cl, %r11
	andq	$15, %r11
	movl	%r11d, 4(%rsi)
	jmp 	.Lwots_pkfromsig$4
.Lwots_pkfromsig$5:
	shll	$8, %r10d
	movzbl	(%rax,%r8), %r11d
	orl 	%r11d, %r10d
	incq	%r8
	addl	$8, %ecx
.Lwots_pkfromsig$4:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$5
	movl	%r10d, %r11d
	addl	$-4, %ecx
	shrq	%cl, %r11
	andq	$15, %r11
	movl	%r11d, 8(%rsi)
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
	movq	%rdi, 608(%rsp)
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
	movq	608(%rsp), %rdi
	lfence
	movq	$0, %rax
	leaq	616(%rsp), %rcx
	movq	(%r9), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rcx)
	leaq	616(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$1, 16(%r10)
	movl	20(%r9), %eax
	leaq	616(%rsp), %r10
	movl	%eax, 20(%r10)
	movq	592(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	%r9, 592(%rsp)
	leaq	616(%rsp), %r9
	leaq	32(%rsp), %rax
	movq	%rcx, %rdx
	movq	%rax, %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkfromsig$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rdx
	movq	592(%rsp), %r9
	lfence
	movq	$0, %rax
	ret
.Lwots_sign$1:
	leaq	56(%rsp), %r8
	movq	%r8, %r10
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
	movq	%r8, %rcx
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
	leaq	128(%r8), %rsi
	leaq	336(%rsp), %r8
	movq	$0, %r10
	movl	$0, %ecx
	movl	$0, %r11d
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %r11d
	movzbl	(%r8,%r10), %ebx
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
	movl	%ebx, (%rsi)
	jmp 	.Lwots_sign$6
.Lwots_sign$7:
	shll	$8, %r11d
	movzbl	(%r8,%r10), %ebx
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
	movl	%ebx, 4(%rsi)
	jmp 	.Lwots_sign$4
.Lwots_sign$5:
	shll	$8, %r11d
	movzbl	(%r8,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_sign$4:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$5
	movl	%r11d, %r11d
	addl	$-4, %ecx
	shrq	%cl, %r11
	andq	$15, %r11
	movl	%r11d, 8(%rsi)
	leaq	24(%rsp), %rcx
	movq	(%r9), %r8
	movq	%r8, (%rcx)
	movq	8(%r9), %r8
	movq	%r8, 8(%rcx)
	movq	16(%r9), %r8
	movq	%r8, 16(%rcx)
	movq	24(%r9), %r8
	movq	%r8, 24(%rcx)
	leaq	24(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$5, 16(%r10)
	movl	20(%r9), %esi
	leaq	24(%rsp), %r10
	movl	%esi, 20(%r10)
	movq	%r9, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rcx
	movq	%rax, %r8
	movq	%rcx, %rsi
	leaq	-792(%rsp), %rsp
	call	.Lwots_sk_x4$1
.Lwots_sign$3:
	leaq	792(%rsp), %rsp
	movq	8(%rsp), %r9
	movq	16(%rsp), %rdi
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
	movq	%rcx, 592(%rsp)
	leaq	616(%rsp), %rcx
	movq	(%r9), %r8
	movq	%r8, (%rcx)
	movq	8(%r9), %r8
	movq	%r8, 8(%rcx)
	movq	16(%r9), %r8
	movq	%r8, 16(%rcx)
	movq	24(%r9), %r8
	movq	%r8, 24(%rcx)
	leaq	616(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$5, 16(%r10)
	movl	20(%r9), %esi
	leaq	616(%rsp), %r10
	movl	%esi, 20(%r10)
	movq	%r9, 600(%rsp)
	movq	%rdi, 608(%rsp)
	leaq	32(%rsp), %rcx
	leaq	616(%rsp), %rsi
	movq	%rcx, %r8
	leaq	-792(%rsp), %rsp
	call	.Lwots_sk_x4$1
.Lwots_pkgen$4:
	leaq	792(%rsp), %rsp
	movq	600(%rsp), %r9
	movq	608(%rsp), %rdi
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
	movq	%rdi, 600(%rsp)
	leaq	32(%rsp), %rcx
	leaq	648(%rsp), %rdx
	leaq	788(%rsp), %rsi
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	leaq	-1080(%rsp), %rsp
	call	.Lwots_chains_x4$1
.Lwots_pkgen$3:
	leaq	1080(%rsp), %rsp
	movq	608(%rsp), %r9
	movq	600(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	616(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$1, 16(%r10)
	movl	20(%r9), %esi
	leaq	616(%rsp), %r10
	movl	%esi, 20(%r10)
	movq	592(%rsp), %rdx
	lfence
	movq	$0, %rsi
	movq	%r9, 592(%rsp)
	leaq	616(%rsp), %r9
	leaq	32(%rsp), %rsi
	movq	%rcx, %rdi
	movq	%rsi, %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	40(%rsp), %rsp
	movq	592(%rsp), %r9
	lfence
	movq	$0, %rdx
	ret
.Lwots_leaves_x4$1:
	movq	%rcx, %mm0
	leaq	144(%rsp), %rcx
	movq	(%rdi), %r8
	movq	%r8, (%rcx)
	movq	8(%rdi), %r8
	movq	%r8, 8(%rcx)
	leaq	192(%rsp), %rcx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	leaq	208(%rsp), %rcx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	leaq	224(%rsp), %rcx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	leaq	240(%rsp), %rcx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	leaq	32(%rsp), %rcx
	movq	(%r9), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rcx)
	leaq	32(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$0, 16(%r10)
	leaq	64(%rsp), %rcx
	movq	(%r9), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rcx)
	leaq	64(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$5, 16(%r10)
	leaq	160(%rsp), %rcx
	movq	(%r9), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r9), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r9), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r9), %rdx
	movq	%rdx, 24(%rcx)
	leaq	160(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$1, 16(%r9)
	movl	%r11d, %eax
	movl	%eax, 128(%rsp)
	movl	%eax, 2632(%rsp)
	movl	%r11d, %eax
	incl	%eax
	movl	%eax, 132(%rsp)
	movl	%eax, 2636(%rsp)
	movl	%r11d, %eax
	addl	$2, %eax
	movl	%eax, 136(%rsp)
	movl	%eax, 2640(%rsp)
	addl	$3, %r11d
	movl	%r11d, 140(%rsp)
	movl	%r11d, 2644(%rsp)
	movl	$0, %eax
	jmp 	.Lwots_leaves_x4$3
.Lwots_leaves_x4$4:
	movl	%eax, 96(%rsp)
	movl	$0, 100(%rsp)
	movl	%eax, 104(%rsp)
	movl	$0, 108(%rsp)
	movl	%eax, 112(%rsp)
	movl	$0, 116(%rsp)
	movl	%eax, 120(%rsp)
	movl	$0, 124(%rsp)
	movl	%eax, 2624(%rsp)
	leaq	320(%rsp), %rcx
	leaq	192(%rsp), %rax
	leaq	144(%rsp), %rdi
	leaq	64(%rsp), %r9
	leaq	96(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n_kp__thash_x4$1
.Lwots_leaves_x4$10:
	leaq	824(%rsp), %rsp
	movl	$0, %edx
	jmp 	.Lwots_leaves_x4$6
.Lwots_leaves_x4$7:
	movl	%edx, 100(%rsp)
	movl	%edx, 108(%rsp)
	movl	%edx, 116(%rsp)
	movl	%edx, 124(%rsp)
	movl	%edx, 2628(%rsp)
	leaq	256(%rsp), %rcx
	leaq	320(%rsp), %rax
	leaq	144(%rsp), %rdi
	leaq	32(%rsp), %r9
	leaq	96(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n_kp__thash_x4$1
.Lwots_leaves_x4$9:
	leaq	824(%rsp), %rsp
	movl	2628(%rsp), %edx
	lfence
	movq	$0, %rax
	incl	%edx
	movl	%edx, 100(%rsp)
	movl	%edx, 108(%rsp)
	movl	%edx, 116(%rsp)
	movl	%edx, 124(%rsp)
	movl	%edx, 2628(%rsp)
	leaq	320(%rsp), %rcx
	leaq	256(%rsp), %rax
	leaq	144(%rsp), %rdi
	leaq	32(%rsp), %r9
	leaq	96(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n_kp__thash_x4$1
.Lwots_leaves_x4$8:
	leaq	824(%rsp), %rsp
	movl	2628(%rsp), %edx
	lfence
	movq	$0, %rax
	incl	%edx
.Lwots_leaves_x4$6:
	cmpl	$14, %edx
	jb  	.Lwots_leaves_x4$7
	movl	%edx, 100(%rsp)
	movl	%edx, 108(%rsp)
	movl	%edx, 116(%rsp)
	movl	%edx, 124(%rsp)
	leaq	256(%rsp), %rcx
	leaq	320(%rsp), %rax
	leaq	144(%rsp), %rdi
	leaq	32(%rsp), %r9
	leaq	96(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n_kp__thash_x4$1
.Lwots_leaves_x4$5:
	leaq	824(%rsp), %rsp
	movl	2624(%rsp), %eax
	lfence
	movq	$0, %rcx
	movl	%eax, %ecx
	imulq	$16, %rcx, %rcx
	movq	256(%rsp), %rsi
	movq	%rsi, 384(%rsp,%rcx)
	movq	264(%rsp), %rsi
	movq	%rsi, 392(%rsp,%rcx)
	movq	272(%rsp), %rsi
	movq	%rsi, 944(%rsp,%rcx)
	movq	280(%rsp), %rsi
	movq	%rsi, 952(%rsp,%rcx)
	movq	288(%rsp), %rsi
	movq	%rsi, 1504(%rsp,%rcx)
	movq	296(%rsp), %rsi
	movq	%rsi, 1512(%rsp,%rcx)
	movq	304(%rsp), %rsi
	movq	%rsi, 2064(%rsp,%rcx)
	movq	312(%rsp), %rsi
	movq	%rsi, 2072(%rsp,%rcx)
	incl	%eax
.Lwots_leaves_x4$3:
	cmpl	$35, %eax
	jb  	.Lwots_leaves_x4$4
	movq	%mm0, %rcx
	lfence
	movq	$0, %rax
	leaq	384(%rsp), %r8
	leaq	144(%rsp), %rdi
	leaq	160(%rsp), %r9
	leaq	2632(%rsp), %rax
	leaq	-856(%rsp), %rsp
	call	.LT_len_x4$1
.Lwots_leaves_x4$2:
	leaq	856(%rsp), %rsp
	ret
.Lwots_sk_x4$1:
	movq	%r8, 96(%rsp)
	leaq	120(%rsp), %rcx
	movq	(%rdi), %r8
	movq	%r8, (%rcx)
	movq	8(%rdi), %r8
	movq	%r8, 8(%rcx)
	leaq	32(%rsp), %rcx
	movq	(%rsi), %r8
	movq	%r8, (%rcx)
	movq	8(%rsi), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rsi), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rsi), %r8
	movq	%r8, 24(%rcx)
	leaq	136(%rsp), %rcx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	leaq	152(%rsp), %rcx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	leaq	168(%rsp), %rcx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	leaq	184(%rsp), %rcx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rcx)
	movq	$0, %rdx
	jmp 	.Lwots_sk_x4$2
.Lwots_sk_x4$3:
	movl	$0, %esi
	movl	%edx, %ecx
	shll	$2, %ecx
	movl	%ecx, 64(%rsp)
	movl	%esi, 68(%rsp)
	incl	%ecx
	movl	%ecx, 72(%rsp)
	movl	%esi, 76(%rsp)
	incl	%ecx
	movl	%ecx, 80(%rsp)
	movl	%esi, 84(%rsp)
	incl	%ecx
	movl	%ecx, 88(%rsp)
	movl	%esi, 92(%rsp)
	movq	%rdx, %rdi
	imulq	$64, %rdi, %rdi
	movq	%rdx, 104(%rsp)
	movq	%rdi, 112(%rsp)
	leaq	200(%rsp,%rdi), %rcx
	leaq	136(%rsp), %r8
	leaq	120(%rsp), %rdi
	leaq	32(%rsp), %r9
	leaq	64(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lwots_sk_x4$4:
	leaq	824(%rsp), %rsp
	movq	104(%rsp), %rdx
	lfence
	movq	$0, %rcx
	incq	%rdx
.Lwots_sk_x4$2:
	cmpq	$9, %rdx
	jb  	.Lwots_sk_x4$3
	movq	96(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	200(%rsp), %rsi
	movq	%rsi, (%rcx)
	movq	208(%rsp), %rsi
	movq	%rsi, 8(%rcx)
	movq	216(%rsp), %rsi
	movq	%rsi, 16(%rcx)
	movq	224(%rsp), %rsi
	movq	%rsi, 24(%rcx)
	movq	232(%rsp), %rsi
	movq	%rsi, 32(%rcx)
	movq	240(%rsp), %rsi
	movq	%rsi, 40(%rcx)
	movq	248(%rsp), %rsi
	movq	%rsi, 48(%rcx)
	movq	256(%rsp), %rsi
	movq	%rsi, 56(%rcx)
	movq	264(%rsp), %rsi
	movq	%rsi, 64(%rcx)
	movq	272(%rsp), %rsi
	movq	%rsi, 72(%rcx)
	movq	280(%rsp), %rsi
	movq	%rsi, 80(%rcx)
	movq	288(%rsp), %rsi
	movq	%rsi, 88(%rcx)
	movq	296(%rsp), %rsi
	movq	%rsi, 96(%rcx)
	movq	304(%rsp), %rsi
	movq	%rsi, 104(%rcx)
	movq	312(%rsp), %rsi
	movq	%rsi, 112(%rcx)
	movq	320(%rsp), %rsi
	movq	%rsi, 120(%rcx)
	movq	328(%rsp), %rsi
	movq	%rsi, 128(%rcx)
	movq	336(%rsp), %rsi
	movq	%rsi, 136(%rcx)
	movq	344(%rsp), %rsi
	movq	%rsi, 144(%rcx)
	movq	352(%rsp), %rsi
	movq	%rsi, 152(%rcx)
	movq	360(%rsp), %rsi
	movq	%rsi, 160(%rcx)
	movq	368(%rsp), %rsi
	movq	%rsi, 168(%rcx)
	movq	376(%rsp), %rsi
	movq	%rsi, 176(%rcx)
	movq	384(%rsp), %rsi
	movq	%rsi, 184(%rcx)
	movq	392(%rsp), %rsi
	movq	%rsi, 192(%rcx)
	movq	400(%rsp), %rsi
	movq	%rsi, 200(%rcx)
	movq	408(%rsp), %rsi
	movq	%rsi, 208(%rcx)
	movq	416(%rsp), %rsi
	movq	%rsi, 216(%rcx)
	movq	424(%rsp), %rsi
	movq	%rsi, 224(%rcx)
	movq	432(%rsp), %rsi
	movq	%rsi, 232(%rcx)
	movq	440(%rsp), %rsi
	movq	%rsi, 240(%rcx)
	movq	448(%rsp), %rsi
	movq	%rsi, 248(%rcx)
	movq	456(%rsp), %rsi
	movq	%rsi, 256(%rcx)
	movq	464(%rsp), %rsi
	movq	%rsi, 264(%rcx)
	movq	472(%rsp), %rsi
	movq	%rsi, 272(%rcx)
	movq	480(%rsp), %rsi
	movq	%rsi, 280(%rcx)
	movq	488(%rsp), %rsi
	movq	%rsi, 288(%rcx)
	movq	496(%rsp), %rsi
	movq	%rsi, 296(%rcx)
	movq	504(%rsp), %rsi
	movq	%rsi, 304(%rcx)
	movq	512(%rsp), %rsi
	movq	%rsi, 312(%rcx)
	movq	520(%rsp), %rsi
	movq	%rsi, 320(%rcx)
	movq	528(%rsp), %rsi
	movq	%rsi, 328(%rcx)
	movq	536(%rsp), %rsi
	movq	%rsi, 336(%rcx)
	movq	544(%rsp), %rsi
	movq	%rsi, 344(%rcx)
	movq	552(%rsp), %rsi
	movq	%rsi, 352(%rcx)
	movq	560(%rsp), %rsi
	movq	%rsi, 360(%rcx)
	movq	568(%rsp), %rsi
	movq	%rsi, 368(%rcx)
	movq	576(%rsp), %rsi
	movq	%rsi, 376(%rcx)
	movq	584(%rsp), %rsi
	movq	%rsi, 384(%rcx)
	movq	592(%rsp), %rsi
	movq	%rsi, 392(%rcx)
	movq	600(%rsp), %rsi
	movq	%rsi, 400(%rcx)
	movq	608(%rsp), %rsi
	movq	%rsi, 408(%rcx)
	movq	616(%rsp), %rsi
	movq	%rsi, 416(%rcx)
	movq	624(%rsp), %rsi
	movq	%rsi, 424(%rcx)
	movq	632(%rsp), %rsi
	movq	%rsi, 432(%rcx)
	movq	640(%rsp), %rsi
	movq	%rsi, 440(%rcx)
	movq	648(%rsp), %rsi
	movq	%rsi, 448(%rcx)
	movq	656(%rsp), %rsi
	movq	%rsi, 456(%rcx)
	movq	664(%rsp), %rsi
	movq	%rsi, 464(%rcx)
	movq	672(%rsp), %rsi
	movq	%rsi, 472(%rcx)
	movq	680(%rsp), %rsi
	movq	%rsi, 480(%rcx)
	movq	688(%rsp), %rsi
	movq	%rsi, 488(%rcx)
	movq	696(%rsp), %rsi
	movq	%rsi, 496(%rcx)
	movq	704(%rsp), %rsi
	movq	%rsi, 504(%rcx)
	movq	712(%rsp), %rsi
	movq	%rsi, 512(%rcx)
	movq	720(%rsp), %rsi
	movq	%rsi, 520(%rcx)
	movq	728(%rsp), %rsi
	movq	%rsi, 528(%rcx)
	movq	736(%rsp), %rsi
	movq	%rsi, 536(%rcx)
	movq	744(%rsp), %rsi
	movq	%rsi, 544(%rcx)
	movq	752(%rsp), %rsi
	movq	%rsi, 552(%rcx)
	ret
.Lwots_chains_refill_x4$1:
	movq	%rsi, 96(%rsp)
	lfence
	movq	$0, %rax
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
	movl	$35, 1000(%rsp)
	movl	$35, 1004(%rsp)
	movl	$35, 1008(%rsp)
	movl	$35, 1012(%rsp)
	movl	$35, 1016(%rsp)
	movl	$35, 1020(%rsp)
	movl	$0, %esi
	movl	$1, %r8d
	movl	(%rcx), %r10d
	movl	%r10d, 1168(%rsp)
	movl	(%rdx), %r11d
	movl	%r11d, 1024(%rsp)
	movl	%esi, %ebx
	movl	$0, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	4(%rcx), %r10d
	movl	%r10d, 1172(%rsp)
	movl	4(%rdx), %r11d
	movl	%r11d, 1028(%rsp)
	movl	%esi, %ebx
	movl	$1, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	8(%rcx), %r10d
	movl	%r10d, 1176(%rsp)
	movl	8(%rdx), %r11d
	movl	%r11d, 1032(%rsp)
	movl	%esi, %ebx
	movl	$2, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	12(%rcx), %r10d
	movl	%r10d, 1180(%rsp)
	movl	12(%rdx), %r11d
	movl	%r11d, 1036(%rsp)
	movl	%esi, %ebx
	movl	$3, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	16(%rcx), %r10d
	movl	%r10d, 1184(%rsp)
	movl	16(%rdx), %r11d
	movl	%r11d, 1040(%rsp)
	movl	%esi, %ebx
	movl	$4, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	20(%rcx), %r10d
	movl	%r10d, 1188(%rsp)
	movl	20(%rdx), %r11d
	movl	%r11d, 1044(%rsp)
	movl	%esi, %ebx
	movl	$5, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	24(%rcx), %r10d
	movl	%r10d, 1192(%rsp)
	movl	24(%rdx), %r11d
	movl	%r11d, 1048(%rsp)
	movl	%esi, %ebx
	movl	$6, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	28(%rcx), %r10d
	movl	%r10d, 1196(%rsp)
	movl	28(%rdx), %r11d
	movl	%r11d, 1052(%rsp)
	movl	%esi, %ebx
	movl	$7, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	32(%rcx), %r10d
	movl	%r10d, 1200(%rsp)
	movl	32(%rdx), %r11d
	movl	%r11d, 1056(%rsp)
	movl	%esi, %ebx
	movl	$8, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	36(%rcx), %r10d
	movl	%r10d, 1204(%rsp)
	movl	36(%rdx), %r11d
	movl	%r11d, 1060(%rsp)
	movl	%esi, %ebx
	movl	$9, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	40(%rcx), %r10d
	movl	%r10d, 1208(%rsp)
	movl	40(%rdx), %r11d
	movl	%r11d, 1064(%rsp)
	movl	%esi, %ebx
	movl	$10, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	44(%rcx), %r10d
	movl	%r10d, 1212(%rsp)
	movl	44(%rdx), %r11d
	movl	%r11d, 1068(%rsp)
	movl	%esi, %ebx
	movl	$11, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	48(%rcx), %r10d
	movl	%r10d, 1216(%rsp)
	movl	48(%rdx), %r11d
	movl	%r11d, 1072(%rsp)
	movl	%esi, %ebx
	movl	$12, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	52(%rcx), %r10d
	movl	%r10d, 1220(%rsp)
	movl	52(%rdx), %r11d
	movl	%r11d, 1076(%rsp)
	movl	%esi, %ebx
	movl	$13, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	56(%rcx), %r10d
	movl	%r10d, 1224(%rsp)
	movl	56(%rdx), %r11d
	movl	%r11d, 1080(%rsp)
	movl	%esi, %ebx
	movl	$14, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	60(%rcx), %r10d
	movl	%r10d, 1228(%rsp)
	movl	60(%rdx), %r11d
	movl	%r11d, 1084(%rsp)
	movl	%esi, %ebx
	movl	$15, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	64(%rcx), %r10d
	movl	%r10d, 1232(%rsp)
	movl	64(%rdx), %r11d
	movl	%r11d, 1088(%rsp)
	movl	%esi, %ebx
	movl	$16, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	68(%rcx), %r10d
	movl	%r10d, 1236(%rsp)
	movl	68(%rdx), %r11d
	movl	%r11d, 1092(%rsp)
	movl	%esi, %ebx
	movl	$17, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	72(%rcx), %r10d
	movl	%r10d, 1240(%rsp)
	movl	72(%rdx), %r11d
	movl	%r11d, 1096(%rsp)
	movl	%esi, %ebx
	movl	$18, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	76(%rcx), %r10d
	movl	%r10d, 1244(%rsp)
	movl	76(%rdx), %r11d
	movl	%r11d, 1100(%rsp)
	movl	%esi, %ebx
	movl	$19, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	80(%rcx), %r10d
	movl	%r10d, 1248(%rsp)
	movl	80(%rdx), %r11d
	movl	%r11d, 1104(%rsp)
	movl	%esi, %ebx
	movl	$20, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	84(%rcx), %r10d
	movl	%r10d, 1252(%rsp)
	movl	84(%rdx), %r11d
	movl	%r11d, 1108(%rsp)
	movl	%esi, %ebx
	movl	$21, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	88(%rcx), %r10d
	movl	%r10d, 1256(%rsp)
	movl	88(%rdx), %r11d
	movl	%r11d, 1112(%rsp)
	movl	%esi, %ebx
	movl	$22, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	92(%rcx), %r10d
	movl	%r10d, 1260(%rsp)
	movl	92(%rdx), %r11d
	movl	%r11d, 1116(%rsp)
	movl	%esi, %ebx
	movl	$23, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	96(%rcx), %r10d
	movl	%r10d, 1264(%rsp)
	movl	96(%rdx), %r11d
	movl	%r11d, 1120(%rsp)
	movl	%esi, %ebx
	movl	$24, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	100(%rcx), %r10d
	movl	%r10d, 1268(%rsp)
	movl	100(%rdx), %r11d
	movl	%r11d, 1124(%rsp)
	movl	%esi, %ebx
	movl	$25, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	104(%rcx), %r10d
	movl	%r10d, 1272(%rsp)
	movl	104(%rdx), %r11d
	movl	%r11d, 1128(%rsp)
	movl	%esi, %ebx
	movl	$26, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	108(%rcx), %r10d
	movl	%r10d, 1276(%rsp)
	movl	108(%rdx), %r11d
	movl	%r11d, 1132(%rsp)
	movl	%esi, %ebx
	movl	$27, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	112(%rcx), %r10d
	movl	%r10d, 1280(%rsp)
	movl	112(%rdx), %r11d
	movl	%r11d, 1136(%rsp)
	movl	%esi, %ebx
	movl	$28, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	116(%rcx), %r10d
	movl	%r10d, 1284(%rsp)
	movl	116(%rdx), %r11d
	movl	%r11d, 1140(%rsp)
	movl	%esi, %ebx
	movl	$29, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	120(%rcx), %r10d
	movl	%r10d, 1288(%rsp)
	movl	120(%rdx), %r11d
	movl	%r11d, 1144(%rsp)
	movl	%esi, %ebx
	movl	$30, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	124(%rcx), %r10d
	movl	%r10d, 1292(%rsp)
	movl	124(%rdx), %r11d
	movl	%r11d, 1148(%rsp)
	movl	%esi, %ebx
	movl	$31, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	128(%rcx), %r10d
	movl	%r10d, 1296(%rsp)
	movl	128(%rdx), %r11d
	movl	%r11d, 1152(%rsp)
	movl	%esi, %ebx
	movl	$32, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	132(%rcx), %r10d
	movl	%r10d, 1300(%rsp)
	movl	132(%rdx), %r11d
	movl	%r11d, 1156(%rsp)
	movl	%esi, %ebx
	movl	$33, 880(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ebx
	addl	%ebx, %esi
	orl 	%eax, %esi
	movl	136(%rcx), %r10d
	movl	%r10d, 1304(%rsp)
	movl	136(%rdx), %r11d
	movl	%r11d, 1160(%rsp)
	movl	%esi, %ecx
	movl	$34, 880(%rsp,%rcx,4)
	movl	$0, %ecx
	cmpl	%r11d, %r10d
	cmovb	%r8d, %ecx
	addl	%ecx, %esi
	orl 	%eax, %esi
	movl	$0, 1308(%rsp)
	movl	$0, 1164(%rsp)
	movl	%esi, 824(%rsp)
	movl	$0, 828(%rsp)
	movq	96(%rsp), %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 248(%rsp)
	movq	8(%rcx), %rsi
	movq	%rsi, 256(%rsp)
	movq	16(%rcx), %rsi
	movq	%rsi, 264(%rsp)
	movq	24(%rcx), %rsi
	movq	%rsi, 272(%rsp)
	movq	32(%rcx), %rsi
	movq	%rsi, 280(%rsp)
	movq	40(%rcx), %rsi
	movq	%rsi, 288(%rsp)
	movq	48(%rcx), %rsi
	movq	%rsi, 296(%rsp)
	movq	56(%rcx), %rsi
	movq	%rsi, 304(%rsp)
	movq	64(%rcx), %rsi
	movq	%rsi, 312(%rsp)
	movq	72(%rcx), %rsi
	movq	%rsi, 320(%rsp)
	movq	80(%rcx), %rsi
	movq	%rsi, 328(%rsp)
	movq	88(%rcx), %rsi
	movq	%rsi, 336(%rsp)
	movq	96(%rcx), %rsi
	movq	%rsi, 344(%rsp)
	movq	104(%rcx), %rsi
	movq	%rsi, 352(%rsp)
	movq	112(%rcx), %rsi
	movq	%rsi, 360(%rsp)
	movq	120(%rcx), %rsi
	movq	%rsi, 368(%rsp)
	movq	128(%rcx), %rsi
	movq	%rsi, 376(%rsp)
	movq	136(%rcx), %rsi
	movq	%rsi, 384(%rsp)
	movq	144(%rcx), %rsi
	movq	%rsi, 392(%rsp)
	movq	152(%rcx), %rsi
	movq	%rsi, 400(%rsp)
	movq	160(%rcx), %rsi
	movq	%rsi, 408(%rsp)
	movq	168(%rcx), %rsi
	movq	%rsi, 416(%rsp)
	movq	176(%rcx), %rsi
	movq	%rsi, 424(%rsp)
	movq	184(%rcx), %rsi
	movq	%rsi, 432(%rsp)
	movq	192(%rcx), %rsi
	movq	%rsi, 440(%rsp)
	movq	200(%rcx), %rsi
	movq	%rsi, 448(%rsp)
	movq	208(%rcx), %rsi
	movq	%rsi, 456(%rsp)
	movq	216(%rcx), %rsi
	movq	%rsi, 464(%rsp)
	movq	224(%rcx), %rsi
	movq	%rsi, 472(%rsp)
	movq	232(%rcx), %rsi
	movq	%rsi, 480(%rsp)
	movq	240(%rcx), %rsi
	movq	%rsi, 488(%rsp)
	movq	248(%rcx), %rsi
	movq	%rsi, 496(%rsp)
	movq	256(%rcx), %rsi
	movq	%rsi, 504(%rsp)
	movq	264(%rcx), %rsi
	movq	%rsi, 512(%rsp)
	movq	272(%rcx), %rsi
	movq	%rsi, 520(%rsp)
	movq	280(%rcx), %rsi
	movq	%rsi, 528(%rsp)
	movq	288(%rcx), %rsi
	movq	%rsi, 536(%rsp)
	movq	296(%rcx), %rsi
	movq	%rsi, 544(%rsp)
	movq	304(%rcx), %rsi
	movq	%rsi, 552(%rsp)
	movq	312(%rcx), %rsi
	movq	%rsi, 560(%rsp)
	movq	320(%rcx), %rsi
	movq	%rsi, 568(%rsp)
	movq	328(%rcx), %rsi
	movq	%rsi, 576(%rsp)
	movq	336(%rcx), %rsi
	movq	%rsi, 584(%rsp)
	movq	344(%rcx), %rsi
	movq	%rsi, 592(%rsp)
	movq	352(%rcx), %rsi
	movq	%rsi, 600(%rsp)
	movq	360(%rcx), %rsi
	movq	%rsi, 608(%rsp)
	movq	368(%rcx), %rsi
	movq	%rsi, 616(%rsp)
	movq	376(%rcx), %rsi
	movq	%rsi, 624(%rsp)
	movq	384(%rcx), %rsi
	movq	%rsi, 632(%rsp)
	movq	392(%rcx), %rsi
	movq	%rsi, 640(%rsp)
	movq	400(%rcx), %rsi
	movq	%rsi, 648(%rsp)
	movq	408(%rcx), %rsi
	movq	%rsi, 656(%rsp)
	movq	416(%rcx), %rsi
	movq	%rsi, 664(%rsp)
	movq	424(%rcx), %rsi
	movq	%rsi, 672(%rsp)
	movq	432(%rcx), %rsi
	movq	%rsi, 680(%rsp)
	movq	440(%rcx), %rsi
	movq	%rsi, 688(%rsp)
	movq	448(%rcx), %rsi
	movq	%rsi, 696(%rsp)
	movq	456(%rcx), %rsi
	movq	%rsi, 704(%rsp)
	movq	464(%rcx), %rsi
	movq	%rsi, 712(%rsp)
	movq	472(%rcx), %rsi
	movq	%rsi, 720(%rsp)
	movq	480(%rcx), %rsi
	movq	%rsi, 728(%rsp)
	movq	488(%rcx), %rsi
	movq	%rsi, 736(%rsp)
	movq	496(%rcx), %rsi
	movq	%rsi, 744(%rsp)
	movq	504(%rcx), %rsi
	movq	%rsi, 752(%rsp)
	movq	512(%rcx), %rsi
	movq	%rsi, 760(%rsp)
	movq	520(%rcx), %rsi
	movq	%rsi, 768(%rsp)
	movq	528(%rcx), %rsi
	movq	%rsi, 776(%rsp)
	movq	536(%rcx), %rsi
	movq	%rsi, 784(%rsp)
	movq	544(%rcx), %rsi
	movq	%rsi, 792(%rsp)
	movq	552(%rcx), %rcx
	movq	%rcx, 800(%rsp)
	movq	$0, 808(%rsp)
	movq	$0, 816(%rsp)
	movl	$0, 864(%rsp)
	movl	$0, 848(%rsp)
	movl	$35, 832(%rsp)
	movq	$0, 184(%rsp)
	movq	$0, 120(%rsp)
	movq	$0, 192(%rsp)
	movq	$0, 128(%rsp)
	movl	$0, 868(%rsp)
	movl	$0, 852(%rsp)
	movl	$35, 836(%rsp)
	movq	$0, 200(%rsp)
	movq	$0, 136(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 144(%rsp)
	movl	$0, 872(%rsp)
	movl	$0, 856(%rsp)
	movl	$35, 840(%rsp)
	movq	$0, 216(%rsp)
	movq	$0, 152(%rsp)
	movq	$0, 224(%rsp)
	movq	$0, 160(%rsp)
	movl	$0, 876(%rsp)
	movl	$0, 860(%rsp)
	movl	$35, 844(%rsp)
	movq	$0, 232(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 240(%rsp)
	movq	$0, 176(%rsp)
	leaq	104(%rsp), %rcx
	movq	(%rdi), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%rcx)
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
	movl	832(%rsp), %eax
	movl	%eax, 64(%rsp)
	movl	864(%rsp), %eax
	movl	%eax, 68(%rsp)
	movl	836(%rsp), %eax
	movl	%eax, 72(%rsp)
	movl	868(%rsp), %eax
	movl	%eax, 76(%rsp)
	movl	840(%rsp), %eax
	movl	%eax, 80(%rsp)
	movl	872(%rsp), %eax
	movl	%eax, 84(%rsp)
	movl	844(%rsp), %eax
	movl	%eax, 88(%rsp)
	movl	876(%rsp), %eax
	movl	%eax, 92(%rsp)
	leaq	120(%rsp), %rcx
	leaq	184(%rsp), %r8
	leaq	104(%rsp), %rdi
	leaq	32(%rsp), %r9
	leaq	64(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lwots_chains_refill_x4$4:
	leaq	824(%rsp), %rsp
	lfence
	movq	$0, %rax
.Lwots_chains_refill_x4$2:
	movl	828(%rsp), %ecx
	movl	824(%rsp), %edx
	movl	$0, %esi
	movl	$1, %edi
	movl	864(%rsp), %r8d
	movl	848(%rsp), %r9d
	movl	832(%rsp), %r10d
	orl 	%eax, %r10d
	movq	184(%rsp), %r11
	movq	120(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 184(%rsp)
	movq	192(%rsp), %r11
	movq	128(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 192(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$16, %r11, %r11
	movq	184(%rsp), %rbx
	movq	%rbx, 248(%rsp,%r11)
	movq	192(%rsp), %rbx
	movq	%rbx, 256(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %ebx
	movl	880(%rsp,%rbx,4), %ebx
	orl 	%eax, %ebx
	cmpl	$0, %r11d
	cmovne	%ebx, %r10d
	movl	%ebx, %ebp
	movl	1168(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1024(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%ebx, %ebx
	imulq	$16, %rbx, %rbx
	movq	184(%rsp), %rbp
	movq	248(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 184(%rsp)
	movq	192(%rsp), %rbp
	movq	256(%rsp,%rbx), %rbx
	cmpl	$0, %r11d
	cmovne	%rbx, %rbp
	movq	%rbp, 192(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 864(%rsp)
	movl	%r9d, 848(%rsp)
	movl	%r10d, 832(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	868(%rsp), %r8d
	movl	852(%rsp), %r9d
	movl	836(%rsp), %r10d
	orl 	%eax, %r10d
	movq	200(%rsp), %r11
	movq	136(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 200(%rsp)
	movq	208(%rsp), %r11
	movq	144(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 208(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$16, %r11, %r11
	movq	200(%rsp), %rbx
	movq	%rbx, 248(%rsp,%r11)
	movq	208(%rsp), %rbx
	movq	%rbx, 256(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %ebx
	movl	880(%rsp,%rbx,4), %ebx
	orl 	%eax, %ebx
	cmpl	$0, %r11d
	cmovne	%ebx, %r10d
	movl	%ebx, %ebp
	movl	1168(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1024(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%ebx, %ebx
	imulq	$16, %rbx, %rbx
	movq	200(%rsp), %rbp
	movq	248(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 200(%rsp)
	movq	208(%rsp), %rbp
	movq	256(%rsp,%rbx), %rbx
	cmpl	$0, %r11d
	cmovne	%rbx, %rbp
	movq	%rbp, 208(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 868(%rsp)
	movl	%r9d, 852(%rsp)
	movl	%r10d, 836(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	872(%rsp), %r8d
	movl	856(%rsp), %r9d
	movl	840(%rsp), %r10d
	orl 	%eax, %r10d
	movq	216(%rsp), %r11
	movq	152(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 216(%rsp)
	movq	224(%rsp), %r11
	movq	160(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 224(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$16, %r11, %r11
	movq	216(%rsp), %rbx
	movq	%rbx, 248(%rsp,%r11)
	movq	224(%rsp), %rbx
	movq	%rbx, 256(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %ebx
	movl	880(%rsp,%rbx,4), %ebx
	orl 	%eax, %ebx
	cmpl	$0, %r11d
	cmovne	%ebx, %r10d
	movl	%ebx, %ebp
	movl	1168(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1024(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%ebx, %ebx
	imulq	$16, %rbx, %rbx
	movq	216(%rsp), %rbp
	movq	248(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 216(%rsp)
	movq	224(%rsp), %rbp
	movq	256(%rsp,%rbx), %rbx
	cmpl	$0, %r11d
	cmovne	%rbx, %rbp
	movq	%rbp, 224(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 872(%rsp)
	movl	%r9d, 856(%rsp)
	movl	%r10d, 840(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	876(%rsp), %r8d
	movl	860(%rsp), %r9d
	movl	844(%rsp), %r10d
	orl 	%eax, %r10d
	movq	232(%rsp), %r11
	movq	168(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 232(%rsp)
	movq	240(%rsp), %r11
	movq	176(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 240(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$16, %r11, %r11
	movq	232(%rsp), %rbx
	movq	%rbx, 248(%rsp,%r11)
	movq	240(%rsp), %rbx
	movq	%rbx, 256(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %edx
	movl	880(%rsp,%rdx,4), %edx
	orl 	%eax, %edx
	cmpl	$0, %r11d
	cmovne	%edx, %r10d
	movl	%edx, %ebx
	movl	1168(%rsp,%rbx,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1024(%rsp,%rbx,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%edx, %edx
	imulq	$16, %rdx, %rdx
	movq	232(%rsp), %rbx
	movq	248(%rsp,%rdx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbx
	movq	%rbx, 232(%rsp)
	movq	240(%rsp), %rbx
	movq	256(%rsp,%rdx), %rdx
	cmpl	$0, %r11d
	cmovne	%rdx, %rbx
	movq	%rbx, 240(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 876(%rsp)
	movl	%r9d, 860(%rsp)
	movl	%r10d, 844(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	%ecx, 828(%rsp)
	orl 	%eax, %esi
	cmpl	$0, %esi
	jne 	.Lwots_chains_refill_x4$3
	movq	96(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	248(%rsp), %rsi
	movq	%rsi, (%rcx)
	movq	256(%rsp), %rsi
	movq	%rsi, 8(%rcx)
	movq	264(%rsp), %rsi
	movq	%rsi, 16(%rcx)
	movq	272(%rsp), %rsi
	movq	%rsi, 24(%rcx)
	movq	280(%rsp), %rsi
	movq	%rsi, 32(%rcx)
	movq	288(%rsp), %rsi
	movq	%rsi, 40(%rcx)
	movq	296(%rsp), %rsi
	movq	%rsi, 48(%rcx)
	movq	304(%rsp), %rsi
	movq	%rsi, 56(%rcx)
	movq	312(%rsp), %rsi
	movq	%rsi, 64(%rcx)
	movq	320(%rsp), %rsi
	movq	%rsi, 72(%rcx)
	movq	328(%rsp), %rsi
	movq	%rsi, 80(%rcx)
	movq	336(%rsp), %rsi
	movq	%rsi, 88(%rcx)
	movq	344(%rsp), %rsi
	movq	%rsi, 96(%rcx)
	movq	352(%rsp), %rsi
	movq	%rsi, 104(%rcx)
	movq	360(%rsp), %rsi
	movq	%rsi, 112(%rcx)
	movq	368(%rsp), %rsi
	movq	%rsi, 120(%rcx)
	movq	376(%rsp), %rsi
	movq	%rsi, 128(%rcx)
	movq	384(%rsp), %rsi
	movq	%rsi, 136(%rcx)
	movq	392(%rsp), %rsi
	movq	%rsi, 144(%rcx)
	movq	400(%rsp), %rsi
	movq	%rsi, 152(%rcx)
	movq	408(%rsp), %rsi
	movq	%rsi, 160(%rcx)
	movq	416(%rsp), %rsi
	movq	%rsi, 168(%rcx)
	movq	424(%rsp), %rsi
	movq	%rsi, 176(%rcx)
	movq	432(%rsp), %rsi
	movq	%rsi, 184(%rcx)
	movq	440(%rsp), %rsi
	movq	%rsi, 192(%rcx)
	movq	448(%rsp), %rsi
	movq	%rsi, 200(%rcx)
	movq	456(%rsp), %rsi
	movq	%rsi, 208(%rcx)
	movq	464(%rsp), %rsi
	movq	%rsi, 216(%rcx)
	movq	472(%rsp), %rsi
	movq	%rsi, 224(%rcx)
	movq	480(%rsp), %rsi
	movq	%rsi, 232(%rcx)
	movq	488(%rsp), %rsi
	movq	%rsi, 240(%rcx)
	movq	496(%rsp), %rsi
	movq	%rsi, 248(%rcx)
	movq	504(%rsp), %rsi
	movq	%rsi, 256(%rcx)
	movq	512(%rsp), %rsi
	movq	%rsi, 264(%rcx)
	movq	520(%rsp), %rsi
	movq	%rsi, 272(%rcx)
	movq	528(%rsp), %rsi
	movq	%rsi, 280(%rcx)
	movq	536(%rsp), %rsi
	movq	%rsi, 288(%rcx)
	movq	544(%rsp), %rsi
	movq	%rsi, 296(%rcx)
	movq	552(%rsp), %rsi
	movq	%rsi, 304(%rcx)
	movq	560(%rsp), %rsi
	movq	%rsi, 312(%rcx)
	movq	568(%rsp), %rsi
	movq	%rsi, 320(%rcx)
	movq	576(%rsp), %rsi
	movq	%rsi, 328(%rcx)
	movq	584(%rsp), %rsi
	movq	%rsi, 336(%rcx)
	movq	592(%rsp), %rsi
	movq	%rsi, 344(%rcx)
	movq	600(%rsp), %rsi
	movq	%rsi, 352(%rcx)
	movq	608(%rsp), %rsi
	movq	%rsi, 360(%rcx)
	movq	616(%rsp), %rsi
	movq	%rsi, 368(%rcx)
	movq	624(%rsp), %rsi
	movq	%rsi, 376(%rcx)
	movq	632(%rsp), %rsi
	movq	%rsi, 384(%rcx)
	movq	640(%rsp), %rsi
	movq	%rsi, 392(%rcx)
	movq	648(%rsp), %rsi
	movq	%rsi, 400(%rcx)
	movq	656(%rsp), %rsi
	movq	%rsi, 408(%rcx)
	movq	664(%rsp), %rsi
	movq	%rsi, 416(%rcx)
	movq	672(%rsp), %rsi
	movq	%rsi, 424(%rcx)
	movq	680(%rsp), %rsi
	movq	%rsi, 432(%rcx)
	movq	688(%rsp), %rsi
	movq	%rsi, 440(%rcx)
	movq	696(%rsp), %rsi
	movq	%rsi, 448(%rcx)
	movq	704(%rsp), %rsi
	movq	%rsi, 456(%rcx)
	movq	712(%rsp), %rsi
	movq	%rsi, 464(%rcx)
	movq	720(%rsp), %rsi
	movq	%rsi, 472(%rcx)
	movq	728(%rsp), %rsi
	movq	%rsi, 480(%rcx)
	movq	736(%rsp), %rsi
	movq	%rsi, 488(%rcx)
	movq	744(%rsp), %rsi
	movq	%rsi, 496(%rcx)
	movq	752(%rsp), %rsi
	movq	%rsi, 504(%rcx)
	movq	760(%rsp), %rsi
	movq	%rsi, 512(%rcx)
	movq	768(%rsp), %rsi
	movq	%rsi, 520(%rcx)
	movq	776(%rsp), %rsi
	movq	%rsi, 528(%rcx)
	movq	784(%rsp), %rsi
	movq	%rsi, 536(%rcx)
	movq	792(%rsp), %rsi
	movq	%rsi, 544(%rcx)
	movq	800(%rsp), %rsi
	movq	%rsi, 552(%rcx)
	ret
.Lwots_chains_x4$1:
	movq	%r8, 96(%rsp)
	leaq	120(%rsp), %rsi
	movq	(%rdi), %r8
	movq	%r8, (%rsi)
	movq	8(%rdi), %r8
	movq	%r8, 8(%rsi)
	leaq	32(%rsp), %rsi
	movq	(%r9), %r8
	movq	%r8, (%rsi)
	movq	8(%r9), %r8
	movq	%r8, 8(%rsi)
	movq	16(%r9), %r8
	movq	%r8, 16(%rsi)
	movq	24(%r9), %r8
	movq	%r8, 24(%rsi)
	movl	$0, %esi
	movl	(%rcx), %r10d
	movl	%r10d, 928(%rsp)
	movl	(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 784(%rsp)
	movl	4(%rcx), %r10d
	movl	%r10d, 932(%rsp)
	movl	4(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 788(%rsp)
	movl	8(%rcx), %r10d
	movl	%r10d, 936(%rsp)
	movl	8(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 792(%rsp)
	movl	12(%rcx), %r10d
	movl	%r10d, 940(%rsp)
	movl	12(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 796(%rsp)
	movl	16(%rcx), %r10d
	movl	%r10d, 944(%rsp)
	movl	16(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 800(%rsp)
	movl	20(%rcx), %r10d
	movl	%r10d, 948(%rsp)
	movl	20(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 804(%rsp)
	movl	24(%rcx), %r10d
	movl	%r10d, 952(%rsp)
	movl	24(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 808(%rsp)
	movl	28(%rcx), %r10d
	movl	%r10d, 956(%rsp)
	movl	28(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 812(%rsp)
	movl	32(%rcx), %r10d
	movl	%r10d, 960(%rsp)
	movl	32(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 816(%rsp)
	movl	36(%rcx), %r10d
	movl	%r10d, 964(%rsp)
	movl	36(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 820(%rsp)
	movl	40(%rcx), %r10d
	movl	%r10d, 968(%rsp)
	movl	40(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 824(%rsp)
	movl	44(%rcx), %r10d
	movl	%r10d, 972(%rsp)
	movl	44(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 828(%rsp)
	movl	48(%rcx), %r10d
	movl	%r10d, 976(%rsp)
	movl	48(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 832(%rsp)
	movl	52(%rcx), %r10d
	movl	%r10d, 980(%rsp)
	movl	52(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 836(%rsp)
	movl	56(%rcx), %r10d
	movl	%r10d, 984(%rsp)
	movl	56(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 840(%rsp)
	movl	60(%rcx), %r10d
	movl	%r10d, 988(%rsp)
	movl	60(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 844(%rsp)
	movl	64(%rcx), %r10d
	movl	%r10d, 992(%rsp)
	movl	64(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 848(%rsp)
	movl	68(%rcx), %r10d
	movl	%r10d, 996(%rsp)
	movl	68(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 852(%rsp)
	movl	72(%rcx), %r10d
	movl	%r10d, 1000(%rsp)
	movl	72(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 856(%rsp)
	movl	76(%rcx), %r10d
	movl	%r10d, 1004(%rsp)
	movl	76(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 860(%rsp)
	movl	80(%rcx), %r10d
	movl	%r10d, 1008(%rsp)
	movl	80(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 864(%rsp)
	movl	84(%rcx), %r10d
	movl	%r10d, 1012(%rsp)
	movl	84(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 868(%rsp)
	movl	88(%rcx), %r10d
	movl	%r10d, 1016(%rsp)
	movl	88(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 872(%rsp)
	movl	92(%rcx), %r10d
	movl	%r10d, 1020(%rsp)
	movl	92(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 876(%rsp)
	movl	96(%rcx), %r10d
	movl	%r10d, 1024(%rsp)
	movl	96(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 880(%rsp)
	movl	100(%rcx), %r10d
	movl	%r10d, 1028(%rsp)
	movl	100(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 884(%rsp)
	movl	104(%rcx), %r10d
	movl	%r10d, 1032(%rsp)
	movl	104(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 888(%rsp)
	movl	108(%rcx), %r10d
	movl	%r10d, 1036(%rsp)
	movl	108(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 892(%rsp)
	movl	112(%rcx), %r10d
	movl	%r10d, 1040(%rsp)
	movl	112(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 896(%rsp)
	movl	116(%rcx), %r10d
	movl	%r10d, 1044(%rsp)
	movl	116(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 900(%rsp)
	movl	120(%rcx), %r10d
	movl	%r10d, 1048(%rsp)
	movl	120(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 904(%rsp)
	movl	124(%rcx), %r10d
	movl	%r10d, 1052(%rsp)
	movl	124(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 908(%rsp)
	movl	128(%rcx), %r10d
	movl	%r10d, 1056(%rsp)
	movl	128(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 912(%rsp)
	movl	132(%rcx), %r10d
	movl	%r10d, 1060(%rsp)
	movl	132(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 916(%rsp)
	movl	136(%rcx), %r10d
	movl	%r10d, 1064(%rsp)
	movl	136(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 920(%rsp)
	movl	%esi, 1068(%rsp)
	movl	%esi, 924(%rsp)
	movq	96(%rsp), %rcx
	movq	(%rcx), %rsi
	movq	%rsi, 200(%rsp)
	movq	8(%rcx), %rsi
	movq	%rsi, 208(%rsp)
	movq	16(%rcx), %rsi
	movq	%rsi, 216(%rsp)
	movq	24(%rcx), %rsi
	movq	%rsi, 224(%rsp)
	movq	32(%rcx), %rsi
	movq	%rsi, 232(%rsp)
	movq	40(%rcx), %rsi
	movq	%rsi, 240(%rsp)
	movq	48(%rcx), %rsi
	movq	%rsi, 248(%rsp)
	movq	56(%rcx), %rsi
	movq	%rsi, 256(%rsp)
	movq	64(%rcx), %rsi
	movq	%rsi, 264(%rsp)
	movq	72(%rcx), %rsi
	movq	%rsi, 272(%rsp)
	movq	80(%rcx), %rsi
	movq	%rsi, 280(%rsp)
	movq	88(%rcx), %rsi
	movq	%rsi, 288(%rsp)
	movq	96(%rcx), %rsi
	movq	%rsi, 296(%rsp)
	movq	104(%rcx), %rsi
	movq	%rsi, 304(%rsp)
	movq	112(%rcx), %rsi
	movq	%rsi, 312(%rsp)
	movq	120(%rcx), %rsi
	movq	%rsi, 320(%rsp)
	movq	128(%rcx), %rsi
	movq	%rsi, 328(%rsp)
	movq	136(%rcx), %rsi
	movq	%rsi, 336(%rsp)
	movq	144(%rcx), %rsi
	movq	%rsi, 344(%rsp)
	movq	152(%rcx), %rsi
	movq	%rsi, 352(%rsp)
	movq	160(%rcx), %rsi
	movq	%rsi, 360(%rsp)
	movq	168(%rcx), %rsi
	movq	%rsi, 368(%rsp)
	movq	176(%rcx), %rsi
	movq	%rsi, 376(%rsp)
	movq	184(%rcx), %rsi
	movq	%rsi, 384(%rsp)
	movq	192(%rcx), %rsi
	movq	%rsi, 392(%rsp)
	movq	200(%rcx), %rsi
	movq	%rsi, 400(%rsp)
	movq	208(%rcx), %rsi
	movq	%rsi, 408(%rsp)
	movq	216(%rcx), %rsi
	movq	%rsi, 416(%rsp)
	movq	224(%rcx), %rsi
	movq	%rsi, 424(%rsp)
	movq	232(%rcx), %rsi
	movq	%rsi, 432(%rsp)
	movq	240(%rcx), %rsi
	movq	%rsi, 440(%rsp)
	movq	248(%rcx), %rsi
	movq	%rsi, 448(%rsp)
	movq	256(%rcx), %rsi
	movq	%rsi, 456(%rsp)
	movq	264(%rcx), %rsi
	movq	%rsi, 464(%rsp)
	movq	272(%rcx), %rsi
	movq	%rsi, 472(%rsp)
	movq	280(%rcx), %rsi
	movq	%rsi, 480(%rsp)
	movq	288(%rcx), %rsi
	movq	%rsi, 488(%rsp)
	movq	296(%rcx), %rsi
	movq	%rsi, 496(%rsp)
	movq	304(%rcx), %rsi
	movq	%rsi, 504(%rsp)
	movq	312(%rcx), %rsi
	movq	%rsi, 512(%rsp)
	movq	320(%rcx), %rsi
	movq	%rsi, 520(%rsp)
	movq	328(%rcx), %rsi
	movq	%rsi, 528(%rsp)
	movq	336(%rcx), %rsi
	movq	%rsi, 536(%rsp)
	movq	344(%rcx), %rsi
	movq	%rsi, 544(%rsp)
	movq	352(%rcx), %rsi
	movq	%rsi, 552(%rsp)
	movq	360(%rcx), %rsi
	movq	%rsi, 560(%rsp)
	movq	368(%rcx), %rsi
	movq	%rsi, 568(%rsp)
	movq	376(%rcx), %rsi
	movq	%rsi, 576(%rsp)
	movq	384(%rcx), %rsi
	movq	%rsi, 584(%rsp)
	movq	392(%rcx), %rsi
	movq	%rsi, 592(%rsp)
	movq	400(%rcx), %rsi
	movq	%rsi, 600(%rsp)
	movq	408(%rcx), %rsi
	movq	%rsi, 608(%rsp)
	movq	416(%rcx), %rsi
	movq	%rsi, 616(%rsp)
	movq	424(%rcx), %rsi
	movq	%rsi, 624(%rsp)
	movq	432(%rcx), %rsi
	movq	%rsi, 632(%rsp)
	movq	440(%rcx), %rsi
	movq	%rsi, 640(%rsp)
	movq	448(%rcx), %rsi
	movq	%rsi, 648(%rsp)
	movq	456(%rcx), %rsi
	movq	%rsi, 656(%rsp)
	movq	464(%rcx), %rsi
	movq	%rsi, 664(%rsp)
	movq	472(%rcx), %rsi
	movq	%rsi, 672(%rsp)
	movq	480(%rcx), %rsi
	movq	%rsi, 680(%rsp)
	movq	488(%rcx), %rsi
	movq	%rsi, 688(%rsp)
	movq	496(%rcx), %rsi
	movq	%rsi, 696(%rsp)
	movq	504(%rcx), %rsi
	movq	%rsi, 704(%rsp)
	movq	512(%rcx), %rsi
	movq	%rsi, 712(%rsp)
	movq	520(%rcx), %rsi
	movq	%rsi, 720(%rsp)
	movq	528(%rcx), %rsi
	movq	%rsi, 728(%rsp)
	movq	536(%rcx), %rsi
	movq	%rsi, 736(%rsp)
	movq	544(%rcx), %rsi
	movq	%rsi, 744(%rsp)
	movq	552(%rcx), %rcx
	movq	%rcx, 752(%rsp)
	movq	$0, 760(%rsp)
	movq	$0, 768(%rsp)
	movq	$0, %rcx
	jmp 	.Lwots_chains_x4$2
.Lwots_chains_x4$3:
	movl	%ecx, %edx
	shll	$2, %edx
	movl	%edx, 64(%rsp)
	incl	%edx
	movl	%edx, 72(%rsp)
	incl	%edx
	movl	%edx, 80(%rsp)
	incl	%edx
	movl	%edx, 88(%rsp)
	movl	$16, %edx
	movl	$0, %esi
	movl	$0, %edi
	movq	%rcx, %r8
	shlq	$2, %r8
	movl	928(%rsp,%r8,4), %r10d
	movl	784(%rsp,%r8,4), %r9d
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
	movl	932(%rsp,%r8,4), %r10d
	movl	788(%rsp,%r8,4), %r9d
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
	movl	936(%rsp,%r8,4), %r10d
	movl	792(%rsp,%r8,4), %r9d
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
	movl	940(%rsp,%r8,4), %r10d
	movl	796(%rsp,%r8,4), %r9d
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
	movl	%edx, 68(%rsp)
	movl	%edx, 76(%rsp)
	movl	%edx, 84(%rsp)
	movl	%edx, 92(%rsp)
	movq	%rcx, 104(%rsp)
	movq	%rdi, 112(%rsp)
	movl	%edx, 776(%rsp)
	movl	%esi, 780(%rsp)
	leaq	200(%rsp,%rdi), %r8
	leaq	136(%rsp), %rcx
	leaq	120(%rsp), %rdi
	leaq	32(%rsp), %r9
	leaq	64(%rsp), %rdx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lwots_chains_x4$6:
	leaq	824(%rsp), %rsp
	movq	104(%rsp), %rcx
	movq	112(%rsp), %rdi
	movl	776(%rsp), %edx
	movl	780(%rsp), %esi
	lfence
	movq	$0, %r8
	movq	%rcx, %r8
	shlq	$2, %r8
	movl	%edx, %r9d
	movl	928(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	784(%rsp,%r8,4), %r10d
	movq	200(%rsp,%rdi), %r11
	movq	136(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 200(%rsp,%rdi)
	movq	208(%rsp,%rdi), %r11
	movq	144(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 208(%rsp,%rdi)
	movl	%edx, %r9d
	movl	932(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	788(%rsp,%r8,4), %r10d
	movq	216(%rsp,%rdi), %r11
	movq	152(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 216(%rsp,%rdi)
	movq	224(%rsp,%rdi), %r11
	movq	160(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 224(%rsp,%rdi)
	movl	%edx, %r9d
	movl	936(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	792(%rsp,%r8,4), %r10d
	movq	232(%rsp,%rdi), %r11
	movq	168(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 232(%rsp,%rdi)
	movq	240(%rsp,%rdi), %r11
	movq	176(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 240(%rsp,%rdi)
	movl	%edx, %r9d
	movl	940(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	796(%rsp,%r8,4), %r10d
	movq	248(%rsp,%rdi), %r11
	movq	184(%rsp), %r8
	cmpl	%r10d, %r9d
	cmovb	%r8, %r11
	movq	%r11, 248(%rsp,%rdi)
	movq	256(%rsp,%rdi), %r11
	movq	192(%rsp), %r8
	cmpl	%r10d, %r9d
	cmovb	%r8, %r11
	movq	%r11, 256(%rsp,%rdi)
	incl	%edx
.Lwots_chains_x4$4:
	cmpl	%esi, %edx
	jb  	.Lwots_chains_x4$5
	incq	%rcx
.Lwots_chains_x4$2:
	cmpq	$9, %rcx
	jb  	.Lwots_chains_x4$3
	movq	96(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	200(%rsp), %rsi
	movq	%rsi, (%rcx)
	movq	208(%rsp), %rsi
	movq	%rsi, 8(%rcx)
	movq	216(%rsp), %rsi
	movq	%rsi, 16(%rcx)
	movq	224(%rsp), %rsi
	movq	%rsi, 24(%rcx)
	movq	232(%rsp), %rsi
	movq	%rsi, 32(%rcx)
	movq	240(%rsp), %rsi
	movq	%rsi, 40(%rcx)
	movq	248(%rsp), %rsi
	movq	%rsi, 48(%rcx)
	movq	256(%rsp), %rsi
	movq	%rsi, 56(%rcx)
	movq	264(%rsp), %rsi
	movq	%rsi, 64(%rcx)
	movq	272(%rsp), %rsi
	movq	%rsi, 72(%rcx)
	movq	280(%rsp), %rsi
	movq	%rsi, 80(%rcx)
	movq	288(%rsp), %rsi
	movq	%rsi, 88(%rcx)
	movq	296(%rsp), %rsi
	movq	%rsi, 96(%rcx)
	movq	304(%rsp), %rsi
	movq	%rsi, 104(%rcx)
	movq	312(%rsp), %rsi
	movq	%rsi, 112(%rcx)
	movq	320(%rsp), %rsi
	movq	%rsi, 120(%rcx)
	movq	328(%rsp), %rsi
	movq	%rsi, 128(%rcx)
	movq	336(%rsp), %rsi
	movq	%rsi, 136(%rcx)
	movq	344(%rsp), %rsi
	movq	%rsi, 144(%rcx)
	movq	352(%rsp), %rsi
	movq	%rsi, 152(%rcx)
	movq	360(%rsp), %rsi
	movq	%rsi, 160(%rcx)
	movq	368(%rsp), %rsi
	movq	%rsi, 168(%rcx)
	movq	376(%rsp), %rsi
	movq	%rsi, 176(%rcx)
	movq	384(%rsp), %rsi
	movq	%rsi, 184(%rcx)
	movq	392(%rsp), %rsi
	movq	%rsi, 192(%rcx)
	movq	400(%rsp), %rsi
	movq	%rsi, 200(%rcx)
	movq	408(%rsp), %rsi
	movq	%rsi, 208(%rcx)
	movq	416(%rsp), %rsi
	movq	%rsi, 216(%rcx)
	movq	424(%rsp), %rsi
	movq	%rsi, 224(%rcx)
	movq	432(%rsp), %rsi
	movq	%rsi, 232(%rcx)
	movq	440(%rsp), %rsi
	movq	%rsi, 240(%rcx)
	movq	448(%rsp), %rsi
	movq	%rsi, 248(%rcx)
	movq	456(%rsp), %rsi
	movq	%rsi, 256(%rcx)
	movq	464(%rsp), %rsi
	movq	%rsi, 264(%rcx)
	movq	472(%rsp), %rsi
	movq	%rsi, 272(%rcx)
	movq	480(%rsp), %rsi
	movq	%rsi, 280(%rcx)
	movq	488(%rsp), %rsi
	movq	%rsi, 288(%rcx)
	movq	496(%rsp), %rsi
	movq	%rsi, 296(%rcx)
	movq	504(%rsp), %rsi
	movq	%rsi, 304(%rcx)
	movq	512(%rsp), %rsi
	movq	%rsi, 312(%rcx)
	movq	520(%rsp), %rsi
	movq	%rsi, 320(%rcx)
	movq	528(%rsp), %rsi
	movq	%rsi, 328(%rcx)
	movq	536(%rsp), %rsi
	movq	%rsi, 336(%rcx)
	movq	544(%rsp), %rsi
	movq	%rsi, 344(%rcx)
	movq	552(%rsp), %rsi
	movq	%rsi, 352(%rcx)
	movq	560(%rsp), %rsi
	movq	%rsi, 360(%rcx)
	movq	568(%rsp), %rsi
	movq	%rsi, 368(%rcx)
	movq	576(%rsp), %rsi
	movq	%rsi, 376(%rcx)
	movq	584(%rsp), %rsi
	movq	%rsi, 384(%rcx)
	movq	592(%rsp), %rsi
	movq	%rsi, 392(%rcx)
	movq	600(%rsp), %rsi
	movq	%rsi, 400(%rcx)
	movq	608(%rsp), %rsi
	movq	%rsi, 408(%rcx)
	movq	616(%rsp), %rsi
	movq	%rsi, 416(%rcx)
	movq	624(%rsp), %rsi
	movq	%rsi, 424(%rcx)
	movq	632(%rsp), %rsi
	movq	%rsi, 432(%rcx)
	movq	640(%rsp), %rsi
	movq	%rsi, 440(%rcx)
	movq	648(%rsp), %rsi
	movq	%rsi, 448(%rcx)
	movq	656(%rsp), %rsi
	movq	%rsi, 456(%rcx)
	movq	664(%rsp), %rsi
	movq	%rsi, 464(%rcx)
	movq	672(%rsp), %rsi
	movq	%rsi, 472(%rcx)
	movq	680(%rsp), %rsi
	movq	%rsi, 480(%rcx)
	movq	688(%rsp), %rsi
	movq	%rsi, 488(%rcx)
	movq	696(%rsp), %rsi
	movq	%rsi, 496(%rcx)
	movq	704(%rsp), %rsi
	movq	%rsi, 504(%rcx)
	movq	712(%rsp), %rsi
	movq	%rsi, 512(%rcx)
	movq	720(%rsp), %rsi
	movq	%rsi, 520(%rcx)
	movq	728(%rsp), %rsi
	movq	%rsi, 528(%rcx)
	movq	736(%rsp), %rsi
	movq	%rsi, 536(%rcx)
	movq	744(%rsp), %rsi
	movq	%rsi, 544(%rcx)
	movq	752(%rsp), %rsi
	movq	%rsi, 552(%rcx)
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
	vpbroadcastq	(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%rcx,%rdx), %rcx
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
	cmpq	$1, %rcx
	jb  	.LT_k$7
	movq	$0, %rax
	movq	$31, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %rax
	vmovq	%rax, %xmm7
	vpbroadcastq	%xmm7, %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rcx
	movq	$0, %rdx
	movq	$0, %rax
	jmp 	.LT_k$3
.LT_k$4:
	call	.L_keccakf1600_avx2$1
.LT_k$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm4, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%rax
.LT_k$3:
	cmpq	$0, %rax
	jb  	.LT_k$4
	call	.L_keccakf1600_avx2$1
.LT_k$2:
	movq	%xmm5, (%rcx,%rdx)
	movq	%xmm4, 8(%rcx,%rdx)
	ret
.LT_len$1:
	movq	%rdx, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdx
	vpbroadcastq	(%rdi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%rdi,%rdx), %rsi
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
	movq	$0, %r10
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
	incq	%r10
.LT_len$6:
	cmpq	$3, %r10
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rdx), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	48(%rcx,%rdx), %xmm9
	vmovdqu	%xmm9, %xmm9
	movq	$0, %rsi
	movq	$31, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %rsi
	vmovq	%rsi, %xmm11
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
	movq	$0, %rdx
	movq	$0, %r10
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm4, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rcx,%rdx)
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
	movq	%xmm5, (%rcx,%rdx)
	movq	%xmm4, 8(%rcx,%rdx)
	ret
.LH$1:
	movq	%rsi, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdx
	vpbroadcastq	(%rdi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%rdi,%rdx), %rsi
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
	movq	$0, %rdx
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vpxor	%ymm9, %ymm9, %ymm9
	vmovdqu	(%rcx,%rdx), %xmm8
	vinserti128	$1, %xmm8, %ymm9, %ymm14
	movq	$0, %rsi
	movq	$31, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %rsi
	vmovq	%rsi, %xmm8
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
	movq	$0, %rdx
	movq	$0, %rax
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm4, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%rax
.LH$3:
	cmpq	$0, %rax
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm5, (%rcx,%rdx)
	movq	%xmm4, 8(%rcx,%rdx)
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
	movq	$0, %rdx
	vpbroadcastq	(%rcx,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%rcx,%rdx), %rcx
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
	vmovdqu	(%rdi,%rdx), %xmm9
	vmovdqu	%xmm9, %xmm9
	movq	$0, %rsi
	movq	$31, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %rsi
	vmovq	%rsi, %xmm11
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
	movq	$0, %rdx
	movq	$0, %rax
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm4, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm9
	vmovdqu	%ymm9, 88(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%rax
.LF$3:
	cmpq	$0, %rax
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm5, (%rcx,%rdx)
	movq	%xmm4, 8(%rcx,%rdx)
	ret
.LPRF$1:
	movq	%rsi, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rdx
	vpbroadcastq	(%rdi,%rdx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	movq	8(%rdi,%rdx), %rcx
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
	vmovdqu	(%rbx,%rdx), %xmm9
	vmovdqu	%xmm9, %xmm9
	movq	$0, %rsi
	movq	$31, %rcx
	shlq	$0, %rcx
	orq 	%rcx, %rsi
	vmovq	%rsi, %xmm11
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
	movq	$0, %rdx
	movq	$0, %rax
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdx)
	vmovdqu	%ymm4, 8(%rcx,%rdx)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm9
	movq	%xmm7, %rsi
	movq	%rsi, 40(%rcx,%rdx)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm8
	vpblendd	$195, %ymm8, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdx)
	movq	%xmm9, %rsi
	movq	%rsi, 80(%rcx,%rdx)
	vpblendd	$195, %ymm12, %ymm8, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rdx)
	movq	%xmm7, %rsi
	movq	%rsi, 120(%rcx,%rdx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdx)
	addq	$136, %rdx
	incq	%rax
.LPRF$3:
	cmpq	$0, %rax
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm5, (%rcx,%rdx)
	movq	%xmm4, 8(%rcx,%rdx)
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
	movq	$0, %rdx
	movq	232(%rsp), %r11
	movq	240(%rsp), %rcx
	lfence
	movq	$0, %rax
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %rdi
	jb  	.LH_msg$13
	movq	%r11, 240(%rsp)
	movq	%rdx, 232(%rsp)
	movq	%rcx, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$14:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %r11
	movq	232(%rsp), %rdx
	movq	264(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	$0, %rdi
.LH_msg$13:
	movb	(%r11,%rdx), %r9b
	incq	%rdx
	xorb	%r9b, 32(%rsp,%rdi)
	incq	%rdi
.LH_msg$11:
	cmpq	%rcx, %rdx
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
	ret
.LT_len_x4$1:
	movq	%rcx, %mm0
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
	movq	(%rdi), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rcx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	8(%rdi), %rcx
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
	movl	24(%r9), %ecx
	bswapl	%ecx
	movl	28(%r9), %edx
	bswapl	%edx
	movl	%ecx, 192(%rsp)
	movl	%edx, 196(%rsp)
	movl	%ecx, 200(%rsp)
	movl	%edx, 204(%rsp)
	movl	%ecx, 208(%rsp)
	movl	%edx, 212(%rsp)
	movl	%ecx, 216(%rsp)
	movl	%edx, 220(%rsp)
	movl	(%rax), %ecx
	bswapl	%ecx
	movl	%ecx, 164(%rsp)
	movl	4(%rax), %ecx
	bswapl	%ecx
	movl	%ecx, 172(%rsp)
	movl	8(%rax), %ecx
	bswapl	%ecx
	movl	%ecx, 180(%rsp)
	movl	12(%rax), %eax
	bswapl	%eax
	movl	%eax, 188(%rsp)
	movq	(%r8), %rcx
	movq	%rcx, 224(%rsp)
	movq	560(%r8), %rcx
	movq	%rcx, 232(%rsp)
	movq	1120(%r8), %rcx
	movq	%rcx, 240(%rsp)
	movq	1680(%r8), %rcx
	movq	%rcx, 248(%rsp)
	movq	8(%r8), %rcx
	movq	%rcx, 256(%rsp)
	movq	568(%r8), %rcx
	movq	%rcx, 264(%rsp)
	movq	1128(%r8), %rcx
	movq	%rcx, 272(%rsp)
	movq	1688(%r8), %rcx
	movq	%rcx, 280(%rsp)
	movq	16(%r8), %rcx
	movq	%rcx, 288(%rsp)
	movq	576(%r8), %rcx
	movq	%rcx, 296(%rsp)
	movq	1136(%r8), %rcx
	movq	%rcx, 304(%rsp)
	movq	1696(%r8), %rcx
	movq	%rcx, 312(%rsp)
	movq	24(%r8), %rcx
	movq	%rcx, 320(%rsp)
	movq	584(%r8), %rcx
	movq	%rcx, 328(%rsp)
	movq	1144(%r8), %rcx
	movq	%rcx, 336(%rsp)
	movq	1704(%r8), %rcx
	movq	%rcx, 344(%rsp)
	movq	32(%r8), %rcx
	movq	%rcx, 352(%rsp)
	movq	592(%r8), %rcx
	movq	%rcx, 360(%rsp)
	movq	1152(%r8), %rcx
	movq	%rcx, 368(%rsp)
	movq	1712(%r8), %rcx
	movq	%rcx, 376(%rsp)
	movq	40(%r8), %rcx
	movq	%rcx, 384(%rsp)
	movq	600(%r8), %rcx
	movq	%rcx, 392(%rsp)
	movq	1160(%r8), %rcx
	movq	%rcx, 400(%rsp)
	movq	1720(%r8), %rcx
	movq	%rcx, 408(%rsp)
	movq	48(%r8), %rcx
	movq	%rcx, 416(%rsp)
	movq	608(%r8), %rcx
	movq	%rcx, 424(%rsp)
	movq	1168(%r8), %rcx
	movq	%rcx, 432(%rsp)
	movq	1728(%r8), %rcx
	movq	%rcx, 440(%rsp)
	movq	56(%r8), %rcx
	movq	%rcx, 448(%rsp)
	movq	616(%r8), %rcx
	movq	%rcx, 456(%rsp)
	movq	1176(%r8), %rcx
	movq	%rcx, 464(%rsp)
	movq	1736(%r8), %rcx
	movq	%rcx, 472(%rsp)
	movq	64(%r8), %rcx
	movq	%rcx, 480(%rsp)
	movq	624(%r8), %rcx
	movq	%rcx, 488(%rsp)
	movq	1184(%r8), %rcx
	movq	%rcx, 496(%rsp)
	movq	1744(%r8), %rcx
	movq	%rcx, 504(%rsp)
	movq	72(%r8), %rcx
	movq	%rcx, 512(%rsp)
	movq	632(%r8), %rcx
	movq	%rcx, 520(%rsp)
	movq	1192(%r8), %rcx
	movq	%rcx, 528(%rsp)
	movq	1752(%r8), %rcx
	movq	%rcx, 536(%rsp)
	movq	80(%r8), %rcx
	movq	%rcx, 544(%rsp)
	movq	640(%r8), %rcx
	movq	%rcx, 552(%rsp)
	movq	1200(%r8), %rcx
	movq	%rcx, 560(%rsp)
	movq	1760(%r8), %rcx
	movq	%rcx, 568(%rsp)
	movq	%r8, %mm1
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.LT_len_x4$6:
	movq	$88, %rax
	movq	$0, %rcx
	jmp 	.LT_len_x4$3
.LT_len_x4$4:
	movq	%mm1, %r8
	lfence
	movq	$0, %rdx
	movq	32(%rsp), %rsi
	movq	(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 32(%rsp)
	movq	40(%rsp), %rsi
	movq	560(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 40(%rsp)
	movq	48(%rsp), %rsi
	movq	1120(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 48(%rsp)
	movq	56(%rsp), %rsi
	movq	1680(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 56(%rsp)
	movq	64(%rsp), %rsi
	movq	8(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 64(%rsp)
	movq	72(%rsp), %rsi
	movq	568(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 72(%rsp)
	movq	80(%rsp), %rsi
	movq	1128(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 80(%rsp)
	movq	88(%rsp), %rsi
	movq	1688(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 88(%rsp)
	movq	96(%rsp), %rsi
	movq	16(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 96(%rsp)
	movq	104(%rsp), %rsi
	movq	576(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 104(%rsp)
	movq	112(%rsp), %rsi
	movq	1136(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 112(%rsp)
	movq	120(%rsp), %rsi
	movq	1696(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 120(%rsp)
	movq	128(%rsp), %rsi
	movq	24(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 128(%rsp)
	movq	136(%rsp), %rsi
	movq	584(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 136(%rsp)
	movq	144(%rsp), %rsi
	movq	1144(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 144(%rsp)
	movq	152(%rsp), %rsi
	movq	1704(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 152(%rsp)
	movq	160(%rsp), %rsi
	movq	32(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 160(%rsp)
	movq	168(%rsp), %rsi
	movq	592(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 168(%rsp)
	movq	176(%rsp), %rsi
	movq	1152(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 176(%rsp)
	movq	184(%rsp), %rsi
	movq	1712(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 184(%rsp)
	movq	192(%rsp), %rsi
	movq	40(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 192(%rsp)
	movq	200(%rsp), %rsi
	movq	600(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 200(%rsp)
	movq	208(%rsp), %rsi
	movq	1160(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 208(%rsp)
	movq	216(%rsp), %rsi
	movq	1720(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 216(%rsp)
	movq	224(%rsp), %rsi
	movq	48(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 224(%rsp)
	movq	232(%rsp), %rsi
	movq	608(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 232(%rsp)
	movq	240(%rsp), %rsi
	movq	1168(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 240(%rsp)
	movq	248(%rsp), %rsi
	movq	1728(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 248(%rsp)
	movq	256(%rsp), %rsi
	movq	56(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 256(%rsp)
	movq	264(%rsp), %rsi
	movq	616(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 264(%rsp)
	movq	272(%rsp), %rsi
	movq	1176(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 272(%rsp)
	movq	280(%rsp), %rsi
	movq	1736(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 280(%rsp)
	movq	288(%rsp), %rsi
	movq	64(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 288(%rsp)
	movq	296(%rsp), %rsi
	movq	624(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 296(%rsp)
	movq	304(%rsp), %rsi
	movq	1184(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 304(%rsp)
	movq	312(%rsp), %rsi
	movq	1744(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 312(%rsp)
	movq	320(%rsp), %rsi
	movq	72(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 320(%rsp)
	movq	328(%rsp), %rsi
	movq	632(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 328(%rsp)
	movq	336(%rsp), %rsi
	movq	1192(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 336(%rsp)
	movq	344(%rsp), %rsi
	movq	1752(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 344(%rsp)
	movq	352(%rsp), %rsi
	movq	80(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 352(%rsp)
	movq	360(%rsp), %rsi
	movq	640(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 360(%rsp)
	movq	368(%rsp), %rsi
	movq	1200(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 368(%rsp)
	movq	376(%rsp), %rsi
	movq	1760(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 376(%rsp)
	movq	384(%rsp), %rsi
	movq	88(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 384(%rsp)
	movq	392(%rsp), %rsi
	movq	648(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 392(%rsp)
	movq	400(%rsp), %rsi
	movq	1208(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 400(%rsp)
	movq	408(%rsp), %rsi
	movq	1768(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 408(%rsp)
	movq	416(%rsp), %rsi
	movq	96(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 416(%rsp)
	movq	424(%rsp), %rsi
	movq	656(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 424(%rsp)
	movq	432(%rsp), %rsi
	movq	1216(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 432(%rsp)
	movq	440(%rsp), %rsi
	movq	1776(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 440(%rsp)
	movq	448(%rsp), %rsi
	movq	104(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 448(%rsp)
	movq	456(%rsp), %rsi
	movq	664(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 456(%rsp)
	movq	464(%rsp), %rsi
	movq	1224(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 464(%rsp)
	movq	472(%rsp), %rsi
	movq	1784(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 472(%rsp)
	movq	480(%rsp), %rsi
	movq	112(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 480(%rsp)
	movq	488(%rsp), %rsi
	movq	672(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 488(%rsp)
	movq	496(%rsp), %rsi
	movq	1232(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 496(%rsp)
	movq	504(%rsp), %rsi
	movq	1792(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 504(%rsp)
	movq	512(%rsp), %rsi
	movq	120(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 512(%rsp)
	movq	520(%rsp), %rsi
	movq	680(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 520(%rsp)
	movq	528(%rsp), %rsi
	movq	1240(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 528(%rsp)
	movq	536(%rsp), %rsi
	movq	1800(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 536(%rsp)
	movq	544(%rsp), %rsi
	movq	128(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 544(%rsp)
	movq	552(%rsp), %rsi
	movq	688(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 552(%rsp)
	movq	560(%rsp), %rsi
	movq	1248(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 560(%rsp)
	movq	568(%rsp), %rsi
	movq	1808(%r8,%rax), %r11
	xorq	%r11, %rsi
	movq	%rsi, 568(%rsp)
	movq	%rax, 832(%rsp)
	movq	%rcx, 840(%rsp)
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.LT_len_x4$5:
	movq	832(%rsp), %rax
	movq	840(%rsp), %rcx
	lfence
	movq	$0, %rdx
	addq	$136, %rax
	incq	%rcx
.LT_len_x4$3:
	cmpq	$3, %rcx
	jb  	.LT_len_x4$4
	movq	%mm1, %r8
	lfence
	movq	$0, %rax
	movq	32(%rsp), %rcx
	movq	496(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 32(%rsp)
	movq	40(%rsp), %rcx
	movq	1056(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 40(%rsp)
	movq	48(%rsp), %rcx
	movq	1616(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 48(%rsp)
	movq	56(%rsp), %rcx
	movq	2176(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 56(%rsp)
	movq	64(%rsp), %rcx
	movq	504(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 64(%rsp)
	movq	72(%rsp), %rcx
	movq	1064(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 72(%rsp)
	movq	80(%rsp), %rcx
	movq	1624(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 80(%rsp)
	movq	88(%rsp), %rcx
	movq	2184(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 88(%rsp)
	movq	96(%rsp), %rcx
	movq	512(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 96(%rsp)
	movq	104(%rsp), %rcx
	movq	1072(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 104(%rsp)
	movq	112(%rsp), %rcx
	movq	1632(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 112(%rsp)
	movq	120(%rsp), %rcx
	movq	2192(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 120(%rsp)
	movq	128(%rsp), %rcx
	movq	520(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 128(%rsp)
	movq	136(%rsp), %rcx
	movq	1080(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 136(%rsp)
	movq	144(%rsp), %rcx
	movq	1640(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 144(%rsp)
	movq	152(%rsp), %rcx
	movq	2200(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 152(%rsp)
	movq	160(%rsp), %rcx
	movq	528(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 160(%rsp)
	movq	168(%rsp), %rcx
	movq	1088(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 168(%rsp)
	movq	176(%rsp), %rcx
	movq	1648(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 176(%rsp)
	movq	184(%rsp), %rcx
	movq	2208(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 184(%rsp)
	movq	192(%rsp), %rcx
	movq	536(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 192(%rsp)
	movq	200(%rsp), %rcx
	movq	1096(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 200(%rsp)
	movq	208(%rsp), %rcx
	movq	1656(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 208(%rsp)
	movq	216(%rsp), %rcx
	movq	2216(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 216(%rsp)
	movq	224(%rsp), %rcx
	movq	544(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 224(%rsp)
	movq	232(%rsp), %rcx
	movq	1104(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 232(%rsp)
	movq	240(%rsp), %rcx
	movq	1664(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 240(%rsp)
	movq	248(%rsp), %rcx
	movq	2224(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 248(%rsp)
	movq	256(%rsp), %rcx
	movq	552(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 256(%rsp)
	movq	264(%rsp), %rcx
	movq	1112(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 264(%rsp)
	movq	272(%rsp), %rcx
	movq	1672(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 272(%rsp)
	movq	280(%rsp), %rcx
	movq	2232(%r8), %rsi
	xorq	%rsi, %rcx
	movq	%rcx, 280(%rsp)
	movq	$-9223372036854775808, %rcx
	movq	288(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 288(%rsp)
	movq	544(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 544(%rsp)
	movq	296(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 296(%rsp)
	movq	552(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 552(%rsp)
	movq	304(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 304(%rsp)
	movq	560(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 560(%rsp)
	movq	312(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 312(%rsp)
	movq	568(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 568(%rsp)
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.LT_len_x4$2:
	movq	%mm0, %rcx
	lfence
	movq	$0, %rax
	movq	32(%rsp), %rsi
	movq	%rsi, (%rcx)
	movq	64(%rsp), %rsi
	movq	%rsi, 8(%rcx)
	movq	40(%rsp), %rsi
	movq	%rsi, 16(%rcx)
	movq	72(%rsp), %rsi
	movq	%rsi, 24(%rcx)
	movq	48(%rsp), %rsi
	movq	%rsi, 32(%rcx)
	movq	80(%rsp), %rsi
	movq	%rsi, 40(%rcx)
	movq	56(%rsp), %rsi
	movq	%rsi, 48(%rcx)
	movq	88(%rsp), %rsi
	movq	%rsi, 56(%rcx)
	ret
.Lthash_x4_2n__thash_x4$1:
	movq	%rcx, %mm0
	vpbroadcastq	(%rdi), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vpbroadcastq	8(%rdi), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	vmovdqu	(%r9), %ymm0
	vpshufb	glob_data + 128(%rip), %ymm0, %ymm0
	vpermq	$0, %ymm0, %ymm1
	vmovdqu	%ymm1, 96(%rsp)
	vpermq	$85, %ymm0, %ymm1
	vmovdqu	%ymm1, 128(%rsp)
	vpermq	$170, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rsp)
	vmovdqu	(%rax), %ymm0
	vpshufb	glob_data + 128(%rip), %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rsp)
	movq	(%r8), %rcx
	vmovq	%rcx, %xmm0
	movq	32(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm0, %xmm0
	movq	64(%r8), %rcx
	vmovq	%rcx, %xmm1
	movq	96(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm1, %xmm1
	vmovdqu	%xmm0, %xmm0
	vinserti128	$1, %xmm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rsp)
	movq	8(%r8), %rcx
	vmovq	%rcx, %xmm0
	movq	40(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm0, %xmm0
	movq	72(%r8), %rcx
	vmovq	%rcx, %xmm1
	movq	104(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm1, %xmm1
	vmovdqu	%xmm0, %xmm0
	vinserti128	$1, %xmm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rsp)
	movq	16(%r8), %rcx
	vmovq	%rcx, %xmm0
	movq	48(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm0, %xmm0
	movq	80(%r8), %rcx
	vmovq	%rcx, %xmm1
	movq	112(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm1, %xmm1
	vmovdqu	%xmm0, %xmm0
	vinserti128	$1, %xmm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 288(%rsp)
	movq	24(%r8), %rcx
	vmovq	%rcx, %xmm0
	movq	56(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm0, %xmm0
	movq	88(%r8), %rcx
	vmovq	%rcx, %xmm1
	movq	120(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm1, %xmm1
	vmovdqu	%xmm0, %xmm0
	vinserti128	$1, %xmm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rsp)
	vmovdqu	glob_data + 64(%rip), %ymm0
	vmovdqu	%ymm0, 352(%rsp)
	vmovdqu	glob_data + 32(%rip), %ymm0
	vmovdqu	%ymm0, 544(%rsp)
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, 384(%rsp)
	vmovdqu	%ymm0, 416(%rsp)
	vmovdqu	%ymm0, 448(%rsp)
	vmovdqu	%ymm0, 480(%rsp)
	vmovdqu	%ymm0, 512(%rsp)
	vmovdqu	%ymm0, 576(%rsp)
	vmovdqu	%ymm0, 608(%rsp)
	vmovdqu	%ymm0, 640(%rsp)
	vmovdqu	%ymm0, 672(%rsp)
	vmovdqu	%ymm0, 704(%rsp)
	vmovdqu	%ymm0, 736(%rsp)
	vmovdqu	%ymm0, 768(%rsp)
	vmovdqu	%ymm0, 800(%rsp)
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.Lthash_x4_2n__thash_x4$2:
	movq	%mm0, %rcx
	movq	32(%rsp), %rsi
	movq	%rsi, (%rcx)
	movq	64(%rsp), %rsi
	movq	%rsi, 8(%rcx)
	movq	40(%rsp), %rsi
	movq	%rsi, 16(%rcx)
	movq	72(%rsp), %rsi
	movq	%rsi, 24(%rcx)
	movq	48(%rsp), %rsi
	movq	%rsi, 32(%rcx)
	movq	80(%rsp), %rsi
	movq	%rsi, 40(%rcx)
	movq	56(%rsp), %rsi
	movq	%rsi, 48(%rcx)
	movq	88(%rsp), %rsi
	movq	%rsi, 56(%rcx)
	ret
.Lthash_x4_n_kp__thash_x4$1:
	movq	%rcx, %mm1
	vpbroadcastq	(%rdi), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vpbroadcastq	8(%rdi), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	vmovdqu	(%r9), %ymm0
	vpshufb	glob_data + 288(%rip), %ymm0, %ymm0
	vpermq	$0, %ymm0, %ymm1
	vmovdqu	%ymm1, 96(%rsp)
	vpermq	$85, %ymm0, %ymm1
	vmovdqu	%ymm1, 128(%rsp)
	vpermq	$170, %ymm0, %ymm0
	vbroadcasti128	32(%rdx), %ymm1
	vpshufb	glob_data + 256(%rip), %ymm1, %ymm1
	vpblendd	$170, %ymm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rsp)
	vmovdqu	(%rdx), %ymm0
	vpshufb	glob_data + 288(%rip), %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rsp)
	movq	(%rax), %rcx
	vmovq	%rcx, %xmm0
	movq	16(%rax), %rcx
	vpinsrq	$1, %rcx, %xmm0, %xmm0
	movq	32(%rax), %rcx
	vmovq	%rcx, %xmm1
	movq	48(%rax), %rcx
	vpinsrq	$1, %rcx, %xmm1, %xmm1
	vmovdqu	%xmm0, %xmm0
	vinserti128	$1, %xmm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rsp)
	movq	8(%rax), %rcx
	vmovq	%rcx, %xmm0
	movq	24(%rax), %rcx
	vpinsrq	$1, %rcx, %xmm0, %xmm0
	movq	40(%rax), %rcx
	vmovq	%rcx, %xmm1
	movq	56(%rax), %rcx
	vpinsrq	$1, %rcx, %xmm1, %xmm1
	vmovdqu	%xmm0, %xmm0
	vinserti128	$1, %xmm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rsp)
	vmovdqu	glob_data + 224(%rip), %ymm0
	vmovdqu	%ymm0, 288(%rsp)
	vmovdqu	glob_data + 192(%rip), %ymm0
	vmovdqu	%ymm0, 544(%rsp)
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rsp)
	vmovdqu	%ymm0, 352(%rsp)
	vmovdqu	%ymm0, 384(%rsp)
	vmovdqu	%ymm0, 416(%rsp)
	vmovdqu	%ymm0, 448(%rsp)
	vmovdqu	%ymm0, 480(%rsp)
	vmovdqu	%ymm0, 512(%rsp)
	vmovdqu	%ymm0, 576(%rsp)
	vmovdqu	%ymm0, 608(%rsp)
	vmovdqu	%ymm0, 640(%rsp)
	vmovdqu	%ymm0, 672(%rsp)
	vmovdqu	%ymm0, 704(%rsp)
	vmovdqu	%ymm0, 736(%rsp)
	vmovdqu	%ymm0, 768(%rsp)
	vmovdqu	%ymm0, 800(%rsp)
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.Lthash_x4_n_kp__thash_x4$2:
	movq	%mm1, %rcx
	movq	32(%rsp), %rsi
	movq	%rsi, (%rcx)
	movq	64(%rsp), %rsi
	movq	%rsi, 8(%rcx)
	movq	40(%rsp), %rsi
	movq	%rsi, 16(%rcx)
	movq	72(%rsp), %rsi
	movq	%rsi, 24(%rcx)
	movq	48(%rsp), %rsi
	movq	%rsi, 32(%rcx)
	movq	80(%rsp), %rsi
	movq	%rsi, 40(%rcx)
	movq	56(%rsp), %rsi
	movq	%rsi, 48(%rcx)
	movq	88(%rsp), %rsi
	movq	%rsi, 56(%rcx)
	ret
.Lthash_x4_n__thash_x4$1:
	movq	%rcx, %mm1
	vpbroadcastq	(%rdi), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vpbroadcastq	8(%rdi), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	vmovdqu	(%r9), %ymm0
	vpshufb	glob_data + 448(%rip), %ymm0, %ymm0
	vpermq	$0, %ymm0, %ymm1
	vmovdqu	%ymm1, 96(%rsp)
	vpermq	$85, %ymm0, %ymm1
	vmovdqu	%ymm1, 128(%rsp)
	vpermq	$170, %ymm0, %ymm0
	vmovdqu	%ymm0, 160(%rsp)
	vmovdqu	(%rdx), %ymm0
	vpshufb	glob_data + 448(%rip), %ymm0, %ymm0
	vmovdqu	%ymm0, 192(%rsp)
	movq	(%r8), %rcx
	vmovq	%rcx, %xmm0
	movq	16(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm0, %xmm0
	movq	32(%r8), %rcx
	vmovq	%rcx, %xmm1
	movq	48(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm1, %xmm1
	vmovdqu	%xmm0, %xmm0
	vinserti128	$1, %xmm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 224(%rsp)
	movq	8(%r8), %rcx
	vmovq	%rcx, %xmm0
	movq	24(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm0, %xmm0
	movq	40(%r8), %rcx
	vmovq	%rcx, %xmm1
	movq	56(%r8), %rcx
	vpinsrq	$1, %rcx, %xmm1, %xmm1
	vmovdqu	%xmm0, %xmm0
	vinserti128	$1, %xmm1, %ymm0, %ymm0
	vmovdqu	%ymm0, 256(%rsp)
	vmovdqu	glob_data + 384(%rip), %ymm0
	vmovdqu	%ymm0, 288(%rsp)
	vmovdqu	glob_data + 352(%rip), %ymm0
	vmovdqu	%ymm0, 544(%rsp)
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, 320(%rsp)
	vmovdqu	%ymm0, 352(%rsp)
	vmovdqu	%ymm0, 384(%rsp)
	vmovdqu	%ymm0, 416(%rsp)
	vmovdqu	%ymm0, 448(%rsp)
	vmovdqu	%ymm0, 480(%rsp)
	vmovdqu	%ymm0, 512(%rsp)
	vmovdqu	%ymm0, 576(%rsp)
	vmovdqu	%ymm0, 608(%rsp)
	vmovdqu	%ymm0, 640(%rsp)
	vmovdqu	%ymm0, 672(%rsp)
	vmovdqu	%ymm0, 704(%rsp)
	vmovdqu	%ymm0, 736(%rsp)
	vmovdqu	%ymm0, 768(%rsp)
	vmovdqu	%ymm0, 800(%rsp)
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.Lthash_x4_n__thash_x4$2:
	movq	%mm1, %rcx
	movq	32(%rsp), %rsi
	movq	%rsi, (%rcx)
	movq	64(%rsp), %rsi
	movq	%rsi, 8(%rcx)
	movq	40(%rsp), %rsi
	movq	%rsi, 16(%rcx)
	movq	72(%rsp), %rsi
	movq	%rsi, 24(%rcx)
	movq	48(%rsp), %rsi
	movq	%rsi, 32(%rcx)
	movq	80(%rsp), %rsi
	movq	%rsi, 40(%rcx)
	movq	56(%rsp), %rsi
	movq	%rsi, 48(%rcx)
	movq	88(%rsp), %rsi
	movq	%rsi, 56(%rcx)
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
	leaq	glob_data + 480(%rip), %rdx
	leaq	glob_data + 512(%rip), %rsi
	leaq	glob_data + 928(%rip), %rdi
	movq	$0, %r10
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
	vpbroadcastq	(%rdi,%r10,8), %ymm0
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
	incq	%r10
	cmpq	$24, %r10
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
	leaq	glob_data + 928(%rip), %rsi
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
	vpsllvq	glob_data + 736(%rip), %ymm6, %ymm7
	vpsrlvq	glob_data + 544(%rip), %ymm6, %ymm6
	vpor	%ymm7, %ymm6, %ymm6
	vpxor	%ymm10, %ymm0, %ymm0
	vpsllvq	glob_data + 800(%rip), %ymm0, %ymm7
	vpsrlvq	glob_data + 608(%rip), %ymm0, %ymm0
	vpor	%ymm7, %ymm0, %ymm0
	vpxor	%ymm10, %ymm2, %ymm2
	vpsllvq	glob_data + 832(%rip), %ymm2, %ymm7
	vpsrlvq	glob_data + 640(%rip), %ymm2, %ymm2
	vpor	%ymm7, %ymm2, %ymm9
	vpxor	%ymm10, %ymm1, %ymm1
	vpsllvq	glob_data + 864(%rip), %ymm1, %ymm2
	vpsrlvq	glob_data + 672(%rip), %ymm1, %ymm1
	vpor	%ymm2, %ymm1, %ymm1
	vpxor	%ymm10, %ymm3, %ymm3
	vpermq	$141, %ymm6, %ymm2
	vpermq	$141, %ymm0, %ymm7
	vpsllvq	glob_data + 896(%rip), %ymm3, %ymm0
	vpsrlvq	glob_data + 704(%rip), %ymm3, %ymm8
	vpor	%ymm0, %ymm8, %ymm8
	vpxor	%ymm10, %ymm4, %ymm11
	vpermq	$27, %ymm9, %ymm4
	vpermq	$114, %ymm1, %ymm9
	vpsllvq	glob_data + 768(%rip), %ymm11, %ymm0
	vpsrlvq	glob_data + 576(%rip), %ymm11, %ymm10
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
	leaq	glob_data + 928(%rip), %rbp
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
	leaq	glob_data + 928(%rip), %r14
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
G$thash_x4_2n__THASH_X4_PAD_9F:
	.byte	 31,   0,   0,   0,   0,   0,   0, 128,  31,   0,   0,   0,   0,   0,   0, 128
	.byte	 31,   0,   0,   0,   0,   0,   0, 128,  31,   0,   0,   0,   0,   0,   0, 128
G$thash_x4_2n__THASH_X4_PAD_80:
	.byte	  0,   0,   0,   0,   0,   0,   0, 128,   0,   0,   0,   0,   0,   0,   0, 128
	.byte	  0,   0,   0,   0,   0,   0,   0, 128,   0,   0,   0,   0,   0,   0,   0, 128
G$thash_x4_2n__THASH_X4_PAD_1F:
	.byte	 31,   0,   0,   0,   0,   0,   0,   0,  31,   0,   0,   0,   0,   0,   0,   0
	.byte	 31,   0,   0,   0,   0,   0,   0,   0,  31,   0,   0,   0,   0,   0,   0,   0
G$thash_x4_2n__THASH_X4_KP:
	.byte	128, 128, 128, 128,   3,   2,   1,   0, 128, 128, 128, 128,   7,   6,   5,   4
	.byte	128, 128, 128, 128,  11,  10,   9,   8, 128, 128, 128, 128,  15,  14,  13,  12
G$thash_x4_2n__THASH_X4_BSWAP32:
	.byte	  3,   2,   1,   0,   7,   6,   5,   4,  11,  10,   9,   8,  15,  14,  13,  12
	.byte	  3,   2,   1,   0,   7,   6,   5,   4,  11,  10,   9,   8,  15,  14,  13,  12
G$thash_x4_n_kp__THASH_X4_PAD_9F:
	.byte	 31,   0,   0,   0,   0,   0,   0, 128,  31,   0,   0,   0,   0,   0,   0, 128
	.byte	 31,   0,   0,   0,   0,   0,   0, 128,  31,   0,   0,   0,   0,   0,   0, 128
G$thash_x4_n_kp__THASH_X4_PAD_80:
	.byte	  0,   0,   0,   0,   0,   0,   0, 128,   0,   0,   0,   0,   0,   0,   0, 128
	.byte	  0,   0,   0,   0,   0,   0,   0, 128,   0,   0,   0,   0,   0,   0,   0, 128
G$thash_x4_n_kp__THASH_X4_PAD_1F:
	.byte	 31,   0,   0,   0,   0,   0,   0,   0,  31,   0,   0,   0,   0,   0,   0,   0
	.byte	 31,   0,   0,   0,   0,   0,   0,   0,  31,   0,   0,   0,   0,   0,   0,   0
G$thash_x4_n_kp__THASH_X4_KP:
	.byte	128, 128, 128, 128,   3,   2,   1,   0, 128, 128, 128, 128,   7,   6,   5,   4
	.byte	128, 128, 128, 128,  11,  10,   9,   8, 128, 128, 128, 128,  15,  14,  13,  12
G$thash_x4_n_kp__THASH_X4_BSWAP32:
	.byte	  3,   2,   1,   0,   7,   6,   5,   4,  11,  10,   9,   8,  15,  14,  13,  12
	.byte	  3,   2,   1,   0,   7,   6,   5,   4,  11,  10,   9,   8,  15,  14,  13,  12
G$thash_x4_n__THASH_X4_PAD_9F:
	.byte	 31,   0,   0,   0,   0,   0,   0, 128,  31,   0,   0,   0,   0,   0,   0, 128
	.byte	 31,   0,   0,   0,   0,   0,   0, 128,  31,   0,   0,   0,   0,   0,   0, 128
G$thash_x4_n__THASH_X4_PAD_80:
	.byte	  0,   0,   0,   0,   0,   0,   0, 128,   0,   0,   0,   0,   0,   0,   0, 128
	.byte	  0,   0,   0,   0,   0,   0,   0, 128,   0,   0,   0,   0,   0,   0,   0, 128
G$thash_x4_n__THASH_X4_PAD_1F:
	.byte	 31,   0,   0,   0,   0,   0,   0,   0,  31,   0,   0,   0,   0,   0,   0,   0
	.byte	 31,   0,   0,   0,   0,   0,   0,   0,  31,   0,   0,   0,   0,   0,   0,   0
G$thash_x4_n__THASH_X4_KP:
	.byte	128, 128, 128, 128,   3,   2,   1,   0, 128, 128, 128, 128,   7,   6,   5,   4
	.byte	128, 128, 128, 128,  11,  10,   9,   8, 128, 128, 128, 128,  15,  14,  13,  12
G$thash_x4_n__THASH_X4_BSWAP32:
	.byte	  3,   2,   1,   0,   7,   6,   5,   4,  11,  10,   9,   8,  15,  14,  13,  12
	.byte	  3,   2,   1,   0,   7,   6,   5,   4,  11,  10,   9,   8,  15,  14,  13,  12
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
