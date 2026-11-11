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
	lfence
	movq	$0, %rax
	movq	(%rsi), %rax
	movq	8(%rsi), %rsi
	movq	%rcx, %r9
	lfence
	movq	$0, %rcx
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
	lfence
	movq	$0, %rax
	movq	(%rdx), %rax
	movq	8(%rdx), %rdx
	movq	%rcx, %r10
	lfence
	movq	$0, %rcx
	cmpq	$255, %rdx
	jbe 	.Lslh_dsa_shake256f_sign$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake256f_sign$2
.Lslh_dsa_shake256f_sign$1:
	movq	%rdx, %rcx
	movq	%r10, %rdx
	leaq	-216(%rsp), %rsp
	call	.Lslh_sign_internal_$1
.Lslh_dsa_shake256f_sign$3:
	leaq	216(%rsp), %rsp
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
	lfence
	movq	$0, %rcx
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
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_verify_internal_$4:
	leaq	280(%rsp), %rsp
// declassify_mem 49 [RSP + 136]
	movq	64(%rsp), %rsi
	movq	72(%rsp), %rax
	movq	80(%rsp), %rdi
	lfence
	movq	$0, %rcx
	leaq	136(%rsp), %rcx
	leaq	176(%rsp), %rdx
	leaq	184(%rsp), %r8
	movl	$0, 124(%rsp)
	movl	$0, 128(%rsp)
	movl	$0, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	(%rdx), %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	1(%rdx), %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	2(%rdx), %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	3(%rdx), %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	4(%rdx), %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	5(%rdx), %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	6(%rdx), %r9d
	orl 	%r9d, 132(%rsp)
	shll	$8, 124(%rsp)
	movl	128(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 128(%rsp)
	movl	132(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 128(%rsp)
	shll	$8, 132(%rsp)
	movzbl	7(%rdx), %r9d
	orl 	%r9d, 132(%rsp)
	movl	$0, 124(%rsp)
	andl	$-1, 128(%rsp)
	movl	$0, %edx
	shll	$8, %edx
	movzbl	(%r8), %r9d
	orl 	%r9d, %edx
	andl	$15, %edx
	leaq	88(%rsp), %r10
	movl	124(%rsp), %r8d
	movl	%r8d, 4(%r10)
	movl	128(%rsp), %r8d
	movl	%r8d, 8(%r10)
	movl	132(%rsp), %r8d
	movl	%r8d, 12(%r10)
	leaq	88(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$3, 16(%r10)
	leaq	88(%rsp), %r10
	movl	%edx, 20(%r10)
	leaq	32(%rdi), %r8
	movq	%rsi, 80(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rdi, 64(%rsp)
	movl	%edx, 120(%rsp)
	leaq	32(%rsp), %rax
	leaq	88(%rsp), %r10
	movq	%rax, %rdx
	movq	%rcx, %rax
	movq	%rsi, %r9
	leaq	-1496(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	1496(%rsp), %rsp
	movq	80(%rsp), %rsi
	movq	72(%rsp), %r10
	movq	64(%rsp), %rdi
	movl	120(%rsp), %edx
	lfence
	movq	$0, %rax
	leaq	32(%rsp), %rax
	leaq	11232(%rdi), %rcx
	leaq	124(%rsp), %rdi
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
	movq	%rax, 64(%rsp)
	movq	%rcx, 72(%rsp)
	movq	%rdx, 80(%rsp)
	movq	%r8, 88(%rsp)
	leaq	32(%rsi), %r10
	movq	%rdi, %r11
	movq	%rdi, 96(%rsp)
	movq	%rsi, 104(%rsp)
	leaq	-280(%rsp), %rsp
	call	.LPRF_msg$1
.Lslh_sign_internal_$6:
	leaq	280(%rsp), %rsp
	movq	%rcx, %r8
	movq	96(%rsp), %rdi
	movq	104(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	64(%rsp), %r11
	movq	72(%rsp), %rcx
	movq	80(%rsp), %rdx
	movq	88(%rsp), %rsi
	lfence
	movq	$0, %r9
	leaq	64(%rax), %r9
	leaq	96(%rax), %r10
// declassify_mem 32 [R9]
	movq	%r9, 88(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%rax, 72(%rsp)
	leaq	160(%rsp), %rdi
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_sign_internal_$5:
	leaq	280(%rsp), %rsp
// declassify_mem 49 [RSP + 160]
	movq	88(%rsp), %rsi
	movq	80(%rsp), %rdi
	movq	72(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	160(%rsp), %rcx
	leaq	200(%rsp), %rdx
	leaq	208(%rsp), %r8
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
	movzbl	(%rdx), %r9d
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
	movzbl	1(%rdx), %r9d
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
	movzbl	2(%rdx), %r9d
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
	movzbl	3(%rdx), %r9d
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
	movzbl	4(%rdx), %r9d
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
	movzbl	5(%rdx), %r9d
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
	movzbl	6(%rdx), %r9d
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
	movzbl	7(%rdx), %r9d
	orl 	%r9d, 156(%rsp)
	movl	$0, 148(%rsp)
	andl	$-1, 152(%rsp)
	movl	$0, %edx
	shll	$8, %edx
	movzbl	(%r8), %r9d
	orl 	%r9d, %edx
	andl	$15, %edx
	leaq	112(%rsp), %r10
	movl	148(%rsp), %r8d
	movl	%r8d, 4(%r10)
	movl	152(%rsp), %r8d
	movl	%r8d, 8(%r10)
	movl	156(%rsp), %r8d
	movl	%r8d, 12(%r10)
	leaq	112(%rsp), %r10
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$3, 16(%r10)
	leaq	112(%rsp), %r10
	movl	%edx, 20(%r10)
	movq	%rax, %r11
	leaq	32(%rdi), %r9
	movq	%r11, 72(%rsp)
	movq	%rsi, 80(%rsp)
	movq	%rdi, 88(%rsp)
	movq	%rcx, 64(%rsp)
	movl	%edx, 144(%rsp)
	leaq	112(%rsp), %r10
	movq	%rcx, %rax
	leaq	-216(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	216(%rsp), %rsp
	movq	%r9, %r8
// declassify_mem 11200 [R8]
	movq	72(%rsp), %r11
	movq	80(%rsp), %r9
	movq	88(%rsp), %rdi
	movq	64(%rsp), %rax
	movl	144(%rsp), %edx
	lfence
	movq	$0, %rcx
	movq	%r11, 64(%rsp)
	movq	%r9, 88(%rsp)
	movq	%rdi, 80(%rsp)
	movl	%edx, 144(%rsp)
	leaq	32(%rsp), %rcx
	leaq	112(%rsp), %r10
	movq	%rcx, %rdx
	leaq	-1496(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	1496(%rsp), %rsp
	movq	64(%rsp), %r11
	movq	88(%rsp), %rsi
	movq	80(%rsp), %rdi
	movl	144(%rsp), %edx
	lfence
	movq	$0, %rax
	leaq	11232(%rdi), %rcx
	movq	%rdi, 80(%rsp)
	leaq	32(%rsp), %rax
	leaq	148(%rsp), %rdi
	leaq	-152(%rsp), %rsp
	call	.Lht_sign$1
.Lslh_sign_internal_$2:
	leaq	152(%rsp), %rsp
	movq	80(%rsp), %rdi
	lfence
	movq	$0, %rax
// declassify_mem 49856 [RDI]
	movq	$0, %rax
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
	movl	$4, %ecx
	leaq	96(%rsi), %rax
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %r10
	movq	%r9, %rsi
	leaq	-1144(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	1144(%rsp), %rsp
	movq	%rcx, %rax
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	lfence
	movq	$0, %rcx
	leaq	32(%rdi), %r11
	movq	(%rax), %rdx
	movq	%rdx, (%r11)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%r11)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%r11)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%r11)
// declassify_mem 64 [RDI]
	ret
.Lfors_pkfromsig$1:
	movq	%rdx, 1280(%rsp)
	leaq	1344(%rsp), %rdx
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lfors_pkfromsig$79
.Lfors_pkfromsig$80:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, (%rdx)
	jmp 	.Lfors_pkfromsig$77
.Lfors_pkfromsig$78:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 4(%rdx)
	jmp 	.Lfors_pkfromsig$75
.Lfors_pkfromsig$76:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 8(%rdx)
	jmp 	.Lfors_pkfromsig$73
.Lfors_pkfromsig$74:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 12(%rdx)
	jmp 	.Lfors_pkfromsig$71
.Lfors_pkfromsig$72:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 16(%rdx)
	jmp 	.Lfors_pkfromsig$69
.Lfors_pkfromsig$70:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 20(%rdx)
	jmp 	.Lfors_pkfromsig$67
.Lfors_pkfromsig$68:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 24(%rdx)
	jmp 	.Lfors_pkfromsig$65
.Lfors_pkfromsig$66:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 28(%rdx)
	jmp 	.Lfors_pkfromsig$63
.Lfors_pkfromsig$64:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 32(%rdx)
	jmp 	.Lfors_pkfromsig$61
.Lfors_pkfromsig$62:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 36(%rdx)
	jmp 	.Lfors_pkfromsig$59
.Lfors_pkfromsig$60:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 40(%rdx)
	jmp 	.Lfors_pkfromsig$57
.Lfors_pkfromsig$58:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 44(%rdx)
	jmp 	.Lfors_pkfromsig$55
.Lfors_pkfromsig$56:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 48(%rdx)
	jmp 	.Lfors_pkfromsig$53
.Lfors_pkfromsig$54:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 52(%rdx)
	jmp 	.Lfors_pkfromsig$51
.Lfors_pkfromsig$52:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 56(%rdx)
	jmp 	.Lfors_pkfromsig$49
.Lfors_pkfromsig$50:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 60(%rdx)
	jmp 	.Lfors_pkfromsig$47
.Lfors_pkfromsig$48:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 64(%rdx)
	jmp 	.Lfors_pkfromsig$45
.Lfors_pkfromsig$46:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 68(%rdx)
	jmp 	.Lfors_pkfromsig$43
.Lfors_pkfromsig$44:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 72(%rdx)
	jmp 	.Lfors_pkfromsig$41
.Lfors_pkfromsig$42:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 76(%rdx)
	jmp 	.Lfors_pkfromsig$39
.Lfors_pkfromsig$40:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 80(%rdx)
	jmp 	.Lfors_pkfromsig$37
.Lfors_pkfromsig$38:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 84(%rdx)
	jmp 	.Lfors_pkfromsig$35
.Lfors_pkfromsig$36:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 88(%rdx)
	jmp 	.Lfors_pkfromsig$33
.Lfors_pkfromsig$34:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 92(%rdx)
	jmp 	.Lfors_pkfromsig$31
.Lfors_pkfromsig$32:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 96(%rdx)
	jmp 	.Lfors_pkfromsig$29
.Lfors_pkfromsig$30:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 100(%rdx)
	jmp 	.Lfors_pkfromsig$27
.Lfors_pkfromsig$28:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 104(%rdx)
	jmp 	.Lfors_pkfromsig$25
.Lfors_pkfromsig$26:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 108(%rdx)
	jmp 	.Lfors_pkfromsig$23
.Lfors_pkfromsig$24:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 112(%rdx)
	jmp 	.Lfors_pkfromsig$21
.Lfors_pkfromsig$22:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 116(%rdx)
	jmp 	.Lfors_pkfromsig$19
.Lfors_pkfromsig$20:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 120(%rdx)
	jmp 	.Lfors_pkfromsig$17
.Lfors_pkfromsig$18:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 124(%rdx)
	jmp 	.Lfors_pkfromsig$15
.Lfors_pkfromsig$16:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 128(%rdx)
	jmp 	.Lfors_pkfromsig$13
.Lfors_pkfromsig$14:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 132(%rdx)
	jmp 	.Lfors_pkfromsig$11
.Lfors_pkfromsig$12:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r11d
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
	movl	%r11d, 136(%rdx)
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
	movl	$0, %edi
	movl	%edi, 24(%r10)
	movl	%eax, %edx
	shll	$9, %edx
	addl	1344(%rsp,%rax,4), %edx
	lfence
	movq	$0, %rsi
	movl	%edx, 28(%r10)
	movq	%r9, 1296(%rsp)
	movq	%r10, 1304(%rsp)
	movq	%r8, 1312(%rsp)
	movq	%rax, 1320(%rsp)
	movq	%rcx, 1328(%rsp)
	leaq	64(%rsp), %rdi
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	40(%rsp), %rsp
	movq	1296(%rsp), %r9
	movq	1304(%rsp), %r10
	movq	1312(%rsp), %r8
	movq	1320(%rsp), %rax
	movq	1328(%rsp), %rcx
	lfence
	movq	$0, %rdx
	addq	$32, %rcx
	movl	1344(%rsp,%rax,4), %r11d
	lfence
	movq	$0, %rdx
	movl	$0, %esi
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movl	%esi, %edi
	incl	%edi
	movl	%edi, 24(%r10)
	movl	%r11d, %edx
	andl	$1, %edx
	movl	%esi, 1336(%rsp)
	movl	%r11d, 1340(%rsp)
	cmpl	$0, %edx
	je  	.Lfors_pkfromsig$8
	movl	28(%r10), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%r10)
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
	movl	28(%r10), %edx
	shrl	$1, %edx
	movl	%edx, 28(%r10)
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
	movq	%r9, %rsi
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	40(%rsp), %rsp
	movq	1328(%rsp), %r9
	movq	1320(%rsp), %r10
	movq	1312(%rsp), %r8
	movq	1304(%rsp), %rax
	movq	1296(%rsp), %rcx
	lfence
	movq	$0, %rdx
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
	movl	1336(%rsp), %esi
	movl	1340(%rsp), %r11d
	lfence
	movq	$0, %rdx
	shrl	$1, %r11d
	addq	$32, %rcx
	incl	%esi
.Lfors_pkfromsig$5:
	cmpl	$9, %esi
	jb  	.Lfors_pkfromsig$6
	movq	1288(%rsp), %rdx
	lfence
	movq	$0, %rsi
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
	movl	20(%r10), %edx
	leaq	64(%rsp), %r10
	movl	%edx, 20(%r10)
	movq	1280(%rsp), %rdi
	lfence
	movq	$0, %rax
	leaq	64(%rsp), %r10
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
	movl	$0, %r8d
	jmp 	.Lfors_sign$76
.Lfors_sign$77:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$76:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$77
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, (%rdx)
	jmp 	.Lfors_sign$74
.Lfors_sign$75:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$74:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$75
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 4(%rdx)
	jmp 	.Lfors_sign$72
.Lfors_sign$73:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$72:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$73
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 8(%rdx)
	jmp 	.Lfors_sign$70
.Lfors_sign$71:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$70:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$71
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 12(%rdx)
	jmp 	.Lfors_sign$68
.Lfors_sign$69:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$68:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$69
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 16(%rdx)
	jmp 	.Lfors_sign$66
.Lfors_sign$67:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$66:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$67
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 20(%rdx)
	jmp 	.Lfors_sign$64
.Lfors_sign$65:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$64:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$65
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 24(%rdx)
	jmp 	.Lfors_sign$62
.Lfors_sign$63:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$62:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$63
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 28(%rdx)
	jmp 	.Lfors_sign$60
.Lfors_sign$61:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$60:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$61
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 32(%rdx)
	jmp 	.Lfors_sign$58
.Lfors_sign$59:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$58:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$59
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 36(%rdx)
	jmp 	.Lfors_sign$56
.Lfors_sign$57:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$56:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$57
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 40(%rdx)
	jmp 	.Lfors_sign$54
.Lfors_sign$55:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$54:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$55
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 44(%rdx)
	jmp 	.Lfors_sign$52
.Lfors_sign$53:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$52:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$53
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 48(%rdx)
	jmp 	.Lfors_sign$50
.Lfors_sign$51:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$50:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$51
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 52(%rdx)
	jmp 	.Lfors_sign$48
.Lfors_sign$49:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$48:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$49
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 56(%rdx)
	jmp 	.Lfors_sign$46
.Lfors_sign$47:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$46:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$47
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 60(%rdx)
	jmp 	.Lfors_sign$44
.Lfors_sign$45:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$44:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$45
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 64(%rdx)
	jmp 	.Lfors_sign$42
.Lfors_sign$43:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$42:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$43
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 68(%rdx)
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$41
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 72(%rdx)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$39
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 76(%rdx)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$37
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 80(%rdx)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$35
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 84(%rdx)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$33
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 88(%rdx)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$31
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 92(%rdx)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$29
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 96(%rdx)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$27
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 100(%rdx)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$25
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 104(%rdx)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$23
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 108(%rdx)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$21
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 112(%rdx)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$19
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 116(%rdx)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$17
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 120(%rdx)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$15
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 124(%rdx)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$13
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 128(%rdx)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$11
	movl	%r8d, %ebx
	addl	$-9, %ecx
	shrq	%cl, %rbx
	andq	$511, %rbx
	movl	%ebx, 132(%rdx)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebx
	orl 	%ebx, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$9, %ecx
	jb  	.Lfors_sign$9
	movl	%r8d, %eax
	addl	$-9, %ecx
	shrq	%cl, %rax
	andq	$511, %rax
	movl	%eax, 136(%rdx)
	movq	$0, %rax
	movq	$0, %r8
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%r8d, %edx
	shll	$9, %edx
	addl	64(%rsp,%r8,4), %edx
	lfence
	movq	$0, %rcx
	leaq	(%r9,%rax), %rcx
	movq	%r11, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%r10, 24(%rsp)
	movq	%r9, 32(%rsp)
	movq	%r8, 40(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rcx, %rax
	movl	%edx, %r9d
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %r11
	movq	16(%rsp), %rsi
	movq	24(%rsp), %r10
	movq	32(%rsp), %r9
	movq	40(%rsp), %r8
	movq	48(%rsp), %rax
	lfence
	movq	$0, %rdx
	addq	$32, %rax
	movl	64(%rsp,%r8,4), %edi
	lfence
	movq	$0, %rdx
	xorl	$1, %edi
	movl	$0, %edx
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%r11, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%r8, 32(%rsp)
	movl	%edx, 56(%rsp)
	movq	%rax, 24(%rsp)
	movl	%edi, 60(%rsp)
	movl	$9, %ecx
	subl	%edx, %ecx
	shlq	%cl, %r8
	addl	%edi, %r8d
	leaq	(%r9,%rax), %rax
	movq	%r9, 16(%rsp)
	movl	%edx, %ecx
	leaq	-32888(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	32888(%rsp), %rsp
	movq	16(%rsp), %r9
	lfence
	movq	$0, %rax
	movq	48(%rsp), %r11
	movq	40(%rsp), %rsi
	movq	32(%rsp), %r8
	movl	56(%rsp), %edx
	movq	24(%rsp), %rax
	movl	60(%rsp), %edi
	lfence
	movq	$0, %rcx
	shrl	$1, %edi
	xorl	$1, %edi
	addq	$32, %rax
	incl	%edx
.Lfors_sign$4:
	cmpl	$9, %edx
	jb  	.Lfors_sign$5
	incq	%r8
.Lfors_sign$2:
	cmpq	$35, %r8
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rax, 32832(%rsp)
	movq	$0, %rax
	movl	$0, %edi
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%ecx, 32872(%rsp)
	subl	%edi, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r9d
	imull	%r8d, %r9d
	addl	%r9d, %edx
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%r11, 32840(%rsp)
	movl	%edx, 32876(%rsp)
	cmpl	$0, %edi
	je  	.Lfors_node$6
	movl	%r9d, %eax
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
	movl	%r9d, 28(%r10)
	movl	$10, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %r11
	subl	%edi, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %r11
	shrq	$1, %rbp
	movl	%r9d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %r11
	imulq	$32, %r11, %rax
	movq	%rsi, 32848(%rsp)
	movq	%r10, 32856(%rsp)
	movl	%r8d, 32880(%rsp)
	movl	%edi, 32884(%rsp)
	movl	%r9d, 32888(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	32800(%rsp), %rcx
	leaq	32768(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_node$10:
	leaq	40(%rsp), %rsp
	movq	32848(%rsp), %rsi
	movq	32856(%rsp), %r10
	movl	32880(%rsp), %r8d
	movl	32884(%rsp), %edi
	movl	32888(%rsp), %r9d
	lfence
	movq	$0, %rcx
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%edi, 24(%r10)
	movl	%r9d, 28(%r10)
	movl	$10, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbx
	subl	%edi, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %rbx
	shrq	$1, %rbp
	movl	%r9d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %rbx
	imulq	$32, %rbx, %rax
	movq	%rsi, 32848(%rsp)
	movq	%r10, 32856(%rsp)
	movl	%r8d, 32880(%rsp)
	movl	%edi, 32884(%rsp)
	movl	%r9d, 32888(%rsp)
	movq	%rax, 32864(%rsp)
	leaq	32(%rsp,%rax), %rax
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$9:
	leaq	40(%rsp), %rsp
	movq	32848(%rsp), %rsi
	movq	32856(%rsp), %r10
	movl	32880(%rsp), %eax
	movl	32884(%rsp), %edx
	movl	32888(%rsp), %ecx
	movq	32864(%rsp), %rdi
	lfence
	movq	$0, %r8
	movq	%rsi, 32864(%rsp)
	movq	%r10, 32856(%rsp)
	movl	%eax, 32888(%rsp)
	movl	%edx, 32884(%rsp)
	movl	%ecx, 32880(%rsp)
	movq	%rdi, 32848(%rsp)
	leaq	32(%rsp,%rdi), %rdi
	movq	%rsi, %r9
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_node$8:
	leaq	40(%rsp), %rsp
	movq	32864(%rsp), %rsi
	movq	32856(%rsp), %r10
	movl	32888(%rsp), %r8d
	movl	32884(%rsp), %edi
	movl	32880(%rsp), %r9d
	movq	32848(%rsp), %rax
	lfence
	movq	$0, %rcx
.Lfors_node$7:
	movq	32840(%rsp), %r11
	movl	32876(%rsp), %edx
	lfence
	movq	$0, %rcx
	incl	%r9d
.Lfors_node$4:
	cmpl	%edx, %r9d
	jb  	.Lfors_node$5
	movl	32872(%rsp), %ecx
	lfence
	movq	$0, %rdx
	incl	%edi
.Lfors_node$2:
	cmpl	%ecx, %edi
	jbe 	.Lfors_node$3
	movq	32832(%rsp), %rcx
	lfence
	movq	$0, %rdx
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
	movl	20(%r10), %edx
	leaq	8(%rsp), %rcx
	movl	%edx, 20(%rcx)
	leaq	8(%rsp), %rcx
	movl	%r9d, 28(%rcx)
	leaq	8(%rsp), %r10
	movq	%rax, %rcx
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%rdi), %r8d
	movl	%r8d, 140(%rsp)
	movl	4(%rdi), %r8d
	movl	%r8d, 144(%rsp)
	movl	8(%rdi), %r8d
	movl	%r8d, 148(%rsp)
	leaq	40(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	leaq	40(%rsp), %r10
	movl	140(%rsp), %r8d
	movl	%r8d, 4(%r10)
	movl	144(%rsp), %r8d
	movl	%r8d, 8(%r10)
	movl	148(%rsp), %r8d
	movl	%r8d, 12(%r10)
	movq	%rcx, %rdi
	movq	%rsi, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	72(%rsp), %rcx
	leaq	40(%rsp), %r10
	movq	%r10, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	$2272, %rax
	movl	$1, %r8d
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%r8d, 136(%rsp)
	movq	%rax, 24(%rsp)
	leaq	140(%rsp), %rdi
	movl	8(%rdi), %edx
	andl	$15, %edx
	shrl	$4, 8(%rdi)
	movl	4(%rdi), %r9d
	shll	$28, %r9d
	orl 	%r9d, 8(%rdi)
	shrl	$4, 4(%rdi)
	movl	(%rdi), %r9d
	shll	$28, %r9d
	orl 	%r9d, 4(%rdi)
	shrl	$4, (%rdi)
	leaq	40(%rsp), %r10
	movl	%r8d, (%r10)
	leaq	40(%rsp), %r10
	movl	140(%rsp), %r8d
	movl	%r8d, 4(%r10)
	movl	144(%rsp), %r8d
	movl	%r8d, 8(%r10)
	movl	148(%rsp), %r8d
	movl	%r8d, 12(%r10)
	leaq	104(%rsp), %rdi
	leaq	72(%rsp), %r8
	movq	(%r8), %r11
	movq	%r11, (%rdi)
	movq	8(%r8), %r11
	movq	%r11, 8(%rdi)
	movq	16(%r8), %r11
	movq	%r11, 16(%rdi)
	movq	24(%r8), %r8
	movq	%r8, 24(%rdi)
	leaq	(%rcx,%rax), %rdi
	movq	%rsi, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	72(%rsp), %rcx
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %r10
	movq	%r10, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rcx
	lfence
	movq	$0, %rax
	movl	136(%rsp), %r8d
	movq	24(%rsp), %rax
	lfence
	movq	$0, %rdx
	addq	$2272, %rax
	incl	%r8d
.Lht_verify$2:
	cmpl	$17, %r8d
	jb  	.Lht_verify$3
	movq	8(%rsp), %rax
	lfence
	movq	$0, %rcx
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
	movl	8(%rdi), %r8d
	movl	%r8d, 152(%rsp)
	leaq	40(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	leaq	40(%rsp), %r10
	movl	144(%rsp), %r8d
	movl	%r8d, 4(%r10)
	movl	148(%rsp), %r8d
	movl	%r8d, 8(%r10)
	movl	152(%rsp), %r8d
	movl	%r8d, 12(%r10)
	movq	%rcx, %rdi
	movq	%rcx, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%edx, 136(%rsp)
	leaq	40(%rsp), %r10
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
// declassify_mem 2272 [RDI]
	movq	8(%rsp), %rcx
	movq	16(%rsp), %r11
	movq	24(%rsp), %rsi
	movq	32(%rsp), %rax
	movl	136(%rsp), %edx
	lfence
	movq	$0, %r8
	movq	%r11, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	72(%rsp), %rcx
	leaq	40(%rsp), %r10
	movq	%r10, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	216(%rsp), %rsp
	movq	32(%rsp), %r11
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rcx
	lfence
	movq	$0, %r9
	movq	$2272, %rdi
	movl	$1, %eax
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%r11, 16(%rsp)
	leaq	144(%rsp), %r8
	movl	8(%r8), %edx
	andl	$15, %edx
	shrl	$4, 8(%r8)
	movl	4(%r8), %r9d
	shll	$28, %r9d
	orl 	%r9d, 8(%r8)
	shrl	$4, 4(%r8)
	movl	(%r8), %r9d
	shll	$28, %r9d
	orl 	%r9d, 4(%r8)
	shrl	$4, (%r8)
	leaq	40(%rsp), %r10
	movl	%eax, (%r10)
	leaq	40(%rsp), %r10
	movl	144(%rsp), %r8d
	movl	%r8d, 4(%r10)
	movl	148(%rsp), %r8d
	movl	%r8d, 8(%r10)
	movl	152(%rsp), %r8d
	movl	%r8d, 12(%r10)
	leaq	104(%rsp), %r8
	leaq	72(%rsp), %r9
	movq	(%r9), %r10
	movq	%r10, (%r8)
	movq	8(%r9), %r10
	movq	%r10, 8(%r8)
	movq	16(%r9), %r10
	movq	%r10, 16(%r8)
	movq	24(%r9), %r10
	movq	%r10, 24(%r8)
	leaq	(%rcx,%rdi), %r8
	movq	%rcx, 24(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%eax, 136(%rsp)
	movq	%rdi, 8(%rsp)
	movl	%edx, 140(%rsp)
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %r10
	movq	%r8, %rdi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	%rdi, %r8
// declassify_mem 2272 [R8]
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rsi
	movl	136(%rsp), %eax
	movq	8(%rsp), %rdi
	movl	140(%rsp), %edx
	lfence
	movq	$0, %r9
	cmpl	$16, %eax
	jnb 	.Lht_sign$4
	movq	%rsi, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%eax, 140(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	72(%rsp), %rcx
	leaq	104(%rsp), %rax
	leaq	40(%rsp), %r11
	movq	%r8, %rdi
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	216(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	32(%rsp), %rcx
	movl	140(%rsp), %eax
	movq	24(%rsp), %rdi
	lfence
	movq	$0, %rdx
.Lht_sign$4:
	movq	16(%rsp), %r11
	lfence
	movq	$0, %rdx
	addq	$2272, %rdi
	incl	%eax
.Lht_sign$2:
	cmpl	$17, %eax
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 160(%rsp)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$0, 16(%r11)
	movl	%edx, 20(%r11)
	movq	%rdi, %rcx
	movq	%rsi, 168(%rsp)
	movl	%edx, 200(%rsp)
	movq	%rdi, 176(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rdi
	movq	%rcx, %rdx
	movq	%rsi, %r10
	leaq	-2520(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	2520(%rsp), %rsp
	movq	%rcx, %r10
	movq	168(%rsp), %rsi
	movl	200(%rsp), %edx
	movq	176(%rsp), %rdi
	lfence
	movq	$0, %rax
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$2, 16(%r10)
	movl	%edx, 28(%r10)
	movq	$2144, %rax
	movl	%edx, %r11d
	movl	$0, %r8d
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%r8d, %ecx
	incl	%ecx
	movl	%ecx, 24(%r10)
	movl	%r11d, %edx
	andl	$1, %edx
	movl	%r8d, 200(%rsp)
	movl	%r11d, 204(%rsp)
	cmpl	$0, %edx
	je  	.Lxmss_pkfromsig$5
	movl	28(%r10), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%r10)
	leaq	128(%rsp), %rcx
	leaq	(%rdi,%rax), %rdx
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
	movl	28(%r10), %edx
	shrl	$1, %edx
	movl	%edx, 28(%r10)
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
	leaq	(%rdi,%rax), %rdx
	movq	(%rdx), %r8
	movq	%r8, (%rcx)
	movq	8(%rdx), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rdx), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rcx)
.Lxmss_pkfromsig$6:
	movq	%rsi, 176(%rsp)
	movq	%r10, 168(%rsp)
	movq	%rdi, 184(%rsp)
	movq	%rax, 192(%rsp)
	leaq	64(%rsp), %rdi
	leaq	128(%rsp), %rcx
	leaq	96(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	40(%rsp), %rsp
	movq	176(%rsp), %rsi
	movq	168(%rsp), %r10
	movq	184(%rsp), %rdi
	movq	192(%rsp), %rax
	lfence
	movq	$0, %rcx
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
	movl	200(%rsp), %r8d
	movl	204(%rsp), %r11d
	lfence
	movq	$0, %rcx
	shrl	$1, %r11d
	addq	$32, %rax
	incl	%r8d
.Lxmss_pkfromsig$2:
	cmpl	$4, %r8d
	jb  	.Lxmss_pkfromsig$3
	movq	160(%rsp), %rcx
	lfence
	movq	$0, %rdx
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
	movq	$2144, %rax
	movl	%edx, %r8d
	xorl	$1, %r8d
	movl	$0, %ecx
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%r11, 16(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 48(%rsp)
	movl	%ecx, 52(%rsp)
	movl	%r8d, 56(%rsp)
	movq	%rax, 32(%rsp)
	leaq	(%rdi,%rax), %rax
	movq	%rdi, 40(%rsp)
	leaq	-1144(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	1144(%rsp), %rsp
	movq	40(%rsp), %rdi
	lfence
	movq	$0, %rax
	movq	16(%rsp), %r11
	movq	24(%rsp), %rsi
	movl	48(%rsp), %edx
	movl	52(%rsp), %ecx
	movl	56(%rsp), %r8d
	movq	32(%rsp), %rax
	lfence
	movq	$0, %r9
	shrl	$1, %r8d
	xorl	$1, %r8d
	addq	$32, %rax
	incl	%ecx
.Lxmss_sign$3:
	cmpl	$4, %ecx
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$0, 16(%r10)
	movl	%edx, 20(%r10)
	movq	%rdi, %rbx
	movq	%rdi, 8(%rsp)
	movq	%rsi, %r9
	leaq	-360(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	360(%rsp), %rsp
	movq	8(%rsp), %rdi
	lfence
	movq	$0, %rax
	ret
.Lxmss_node$1:
	movq	%rax, 1088(%rsp)
	movq	$0, %rax
	movl	$0, %edx
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%ecx, 1120(%rsp)
	subl	%edx, %ecx
	movq	$1, %rdi
	shlq	%cl, %rdi
	movl	%edi, %r9d
	imull	%r8d, %r9d
	addl	%r9d, %edi
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%r11, 1096(%rsp)
	movq	%rsi, 1104(%rsp)
	movl	%r8d, 1124(%rsp)
	movl	%edx, 1128(%rsp)
	movl	%r9d, 1132(%rsp)
	movl	%edi, 1136(%rsp)
	cmpl	$0, %edx
	je  	.Lxmss_node$6
	movl	%r9d, %eax
	imull	$2, %eax, %eax
	movl	%edx, %edi
	decl	%edi
	movl	$5, %ecx
	movq	$1, %r8
	shlq	%cl, %r8
	subl	%edi, %ecx
	movq	$1, %rdi
	shlq	%cl, %rdi
	subq	%rdi, %r8
	movl	%eax, %eax
	addq	%rax, %r8
	imulq	$32, %r8, %r8
	movq	%r8, %rax
	addq	$32, %rax
	leaq	1056(%rsp), %rcx
	leaq	32(%rsp,%r8), %rdi
	movq	(%rdi), %r8
	movq	%r8, (%rcx)
	movq	8(%rdi), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rdi), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rdi), %r8
	movq	%r8, 24(%rcx)
	leaq	1024(%rsp), %rcx
	leaq	32(%rsp,%rax), %rax
	movq	(%rax), %r8
	movq	%r8, (%rcx)
	movq	8(%rax), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rax), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rax), %r8
	movq	%r8, 24(%rcx)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$2, 16(%r10)
	movl	%edx, 24(%r10)
	movl	%r9d, 28(%r10)
	movl	$5, %ecx
	movq	$1, %rdi
	shlq	%cl, %rdi
	subl	%edx, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %rdi
	movl	%r9d, %eax
	addq	%rax, %rdi
	imulq	$32, %rdi, %rax
	movq	%r10, 1112(%rsp)
	leaq	32(%rsp,%rax), %rdi
	leaq	1056(%rsp), %rcx
	leaq	1024(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_node$9:
	leaq	40(%rsp), %rsp
	movq	1112(%rsp), %r10
	lfence
	movq	$0, %rcx
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$0, 16(%r10)
	movl	%r9d, 20(%r10)
	movl	%r9d, %eax
	imulq	$32, %rax, %rax
	leaq	32(%rsp,%rax), %rdi
	leaq	-2264(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	2264(%rsp), %rsp
	movq	%rcx, %r10
.Lxmss_node$7:
	movq	1096(%rsp), %r11
	movq	1104(%rsp), %rsi
	movl	1124(%rsp), %r8d
	movl	1128(%rsp), %edx
	movl	1132(%rsp), %r9d
	movl	1136(%rsp), %edi
	lfence
	movq	$0, %rcx
	incl	%r9d
.Lxmss_node$4:
	cmpl	%edi, %r9d
	jb  	.Lxmss_node$5
	movl	1120(%rsp), %ecx
	lfence
	movq	$0, %rdi
	incl	%edx
.Lxmss_node$2:
	cmpl	%ecx, %edx
	jbe 	.Lxmss_node$3
	movq	1088(%rsp), %rcx
	lfence
	movq	$0, %rdx
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
	movq	%rdi, 2176(%rsp)
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
	leaq	256(%rsi), %rdi
	leaq	2504(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %r8d
	jmp 	.Lwots_pkfromsig$10
.Lwots_pkfromsig$11:
	shll	$8, %r8d
	movzbl	(%rax,%rsi), %r9d
	orl 	%r9d, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lwots_pkfromsig$10:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$11
	movl	%r8d, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, (%rdi)
	jmp 	.Lwots_pkfromsig$8
.Lwots_pkfromsig$9:
	shll	$8, %r8d
	movzbl	(%rax,%rsi), %r9d
	orl 	%r9d, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lwots_pkfromsig$8:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$9
	movl	%r8d, %r9d
	addl	$-4, %ecx
	shrq	%cl, %r9
	andq	$15, %r9
	movl	%r9d, 4(%rdi)
	jmp 	.Lwots_pkfromsig$6
.Lwots_pkfromsig$7:
	shll	$8, %r8d
	movzbl	(%rax,%rsi), %r9d
	orl 	%r9d, %r8d
	incq	%rsi
	addl	$8, %ecx
.Lwots_pkfromsig$6:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$7
	movl	%r8d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 8(%rdi)
	movb	(%rdx), %r8b
	movb	%r8b, 32(%rsp)
	movb	1(%rdx), %r8b
	movb	%r8b, 33(%rsp)
	movb	2(%rdx), %r8b
	movb	%r8b, 34(%rsp)
	movb	3(%rdx), %r8b
	movb	%r8b, 35(%rsp)
	movb	4(%rdx), %r8b
	movb	%r8b, 36(%rsp)
	movb	5(%rdx), %r8b
	movb	%r8b, 37(%rsp)
	movb	6(%rdx), %r8b
	movb	%r8b, 38(%rsp)
	movb	7(%rdx), %r8b
	movb	%r8b, 39(%rsp)
	movb	8(%rdx), %r8b
	movb	%r8b, 40(%rsp)
	movb	9(%rdx), %r8b
	movb	%r8b, 41(%rsp)
	movb	10(%rdx), %r8b
	movb	%r8b, 42(%rsp)
	movb	11(%rdx), %r8b
	movb	%r8b, 43(%rsp)
	movb	12(%rdx), %r8b
	movb	%r8b, 44(%rsp)
	movb	13(%rdx), %r8b
	movb	%r8b, 45(%rsp)
	movb	14(%rdx), %r8b
	movb	%r8b, 46(%rsp)
	movb	15(%rdx), %r8b
	movb	%r8b, 47(%rsp)
	movb	16(%rdx), %r8b
	movb	%r8b, 48(%rsp)
	movb	17(%rdx), %r8b
	movb	%r8b, 49(%rsp)
	movb	18(%rdx), %r8b
	movb	%r8b, 50(%rsp)
	movb	19(%rdx), %r8b
	movb	%r8b, 51(%rsp)
	movb	20(%rdx), %r8b
	movb	%r8b, 52(%rsp)
	movb	21(%rdx), %r8b
	movb	%r8b, 53(%rsp)
	movb	22(%rdx), %r8b
	movb	%r8b, 54(%rsp)
	movb	23(%rdx), %r8b
	movb	%r8b, 55(%rsp)
	movb	24(%rdx), %r8b
	movb	%r8b, 56(%rsp)
	movb	25(%rdx), %r8b
	movb	%r8b, 57(%rsp)
	movb	26(%rdx), %r8b
	movb	%r8b, 58(%rsp)
	movb	27(%rdx), %r8b
	movb	%r8b, 59(%rsp)
	movb	28(%rdx), %r8b
	movb	%r8b, 60(%rsp)
	movb	29(%rdx), %r8b
	movb	%r8b, 61(%rsp)
	movb	30(%rdx), %r8b
	movb	%r8b, 62(%rsp)
	movb	31(%rdx), %r8b
	movb	%r8b, 63(%rsp)
	movb	32(%rdx), %r8b
	movb	%r8b, 64(%rsp)
	movb	33(%rdx), %r8b
	movb	%r8b, 65(%rsp)
	movb	34(%rdx), %r8b
	movb	%r8b, 66(%rsp)
	movb	35(%rdx), %r8b
	movb	%r8b, 67(%rsp)
	movb	36(%rdx), %r8b
	movb	%r8b, 68(%rsp)
	movb	37(%rdx), %r8b
	movb	%r8b, 69(%rsp)
	movb	38(%rdx), %r8b
	movb	%r8b, 70(%rsp)
	movb	39(%rdx), %r8b
	movb	%r8b, 71(%rsp)
	movb	40(%rdx), %r8b
	movb	%r8b, 72(%rsp)
	movb	41(%rdx), %r8b
	movb	%r8b, 73(%rsp)
	movb	42(%rdx), %r8b
	movb	%r8b, 74(%rsp)
	movb	43(%rdx), %r8b
	movb	%r8b, 75(%rsp)
	movb	44(%rdx), %r8b
	movb	%r8b, 76(%rsp)
	movb	45(%rdx), %r8b
	movb	%r8b, 77(%rsp)
	movb	46(%rdx), %r8b
	movb	%r8b, 78(%rsp)
	movb	47(%rdx), %r8b
	movb	%r8b, 79(%rsp)
	movb	48(%rdx), %r8b
	movb	%r8b, 80(%rsp)
	movb	49(%rdx), %r8b
	movb	%r8b, 81(%rsp)
	movb	50(%rdx), %r8b
	movb	%r8b, 82(%rsp)
	movb	51(%rdx), %r8b
	movb	%r8b, 83(%rsp)
	movb	52(%rdx), %r8b
	movb	%r8b, 84(%rsp)
	movb	53(%rdx), %r8b
	movb	%r8b, 85(%rsp)
	movb	54(%rdx), %r8b
	movb	%r8b, 86(%rsp)
	movb	55(%rdx), %r8b
	movb	%r8b, 87(%rsp)
	movb	56(%rdx), %r8b
	movb	%r8b, 88(%rsp)
	movb	57(%rdx), %r8b
	movb	%r8b, 89(%rsp)
	movb	58(%rdx), %r8b
	movb	%r8b, 90(%rsp)
	movb	59(%rdx), %r8b
	movb	%r8b, 91(%rsp)
	movb	60(%rdx), %r8b
	movb	%r8b, 92(%rsp)
	movb	61(%rdx), %r8b
	movb	%r8b, 93(%rsp)
	movb	62(%rdx), %r8b
	movb	%r8b, 94(%rsp)
	movb	63(%rdx), %r8b
	movb	%r8b, 95(%rsp)
	movb	64(%rdx), %r8b
	movb	%r8b, 96(%rsp)
	movb	65(%rdx), %r8b
	movb	%r8b, 97(%rsp)
	movb	66(%rdx), %r8b
	movb	%r8b, 98(%rsp)
	movb	67(%rdx), %r8b
	movb	%r8b, 99(%rsp)
	movb	68(%rdx), %r8b
	movb	%r8b, 100(%rsp)
	movb	69(%rdx), %r8b
	movb	%r8b, 101(%rsp)
	movb	70(%rdx), %r8b
	movb	%r8b, 102(%rsp)
	movb	71(%rdx), %r8b
	movb	%r8b, 103(%rsp)
	movb	72(%rdx), %r8b
	movb	%r8b, 104(%rsp)
	movb	73(%rdx), %r8b
	movb	%r8b, 105(%rsp)
	movb	74(%rdx), %r8b
	movb	%r8b, 106(%rsp)
	movb	75(%rdx), %r8b
	movb	%r8b, 107(%rsp)
	movb	76(%rdx), %r8b
	movb	%r8b, 108(%rsp)
	movb	77(%rdx), %r8b
	movb	%r8b, 109(%rsp)
	movb	78(%rdx), %r8b
	movb	%r8b, 110(%rsp)
	movb	79(%rdx), %r8b
	movb	%r8b, 111(%rsp)
	movb	80(%rdx), %r8b
	movb	%r8b, 112(%rsp)
	movb	81(%rdx), %r8b
	movb	%r8b, 113(%rsp)
	movb	82(%rdx), %r8b
	movb	%r8b, 114(%rsp)
	movb	83(%rdx), %r8b
	movb	%r8b, 115(%rsp)
	movb	84(%rdx), %r8b
	movb	%r8b, 116(%rsp)
	movb	85(%rdx), %r8b
	movb	%r8b, 117(%rsp)
	movb	86(%rdx), %r8b
	movb	%r8b, 118(%rsp)
	movb	87(%rdx), %r8b
	movb	%r8b, 119(%rsp)
	movb	88(%rdx), %r8b
	movb	%r8b, 120(%rsp)
	movb	89(%rdx), %r8b
	movb	%r8b, 121(%rsp)
	movb	90(%rdx), %r8b
	movb	%r8b, 122(%rsp)
	movb	91(%rdx), %r8b
	movb	%r8b, 123(%rsp)
	movb	92(%rdx), %r8b
	movb	%r8b, 124(%rsp)
	movb	93(%rdx), %r8b
	movb	%r8b, 125(%rsp)
	movb	94(%rdx), %r8b
	movb	%r8b, 126(%rsp)
	movb	95(%rdx), %r8b
	movb	%r8b, 127(%rsp)
	movb	96(%rdx), %r8b
	movb	%r8b, 128(%rsp)
	movb	97(%rdx), %r8b
	movb	%r8b, 129(%rsp)
	movb	98(%rdx), %r8b
	movb	%r8b, 130(%rsp)
	movb	99(%rdx), %r8b
	movb	%r8b, 131(%rsp)
	movb	100(%rdx), %r8b
	movb	%r8b, 132(%rsp)
	movb	101(%rdx), %r8b
	movb	%r8b, 133(%rsp)
	movb	102(%rdx), %r8b
	movb	%r8b, 134(%rsp)
	movb	103(%rdx), %r8b
	movb	%r8b, 135(%rsp)
	movb	104(%rdx), %r8b
	movb	%r8b, 136(%rsp)
	movb	105(%rdx), %r8b
	movb	%r8b, 137(%rsp)
	movb	106(%rdx), %r8b
	movb	%r8b, 138(%rsp)
	movb	107(%rdx), %r8b
	movb	%r8b, 139(%rsp)
	movb	108(%rdx), %r8b
	movb	%r8b, 140(%rsp)
	movb	109(%rdx), %r8b
	movb	%r8b, 141(%rsp)
	movb	110(%rdx), %r8b
	movb	%r8b, 142(%rsp)
	movb	111(%rdx), %r8b
	movb	%r8b, 143(%rsp)
	movb	112(%rdx), %r8b
	movb	%r8b, 144(%rsp)
	movb	113(%rdx), %r8b
	movb	%r8b, 145(%rsp)
	movb	114(%rdx), %r8b
	movb	%r8b, 146(%rsp)
	movb	115(%rdx), %r8b
	movb	%r8b, 147(%rsp)
	movb	116(%rdx), %r8b
	movb	%r8b, 148(%rsp)
	movb	117(%rdx), %r8b
	movb	%r8b, 149(%rsp)
	movb	118(%rdx), %r8b
	movb	%r8b, 150(%rsp)
	movb	119(%rdx), %r8b
	movb	%r8b, 151(%rsp)
	movb	120(%rdx), %r8b
	movb	%r8b, 152(%rsp)
	movb	121(%rdx), %r8b
	movb	%r8b, 153(%rsp)
	movb	122(%rdx), %r8b
	movb	%r8b, 154(%rsp)
	movb	123(%rdx), %r8b
	movb	%r8b, 155(%rsp)
	movb	124(%rdx), %r8b
	movb	%r8b, 156(%rsp)
	movb	125(%rdx), %r8b
	movb	%r8b, 157(%rsp)
	movb	126(%rdx), %r8b
	movb	%r8b, 158(%rsp)
	movb	127(%rdx), %r8b
	movb	%r8b, 159(%rsp)
	movb	128(%rdx), %r8b
	movb	%r8b, 160(%rsp)
	movb	129(%rdx), %r8b
	movb	%r8b, 161(%rsp)
	movb	130(%rdx), %r8b
	movb	%r8b, 162(%rsp)
	movb	131(%rdx), %r8b
	movb	%r8b, 163(%rsp)
	movb	132(%rdx), %r8b
	movb	%r8b, 164(%rsp)
	movb	133(%rdx), %r8b
	movb	%r8b, 165(%rsp)
	movb	134(%rdx), %r8b
	movb	%r8b, 166(%rsp)
	movb	135(%rdx), %r8b
	movb	%r8b, 167(%rsp)
	movb	136(%rdx), %r8b
	movb	%r8b, 168(%rsp)
	movb	137(%rdx), %r8b
	movb	%r8b, 169(%rsp)
	movb	138(%rdx), %r8b
	movb	%r8b, 170(%rsp)
	movb	139(%rdx), %r8b
	movb	%r8b, 171(%rsp)
	movb	140(%rdx), %r8b
	movb	%r8b, 172(%rsp)
	movb	141(%rdx), %r8b
	movb	%r8b, 173(%rsp)
	movb	142(%rdx), %r8b
	movb	%r8b, 174(%rsp)
	movb	143(%rdx), %r8b
	movb	%r8b, 175(%rsp)
	movb	144(%rdx), %r8b
	movb	%r8b, 176(%rsp)
	movb	145(%rdx), %r8b
	movb	%r8b, 177(%rsp)
	movb	146(%rdx), %r8b
	movb	%r8b, 178(%rsp)
	movb	147(%rdx), %r8b
	movb	%r8b, 179(%rsp)
	movb	148(%rdx), %r8b
	movb	%r8b, 180(%rsp)
	movb	149(%rdx), %r8b
	movb	%r8b, 181(%rsp)
	movb	150(%rdx), %r8b
	movb	%r8b, 182(%rsp)
	movb	151(%rdx), %r8b
	movb	%r8b, 183(%rsp)
	movb	152(%rdx), %r8b
	movb	%r8b, 184(%rsp)
	movb	153(%rdx), %r8b
	movb	%r8b, 185(%rsp)
	movb	154(%rdx), %r8b
	movb	%r8b, 186(%rsp)
	movb	155(%rdx), %r8b
	movb	%r8b, 187(%rsp)
	movb	156(%rdx), %r8b
	movb	%r8b, 188(%rsp)
	movb	157(%rdx), %r8b
	movb	%r8b, 189(%rsp)
	movb	158(%rdx), %r8b
	movb	%r8b, 190(%rsp)
	movb	159(%rdx), %r8b
	movb	%r8b, 191(%rsp)
	movb	160(%rdx), %r8b
	movb	%r8b, 192(%rsp)
	movb	161(%rdx), %r8b
	movb	%r8b, 193(%rsp)
	movb	162(%rdx), %r8b
	movb	%r8b, 194(%rsp)
	movb	163(%rdx), %r8b
	movb	%r8b, 195(%rsp)
	movb	164(%rdx), %r8b
	movb	%r8b, 196(%rsp)
	movb	165(%rdx), %r8b
	movb	%r8b, 197(%rsp)
	movb	166(%rdx), %r8b
	movb	%r8b, 198(%rsp)
	movb	167(%rdx), %r8b
	movb	%r8b, 199(%rsp)
	movb	168(%rdx), %r8b
	movb	%r8b, 200(%rsp)
	movb	169(%rdx), %r8b
	movb	%r8b, 201(%rsp)
	movb	170(%rdx), %r8b
	movb	%r8b, 202(%rsp)
	movb	171(%rdx), %r8b
	movb	%r8b, 203(%rsp)
	movb	172(%rdx), %r8b
	movb	%r8b, 204(%rsp)
	movb	173(%rdx), %r8b
	movb	%r8b, 205(%rsp)
	movb	174(%rdx), %r8b
	movb	%r8b, 206(%rsp)
	movb	175(%rdx), %r8b
	movb	%r8b, 207(%rsp)
	movb	176(%rdx), %r8b
	movb	%r8b, 208(%rsp)
	movb	177(%rdx), %r8b
	movb	%r8b, 209(%rsp)
	movb	178(%rdx), %r8b
	movb	%r8b, 210(%rsp)
	movb	179(%rdx), %r8b
	movb	%r8b, 211(%rsp)
	movb	180(%rdx), %r8b
	movb	%r8b, 212(%rsp)
	movb	181(%rdx), %r8b
	movb	%r8b, 213(%rsp)
	movb	182(%rdx), %r8b
	movb	%r8b, 214(%rsp)
	movb	183(%rdx), %r8b
	movb	%r8b, 215(%rsp)
	movb	184(%rdx), %r8b
	movb	%r8b, 216(%rsp)
	movb	185(%rdx), %r8b
	movb	%r8b, 217(%rsp)
	movb	186(%rdx), %r8b
	movb	%r8b, 218(%rsp)
	movb	187(%rdx), %r8b
	movb	%r8b, 219(%rsp)
	movb	188(%rdx), %r8b
	movb	%r8b, 220(%rsp)
	movb	189(%rdx), %r8b
	movb	%r8b, 221(%rsp)
	movb	190(%rdx), %r8b
	movb	%r8b, 222(%rsp)
	movb	191(%rdx), %r8b
	movb	%r8b, 223(%rsp)
	movb	192(%rdx), %r8b
	movb	%r8b, 224(%rsp)
	movb	193(%rdx), %r8b
	movb	%r8b, 225(%rsp)
	movb	194(%rdx), %r8b
	movb	%r8b, 226(%rsp)
	movb	195(%rdx), %r8b
	movb	%r8b, 227(%rsp)
	movb	196(%rdx), %r8b
	movb	%r8b, 228(%rsp)
	movb	197(%rdx), %r8b
	movb	%r8b, 229(%rsp)
	movb	198(%rdx), %r8b
	movb	%r8b, 230(%rsp)
	movb	199(%rdx), %r8b
	movb	%r8b, 231(%rsp)
	movb	200(%rdx), %r8b
	movb	%r8b, 232(%rsp)
	movb	201(%rdx), %r8b
	movb	%r8b, 233(%rsp)
	movb	202(%rdx), %r8b
	movb	%r8b, 234(%rsp)
	movb	203(%rdx), %r8b
	movb	%r8b, 235(%rsp)
	movb	204(%rdx), %r8b
	movb	%r8b, 236(%rsp)
	movb	205(%rdx), %r8b
	movb	%r8b, 237(%rsp)
	movb	206(%rdx), %r8b
	movb	%r8b, 238(%rsp)
	movb	207(%rdx), %r8b
	movb	%r8b, 239(%rsp)
	movb	208(%rdx), %r8b
	movb	%r8b, 240(%rsp)
	movb	209(%rdx), %r8b
	movb	%r8b, 241(%rsp)
	movb	210(%rdx), %r8b
	movb	%r8b, 242(%rsp)
	movb	211(%rdx), %r8b
	movb	%r8b, 243(%rsp)
	movb	212(%rdx), %r8b
	movb	%r8b, 244(%rsp)
	movb	213(%rdx), %r8b
	movb	%r8b, 245(%rsp)
	movb	214(%rdx), %r8b
	movb	%r8b, 246(%rsp)
	movb	215(%rdx), %r8b
	movb	%r8b, 247(%rsp)
	movb	216(%rdx), %r8b
	movb	%r8b, 248(%rsp)
	movb	217(%rdx), %r8b
	movb	%r8b, 249(%rsp)
	movb	218(%rdx), %r8b
	movb	%r8b, 250(%rsp)
	movb	219(%rdx), %r8b
	movb	%r8b, 251(%rsp)
	movb	220(%rdx), %r8b
	movb	%r8b, 252(%rsp)
	movb	221(%rdx), %r8b
	movb	%r8b, 253(%rsp)
	movb	222(%rdx), %r8b
	movb	%r8b, 254(%rsp)
	movb	223(%rdx), %r8b
	movb	%r8b, 255(%rsp)
	movb	224(%rdx), %r8b
	movb	%r8b, 256(%rsp)
	movb	225(%rdx), %r8b
	movb	%r8b, 257(%rsp)
	movb	226(%rdx), %r8b
	movb	%r8b, 258(%rsp)
	movb	227(%rdx), %r8b
	movb	%r8b, 259(%rsp)
	movb	228(%rdx), %r8b
	movb	%r8b, 260(%rsp)
	movb	229(%rdx), %r8b
	movb	%r8b, 261(%rsp)
	movb	230(%rdx), %r8b
	movb	%r8b, 262(%rsp)
	movb	231(%rdx), %r8b
	movb	%r8b, 263(%rsp)
	movb	232(%rdx), %r8b
	movb	%r8b, 264(%rsp)
	movb	233(%rdx), %r8b
	movb	%r8b, 265(%rsp)
	movb	234(%rdx), %r8b
	movb	%r8b, 266(%rsp)
	movb	235(%rdx), %r8b
	movb	%r8b, 267(%rsp)
	movb	236(%rdx), %r8b
	movb	%r8b, 268(%rsp)
	movb	237(%rdx), %r8b
	movb	%r8b, 269(%rsp)
	movb	238(%rdx), %r8b
	movb	%r8b, 270(%rsp)
	movb	239(%rdx), %r8b
	movb	%r8b, 271(%rsp)
	movb	240(%rdx), %r8b
	movb	%r8b, 272(%rsp)
	movb	241(%rdx), %r8b
	movb	%r8b, 273(%rsp)
	movb	242(%rdx), %r8b
	movb	%r8b, 274(%rsp)
	movb	243(%rdx), %r8b
	movb	%r8b, 275(%rsp)
	movb	244(%rdx), %r8b
	movb	%r8b, 276(%rsp)
	movb	245(%rdx), %r8b
	movb	%r8b, 277(%rsp)
	movb	246(%rdx), %r8b
	movb	%r8b, 278(%rsp)
	movb	247(%rdx), %r8b
	movb	%r8b, 279(%rsp)
	movb	248(%rdx), %r8b
	movb	%r8b, 280(%rsp)
	movb	249(%rdx), %r8b
	movb	%r8b, 281(%rsp)
	movb	250(%rdx), %r8b
	movb	%r8b, 282(%rsp)
	movb	251(%rdx), %r8b
	movb	%r8b, 283(%rsp)
	movb	252(%rdx), %r8b
	movb	%r8b, 284(%rsp)
	movb	253(%rdx), %r8b
	movb	%r8b, 285(%rsp)
	movb	254(%rdx), %r8b
	movb	%r8b, 286(%rsp)
	movb	255(%rdx), %r8b
	movb	%r8b, 287(%rsp)
	movb	256(%rdx), %r8b
	movb	%r8b, 288(%rsp)
	movb	257(%rdx), %r8b
	movb	%r8b, 289(%rsp)
	movb	258(%rdx), %r8b
	movb	%r8b, 290(%rsp)
	movb	259(%rdx), %r8b
	movb	%r8b, 291(%rsp)
	movb	260(%rdx), %r8b
	movb	%r8b, 292(%rsp)
	movb	261(%rdx), %r8b
	movb	%r8b, 293(%rsp)
	movb	262(%rdx), %r8b
	movb	%r8b, 294(%rsp)
	movb	263(%rdx), %r8b
	movb	%r8b, 295(%rsp)
	movb	264(%rdx), %r8b
	movb	%r8b, 296(%rsp)
	movb	265(%rdx), %r8b
	movb	%r8b, 297(%rsp)
	movb	266(%rdx), %r8b
	movb	%r8b, 298(%rsp)
	movb	267(%rdx), %r8b
	movb	%r8b, 299(%rsp)
	movb	268(%rdx), %r8b
	movb	%r8b, 300(%rsp)
	movb	269(%rdx), %r8b
	movb	%r8b, 301(%rsp)
	movb	270(%rdx), %r8b
	movb	%r8b, 302(%rsp)
	movb	271(%rdx), %r8b
	movb	%r8b, 303(%rsp)
	movb	272(%rdx), %r8b
	movb	%r8b, 304(%rsp)
	movb	273(%rdx), %r8b
	movb	%r8b, 305(%rsp)
	movb	274(%rdx), %r8b
	movb	%r8b, 306(%rsp)
	movb	275(%rdx), %r8b
	movb	%r8b, 307(%rsp)
	movb	276(%rdx), %r8b
	movb	%r8b, 308(%rsp)
	movb	277(%rdx), %r8b
	movb	%r8b, 309(%rsp)
	movb	278(%rdx), %r8b
	movb	%r8b, 310(%rsp)
	movb	279(%rdx), %r8b
	movb	%r8b, 311(%rsp)
	movb	280(%rdx), %r8b
	movb	%r8b, 312(%rsp)
	movb	281(%rdx), %r8b
	movb	%r8b, 313(%rsp)
	movb	282(%rdx), %r8b
	movb	%r8b, 314(%rsp)
	movb	283(%rdx), %r8b
	movb	%r8b, 315(%rsp)
	movb	284(%rdx), %r8b
	movb	%r8b, 316(%rsp)
	movb	285(%rdx), %r8b
	movb	%r8b, 317(%rsp)
	movb	286(%rdx), %r8b
	movb	%r8b, 318(%rsp)
	movb	287(%rdx), %r8b
	movb	%r8b, 319(%rsp)
	movb	288(%rdx), %r8b
	movb	%r8b, 320(%rsp)
	movb	289(%rdx), %r8b
	movb	%r8b, 321(%rsp)
	movb	290(%rdx), %r8b
	movb	%r8b, 322(%rsp)
	movb	291(%rdx), %r8b
	movb	%r8b, 323(%rsp)
	movb	292(%rdx), %r8b
	movb	%r8b, 324(%rsp)
	movb	293(%rdx), %r8b
	movb	%r8b, 325(%rsp)
	movb	294(%rdx), %r8b
	movb	%r8b, 326(%rsp)
	movb	295(%rdx), %r8b
	movb	%r8b, 327(%rsp)
	movb	296(%rdx), %r8b
	movb	%r8b, 328(%rsp)
	movb	297(%rdx), %r8b
	movb	%r8b, 329(%rsp)
	movb	298(%rdx), %r8b
	movb	%r8b, 330(%rsp)
	movb	299(%rdx), %r8b
	movb	%r8b, 331(%rsp)
	movb	300(%rdx), %r8b
	movb	%r8b, 332(%rsp)
	movb	301(%rdx), %r8b
	movb	%r8b, 333(%rsp)
	movb	302(%rdx), %r8b
	movb	%r8b, 334(%rsp)
	movb	303(%rdx), %r8b
	movb	%r8b, 335(%rsp)
	movb	304(%rdx), %r8b
	movb	%r8b, 336(%rsp)
	movb	305(%rdx), %r8b
	movb	%r8b, 337(%rsp)
	movb	306(%rdx), %r8b
	movb	%r8b, 338(%rsp)
	movb	307(%rdx), %r8b
	movb	%r8b, 339(%rsp)
	movb	308(%rdx), %r8b
	movb	%r8b, 340(%rsp)
	movb	309(%rdx), %r8b
	movb	%r8b, 341(%rsp)
	movb	310(%rdx), %r8b
	movb	%r8b, 342(%rsp)
	movb	311(%rdx), %r8b
	movb	%r8b, 343(%rsp)
	movb	312(%rdx), %r8b
	movb	%r8b, 344(%rsp)
	movb	313(%rdx), %r8b
	movb	%r8b, 345(%rsp)
	movb	314(%rdx), %r8b
	movb	%r8b, 346(%rsp)
	movb	315(%rdx), %r8b
	movb	%r8b, 347(%rsp)
	movb	316(%rdx), %r8b
	movb	%r8b, 348(%rsp)
	movb	317(%rdx), %r8b
	movb	%r8b, 349(%rsp)
	movb	318(%rdx), %r8b
	movb	%r8b, 350(%rsp)
	movb	319(%rdx), %r8b
	movb	%r8b, 351(%rsp)
	movb	320(%rdx), %r8b
	movb	%r8b, 352(%rsp)
	movb	321(%rdx), %r8b
	movb	%r8b, 353(%rsp)
	movb	322(%rdx), %r8b
	movb	%r8b, 354(%rsp)
	movb	323(%rdx), %r8b
	movb	%r8b, 355(%rsp)
	movb	324(%rdx), %r8b
	movb	%r8b, 356(%rsp)
	movb	325(%rdx), %r8b
	movb	%r8b, 357(%rsp)
	movb	326(%rdx), %r8b
	movb	%r8b, 358(%rsp)
	movb	327(%rdx), %r8b
	movb	%r8b, 359(%rsp)
	movb	328(%rdx), %r8b
	movb	%r8b, 360(%rsp)
	movb	329(%rdx), %r8b
	movb	%r8b, 361(%rsp)
	movb	330(%rdx), %r8b
	movb	%r8b, 362(%rsp)
	movb	331(%rdx), %r8b
	movb	%r8b, 363(%rsp)
	movb	332(%rdx), %r8b
	movb	%r8b, 364(%rsp)
	movb	333(%rdx), %r8b
	movb	%r8b, 365(%rsp)
	movb	334(%rdx), %r8b
	movb	%r8b, 366(%rsp)
	movb	335(%rdx), %r8b
	movb	%r8b, 367(%rsp)
	movb	336(%rdx), %r8b
	movb	%r8b, 368(%rsp)
	movb	337(%rdx), %r8b
	movb	%r8b, 369(%rsp)
	movb	338(%rdx), %r8b
	movb	%r8b, 370(%rsp)
	movb	339(%rdx), %r8b
	movb	%r8b, 371(%rsp)
	movb	340(%rdx), %r8b
	movb	%r8b, 372(%rsp)
	movb	341(%rdx), %r8b
	movb	%r8b, 373(%rsp)
	movb	342(%rdx), %r8b
	movb	%r8b, 374(%rsp)
	movb	343(%rdx), %r8b
	movb	%r8b, 375(%rsp)
	movb	344(%rdx), %r8b
	movb	%r8b, 376(%rsp)
	movb	345(%rdx), %r8b
	movb	%r8b, 377(%rsp)
	movb	346(%rdx), %r8b
	movb	%r8b, 378(%rsp)
	movb	347(%rdx), %r8b
	movb	%r8b, 379(%rsp)
	movb	348(%rdx), %r8b
	movb	%r8b, 380(%rsp)
	movb	349(%rdx), %r8b
	movb	%r8b, 381(%rsp)
	movb	350(%rdx), %r8b
	movb	%r8b, 382(%rsp)
	movb	351(%rdx), %r8b
	movb	%r8b, 383(%rsp)
	movb	352(%rdx), %r8b
	movb	%r8b, 384(%rsp)
	movb	353(%rdx), %r8b
	movb	%r8b, 385(%rsp)
	movb	354(%rdx), %r8b
	movb	%r8b, 386(%rsp)
	movb	355(%rdx), %r8b
	movb	%r8b, 387(%rsp)
	movb	356(%rdx), %r8b
	movb	%r8b, 388(%rsp)
	movb	357(%rdx), %r8b
	movb	%r8b, 389(%rsp)
	movb	358(%rdx), %r8b
	movb	%r8b, 390(%rsp)
	movb	359(%rdx), %r8b
	movb	%r8b, 391(%rsp)
	movb	360(%rdx), %r8b
	movb	%r8b, 392(%rsp)
	movb	361(%rdx), %r8b
	movb	%r8b, 393(%rsp)
	movb	362(%rdx), %r8b
	movb	%r8b, 394(%rsp)
	movb	363(%rdx), %r8b
	movb	%r8b, 395(%rsp)
	movb	364(%rdx), %r8b
	movb	%r8b, 396(%rsp)
	movb	365(%rdx), %r8b
	movb	%r8b, 397(%rsp)
	movb	366(%rdx), %r8b
	movb	%r8b, 398(%rsp)
	movb	367(%rdx), %r8b
	movb	%r8b, 399(%rsp)
	movb	368(%rdx), %r8b
	movb	%r8b, 400(%rsp)
	movb	369(%rdx), %r8b
	movb	%r8b, 401(%rsp)
	movb	370(%rdx), %r8b
	movb	%r8b, 402(%rsp)
	movb	371(%rdx), %r8b
	movb	%r8b, 403(%rsp)
	movb	372(%rdx), %r8b
	movb	%r8b, 404(%rsp)
	movb	373(%rdx), %r8b
	movb	%r8b, 405(%rsp)
	movb	374(%rdx), %r8b
	movb	%r8b, 406(%rsp)
	movb	375(%rdx), %r8b
	movb	%r8b, 407(%rsp)
	movb	376(%rdx), %r8b
	movb	%r8b, 408(%rsp)
	movb	377(%rdx), %r8b
	movb	%r8b, 409(%rsp)
	movb	378(%rdx), %r8b
	movb	%r8b, 410(%rsp)
	movb	379(%rdx), %r8b
	movb	%r8b, 411(%rsp)
	movb	380(%rdx), %r8b
	movb	%r8b, 412(%rsp)
	movb	381(%rdx), %r8b
	movb	%r8b, 413(%rsp)
	movb	382(%rdx), %r8b
	movb	%r8b, 414(%rsp)
	movb	383(%rdx), %r8b
	movb	%r8b, 415(%rsp)
	movb	384(%rdx), %r8b
	movb	%r8b, 416(%rsp)
	movb	385(%rdx), %r8b
	movb	%r8b, 417(%rsp)
	movb	386(%rdx), %r8b
	movb	%r8b, 418(%rsp)
	movb	387(%rdx), %r8b
	movb	%r8b, 419(%rsp)
	movb	388(%rdx), %r8b
	movb	%r8b, 420(%rsp)
	movb	389(%rdx), %r8b
	movb	%r8b, 421(%rsp)
	movb	390(%rdx), %r8b
	movb	%r8b, 422(%rsp)
	movb	391(%rdx), %r8b
	movb	%r8b, 423(%rsp)
	movb	392(%rdx), %r8b
	movb	%r8b, 424(%rsp)
	movb	393(%rdx), %r8b
	movb	%r8b, 425(%rsp)
	movb	394(%rdx), %r8b
	movb	%r8b, 426(%rsp)
	movb	395(%rdx), %r8b
	movb	%r8b, 427(%rsp)
	movb	396(%rdx), %r8b
	movb	%r8b, 428(%rsp)
	movb	397(%rdx), %r8b
	movb	%r8b, 429(%rsp)
	movb	398(%rdx), %r8b
	movb	%r8b, 430(%rsp)
	movb	399(%rdx), %r8b
	movb	%r8b, 431(%rsp)
	movb	400(%rdx), %r8b
	movb	%r8b, 432(%rsp)
	movb	401(%rdx), %r8b
	movb	%r8b, 433(%rsp)
	movb	402(%rdx), %r8b
	movb	%r8b, 434(%rsp)
	movb	403(%rdx), %r8b
	movb	%r8b, 435(%rsp)
	movb	404(%rdx), %r8b
	movb	%r8b, 436(%rsp)
	movb	405(%rdx), %r8b
	movb	%r8b, 437(%rsp)
	movb	406(%rdx), %r8b
	movb	%r8b, 438(%rsp)
	movb	407(%rdx), %r8b
	movb	%r8b, 439(%rsp)
	movb	408(%rdx), %r8b
	movb	%r8b, 440(%rsp)
	movb	409(%rdx), %r8b
	movb	%r8b, 441(%rsp)
	movb	410(%rdx), %r8b
	movb	%r8b, 442(%rsp)
	movb	411(%rdx), %r8b
	movb	%r8b, 443(%rsp)
	movb	412(%rdx), %r8b
	movb	%r8b, 444(%rsp)
	movb	413(%rdx), %r8b
	movb	%r8b, 445(%rsp)
	movb	414(%rdx), %r8b
	movb	%r8b, 446(%rsp)
	movb	415(%rdx), %r8b
	movb	%r8b, 447(%rsp)
	movb	416(%rdx), %r8b
	movb	%r8b, 448(%rsp)
	movb	417(%rdx), %r8b
	movb	%r8b, 449(%rsp)
	movb	418(%rdx), %r8b
	movb	%r8b, 450(%rsp)
	movb	419(%rdx), %r8b
	movb	%r8b, 451(%rsp)
	movb	420(%rdx), %r8b
	movb	%r8b, 452(%rsp)
	movb	421(%rdx), %r8b
	movb	%r8b, 453(%rsp)
	movb	422(%rdx), %r8b
	movb	%r8b, 454(%rsp)
	movb	423(%rdx), %r8b
	movb	%r8b, 455(%rsp)
	movb	424(%rdx), %r8b
	movb	%r8b, 456(%rsp)
	movb	425(%rdx), %r8b
	movb	%r8b, 457(%rsp)
	movb	426(%rdx), %r8b
	movb	%r8b, 458(%rsp)
	movb	427(%rdx), %r8b
	movb	%r8b, 459(%rsp)
	movb	428(%rdx), %r8b
	movb	%r8b, 460(%rsp)
	movb	429(%rdx), %r8b
	movb	%r8b, 461(%rsp)
	movb	430(%rdx), %r8b
	movb	%r8b, 462(%rsp)
	movb	431(%rdx), %r8b
	movb	%r8b, 463(%rsp)
	movb	432(%rdx), %r8b
	movb	%r8b, 464(%rsp)
	movb	433(%rdx), %r8b
	movb	%r8b, 465(%rsp)
	movb	434(%rdx), %r8b
	movb	%r8b, 466(%rsp)
	movb	435(%rdx), %r8b
	movb	%r8b, 467(%rsp)
	movb	436(%rdx), %r8b
	movb	%r8b, 468(%rsp)
	movb	437(%rdx), %r8b
	movb	%r8b, 469(%rsp)
	movb	438(%rdx), %r8b
	movb	%r8b, 470(%rsp)
	movb	439(%rdx), %r8b
	movb	%r8b, 471(%rsp)
	movb	440(%rdx), %r8b
	movb	%r8b, 472(%rsp)
	movb	441(%rdx), %r8b
	movb	%r8b, 473(%rsp)
	movb	442(%rdx), %r8b
	movb	%r8b, 474(%rsp)
	movb	443(%rdx), %r8b
	movb	%r8b, 475(%rsp)
	movb	444(%rdx), %r8b
	movb	%r8b, 476(%rsp)
	movb	445(%rdx), %r8b
	movb	%r8b, 477(%rsp)
	movb	446(%rdx), %r8b
	movb	%r8b, 478(%rsp)
	movb	447(%rdx), %r8b
	movb	%r8b, 479(%rsp)
	movb	448(%rdx), %r8b
	movb	%r8b, 480(%rsp)
	movb	449(%rdx), %r8b
	movb	%r8b, 481(%rsp)
	movb	450(%rdx), %r8b
	movb	%r8b, 482(%rsp)
	movb	451(%rdx), %r8b
	movb	%r8b, 483(%rsp)
	movb	452(%rdx), %r8b
	movb	%r8b, 484(%rsp)
	movb	453(%rdx), %r8b
	movb	%r8b, 485(%rsp)
	movb	454(%rdx), %r8b
	movb	%r8b, 486(%rsp)
	movb	455(%rdx), %r8b
	movb	%r8b, 487(%rsp)
	movb	456(%rdx), %r8b
	movb	%r8b, 488(%rsp)
	movb	457(%rdx), %r8b
	movb	%r8b, 489(%rsp)
	movb	458(%rdx), %r8b
	movb	%r8b, 490(%rsp)
	movb	459(%rdx), %r8b
	movb	%r8b, 491(%rsp)
	movb	460(%rdx), %r8b
	movb	%r8b, 492(%rsp)
	movb	461(%rdx), %r8b
	movb	%r8b, 493(%rsp)
	movb	462(%rdx), %r8b
	movb	%r8b, 494(%rsp)
	movb	463(%rdx), %r8b
	movb	%r8b, 495(%rsp)
	movb	464(%rdx), %r8b
	movb	%r8b, 496(%rsp)
	movb	465(%rdx), %r8b
	movb	%r8b, 497(%rsp)
	movb	466(%rdx), %r8b
	movb	%r8b, 498(%rsp)
	movb	467(%rdx), %r8b
	movb	%r8b, 499(%rsp)
	movb	468(%rdx), %r8b
	movb	%r8b, 500(%rsp)
	movb	469(%rdx), %r8b
	movb	%r8b, 501(%rsp)
	movb	470(%rdx), %r8b
	movb	%r8b, 502(%rsp)
	movb	471(%rdx), %r8b
	movb	%r8b, 503(%rsp)
	movb	472(%rdx), %r8b
	movb	%r8b, 504(%rsp)
	movb	473(%rdx), %r8b
	movb	%r8b, 505(%rsp)
	movb	474(%rdx), %r8b
	movb	%r8b, 506(%rsp)
	movb	475(%rdx), %r8b
	movb	%r8b, 507(%rsp)
	movb	476(%rdx), %r8b
	movb	%r8b, 508(%rsp)
	movb	477(%rdx), %r8b
	movb	%r8b, 509(%rsp)
	movb	478(%rdx), %r8b
	movb	%r8b, 510(%rsp)
	movb	479(%rdx), %r8b
	movb	%r8b, 511(%rsp)
	movb	480(%rdx), %r8b
	movb	%r8b, 512(%rsp)
	movb	481(%rdx), %r8b
	movb	%r8b, 513(%rsp)
	movb	482(%rdx), %r8b
	movb	%r8b, 514(%rsp)
	movb	483(%rdx), %r8b
	movb	%r8b, 515(%rsp)
	movb	484(%rdx), %r8b
	movb	%r8b, 516(%rsp)
	movb	485(%rdx), %r8b
	movb	%r8b, 517(%rsp)
	movb	486(%rdx), %r8b
	movb	%r8b, 518(%rsp)
	movb	487(%rdx), %r8b
	movb	%r8b, 519(%rsp)
	movb	488(%rdx), %r8b
	movb	%r8b, 520(%rsp)
	movb	489(%rdx), %r8b
	movb	%r8b, 521(%rsp)
	movb	490(%rdx), %r8b
	movb	%r8b, 522(%rsp)
	movb	491(%rdx), %r8b
	movb	%r8b, 523(%rsp)
	movb	492(%rdx), %r8b
	movb	%r8b, 524(%rsp)
	movb	493(%rdx), %r8b
	movb	%r8b, 525(%rsp)
	movb	494(%rdx), %r8b
	movb	%r8b, 526(%rsp)
	movb	495(%rdx), %r8b
	movb	%r8b, 527(%rsp)
	movb	496(%rdx), %r8b
	movb	%r8b, 528(%rsp)
	movb	497(%rdx), %r8b
	movb	%r8b, 529(%rsp)
	movb	498(%rdx), %r8b
	movb	%r8b, 530(%rsp)
	movb	499(%rdx), %r8b
	movb	%r8b, 531(%rsp)
	movb	500(%rdx), %r8b
	movb	%r8b, 532(%rsp)
	movb	501(%rdx), %r8b
	movb	%r8b, 533(%rsp)
	movb	502(%rdx), %r8b
	movb	%r8b, 534(%rsp)
	movb	503(%rdx), %r8b
	movb	%r8b, 535(%rsp)
	movb	504(%rdx), %r8b
	movb	%r8b, 536(%rsp)
	movb	505(%rdx), %r8b
	movb	%r8b, 537(%rsp)
	movb	506(%rdx), %r8b
	movb	%r8b, 538(%rsp)
	movb	507(%rdx), %r8b
	movb	%r8b, 539(%rsp)
	movb	508(%rdx), %r8b
	movb	%r8b, 540(%rsp)
	movb	509(%rdx), %r8b
	movb	%r8b, 541(%rsp)
	movb	510(%rdx), %r8b
	movb	%r8b, 542(%rsp)
	movb	511(%rdx), %r8b
	movb	%r8b, 543(%rsp)
	movb	512(%rdx), %r8b
	movb	%r8b, 544(%rsp)
	movb	513(%rdx), %r8b
	movb	%r8b, 545(%rsp)
	movb	514(%rdx), %r8b
	movb	%r8b, 546(%rsp)
	movb	515(%rdx), %r8b
	movb	%r8b, 547(%rsp)
	movb	516(%rdx), %r8b
	movb	%r8b, 548(%rsp)
	movb	517(%rdx), %r8b
	movb	%r8b, 549(%rsp)
	movb	518(%rdx), %r8b
	movb	%r8b, 550(%rsp)
	movb	519(%rdx), %r8b
	movb	%r8b, 551(%rsp)
	movb	520(%rdx), %r8b
	movb	%r8b, 552(%rsp)
	movb	521(%rdx), %r8b
	movb	%r8b, 553(%rsp)
	movb	522(%rdx), %r8b
	movb	%r8b, 554(%rsp)
	movb	523(%rdx), %r8b
	movb	%r8b, 555(%rsp)
	movb	524(%rdx), %r8b
	movb	%r8b, 556(%rsp)
	movb	525(%rdx), %r8b
	movb	%r8b, 557(%rsp)
	movb	526(%rdx), %r8b
	movb	%r8b, 558(%rsp)
	movb	527(%rdx), %r8b
	movb	%r8b, 559(%rsp)
	movb	528(%rdx), %r8b
	movb	%r8b, 560(%rsp)
	movb	529(%rdx), %r8b
	movb	%r8b, 561(%rsp)
	movb	530(%rdx), %r8b
	movb	%r8b, 562(%rsp)
	movb	531(%rdx), %r8b
	movb	%r8b, 563(%rsp)
	movb	532(%rdx), %r8b
	movb	%r8b, 564(%rsp)
	movb	533(%rdx), %r8b
	movb	%r8b, 565(%rsp)
	movb	534(%rdx), %r8b
	movb	%r8b, 566(%rsp)
	movb	535(%rdx), %r8b
	movb	%r8b, 567(%rsp)
	movb	536(%rdx), %r8b
	movb	%r8b, 568(%rsp)
	movb	537(%rdx), %r8b
	movb	%r8b, 569(%rsp)
	movb	538(%rdx), %r8b
	movb	%r8b, 570(%rsp)
	movb	539(%rdx), %r8b
	movb	%r8b, 571(%rsp)
	movb	540(%rdx), %r8b
	movb	%r8b, 572(%rsp)
	movb	541(%rdx), %r8b
	movb	%r8b, 573(%rsp)
	movb	542(%rdx), %r8b
	movb	%r8b, 574(%rsp)
	movb	543(%rdx), %r8b
	movb	%r8b, 575(%rsp)
	movb	544(%rdx), %r8b
	movb	%r8b, 576(%rsp)
	movb	545(%rdx), %r8b
	movb	%r8b, 577(%rsp)
	movb	546(%rdx), %r8b
	movb	%r8b, 578(%rsp)
	movb	547(%rdx), %r8b
	movb	%r8b, 579(%rsp)
	movb	548(%rdx), %r8b
	movb	%r8b, 580(%rsp)
	movb	549(%rdx), %r8b
	movb	%r8b, 581(%rsp)
	movb	550(%rdx), %r8b
	movb	%r8b, 582(%rsp)
	movb	551(%rdx), %r8b
	movb	%r8b, 583(%rsp)
	movb	552(%rdx), %r8b
	movb	%r8b, 584(%rsp)
	movb	553(%rdx), %r8b
	movb	%r8b, 585(%rsp)
	movb	554(%rdx), %r8b
	movb	%r8b, 586(%rsp)
	movb	555(%rdx), %r8b
	movb	%r8b, 587(%rsp)
	movb	556(%rdx), %r8b
	movb	%r8b, 588(%rsp)
	movb	557(%rdx), %r8b
	movb	%r8b, 589(%rsp)
	movb	558(%rdx), %r8b
	movb	%r8b, 590(%rsp)
	movb	559(%rdx), %r8b
	movb	%r8b, 591(%rsp)
	movb	560(%rdx), %r8b
	movb	%r8b, 592(%rsp)
	movb	561(%rdx), %r8b
	movb	%r8b, 593(%rsp)
	movb	562(%rdx), %r8b
	movb	%r8b, 594(%rsp)
	movb	563(%rdx), %r8b
	movb	%r8b, 595(%rsp)
	movb	564(%rdx), %r8b
	movb	%r8b, 596(%rsp)
	movb	565(%rdx), %r8b
	movb	%r8b, 597(%rsp)
	movb	566(%rdx), %r8b
	movb	%r8b, 598(%rsp)
	movb	567(%rdx), %r8b
	movb	%r8b, 599(%rsp)
	movb	568(%rdx), %r8b
	movb	%r8b, 600(%rsp)
	movb	569(%rdx), %r8b
	movb	%r8b, 601(%rsp)
	movb	570(%rdx), %r8b
	movb	%r8b, 602(%rsp)
	movb	571(%rdx), %r8b
	movb	%r8b, 603(%rsp)
	movb	572(%rdx), %r8b
	movb	%r8b, 604(%rsp)
	movb	573(%rdx), %r8b
	movb	%r8b, 605(%rsp)
	movb	574(%rdx), %r8b
	movb	%r8b, 606(%rsp)
	movb	575(%rdx), %r8b
	movb	%r8b, 607(%rsp)
	movb	576(%rdx), %r8b
	movb	%r8b, 608(%rsp)
	movb	577(%rdx), %r8b
	movb	%r8b, 609(%rsp)
	movb	578(%rdx), %r8b
	movb	%r8b, 610(%rsp)
	movb	579(%rdx), %r8b
	movb	%r8b, 611(%rsp)
	movb	580(%rdx), %r8b
	movb	%r8b, 612(%rsp)
	movb	581(%rdx), %r8b
	movb	%r8b, 613(%rsp)
	movb	582(%rdx), %r8b
	movb	%r8b, 614(%rsp)
	movb	583(%rdx), %r8b
	movb	%r8b, 615(%rsp)
	movb	584(%rdx), %r8b
	movb	%r8b, 616(%rsp)
	movb	585(%rdx), %r8b
	movb	%r8b, 617(%rsp)
	movb	586(%rdx), %r8b
	movb	%r8b, 618(%rsp)
	movb	587(%rdx), %r8b
	movb	%r8b, 619(%rsp)
	movb	588(%rdx), %r8b
	movb	%r8b, 620(%rsp)
	movb	589(%rdx), %r8b
	movb	%r8b, 621(%rsp)
	movb	590(%rdx), %r8b
	movb	%r8b, 622(%rsp)
	movb	591(%rdx), %r8b
	movb	%r8b, 623(%rsp)
	movb	592(%rdx), %r8b
	movb	%r8b, 624(%rsp)
	movb	593(%rdx), %r8b
	movb	%r8b, 625(%rsp)
	movb	594(%rdx), %r8b
	movb	%r8b, 626(%rsp)
	movb	595(%rdx), %r8b
	movb	%r8b, 627(%rsp)
	movb	596(%rdx), %r8b
	movb	%r8b, 628(%rsp)
	movb	597(%rdx), %r8b
	movb	%r8b, 629(%rsp)
	movb	598(%rdx), %r8b
	movb	%r8b, 630(%rsp)
	movb	599(%rdx), %r8b
	movb	%r8b, 631(%rsp)
	movb	600(%rdx), %r8b
	movb	%r8b, 632(%rsp)
	movb	601(%rdx), %r8b
	movb	%r8b, 633(%rsp)
	movb	602(%rdx), %r8b
	movb	%r8b, 634(%rsp)
	movb	603(%rdx), %r8b
	movb	%r8b, 635(%rsp)
	movb	604(%rdx), %r8b
	movb	%r8b, 636(%rsp)
	movb	605(%rdx), %r8b
	movb	%r8b, 637(%rsp)
	movb	606(%rdx), %r8b
	movb	%r8b, 638(%rsp)
	movb	607(%rdx), %r8b
	movb	%r8b, 639(%rsp)
	movb	608(%rdx), %r8b
	movb	%r8b, 640(%rsp)
	movb	609(%rdx), %r8b
	movb	%r8b, 641(%rsp)
	movb	610(%rdx), %r8b
	movb	%r8b, 642(%rsp)
	movb	611(%rdx), %r8b
	movb	%r8b, 643(%rsp)
	movb	612(%rdx), %r8b
	movb	%r8b, 644(%rsp)
	movb	613(%rdx), %r8b
	movb	%r8b, 645(%rsp)
	movb	614(%rdx), %r8b
	movb	%r8b, 646(%rsp)
	movb	615(%rdx), %r8b
	movb	%r8b, 647(%rsp)
	movb	616(%rdx), %r8b
	movb	%r8b, 648(%rsp)
	movb	617(%rdx), %r8b
	movb	%r8b, 649(%rsp)
	movb	618(%rdx), %r8b
	movb	%r8b, 650(%rsp)
	movb	619(%rdx), %r8b
	movb	%r8b, 651(%rsp)
	movb	620(%rdx), %r8b
	movb	%r8b, 652(%rsp)
	movb	621(%rdx), %r8b
	movb	%r8b, 653(%rsp)
	movb	622(%rdx), %r8b
	movb	%r8b, 654(%rsp)
	movb	623(%rdx), %r8b
	movb	%r8b, 655(%rsp)
	movb	624(%rdx), %r8b
	movb	%r8b, 656(%rsp)
	movb	625(%rdx), %r8b
	movb	%r8b, 657(%rsp)
	movb	626(%rdx), %r8b
	movb	%r8b, 658(%rsp)
	movb	627(%rdx), %r8b
	movb	%r8b, 659(%rsp)
	movb	628(%rdx), %r8b
	movb	%r8b, 660(%rsp)
	movb	629(%rdx), %r8b
	movb	%r8b, 661(%rsp)
	movb	630(%rdx), %r8b
	movb	%r8b, 662(%rsp)
	movb	631(%rdx), %r8b
	movb	%r8b, 663(%rsp)
	movb	632(%rdx), %r8b
	movb	%r8b, 664(%rsp)
	movb	633(%rdx), %r8b
	movb	%r8b, 665(%rsp)
	movb	634(%rdx), %r8b
	movb	%r8b, 666(%rsp)
	movb	635(%rdx), %r8b
	movb	%r8b, 667(%rsp)
	movb	636(%rdx), %r8b
	movb	%r8b, 668(%rsp)
	movb	637(%rdx), %r8b
	movb	%r8b, 669(%rsp)
	movb	638(%rdx), %r8b
	movb	%r8b, 670(%rsp)
	movb	639(%rdx), %r8b
	movb	%r8b, 671(%rsp)
	movb	640(%rdx), %r8b
	movb	%r8b, 672(%rsp)
	movb	641(%rdx), %r8b
	movb	%r8b, 673(%rsp)
	movb	642(%rdx), %r8b
	movb	%r8b, 674(%rsp)
	movb	643(%rdx), %r8b
	movb	%r8b, 675(%rsp)
	movb	644(%rdx), %r8b
	movb	%r8b, 676(%rsp)
	movb	645(%rdx), %r8b
	movb	%r8b, 677(%rsp)
	movb	646(%rdx), %r8b
	movb	%r8b, 678(%rsp)
	movb	647(%rdx), %r8b
	movb	%r8b, 679(%rsp)
	movb	648(%rdx), %r8b
	movb	%r8b, 680(%rsp)
	movb	649(%rdx), %r8b
	movb	%r8b, 681(%rsp)
	movb	650(%rdx), %r8b
	movb	%r8b, 682(%rsp)
	movb	651(%rdx), %r8b
	movb	%r8b, 683(%rsp)
	movb	652(%rdx), %r8b
	movb	%r8b, 684(%rsp)
	movb	653(%rdx), %r8b
	movb	%r8b, 685(%rsp)
	movb	654(%rdx), %r8b
	movb	%r8b, 686(%rsp)
	movb	655(%rdx), %r8b
	movb	%r8b, 687(%rsp)
	movb	656(%rdx), %r8b
	movb	%r8b, 688(%rsp)
	movb	657(%rdx), %r8b
	movb	%r8b, 689(%rsp)
	movb	658(%rdx), %r8b
	movb	%r8b, 690(%rsp)
	movb	659(%rdx), %r8b
	movb	%r8b, 691(%rsp)
	movb	660(%rdx), %r8b
	movb	%r8b, 692(%rsp)
	movb	661(%rdx), %r8b
	movb	%r8b, 693(%rsp)
	movb	662(%rdx), %r8b
	movb	%r8b, 694(%rsp)
	movb	663(%rdx), %r8b
	movb	%r8b, 695(%rsp)
	movb	664(%rdx), %r8b
	movb	%r8b, 696(%rsp)
	movb	665(%rdx), %r8b
	movb	%r8b, 697(%rsp)
	movb	666(%rdx), %r8b
	movb	%r8b, 698(%rsp)
	movb	667(%rdx), %r8b
	movb	%r8b, 699(%rsp)
	movb	668(%rdx), %r8b
	movb	%r8b, 700(%rsp)
	movb	669(%rdx), %r8b
	movb	%r8b, 701(%rsp)
	movb	670(%rdx), %r8b
	movb	%r8b, 702(%rsp)
	movb	671(%rdx), %r8b
	movb	%r8b, 703(%rsp)
	movb	672(%rdx), %r8b
	movb	%r8b, 704(%rsp)
	movb	673(%rdx), %r8b
	movb	%r8b, 705(%rsp)
	movb	674(%rdx), %r8b
	movb	%r8b, 706(%rsp)
	movb	675(%rdx), %r8b
	movb	%r8b, 707(%rsp)
	movb	676(%rdx), %r8b
	movb	%r8b, 708(%rsp)
	movb	677(%rdx), %r8b
	movb	%r8b, 709(%rsp)
	movb	678(%rdx), %r8b
	movb	%r8b, 710(%rsp)
	movb	679(%rdx), %r8b
	movb	%r8b, 711(%rsp)
	movb	680(%rdx), %r8b
	movb	%r8b, 712(%rsp)
	movb	681(%rdx), %r8b
	movb	%r8b, 713(%rsp)
	movb	682(%rdx), %r8b
	movb	%r8b, 714(%rsp)
	movb	683(%rdx), %r8b
	movb	%r8b, 715(%rsp)
	movb	684(%rdx), %r8b
	movb	%r8b, 716(%rsp)
	movb	685(%rdx), %r8b
	movb	%r8b, 717(%rsp)
	movb	686(%rdx), %r8b
	movb	%r8b, 718(%rsp)
	movb	687(%rdx), %r8b
	movb	%r8b, 719(%rsp)
	movb	688(%rdx), %r8b
	movb	%r8b, 720(%rsp)
	movb	689(%rdx), %r8b
	movb	%r8b, 721(%rsp)
	movb	690(%rdx), %r8b
	movb	%r8b, 722(%rsp)
	movb	691(%rdx), %r8b
	movb	%r8b, 723(%rsp)
	movb	692(%rdx), %r8b
	movb	%r8b, 724(%rsp)
	movb	693(%rdx), %r8b
	movb	%r8b, 725(%rsp)
	movb	694(%rdx), %r8b
	movb	%r8b, 726(%rsp)
	movb	695(%rdx), %r8b
	movb	%r8b, 727(%rsp)
	movb	696(%rdx), %r8b
	movb	%r8b, 728(%rsp)
	movb	697(%rdx), %r8b
	movb	%r8b, 729(%rsp)
	movb	698(%rdx), %r8b
	movb	%r8b, 730(%rsp)
	movb	699(%rdx), %r8b
	movb	%r8b, 731(%rsp)
	movb	700(%rdx), %r8b
	movb	%r8b, 732(%rsp)
	movb	701(%rdx), %r8b
	movb	%r8b, 733(%rsp)
	movb	702(%rdx), %r8b
	movb	%r8b, 734(%rsp)
	movb	703(%rdx), %r8b
	movb	%r8b, 735(%rsp)
	movb	704(%rdx), %r8b
	movb	%r8b, 736(%rsp)
	movb	705(%rdx), %r8b
	movb	%r8b, 737(%rsp)
	movb	706(%rdx), %r8b
	movb	%r8b, 738(%rsp)
	movb	707(%rdx), %r8b
	movb	%r8b, 739(%rsp)
	movb	708(%rdx), %r8b
	movb	%r8b, 740(%rsp)
	movb	709(%rdx), %r8b
	movb	%r8b, 741(%rsp)
	movb	710(%rdx), %r8b
	movb	%r8b, 742(%rsp)
	movb	711(%rdx), %r8b
	movb	%r8b, 743(%rsp)
	movb	712(%rdx), %r8b
	movb	%r8b, 744(%rsp)
	movb	713(%rdx), %r8b
	movb	%r8b, 745(%rsp)
	movb	714(%rdx), %r8b
	movb	%r8b, 746(%rsp)
	movb	715(%rdx), %r8b
	movb	%r8b, 747(%rsp)
	movb	716(%rdx), %r8b
	movb	%r8b, 748(%rsp)
	movb	717(%rdx), %r8b
	movb	%r8b, 749(%rsp)
	movb	718(%rdx), %r8b
	movb	%r8b, 750(%rsp)
	movb	719(%rdx), %r8b
	movb	%r8b, 751(%rsp)
	movb	720(%rdx), %r8b
	movb	%r8b, 752(%rsp)
	movb	721(%rdx), %r8b
	movb	%r8b, 753(%rsp)
	movb	722(%rdx), %r8b
	movb	%r8b, 754(%rsp)
	movb	723(%rdx), %r8b
	movb	%r8b, 755(%rsp)
	movb	724(%rdx), %r8b
	movb	%r8b, 756(%rsp)
	movb	725(%rdx), %r8b
	movb	%r8b, 757(%rsp)
	movb	726(%rdx), %r8b
	movb	%r8b, 758(%rsp)
	movb	727(%rdx), %r8b
	movb	%r8b, 759(%rsp)
	movb	728(%rdx), %r8b
	movb	%r8b, 760(%rsp)
	movb	729(%rdx), %r8b
	movb	%r8b, 761(%rsp)
	movb	730(%rdx), %r8b
	movb	%r8b, 762(%rsp)
	movb	731(%rdx), %r8b
	movb	%r8b, 763(%rsp)
	movb	732(%rdx), %r8b
	movb	%r8b, 764(%rsp)
	movb	733(%rdx), %r8b
	movb	%r8b, 765(%rsp)
	movb	734(%rdx), %r8b
	movb	%r8b, 766(%rsp)
	movb	735(%rdx), %r8b
	movb	%r8b, 767(%rsp)
	movb	736(%rdx), %r8b
	movb	%r8b, 768(%rsp)
	movb	737(%rdx), %r8b
	movb	%r8b, 769(%rsp)
	movb	738(%rdx), %r8b
	movb	%r8b, 770(%rsp)
	movb	739(%rdx), %r8b
	movb	%r8b, 771(%rsp)
	movb	740(%rdx), %r8b
	movb	%r8b, 772(%rsp)
	movb	741(%rdx), %r8b
	movb	%r8b, 773(%rsp)
	movb	742(%rdx), %r8b
	movb	%r8b, 774(%rsp)
	movb	743(%rdx), %r8b
	movb	%r8b, 775(%rsp)
	movb	744(%rdx), %r8b
	movb	%r8b, 776(%rsp)
	movb	745(%rdx), %r8b
	movb	%r8b, 777(%rsp)
	movb	746(%rdx), %r8b
	movb	%r8b, 778(%rsp)
	movb	747(%rdx), %r8b
	movb	%r8b, 779(%rsp)
	movb	748(%rdx), %r8b
	movb	%r8b, 780(%rsp)
	movb	749(%rdx), %r8b
	movb	%r8b, 781(%rsp)
	movb	750(%rdx), %r8b
	movb	%r8b, 782(%rsp)
	movb	751(%rdx), %r8b
	movb	%r8b, 783(%rsp)
	movb	752(%rdx), %r8b
	movb	%r8b, 784(%rsp)
	movb	753(%rdx), %r8b
	movb	%r8b, 785(%rsp)
	movb	754(%rdx), %r8b
	movb	%r8b, 786(%rsp)
	movb	755(%rdx), %r8b
	movb	%r8b, 787(%rsp)
	movb	756(%rdx), %r8b
	movb	%r8b, 788(%rsp)
	movb	757(%rdx), %r8b
	movb	%r8b, 789(%rsp)
	movb	758(%rdx), %r8b
	movb	%r8b, 790(%rsp)
	movb	759(%rdx), %r8b
	movb	%r8b, 791(%rsp)
	movb	760(%rdx), %r8b
	movb	%r8b, 792(%rsp)
	movb	761(%rdx), %r8b
	movb	%r8b, 793(%rsp)
	movb	762(%rdx), %r8b
	movb	%r8b, 794(%rsp)
	movb	763(%rdx), %r8b
	movb	%r8b, 795(%rsp)
	movb	764(%rdx), %r8b
	movb	%r8b, 796(%rsp)
	movb	765(%rdx), %r8b
	movb	%r8b, 797(%rsp)
	movb	766(%rdx), %r8b
	movb	%r8b, 798(%rsp)
	movb	767(%rdx), %r8b
	movb	%r8b, 799(%rsp)
	movb	768(%rdx), %r8b
	movb	%r8b, 800(%rsp)
	movb	769(%rdx), %r8b
	movb	%r8b, 801(%rsp)
	movb	770(%rdx), %r8b
	movb	%r8b, 802(%rsp)
	movb	771(%rdx), %r8b
	movb	%r8b, 803(%rsp)
	movb	772(%rdx), %r8b
	movb	%r8b, 804(%rsp)
	movb	773(%rdx), %r8b
	movb	%r8b, 805(%rsp)
	movb	774(%rdx), %r8b
	movb	%r8b, 806(%rsp)
	movb	775(%rdx), %r8b
	movb	%r8b, 807(%rsp)
	movb	776(%rdx), %r8b
	movb	%r8b, 808(%rsp)
	movb	777(%rdx), %r8b
	movb	%r8b, 809(%rsp)
	movb	778(%rdx), %r8b
	movb	%r8b, 810(%rsp)
	movb	779(%rdx), %r8b
	movb	%r8b, 811(%rsp)
	movb	780(%rdx), %r8b
	movb	%r8b, 812(%rsp)
	movb	781(%rdx), %r8b
	movb	%r8b, 813(%rsp)
	movb	782(%rdx), %r8b
	movb	%r8b, 814(%rsp)
	movb	783(%rdx), %r8b
	movb	%r8b, 815(%rsp)
	movb	784(%rdx), %r8b
	movb	%r8b, 816(%rsp)
	movb	785(%rdx), %r8b
	movb	%r8b, 817(%rsp)
	movb	786(%rdx), %r8b
	movb	%r8b, 818(%rsp)
	movb	787(%rdx), %r8b
	movb	%r8b, 819(%rsp)
	movb	788(%rdx), %r8b
	movb	%r8b, 820(%rsp)
	movb	789(%rdx), %r8b
	movb	%r8b, 821(%rsp)
	movb	790(%rdx), %r8b
	movb	%r8b, 822(%rsp)
	movb	791(%rdx), %r8b
	movb	%r8b, 823(%rsp)
	movb	792(%rdx), %r8b
	movb	%r8b, 824(%rsp)
	movb	793(%rdx), %r8b
	movb	%r8b, 825(%rsp)
	movb	794(%rdx), %r8b
	movb	%r8b, 826(%rsp)
	movb	795(%rdx), %r8b
	movb	%r8b, 827(%rsp)
	movb	796(%rdx), %r8b
	movb	%r8b, 828(%rsp)
	movb	797(%rdx), %r8b
	movb	%r8b, 829(%rsp)
	movb	798(%rdx), %r8b
	movb	%r8b, 830(%rsp)
	movb	799(%rdx), %r8b
	movb	%r8b, 831(%rsp)
	movb	800(%rdx), %r8b
	movb	%r8b, 832(%rsp)
	movb	801(%rdx), %r8b
	movb	%r8b, 833(%rsp)
	movb	802(%rdx), %r8b
	movb	%r8b, 834(%rsp)
	movb	803(%rdx), %r8b
	movb	%r8b, 835(%rsp)
	movb	804(%rdx), %r8b
	movb	%r8b, 836(%rsp)
	movb	805(%rdx), %r8b
	movb	%r8b, 837(%rsp)
	movb	806(%rdx), %r8b
	movb	%r8b, 838(%rsp)
	movb	807(%rdx), %r8b
	movb	%r8b, 839(%rsp)
	movb	808(%rdx), %r8b
	movb	%r8b, 840(%rsp)
	movb	809(%rdx), %r8b
	movb	%r8b, 841(%rsp)
	movb	810(%rdx), %r8b
	movb	%r8b, 842(%rsp)
	movb	811(%rdx), %r8b
	movb	%r8b, 843(%rsp)
	movb	812(%rdx), %r8b
	movb	%r8b, 844(%rsp)
	movb	813(%rdx), %r8b
	movb	%r8b, 845(%rsp)
	movb	814(%rdx), %r8b
	movb	%r8b, 846(%rsp)
	movb	815(%rdx), %r8b
	movb	%r8b, 847(%rsp)
	movb	816(%rdx), %r8b
	movb	%r8b, 848(%rsp)
	movb	817(%rdx), %r8b
	movb	%r8b, 849(%rsp)
	movb	818(%rdx), %r8b
	movb	%r8b, 850(%rsp)
	movb	819(%rdx), %r8b
	movb	%r8b, 851(%rsp)
	movb	820(%rdx), %r8b
	movb	%r8b, 852(%rsp)
	movb	821(%rdx), %r8b
	movb	%r8b, 853(%rsp)
	movb	822(%rdx), %r8b
	movb	%r8b, 854(%rsp)
	movb	823(%rdx), %r8b
	movb	%r8b, 855(%rsp)
	movb	824(%rdx), %r8b
	movb	%r8b, 856(%rsp)
	movb	825(%rdx), %r8b
	movb	%r8b, 857(%rsp)
	movb	826(%rdx), %r8b
	movb	%r8b, 858(%rsp)
	movb	827(%rdx), %r8b
	movb	%r8b, 859(%rsp)
	movb	828(%rdx), %r8b
	movb	%r8b, 860(%rsp)
	movb	829(%rdx), %r8b
	movb	%r8b, 861(%rsp)
	movb	830(%rdx), %r8b
	movb	%r8b, 862(%rsp)
	movb	831(%rdx), %r8b
	movb	%r8b, 863(%rsp)
	movb	832(%rdx), %r8b
	movb	%r8b, 864(%rsp)
	movb	833(%rdx), %r8b
	movb	%r8b, 865(%rsp)
	movb	834(%rdx), %r8b
	movb	%r8b, 866(%rsp)
	movb	835(%rdx), %r8b
	movb	%r8b, 867(%rsp)
	movb	836(%rdx), %r8b
	movb	%r8b, 868(%rsp)
	movb	837(%rdx), %r8b
	movb	%r8b, 869(%rsp)
	movb	838(%rdx), %r8b
	movb	%r8b, 870(%rsp)
	movb	839(%rdx), %r8b
	movb	%r8b, 871(%rsp)
	movb	840(%rdx), %r8b
	movb	%r8b, 872(%rsp)
	movb	841(%rdx), %r8b
	movb	%r8b, 873(%rsp)
	movb	842(%rdx), %r8b
	movb	%r8b, 874(%rsp)
	movb	843(%rdx), %r8b
	movb	%r8b, 875(%rsp)
	movb	844(%rdx), %r8b
	movb	%r8b, 876(%rsp)
	movb	845(%rdx), %r8b
	movb	%r8b, 877(%rsp)
	movb	846(%rdx), %r8b
	movb	%r8b, 878(%rsp)
	movb	847(%rdx), %r8b
	movb	%r8b, 879(%rsp)
	movb	848(%rdx), %r8b
	movb	%r8b, 880(%rsp)
	movb	849(%rdx), %r8b
	movb	%r8b, 881(%rsp)
	movb	850(%rdx), %r8b
	movb	%r8b, 882(%rsp)
	movb	851(%rdx), %r8b
	movb	%r8b, 883(%rsp)
	movb	852(%rdx), %r8b
	movb	%r8b, 884(%rsp)
	movb	853(%rdx), %r8b
	movb	%r8b, 885(%rsp)
	movb	854(%rdx), %r8b
	movb	%r8b, 886(%rsp)
	movb	855(%rdx), %r8b
	movb	%r8b, 887(%rsp)
	movb	856(%rdx), %r8b
	movb	%r8b, 888(%rsp)
	movb	857(%rdx), %r8b
	movb	%r8b, 889(%rsp)
	movb	858(%rdx), %r8b
	movb	%r8b, 890(%rsp)
	movb	859(%rdx), %r8b
	movb	%r8b, 891(%rsp)
	movb	860(%rdx), %r8b
	movb	%r8b, 892(%rsp)
	movb	861(%rdx), %r8b
	movb	%r8b, 893(%rsp)
	movb	862(%rdx), %r8b
	movb	%r8b, 894(%rsp)
	movb	863(%rdx), %r8b
	movb	%r8b, 895(%rsp)
	movb	864(%rdx), %r8b
	movb	%r8b, 896(%rsp)
	movb	865(%rdx), %r8b
	movb	%r8b, 897(%rsp)
	movb	866(%rdx), %r8b
	movb	%r8b, 898(%rsp)
	movb	867(%rdx), %r8b
	movb	%r8b, 899(%rsp)
	movb	868(%rdx), %r8b
	movb	%r8b, 900(%rsp)
	movb	869(%rdx), %r8b
	movb	%r8b, 901(%rsp)
	movb	870(%rdx), %r8b
	movb	%r8b, 902(%rsp)
	movb	871(%rdx), %r8b
	movb	%r8b, 903(%rsp)
	movb	872(%rdx), %r8b
	movb	%r8b, 904(%rsp)
	movb	873(%rdx), %r8b
	movb	%r8b, 905(%rsp)
	movb	874(%rdx), %r8b
	movb	%r8b, 906(%rsp)
	movb	875(%rdx), %r8b
	movb	%r8b, 907(%rsp)
	movb	876(%rdx), %r8b
	movb	%r8b, 908(%rsp)
	movb	877(%rdx), %r8b
	movb	%r8b, 909(%rsp)
	movb	878(%rdx), %r8b
	movb	%r8b, 910(%rsp)
	movb	879(%rdx), %r8b
	movb	%r8b, 911(%rsp)
	movb	880(%rdx), %r8b
	movb	%r8b, 912(%rsp)
	movb	881(%rdx), %r8b
	movb	%r8b, 913(%rsp)
	movb	882(%rdx), %r8b
	movb	%r8b, 914(%rsp)
	movb	883(%rdx), %r8b
	movb	%r8b, 915(%rsp)
	movb	884(%rdx), %r8b
	movb	%r8b, 916(%rsp)
	movb	885(%rdx), %r8b
	movb	%r8b, 917(%rsp)
	movb	886(%rdx), %r8b
	movb	%r8b, 918(%rsp)
	movb	887(%rdx), %r8b
	movb	%r8b, 919(%rsp)
	movb	888(%rdx), %r8b
	movb	%r8b, 920(%rsp)
	movb	889(%rdx), %r8b
	movb	%r8b, 921(%rsp)
	movb	890(%rdx), %r8b
	movb	%r8b, 922(%rsp)
	movb	891(%rdx), %r8b
	movb	%r8b, 923(%rsp)
	movb	892(%rdx), %r8b
	movb	%r8b, 924(%rsp)
	movb	893(%rdx), %r8b
	movb	%r8b, 925(%rsp)
	movb	894(%rdx), %r8b
	movb	%r8b, 926(%rsp)
	movb	895(%rdx), %r8b
	movb	%r8b, 927(%rsp)
	movb	896(%rdx), %r8b
	movb	%r8b, 928(%rsp)
	movb	897(%rdx), %r8b
	movb	%r8b, 929(%rsp)
	movb	898(%rdx), %r8b
	movb	%r8b, 930(%rsp)
	movb	899(%rdx), %r8b
	movb	%r8b, 931(%rsp)
	movb	900(%rdx), %r8b
	movb	%r8b, 932(%rsp)
	movb	901(%rdx), %r8b
	movb	%r8b, 933(%rsp)
	movb	902(%rdx), %r8b
	movb	%r8b, 934(%rsp)
	movb	903(%rdx), %r8b
	movb	%r8b, 935(%rsp)
	movb	904(%rdx), %r8b
	movb	%r8b, 936(%rsp)
	movb	905(%rdx), %r8b
	movb	%r8b, 937(%rsp)
	movb	906(%rdx), %r8b
	movb	%r8b, 938(%rsp)
	movb	907(%rdx), %r8b
	movb	%r8b, 939(%rsp)
	movb	908(%rdx), %r8b
	movb	%r8b, 940(%rsp)
	movb	909(%rdx), %r8b
	movb	%r8b, 941(%rsp)
	movb	910(%rdx), %r8b
	movb	%r8b, 942(%rsp)
	movb	911(%rdx), %r8b
	movb	%r8b, 943(%rsp)
	movb	912(%rdx), %r8b
	movb	%r8b, 944(%rsp)
	movb	913(%rdx), %r8b
	movb	%r8b, 945(%rsp)
	movb	914(%rdx), %r8b
	movb	%r8b, 946(%rsp)
	movb	915(%rdx), %r8b
	movb	%r8b, 947(%rsp)
	movb	916(%rdx), %r8b
	movb	%r8b, 948(%rsp)
	movb	917(%rdx), %r8b
	movb	%r8b, 949(%rsp)
	movb	918(%rdx), %r8b
	movb	%r8b, 950(%rsp)
	movb	919(%rdx), %r8b
	movb	%r8b, 951(%rsp)
	movb	920(%rdx), %r8b
	movb	%r8b, 952(%rsp)
	movb	921(%rdx), %r8b
	movb	%r8b, 953(%rsp)
	movb	922(%rdx), %r8b
	movb	%r8b, 954(%rsp)
	movb	923(%rdx), %r8b
	movb	%r8b, 955(%rsp)
	movb	924(%rdx), %r8b
	movb	%r8b, 956(%rsp)
	movb	925(%rdx), %r8b
	movb	%r8b, 957(%rsp)
	movb	926(%rdx), %r8b
	movb	%r8b, 958(%rsp)
	movb	927(%rdx), %r8b
	movb	%r8b, 959(%rsp)
	movb	928(%rdx), %r8b
	movb	%r8b, 960(%rsp)
	movb	929(%rdx), %r8b
	movb	%r8b, 961(%rsp)
	movb	930(%rdx), %r8b
	movb	%r8b, 962(%rsp)
	movb	931(%rdx), %r8b
	movb	%r8b, 963(%rsp)
	movb	932(%rdx), %r8b
	movb	%r8b, 964(%rsp)
	movb	933(%rdx), %r8b
	movb	%r8b, 965(%rsp)
	movb	934(%rdx), %r8b
	movb	%r8b, 966(%rsp)
	movb	935(%rdx), %r8b
	movb	%r8b, 967(%rsp)
	movb	936(%rdx), %r8b
	movb	%r8b, 968(%rsp)
	movb	937(%rdx), %r8b
	movb	%r8b, 969(%rsp)
	movb	938(%rdx), %r8b
	movb	%r8b, 970(%rsp)
	movb	939(%rdx), %r8b
	movb	%r8b, 971(%rsp)
	movb	940(%rdx), %r8b
	movb	%r8b, 972(%rsp)
	movb	941(%rdx), %r8b
	movb	%r8b, 973(%rsp)
	movb	942(%rdx), %r8b
	movb	%r8b, 974(%rsp)
	movb	943(%rdx), %r8b
	movb	%r8b, 975(%rsp)
	movb	944(%rdx), %r8b
	movb	%r8b, 976(%rsp)
	movb	945(%rdx), %r8b
	movb	%r8b, 977(%rsp)
	movb	946(%rdx), %r8b
	movb	%r8b, 978(%rsp)
	movb	947(%rdx), %r8b
	movb	%r8b, 979(%rsp)
	movb	948(%rdx), %r8b
	movb	%r8b, 980(%rsp)
	movb	949(%rdx), %r8b
	movb	%r8b, 981(%rsp)
	movb	950(%rdx), %r8b
	movb	%r8b, 982(%rsp)
	movb	951(%rdx), %r8b
	movb	%r8b, 983(%rsp)
	movb	952(%rdx), %r8b
	movb	%r8b, 984(%rsp)
	movb	953(%rdx), %r8b
	movb	%r8b, 985(%rsp)
	movb	954(%rdx), %r8b
	movb	%r8b, 986(%rsp)
	movb	955(%rdx), %r8b
	movb	%r8b, 987(%rsp)
	movb	956(%rdx), %r8b
	movb	%r8b, 988(%rsp)
	movb	957(%rdx), %r8b
	movb	%r8b, 989(%rsp)
	movb	958(%rdx), %r8b
	movb	%r8b, 990(%rsp)
	movb	959(%rdx), %r8b
	movb	%r8b, 991(%rsp)
	movb	960(%rdx), %r8b
	movb	%r8b, 992(%rsp)
	movb	961(%rdx), %r8b
	movb	%r8b, 993(%rsp)
	movb	962(%rdx), %r8b
	movb	%r8b, 994(%rsp)
	movb	963(%rdx), %r8b
	movb	%r8b, 995(%rsp)
	movb	964(%rdx), %r8b
	movb	%r8b, 996(%rsp)
	movb	965(%rdx), %r8b
	movb	%r8b, 997(%rsp)
	movb	966(%rdx), %r8b
	movb	%r8b, 998(%rsp)
	movb	967(%rdx), %r8b
	movb	%r8b, 999(%rsp)
	movb	968(%rdx), %r8b
	movb	%r8b, 1000(%rsp)
	movb	969(%rdx), %r8b
	movb	%r8b, 1001(%rsp)
	movb	970(%rdx), %r8b
	movb	%r8b, 1002(%rsp)
	movb	971(%rdx), %r8b
	movb	%r8b, 1003(%rsp)
	movb	972(%rdx), %r8b
	movb	%r8b, 1004(%rsp)
	movb	973(%rdx), %r8b
	movb	%r8b, 1005(%rsp)
	movb	974(%rdx), %r8b
	movb	%r8b, 1006(%rsp)
	movb	975(%rdx), %r8b
	movb	%r8b, 1007(%rsp)
	movb	976(%rdx), %r8b
	movb	%r8b, 1008(%rsp)
	movb	977(%rdx), %r8b
	movb	%r8b, 1009(%rsp)
	movb	978(%rdx), %r8b
	movb	%r8b, 1010(%rsp)
	movb	979(%rdx), %r8b
	movb	%r8b, 1011(%rsp)
	movb	980(%rdx), %r8b
	movb	%r8b, 1012(%rsp)
	movb	981(%rdx), %r8b
	movb	%r8b, 1013(%rsp)
	movb	982(%rdx), %r8b
	movb	%r8b, 1014(%rsp)
	movb	983(%rdx), %r8b
	movb	%r8b, 1015(%rsp)
	movb	984(%rdx), %r8b
	movb	%r8b, 1016(%rsp)
	movb	985(%rdx), %r8b
	movb	%r8b, 1017(%rsp)
	movb	986(%rdx), %r8b
	movb	%r8b, 1018(%rsp)
	movb	987(%rdx), %r8b
	movb	%r8b, 1019(%rsp)
	movb	988(%rdx), %r8b
	movb	%r8b, 1020(%rsp)
	movb	989(%rdx), %r8b
	movb	%r8b, 1021(%rsp)
	movb	990(%rdx), %r8b
	movb	%r8b, 1022(%rsp)
	movb	991(%rdx), %r8b
	movb	%r8b, 1023(%rsp)
	movb	992(%rdx), %r8b
	movb	%r8b, 1024(%rsp)
	movb	993(%rdx), %r8b
	movb	%r8b, 1025(%rsp)
	movb	994(%rdx), %r8b
	movb	%r8b, 1026(%rsp)
	movb	995(%rdx), %r8b
	movb	%r8b, 1027(%rsp)
	movb	996(%rdx), %r8b
	movb	%r8b, 1028(%rsp)
	movb	997(%rdx), %r8b
	movb	%r8b, 1029(%rsp)
	movb	998(%rdx), %r8b
	movb	%r8b, 1030(%rsp)
	movb	999(%rdx), %r8b
	movb	%r8b, 1031(%rsp)
	movb	1000(%rdx), %r8b
	movb	%r8b, 1032(%rsp)
	movb	1001(%rdx), %r8b
	movb	%r8b, 1033(%rsp)
	movb	1002(%rdx), %r8b
	movb	%r8b, 1034(%rsp)
	movb	1003(%rdx), %r8b
	movb	%r8b, 1035(%rsp)
	movb	1004(%rdx), %r8b
	movb	%r8b, 1036(%rsp)
	movb	1005(%rdx), %r8b
	movb	%r8b, 1037(%rsp)
	movb	1006(%rdx), %r8b
	movb	%r8b, 1038(%rsp)
	movb	1007(%rdx), %r8b
	movb	%r8b, 1039(%rsp)
	movb	1008(%rdx), %r8b
	movb	%r8b, 1040(%rsp)
	movb	1009(%rdx), %r8b
	movb	%r8b, 1041(%rsp)
	movb	1010(%rdx), %r8b
	movb	%r8b, 1042(%rsp)
	movb	1011(%rdx), %r8b
	movb	%r8b, 1043(%rsp)
	movb	1012(%rdx), %r8b
	movb	%r8b, 1044(%rsp)
	movb	1013(%rdx), %r8b
	movb	%r8b, 1045(%rsp)
	movb	1014(%rdx), %r8b
	movb	%r8b, 1046(%rsp)
	movb	1015(%rdx), %r8b
	movb	%r8b, 1047(%rsp)
	movb	1016(%rdx), %r8b
	movb	%r8b, 1048(%rsp)
	movb	1017(%rdx), %r8b
	movb	%r8b, 1049(%rsp)
	movb	1018(%rdx), %r8b
	movb	%r8b, 1050(%rsp)
	movb	1019(%rdx), %r8b
	movb	%r8b, 1051(%rsp)
	movb	1020(%rdx), %r8b
	movb	%r8b, 1052(%rsp)
	movb	1021(%rdx), %r8b
	movb	%r8b, 1053(%rsp)
	movb	1022(%rdx), %r8b
	movb	%r8b, 1054(%rsp)
	movb	1023(%rdx), %r8b
	movb	%r8b, 1055(%rsp)
	movb	1024(%rdx), %r8b
	movb	%r8b, 1056(%rsp)
	movb	1025(%rdx), %r8b
	movb	%r8b, 1057(%rsp)
	movb	1026(%rdx), %r8b
	movb	%r8b, 1058(%rsp)
	movb	1027(%rdx), %r8b
	movb	%r8b, 1059(%rsp)
	movb	1028(%rdx), %r8b
	movb	%r8b, 1060(%rsp)
	movb	1029(%rdx), %r8b
	movb	%r8b, 1061(%rsp)
	movb	1030(%rdx), %r8b
	movb	%r8b, 1062(%rsp)
	movb	1031(%rdx), %r8b
	movb	%r8b, 1063(%rsp)
	movb	1032(%rdx), %r8b
	movb	%r8b, 1064(%rsp)
	movb	1033(%rdx), %r8b
	movb	%r8b, 1065(%rsp)
	movb	1034(%rdx), %r8b
	movb	%r8b, 1066(%rsp)
	movb	1035(%rdx), %r8b
	movb	%r8b, 1067(%rsp)
	movb	1036(%rdx), %r8b
	movb	%r8b, 1068(%rsp)
	movb	1037(%rdx), %r8b
	movb	%r8b, 1069(%rsp)
	movb	1038(%rdx), %r8b
	movb	%r8b, 1070(%rsp)
	movb	1039(%rdx), %r8b
	movb	%r8b, 1071(%rsp)
	movb	1040(%rdx), %r8b
	movb	%r8b, 1072(%rsp)
	movb	1041(%rdx), %r8b
	movb	%r8b, 1073(%rsp)
	movb	1042(%rdx), %r8b
	movb	%r8b, 1074(%rsp)
	movb	1043(%rdx), %r8b
	movb	%r8b, 1075(%rsp)
	movb	1044(%rdx), %r8b
	movb	%r8b, 1076(%rsp)
	movb	1045(%rdx), %r8b
	movb	%r8b, 1077(%rsp)
	movb	1046(%rdx), %r8b
	movb	%r8b, 1078(%rsp)
	movb	1047(%rdx), %r8b
	movb	%r8b, 1079(%rsp)
	movb	1048(%rdx), %r8b
	movb	%r8b, 1080(%rsp)
	movb	1049(%rdx), %r8b
	movb	%r8b, 1081(%rsp)
	movb	1050(%rdx), %r8b
	movb	%r8b, 1082(%rsp)
	movb	1051(%rdx), %r8b
	movb	%r8b, 1083(%rsp)
	movb	1052(%rdx), %r8b
	movb	%r8b, 1084(%rsp)
	movb	1053(%rdx), %r8b
	movb	%r8b, 1085(%rsp)
	movb	1054(%rdx), %r8b
	movb	%r8b, 1086(%rsp)
	movb	1055(%rdx), %r8b
	movb	%r8b, 1087(%rsp)
	movb	1056(%rdx), %r8b
	movb	%r8b, 1088(%rsp)
	movb	1057(%rdx), %r8b
	movb	%r8b, 1089(%rsp)
	movb	1058(%rdx), %r8b
	movb	%r8b, 1090(%rsp)
	movb	1059(%rdx), %r8b
	movb	%r8b, 1091(%rsp)
	movb	1060(%rdx), %r8b
	movb	%r8b, 1092(%rsp)
	movb	1061(%rdx), %r8b
	movb	%r8b, 1093(%rsp)
	movb	1062(%rdx), %r8b
	movb	%r8b, 1094(%rsp)
	movb	1063(%rdx), %r8b
	movb	%r8b, 1095(%rsp)
	movb	1064(%rdx), %r8b
	movb	%r8b, 1096(%rsp)
	movb	1065(%rdx), %r8b
	movb	%r8b, 1097(%rsp)
	movb	1066(%rdx), %r8b
	movb	%r8b, 1098(%rsp)
	movb	1067(%rdx), %r8b
	movb	%r8b, 1099(%rsp)
	movb	1068(%rdx), %r8b
	movb	%r8b, 1100(%rsp)
	movb	1069(%rdx), %r8b
	movb	%r8b, 1101(%rsp)
	movb	1070(%rdx), %r8b
	movb	%r8b, 1102(%rsp)
	movb	1071(%rdx), %r8b
	movb	%r8b, 1103(%rsp)
	movb	1072(%rdx), %r8b
	movb	%r8b, 1104(%rsp)
	movb	1073(%rdx), %r8b
	movb	%r8b, 1105(%rsp)
	movb	1074(%rdx), %r8b
	movb	%r8b, 1106(%rsp)
	movb	1075(%rdx), %r8b
	movb	%r8b, 1107(%rsp)
	movb	1076(%rdx), %r8b
	movb	%r8b, 1108(%rsp)
	movb	1077(%rdx), %r8b
	movb	%r8b, 1109(%rsp)
	movb	1078(%rdx), %r8b
	movb	%r8b, 1110(%rsp)
	movb	1079(%rdx), %r8b
	movb	%r8b, 1111(%rsp)
	movb	1080(%rdx), %r8b
	movb	%r8b, 1112(%rsp)
	movb	1081(%rdx), %r8b
	movb	%r8b, 1113(%rsp)
	movb	1082(%rdx), %r8b
	movb	%r8b, 1114(%rsp)
	movb	1083(%rdx), %r8b
	movb	%r8b, 1115(%rsp)
	movb	1084(%rdx), %r8b
	movb	%r8b, 1116(%rsp)
	movb	1085(%rdx), %r8b
	movb	%r8b, 1117(%rsp)
	movb	1086(%rdx), %r8b
	movb	%r8b, 1118(%rsp)
	movb	1087(%rdx), %r8b
	movb	%r8b, 1119(%rsp)
	movb	1088(%rdx), %r8b
	movb	%r8b, 1120(%rsp)
	movb	1089(%rdx), %r8b
	movb	%r8b, 1121(%rsp)
	movb	1090(%rdx), %r8b
	movb	%r8b, 1122(%rsp)
	movb	1091(%rdx), %r8b
	movb	%r8b, 1123(%rsp)
	movb	1092(%rdx), %r8b
	movb	%r8b, 1124(%rsp)
	movb	1093(%rdx), %r8b
	movb	%r8b, 1125(%rsp)
	movb	1094(%rdx), %r8b
	movb	%r8b, 1126(%rsp)
	movb	1095(%rdx), %r8b
	movb	%r8b, 1127(%rsp)
	movb	1096(%rdx), %r8b
	movb	%r8b, 1128(%rsp)
	movb	1097(%rdx), %r8b
	movb	%r8b, 1129(%rsp)
	movb	1098(%rdx), %r8b
	movb	%r8b, 1130(%rsp)
	movb	1099(%rdx), %r8b
	movb	%r8b, 1131(%rsp)
	movb	1100(%rdx), %r8b
	movb	%r8b, 1132(%rsp)
	movb	1101(%rdx), %r8b
	movb	%r8b, 1133(%rsp)
	movb	1102(%rdx), %r8b
	movb	%r8b, 1134(%rsp)
	movb	1103(%rdx), %r8b
	movb	%r8b, 1135(%rsp)
	movb	1104(%rdx), %r8b
	movb	%r8b, 1136(%rsp)
	movb	1105(%rdx), %r8b
	movb	%r8b, 1137(%rsp)
	movb	1106(%rdx), %r8b
	movb	%r8b, 1138(%rsp)
	movb	1107(%rdx), %r8b
	movb	%r8b, 1139(%rsp)
	movb	1108(%rdx), %r8b
	movb	%r8b, 1140(%rsp)
	movb	1109(%rdx), %r8b
	movb	%r8b, 1141(%rsp)
	movb	1110(%rdx), %r8b
	movb	%r8b, 1142(%rsp)
	movb	1111(%rdx), %r8b
	movb	%r8b, 1143(%rsp)
	movb	1112(%rdx), %r8b
	movb	%r8b, 1144(%rsp)
	movb	1113(%rdx), %r8b
	movb	%r8b, 1145(%rsp)
	movb	1114(%rdx), %r8b
	movb	%r8b, 1146(%rsp)
	movb	1115(%rdx), %r8b
	movb	%r8b, 1147(%rsp)
	movb	1116(%rdx), %r8b
	movb	%r8b, 1148(%rsp)
	movb	1117(%rdx), %r8b
	movb	%r8b, 1149(%rsp)
	movb	1118(%rdx), %r8b
	movb	%r8b, 1150(%rsp)
	movb	1119(%rdx), %r8b
	movb	%r8b, 1151(%rsp)
	movb	1120(%rdx), %r8b
	movb	%r8b, 1152(%rsp)
	movb	1121(%rdx), %r8b
	movb	%r8b, 1153(%rsp)
	movb	1122(%rdx), %r8b
	movb	%r8b, 1154(%rsp)
	movb	1123(%rdx), %r8b
	movb	%r8b, 1155(%rsp)
	movb	1124(%rdx), %r8b
	movb	%r8b, 1156(%rsp)
	movb	1125(%rdx), %r8b
	movb	%r8b, 1157(%rsp)
	movb	1126(%rdx), %r8b
	movb	%r8b, 1158(%rsp)
	movb	1127(%rdx), %r8b
	movb	%r8b, 1159(%rsp)
	movb	1128(%rdx), %r8b
	movb	%r8b, 1160(%rsp)
	movb	1129(%rdx), %r8b
	movb	%r8b, 1161(%rsp)
	movb	1130(%rdx), %r8b
	movb	%r8b, 1162(%rsp)
	movb	1131(%rdx), %r8b
	movb	%r8b, 1163(%rsp)
	movb	1132(%rdx), %r8b
	movb	%r8b, 1164(%rsp)
	movb	1133(%rdx), %r8b
	movb	%r8b, 1165(%rsp)
	movb	1134(%rdx), %r8b
	movb	%r8b, 1166(%rsp)
	movb	1135(%rdx), %r8b
	movb	%r8b, 1167(%rsp)
	movb	1136(%rdx), %r8b
	movb	%r8b, 1168(%rsp)
	movb	1137(%rdx), %r8b
	movb	%r8b, 1169(%rsp)
	movb	1138(%rdx), %r8b
	movb	%r8b, 1170(%rsp)
	movb	1139(%rdx), %r8b
	movb	%r8b, 1171(%rsp)
	movb	1140(%rdx), %r8b
	movb	%r8b, 1172(%rsp)
	movb	1141(%rdx), %r8b
	movb	%r8b, 1173(%rsp)
	movb	1142(%rdx), %r8b
	movb	%r8b, 1174(%rsp)
	movb	1143(%rdx), %r8b
	movb	%r8b, 1175(%rsp)
	movb	1144(%rdx), %r8b
	movb	%r8b, 1176(%rsp)
	movb	1145(%rdx), %r8b
	movb	%r8b, 1177(%rsp)
	movb	1146(%rdx), %r8b
	movb	%r8b, 1178(%rsp)
	movb	1147(%rdx), %r8b
	movb	%r8b, 1179(%rsp)
	movb	1148(%rdx), %r8b
	movb	%r8b, 1180(%rsp)
	movb	1149(%rdx), %r8b
	movb	%r8b, 1181(%rsp)
	movb	1150(%rdx), %r8b
	movb	%r8b, 1182(%rsp)
	movb	1151(%rdx), %r8b
	movb	%r8b, 1183(%rsp)
	movb	1152(%rdx), %r8b
	movb	%r8b, 1184(%rsp)
	movb	1153(%rdx), %r8b
	movb	%r8b, 1185(%rsp)
	movb	1154(%rdx), %r8b
	movb	%r8b, 1186(%rsp)
	movb	1155(%rdx), %r8b
	movb	%r8b, 1187(%rsp)
	movb	1156(%rdx), %r8b
	movb	%r8b, 1188(%rsp)
	movb	1157(%rdx), %r8b
	movb	%r8b, 1189(%rsp)
	movb	1158(%rdx), %r8b
	movb	%r8b, 1190(%rsp)
	movb	1159(%rdx), %r8b
	movb	%r8b, 1191(%rsp)
	movb	1160(%rdx), %r8b
	movb	%r8b, 1192(%rsp)
	movb	1161(%rdx), %r8b
	movb	%r8b, 1193(%rsp)
	movb	1162(%rdx), %r8b
	movb	%r8b, 1194(%rsp)
	movb	1163(%rdx), %r8b
	movb	%r8b, 1195(%rsp)
	movb	1164(%rdx), %r8b
	movb	%r8b, 1196(%rsp)
	movb	1165(%rdx), %r8b
	movb	%r8b, 1197(%rsp)
	movb	1166(%rdx), %r8b
	movb	%r8b, 1198(%rsp)
	movb	1167(%rdx), %r8b
	movb	%r8b, 1199(%rsp)
	movb	1168(%rdx), %r8b
	movb	%r8b, 1200(%rsp)
	movb	1169(%rdx), %r8b
	movb	%r8b, 1201(%rsp)
	movb	1170(%rdx), %r8b
	movb	%r8b, 1202(%rsp)
	movb	1171(%rdx), %r8b
	movb	%r8b, 1203(%rsp)
	movb	1172(%rdx), %r8b
	movb	%r8b, 1204(%rsp)
	movb	1173(%rdx), %r8b
	movb	%r8b, 1205(%rsp)
	movb	1174(%rdx), %r8b
	movb	%r8b, 1206(%rsp)
	movb	1175(%rdx), %r8b
	movb	%r8b, 1207(%rsp)
	movb	1176(%rdx), %r8b
	movb	%r8b, 1208(%rsp)
	movb	1177(%rdx), %r8b
	movb	%r8b, 1209(%rsp)
	movb	1178(%rdx), %r8b
	movb	%r8b, 1210(%rsp)
	movb	1179(%rdx), %r8b
	movb	%r8b, 1211(%rsp)
	movb	1180(%rdx), %r8b
	movb	%r8b, 1212(%rsp)
	movb	1181(%rdx), %r8b
	movb	%r8b, 1213(%rsp)
	movb	1182(%rdx), %r8b
	movb	%r8b, 1214(%rsp)
	movb	1183(%rdx), %r8b
	movb	%r8b, 1215(%rsp)
	movb	1184(%rdx), %r8b
	movb	%r8b, 1216(%rsp)
	movb	1185(%rdx), %r8b
	movb	%r8b, 1217(%rsp)
	movb	1186(%rdx), %r8b
	movb	%r8b, 1218(%rsp)
	movb	1187(%rdx), %r8b
	movb	%r8b, 1219(%rsp)
	movb	1188(%rdx), %r8b
	movb	%r8b, 1220(%rsp)
	movb	1189(%rdx), %r8b
	movb	%r8b, 1221(%rsp)
	movb	1190(%rdx), %r8b
	movb	%r8b, 1222(%rsp)
	movb	1191(%rdx), %r8b
	movb	%r8b, 1223(%rsp)
	movb	1192(%rdx), %r8b
	movb	%r8b, 1224(%rsp)
	movb	1193(%rdx), %r8b
	movb	%r8b, 1225(%rsp)
	movb	1194(%rdx), %r8b
	movb	%r8b, 1226(%rsp)
	movb	1195(%rdx), %r8b
	movb	%r8b, 1227(%rsp)
	movb	1196(%rdx), %r8b
	movb	%r8b, 1228(%rsp)
	movb	1197(%rdx), %r8b
	movb	%r8b, 1229(%rsp)
	movb	1198(%rdx), %r8b
	movb	%r8b, 1230(%rsp)
	movb	1199(%rdx), %r8b
	movb	%r8b, 1231(%rsp)
	movb	1200(%rdx), %r8b
	movb	%r8b, 1232(%rsp)
	movb	1201(%rdx), %r8b
	movb	%r8b, 1233(%rsp)
	movb	1202(%rdx), %r8b
	movb	%r8b, 1234(%rsp)
	movb	1203(%rdx), %r8b
	movb	%r8b, 1235(%rsp)
	movb	1204(%rdx), %r8b
	movb	%r8b, 1236(%rsp)
	movb	1205(%rdx), %r8b
	movb	%r8b, 1237(%rsp)
	movb	1206(%rdx), %r8b
	movb	%r8b, 1238(%rsp)
	movb	1207(%rdx), %r8b
	movb	%r8b, 1239(%rsp)
	movb	1208(%rdx), %r8b
	movb	%r8b, 1240(%rsp)
	movb	1209(%rdx), %r8b
	movb	%r8b, 1241(%rsp)
	movb	1210(%rdx), %r8b
	movb	%r8b, 1242(%rsp)
	movb	1211(%rdx), %r8b
	movb	%r8b, 1243(%rsp)
	movb	1212(%rdx), %r8b
	movb	%r8b, 1244(%rsp)
	movb	1213(%rdx), %r8b
	movb	%r8b, 1245(%rsp)
	movb	1214(%rdx), %r8b
	movb	%r8b, 1246(%rsp)
	movb	1215(%rdx), %r8b
	movb	%r8b, 1247(%rsp)
	movb	1216(%rdx), %r8b
	movb	%r8b, 1248(%rsp)
	movb	1217(%rdx), %r8b
	movb	%r8b, 1249(%rsp)
	movb	1218(%rdx), %r8b
	movb	%r8b, 1250(%rsp)
	movb	1219(%rdx), %r8b
	movb	%r8b, 1251(%rsp)
	movb	1220(%rdx), %r8b
	movb	%r8b, 1252(%rsp)
	movb	1221(%rdx), %r8b
	movb	%r8b, 1253(%rsp)
	movb	1222(%rdx), %r8b
	movb	%r8b, 1254(%rsp)
	movb	1223(%rdx), %r8b
	movb	%r8b, 1255(%rsp)
	movb	1224(%rdx), %r8b
	movb	%r8b, 1256(%rsp)
	movb	1225(%rdx), %r8b
	movb	%r8b, 1257(%rsp)
	movb	1226(%rdx), %r8b
	movb	%r8b, 1258(%rsp)
	movb	1227(%rdx), %r8b
	movb	%r8b, 1259(%rsp)
	movb	1228(%rdx), %r8b
	movb	%r8b, 1260(%rsp)
	movb	1229(%rdx), %r8b
	movb	%r8b, 1261(%rsp)
	movb	1230(%rdx), %r8b
	movb	%r8b, 1262(%rsp)
	movb	1231(%rdx), %r8b
	movb	%r8b, 1263(%rsp)
	movb	1232(%rdx), %r8b
	movb	%r8b, 1264(%rsp)
	movb	1233(%rdx), %r8b
	movb	%r8b, 1265(%rsp)
	movb	1234(%rdx), %r8b
	movb	%r8b, 1266(%rsp)
	movb	1235(%rdx), %r8b
	movb	%r8b, 1267(%rsp)
	movb	1236(%rdx), %r8b
	movb	%r8b, 1268(%rsp)
	movb	1237(%rdx), %r8b
	movb	%r8b, 1269(%rsp)
	movb	1238(%rdx), %r8b
	movb	%r8b, 1270(%rsp)
	movb	1239(%rdx), %r8b
	movb	%r8b, 1271(%rsp)
	movb	1240(%rdx), %r8b
	movb	%r8b, 1272(%rsp)
	movb	1241(%rdx), %r8b
	movb	%r8b, 1273(%rsp)
	movb	1242(%rdx), %r8b
	movb	%r8b, 1274(%rsp)
	movb	1243(%rdx), %r8b
	movb	%r8b, 1275(%rsp)
	movb	1244(%rdx), %r8b
	movb	%r8b, 1276(%rsp)
	movb	1245(%rdx), %r8b
	movb	%r8b, 1277(%rsp)
	movb	1246(%rdx), %r8b
	movb	%r8b, 1278(%rsp)
	movb	1247(%rdx), %r8b
	movb	%r8b, 1279(%rsp)
	movb	1248(%rdx), %r8b
	movb	%r8b, 1280(%rsp)
	movb	1249(%rdx), %r8b
	movb	%r8b, 1281(%rsp)
	movb	1250(%rdx), %r8b
	movb	%r8b, 1282(%rsp)
	movb	1251(%rdx), %r8b
	movb	%r8b, 1283(%rsp)
	movb	1252(%rdx), %r8b
	movb	%r8b, 1284(%rsp)
	movb	1253(%rdx), %r8b
	movb	%r8b, 1285(%rsp)
	movb	1254(%rdx), %r8b
	movb	%r8b, 1286(%rsp)
	movb	1255(%rdx), %r8b
	movb	%r8b, 1287(%rsp)
	movb	1256(%rdx), %r8b
	movb	%r8b, 1288(%rsp)
	movb	1257(%rdx), %r8b
	movb	%r8b, 1289(%rsp)
	movb	1258(%rdx), %r8b
	movb	%r8b, 1290(%rsp)
	movb	1259(%rdx), %r8b
	movb	%r8b, 1291(%rsp)
	movb	1260(%rdx), %r8b
	movb	%r8b, 1292(%rsp)
	movb	1261(%rdx), %r8b
	movb	%r8b, 1293(%rsp)
	movb	1262(%rdx), %r8b
	movb	%r8b, 1294(%rsp)
	movb	1263(%rdx), %r8b
	movb	%r8b, 1295(%rsp)
	movb	1264(%rdx), %r8b
	movb	%r8b, 1296(%rsp)
	movb	1265(%rdx), %r8b
	movb	%r8b, 1297(%rsp)
	movb	1266(%rdx), %r8b
	movb	%r8b, 1298(%rsp)
	movb	1267(%rdx), %r8b
	movb	%r8b, 1299(%rsp)
	movb	1268(%rdx), %r8b
	movb	%r8b, 1300(%rsp)
	movb	1269(%rdx), %r8b
	movb	%r8b, 1301(%rsp)
	movb	1270(%rdx), %r8b
	movb	%r8b, 1302(%rsp)
	movb	1271(%rdx), %r8b
	movb	%r8b, 1303(%rsp)
	movb	1272(%rdx), %r8b
	movb	%r8b, 1304(%rsp)
	movb	1273(%rdx), %r8b
	movb	%r8b, 1305(%rsp)
	movb	1274(%rdx), %r8b
	movb	%r8b, 1306(%rsp)
	movb	1275(%rdx), %r8b
	movb	%r8b, 1307(%rsp)
	movb	1276(%rdx), %r8b
	movb	%r8b, 1308(%rsp)
	movb	1277(%rdx), %r8b
	movb	%r8b, 1309(%rsp)
	movb	1278(%rdx), %r8b
	movb	%r8b, 1310(%rsp)
	movb	1279(%rdx), %r8b
	movb	%r8b, 1311(%rsp)
	movb	1280(%rdx), %r8b
	movb	%r8b, 1312(%rsp)
	movb	1281(%rdx), %r8b
	movb	%r8b, 1313(%rsp)
	movb	1282(%rdx), %r8b
	movb	%r8b, 1314(%rsp)
	movb	1283(%rdx), %r8b
	movb	%r8b, 1315(%rsp)
	movb	1284(%rdx), %r8b
	movb	%r8b, 1316(%rsp)
	movb	1285(%rdx), %r8b
	movb	%r8b, 1317(%rsp)
	movb	1286(%rdx), %r8b
	movb	%r8b, 1318(%rsp)
	movb	1287(%rdx), %r8b
	movb	%r8b, 1319(%rsp)
	movb	1288(%rdx), %r8b
	movb	%r8b, 1320(%rsp)
	movb	1289(%rdx), %r8b
	movb	%r8b, 1321(%rsp)
	movb	1290(%rdx), %r8b
	movb	%r8b, 1322(%rsp)
	movb	1291(%rdx), %r8b
	movb	%r8b, 1323(%rsp)
	movb	1292(%rdx), %r8b
	movb	%r8b, 1324(%rsp)
	movb	1293(%rdx), %r8b
	movb	%r8b, 1325(%rsp)
	movb	1294(%rdx), %r8b
	movb	%r8b, 1326(%rsp)
	movb	1295(%rdx), %r8b
	movb	%r8b, 1327(%rsp)
	movb	1296(%rdx), %r8b
	movb	%r8b, 1328(%rsp)
	movb	1297(%rdx), %r8b
	movb	%r8b, 1329(%rsp)
	movb	1298(%rdx), %r8b
	movb	%r8b, 1330(%rsp)
	movb	1299(%rdx), %r8b
	movb	%r8b, 1331(%rsp)
	movb	1300(%rdx), %r8b
	movb	%r8b, 1332(%rsp)
	movb	1301(%rdx), %r8b
	movb	%r8b, 1333(%rsp)
	movb	1302(%rdx), %r8b
	movb	%r8b, 1334(%rsp)
	movb	1303(%rdx), %r8b
	movb	%r8b, 1335(%rsp)
	movb	1304(%rdx), %r8b
	movb	%r8b, 1336(%rsp)
	movb	1305(%rdx), %r8b
	movb	%r8b, 1337(%rsp)
	movb	1306(%rdx), %r8b
	movb	%r8b, 1338(%rsp)
	movb	1307(%rdx), %r8b
	movb	%r8b, 1339(%rsp)
	movb	1308(%rdx), %r8b
	movb	%r8b, 1340(%rsp)
	movb	1309(%rdx), %r8b
	movb	%r8b, 1341(%rsp)
	movb	1310(%rdx), %r8b
	movb	%r8b, 1342(%rsp)
	movb	1311(%rdx), %r8b
	movb	%r8b, 1343(%rsp)
	movb	1312(%rdx), %r8b
	movb	%r8b, 1344(%rsp)
	movb	1313(%rdx), %r8b
	movb	%r8b, 1345(%rsp)
	movb	1314(%rdx), %r8b
	movb	%r8b, 1346(%rsp)
	movb	1315(%rdx), %r8b
	movb	%r8b, 1347(%rsp)
	movb	1316(%rdx), %r8b
	movb	%r8b, 1348(%rsp)
	movb	1317(%rdx), %r8b
	movb	%r8b, 1349(%rsp)
	movb	1318(%rdx), %r8b
	movb	%r8b, 1350(%rsp)
	movb	1319(%rdx), %r8b
	movb	%r8b, 1351(%rsp)
	movb	1320(%rdx), %r8b
	movb	%r8b, 1352(%rsp)
	movb	1321(%rdx), %r8b
	movb	%r8b, 1353(%rsp)
	movb	1322(%rdx), %r8b
	movb	%r8b, 1354(%rsp)
	movb	1323(%rdx), %r8b
	movb	%r8b, 1355(%rsp)
	movb	1324(%rdx), %r8b
	movb	%r8b, 1356(%rsp)
	movb	1325(%rdx), %r8b
	movb	%r8b, 1357(%rsp)
	movb	1326(%rdx), %r8b
	movb	%r8b, 1358(%rsp)
	movb	1327(%rdx), %r8b
	movb	%r8b, 1359(%rsp)
	movb	1328(%rdx), %r8b
	movb	%r8b, 1360(%rsp)
	movb	1329(%rdx), %r8b
	movb	%r8b, 1361(%rsp)
	movb	1330(%rdx), %r8b
	movb	%r8b, 1362(%rsp)
	movb	1331(%rdx), %r8b
	movb	%r8b, 1363(%rsp)
	movb	1332(%rdx), %r8b
	movb	%r8b, 1364(%rsp)
	movb	1333(%rdx), %r8b
	movb	%r8b, 1365(%rsp)
	movb	1334(%rdx), %r8b
	movb	%r8b, 1366(%rsp)
	movb	1335(%rdx), %r8b
	movb	%r8b, 1367(%rsp)
	movb	1336(%rdx), %r8b
	movb	%r8b, 1368(%rsp)
	movb	1337(%rdx), %r8b
	movb	%r8b, 1369(%rsp)
	movb	1338(%rdx), %r8b
	movb	%r8b, 1370(%rsp)
	movb	1339(%rdx), %r8b
	movb	%r8b, 1371(%rsp)
	movb	1340(%rdx), %r8b
	movb	%r8b, 1372(%rsp)
	movb	1341(%rdx), %r8b
	movb	%r8b, 1373(%rsp)
	movb	1342(%rdx), %r8b
	movb	%r8b, 1374(%rsp)
	movb	1343(%rdx), %r8b
	movb	%r8b, 1375(%rsp)
	movb	1344(%rdx), %r8b
	movb	%r8b, 1376(%rsp)
	movb	1345(%rdx), %r8b
	movb	%r8b, 1377(%rsp)
	movb	1346(%rdx), %r8b
	movb	%r8b, 1378(%rsp)
	movb	1347(%rdx), %r8b
	movb	%r8b, 1379(%rsp)
	movb	1348(%rdx), %r8b
	movb	%r8b, 1380(%rsp)
	movb	1349(%rdx), %r8b
	movb	%r8b, 1381(%rsp)
	movb	1350(%rdx), %r8b
	movb	%r8b, 1382(%rsp)
	movb	1351(%rdx), %r8b
	movb	%r8b, 1383(%rsp)
	movb	1352(%rdx), %r8b
	movb	%r8b, 1384(%rsp)
	movb	1353(%rdx), %r8b
	movb	%r8b, 1385(%rsp)
	movb	1354(%rdx), %r8b
	movb	%r8b, 1386(%rsp)
	movb	1355(%rdx), %r8b
	movb	%r8b, 1387(%rsp)
	movb	1356(%rdx), %r8b
	movb	%r8b, 1388(%rsp)
	movb	1357(%rdx), %r8b
	movb	%r8b, 1389(%rsp)
	movb	1358(%rdx), %r8b
	movb	%r8b, 1390(%rsp)
	movb	1359(%rdx), %r8b
	movb	%r8b, 1391(%rsp)
	movb	1360(%rdx), %r8b
	movb	%r8b, 1392(%rsp)
	movb	1361(%rdx), %r8b
	movb	%r8b, 1393(%rsp)
	movb	1362(%rdx), %r8b
	movb	%r8b, 1394(%rsp)
	movb	1363(%rdx), %r8b
	movb	%r8b, 1395(%rsp)
	movb	1364(%rdx), %r8b
	movb	%r8b, 1396(%rsp)
	movb	1365(%rdx), %r8b
	movb	%r8b, 1397(%rsp)
	movb	1366(%rdx), %r8b
	movb	%r8b, 1398(%rsp)
	movb	1367(%rdx), %r8b
	movb	%r8b, 1399(%rsp)
	movb	1368(%rdx), %r8b
	movb	%r8b, 1400(%rsp)
	movb	1369(%rdx), %r8b
	movb	%r8b, 1401(%rsp)
	movb	1370(%rdx), %r8b
	movb	%r8b, 1402(%rsp)
	movb	1371(%rdx), %r8b
	movb	%r8b, 1403(%rsp)
	movb	1372(%rdx), %r8b
	movb	%r8b, 1404(%rsp)
	movb	1373(%rdx), %r8b
	movb	%r8b, 1405(%rsp)
	movb	1374(%rdx), %r8b
	movb	%r8b, 1406(%rsp)
	movb	1375(%rdx), %r8b
	movb	%r8b, 1407(%rsp)
	movb	1376(%rdx), %r8b
	movb	%r8b, 1408(%rsp)
	movb	1377(%rdx), %r8b
	movb	%r8b, 1409(%rsp)
	movb	1378(%rdx), %r8b
	movb	%r8b, 1410(%rsp)
	movb	1379(%rdx), %r8b
	movb	%r8b, 1411(%rsp)
	movb	1380(%rdx), %r8b
	movb	%r8b, 1412(%rsp)
	movb	1381(%rdx), %r8b
	movb	%r8b, 1413(%rsp)
	movb	1382(%rdx), %r8b
	movb	%r8b, 1414(%rsp)
	movb	1383(%rdx), %r8b
	movb	%r8b, 1415(%rsp)
	movb	1384(%rdx), %r8b
	movb	%r8b, 1416(%rsp)
	movb	1385(%rdx), %r8b
	movb	%r8b, 1417(%rsp)
	movb	1386(%rdx), %r8b
	movb	%r8b, 1418(%rsp)
	movb	1387(%rdx), %r8b
	movb	%r8b, 1419(%rsp)
	movb	1388(%rdx), %r8b
	movb	%r8b, 1420(%rsp)
	movb	1389(%rdx), %r8b
	movb	%r8b, 1421(%rsp)
	movb	1390(%rdx), %r8b
	movb	%r8b, 1422(%rsp)
	movb	1391(%rdx), %r8b
	movb	%r8b, 1423(%rsp)
	movb	1392(%rdx), %r8b
	movb	%r8b, 1424(%rsp)
	movb	1393(%rdx), %r8b
	movb	%r8b, 1425(%rsp)
	movb	1394(%rdx), %r8b
	movb	%r8b, 1426(%rsp)
	movb	1395(%rdx), %r8b
	movb	%r8b, 1427(%rsp)
	movb	1396(%rdx), %r8b
	movb	%r8b, 1428(%rsp)
	movb	1397(%rdx), %r8b
	movb	%r8b, 1429(%rsp)
	movb	1398(%rdx), %r8b
	movb	%r8b, 1430(%rsp)
	movb	1399(%rdx), %r8b
	movb	%r8b, 1431(%rsp)
	movb	1400(%rdx), %r8b
	movb	%r8b, 1432(%rsp)
	movb	1401(%rdx), %r8b
	movb	%r8b, 1433(%rsp)
	movb	1402(%rdx), %r8b
	movb	%r8b, 1434(%rsp)
	movb	1403(%rdx), %r8b
	movb	%r8b, 1435(%rsp)
	movb	1404(%rdx), %r8b
	movb	%r8b, 1436(%rsp)
	movb	1405(%rdx), %r8b
	movb	%r8b, 1437(%rsp)
	movb	1406(%rdx), %r8b
	movb	%r8b, 1438(%rsp)
	movb	1407(%rdx), %r8b
	movb	%r8b, 1439(%rsp)
	movb	1408(%rdx), %r8b
	movb	%r8b, 1440(%rsp)
	movb	1409(%rdx), %r8b
	movb	%r8b, 1441(%rsp)
	movb	1410(%rdx), %r8b
	movb	%r8b, 1442(%rsp)
	movb	1411(%rdx), %r8b
	movb	%r8b, 1443(%rsp)
	movb	1412(%rdx), %r8b
	movb	%r8b, 1444(%rsp)
	movb	1413(%rdx), %r8b
	movb	%r8b, 1445(%rsp)
	movb	1414(%rdx), %r8b
	movb	%r8b, 1446(%rsp)
	movb	1415(%rdx), %r8b
	movb	%r8b, 1447(%rsp)
	movb	1416(%rdx), %r8b
	movb	%r8b, 1448(%rsp)
	movb	1417(%rdx), %r8b
	movb	%r8b, 1449(%rsp)
	movb	1418(%rdx), %r8b
	movb	%r8b, 1450(%rsp)
	movb	1419(%rdx), %r8b
	movb	%r8b, 1451(%rsp)
	movb	1420(%rdx), %r8b
	movb	%r8b, 1452(%rsp)
	movb	1421(%rdx), %r8b
	movb	%r8b, 1453(%rsp)
	movb	1422(%rdx), %r8b
	movb	%r8b, 1454(%rsp)
	movb	1423(%rdx), %r8b
	movb	%r8b, 1455(%rsp)
	movb	1424(%rdx), %r8b
	movb	%r8b, 1456(%rsp)
	movb	1425(%rdx), %r8b
	movb	%r8b, 1457(%rsp)
	movb	1426(%rdx), %r8b
	movb	%r8b, 1458(%rsp)
	movb	1427(%rdx), %r8b
	movb	%r8b, 1459(%rsp)
	movb	1428(%rdx), %r8b
	movb	%r8b, 1460(%rsp)
	movb	1429(%rdx), %r8b
	movb	%r8b, 1461(%rsp)
	movb	1430(%rdx), %r8b
	movb	%r8b, 1462(%rsp)
	movb	1431(%rdx), %r8b
	movb	%r8b, 1463(%rsp)
	movb	1432(%rdx), %r8b
	movb	%r8b, 1464(%rsp)
	movb	1433(%rdx), %r8b
	movb	%r8b, 1465(%rsp)
	movb	1434(%rdx), %r8b
	movb	%r8b, 1466(%rsp)
	movb	1435(%rdx), %r8b
	movb	%r8b, 1467(%rsp)
	movb	1436(%rdx), %r8b
	movb	%r8b, 1468(%rsp)
	movb	1437(%rdx), %r8b
	movb	%r8b, 1469(%rsp)
	movb	1438(%rdx), %r8b
	movb	%r8b, 1470(%rsp)
	movb	1439(%rdx), %r8b
	movb	%r8b, 1471(%rsp)
	movb	1440(%rdx), %r8b
	movb	%r8b, 1472(%rsp)
	movb	1441(%rdx), %r8b
	movb	%r8b, 1473(%rsp)
	movb	1442(%rdx), %r8b
	movb	%r8b, 1474(%rsp)
	movb	1443(%rdx), %r8b
	movb	%r8b, 1475(%rsp)
	movb	1444(%rdx), %r8b
	movb	%r8b, 1476(%rsp)
	movb	1445(%rdx), %r8b
	movb	%r8b, 1477(%rsp)
	movb	1446(%rdx), %r8b
	movb	%r8b, 1478(%rsp)
	movb	1447(%rdx), %r8b
	movb	%r8b, 1479(%rsp)
	movb	1448(%rdx), %r8b
	movb	%r8b, 1480(%rsp)
	movb	1449(%rdx), %r8b
	movb	%r8b, 1481(%rsp)
	movb	1450(%rdx), %r8b
	movb	%r8b, 1482(%rsp)
	movb	1451(%rdx), %r8b
	movb	%r8b, 1483(%rsp)
	movb	1452(%rdx), %r8b
	movb	%r8b, 1484(%rsp)
	movb	1453(%rdx), %r8b
	movb	%r8b, 1485(%rsp)
	movb	1454(%rdx), %r8b
	movb	%r8b, 1486(%rsp)
	movb	1455(%rdx), %r8b
	movb	%r8b, 1487(%rsp)
	movb	1456(%rdx), %r8b
	movb	%r8b, 1488(%rsp)
	movb	1457(%rdx), %r8b
	movb	%r8b, 1489(%rsp)
	movb	1458(%rdx), %r8b
	movb	%r8b, 1490(%rsp)
	movb	1459(%rdx), %r8b
	movb	%r8b, 1491(%rsp)
	movb	1460(%rdx), %r8b
	movb	%r8b, 1492(%rsp)
	movb	1461(%rdx), %r8b
	movb	%r8b, 1493(%rsp)
	movb	1462(%rdx), %r8b
	movb	%r8b, 1494(%rsp)
	movb	1463(%rdx), %r8b
	movb	%r8b, 1495(%rsp)
	movb	1464(%rdx), %r8b
	movb	%r8b, 1496(%rsp)
	movb	1465(%rdx), %r8b
	movb	%r8b, 1497(%rsp)
	movb	1466(%rdx), %r8b
	movb	%r8b, 1498(%rsp)
	movb	1467(%rdx), %r8b
	movb	%r8b, 1499(%rsp)
	movb	1468(%rdx), %r8b
	movb	%r8b, 1500(%rsp)
	movb	1469(%rdx), %r8b
	movb	%r8b, 1501(%rsp)
	movb	1470(%rdx), %r8b
	movb	%r8b, 1502(%rsp)
	movb	1471(%rdx), %r8b
	movb	%r8b, 1503(%rsp)
	movb	1472(%rdx), %r8b
	movb	%r8b, 1504(%rsp)
	movb	1473(%rdx), %r8b
	movb	%r8b, 1505(%rsp)
	movb	1474(%rdx), %r8b
	movb	%r8b, 1506(%rsp)
	movb	1475(%rdx), %r8b
	movb	%r8b, 1507(%rsp)
	movb	1476(%rdx), %r8b
	movb	%r8b, 1508(%rsp)
	movb	1477(%rdx), %r8b
	movb	%r8b, 1509(%rsp)
	movb	1478(%rdx), %r8b
	movb	%r8b, 1510(%rsp)
	movb	1479(%rdx), %r8b
	movb	%r8b, 1511(%rsp)
	movb	1480(%rdx), %r8b
	movb	%r8b, 1512(%rsp)
	movb	1481(%rdx), %r8b
	movb	%r8b, 1513(%rsp)
	movb	1482(%rdx), %r8b
	movb	%r8b, 1514(%rsp)
	movb	1483(%rdx), %r8b
	movb	%r8b, 1515(%rsp)
	movb	1484(%rdx), %r8b
	movb	%r8b, 1516(%rsp)
	movb	1485(%rdx), %r8b
	movb	%r8b, 1517(%rsp)
	movb	1486(%rdx), %r8b
	movb	%r8b, 1518(%rsp)
	movb	1487(%rdx), %r8b
	movb	%r8b, 1519(%rsp)
	movb	1488(%rdx), %r8b
	movb	%r8b, 1520(%rsp)
	movb	1489(%rdx), %r8b
	movb	%r8b, 1521(%rsp)
	movb	1490(%rdx), %r8b
	movb	%r8b, 1522(%rsp)
	movb	1491(%rdx), %r8b
	movb	%r8b, 1523(%rsp)
	movb	1492(%rdx), %r8b
	movb	%r8b, 1524(%rsp)
	movb	1493(%rdx), %r8b
	movb	%r8b, 1525(%rsp)
	movb	1494(%rdx), %r8b
	movb	%r8b, 1526(%rsp)
	movb	1495(%rdx), %r8b
	movb	%r8b, 1527(%rsp)
	movb	1496(%rdx), %r8b
	movb	%r8b, 1528(%rsp)
	movb	1497(%rdx), %r8b
	movb	%r8b, 1529(%rsp)
	movb	1498(%rdx), %r8b
	movb	%r8b, 1530(%rsp)
	movb	1499(%rdx), %r8b
	movb	%r8b, 1531(%rsp)
	movb	1500(%rdx), %r8b
	movb	%r8b, 1532(%rsp)
	movb	1501(%rdx), %r8b
	movb	%r8b, 1533(%rsp)
	movb	1502(%rdx), %r8b
	movb	%r8b, 1534(%rsp)
	movb	1503(%rdx), %r8b
	movb	%r8b, 1535(%rsp)
	movb	1504(%rdx), %r8b
	movb	%r8b, 1536(%rsp)
	movb	1505(%rdx), %r8b
	movb	%r8b, 1537(%rsp)
	movb	1506(%rdx), %r8b
	movb	%r8b, 1538(%rsp)
	movb	1507(%rdx), %r8b
	movb	%r8b, 1539(%rsp)
	movb	1508(%rdx), %r8b
	movb	%r8b, 1540(%rsp)
	movb	1509(%rdx), %r8b
	movb	%r8b, 1541(%rsp)
	movb	1510(%rdx), %r8b
	movb	%r8b, 1542(%rsp)
	movb	1511(%rdx), %r8b
	movb	%r8b, 1543(%rsp)
	movb	1512(%rdx), %r8b
	movb	%r8b, 1544(%rsp)
	movb	1513(%rdx), %r8b
	movb	%r8b, 1545(%rsp)
	movb	1514(%rdx), %r8b
	movb	%r8b, 1546(%rsp)
	movb	1515(%rdx), %r8b
	movb	%r8b, 1547(%rsp)
	movb	1516(%rdx), %r8b
	movb	%r8b, 1548(%rsp)
	movb	1517(%rdx), %r8b
	movb	%r8b, 1549(%rsp)
	movb	1518(%rdx), %r8b
	movb	%r8b, 1550(%rsp)
	movb	1519(%rdx), %r8b
	movb	%r8b, 1551(%rsp)
	movb	1520(%rdx), %r8b
	movb	%r8b, 1552(%rsp)
	movb	1521(%rdx), %r8b
	movb	%r8b, 1553(%rsp)
	movb	1522(%rdx), %r8b
	movb	%r8b, 1554(%rsp)
	movb	1523(%rdx), %r8b
	movb	%r8b, 1555(%rsp)
	movb	1524(%rdx), %r8b
	movb	%r8b, 1556(%rsp)
	movb	1525(%rdx), %r8b
	movb	%r8b, 1557(%rsp)
	movb	1526(%rdx), %r8b
	movb	%r8b, 1558(%rsp)
	movb	1527(%rdx), %r8b
	movb	%r8b, 1559(%rsp)
	movb	1528(%rdx), %r8b
	movb	%r8b, 1560(%rsp)
	movb	1529(%rdx), %r8b
	movb	%r8b, 1561(%rsp)
	movb	1530(%rdx), %r8b
	movb	%r8b, 1562(%rsp)
	movb	1531(%rdx), %r8b
	movb	%r8b, 1563(%rsp)
	movb	1532(%rdx), %r8b
	movb	%r8b, 1564(%rsp)
	movb	1533(%rdx), %r8b
	movb	%r8b, 1565(%rsp)
	movb	1534(%rdx), %r8b
	movb	%r8b, 1566(%rsp)
	movb	1535(%rdx), %r8b
	movb	%r8b, 1567(%rsp)
	movb	1536(%rdx), %r8b
	movb	%r8b, 1568(%rsp)
	movb	1537(%rdx), %r8b
	movb	%r8b, 1569(%rsp)
	movb	1538(%rdx), %r8b
	movb	%r8b, 1570(%rsp)
	movb	1539(%rdx), %r8b
	movb	%r8b, 1571(%rsp)
	movb	1540(%rdx), %r8b
	movb	%r8b, 1572(%rsp)
	movb	1541(%rdx), %r8b
	movb	%r8b, 1573(%rsp)
	movb	1542(%rdx), %r8b
	movb	%r8b, 1574(%rsp)
	movb	1543(%rdx), %r8b
	movb	%r8b, 1575(%rsp)
	movb	1544(%rdx), %r8b
	movb	%r8b, 1576(%rsp)
	movb	1545(%rdx), %r8b
	movb	%r8b, 1577(%rsp)
	movb	1546(%rdx), %r8b
	movb	%r8b, 1578(%rsp)
	movb	1547(%rdx), %r8b
	movb	%r8b, 1579(%rsp)
	movb	1548(%rdx), %r8b
	movb	%r8b, 1580(%rsp)
	movb	1549(%rdx), %r8b
	movb	%r8b, 1581(%rsp)
	movb	1550(%rdx), %r8b
	movb	%r8b, 1582(%rsp)
	movb	1551(%rdx), %r8b
	movb	%r8b, 1583(%rsp)
	movb	1552(%rdx), %r8b
	movb	%r8b, 1584(%rsp)
	movb	1553(%rdx), %r8b
	movb	%r8b, 1585(%rsp)
	movb	1554(%rdx), %r8b
	movb	%r8b, 1586(%rsp)
	movb	1555(%rdx), %r8b
	movb	%r8b, 1587(%rsp)
	movb	1556(%rdx), %r8b
	movb	%r8b, 1588(%rsp)
	movb	1557(%rdx), %r8b
	movb	%r8b, 1589(%rsp)
	movb	1558(%rdx), %r8b
	movb	%r8b, 1590(%rsp)
	movb	1559(%rdx), %r8b
	movb	%r8b, 1591(%rsp)
	movb	1560(%rdx), %r8b
	movb	%r8b, 1592(%rsp)
	movb	1561(%rdx), %r8b
	movb	%r8b, 1593(%rsp)
	movb	1562(%rdx), %r8b
	movb	%r8b, 1594(%rsp)
	movb	1563(%rdx), %r8b
	movb	%r8b, 1595(%rsp)
	movb	1564(%rdx), %r8b
	movb	%r8b, 1596(%rsp)
	movb	1565(%rdx), %r8b
	movb	%r8b, 1597(%rsp)
	movb	1566(%rdx), %r8b
	movb	%r8b, 1598(%rsp)
	movb	1567(%rdx), %r8b
	movb	%r8b, 1599(%rsp)
	movb	1568(%rdx), %r8b
	movb	%r8b, 1600(%rsp)
	movb	1569(%rdx), %r8b
	movb	%r8b, 1601(%rsp)
	movb	1570(%rdx), %r8b
	movb	%r8b, 1602(%rsp)
	movb	1571(%rdx), %r8b
	movb	%r8b, 1603(%rsp)
	movb	1572(%rdx), %r8b
	movb	%r8b, 1604(%rsp)
	movb	1573(%rdx), %r8b
	movb	%r8b, 1605(%rsp)
	movb	1574(%rdx), %r8b
	movb	%r8b, 1606(%rsp)
	movb	1575(%rdx), %r8b
	movb	%r8b, 1607(%rsp)
	movb	1576(%rdx), %r8b
	movb	%r8b, 1608(%rsp)
	movb	1577(%rdx), %r8b
	movb	%r8b, 1609(%rsp)
	movb	1578(%rdx), %r8b
	movb	%r8b, 1610(%rsp)
	movb	1579(%rdx), %r8b
	movb	%r8b, 1611(%rsp)
	movb	1580(%rdx), %r8b
	movb	%r8b, 1612(%rsp)
	movb	1581(%rdx), %r8b
	movb	%r8b, 1613(%rsp)
	movb	1582(%rdx), %r8b
	movb	%r8b, 1614(%rsp)
	movb	1583(%rdx), %r8b
	movb	%r8b, 1615(%rsp)
	movb	1584(%rdx), %r8b
	movb	%r8b, 1616(%rsp)
	movb	1585(%rdx), %r8b
	movb	%r8b, 1617(%rsp)
	movb	1586(%rdx), %r8b
	movb	%r8b, 1618(%rsp)
	movb	1587(%rdx), %r8b
	movb	%r8b, 1619(%rsp)
	movb	1588(%rdx), %r8b
	movb	%r8b, 1620(%rsp)
	movb	1589(%rdx), %r8b
	movb	%r8b, 1621(%rsp)
	movb	1590(%rdx), %r8b
	movb	%r8b, 1622(%rsp)
	movb	1591(%rdx), %r8b
	movb	%r8b, 1623(%rsp)
	movb	1592(%rdx), %r8b
	movb	%r8b, 1624(%rsp)
	movb	1593(%rdx), %r8b
	movb	%r8b, 1625(%rsp)
	movb	1594(%rdx), %r8b
	movb	%r8b, 1626(%rsp)
	movb	1595(%rdx), %r8b
	movb	%r8b, 1627(%rsp)
	movb	1596(%rdx), %r8b
	movb	%r8b, 1628(%rsp)
	movb	1597(%rdx), %r8b
	movb	%r8b, 1629(%rsp)
	movb	1598(%rdx), %r8b
	movb	%r8b, 1630(%rsp)
	movb	1599(%rdx), %r8b
	movb	%r8b, 1631(%rsp)
	movb	1600(%rdx), %r8b
	movb	%r8b, 1632(%rsp)
	movb	1601(%rdx), %r8b
	movb	%r8b, 1633(%rsp)
	movb	1602(%rdx), %r8b
	movb	%r8b, 1634(%rsp)
	movb	1603(%rdx), %r8b
	movb	%r8b, 1635(%rsp)
	movb	1604(%rdx), %r8b
	movb	%r8b, 1636(%rsp)
	movb	1605(%rdx), %r8b
	movb	%r8b, 1637(%rsp)
	movb	1606(%rdx), %r8b
	movb	%r8b, 1638(%rsp)
	movb	1607(%rdx), %r8b
	movb	%r8b, 1639(%rsp)
	movb	1608(%rdx), %r8b
	movb	%r8b, 1640(%rsp)
	movb	1609(%rdx), %r8b
	movb	%r8b, 1641(%rsp)
	movb	1610(%rdx), %r8b
	movb	%r8b, 1642(%rsp)
	movb	1611(%rdx), %r8b
	movb	%r8b, 1643(%rsp)
	movb	1612(%rdx), %r8b
	movb	%r8b, 1644(%rsp)
	movb	1613(%rdx), %r8b
	movb	%r8b, 1645(%rsp)
	movb	1614(%rdx), %r8b
	movb	%r8b, 1646(%rsp)
	movb	1615(%rdx), %r8b
	movb	%r8b, 1647(%rsp)
	movb	1616(%rdx), %r8b
	movb	%r8b, 1648(%rsp)
	movb	1617(%rdx), %r8b
	movb	%r8b, 1649(%rsp)
	movb	1618(%rdx), %r8b
	movb	%r8b, 1650(%rsp)
	movb	1619(%rdx), %r8b
	movb	%r8b, 1651(%rsp)
	movb	1620(%rdx), %r8b
	movb	%r8b, 1652(%rsp)
	movb	1621(%rdx), %r8b
	movb	%r8b, 1653(%rsp)
	movb	1622(%rdx), %r8b
	movb	%r8b, 1654(%rsp)
	movb	1623(%rdx), %r8b
	movb	%r8b, 1655(%rsp)
	movb	1624(%rdx), %r8b
	movb	%r8b, 1656(%rsp)
	movb	1625(%rdx), %r8b
	movb	%r8b, 1657(%rsp)
	movb	1626(%rdx), %r8b
	movb	%r8b, 1658(%rsp)
	movb	1627(%rdx), %r8b
	movb	%r8b, 1659(%rsp)
	movb	1628(%rdx), %r8b
	movb	%r8b, 1660(%rsp)
	movb	1629(%rdx), %r8b
	movb	%r8b, 1661(%rsp)
	movb	1630(%rdx), %r8b
	movb	%r8b, 1662(%rsp)
	movb	1631(%rdx), %r8b
	movb	%r8b, 1663(%rsp)
	movb	1632(%rdx), %r8b
	movb	%r8b, 1664(%rsp)
	movb	1633(%rdx), %r8b
	movb	%r8b, 1665(%rsp)
	movb	1634(%rdx), %r8b
	movb	%r8b, 1666(%rsp)
	movb	1635(%rdx), %r8b
	movb	%r8b, 1667(%rsp)
	movb	1636(%rdx), %r8b
	movb	%r8b, 1668(%rsp)
	movb	1637(%rdx), %r8b
	movb	%r8b, 1669(%rsp)
	movb	1638(%rdx), %r8b
	movb	%r8b, 1670(%rsp)
	movb	1639(%rdx), %r8b
	movb	%r8b, 1671(%rsp)
	movb	1640(%rdx), %r8b
	movb	%r8b, 1672(%rsp)
	movb	1641(%rdx), %r8b
	movb	%r8b, 1673(%rsp)
	movb	1642(%rdx), %r8b
	movb	%r8b, 1674(%rsp)
	movb	1643(%rdx), %r8b
	movb	%r8b, 1675(%rsp)
	movb	1644(%rdx), %r8b
	movb	%r8b, 1676(%rsp)
	movb	1645(%rdx), %r8b
	movb	%r8b, 1677(%rsp)
	movb	1646(%rdx), %r8b
	movb	%r8b, 1678(%rsp)
	movb	1647(%rdx), %r8b
	movb	%r8b, 1679(%rsp)
	movb	1648(%rdx), %r8b
	movb	%r8b, 1680(%rsp)
	movb	1649(%rdx), %r8b
	movb	%r8b, 1681(%rsp)
	movb	1650(%rdx), %r8b
	movb	%r8b, 1682(%rsp)
	movb	1651(%rdx), %r8b
	movb	%r8b, 1683(%rsp)
	movb	1652(%rdx), %r8b
	movb	%r8b, 1684(%rsp)
	movb	1653(%rdx), %r8b
	movb	%r8b, 1685(%rsp)
	movb	1654(%rdx), %r8b
	movb	%r8b, 1686(%rsp)
	movb	1655(%rdx), %r8b
	movb	%r8b, 1687(%rsp)
	movb	1656(%rdx), %r8b
	movb	%r8b, 1688(%rsp)
	movb	1657(%rdx), %r8b
	movb	%r8b, 1689(%rsp)
	movb	1658(%rdx), %r8b
	movb	%r8b, 1690(%rsp)
	movb	1659(%rdx), %r8b
	movb	%r8b, 1691(%rsp)
	movb	1660(%rdx), %r8b
	movb	%r8b, 1692(%rsp)
	movb	1661(%rdx), %r8b
	movb	%r8b, 1693(%rsp)
	movb	1662(%rdx), %r8b
	movb	%r8b, 1694(%rsp)
	movb	1663(%rdx), %r8b
	movb	%r8b, 1695(%rsp)
	movb	1664(%rdx), %r8b
	movb	%r8b, 1696(%rsp)
	movb	1665(%rdx), %r8b
	movb	%r8b, 1697(%rsp)
	movb	1666(%rdx), %r8b
	movb	%r8b, 1698(%rsp)
	movb	1667(%rdx), %r8b
	movb	%r8b, 1699(%rsp)
	movb	1668(%rdx), %r8b
	movb	%r8b, 1700(%rsp)
	movb	1669(%rdx), %r8b
	movb	%r8b, 1701(%rsp)
	movb	1670(%rdx), %r8b
	movb	%r8b, 1702(%rsp)
	movb	1671(%rdx), %r8b
	movb	%r8b, 1703(%rsp)
	movb	1672(%rdx), %r8b
	movb	%r8b, 1704(%rsp)
	movb	1673(%rdx), %r8b
	movb	%r8b, 1705(%rsp)
	movb	1674(%rdx), %r8b
	movb	%r8b, 1706(%rsp)
	movb	1675(%rdx), %r8b
	movb	%r8b, 1707(%rsp)
	movb	1676(%rdx), %r8b
	movb	%r8b, 1708(%rsp)
	movb	1677(%rdx), %r8b
	movb	%r8b, 1709(%rsp)
	movb	1678(%rdx), %r8b
	movb	%r8b, 1710(%rsp)
	movb	1679(%rdx), %r8b
	movb	%r8b, 1711(%rsp)
	movb	1680(%rdx), %r8b
	movb	%r8b, 1712(%rsp)
	movb	1681(%rdx), %r8b
	movb	%r8b, 1713(%rsp)
	movb	1682(%rdx), %r8b
	movb	%r8b, 1714(%rsp)
	movb	1683(%rdx), %r8b
	movb	%r8b, 1715(%rsp)
	movb	1684(%rdx), %r8b
	movb	%r8b, 1716(%rsp)
	movb	1685(%rdx), %r8b
	movb	%r8b, 1717(%rsp)
	movb	1686(%rdx), %r8b
	movb	%r8b, 1718(%rsp)
	movb	1687(%rdx), %r8b
	movb	%r8b, 1719(%rsp)
	movb	1688(%rdx), %r8b
	movb	%r8b, 1720(%rsp)
	movb	1689(%rdx), %r8b
	movb	%r8b, 1721(%rsp)
	movb	1690(%rdx), %r8b
	movb	%r8b, 1722(%rsp)
	movb	1691(%rdx), %r8b
	movb	%r8b, 1723(%rsp)
	movb	1692(%rdx), %r8b
	movb	%r8b, 1724(%rsp)
	movb	1693(%rdx), %r8b
	movb	%r8b, 1725(%rsp)
	movb	1694(%rdx), %r8b
	movb	%r8b, 1726(%rsp)
	movb	1695(%rdx), %r8b
	movb	%r8b, 1727(%rsp)
	movb	1696(%rdx), %r8b
	movb	%r8b, 1728(%rsp)
	movb	1697(%rdx), %r8b
	movb	%r8b, 1729(%rsp)
	movb	1698(%rdx), %r8b
	movb	%r8b, 1730(%rsp)
	movb	1699(%rdx), %r8b
	movb	%r8b, 1731(%rsp)
	movb	1700(%rdx), %r8b
	movb	%r8b, 1732(%rsp)
	movb	1701(%rdx), %r8b
	movb	%r8b, 1733(%rsp)
	movb	1702(%rdx), %r8b
	movb	%r8b, 1734(%rsp)
	movb	1703(%rdx), %r8b
	movb	%r8b, 1735(%rsp)
	movb	1704(%rdx), %r8b
	movb	%r8b, 1736(%rsp)
	movb	1705(%rdx), %r8b
	movb	%r8b, 1737(%rsp)
	movb	1706(%rdx), %r8b
	movb	%r8b, 1738(%rsp)
	movb	1707(%rdx), %r8b
	movb	%r8b, 1739(%rsp)
	movb	1708(%rdx), %r8b
	movb	%r8b, 1740(%rsp)
	movb	1709(%rdx), %r8b
	movb	%r8b, 1741(%rsp)
	movb	1710(%rdx), %r8b
	movb	%r8b, 1742(%rsp)
	movb	1711(%rdx), %r8b
	movb	%r8b, 1743(%rsp)
	movb	1712(%rdx), %r8b
	movb	%r8b, 1744(%rsp)
	movb	1713(%rdx), %r8b
	movb	%r8b, 1745(%rsp)
	movb	1714(%rdx), %r8b
	movb	%r8b, 1746(%rsp)
	movb	1715(%rdx), %r8b
	movb	%r8b, 1747(%rsp)
	movb	1716(%rdx), %r8b
	movb	%r8b, 1748(%rsp)
	movb	1717(%rdx), %r8b
	movb	%r8b, 1749(%rsp)
	movb	1718(%rdx), %r8b
	movb	%r8b, 1750(%rsp)
	movb	1719(%rdx), %r8b
	movb	%r8b, 1751(%rsp)
	movb	1720(%rdx), %r8b
	movb	%r8b, 1752(%rsp)
	movb	1721(%rdx), %r8b
	movb	%r8b, 1753(%rsp)
	movb	1722(%rdx), %r8b
	movb	%r8b, 1754(%rsp)
	movb	1723(%rdx), %r8b
	movb	%r8b, 1755(%rsp)
	movb	1724(%rdx), %r8b
	movb	%r8b, 1756(%rsp)
	movb	1725(%rdx), %r8b
	movb	%r8b, 1757(%rsp)
	movb	1726(%rdx), %r8b
	movb	%r8b, 1758(%rsp)
	movb	1727(%rdx), %r8b
	movb	%r8b, 1759(%rsp)
	movb	1728(%rdx), %r8b
	movb	%r8b, 1760(%rsp)
	movb	1729(%rdx), %r8b
	movb	%r8b, 1761(%rsp)
	movb	1730(%rdx), %r8b
	movb	%r8b, 1762(%rsp)
	movb	1731(%rdx), %r8b
	movb	%r8b, 1763(%rsp)
	movb	1732(%rdx), %r8b
	movb	%r8b, 1764(%rsp)
	movb	1733(%rdx), %r8b
	movb	%r8b, 1765(%rsp)
	movb	1734(%rdx), %r8b
	movb	%r8b, 1766(%rsp)
	movb	1735(%rdx), %r8b
	movb	%r8b, 1767(%rsp)
	movb	1736(%rdx), %r8b
	movb	%r8b, 1768(%rsp)
	movb	1737(%rdx), %r8b
	movb	%r8b, 1769(%rsp)
	movb	1738(%rdx), %r8b
	movb	%r8b, 1770(%rsp)
	movb	1739(%rdx), %r8b
	movb	%r8b, 1771(%rsp)
	movb	1740(%rdx), %r8b
	movb	%r8b, 1772(%rsp)
	movb	1741(%rdx), %r8b
	movb	%r8b, 1773(%rsp)
	movb	1742(%rdx), %r8b
	movb	%r8b, 1774(%rsp)
	movb	1743(%rdx), %r8b
	movb	%r8b, 1775(%rsp)
	movb	1744(%rdx), %r8b
	movb	%r8b, 1776(%rsp)
	movb	1745(%rdx), %r8b
	movb	%r8b, 1777(%rsp)
	movb	1746(%rdx), %r8b
	movb	%r8b, 1778(%rsp)
	movb	1747(%rdx), %r8b
	movb	%r8b, 1779(%rsp)
	movb	1748(%rdx), %r8b
	movb	%r8b, 1780(%rsp)
	movb	1749(%rdx), %r8b
	movb	%r8b, 1781(%rsp)
	movb	1750(%rdx), %r8b
	movb	%r8b, 1782(%rsp)
	movb	1751(%rdx), %r8b
	movb	%r8b, 1783(%rsp)
	movb	1752(%rdx), %r8b
	movb	%r8b, 1784(%rsp)
	movb	1753(%rdx), %r8b
	movb	%r8b, 1785(%rsp)
	movb	1754(%rdx), %r8b
	movb	%r8b, 1786(%rsp)
	movb	1755(%rdx), %r8b
	movb	%r8b, 1787(%rsp)
	movb	1756(%rdx), %r8b
	movb	%r8b, 1788(%rsp)
	movb	1757(%rdx), %r8b
	movb	%r8b, 1789(%rsp)
	movb	1758(%rdx), %r8b
	movb	%r8b, 1790(%rsp)
	movb	1759(%rdx), %r8b
	movb	%r8b, 1791(%rsp)
	movb	1760(%rdx), %r8b
	movb	%r8b, 1792(%rsp)
	movb	1761(%rdx), %r8b
	movb	%r8b, 1793(%rsp)
	movb	1762(%rdx), %r8b
	movb	%r8b, 1794(%rsp)
	movb	1763(%rdx), %r8b
	movb	%r8b, 1795(%rsp)
	movb	1764(%rdx), %r8b
	movb	%r8b, 1796(%rsp)
	movb	1765(%rdx), %r8b
	movb	%r8b, 1797(%rsp)
	movb	1766(%rdx), %r8b
	movb	%r8b, 1798(%rsp)
	movb	1767(%rdx), %r8b
	movb	%r8b, 1799(%rsp)
	movb	1768(%rdx), %r8b
	movb	%r8b, 1800(%rsp)
	movb	1769(%rdx), %r8b
	movb	%r8b, 1801(%rsp)
	movb	1770(%rdx), %r8b
	movb	%r8b, 1802(%rsp)
	movb	1771(%rdx), %r8b
	movb	%r8b, 1803(%rsp)
	movb	1772(%rdx), %r8b
	movb	%r8b, 1804(%rsp)
	movb	1773(%rdx), %r8b
	movb	%r8b, 1805(%rsp)
	movb	1774(%rdx), %r8b
	movb	%r8b, 1806(%rsp)
	movb	1775(%rdx), %r8b
	movb	%r8b, 1807(%rsp)
	movb	1776(%rdx), %r8b
	movb	%r8b, 1808(%rsp)
	movb	1777(%rdx), %r8b
	movb	%r8b, 1809(%rsp)
	movb	1778(%rdx), %r8b
	movb	%r8b, 1810(%rsp)
	movb	1779(%rdx), %r8b
	movb	%r8b, 1811(%rsp)
	movb	1780(%rdx), %r8b
	movb	%r8b, 1812(%rsp)
	movb	1781(%rdx), %r8b
	movb	%r8b, 1813(%rsp)
	movb	1782(%rdx), %r8b
	movb	%r8b, 1814(%rsp)
	movb	1783(%rdx), %r8b
	movb	%r8b, 1815(%rsp)
	movb	1784(%rdx), %r8b
	movb	%r8b, 1816(%rsp)
	movb	1785(%rdx), %r8b
	movb	%r8b, 1817(%rsp)
	movb	1786(%rdx), %r8b
	movb	%r8b, 1818(%rsp)
	movb	1787(%rdx), %r8b
	movb	%r8b, 1819(%rsp)
	movb	1788(%rdx), %r8b
	movb	%r8b, 1820(%rsp)
	movb	1789(%rdx), %r8b
	movb	%r8b, 1821(%rsp)
	movb	1790(%rdx), %r8b
	movb	%r8b, 1822(%rsp)
	movb	1791(%rdx), %r8b
	movb	%r8b, 1823(%rsp)
	movb	1792(%rdx), %r8b
	movb	%r8b, 1824(%rsp)
	movb	1793(%rdx), %r8b
	movb	%r8b, 1825(%rsp)
	movb	1794(%rdx), %r8b
	movb	%r8b, 1826(%rsp)
	movb	1795(%rdx), %r8b
	movb	%r8b, 1827(%rsp)
	movb	1796(%rdx), %r8b
	movb	%r8b, 1828(%rsp)
	movb	1797(%rdx), %r8b
	movb	%r8b, 1829(%rsp)
	movb	1798(%rdx), %r8b
	movb	%r8b, 1830(%rsp)
	movb	1799(%rdx), %r8b
	movb	%r8b, 1831(%rsp)
	movb	1800(%rdx), %r8b
	movb	%r8b, 1832(%rsp)
	movb	1801(%rdx), %r8b
	movb	%r8b, 1833(%rsp)
	movb	1802(%rdx), %r8b
	movb	%r8b, 1834(%rsp)
	movb	1803(%rdx), %r8b
	movb	%r8b, 1835(%rsp)
	movb	1804(%rdx), %r8b
	movb	%r8b, 1836(%rsp)
	movb	1805(%rdx), %r8b
	movb	%r8b, 1837(%rsp)
	movb	1806(%rdx), %r8b
	movb	%r8b, 1838(%rsp)
	movb	1807(%rdx), %r8b
	movb	%r8b, 1839(%rsp)
	movb	1808(%rdx), %r8b
	movb	%r8b, 1840(%rsp)
	movb	1809(%rdx), %r8b
	movb	%r8b, 1841(%rsp)
	movb	1810(%rdx), %r8b
	movb	%r8b, 1842(%rsp)
	movb	1811(%rdx), %r8b
	movb	%r8b, 1843(%rsp)
	movb	1812(%rdx), %r8b
	movb	%r8b, 1844(%rsp)
	movb	1813(%rdx), %r8b
	movb	%r8b, 1845(%rsp)
	movb	1814(%rdx), %r8b
	movb	%r8b, 1846(%rsp)
	movb	1815(%rdx), %r8b
	movb	%r8b, 1847(%rsp)
	movb	1816(%rdx), %r8b
	movb	%r8b, 1848(%rsp)
	movb	1817(%rdx), %r8b
	movb	%r8b, 1849(%rsp)
	movb	1818(%rdx), %r8b
	movb	%r8b, 1850(%rsp)
	movb	1819(%rdx), %r8b
	movb	%r8b, 1851(%rsp)
	movb	1820(%rdx), %r8b
	movb	%r8b, 1852(%rsp)
	movb	1821(%rdx), %r8b
	movb	%r8b, 1853(%rsp)
	movb	1822(%rdx), %r8b
	movb	%r8b, 1854(%rsp)
	movb	1823(%rdx), %r8b
	movb	%r8b, 1855(%rsp)
	movb	1824(%rdx), %r8b
	movb	%r8b, 1856(%rsp)
	movb	1825(%rdx), %r8b
	movb	%r8b, 1857(%rsp)
	movb	1826(%rdx), %r8b
	movb	%r8b, 1858(%rsp)
	movb	1827(%rdx), %r8b
	movb	%r8b, 1859(%rsp)
	movb	1828(%rdx), %r8b
	movb	%r8b, 1860(%rsp)
	movb	1829(%rdx), %r8b
	movb	%r8b, 1861(%rsp)
	movb	1830(%rdx), %r8b
	movb	%r8b, 1862(%rsp)
	movb	1831(%rdx), %r8b
	movb	%r8b, 1863(%rsp)
	movb	1832(%rdx), %r8b
	movb	%r8b, 1864(%rsp)
	movb	1833(%rdx), %r8b
	movb	%r8b, 1865(%rsp)
	movb	1834(%rdx), %r8b
	movb	%r8b, 1866(%rsp)
	movb	1835(%rdx), %r8b
	movb	%r8b, 1867(%rsp)
	movb	1836(%rdx), %r8b
	movb	%r8b, 1868(%rsp)
	movb	1837(%rdx), %r8b
	movb	%r8b, 1869(%rsp)
	movb	1838(%rdx), %r8b
	movb	%r8b, 1870(%rsp)
	movb	1839(%rdx), %r8b
	movb	%r8b, 1871(%rsp)
	movb	1840(%rdx), %r8b
	movb	%r8b, 1872(%rsp)
	movb	1841(%rdx), %r8b
	movb	%r8b, 1873(%rsp)
	movb	1842(%rdx), %r8b
	movb	%r8b, 1874(%rsp)
	movb	1843(%rdx), %r8b
	movb	%r8b, 1875(%rsp)
	movb	1844(%rdx), %r8b
	movb	%r8b, 1876(%rsp)
	movb	1845(%rdx), %r8b
	movb	%r8b, 1877(%rsp)
	movb	1846(%rdx), %r8b
	movb	%r8b, 1878(%rsp)
	movb	1847(%rdx), %r8b
	movb	%r8b, 1879(%rsp)
	movb	1848(%rdx), %r8b
	movb	%r8b, 1880(%rsp)
	movb	1849(%rdx), %r8b
	movb	%r8b, 1881(%rsp)
	movb	1850(%rdx), %r8b
	movb	%r8b, 1882(%rsp)
	movb	1851(%rdx), %r8b
	movb	%r8b, 1883(%rsp)
	movb	1852(%rdx), %r8b
	movb	%r8b, 1884(%rsp)
	movb	1853(%rdx), %r8b
	movb	%r8b, 1885(%rsp)
	movb	1854(%rdx), %r8b
	movb	%r8b, 1886(%rsp)
	movb	1855(%rdx), %r8b
	movb	%r8b, 1887(%rsp)
	movb	1856(%rdx), %r8b
	movb	%r8b, 1888(%rsp)
	movb	1857(%rdx), %r8b
	movb	%r8b, 1889(%rsp)
	movb	1858(%rdx), %r8b
	movb	%r8b, 1890(%rsp)
	movb	1859(%rdx), %r8b
	movb	%r8b, 1891(%rsp)
	movb	1860(%rdx), %r8b
	movb	%r8b, 1892(%rsp)
	movb	1861(%rdx), %r8b
	movb	%r8b, 1893(%rsp)
	movb	1862(%rdx), %r8b
	movb	%r8b, 1894(%rsp)
	movb	1863(%rdx), %r8b
	movb	%r8b, 1895(%rsp)
	movb	1864(%rdx), %r8b
	movb	%r8b, 1896(%rsp)
	movb	1865(%rdx), %r8b
	movb	%r8b, 1897(%rsp)
	movb	1866(%rdx), %r8b
	movb	%r8b, 1898(%rsp)
	movb	1867(%rdx), %r8b
	movb	%r8b, 1899(%rsp)
	movb	1868(%rdx), %r8b
	movb	%r8b, 1900(%rsp)
	movb	1869(%rdx), %r8b
	movb	%r8b, 1901(%rsp)
	movb	1870(%rdx), %r8b
	movb	%r8b, 1902(%rsp)
	movb	1871(%rdx), %r8b
	movb	%r8b, 1903(%rsp)
	movb	1872(%rdx), %r8b
	movb	%r8b, 1904(%rsp)
	movb	1873(%rdx), %r8b
	movb	%r8b, 1905(%rsp)
	movb	1874(%rdx), %r8b
	movb	%r8b, 1906(%rsp)
	movb	1875(%rdx), %r8b
	movb	%r8b, 1907(%rsp)
	movb	1876(%rdx), %r8b
	movb	%r8b, 1908(%rsp)
	movb	1877(%rdx), %r8b
	movb	%r8b, 1909(%rsp)
	movb	1878(%rdx), %r8b
	movb	%r8b, 1910(%rsp)
	movb	1879(%rdx), %r8b
	movb	%r8b, 1911(%rsp)
	movb	1880(%rdx), %r8b
	movb	%r8b, 1912(%rsp)
	movb	1881(%rdx), %r8b
	movb	%r8b, 1913(%rsp)
	movb	1882(%rdx), %r8b
	movb	%r8b, 1914(%rsp)
	movb	1883(%rdx), %r8b
	movb	%r8b, 1915(%rsp)
	movb	1884(%rdx), %r8b
	movb	%r8b, 1916(%rsp)
	movb	1885(%rdx), %r8b
	movb	%r8b, 1917(%rsp)
	movb	1886(%rdx), %r8b
	movb	%r8b, 1918(%rsp)
	movb	1887(%rdx), %r8b
	movb	%r8b, 1919(%rsp)
	movb	1888(%rdx), %r8b
	movb	%r8b, 1920(%rsp)
	movb	1889(%rdx), %r8b
	movb	%r8b, 1921(%rsp)
	movb	1890(%rdx), %r8b
	movb	%r8b, 1922(%rsp)
	movb	1891(%rdx), %r8b
	movb	%r8b, 1923(%rsp)
	movb	1892(%rdx), %r8b
	movb	%r8b, 1924(%rsp)
	movb	1893(%rdx), %r8b
	movb	%r8b, 1925(%rsp)
	movb	1894(%rdx), %r8b
	movb	%r8b, 1926(%rsp)
	movb	1895(%rdx), %r8b
	movb	%r8b, 1927(%rsp)
	movb	1896(%rdx), %r8b
	movb	%r8b, 1928(%rsp)
	movb	1897(%rdx), %r8b
	movb	%r8b, 1929(%rsp)
	movb	1898(%rdx), %r8b
	movb	%r8b, 1930(%rsp)
	movb	1899(%rdx), %r8b
	movb	%r8b, 1931(%rsp)
	movb	1900(%rdx), %r8b
	movb	%r8b, 1932(%rsp)
	movb	1901(%rdx), %r8b
	movb	%r8b, 1933(%rsp)
	movb	1902(%rdx), %r8b
	movb	%r8b, 1934(%rsp)
	movb	1903(%rdx), %r8b
	movb	%r8b, 1935(%rsp)
	movb	1904(%rdx), %r8b
	movb	%r8b, 1936(%rsp)
	movb	1905(%rdx), %r8b
	movb	%r8b, 1937(%rsp)
	movb	1906(%rdx), %r8b
	movb	%r8b, 1938(%rsp)
	movb	1907(%rdx), %r8b
	movb	%r8b, 1939(%rsp)
	movb	1908(%rdx), %r8b
	movb	%r8b, 1940(%rsp)
	movb	1909(%rdx), %r8b
	movb	%r8b, 1941(%rsp)
	movb	1910(%rdx), %r8b
	movb	%r8b, 1942(%rsp)
	movb	1911(%rdx), %r8b
	movb	%r8b, 1943(%rsp)
	movb	1912(%rdx), %r8b
	movb	%r8b, 1944(%rsp)
	movb	1913(%rdx), %r8b
	movb	%r8b, 1945(%rsp)
	movb	1914(%rdx), %r8b
	movb	%r8b, 1946(%rsp)
	movb	1915(%rdx), %r8b
	movb	%r8b, 1947(%rsp)
	movb	1916(%rdx), %r8b
	movb	%r8b, 1948(%rsp)
	movb	1917(%rdx), %r8b
	movb	%r8b, 1949(%rsp)
	movb	1918(%rdx), %r8b
	movb	%r8b, 1950(%rsp)
	movb	1919(%rdx), %r8b
	movb	%r8b, 1951(%rsp)
	movb	1920(%rdx), %r8b
	movb	%r8b, 1952(%rsp)
	movb	1921(%rdx), %r8b
	movb	%r8b, 1953(%rsp)
	movb	1922(%rdx), %r8b
	movb	%r8b, 1954(%rsp)
	movb	1923(%rdx), %r8b
	movb	%r8b, 1955(%rsp)
	movb	1924(%rdx), %r8b
	movb	%r8b, 1956(%rsp)
	movb	1925(%rdx), %r8b
	movb	%r8b, 1957(%rsp)
	movb	1926(%rdx), %r8b
	movb	%r8b, 1958(%rsp)
	movb	1927(%rdx), %r8b
	movb	%r8b, 1959(%rsp)
	movb	1928(%rdx), %r8b
	movb	%r8b, 1960(%rsp)
	movb	1929(%rdx), %r8b
	movb	%r8b, 1961(%rsp)
	movb	1930(%rdx), %r8b
	movb	%r8b, 1962(%rsp)
	movb	1931(%rdx), %r8b
	movb	%r8b, 1963(%rsp)
	movb	1932(%rdx), %r8b
	movb	%r8b, 1964(%rsp)
	movb	1933(%rdx), %r8b
	movb	%r8b, 1965(%rsp)
	movb	1934(%rdx), %r8b
	movb	%r8b, 1966(%rsp)
	movb	1935(%rdx), %r8b
	movb	%r8b, 1967(%rsp)
	movb	1936(%rdx), %r8b
	movb	%r8b, 1968(%rsp)
	movb	1937(%rdx), %r8b
	movb	%r8b, 1969(%rsp)
	movb	1938(%rdx), %r8b
	movb	%r8b, 1970(%rsp)
	movb	1939(%rdx), %r8b
	movb	%r8b, 1971(%rsp)
	movb	1940(%rdx), %r8b
	movb	%r8b, 1972(%rsp)
	movb	1941(%rdx), %r8b
	movb	%r8b, 1973(%rsp)
	movb	1942(%rdx), %r8b
	movb	%r8b, 1974(%rsp)
	movb	1943(%rdx), %r8b
	movb	%r8b, 1975(%rsp)
	movb	1944(%rdx), %r8b
	movb	%r8b, 1976(%rsp)
	movb	1945(%rdx), %r8b
	movb	%r8b, 1977(%rsp)
	movb	1946(%rdx), %r8b
	movb	%r8b, 1978(%rsp)
	movb	1947(%rdx), %r8b
	movb	%r8b, 1979(%rsp)
	movb	1948(%rdx), %r8b
	movb	%r8b, 1980(%rsp)
	movb	1949(%rdx), %r8b
	movb	%r8b, 1981(%rsp)
	movb	1950(%rdx), %r8b
	movb	%r8b, 1982(%rsp)
	movb	1951(%rdx), %r8b
	movb	%r8b, 1983(%rsp)
	movb	1952(%rdx), %r8b
	movb	%r8b, 1984(%rsp)
	movb	1953(%rdx), %r8b
	movb	%r8b, 1985(%rsp)
	movb	1954(%rdx), %r8b
	movb	%r8b, 1986(%rsp)
	movb	1955(%rdx), %r8b
	movb	%r8b, 1987(%rsp)
	movb	1956(%rdx), %r8b
	movb	%r8b, 1988(%rsp)
	movb	1957(%rdx), %r8b
	movb	%r8b, 1989(%rsp)
	movb	1958(%rdx), %r8b
	movb	%r8b, 1990(%rsp)
	movb	1959(%rdx), %r8b
	movb	%r8b, 1991(%rsp)
	movb	1960(%rdx), %r8b
	movb	%r8b, 1992(%rsp)
	movb	1961(%rdx), %r8b
	movb	%r8b, 1993(%rsp)
	movb	1962(%rdx), %r8b
	movb	%r8b, 1994(%rsp)
	movb	1963(%rdx), %r8b
	movb	%r8b, 1995(%rsp)
	movb	1964(%rdx), %r8b
	movb	%r8b, 1996(%rsp)
	movb	1965(%rdx), %r8b
	movb	%r8b, 1997(%rsp)
	movb	1966(%rdx), %r8b
	movb	%r8b, 1998(%rsp)
	movb	1967(%rdx), %r8b
	movb	%r8b, 1999(%rsp)
	movb	1968(%rdx), %r8b
	movb	%r8b, 2000(%rsp)
	movb	1969(%rdx), %r8b
	movb	%r8b, 2001(%rsp)
	movb	1970(%rdx), %r8b
	movb	%r8b, 2002(%rsp)
	movb	1971(%rdx), %r8b
	movb	%r8b, 2003(%rsp)
	movb	1972(%rdx), %r8b
	movb	%r8b, 2004(%rsp)
	movb	1973(%rdx), %r8b
	movb	%r8b, 2005(%rsp)
	movb	1974(%rdx), %r8b
	movb	%r8b, 2006(%rsp)
	movb	1975(%rdx), %r8b
	movb	%r8b, 2007(%rsp)
	movb	1976(%rdx), %r8b
	movb	%r8b, 2008(%rsp)
	movb	1977(%rdx), %r8b
	movb	%r8b, 2009(%rsp)
	movb	1978(%rdx), %r8b
	movb	%r8b, 2010(%rsp)
	movb	1979(%rdx), %r8b
	movb	%r8b, 2011(%rsp)
	movb	1980(%rdx), %r8b
	movb	%r8b, 2012(%rsp)
	movb	1981(%rdx), %r8b
	movb	%r8b, 2013(%rsp)
	movb	1982(%rdx), %r8b
	movb	%r8b, 2014(%rsp)
	movb	1983(%rdx), %r8b
	movb	%r8b, 2015(%rsp)
	movb	1984(%rdx), %r8b
	movb	%r8b, 2016(%rsp)
	movb	1985(%rdx), %r8b
	movb	%r8b, 2017(%rsp)
	movb	1986(%rdx), %r8b
	movb	%r8b, 2018(%rsp)
	movb	1987(%rdx), %r8b
	movb	%r8b, 2019(%rsp)
	movb	1988(%rdx), %r8b
	movb	%r8b, 2020(%rsp)
	movb	1989(%rdx), %r8b
	movb	%r8b, 2021(%rsp)
	movb	1990(%rdx), %r8b
	movb	%r8b, 2022(%rsp)
	movb	1991(%rdx), %r8b
	movb	%r8b, 2023(%rsp)
	movb	1992(%rdx), %r8b
	movb	%r8b, 2024(%rsp)
	movb	1993(%rdx), %r8b
	movb	%r8b, 2025(%rsp)
	movb	1994(%rdx), %r8b
	movb	%r8b, 2026(%rsp)
	movb	1995(%rdx), %r8b
	movb	%r8b, 2027(%rsp)
	movb	1996(%rdx), %r8b
	movb	%r8b, 2028(%rsp)
	movb	1997(%rdx), %r8b
	movb	%r8b, 2029(%rsp)
	movb	1998(%rdx), %r8b
	movb	%r8b, 2030(%rsp)
	movb	1999(%rdx), %r8b
	movb	%r8b, 2031(%rsp)
	movb	2000(%rdx), %r8b
	movb	%r8b, 2032(%rsp)
	movb	2001(%rdx), %r8b
	movb	%r8b, 2033(%rsp)
	movb	2002(%rdx), %r8b
	movb	%r8b, 2034(%rsp)
	movb	2003(%rdx), %r8b
	movb	%r8b, 2035(%rsp)
	movb	2004(%rdx), %r8b
	movb	%r8b, 2036(%rsp)
	movb	2005(%rdx), %r8b
	movb	%r8b, 2037(%rsp)
	movb	2006(%rdx), %r8b
	movb	%r8b, 2038(%rsp)
	movb	2007(%rdx), %r8b
	movb	%r8b, 2039(%rsp)
	movb	2008(%rdx), %r8b
	movb	%r8b, 2040(%rsp)
	movb	2009(%rdx), %r8b
	movb	%r8b, 2041(%rsp)
	movb	2010(%rdx), %r8b
	movb	%r8b, 2042(%rsp)
	movb	2011(%rdx), %r8b
	movb	%r8b, 2043(%rsp)
	movb	2012(%rdx), %r8b
	movb	%r8b, 2044(%rsp)
	movb	2013(%rdx), %r8b
	movb	%r8b, 2045(%rsp)
	movb	2014(%rdx), %r8b
	movb	%r8b, 2046(%rsp)
	movb	2015(%rdx), %r8b
	movb	%r8b, 2047(%rsp)
	movb	2016(%rdx), %r8b
	movb	%r8b, 2048(%rsp)
	movb	2017(%rdx), %r8b
	movb	%r8b, 2049(%rsp)
	movb	2018(%rdx), %r8b
	movb	%r8b, 2050(%rsp)
	movb	2019(%rdx), %r8b
	movb	%r8b, 2051(%rsp)
	movb	2020(%rdx), %r8b
	movb	%r8b, 2052(%rsp)
	movb	2021(%rdx), %r8b
	movb	%r8b, 2053(%rsp)
	movb	2022(%rdx), %r8b
	movb	%r8b, 2054(%rsp)
	movb	2023(%rdx), %r8b
	movb	%r8b, 2055(%rsp)
	movb	2024(%rdx), %r8b
	movb	%r8b, 2056(%rsp)
	movb	2025(%rdx), %r8b
	movb	%r8b, 2057(%rsp)
	movb	2026(%rdx), %r8b
	movb	%r8b, 2058(%rsp)
	movb	2027(%rdx), %r8b
	movb	%r8b, 2059(%rsp)
	movb	2028(%rdx), %r8b
	movb	%r8b, 2060(%rsp)
	movb	2029(%rdx), %r8b
	movb	%r8b, 2061(%rsp)
	movb	2030(%rdx), %r8b
	movb	%r8b, 2062(%rsp)
	movb	2031(%rdx), %r8b
	movb	%r8b, 2063(%rsp)
	movb	2032(%rdx), %r8b
	movb	%r8b, 2064(%rsp)
	movb	2033(%rdx), %r8b
	movb	%r8b, 2065(%rsp)
	movb	2034(%rdx), %r8b
	movb	%r8b, 2066(%rsp)
	movb	2035(%rdx), %r8b
	movb	%r8b, 2067(%rsp)
	movb	2036(%rdx), %r8b
	movb	%r8b, 2068(%rsp)
	movb	2037(%rdx), %r8b
	movb	%r8b, 2069(%rsp)
	movb	2038(%rdx), %r8b
	movb	%r8b, 2070(%rsp)
	movb	2039(%rdx), %r8b
	movb	%r8b, 2071(%rsp)
	movb	2040(%rdx), %r8b
	movb	%r8b, 2072(%rsp)
	movb	2041(%rdx), %r8b
	movb	%r8b, 2073(%rsp)
	movb	2042(%rdx), %r8b
	movb	%r8b, 2074(%rsp)
	movb	2043(%rdx), %r8b
	movb	%r8b, 2075(%rsp)
	movb	2044(%rdx), %r8b
	movb	%r8b, 2076(%rsp)
	movb	2045(%rdx), %r8b
	movb	%r8b, 2077(%rsp)
	movb	2046(%rdx), %r8b
	movb	%r8b, 2078(%rsp)
	movb	2047(%rdx), %r8b
	movb	%r8b, 2079(%rsp)
	movb	2048(%rdx), %r8b
	movb	%r8b, 2080(%rsp)
	movb	2049(%rdx), %r8b
	movb	%r8b, 2081(%rsp)
	movb	2050(%rdx), %r8b
	movb	%r8b, 2082(%rsp)
	movb	2051(%rdx), %r8b
	movb	%r8b, 2083(%rsp)
	movb	2052(%rdx), %r8b
	movb	%r8b, 2084(%rsp)
	movb	2053(%rdx), %r8b
	movb	%r8b, 2085(%rsp)
	movb	2054(%rdx), %r8b
	movb	%r8b, 2086(%rsp)
	movb	2055(%rdx), %r8b
	movb	%r8b, 2087(%rsp)
	movb	2056(%rdx), %r8b
	movb	%r8b, 2088(%rsp)
	movb	2057(%rdx), %r8b
	movb	%r8b, 2089(%rsp)
	movb	2058(%rdx), %r8b
	movb	%r8b, 2090(%rsp)
	movb	2059(%rdx), %r8b
	movb	%r8b, 2091(%rsp)
	movb	2060(%rdx), %r8b
	movb	%r8b, 2092(%rsp)
	movb	2061(%rdx), %r8b
	movb	%r8b, 2093(%rsp)
	movb	2062(%rdx), %r8b
	movb	%r8b, 2094(%rsp)
	movb	2063(%rdx), %r8b
	movb	%r8b, 2095(%rsp)
	movb	2064(%rdx), %r8b
	movb	%r8b, 2096(%rsp)
	movb	2065(%rdx), %r8b
	movb	%r8b, 2097(%rsp)
	movb	2066(%rdx), %r8b
	movb	%r8b, 2098(%rsp)
	movb	2067(%rdx), %r8b
	movb	%r8b, 2099(%rsp)
	movb	2068(%rdx), %r8b
	movb	%r8b, 2100(%rsp)
	movb	2069(%rdx), %r8b
	movb	%r8b, 2101(%rsp)
	movb	2070(%rdx), %r8b
	movb	%r8b, 2102(%rsp)
	movb	2071(%rdx), %r8b
	movb	%r8b, 2103(%rsp)
	movb	2072(%rdx), %r8b
	movb	%r8b, 2104(%rsp)
	movb	2073(%rdx), %r8b
	movb	%r8b, 2105(%rsp)
	movb	2074(%rdx), %r8b
	movb	%r8b, 2106(%rsp)
	movb	2075(%rdx), %r8b
	movb	%r8b, 2107(%rsp)
	movb	2076(%rdx), %r8b
	movb	%r8b, 2108(%rsp)
	movb	2077(%rdx), %r8b
	movb	%r8b, 2109(%rsp)
	movb	2078(%rdx), %r8b
	movb	%r8b, 2110(%rsp)
	movb	2079(%rdx), %r8b
	movb	%r8b, 2111(%rsp)
	movb	2080(%rdx), %r8b
	movb	%r8b, 2112(%rsp)
	movb	2081(%rdx), %r8b
	movb	%r8b, 2113(%rsp)
	movb	2082(%rdx), %r8b
	movb	%r8b, 2114(%rsp)
	movb	2083(%rdx), %r8b
	movb	%r8b, 2115(%rsp)
	movb	2084(%rdx), %r8b
	movb	%r8b, 2116(%rsp)
	movb	2085(%rdx), %r8b
	movb	%r8b, 2117(%rsp)
	movb	2086(%rdx), %r8b
	movb	%r8b, 2118(%rsp)
	movb	2087(%rdx), %r8b
	movb	%r8b, 2119(%rsp)
	movb	2088(%rdx), %r8b
	movb	%r8b, 2120(%rsp)
	movb	2089(%rdx), %r8b
	movb	%r8b, 2121(%rsp)
	movb	2090(%rdx), %r8b
	movb	%r8b, 2122(%rsp)
	movb	2091(%rdx), %r8b
	movb	%r8b, 2123(%rsp)
	movb	2092(%rdx), %r8b
	movb	%r8b, 2124(%rsp)
	movb	2093(%rdx), %r8b
	movb	%r8b, 2125(%rsp)
	movb	2094(%rdx), %r8b
	movb	%r8b, 2126(%rsp)
	movb	2095(%rdx), %r8b
	movb	%r8b, 2127(%rsp)
	movb	2096(%rdx), %r8b
	movb	%r8b, 2128(%rsp)
	movb	2097(%rdx), %r8b
	movb	%r8b, 2129(%rsp)
	movb	2098(%rdx), %r8b
	movb	%r8b, 2130(%rsp)
	movb	2099(%rdx), %r8b
	movb	%r8b, 2131(%rsp)
	movb	2100(%rdx), %r8b
	movb	%r8b, 2132(%rsp)
	movb	2101(%rdx), %r8b
	movb	%r8b, 2133(%rsp)
	movb	2102(%rdx), %r8b
	movb	%r8b, 2134(%rsp)
	movb	2103(%rdx), %r8b
	movb	%r8b, 2135(%rsp)
	movb	2104(%rdx), %r8b
	movb	%r8b, 2136(%rsp)
	movb	2105(%rdx), %r8b
	movb	%r8b, 2137(%rsp)
	movb	2106(%rdx), %r8b
	movb	%r8b, 2138(%rsp)
	movb	2107(%rdx), %r8b
	movb	%r8b, 2139(%rsp)
	movb	2108(%rdx), %r8b
	movb	%r8b, 2140(%rsp)
	movb	2109(%rdx), %r8b
	movb	%r8b, 2141(%rsp)
	movb	2110(%rdx), %r8b
	movb	%r8b, 2142(%rsp)
	movb	2111(%rdx), %r8b
	movb	%r8b, 2143(%rsp)
	movb	2112(%rdx), %r8b
	movb	%r8b, 2144(%rsp)
	movb	2113(%rdx), %r8b
	movb	%r8b, 2145(%rsp)
	movb	2114(%rdx), %r8b
	movb	%r8b, 2146(%rsp)
	movb	2115(%rdx), %r8b
	movb	%r8b, 2147(%rsp)
	movb	2116(%rdx), %r8b
	movb	%r8b, 2148(%rsp)
	movb	2117(%rdx), %r8b
	movb	%r8b, 2149(%rsp)
	movb	2118(%rdx), %r8b
	movb	%r8b, 2150(%rsp)
	movb	2119(%rdx), %r8b
	movb	%r8b, 2151(%rsp)
	movb	2120(%rdx), %r8b
	movb	%r8b, 2152(%rsp)
	movb	2121(%rdx), %r8b
	movb	%r8b, 2153(%rsp)
	movb	2122(%rdx), %r8b
	movb	%r8b, 2154(%rsp)
	movb	2123(%rdx), %r8b
	movb	%r8b, 2155(%rsp)
	movb	2124(%rdx), %r8b
	movb	%r8b, 2156(%rsp)
	movb	2125(%rdx), %r8b
	movb	%r8b, 2157(%rsp)
	movb	2126(%rdx), %r8b
	movb	%r8b, 2158(%rsp)
	movb	2127(%rdx), %r8b
	movb	%r8b, 2159(%rsp)
	movb	2128(%rdx), %r8b
	movb	%r8b, 2160(%rsp)
	movb	2129(%rdx), %r8b
	movb	%r8b, 2161(%rsp)
	movb	2130(%rdx), %r8b
	movb	%r8b, 2162(%rsp)
	movb	2131(%rdx), %r8b
	movb	%r8b, 2163(%rsp)
	movb	2132(%rdx), %r8b
	movb	%r8b, 2164(%rsp)
	movb	2133(%rdx), %r8b
	movb	%r8b, 2165(%rsp)
	movb	2134(%rdx), %r8b
	movb	%r8b, 2166(%rsp)
	movb	2135(%rdx), %r8b
	movb	%r8b, 2167(%rsp)
	movb	2136(%rdx), %r8b
	movb	%r8b, 2168(%rsp)
	movb	2137(%rdx), %r8b
	movb	%r8b, 2169(%rsp)
	movb	2138(%rdx), %r8b
	movb	%r8b, 2170(%rsp)
	movb	2139(%rdx), %r8b
	movb	%r8b, 2171(%rsp)
	movb	2140(%rdx), %r8b
	movb	%r8b, 2172(%rsp)
	movb	2141(%rdx), %r8b
	movb	%r8b, 2173(%rsp)
	movb	2142(%rdx), %r8b
	movb	%r8b, 2174(%rsp)
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
	lfence
	movq	$0, %rax
	movl	$15, %eax
	subl	%r8d, %eax
	leaq	32(%rsp,%rdx), %rdi
	movl	%eax, %ecx
	movq	%r10, %r9
	movq	%r11, %r10
	leaq	-8(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkfromsig$5:
	leaq	8(%rsp), %rsp
	movq	%r10, %r11
	movq	2184(%rsp), %r10
	movl	2232(%rsp), %ecx
	movq	2192(%rsp), %rdx
	lfence
	movq	$0, %rax
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
	movl	20(%r11), %edx
	leaq	2200(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movq	2176(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	%r11, 2176(%rsp)
	leaq	2200(%rsp), %r11
	leaq	32(%rsp), %rax
	movq	%rcx, %rdi
	movq	%r10, %rsi
	movq	%r11, %r10
	movq	%rax, %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkfromsig$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rdx
	movq	2176(%rsp), %rcx
	lfence
	movq	$0, %rax
	ret
.Lwots_sign$1:
	leaq	84(%rsp), %rsi
	movq	%rsi, %rdx
	movq	$0, %rdi
	movl	$0, %ecx
	movl	$0, %r8d
	jmp 	.Lwots_sign$140
.Lwots_sign$141:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$140:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$141
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, (%rdx)
	jmp 	.Lwots_sign$138
.Lwots_sign$139:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$138:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$139
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 4(%rdx)
	jmp 	.Lwots_sign$136
.Lwots_sign$137:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$136:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$137
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 8(%rdx)
	jmp 	.Lwots_sign$134
.Lwots_sign$135:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$134:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$135
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 12(%rdx)
	jmp 	.Lwots_sign$132
.Lwots_sign$133:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$132:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$133
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 16(%rdx)
	jmp 	.Lwots_sign$130
.Lwots_sign$131:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$130:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$131
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 20(%rdx)
	jmp 	.Lwots_sign$128
.Lwots_sign$129:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$128:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$129
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 24(%rdx)
	jmp 	.Lwots_sign$126
.Lwots_sign$127:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$126:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$127
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 28(%rdx)
	jmp 	.Lwots_sign$124
.Lwots_sign$125:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$124:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$125
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 32(%rdx)
	jmp 	.Lwots_sign$122
.Lwots_sign$123:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$122:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$123
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 36(%rdx)
	jmp 	.Lwots_sign$120
.Lwots_sign$121:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$120:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$121
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 40(%rdx)
	jmp 	.Lwots_sign$118
.Lwots_sign$119:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$118:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$119
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 44(%rdx)
	jmp 	.Lwots_sign$116
.Lwots_sign$117:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$116:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$117
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 48(%rdx)
	jmp 	.Lwots_sign$114
.Lwots_sign$115:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$114:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$115
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 52(%rdx)
	jmp 	.Lwots_sign$112
.Lwots_sign$113:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$112:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$113
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 56(%rdx)
	jmp 	.Lwots_sign$110
.Lwots_sign$111:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$110:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$111
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 60(%rdx)
	jmp 	.Lwots_sign$108
.Lwots_sign$109:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$108:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$109
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 64(%rdx)
	jmp 	.Lwots_sign$106
.Lwots_sign$107:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$106:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$107
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 68(%rdx)
	jmp 	.Lwots_sign$104
.Lwots_sign$105:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$104:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$105
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 72(%rdx)
	jmp 	.Lwots_sign$102
.Lwots_sign$103:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$102:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$103
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 76(%rdx)
	jmp 	.Lwots_sign$100
.Lwots_sign$101:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$100:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$101
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 80(%rdx)
	jmp 	.Lwots_sign$98
.Lwots_sign$99:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$98:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$99
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 84(%rdx)
	jmp 	.Lwots_sign$96
.Lwots_sign$97:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$96:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$97
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 88(%rdx)
	jmp 	.Lwots_sign$94
.Lwots_sign$95:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$94:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$95
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 92(%rdx)
	jmp 	.Lwots_sign$92
.Lwots_sign$93:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$92:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$93
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 96(%rdx)
	jmp 	.Lwots_sign$90
.Lwots_sign$91:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$90:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$91
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 100(%rdx)
	jmp 	.Lwots_sign$88
.Lwots_sign$89:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$88:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$89
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 104(%rdx)
	jmp 	.Lwots_sign$86
.Lwots_sign$87:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$86:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$87
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 108(%rdx)
	jmp 	.Lwots_sign$84
.Lwots_sign$85:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$84:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$85
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 112(%rdx)
	jmp 	.Lwots_sign$82
.Lwots_sign$83:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$82:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$83
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 116(%rdx)
	jmp 	.Lwots_sign$80
.Lwots_sign$81:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$80:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$81
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 120(%rdx)
	jmp 	.Lwots_sign$78
.Lwots_sign$79:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$78:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$79
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 124(%rdx)
	jmp 	.Lwots_sign$76
.Lwots_sign$77:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$76:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$77
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 128(%rdx)
	jmp 	.Lwots_sign$74
.Lwots_sign$75:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$74:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$75
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 132(%rdx)
	jmp 	.Lwots_sign$72
.Lwots_sign$73:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$72:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$73
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 136(%rdx)
	jmp 	.Lwots_sign$70
.Lwots_sign$71:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$70:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$71
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 140(%rdx)
	jmp 	.Lwots_sign$68
.Lwots_sign$69:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$68:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$69
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 144(%rdx)
	jmp 	.Lwots_sign$66
.Lwots_sign$67:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$66:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$67
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 148(%rdx)
	jmp 	.Lwots_sign$64
.Lwots_sign$65:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$64:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$65
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 152(%rdx)
	jmp 	.Lwots_sign$62
.Lwots_sign$63:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$62:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$63
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 156(%rdx)
	jmp 	.Lwots_sign$60
.Lwots_sign$61:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$60:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$61
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 160(%rdx)
	jmp 	.Lwots_sign$58
.Lwots_sign$59:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$58:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$59
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 164(%rdx)
	jmp 	.Lwots_sign$56
.Lwots_sign$57:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$56:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$57
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 168(%rdx)
	jmp 	.Lwots_sign$54
.Lwots_sign$55:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$54:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$55
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 172(%rdx)
	jmp 	.Lwots_sign$52
.Lwots_sign$53:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$52:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$53
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 176(%rdx)
	jmp 	.Lwots_sign$50
.Lwots_sign$51:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$50:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$51
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 180(%rdx)
	jmp 	.Lwots_sign$48
.Lwots_sign$49:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$48:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$49
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 184(%rdx)
	jmp 	.Lwots_sign$46
.Lwots_sign$47:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$46:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$47
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 188(%rdx)
	jmp 	.Lwots_sign$44
.Lwots_sign$45:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$44:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$45
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 192(%rdx)
	jmp 	.Lwots_sign$42
.Lwots_sign$43:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$42:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$43
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 196(%rdx)
	jmp 	.Lwots_sign$40
.Lwots_sign$41:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$40:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$41
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 200(%rdx)
	jmp 	.Lwots_sign$38
.Lwots_sign$39:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$38:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$39
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 204(%rdx)
	jmp 	.Lwots_sign$36
.Lwots_sign$37:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$36:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$37
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 208(%rdx)
	jmp 	.Lwots_sign$34
.Lwots_sign$35:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$34:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$35
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 212(%rdx)
	jmp 	.Lwots_sign$32
.Lwots_sign$33:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$32:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$33
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 216(%rdx)
	jmp 	.Lwots_sign$30
.Lwots_sign$31:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$30:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$31
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 220(%rdx)
	jmp 	.Lwots_sign$28
.Lwots_sign$29:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$28:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$29
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 224(%rdx)
	jmp 	.Lwots_sign$26
.Lwots_sign$27:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$26:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$27
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 228(%rdx)
	jmp 	.Lwots_sign$24
.Lwots_sign$25:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$24:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$25
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 232(%rdx)
	jmp 	.Lwots_sign$22
.Lwots_sign$23:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$22:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$23
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 236(%rdx)
	jmp 	.Lwots_sign$20
.Lwots_sign$21:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$20:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$21
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 240(%rdx)
	jmp 	.Lwots_sign$18
.Lwots_sign$19:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$18:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$19
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 244(%rdx)
	jmp 	.Lwots_sign$16
.Lwots_sign$17:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$16:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$17
	movl	%r8d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 248(%rdx)
	jmp 	.Lwots_sign$14
.Lwots_sign$15:
	shll	$8, %r8d
	movzbl	(%rax,%rdi), %ebp
	orl 	%ebp, %r8d
	incq	%rdi
	addl	$8, %ecx
.Lwots_sign$14:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$15
	movl	%r8d, %eax
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
	leaq	256(%rsi), %rdx
	leaq	352(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %ecx
	movl	$0, %edi
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r8d
	orl 	%r8d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lwots_sign$12:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$13
	movl	%edi, %r8d
	addl	$-4, %ecx
	shrq	%cl, %r8
	andq	$15, %r8
	movl	%r8d, (%rdx)
	jmp 	.Lwots_sign$10
.Lwots_sign$11:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r8d
	orl 	%r8d, %edi
	incq	%rsi
	addl	$8, %ecx
.Lwots_sign$10:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$11
	movl	%edi, %r8d
	addl	$-4, %ecx
	shrq	%cl, %r8
	andq	$15, %r8
	movl	%r8d, 4(%rdx)
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %edi
	movzbl	(%rax,%rsi), %r8d
	orl 	%r8d, %edi
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
	movq	(%r10), %rdx
	movq	%rdx, (%rax)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r10), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r10), %rdx
	movq	%rdx, 24(%rax)
	leaq	48(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%r10), %edx
	leaq	48(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movq	%r10, 8(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_sign$5
.Lwots_sign$6:
	movq	%r11, 16(%rsp)
	movq	%r9, 24(%rsp)
	movl	%ecx, 80(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%ecx, %eax
	leaq	48(%rsp), %rcx
	movl	%eax, 24(%rcx)
	leaq	(%rbx,%rdx), %rcx
	movq	%rbx, 40(%rsp)
	leaq	48(%rsp), %r10
	movq	%r9, %rsi
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lwots_sign$7:
	leaq	40(%rsp), %rsp
	movq	40(%rsp), %rbx
	lfence
	movq	$0, %rax
	movq	16(%rsp), %r11
	movq	24(%rsp), %r9
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rdx
	lfence
	movq	$0, %rax
	incl	%ecx
	addq	$32, %rdx
.Lwots_sign$5:
	cmpl	$67, %ecx
	jb  	.Lwots_sign$6
	movq	8(%rsp), %r10
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_sign$2
.Lwots_sign$3:
	movq	%r9, 8(%rsp)
	movl	%ecx, 80(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%ecx, %eax
	movl	%eax, 24(%r10)
	movl	$0, %r8d
	movl	%ecx, %eax
	movl	84(%rsp,%rax,4), %eax
	lfence
	movq	$0, %rcx
	leaq	(%rbx,%rdx), %rdi
	movq	%rbx, 24(%rsp)
	movl	%eax, %ecx
	leaq	-8(%rsp), %rsp
	call	.Lchain$1
.Lwots_sign$4:
	leaq	8(%rsp), %rsp
	movq	24(%rsp), %rbx
	lfence
	movq	$0, %rax
	movq	8(%rsp), %r9
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rdx
	lfence
	movq	$0, %rax
	incl	%ecx
	addq	$32, %rdx
.Lwots_sign$2:
	cmpl	$67, %ecx
	jb  	.Lwots_sign$3
	ret
.Lwots_pkgen$1:
	movq	%rdi, 2176(%rsp)
	leaq	2216(%rsp), %rcx
	movq	(%r10), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r10), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r10), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r10), %rdx
	movq	%rdx, 24(%rcx)
	leaq	2216(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%r10), %edx
	leaq	2216(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movl	%edx, 2248(%rsp)
	movq	%r10, 2184(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$6
.Lwots_pkgen$7:
	movq	%r11, 2192(%rsp)
	movq	%rsi, 2200(%rsp)
	movl	%ecx, 2252(%rsp)
	movq	%rdx, 2208(%rsp)
	leaq	2216(%rsp), %r10
	movl	%ecx, 24(%r10)
	leaq	32(%rsp,%rdx), %rcx
	leaq	2216(%rsp), %r10
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lwots_pkgen$8:
	leaq	40(%rsp), %rsp
	movq	2192(%rsp), %r11
	movq	2200(%rsp), %rsi
	movl	2252(%rsp), %ecx
	movq	2208(%rsp), %rdx
	lfence
	movq	$0, %r8
	incl	%ecx
	addq	$32, %rdx
.Lwots_pkgen$6:
	cmpl	$67, %ecx
	jb  	.Lwots_pkgen$7
	movq	2184(%rsp), %r10
	lfence
	movq	$0, %rcx
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$3
.Lwots_pkgen$4:
	movq	%rsi, 2184(%rsp)
	movl	%ecx, 2252(%rsp)
	movq	%rdx, 2208(%rsp)
	movl	%ecx, 24(%r10)
	movl	$0, %r8d
	movl	$15, %ecx
	leaq	32(%rsp,%rdx), %rdi
	movq	%rsi, %r9
	leaq	-8(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkgen$5:
	leaq	8(%rsp), %rsp
	movq	2184(%rsp), %rsi
	movl	2252(%rsp), %ecx
	movq	2208(%rsp), %rdx
	lfence
	movq	$0, %rdi
	incl	%ecx
	addq	$32, %rdx
.Lwots_pkgen$3:
	cmpl	$67, %ecx
	jb  	.Lwots_pkgen$4
	leaq	2216(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$1, 16(%rcx)
	movl	2248(%rsp), %edx
	lfence
	movq	$0, %rcx
	leaq	2216(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movq	2176(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	%r10, 2176(%rsp)
	leaq	2216(%rsp), %r10
	leaq	32(%rsp), %rdx
	movq	%rcx, %rdi
	movq	%rdx, %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rdi
	movq	2176(%rsp), %rcx
	lfence
	movq	$0, %rdx
	ret
.Lchain$1:
	movl	%r8d, %esi
	addl	%ecx, %esi
	jmp 	.Lchain$2
.Lchain$3:
	movl	%r8d, 28(%r10)
	movq	%r9, %mm0
	movq	%r10, %mm1
	movd	%r8d, %mm2
	movd	%esi, %mm3
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lchain$4:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rdi
	movq	%mm0, %r9
	movq	%mm1, %r10
	movd	%mm2, %r8d
	movd	%mm3, %esi
	incl	%r8d
.Lchain$2:
	cmpl	%esi, %r8d
	jb  	.Lchain$3
	ret
.LT_k$1:
	movq	%rdi, %mm0
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
	movq	$0, %rdi
	vpxor	%ymm7, %ymm7, %ymm7
	vmovdqu	(%rcx,%rdi), %xmm8
	vpslldq	$8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	8(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	16(%rcx,%rdi), %xmm8
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
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
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
	movq	$0, %rsi
	jmp 	.LT_k$6
.LT_k$7:
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	40(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm7
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
	incq	%rsi
.LT_k$6:
	cmpq	$7, %rsi
	jb  	.LT_k$7
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	40(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm7
	vmovdqu	48(%rax,%rcx), %ymm14
	movq	80(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm8
	movq	88(%rax,%rcx), %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
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
	movq	%mm0, %rcx
	movq	$0, %rax
	movq	$0, %rsi
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
	incq	%rsi
.LT_k$3:
	cmpq	$0, %rsi
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
	movq	%rdi, %mm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	movq	$0, %rdi
	vpbroadcastq	(%rsi,%rdi), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rsi,%rdi), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%rsi,%rdi), %rdx
	vmovq	%rdx, %xmm8
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	vpxor	%ymm7, %ymm7, %ymm7
	vmovdqu	(%rdx,%rdi), %xmm8
	vpslldq	$8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	8(%rdx,%rdi), %rsi
	vmovq	%rsi, %xmm7
	vmovdqu	16(%rdx,%rdi), %xmm8
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
	movq	$0, %rdi
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vmovdqu	(%rcx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	16(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	24(%rcx,%rdi), %ymm13
	movq	56(%rcx,%rdi), %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	movq	64(%rcx,%rdi), %rdx
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
	addq	$72, %rdi
	call	.L_keccakf1600_avx2$1
.LT_len$9:
	movq	$0, %rsi
	jmp 	.LT_len$6
.LT_len$7:
	vpbroadcastq	(%rcx,%rdi), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rcx,%rdi), %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	addq	$136, %rdi
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%rsi
.LT_len$6:
	cmpq	$15, %rsi
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%rdi), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rcx,%rdi), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%rcx,%rdi), %rcx
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
	movq	%mm0, %rcx
	movq	$0, %rdi
	movq	$0, %rsi
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm1, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm0, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm8
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm3, %ymm2, %ymm10
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$240, %ymm5, %ymm4, %ymm13
	vpblendd	$240, %ymm4, %ymm5, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm8, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm9, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rdi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdi)
	addq	$136, %rdi
	incq	%rsi
.LT_len$3:
	cmpq	$0, %rsi
	jb  	.LT_len$4
	call	.L_keccakf1600_avx2$1
.LT_len$2:
	movq	%xmm1, (%rcx,%rdi)
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rdi)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, 24(%rcx,%rdi)
	ret
.LH$1:
	movq	%rdi, %mm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	movq	$0, %rdi
	vpbroadcastq	(%rsi,%rdi), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rsi,%rdi), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%rsi,%rdi), %rsi
	vmovq	%rsi, %xmm8
	movq	$0, %rsi
	vpinsrq	$1, %rsi, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	vpxor	%ymm7, %ymm7, %ymm7
	vmovdqu	(%rsi,%rdi), %xmm8
	vpslldq	$8, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
	movq	8(%rsi,%rdi), %r8
	vmovq	%r8, %xmm7
	vmovdqu	16(%rsi,%rdi), %xmm8
	vmovdqu	%xmm8, %xmm8
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
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
	vpxor	%ymm14, %ymm2, %ymm2
	vpxor	%ymm11, %ymm3, %ymm3
	vpxor	%ymm9, %ymm4, %ymm4
	vpxor	%ymm10, %ymm5, %ymm5
	vmovdqu	%xmm8, %xmm8
	vinserti128	$1, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm6, %ymm6
	movq	$0, %rdi
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vmovdqu	(%rcx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	16(%rcx,%rdi), %rsi
	vmovq	%rsi, %xmm8
	movq	24(%rcx,%rdi), %rcx
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
	movq	$0, %rsi
	vmovq	%rsi, %xmm7
	vpxor	%ymm14, %ymm14, %ymm14
	movq	$0, %rsi
	vmovq	%rsi, %xmm8
	vmovdqu	(%rdx,%rcx), %xmm9
	vpslldq	$8, %xmm9, %xmm9
	vmovdqu	%xmm9, %xmm9
	vmovdqu	8(%rdx,%rcx), %xmm10
	vinserti128	$1, %xmm10, %ymm9, %ymm13
	movq	24(%rdx,%rcx), %rcx
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
	movq	%mm0, %rcx
	movq	$0, %rdi
	movq	$0, %rsi
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm1, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm0, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm8
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm3, %ymm2, %ymm10
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$240, %ymm5, %ymm4, %ymm13
	vpblendd	$240, %ymm4, %ymm5, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm8, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm9, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rdi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdi)
	addq	$136, %rdi
	incq	%rsi
.LH$3:
	cmpq	$0, %rsi
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm1, (%rcx,%rdi)
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rdi)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, 24(%rcx,%rdi)
	ret
.LF$1:
	movq	%rdi, %mm4
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
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vmovdqu	(%rdi,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm8, %ymm14
	movq	16(%rdi,%rcx), %rdx
	vmovq	%rdx, %xmm8
	movq	24(%rdi,%rcx), %rcx
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
	movq	%mm4, %rcx
	movq	$0, %rdi
	movq	$0, %rsi
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm1, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm0, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm8
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm3, %ymm2, %ymm10
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$240, %ymm5, %ymm4, %ymm13
	vpblendd	$240, %ymm4, %ymm5, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm8, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm9, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rdi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdi)
	addq	$136, %rdi
	incq	%rsi
.LF$3:
	cmpq	$0, %rsi
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm1, (%rcx,%rdi)
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rdi)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, 24(%rcx,%rdi)
	ret
.LPRF$1:
	movq	%rcx, %mm0
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm6, %ymm6, %ymm6
	vpxor	%ymm2, %ymm2, %ymm2
	vpxor	%ymm3, %ymm3, %ymm3
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm5, %ymm5, %ymm5
	movq	$0, %rcx
	vpbroadcastq	(%rsi,%rcx), %ymm7
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqu	8(%rsi,%rcx), %xmm7
	vmovdqu	%xmm7, %xmm7
	movq	24(%rsi,%rcx), %rcx
	vmovq	%rcx, %xmm8
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm8, %xmm8
	vinserti128	$1, %xmm8, %ymm7, %ymm7
	vpxor	%ymm7, %ymm0, %ymm0
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
	movq	$0, %rdx
	vmovq	%rdx, %xmm7
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
	movq	%mm0, %rcx
	movq	$0, %rdi
	movq	$0, %rsi
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm1, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm0, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm7
	vmovdqu	%xmm6, %xmm8
	movq	%xmm7, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm7, %xmm7, %xmm7
	vpblendd	$240, %ymm3, %ymm2, %ymm10
	vpblendd	$240, %ymm2, %ymm3, %ymm12
	vpblendd	$240, %ymm5, %ymm4, %ymm13
	vpblendd	$240, %ymm4, %ymm5, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm8, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm9, %ymm8
	vmovdqu	%ymm8, 88(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 120(%rcx,%rdi)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rdi)
	addq	$136, %rdi
	incq	%rsi
.LPRF$3:
	cmpq	$0, %rsi
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm1, (%rcx,%rdi)
	vmovdqu	%xmm0, %xmm7
	vmovdqu	%xmm7, 8(%rcx,%rdi)
	vextracti128	$1, %ymm0, %xmm0
	movq	%xmm0, 24(%rcx,%rdi)
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
	vmovdqu	(%r10), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vmovdqu	(%r9), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	movb	$0, 96(%rsp)
	movb	%cl, 97(%rsp)
	movq	$66, %rcx
	movq	$0, %rdx
	movq	232(%rsp), %r11
	movq	240(%rsp), %rsi
	lfence
	movq	$0, %rax
	jmp 	.LPRF_msg$11
.LPRF_msg$12:
	cmpq	$136, %rcx
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
	movq	$0, %rcx
.LPRF_msg$13:
	movb	(%r11,%rdx), %r9b
	incq	%rdx
	xorb	%r9b, 32(%rsp,%rcx)
	incq	%rcx
.LPRF_msg$11:
	cmpq	%rsi, %rdx
	jb  	.LPRF_msg$12
	movq	$0, %rdx
	movq	248(%rsp), %r10
	movq	256(%rsp), %rsi
	lfence
	movq	$0, %rax
	jmp 	.LPRF_msg$7
.LPRF_msg$8:
	cmpq	$136, %rcx
	jb  	.LPRF_msg$9
	movq	%r10, 256(%rsp)
	movq	%rdx, 248(%rsp)
	movq	%rsi, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$10:
	leaq	200(%rsp), %rsp
	movq	256(%rsp), %r10
	movq	248(%rsp), %rdx
	movq	264(%rsp), %rsi
	lfence
	movq	$0, %rax
	movq	$0, %rcx
.LPRF_msg$9:
	movb	(%r10,%rdx), %r9b
	incq	%rdx
	xorb	%r9b, 32(%rsp,%rcx)
	incq	%rcx
.LPRF_msg$7:
	cmpq	%rsi, %rdx
	jb  	.LPRF_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rcx
	jb  	.LPRF_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %rcx
.LPRF_msg$5:
	xorb	$31, 32(%rsp,%rcx)
	leaq	32(%rsp), %rax
	cmpq	$136, %rcx
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
	vmovdqu	32(%rsp), %ymm0
	vmovdqu	%ymm0, (%rcx)
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
	vmovdqu	(%r8), %ymm0
	vmovdqu	%ymm0, 32(%rsp)
	vmovdqu	(%r9), %ymm0
	vmovdqu	%ymm0, 64(%rsp)
	vmovdqu	(%r10), %ymm0
	vmovdqu	%ymm0, 96(%rsp)
	movb	$0, 128(%rsp)
	movb	%cl, 129(%rsp)
	movq	$98, %rcx
	movq	$0, %rdx
	movq	232(%rsp), %r11
	movq	240(%rsp), %rsi
	lfence
	movq	$0, %rax
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %rcx
	jb  	.LH_msg$13
	movq	%r11, 240(%rsp)
	movq	%rdx, 232(%rsp)
	movq	%rsi, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$14:
	leaq	200(%rsp), %rsp
	movq	240(%rsp), %r11
	movq	232(%rsp), %rdx
	movq	264(%rsp), %rsi
	lfence
	movq	$0, %rcx
	movq	$0, %rcx
.LH_msg$13:
	movb	(%r11,%rdx), %r9b
	incq	%rdx
	xorb	%r9b, 32(%rsp,%rcx)
	incq	%rcx
.LH_msg$11:
	cmpq	%rsi, %rdx
	jb  	.LH_msg$12
	movq	$0, %rdx
	movq	248(%rsp), %r10
	movq	256(%rsp), %rsi
	lfence
	movq	$0, %rax
	jmp 	.LH_msg$7
.LH_msg$8:
	cmpq	$136, %rcx
	jb  	.LH_msg$9
	movq	%r10, 256(%rsp)
	movq	%rdx, 248(%rsp)
	movq	%rsi, 264(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$10:
	leaq	200(%rsp), %rsp
	movq	256(%rsp), %r10
	movq	248(%rsp), %rdx
	movq	264(%rsp), %rsi
	lfence
	movq	$0, %rax
	movq	$0, %rcx
.LH_msg$9:
	movb	(%r10,%rdx), %r9b
	incq	%rdx
	xorb	%r9b, 32(%rsp,%rcx)
	incq	%rcx
.LH_msg$7:
	cmpq	%rsi, %rdx
	jb  	.LH_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %rcx
	jb  	.LH_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %rcx
.LH_msg$5:
	xorb	$31, 32(%rsp,%rcx)
	leaq	32(%rsp), %rax
	cmpq	$136, %rcx
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
	movb	66(%rsp), %r9b
	movb	%r9b, 34(%rdi)
	movb	67(%rsp), %r9b
	movb	%r9b, 35(%rdi)
	movb	68(%rsp), %r9b
	movb	%r9b, 36(%rdi)
	movb	69(%rsp), %r9b
	movb	%r9b, 37(%rdi)
	movb	70(%rsp), %r9b
	movb	%r9b, 38(%rdi)
	movb	71(%rsp), %r9b
	movb	%r9b, 39(%rdi)
	movb	72(%rsp), %r9b
	movb	%r9b, 40(%rdi)
	movb	73(%rsp), %r9b
	movb	%r9b, 41(%rdi)
	movb	74(%rsp), %r9b
	movb	%r9b, 42(%rdi)
	movb	75(%rsp), %r9b
	movb	%r9b, 43(%rdi)
	movb	76(%rsp), %r9b
	movb	%r9b, 44(%rdi)
	movb	77(%rsp), %r9b
	movb	%r9b, 45(%rdi)
	movb	78(%rsp), %r9b
	movb	%r9b, 46(%rdi)
	movb	79(%rsp), %r9b
	movb	%r9b, 47(%rdi)
	movb	80(%rsp), %r9b
	movb	%r9b, 48(%rdi)
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
	vpbroadcastq	(%rdx,%r8,8), %ymm7
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
