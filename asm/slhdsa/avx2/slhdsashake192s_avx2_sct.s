	.att_syntax
	.text
	.p2align	5
	.global	slh_dsa_shake192s_verify
	.global	slh_dsa_shake192s_sign
	.global	slh_dsa_shake192s_keygen
	.type	slh_dsa_shake192s_verify, %function
slh_dsa_shake192s_verify:
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
	jbe 	.Lslh_dsa_shake192s_verify$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake192s_verify$2
.Lslh_dsa_shake192s_verify$1:
	movq	%rsi, %rcx
	movq	%r9, %rsi
	leaq	-184(%rsp), %rsp
	call	.Lslh_verify_internal_$1
.Lslh_dsa_shake192s_verify$3:
	leaq	184(%rsp), %rsp
.Lslh_dsa_shake192s_verify$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake192s_sign, %function
slh_dsa_shake192s_sign:
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
	jbe 	.Lslh_dsa_shake192s_sign$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake192s_sign$2
.Lslh_dsa_shake192s_sign$1:
	movq	%rdx, %rcx
	movq	%r10, %rdx
	leaq	-184(%rsp), %rsp
	call	.Lslh_sign_internal_$1
.Lslh_dsa_shake192s_sign$3:
	leaq	184(%rsp), %rsp
.Lslh_dsa_shake192s_sign$2:
	movq	(%rsp), %rbx
	movq	8(%rsp), %rbp
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	movq	40(%rsp), %r15
	movq	48(%rsp), %rsp
	ret
	.type	slh_dsa_shake192s_keygen, %function
slh_dsa_shake192s_keygen:
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
.Lslh_dsa_shake192s_keygen$1:
	leaq	56(%rsp), %rsp
	movq	(%rsp), %rbx
	movq	8(%rsp), %rsp
	ret
.Lslh_verify_internal_$1:
	leaq	80(%rsp), %r9
	movq	$0, (%r9)
	movq	$0, 8(%r9)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movq	%rdi, %r9
	leaq	24(%rdi), %r10
	movq	%r8, %r11
	movq	%r9, 56(%rsp)
	movq	%r10, 64(%rsp)
	movq	%r8, 72(%rsp)
	leaq	128(%rsp), %rdi
	movq	%r11, %r8
	movq	%rax, %r11
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_verify_internal_$4:
	leaq	280(%rsp), %rsp
// declassify_mem 39 [RSP + 128]
	movq	56(%rsp), %rsi
	movq	64(%rsp), %rax
	movq	72(%rsp), %rdi
	lfence
	movq	$0, %rcx
	leaq	128(%rsp), %rcx
	leaq	158(%rsp), %rdx
	leaq	165(%rsp), %r8
	movl	$0, 116(%rsp)
	movl	$0, 120(%rsp)
	movl	$0, 124(%rsp)
	shll	$8, 116(%rsp)
	movl	120(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 120(%rsp)
	movl	124(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 120(%rsp)
	shll	$8, 124(%rsp)
	movzbl	(%rdx), %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 116(%rsp)
	movl	120(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 120(%rsp)
	movl	124(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 120(%rsp)
	shll	$8, 124(%rsp)
	movzbl	1(%rdx), %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 116(%rsp)
	movl	120(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 120(%rsp)
	movl	124(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 120(%rsp)
	shll	$8, 124(%rsp)
	movzbl	2(%rdx), %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 116(%rsp)
	movl	120(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 120(%rsp)
	movl	124(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 120(%rsp)
	shll	$8, 124(%rsp)
	movzbl	3(%rdx), %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 116(%rsp)
	movl	120(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 120(%rsp)
	movl	124(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 120(%rsp)
	shll	$8, 124(%rsp)
	movzbl	4(%rdx), %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 116(%rsp)
	movl	120(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 120(%rsp)
	movl	124(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 120(%rsp)
	shll	$8, 124(%rsp)
	movzbl	5(%rdx), %r9d
	orl 	%r9d, 124(%rsp)
	shll	$8, 116(%rsp)
	movl	120(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 116(%rsp)
	shll	$8, 120(%rsp)
	movl	124(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 120(%rsp)
	shll	$8, 124(%rsp)
	movzbl	6(%rdx), %r9d
	orl 	%r9d, 124(%rsp)
	movl	$0, 116(%rsp)
	andl	$4194303, 120(%rsp)
	movl	$0, %edx
	shll	$8, %edx
	movzbl	(%r8), %r9d
	orl 	%r9d, %edx
	shll	$8, %edx
	movzbl	1(%r8), %r9d
	orl 	%r9d, %edx
	andl	$511, %edx
	leaq	80(%rsp), %r9
	movl	116(%rsp), %r8d
	movl	%r8d, 4(%r9)
	movl	120(%rsp), %r8d
	movl	%r8d, 8(%r9)
	movl	124(%rsp), %r8d
	movl	%r8d, 12(%r9)
	leaq	80(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$3, 16(%r9)
	leaq	80(%rsp), %r9
	movl	%edx, 20(%r9)
	leaq	24(%rdi), %r9
	movq	%rsi, 72(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rdi, 56(%rsp)
	movl	%edx, 112(%rsp)
	leaq	32(%rsp), %rax
	leaq	80(%rsp), %rdi
	movq	%rax, %r8
	movq	%r9, %rax
	movq	%rcx, %rdx
	leaq	-728(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	728(%rsp), %rsp
	movq	72(%rsp), %rsi
	movq	64(%rsp), %r10
	movq	56(%rsp), %rdi
	movl	112(%rsp), %edx
	lfence
	movq	$0, %rax
	leaq	32(%rsp), %rax
	leaq	6144(%rdi), %rcx
	leaq	116(%rsp), %rdi
	leaq	-152(%rsp), %rsp
	call	.Lht_verify$1
.Lslh_verify_internal_$2:
	leaq	152(%rsp), %rsp
	ret
.Lslh_sign_internal_$1:
	leaq	104(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movq	%rax, 56(%rsp)
	movq	%rcx, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%r8, 80(%rsp)
	leaq	24(%rsi), %r10
	movq	%rdi, %r11
	movq	%rdi, 88(%rsp)
	movq	%rsi, 96(%rsp)
	movq	%r10, %rsi
	movq	%r9, %rdi
	leaq	-280(%rsp), %rsp
	call	.LPRF_msg$1
.Lslh_sign_internal_$6:
	leaq	280(%rsp), %rsp
	movq	%rcx, %r8
	movq	88(%rsp), %rdi
	movq	96(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	56(%rsp), %r11
	movq	64(%rsp), %rcx
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rsi
	lfence
	movq	$0, %r9
	leaq	48(%rax), %r9
	leaq	72(%rax), %r10
// declassify_mem 24 [R9]
	movq	%r9, 80(%rsp)
	movq	%rdi, 72(%rsp)
	movq	%rax, 64(%rsp)
	leaq	152(%rsp), %rdi
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_sign_internal_$5:
	leaq	280(%rsp), %rsp
// declassify_mem 39 [RSP + 152]
	movq	80(%rsp), %rsi
	movq	72(%rsp), %rdi
	movq	64(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	152(%rsp), %rcx
	leaq	182(%rsp), %rdx
	leaq	189(%rsp), %r8
	movl	$0, 140(%rsp)
	movl	$0, 144(%rsp)
	movl	$0, 148(%rsp)
	shll	$8, 140(%rsp)
	movl	144(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 144(%rsp)
	movl	148(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 144(%rsp)
	shll	$8, 148(%rsp)
	movzbl	(%rdx), %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 140(%rsp)
	movl	144(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 144(%rsp)
	movl	148(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 144(%rsp)
	shll	$8, 148(%rsp)
	movzbl	1(%rdx), %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 140(%rsp)
	movl	144(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 144(%rsp)
	movl	148(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 144(%rsp)
	shll	$8, 148(%rsp)
	movzbl	2(%rdx), %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 140(%rsp)
	movl	144(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 144(%rsp)
	movl	148(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 144(%rsp)
	shll	$8, 148(%rsp)
	movzbl	3(%rdx), %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 140(%rsp)
	movl	144(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 144(%rsp)
	movl	148(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 144(%rsp)
	shll	$8, 148(%rsp)
	movzbl	4(%rdx), %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 140(%rsp)
	movl	144(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 144(%rsp)
	movl	148(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 144(%rsp)
	shll	$8, 148(%rsp)
	movzbl	5(%rdx), %r9d
	orl 	%r9d, 148(%rsp)
	shll	$8, 140(%rsp)
	movl	144(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 140(%rsp)
	shll	$8, 144(%rsp)
	movl	148(%rsp), %r9d
	shrl	$24, %r9d
	orl 	%r9d, 144(%rsp)
	shll	$8, 148(%rsp)
	movzbl	6(%rdx), %r9d
	orl 	%r9d, 148(%rsp)
	movl	$0, 140(%rsp)
	andl	$4194303, 144(%rsp)
	movl	$0, %edx
	shll	$8, %edx
	movzbl	(%r8), %r9d
	orl 	%r9d, %edx
	shll	$8, %edx
	movzbl	1(%r8), %r9d
	orl 	%r9d, %edx
	andl	$511, %edx
	leaq	104(%rsp), %r9
	movl	140(%rsp), %r8d
	movl	%r8d, 4(%r9)
	movl	144(%rsp), %r8d
	movl	%r8d, 8(%r9)
	movl	148(%rsp), %r8d
	movl	%r8d, 12(%r9)
	leaq	104(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$3, 16(%r9)
	leaq	104(%rsp), %r9
	movl	%edx, 20(%r9)
	movq	%rax, %rbx
	leaq	24(%rdi), %r9
	movq	%rbx, 64(%rsp)
	movq	%rsi, 72(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%rcx, 56(%rsp)
	movl	%edx, 136(%rsp)
	leaq	104(%rsp), %rdi
	movq	%rcx, %rax
	leaq	-152(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	152(%rsp), %rsp
	movq	%r9, %rax
// declassify_mem 6120 [RAX]
	movq	64(%rsp), %rdx
	movq	72(%rsp), %rsi
	movq	80(%rsp), %rdi
	movq	56(%rsp), %rcx
	movl	136(%rsp), %r8d
	lfence
	movq	$0, %r9
	movq	%rdx, 56(%rsp)
	movq	%rsi, 80(%rsp)
	movq	%rdi, 72(%rsp)
	movl	%r8d, 136(%rsp)
	leaq	32(%rsp), %rdx
	leaq	104(%rsp), %rdi
	movq	%rdx, %r8
	movq	%rcx, %rdx
	leaq	-728(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	728(%rsp), %rsp
	movq	56(%rsp), %rdx
	movq	80(%rsp), %rsi
	movq	72(%rsp), %rdi
	movl	136(%rsp), %r8d
	lfence
	movq	$0, %rax
	leaq	6144(%rdi), %rcx
	movq	%rdi, 72(%rsp)
	leaq	32(%rsp), %rax
	leaq	140(%rsp), %rdi
	movq	%rdi, %r9
	leaq	-152(%rsp), %rsp
	call	.Lht_sign$1
.Lslh_sign_internal_$2:
	leaq	152(%rsp), %rsp
	movq	72(%rsp), %rdi
	lfence
	movq	$0, %rax
// declassify_mem 16224 [RDI]
	movq	$0, %rax
	ret
.Lslh_keygen_internal_$1:
	movq	%rsi, %rcx
	movq	%rax, %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	24(%rsi), %rcx
	leaq	24(%rax), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	48(%rsi), %rcx
	leaq	48(%rax), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	movq	%rdi, %rcx
	leaq	48(%rax), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	movq	%rsi, %rdx
	leaq	48(%rsi), %r9
	leaq	24(%rsp), %r10
	movq	$0, (%r10)
	movq	$0, 8(%r10)
	movq	$0, 16(%r10)
	movq	$0, 24(%r10)
	movl	$6, %r10d
	leaq	24(%rsp), %rax
	movl	%r10d, (%rax)
	movl	$0, %r8d
	movl	$9, %eax
	leaq	72(%rsi), %rcx
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rdi
	movl	%eax, %r10d
	movq	%r9, %rsi
	leaq	-24856(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	24856(%rsp), %rsp
	movq	%rcx, %rdx
	movq	8(%rsp), %rax
	movq	16(%rsp), %rdi
	lfence
	movq	$0, %rcx
	leaq	24(%rdi), %rcx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
// declassify_mem 48 [RDI]
	ret
.Lfors_pkfromsig$1:
	movq	%r8, 568(%rsp)
	leaq	664(%rsp), %r8
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lfors_pkfromsig$43
.Lfors_pkfromsig$44:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$43:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$44
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, (%r8)
	jmp 	.Lfors_pkfromsig$41
.Lfors_pkfromsig$42:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$41:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$42
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 4(%r8)
	jmp 	.Lfors_pkfromsig$39
.Lfors_pkfromsig$40:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$39:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$40
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 8(%r8)
	jmp 	.Lfors_pkfromsig$37
.Lfors_pkfromsig$38:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$37:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$38
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 12(%r8)
	jmp 	.Lfors_pkfromsig$35
.Lfors_pkfromsig$36:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$35:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$36
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 16(%r8)
	jmp 	.Lfors_pkfromsig$33
.Lfors_pkfromsig$34:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$33:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$34
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 20(%r8)
	jmp 	.Lfors_pkfromsig$31
.Lfors_pkfromsig$32:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$31:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$32
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 24(%r8)
	jmp 	.Lfors_pkfromsig$29
.Lfors_pkfromsig$30:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$29:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$30
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 28(%r8)
	jmp 	.Lfors_pkfromsig$27
.Lfors_pkfromsig$28:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$27:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$28
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 32(%r8)
	jmp 	.Lfors_pkfromsig$25
.Lfors_pkfromsig$26:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$25:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$26
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 36(%r8)
	jmp 	.Lfors_pkfromsig$23
.Lfors_pkfromsig$24:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$23:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$24
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 40(%r8)
	jmp 	.Lfors_pkfromsig$21
.Lfors_pkfromsig$22:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$21:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$22
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 44(%r8)
	jmp 	.Lfors_pkfromsig$19
.Lfors_pkfromsig$20:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$19:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$20
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 48(%r8)
	jmp 	.Lfors_pkfromsig$17
.Lfors_pkfromsig$18:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$17:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$18
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 52(%r8)
	jmp 	.Lfors_pkfromsig$15
.Lfors_pkfromsig$16:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$15:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$16
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 56(%r8)
	jmp 	.Lfors_pkfromsig$13
.Lfors_pkfromsig$14:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$13:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$14
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 60(%r8)
	jmp 	.Lfors_pkfromsig$11
.Lfors_pkfromsig$12:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_pkfromsig$11:
	cmpl	$14, %ecx
	jb  	.Lfors_pkfromsig$12
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 64(%r8)
	movq	$0, %rcx
	movq	$0, %rdx
	movq	$0, %r8
	jmp 	.Lfors_pkfromsig$3
.Lfors_pkfromsig$4:
	movq	%rdx, 576(%rsp)
	leaq	(%rax,%rcx), %rdx
	leaq	64(%rsp), %r9
	movb	(%rdx), %r10b
	movb	%r10b, (%r9)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%r9)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%r9)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%r9)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%r9)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%r9)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%r9)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%r9)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%r9)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%r9)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%r9)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%r9)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%r9)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%r9)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%r9)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%r9)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%r9)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%r9)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%r9)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%r9)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%r9)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%r9)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%r9)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r9)
	movl	$0, %edx
	movl	%edx, 24(%rdi)
	movl	%r8d, %edx
	shll	$14, %edx
	addl	664(%rsp,%r8,4), %edx
	lfence
	movq	$0, %r9
	movl	%edx, 28(%rdi)
	movq	%rsi, 584(%rsp)
	movq	%rdi, 592(%rsp)
	movq	%rax, 600(%rsp)
	movq	%r8, 608(%rsp)
	movq	%rcx, 616(%rsp)
	leaq	64(%rsp), %rcx
	movq	%rdi, %rax
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	40(%rsp), %rsp
	movq	584(%rsp), %rsi
	movq	592(%rsp), %rdi
	movq	600(%rsp), %rax
	movq	608(%rsp), %r8
	movq	616(%rsp), %rcx
	lfence
	movq	$0, %rdx
	addq	$24, %rcx
	movl	664(%rsp,%r8,4), %r9d
	lfence
	movq	$0, %rdx
	movl	$0, %r10d
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movl	%r10d, %edx
	incl	%edx
	movl	%edx, 24(%rdi)
	movl	%r9d, %edx
	andl	$1, %edx
	movl	%r10d, 656(%rsp)
	movl	%r9d, 660(%rsp)
	cmpl	$0, %edx
	je  	.Lfors_pkfromsig$8
	movl	28(%rdi), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	544(%rsp), %r9
	leaq	(%rax,%rcx), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%r9)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%r9)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%r9)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%r9)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%r9)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%r9)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%r9)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%r9)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%r9)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%r9)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%r9)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%r9)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%r9)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%r9)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%r9)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%r9)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%r9)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%r9)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%r9)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%r9)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%r9)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%r9)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%r9)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r9)
	leaq	512(%rsp), %r9
	leaq	64(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%r9)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%r9)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%r9)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%r9)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%r9)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%r9)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%r9)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%r9)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%r9)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%r9)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%r9)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%r9)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%r9)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%r9)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%r9)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%r9)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%r9)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%r9)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%r9)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%r9)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%r9)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%r9)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%r9)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r9)
	jmp 	.Lfors_pkfromsig$9
.Lfors_pkfromsig$8:
	movl	28(%rdi), %edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	544(%rsp), %r9
	leaq	64(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%r9)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%r9)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%r9)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%r9)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%r9)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%r9)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%r9)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%r9)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%r9)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%r9)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%r9)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%r9)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%r9)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%r9)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%r9)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%r9)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%r9)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%r9)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%r9)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%r9)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%r9)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%r9)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%r9)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r9)
	leaq	512(%rsp), %r9
	leaq	(%rax,%rcx), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%r9)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%r9)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%r9)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%r9)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%r9)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%r9)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%r9)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%r9)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%r9)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%r9)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%r9)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%r9)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%r9)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%r9)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%r9)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%r9)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%r9)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%r9)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%r9)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%r9)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%r9)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%r9)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%r9)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r9)
.Lfors_pkfromsig$9:
	movq	%rsi, 616(%rsp)
	movq	%rdi, 608(%rsp)
	movq	%rax, 600(%rsp)
	movq	%r8, 592(%rsp)
	movq	%rcx, 584(%rsp)
	leaq	32(%rsp), %rcx
	leaq	544(%rsp), %rax
	leaq	512(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	40(%rsp), %rsp
	movq	616(%rsp), %rsi
	movq	608(%rsp), %rdi
	movq	600(%rsp), %rax
	movq	592(%rsp), %r8
	movq	584(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	64(%rsp), %r9
	leaq	32(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%r9)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%r9)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%r9)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%r9)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%r9)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%r9)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%r9)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%r9)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%r9)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%r9)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%r9)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%r9)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%r9)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%r9)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%r9)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%r9)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%r9)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%r9)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%r9)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%r9)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%r9)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%r9)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%r9)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r9)
	movl	656(%rsp), %r10d
	movl	660(%rsp), %r9d
	lfence
	movq	$0, %rdx
	shrl	$1, %r9d
	addq	$24, %rcx
	incl	%r10d
.Lfors_pkfromsig$5:
	cmpl	$14, %r10d
	jb  	.Lfors_pkfromsig$6
	movq	576(%rsp), %rdx
	lfence
	movq	$0, %r9
	leaq	96(%rsp,%rdx), %r9
	leaq	64(%rsp), %r10
	movb	(%r10), %r11b
	movb	%r11b, (%r9)
	movb	1(%r10), %r11b
	movb	%r11b, 1(%r9)
	movb	2(%r10), %r11b
	movb	%r11b, 2(%r9)
	movb	3(%r10), %r11b
	movb	%r11b, 3(%r9)
	movb	4(%r10), %r11b
	movb	%r11b, 4(%r9)
	movb	5(%r10), %r11b
	movb	%r11b, 5(%r9)
	movb	6(%r10), %r11b
	movb	%r11b, 6(%r9)
	movb	7(%r10), %r11b
	movb	%r11b, 7(%r9)
	movb	8(%r10), %r11b
	movb	%r11b, 8(%r9)
	movb	9(%r10), %r11b
	movb	%r11b, 9(%r9)
	movb	10(%r10), %r11b
	movb	%r11b, 10(%r9)
	movb	11(%r10), %r11b
	movb	%r11b, 11(%r9)
	movb	12(%r10), %r11b
	movb	%r11b, 12(%r9)
	movb	13(%r10), %r11b
	movb	%r11b, 13(%r9)
	movb	14(%r10), %r11b
	movb	%r11b, 14(%r9)
	movb	15(%r10), %r11b
	movb	%r11b, 15(%r9)
	movb	16(%r10), %r11b
	movb	%r11b, 16(%r9)
	movb	17(%r10), %r11b
	movb	%r11b, 17(%r9)
	movb	18(%r10), %r11b
	movb	%r11b, 18(%r9)
	movb	19(%r10), %r11b
	movb	%r11b, 19(%r9)
	movb	20(%r10), %r11b
	movb	%r11b, 20(%r9)
	movb	21(%r10), %r11b
	movb	%r11b, 21(%r9)
	movb	22(%r10), %r11b
	movb	%r11b, 22(%r9)
	movb	23(%r10), %r10b
	movb	%r10b, 23(%r9)
	addq	$24, %rdx
	incq	%r8
.Lfors_pkfromsig$3:
	cmpq	$17, %r8
	jb  	.Lfors_pkfromsig$4
	leaq	624(%rsp), %rax
	movq	(%rdi), %rdx
	movq	%rdx, (%rax)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rdi), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rdi), %rdx
	movq	%rdx, 24(%rax)
	leaq	624(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$4, 16(%rax)
	movl	20(%rdi), %edx
	leaq	624(%rsp), %rax
	movl	%edx, 20(%rax)
	movq	568(%rsp), %rcx
	lfence
	movq	$0, %rax
	leaq	624(%rsp), %rax
	leaq	96(%rsp), %rdx
	movq	%rax, %rdi
	movq	%rdx, %rax
	leaq	-40(%rsp), %rsp
	call	.LT_k$1
.Lfors_pkfromsig$2:
	leaq	40(%rsp), %rsp
	ret
.Lfors_sign$1:
	leaq	64(%rsp), %r8
	movq	$0, %rdx
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$41
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, (%r8)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$39
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 4(%r8)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$37
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 8(%r8)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$35
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 12(%r8)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$33
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 16(%r8)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$31
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 20(%r8)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$29
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 24(%r8)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$27
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 28(%r8)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$25
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 32(%r8)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$23
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 36(%r8)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$21
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 40(%r8)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$19
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 44(%r8)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$17
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 48(%r8)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$15
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 52(%r8)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$13
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 56(%r8)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$11
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 60(%r8)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %r11d
	orl 	%r11d, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$9
	movl	%r10d, %r11d
	addl	$-14, %ecx
	shrq	%cl, %r11
	andq	$16383, %r11
	movl	%r11d, 64(%r8)
	movq	$0, %rax
	movq	$0, %r8
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%r8d, %edx
	shll	$14, %edx
	addl	64(%rsp,%r8,4), %edx
	lfence
	movq	$0, %rcx
	leaq	(%r9,%rax), %rcx
	movq	%rbx, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%r9, 32(%rsp)
	movq	%r8, 40(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rcx, %rax
	movl	%edx, %r10d
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rdi
	movq	32(%rsp), %r9
	movq	40(%rsp), %r8
	movq	48(%rsp), %rax
	lfence
	movq	$0, %rdx
	addq	$24, %rax
	movl	64(%rsp,%r8,4), %r10d
	lfence
	movq	$0, %rdx
	xorl	$1, %r10d
	movl	$0, %edx
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%rbx, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%r8, 32(%rsp)
	movl	%edx, 56(%rsp)
	movq	%rax, 24(%rsp)
	movl	%r10d, 60(%rsp)
	movl	$14, %ecx
	subl	%edx, %ecx
	shlq	%cl, %r8
	addl	%r10d, %r8d
	leaq	(%r9,%rax), %rcx
	movq	%r9, 16(%rsp)
	leaq	-786712(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	786712(%rsp), %rsp
	movq	16(%rsp), %r9
	lfence
	movq	$0, %rax
	movq	48(%rsp), %rbx
	movq	40(%rsp), %rsi
	movq	32(%rsp), %r8
	movl	56(%rsp), %edx
	movq	24(%rsp), %rax
	movl	60(%rsp), %r10d
	lfence
	movq	$0, %rcx
	shrl	$1, %r10d
	xorl	$1, %r10d
	addq	$24, %rax
	incl	%edx
.Lfors_sign$4:
	cmpl	$14, %edx
	jb  	.Lfors_sign$5
	incq	%r8
.Lfors_sign$2:
	cmpq	$17, %r8
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rcx, 786504(%rsp)
	movq	$0, %rax
	movl	$0, %r9d
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%edx, 786640(%rsp)
	movl	%edx, %ecx
	subl	%r9d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r10d
	movl	%edx, %r11d
	imull	%r8d, %r10d
	addl	%r10d, %r11d
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%rbx, 786512(%rsp)
	movl	%r11d, 786644(%rsp)
	cmpl	$0, %r9d
	je  	.Lfors_node$6
	movl	%r10d, %eax
	imull	$2, %eax, %eax
	movl	%r9d, %edx
	decl	%edx
	movl	$15, %ecx
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
	imulq	$24, %r12, %rbx
	movl	%r9d, 24(%rdi)
	movl	%r10d, 28(%rdi)
	movl	$15, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbp
	subl	%r9d, %ecx
	movq	$1, %r12
	shlq	%cl, %r12
	subq	%r12, %rbp
	shrq	$1, %r12
	movl	%r10d, %eax
	xorl	%edx, %edx
	divq	%r12
	addq	%rdx, %rbp
	imulq	$24, %rbp, %rax
	subl	%r10d, %r11d
	cmpl	$4, %r11d
	jnb 	.Lfors_node$13
	movq	%rbx, %rcx
	addq	$24, %rcx
	leaq	786480(%rsp), %rdx
	leaq	32(%rsp,%rbx), %r11
	movb	(%r11), %bl
	movb	%bl, (%rdx)
	movb	1(%r11), %bl
	movb	%bl, 1(%rdx)
	movb	2(%r11), %bl
	movb	%bl, 2(%rdx)
	movb	3(%r11), %bl
	movb	%bl, 3(%rdx)
	movb	4(%r11), %bl
	movb	%bl, 4(%rdx)
	movb	5(%r11), %bl
	movb	%bl, 5(%rdx)
	movb	6(%r11), %bl
	movb	%bl, 6(%rdx)
	movb	7(%r11), %bl
	movb	%bl, 7(%rdx)
	movb	8(%r11), %bl
	movb	%bl, 8(%rdx)
	movb	9(%r11), %bl
	movb	%bl, 9(%rdx)
	movb	10(%r11), %bl
	movb	%bl, 10(%rdx)
	movb	11(%r11), %bl
	movb	%bl, 11(%rdx)
	movb	12(%r11), %bl
	movb	%bl, 12(%rdx)
	movb	13(%r11), %bl
	movb	%bl, 13(%rdx)
	movb	14(%r11), %bl
	movb	%bl, 14(%rdx)
	movb	15(%r11), %bl
	movb	%bl, 15(%rdx)
	movb	16(%r11), %bl
	movb	%bl, 16(%rdx)
	movb	17(%r11), %bl
	movb	%bl, 17(%rdx)
	movb	18(%r11), %bl
	movb	%bl, 18(%rdx)
	movb	19(%r11), %bl
	movb	%bl, 19(%rdx)
	movb	20(%r11), %bl
	movb	%bl, 20(%rdx)
	movb	21(%r11), %bl
	movb	%bl, 21(%rdx)
	movb	22(%r11), %bl
	movb	%bl, 22(%rdx)
	movb	23(%r11), %r11b
	movb	%r11b, 23(%rdx)
	leaq	786448(%rsp), %rdx
	leaq	32(%rsp,%rcx), %r11
	movb	(%r11), %cl
	movb	%cl, (%rdx)
	movb	1(%r11), %cl
	movb	%cl, 1(%rdx)
	movb	2(%r11), %cl
	movb	%cl, 2(%rdx)
	movb	3(%r11), %cl
	movb	%cl, 3(%rdx)
	movb	4(%r11), %cl
	movb	%cl, 4(%rdx)
	movb	5(%r11), %cl
	movb	%cl, 5(%rdx)
	movb	6(%r11), %cl
	movb	%cl, 6(%rdx)
	movb	7(%r11), %cl
	movb	%cl, 7(%rdx)
	movb	8(%r11), %cl
	movb	%cl, 8(%rdx)
	movb	9(%r11), %cl
	movb	%cl, 9(%rdx)
	movb	10(%r11), %cl
	movb	%cl, 10(%rdx)
	movb	11(%r11), %cl
	movb	%cl, 11(%rdx)
	movb	12(%r11), %cl
	movb	%cl, 12(%rdx)
	movb	13(%r11), %cl
	movb	%cl, 13(%rdx)
	movb	14(%r11), %cl
	movb	%cl, 14(%rdx)
	movb	15(%r11), %cl
	movb	%cl, 15(%rdx)
	movb	16(%r11), %cl
	movb	%cl, 16(%rdx)
	movb	17(%r11), %cl
	movb	%cl, 17(%rdx)
	movb	18(%r11), %cl
	movb	%cl, 18(%rdx)
	movb	19(%r11), %cl
	movb	%cl, 19(%rdx)
	movb	20(%r11), %cl
	movb	%cl, 20(%rdx)
	movb	21(%r11), %cl
	movb	%cl, 21(%rdx)
	movb	22(%r11), %cl
	movb	%cl, 22(%rdx)
	movb	23(%r11), %cl
	movb	%cl, 23(%rdx)
	movq	%rsi, 786520(%rsp)
	movq	%rdi, 786528(%rsp)
	movl	%r8d, 786648(%rsp)
	movl	%r9d, 786652(%rsp)
	movl	%r10d, 786656(%rsp)
	movq	%rax, 786536(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	786480(%rsp), %rax
	leaq	786448(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_node$16:
	leaq	40(%rsp), %rsp
	movq	786520(%rsp), %rsi
	movq	786528(%rsp), %rdi
	movl	786648(%rsp), %r8d
	movl	786652(%rsp), %r9d
	movl	786656(%rsp), %r10d
	movq	786536(%rsp), %rax
	lfence
	movq	$0, %rcx
	jmp 	.Lfors_node$7
.Lfors_node$13:
	movl	%r9d, 786660(%rsp)
	movl	%r10d, %edx
	movl	%edx, 786664(%rsp)
	movl	%r9d, 786668(%rsp)
	movl	%r10d, %edx
	incl	%edx
	movl	%edx, 786672(%rsp)
	movl	%r9d, 786676(%rsp)
	movl	%r10d, %edx
	addl	$2, %edx
	movl	%edx, 786680(%rsp)
	movl	%r9d, 786684(%rsp)
	movl	%r10d, %edx
	addl	$3, %edx
	movl	%edx, 786688(%rsp)
	movq	%rsi, 786536(%rsp)
	movq	%rdi, 786528(%rsp)
	movl	%r8d, 786656(%rsp)
	movl	%r9d, 786652(%rsp)
	movl	%r10d, 786648(%rsp)
	movq	%rax, 786520(%rsp)
	leaq	32(%rsp,%rbx), %rdx
	leaq	786544(%rsp), %rcx
	leaq	786660(%rsp), %rax
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_2n__thash_x4$1
.Lfors_node$15:
	leaq	824(%rsp), %rsp
	movq	786536(%rsp), %rsi
	movq	786528(%rsp), %rdi
	movl	786656(%rsp), %r8d
	movl	786652(%rsp), %r9d
	movl	786648(%rsp), %r10d
	movq	786520(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	32(%rsp,%rax), %rcx
	leaq	786544(%rsp), %rdx
	movb	(%rdx), %r11b
	movb	%r11b, (%rcx)
	movb	1(%rdx), %r11b
	movb	%r11b, 1(%rcx)
	movb	2(%rdx), %r11b
	movb	%r11b, 2(%rcx)
	movb	3(%rdx), %r11b
	movb	%r11b, 3(%rcx)
	movb	4(%rdx), %r11b
	movb	%r11b, 4(%rcx)
	movb	5(%rdx), %r11b
	movb	%r11b, 5(%rcx)
	movb	6(%rdx), %r11b
	movb	%r11b, 6(%rcx)
	movb	7(%rdx), %r11b
	movb	%r11b, 7(%rcx)
	movb	8(%rdx), %r11b
	movb	%r11b, 8(%rcx)
	movb	9(%rdx), %r11b
	movb	%r11b, 9(%rcx)
	movb	10(%rdx), %r11b
	movb	%r11b, 10(%rcx)
	movb	11(%rdx), %r11b
	movb	%r11b, 11(%rcx)
	movb	12(%rdx), %r11b
	movb	%r11b, 12(%rcx)
	movb	13(%rdx), %r11b
	movb	%r11b, 13(%rcx)
	movb	14(%rdx), %r11b
	movb	%r11b, 14(%rcx)
	movb	15(%rdx), %r11b
	movb	%r11b, 15(%rcx)
	movb	16(%rdx), %r11b
	movb	%r11b, 16(%rcx)
	movb	17(%rdx), %r11b
	movb	%r11b, 17(%rcx)
	movb	18(%rdx), %r11b
	movb	%r11b, 18(%rcx)
	movb	19(%rdx), %r11b
	movb	%r11b, 19(%rcx)
	movb	20(%rdx), %r11b
	movb	%r11b, 20(%rcx)
	movb	21(%rdx), %r11b
	movb	%r11b, 21(%rcx)
	movb	22(%rdx), %r11b
	movb	%r11b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	56(%rsp,%rax), %rcx
	leaq	786568(%rsp), %rdx
	movb	(%rdx), %r11b
	movb	%r11b, (%rcx)
	movb	1(%rdx), %r11b
	movb	%r11b, 1(%rcx)
	movb	2(%rdx), %r11b
	movb	%r11b, 2(%rcx)
	movb	3(%rdx), %r11b
	movb	%r11b, 3(%rcx)
	movb	4(%rdx), %r11b
	movb	%r11b, 4(%rcx)
	movb	5(%rdx), %r11b
	movb	%r11b, 5(%rcx)
	movb	6(%rdx), %r11b
	movb	%r11b, 6(%rcx)
	movb	7(%rdx), %r11b
	movb	%r11b, 7(%rcx)
	movb	8(%rdx), %r11b
	movb	%r11b, 8(%rcx)
	movb	9(%rdx), %r11b
	movb	%r11b, 9(%rcx)
	movb	10(%rdx), %r11b
	movb	%r11b, 10(%rcx)
	movb	11(%rdx), %r11b
	movb	%r11b, 11(%rcx)
	movb	12(%rdx), %r11b
	movb	%r11b, 12(%rcx)
	movb	13(%rdx), %r11b
	movb	%r11b, 13(%rcx)
	movb	14(%rdx), %r11b
	movb	%r11b, 14(%rcx)
	movb	15(%rdx), %r11b
	movb	%r11b, 15(%rcx)
	movb	16(%rdx), %r11b
	movb	%r11b, 16(%rcx)
	movb	17(%rdx), %r11b
	movb	%r11b, 17(%rcx)
	movb	18(%rdx), %r11b
	movb	%r11b, 18(%rcx)
	movb	19(%rdx), %r11b
	movb	%r11b, 19(%rcx)
	movb	20(%rdx), %r11b
	movb	%r11b, 20(%rcx)
	movb	21(%rdx), %r11b
	movb	%r11b, 21(%rcx)
	movb	22(%rdx), %r11b
	movb	%r11b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	80(%rsp,%rax), %rcx
	leaq	786592(%rsp), %rdx
	movb	(%rdx), %r11b
	movb	%r11b, (%rcx)
	movb	1(%rdx), %r11b
	movb	%r11b, 1(%rcx)
	movb	2(%rdx), %r11b
	movb	%r11b, 2(%rcx)
	movb	3(%rdx), %r11b
	movb	%r11b, 3(%rcx)
	movb	4(%rdx), %r11b
	movb	%r11b, 4(%rcx)
	movb	5(%rdx), %r11b
	movb	%r11b, 5(%rcx)
	movb	6(%rdx), %r11b
	movb	%r11b, 6(%rcx)
	movb	7(%rdx), %r11b
	movb	%r11b, 7(%rcx)
	movb	8(%rdx), %r11b
	movb	%r11b, 8(%rcx)
	movb	9(%rdx), %r11b
	movb	%r11b, 9(%rcx)
	movb	10(%rdx), %r11b
	movb	%r11b, 10(%rcx)
	movb	11(%rdx), %r11b
	movb	%r11b, 11(%rcx)
	movb	12(%rdx), %r11b
	movb	%r11b, 12(%rcx)
	movb	13(%rdx), %r11b
	movb	%r11b, 13(%rcx)
	movb	14(%rdx), %r11b
	movb	%r11b, 14(%rcx)
	movb	15(%rdx), %r11b
	movb	%r11b, 15(%rcx)
	movb	16(%rdx), %r11b
	movb	%r11b, 16(%rcx)
	movb	17(%rdx), %r11b
	movb	%r11b, 17(%rcx)
	movb	18(%rdx), %r11b
	movb	%r11b, 18(%rcx)
	movb	19(%rdx), %r11b
	movb	%r11b, 19(%rcx)
	movb	20(%rdx), %r11b
	movb	%r11b, 20(%rcx)
	movb	21(%rdx), %r11b
	movb	%r11b, 21(%rcx)
	movb	22(%rdx), %r11b
	movb	%r11b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	104(%rsp,%rax), %rcx
	leaq	786616(%rsp), %rdx
	movb	(%rdx), %r11b
	movb	%r11b, (%rcx)
	movb	1(%rdx), %r11b
	movb	%r11b, 1(%rcx)
	movb	2(%rdx), %r11b
	movb	%r11b, 2(%rcx)
	movb	3(%rdx), %r11b
	movb	%r11b, 3(%rcx)
	movb	4(%rdx), %r11b
	movb	%r11b, 4(%rcx)
	movb	5(%rdx), %r11b
	movb	%r11b, 5(%rcx)
	movb	6(%rdx), %r11b
	movb	%r11b, 6(%rcx)
	movb	7(%rdx), %r11b
	movb	%r11b, 7(%rcx)
	movb	8(%rdx), %r11b
	movb	%r11b, 8(%rcx)
	movb	9(%rdx), %r11b
	movb	%r11b, 9(%rcx)
	movb	10(%rdx), %r11b
	movb	%r11b, 10(%rcx)
	movb	11(%rdx), %r11b
	movb	%r11b, 11(%rcx)
	movb	12(%rdx), %r11b
	movb	%r11b, 12(%rcx)
	movb	13(%rdx), %r11b
	movb	%r11b, 13(%rcx)
	movb	14(%rdx), %r11b
	movb	%r11b, 14(%rcx)
	movb	15(%rdx), %r11b
	movb	%r11b, 15(%rcx)
	movb	16(%rdx), %r11b
	movb	%r11b, 16(%rcx)
	movb	17(%rdx), %r11b
	movb	%r11b, 17(%rcx)
	movb	18(%rdx), %r11b
	movb	%r11b, 18(%rcx)
	movb	19(%rdx), %r11b
	movb	%r11b, 19(%rcx)
	movb	20(%rdx), %r11b
	movb	%r11b, 20(%rcx)
	movb	21(%rdx), %r11b
	movb	%r11b, 21(%rcx)
	movb	22(%rdx), %r11b
	movb	%r11b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	addl	$3, %r10d
.Lfors_node$14:
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%r9d, 24(%rdi)
	movl	%r10d, 28(%rdi)
	movl	$15, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbp
	subl	%r9d, %ecx
	movq	$1, %r12
	shlq	%cl, %r12
	subq	%r12, %rbp
	shrq	$1, %r12
	movl	%r10d, %eax
	xorl	%edx, %edx
	divq	%r12
	addq	%rdx, %rbp
	imulq	$24, %rbp, %rax
	subl	%r10d, %r11d
	cmpl	$4, %r11d
	jnb 	.Lfors_node$8
	movq	%rsi, 786536(%rsp)
	movq	%rdi, 786528(%rsp)
	movl	%r8d, 786656(%rsp)
	movl	%r9d, 786652(%rsp)
	movl	%r10d, 786648(%rsp)
	movq	%rax, 786520(%rsp)
	leaq	32(%rsp,%rax), %rax
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$12:
	leaq	40(%rsp), %rsp
	movq	786536(%rsp), %rsi
	movq	786528(%rsp), %rax
	movl	786656(%rsp), %r8d
	movl	786652(%rsp), %r10d
	movl	786648(%rsp), %ecx
	movq	786520(%rsp), %rdx
	lfence
	movq	$0, %rdi
	movq	%rsi, 786520(%rsp)
	movq	%rax, 786528(%rsp)
	movl	%r8d, 786648(%rsp)
	movl	%r10d, 786652(%rsp)
	movl	%ecx, 786656(%rsp)
	movq	%rdx, 786536(%rsp)
	leaq	32(%rsp,%rdx), %rcx
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_node$11:
	leaq	40(%rsp), %rsp
	movq	786520(%rsp), %rsi
	movq	786528(%rsp), %rdi
	movl	786648(%rsp), %r8d
	movl	786652(%rsp), %r9d
	movl	786656(%rsp), %r10d
	movq	786536(%rsp), %rax
	lfence
	movq	$0, %rcx
	jmp 	.Lfors_node$7
.Lfors_node$8:
	movq	%rsi, 786520(%rsp)
	movq	%rdi, 786528(%rsp)
	movl	%r8d, 786648(%rsp)
	movl	%r9d, 786652(%rsp)
	movl	%r10d, 786656(%rsp)
	movq	%rax, 786536(%rsp)
	leaq	32(%rsp,%rax), %rax
	movq	%rax, %rcx
	movl	%r10d, %eax
	leaq	-280(%rsp), %rsp
	call	.Lfors_leaves_x4$1
.Lfors_node$10:
	leaq	280(%rsp), %rsp
	movq	786520(%rsp), %rsi
	movq	786528(%rsp), %rdi
	movl	786648(%rsp), %r8d
	movl	786652(%rsp), %r9d
	movl	786656(%rsp), %r10d
	movq	786536(%rsp), %rax
	lfence
	movq	$0, %rcx
	addl	$3, %r10d
.Lfors_node$9:
.Lfors_node$7:
	movq	786512(%rsp), %rbx
	movl	786644(%rsp), %r11d
	lfence
	movq	$0, %rcx
	incl	%r10d
.Lfors_node$4:
	cmpl	%r11d, %r10d
	jb  	.Lfors_node$5
	movl	786640(%rsp), %edx
	lfence
	movq	$0, %rcx
	incl	%r9d
.Lfors_node$2:
	cmpl	%edx, %r9d
	jbe 	.Lfors_node$3
	movq	786504(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp,%rax), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	ret
.Lfors_leaves_x4$1:
	movq	%rcx, %mm0
	leaq	56(%rsp), %rcx
	movb	(%rbx), %dl
	movb	%dl, (%rcx)
	movb	1(%rbx), %dl
	movb	%dl, 1(%rcx)
	movb	2(%rbx), %dl
	movb	%dl, 2(%rcx)
	movb	3(%rbx), %dl
	movb	%dl, 3(%rcx)
	movb	4(%rbx), %dl
	movb	%dl, 4(%rcx)
	movb	5(%rbx), %dl
	movb	%dl, 5(%rcx)
	movb	6(%rbx), %dl
	movb	%dl, 6(%rcx)
	movb	7(%rbx), %dl
	movb	%dl, 7(%rcx)
	movb	8(%rbx), %dl
	movb	%dl, 8(%rcx)
	movb	9(%rbx), %dl
	movb	%dl, 9(%rcx)
	movb	10(%rbx), %dl
	movb	%dl, 10(%rcx)
	movb	11(%rbx), %dl
	movb	%dl, 11(%rcx)
	movb	12(%rbx), %dl
	movb	%dl, 12(%rcx)
	movb	13(%rbx), %dl
	movb	%dl, 13(%rcx)
	movb	14(%rbx), %dl
	movb	%dl, 14(%rcx)
	movb	15(%rbx), %dl
	movb	%dl, 15(%rcx)
	movb	16(%rbx), %dl
	movb	%dl, 16(%rcx)
	movb	17(%rbx), %dl
	movb	%dl, 17(%rcx)
	movb	18(%rbx), %dl
	movb	%dl, 18(%rcx)
	movb	19(%rbx), %dl
	movb	%dl, 19(%rcx)
	movb	20(%rbx), %dl
	movb	%dl, 20(%rcx)
	movb	21(%rbx), %dl
	movb	%dl, 21(%rcx)
	movb	22(%rbx), %dl
	movb	%dl, 22(%rcx)
	movb	23(%rbx), %dl
	movb	%dl, 23(%rcx)
	leaq	80(%rsp), %rcx
	movb	(%rbx), %dl
	movb	%dl, (%rcx)
	movb	1(%rbx), %dl
	movb	%dl, 1(%rcx)
	movb	2(%rbx), %dl
	movb	%dl, 2(%rcx)
	movb	3(%rbx), %dl
	movb	%dl, 3(%rcx)
	movb	4(%rbx), %dl
	movb	%dl, 4(%rcx)
	movb	5(%rbx), %dl
	movb	%dl, 5(%rcx)
	movb	6(%rbx), %dl
	movb	%dl, 6(%rcx)
	movb	7(%rbx), %dl
	movb	%dl, 7(%rcx)
	movb	8(%rbx), %dl
	movb	%dl, 8(%rcx)
	movb	9(%rbx), %dl
	movb	%dl, 9(%rcx)
	movb	10(%rbx), %dl
	movb	%dl, 10(%rcx)
	movb	11(%rbx), %dl
	movb	%dl, 11(%rcx)
	movb	12(%rbx), %dl
	movb	%dl, 12(%rcx)
	movb	13(%rbx), %dl
	movb	%dl, 13(%rcx)
	movb	14(%rbx), %dl
	movb	%dl, 14(%rcx)
	movb	15(%rbx), %dl
	movb	%dl, 15(%rcx)
	movb	16(%rbx), %dl
	movb	%dl, 16(%rcx)
	movb	17(%rbx), %dl
	movb	%dl, 17(%rcx)
	movb	18(%rbx), %dl
	movb	%dl, 18(%rcx)
	movb	19(%rbx), %dl
	movb	%dl, 19(%rcx)
	movb	20(%rbx), %dl
	movb	%dl, 20(%rcx)
	movb	21(%rbx), %dl
	movb	%dl, 21(%rcx)
	movb	22(%rbx), %dl
	movb	%dl, 22(%rcx)
	movb	23(%rbx), %dl
	movb	%dl, 23(%rcx)
	leaq	104(%rsp), %rcx
	movb	(%rbx), %dl
	movb	%dl, (%rcx)
	movb	1(%rbx), %dl
	movb	%dl, 1(%rcx)
	movb	2(%rbx), %dl
	movb	%dl, 2(%rcx)
	movb	3(%rbx), %dl
	movb	%dl, 3(%rcx)
	movb	4(%rbx), %dl
	movb	%dl, 4(%rcx)
	movb	5(%rbx), %dl
	movb	%dl, 5(%rcx)
	movb	6(%rbx), %dl
	movb	%dl, 6(%rcx)
	movb	7(%rbx), %dl
	movb	%dl, 7(%rcx)
	movb	8(%rbx), %dl
	movb	%dl, 8(%rcx)
	movb	9(%rbx), %dl
	movb	%dl, 9(%rcx)
	movb	10(%rbx), %dl
	movb	%dl, 10(%rcx)
	movb	11(%rbx), %dl
	movb	%dl, 11(%rcx)
	movb	12(%rbx), %dl
	movb	%dl, 12(%rcx)
	movb	13(%rbx), %dl
	movb	%dl, 13(%rcx)
	movb	14(%rbx), %dl
	movb	%dl, 14(%rcx)
	movb	15(%rbx), %dl
	movb	%dl, 15(%rcx)
	movb	16(%rbx), %dl
	movb	%dl, 16(%rcx)
	movb	17(%rbx), %dl
	movb	%dl, 17(%rcx)
	movb	18(%rbx), %dl
	movb	%dl, 18(%rcx)
	movb	19(%rbx), %dl
	movb	%dl, 19(%rcx)
	movb	20(%rbx), %dl
	movb	%dl, 20(%rcx)
	movb	21(%rbx), %dl
	movb	%dl, 21(%rcx)
	movb	22(%rbx), %dl
	movb	%dl, 22(%rcx)
	movb	23(%rbx), %dl
	movb	%dl, 23(%rcx)
	leaq	128(%rsp), %rcx
	movb	(%rbx), %dl
	movb	%dl, (%rcx)
	movb	1(%rbx), %dl
	movb	%dl, 1(%rcx)
	movb	2(%rbx), %dl
	movb	%dl, 2(%rcx)
	movb	3(%rbx), %dl
	movb	%dl, 3(%rcx)
	movb	4(%rbx), %dl
	movb	%dl, 4(%rcx)
	movb	5(%rbx), %dl
	movb	%dl, 5(%rcx)
	movb	6(%rbx), %dl
	movb	%dl, 6(%rcx)
	movb	7(%rbx), %dl
	movb	%dl, 7(%rcx)
	movb	8(%rbx), %dl
	movb	%dl, 8(%rcx)
	movb	9(%rbx), %dl
	movb	%dl, 9(%rcx)
	movb	10(%rbx), %dl
	movb	%dl, 10(%rcx)
	movb	11(%rbx), %dl
	movb	%dl, 11(%rcx)
	movb	12(%rbx), %dl
	movb	%dl, 12(%rcx)
	movb	13(%rbx), %dl
	movb	%dl, 13(%rcx)
	movb	14(%rbx), %dl
	movb	%dl, 14(%rcx)
	movb	15(%rbx), %dl
	movb	%dl, 15(%rcx)
	movb	16(%rbx), %dl
	movb	%dl, 16(%rcx)
	movb	17(%rbx), %dl
	movb	%dl, 17(%rcx)
	movb	18(%rbx), %dl
	movb	%dl, 18(%rcx)
	movb	19(%rbx), %dl
	movb	%dl, 19(%rcx)
	movb	20(%rbx), %dl
	movb	%dl, 20(%rcx)
	movb	21(%rbx), %dl
	movb	%dl, 21(%rcx)
	movb	22(%rbx), %dl
	movb	%dl, 22(%rcx)
	movb	23(%rbx), %dl
	movb	%dl, 23(%rcx)
	movl	$0, %ecx
	movl	%ecx, 248(%rsp)
	movl	%eax, 252(%rsp)
	incl	%eax
	movl	%ecx, 256(%rsp)
	movl	%eax, 260(%rsp)
	incl	%eax
	movl	%ecx, 264(%rsp)
	movl	%eax, 268(%rsp)
	incl	%eax
	movl	%ecx, 272(%rsp)
	movl	%eax, 276(%rsp)
	leaq	24(%rsp), %rax
	movq	(%rdi), %rcx
	movq	%rcx, (%rax)
	movq	8(%rdi), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%rdi), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%rdi), %rcx
	movq	%rcx, 24(%rax)
	leaq	24(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$6, 16(%rax)
	movl	20(%rdi), %edx
	leaq	24(%rsp), %rax
	movl	%edx, 20(%rax)
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	152(%rsp), %rdi
	leaq	56(%rsp), %rdx
	leaq	24(%rsp), %r9
	leaq	248(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lfors_leaves_x4$3:
	leaq	824(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	16(%rsp), %r9
	movq	%mm0, %rdi
	lfence
	movq	$0, %rax
	leaq	152(%rsp), %rdx
	leaq	248(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lfors_leaves_x4$2:
	leaq	824(%rsp), %rsp
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
	leaq	8(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$6, 16(%r9)
	movl	20(%rdi), %edx
	leaq	8(%rsp), %rdi
	movl	%edx, 20(%rdi)
	leaq	8(%rsp), %rdi
	movl	%r10d, 28(%rdi)
	leaq	8(%rsp), %rdi
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	40(%rsp), %rsp
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%rdi), %r8d
	movl	%r8d, 76(%rsp)
	movl	4(%rdi), %r8d
	movl	%r8d, 80(%rsp)
	movl	8(%rdi), %r8d
	movl	%r8d, 84(%rsp)
	leaq	40(%rsp), %rdi
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	leaq	40(%rsp), %rdi
	movl	76(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	80(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	84(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	movq	%rcx, %rdi
	movq	%rsi, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	88(%rsp), %rcx
	leaq	40(%rsp), %r9
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	$1440, %rax
	movl	$1, %r10d
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%r10d, 72(%rsp)
	movq	%rax, 24(%rsp)
	leaq	76(%rsp), %rdi
	movl	8(%rdi), %edx
	andl	$511, %edx
	shrl	$9, 8(%rdi)
	movl	4(%rdi), %r9d
	shll	$23, %r9d
	orl 	%r9d, 8(%rdi)
	shrl	$9, 4(%rdi)
	movl	(%rdi), %r9d
	shll	$23, %r9d
	orl 	%r9d, 4(%rdi)
	shrl	$9, (%rdi)
	leaq	40(%rsp), %rdi
	movl	%r10d, (%rdi)
	leaq	40(%rsp), %rdi
	movl	76(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	80(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	84(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	leaq	112(%rsp), %rdi
	leaq	88(%rsp), %r9
	movb	(%r9), %r8b
	movb	%r8b, (%rdi)
	movb	1(%r9), %r8b
	movb	%r8b, 1(%rdi)
	movb	2(%r9), %r8b
	movb	%r8b, 2(%rdi)
	movb	3(%r9), %r8b
	movb	%r8b, 3(%rdi)
	movb	4(%r9), %r8b
	movb	%r8b, 4(%rdi)
	movb	5(%r9), %r8b
	movb	%r8b, 5(%rdi)
	movb	6(%r9), %r8b
	movb	%r8b, 6(%rdi)
	movb	7(%r9), %r8b
	movb	%r8b, 7(%rdi)
	movb	8(%r9), %r8b
	movb	%r8b, 8(%rdi)
	movb	9(%r9), %r8b
	movb	%r8b, 9(%rdi)
	movb	10(%r9), %r8b
	movb	%r8b, 10(%rdi)
	movb	11(%r9), %r8b
	movb	%r8b, 11(%rdi)
	movb	12(%r9), %r8b
	movb	%r8b, 12(%rdi)
	movb	13(%r9), %r8b
	movb	%r8b, 13(%rdi)
	movb	14(%r9), %r8b
	movb	%r8b, 14(%rdi)
	movb	15(%r9), %r8b
	movb	%r8b, 15(%rdi)
	movb	16(%r9), %r8b
	movb	%r8b, 16(%rdi)
	movb	17(%r9), %r8b
	movb	%r8b, 17(%rdi)
	movb	18(%r9), %r8b
	movb	%r8b, 18(%rdi)
	movb	19(%r9), %r8b
	movb	%r8b, 19(%rdi)
	movb	20(%r9), %r8b
	movb	%r8b, 20(%rdi)
	movb	21(%r9), %r8b
	movb	%r8b, 21(%rdi)
	movb	22(%r9), %r8b
	movb	%r8b, 22(%rdi)
	movb	23(%r9), %r8b
	movb	%r8b, 23(%rdi)
	leaq	(%rcx,%rax), %rdi
	movq	%rsi, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	88(%rsp), %rcx
	leaq	112(%rsp), %rax
	leaq	40(%rsp), %r9
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rcx
	lfence
	movq	$0, %rax
	movl	72(%rsp), %r10d
	movq	24(%rsp), %rax
	lfence
	movq	$0, %rdx
	addq	$1440, %rax
	incl	%r10d
.Lht_verify$2:
	cmpl	$7, %r10d
	jb  	.Lht_verify$3
	movq	8(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	88(%rsp), %rcx
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
	movzbq	%dl, %rax
	ret
.Lht_sign$1:
	movl	%r8d, %edi
	movl	(%r9), %r8d
	movl	%r8d, 80(%rsp)
	movl	4(%r9), %r8d
	movl	%r8d, 84(%rsp)
	movl	8(%r9), %r8d
	movl	%r8d, 88(%rsp)
	leaq	40(%rsp), %r9
	movq	$0, (%r9)
	movq	$0, 8(%r9)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	leaq	40(%rsp), %r9
	movl	80(%rsp), %r8d
	movl	%r8d, 4(%r9)
	movl	84(%rsp), %r8d
	movl	%r8d, 8(%r9)
	movl	88(%rsp), %r8d
	movl	%r8d, 12(%r9)
	movq	%rcx, %r8
	movq	%rcx, 8(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%edi, 72(%rsp)
	leaq	40(%rsp), %r9
	movq	%r8, %rcx
	movq	%rax, %r8
	movl	%edi, %eax
	movq	%r9, %rdi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdi
// declassify_mem 1440 [RDI]
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	movq	32(%rsp), %rax
	movl	72(%rsp), %r10d
	lfence
	movq	$0, %r8
	movq	%rdx, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	92(%rsp), %rcx
	leaq	40(%rsp), %r9
	movl	%r10d, %edx
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	216(%rsp), %rsp
	movq	32(%rsp), %rdx
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rdi
	lfence
	movq	$0, %rcx
	movq	$1440, %r8
	movl	$1, %r10d
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%rdx, 16(%rsp)
	leaq	80(%rsp), %rcx
	movl	8(%rcx), %eax
	andl	$511, %eax
	shrl	$9, 8(%rcx)
	movl	4(%rcx), %r9d
	shll	$23, %r9d
	orl 	%r9d, 8(%rcx)
	shrl	$9, 4(%rcx)
	movl	(%rcx), %r9d
	shll	$23, %r9d
	orl 	%r9d, 4(%rcx)
	shrl	$9, (%rcx)
	leaq	40(%rsp), %r9
	movl	%r10d, (%r9)
	leaq	40(%rsp), %r9
	movl	80(%rsp), %ecx
	movl	%ecx, 4(%r9)
	movl	84(%rsp), %ecx
	movl	%ecx, 8(%r9)
	movl	88(%rsp), %ecx
	movl	%ecx, 12(%r9)
	leaq	116(%rsp), %rcx
	leaq	92(%rsp), %r9
	movb	(%r9), %r11b
	movb	%r11b, (%rcx)
	movb	1(%r9), %r11b
	movb	%r11b, 1(%rcx)
	movb	2(%r9), %r11b
	movb	%r11b, 2(%rcx)
	movb	3(%r9), %r11b
	movb	%r11b, 3(%rcx)
	movb	4(%r9), %r11b
	movb	%r11b, 4(%rcx)
	movb	5(%r9), %r11b
	movb	%r11b, 5(%rcx)
	movb	6(%r9), %r11b
	movb	%r11b, 6(%rcx)
	movb	7(%r9), %r11b
	movb	%r11b, 7(%rcx)
	movb	8(%r9), %r11b
	movb	%r11b, 8(%rcx)
	movb	9(%r9), %r11b
	movb	%r11b, 9(%rcx)
	movb	10(%r9), %r11b
	movb	%r11b, 10(%rcx)
	movb	11(%r9), %r11b
	movb	%r11b, 11(%rcx)
	movb	12(%r9), %r11b
	movb	%r11b, 12(%rcx)
	movb	13(%r9), %r11b
	movb	%r11b, 13(%rcx)
	movb	14(%r9), %r11b
	movb	%r11b, 14(%rcx)
	movb	15(%r9), %r11b
	movb	%r11b, 15(%rcx)
	movb	16(%r9), %r11b
	movb	%r11b, 16(%rcx)
	movb	17(%r9), %r11b
	movb	%r11b, 17(%rcx)
	movb	18(%r9), %r11b
	movb	%r11b, 18(%rcx)
	movb	19(%r9), %r11b
	movb	%r11b, 19(%rcx)
	movb	20(%r9), %r11b
	movb	%r11b, 20(%rcx)
	movb	21(%r9), %r11b
	movb	%r11b, 21(%rcx)
	movb	22(%r9), %r11b
	movb	%r11b, 22(%rcx)
	movb	23(%r9), %r11b
	movb	%r11b, 23(%rcx)
	leaq	(%rdi,%r8), %rcx
	movq	%rdi, 24(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%r10d, 72(%rsp)
	movq	%r8, 8(%rsp)
	movl	%eax, 76(%rsp)
	leaq	116(%rsp), %r8
	leaq	40(%rsp), %rdi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rax
// declassify_mem 1440 [RAX]
	movq	24(%rsp), %rdi
	movq	32(%rsp), %rsi
	movl	72(%rsp), %r10d
	movq	8(%rsp), %r8
	movl	76(%rsp), %edx
	lfence
	movq	$0, %rcx
	cmpl	$6, %r10d
	jnb 	.Lht_sign$4
	movq	%rsi, 8(%rsp)
	movq	%rdi, 32(%rsp)
	movl	%r10d, 76(%rsp)
	movq	%r8, 24(%rsp)
	leaq	92(%rsp), %rcx
	leaq	116(%rsp), %r8
	leaq	40(%rsp), %r9
	movq	%rax, %rdi
	movq	%r8, %rax
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	216(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	32(%rsp), %rdi
	movl	76(%rsp), %r10d
	movq	24(%rsp), %r8
	lfence
	movq	$0, %rax
.Lht_sign$4:
	movq	16(%rsp), %rdx
	lfence
	movq	$0, %rax
	addq	$1440, %r8
	incl	%r10d
.Lht_sign$2:
	cmpl	$7, %r10d
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 152(%rsp)
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$0, 16(%r9)
	movl	%edx, 20(%r9)
	movq	%rdi, %rcx
	movq	%rsi, 160(%rsp)
	movl	%edx, 192(%rsp)
	movq	%rdi, 168(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %r8
	movq	%rcx, %rdx
	movq	%r9, %rdi
	leaq	-1720(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	1720(%rsp), %rsp
	movq	%rax, %rdi
	movq	160(%rsp), %rsi
	movl	192(%rsp), %edx
	movq	168(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%edx, 28(%rdi)
	movq	$1224, %r8
	movl	%edx, %r9d
	movl	$0, %ecx
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%ecx, %edx
	incl	%edx
	movl	%edx, 24(%rdi)
	movl	%r9d, %edx
	andl	$1, %edx
	movl	%ecx, 192(%rsp)
	movl	%r9d, 196(%rsp)
	cmpl	$0, %edx
	je  	.Lxmss_pkfromsig$5
	movl	28(%rdi), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	128(%rsp), %rcx
	leaq	(%rax,%r8), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rcx)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rcx)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rcx)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rcx)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rcx)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rcx)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rcx)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rcx)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rcx)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rcx)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rcx)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rcx)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rcx)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rcx)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rcx)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rcx)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rcx)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rcx)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rcx)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rcx)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rcx)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rcx)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rcx)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rcx)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rcx)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rcx)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rcx)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rcx)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rcx)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rcx)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rcx)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rcx)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rcx)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rcx)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rcx)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rcx)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rcx)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rcx)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rcx)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rcx)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rcx)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rcx)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rcx)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rcx)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	jmp 	.Lxmss_pkfromsig$6
.Lxmss_pkfromsig$5:
	movl	28(%rdi), %edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	128(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rcx)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rcx)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rcx)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rcx)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rcx)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rcx)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rcx)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rcx)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rcx)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rcx)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rcx)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rcx)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rcx)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rcx)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rcx)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rcx)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rcx)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rcx)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rcx)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rcx)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rcx)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rcx)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	96(%rsp), %rcx
	leaq	(%rax,%r8), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rcx)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rcx)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rcx)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rcx)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rcx)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rcx)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rcx)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rcx)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rcx)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rcx)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rcx)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rcx)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rcx)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rcx)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rcx)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rcx)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rcx)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rcx)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rcx)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rcx)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rcx)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rcx)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
.Lxmss_pkfromsig$6:
	movq	%rsi, 168(%rsp)
	movq	%rdi, 160(%rsp)
	movq	%rax, 176(%rsp)
	movq	%r8, 184(%rsp)
	leaq	64(%rsp), %rcx
	leaq	128(%rsp), %rax
	leaq	96(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	40(%rsp), %rsp
	movq	168(%rsp), %rsi
	movq	160(%rsp), %rdi
	movq	176(%rsp), %rax
	movq	184(%rsp), %r8
	lfence
	movq	$0, %rcx
	leaq	32(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rcx)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rcx)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rcx)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rcx)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rcx)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rcx)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rcx)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rcx)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rcx)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rcx)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rcx)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rcx)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rcx)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rcx)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rcx)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rcx)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rcx)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rcx)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rcx)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rcx)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rcx)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rcx)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	movl	192(%rsp), %ecx
	movl	196(%rsp), %r9d
	lfence
	movq	$0, %rdx
	shrl	$1, %r9d
	addq	$24, %r8
	incl	%ecx
.Lxmss_pkfromsig$2:
	cmpl	$9, %ecx
	jb  	.Lxmss_pkfromsig$3
	movq	152(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	ret
.Lxmss_sign$1:
	movq	%r8, 8(%rsp)
	movq	$1224, %r9
	movl	%eax, %r8d
	xorl	$1, %r8d
	movl	$0, %r10d
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%rdx, 16(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%eax, 48(%rsp)
	movl	%r10d, 52(%rsp)
	movl	%r8d, 56(%rsp)
	movq	%r9, 32(%rsp)
	leaq	(%rcx,%r9), %rax
	movq	%rcx, 40(%rsp)
	movq	%rax, %rcx
	leaq	-24856(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	24856(%rsp), %rsp
	movq	40(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rsi
	movl	48(%rsp), %eax
	movl	52(%rsp), %r10d
	movl	56(%rsp), %r8d
	movq	32(%rsp), %r9
	lfence
	movq	$0, %r11
	shrl	$1, %r8d
	xorl	$1, %r8d
	addq	$24, %r9
	incl	%r10d
.Lxmss_sign$3:
	cmpl	$9, %r10d
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %r8
	lfence
	movq	$0, %r9
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%eax, 20(%rdi)
	movq	%rcx, %rax
	movq	%rcx, 8(%rsp)
	leaq	-472(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	472(%rsp), %rsp
	movq	8(%rsp), %rcx
	lfence
	movq	$0, %rdx
	ret
.Lxmss_node$1:
	movq	%rcx, 24648(%rsp)
	movq	$0, %rax
	movl	$0, %r9d
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%r10d, 24784(%rsp)
	movl	%r10d, %ecx
	subl	%r9d, %ecx
	movq	$1, %r11
	shlq	%cl, %r11
	movl	%r11d, %r10d
	imull	%r8d, %r10d
	addl	%r10d, %r11d
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%rdx, 24656(%rsp)
	movq	%rsi, 24664(%rsp)
	movl	%r8d, 24788(%rsp)
	movl	%r9d, 24792(%rsp)
	movl	%r10d, 24796(%rsp)
	movl	%r11d, 24800(%rsp)
	cmpl	$0, %r9d
	je  	.Lxmss_node$6
	movl	%r10d, %eax
	imull	$2, %eax, %eax
	movl	%r9d, %edx
	decl	%edx
	movl	$10, %ecx
	movq	$1, %r8
	shlq	%cl, %r8
	subl	%edx, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %r8
	movl	%eax, %eax
	addq	%rax, %r8
	imulq	$24, %r8, %rax
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%r9d, 24(%rdi)
	movl	%r10d, 28(%rdi)
	movl	$10, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subl	%r9d, %ecx
	movq	$1, %r8
	shlq	%cl, %r8
	subq	%r8, %rdx
	movl	%r10d, %ecx
	addq	%rcx, %rdx
	imulq	$24, %rdx, %rcx
	subl	%r10d, %r11d
	cmpl	$4, %r11d
	jnb 	.Lxmss_node$9
	movq	%rax, %rdx
	addq	$24, %rdx
	leaq	24624(%rsp), %r9
	leaq	32(%rsp,%rax), %r10
	movb	(%r10), %r8b
	movb	%r8b, (%r9)
	movb	1(%r10), %r8b
	movb	%r8b, 1(%r9)
	movb	2(%r10), %r8b
	movb	%r8b, 2(%r9)
	movb	3(%r10), %r8b
	movb	%r8b, 3(%r9)
	movb	4(%r10), %r8b
	movb	%r8b, 4(%r9)
	movb	5(%r10), %r8b
	movb	%r8b, 5(%r9)
	movb	6(%r10), %r8b
	movb	%r8b, 6(%r9)
	movb	7(%r10), %r8b
	movb	%r8b, 7(%r9)
	movb	8(%r10), %r8b
	movb	%r8b, 8(%r9)
	movb	9(%r10), %r8b
	movb	%r8b, 9(%r9)
	movb	10(%r10), %r8b
	movb	%r8b, 10(%r9)
	movb	11(%r10), %r8b
	movb	%r8b, 11(%r9)
	movb	12(%r10), %r8b
	movb	%r8b, 12(%r9)
	movb	13(%r10), %r8b
	movb	%r8b, 13(%r9)
	movb	14(%r10), %r8b
	movb	%r8b, 14(%r9)
	movb	15(%r10), %r8b
	movb	%r8b, 15(%r9)
	movb	16(%r10), %r8b
	movb	%r8b, 16(%r9)
	movb	17(%r10), %r8b
	movb	%r8b, 17(%r9)
	movb	18(%r10), %r8b
	movb	%r8b, 18(%r9)
	movb	19(%r10), %r8b
	movb	%r8b, 19(%r9)
	movb	20(%r10), %r8b
	movb	%r8b, 20(%r9)
	movb	21(%r10), %r8b
	movb	%r8b, 21(%r9)
	movb	22(%r10), %r8b
	movb	%r8b, 22(%r9)
	movb	23(%r10), %r8b
	movb	%r8b, 23(%r9)
	leaq	24592(%rsp), %r9
	leaq	32(%rsp,%rdx), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%r9)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%r9)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%r9)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%r9)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%r9)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%r9)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%r9)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%r9)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%r9)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%r9)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%r9)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%r9)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%r9)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%r9)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%r9)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%r9)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%r9)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%r9)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%r9)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%r9)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%r9)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%r9)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%r9)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r9)
	movq	%rdi, 24680(%rsp)
	movq	%rcx, 24672(%rsp)
	leaq	32(%rsp,%rcx), %rcx
	leaq	24624(%rsp), %rax
	leaq	24592(%rsp), %rdx
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_node$12:
	leaq	40(%rsp), %rsp
	movq	24680(%rsp), %rdi
	movq	24672(%rsp), %rax
	lfence
	movq	$0, %rcx
	jmp 	.Lxmss_node$7
.Lxmss_node$9:
	movl	%r9d, 24804(%rsp)
	movl	%r10d, %edx
	movl	%edx, 24808(%rsp)
	movl	%r9d, 24812(%rsp)
	movl	%r10d, %edx
	incl	%edx
	movl	%edx, 24816(%rsp)
	movl	%r9d, 24820(%rsp)
	movl	%r10d, %edx
	addl	$2, %edx
	movl	%edx, 24824(%rsp)
	movl	%r9d, 24828(%rsp)
	addl	$3, %r10d
	movl	%r10d, 24832(%rsp)
	movq	%rdi, 24672(%rsp)
	movq	%rcx, 24680(%rsp)
	leaq	32(%rsp,%rax), %rdx
	leaq	24688(%rsp), %rcx
	leaq	24804(%rsp), %rax
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_2n__thash_x4$1
.Lxmss_node$11:
	leaq	824(%rsp), %rsp
	movq	24672(%rsp), %rdi
	movq	24680(%rsp), %rax
	lfence
	movq	$0, %rcx
	leaq	32(%rsp,%rax), %rcx
	leaq	24688(%rsp), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	56(%rsp,%rax), %rcx
	leaq	24712(%rsp), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	80(%rsp,%rax), %rcx
	leaq	24736(%rsp), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	104(%rsp,%rax), %rcx
	leaq	24760(%rsp), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	movl	24796(%rsp), %ecx
	addl	$3, %ecx
	movl	%ecx, 24796(%rsp)
.Lxmss_node$10:
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%r10d, 20(%rdi)
	movl	%r10d, %eax
	imulq	$24, %rax, %rax
	leaq	32(%rsp,%rax), %rcx
	leaq	-1720(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	1720(%rsp), %rsp
.Lxmss_node$7:
	movq	24656(%rsp), %rdx
	movq	24664(%rsp), %rsi
	movl	24788(%rsp), %r8d
	movl	24792(%rsp), %r9d
	movl	24796(%rsp), %r10d
	movl	24800(%rsp), %r11d
	lfence
	movq	$0, %rcx
	incl	%r10d
.Lxmss_node$4:
	cmpl	%r11d, %r10d
	jb  	.Lxmss_node$5
	movl	24784(%rsp), %r10d
	lfence
	movq	$0, %rcx
	incl	%r9d
.Lxmss_node$2:
	cmpl	%r10d, %r9d
	jbe 	.Lxmss_node$3
	movq	24648(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp,%rax), %rdx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	ret
.Lwots_pkfromsig$1:
	movq	%r8, 1256(%rsp)
	leaq	1312(%rsp), %r8
	movq	%r8, %r9
	movq	$0, %r10
	movl	$0, %ecx
	movl	$0, %r11d
	jmp 	.Lwots_pkfromsig$104
.Lwots_pkfromsig$105:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$104:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$105
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, (%r9)
	jmp 	.Lwots_pkfromsig$102
.Lwots_pkfromsig$103:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$102:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$103
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 4(%r9)
	jmp 	.Lwots_pkfromsig$100
.Lwots_pkfromsig$101:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$100:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$101
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 8(%r9)
	jmp 	.Lwots_pkfromsig$98
.Lwots_pkfromsig$99:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$98:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$99
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 12(%r9)
	jmp 	.Lwots_pkfromsig$96
.Lwots_pkfromsig$97:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$96:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$97
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 16(%r9)
	jmp 	.Lwots_pkfromsig$94
.Lwots_pkfromsig$95:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$94:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$95
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 20(%r9)
	jmp 	.Lwots_pkfromsig$92
.Lwots_pkfromsig$93:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$92:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$93
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 24(%r9)
	jmp 	.Lwots_pkfromsig$90
.Lwots_pkfromsig$91:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$90:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$91
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 28(%r9)
	jmp 	.Lwots_pkfromsig$88
.Lwots_pkfromsig$89:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$88:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$89
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 32(%r9)
	jmp 	.Lwots_pkfromsig$86
.Lwots_pkfromsig$87:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$86:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$87
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 36(%r9)
	jmp 	.Lwots_pkfromsig$84
.Lwots_pkfromsig$85:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$84:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$85
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 40(%r9)
	jmp 	.Lwots_pkfromsig$82
.Lwots_pkfromsig$83:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$82:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$83
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 44(%r9)
	jmp 	.Lwots_pkfromsig$80
.Lwots_pkfromsig$81:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$80:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$81
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 48(%r9)
	jmp 	.Lwots_pkfromsig$78
.Lwots_pkfromsig$79:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$78:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$79
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 52(%r9)
	jmp 	.Lwots_pkfromsig$76
.Lwots_pkfromsig$77:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$76:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$77
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 56(%r9)
	jmp 	.Lwots_pkfromsig$74
.Lwots_pkfromsig$75:
	shll	$8, %r11d
	movzbl	(%rax,%r10), %ebx
	orl 	%ebx, %r11d
	incq	%r10
	addl	$8, %ecx
.Lwots_pkfromsig$74:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$75
	movl	%r11d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 60(%r9)
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
	movl	%ebx, 64(%r9)
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
	movl	%ebx, 68(%r9)
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
	movl	%ebx, 72(%r9)
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
	movl	%ebx, 76(%r9)
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
	movl	%ebx, 80(%r9)
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
	movl	%ebx, 84(%r9)
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
	movl	%ebx, 88(%r9)
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
	movl	%ebx, 92(%r9)
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
	movl	%ebx, 96(%r9)
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
	movl	%ebx, 100(%r9)
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
	movl	%ebx, 104(%r9)
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
	movl	%ebx, 108(%r9)
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
	movl	%ebx, 112(%r9)
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
	movl	%ebx, 116(%r9)
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
	movl	%ebx, 120(%r9)
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
	movl	%ebx, 124(%r9)
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
	movl	%ebx, 128(%r9)
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
	movl	%ebx, 132(%r9)
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
	movl	%ebx, 136(%r9)
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
	movl	%ebx, 140(%r9)
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
	movl	%ebx, 144(%r9)
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
	movl	%ebx, 148(%r9)
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
	movl	%ebx, 152(%r9)
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
	movl	%ebx, 156(%r9)
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
	movl	%ebx, 160(%r9)
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
	movl	%ebx, 164(%r9)
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
	movl	%ebx, 168(%r9)
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
	movl	%ebx, 172(%r9)
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
	movl	%ebx, 176(%r9)
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
	movl	%ebx, 180(%r9)
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
	movl	%ebx, 184(%r9)
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
	movl	%r11d, 188(%r9)
	movq	%r8, %rax
	movl	$720, %ecx
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
	shll	$4, %ecx
	movl	%ecx, %eax
	shrl	$0, %eax
	andl	$255, %eax
	movb	%al, 1721(%rsp)
	shrl	$8, %ecx
	andl	$255, %ecx
	movb	%cl, 1720(%rsp)
	leaq	192(%r8), %r8
	leaq	1720(%rsp), %rax
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_pkfromsig$8
.Lwots_pkfromsig$9:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$8:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$9
	movl	%r10d, %r11d
	addl	$-4, %ecx
	shrq	%cl, %r11
	andq	$15, %r11
	movl	%r11d, (%r8)
	jmp 	.Lwots_pkfromsig$6
.Lwots_pkfromsig$7:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$6:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$7
	movl	%r10d, %r11d
	addl	$-4, %ecx
	shrq	%cl, %r11
	andq	$15, %r11
	movl	%r11d, 4(%r8)
	jmp 	.Lwots_pkfromsig$4
.Lwots_pkfromsig$5:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %r11d
	orl 	%r11d, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$4:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$5
	movl	%r10d, %r11d
	addl	$-4, %ecx
	shrq	%cl, %r11
	andq	$15, %r11
	movl	%r11d, 8(%r8)
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
	movl	$15, %edx
	movl	%edx, 1516(%rsp)
	movl	%edx, 1520(%rsp)
	movl	%edx, 1524(%rsp)
	movl	%edx, 1528(%rsp)
	movl	%edx, 1532(%rsp)
	movl	%edx, 1536(%rsp)
	movl	%edx, 1540(%rsp)
	movl	%edx, 1544(%rsp)
	movl	%edx, 1548(%rsp)
	movl	%edx, 1552(%rsp)
	movl	%edx, 1556(%rsp)
	movl	%edx, 1560(%rsp)
	movl	%edx, 1564(%rsp)
	movl	%edx, 1568(%rsp)
	movl	%edx, 1572(%rsp)
	movl	%edx, 1576(%rsp)
	movl	%edx, 1580(%rsp)
	movl	%edx, 1584(%rsp)
	movl	%edx, 1588(%rsp)
	movl	%edx, 1592(%rsp)
	movl	%edx, 1596(%rsp)
	movl	%edx, 1600(%rsp)
	movl	%edx, 1604(%rsp)
	movl	%edx, 1608(%rsp)
	movl	%edx, 1612(%rsp)
	movl	%edx, 1616(%rsp)
	movl	%edx, 1620(%rsp)
	movl	%edx, 1624(%rsp)
	movl	%edx, 1628(%rsp)
	movl	%edx, 1632(%rsp)
	movl	%edx, 1636(%rsp)
	movl	%edx, 1640(%rsp)
	movl	%edx, 1644(%rsp)
	movl	%edx, 1648(%rsp)
	movl	%edx, 1652(%rsp)
	movl	%edx, 1656(%rsp)
	movl	%edx, 1660(%rsp)
	movl	%edx, 1664(%rsp)
	movl	%edx, 1668(%rsp)
	movl	%edx, 1672(%rsp)
	movl	%edx, 1676(%rsp)
	movl	%edx, 1680(%rsp)
	movl	%edx, 1684(%rsp)
	movl	%edx, 1688(%rsp)
	movl	%edx, 1692(%rsp)
	movl	%edx, 1696(%rsp)
	movl	%edx, 1700(%rsp)
	movl	%edx, 1704(%rsp)
	movl	%edx, 1708(%rsp)
	movl	%edx, 1712(%rsp)
	movl	%edx, 1716(%rsp)
	movq	%rdi, 1264(%rsp)
	movq	%rsi, 1272(%rsp)
	leaq	32(%rsp), %rcx
	leaq	1312(%rsp), %rax
	leaq	1516(%rsp), %rdx
	movq	%rcx, %r8
	movq	%rax, %rcx
	leaq	-2232(%rsp), %rsp
	call	.Lwots_chains_refill_x4$1
.Lwots_pkfromsig$3:
	leaq	2232(%rsp), %rsp
	movq	1264(%rsp), %rax
	movq	1272(%rsp), %rsi
	lfence
	movq	$0, %rcx
	leaq	1280(%rsp), %rcx
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
	leaq	1280(%rsp), %rdi
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$1, 16(%rdi)
	movl	20(%rax), %edx
	leaq	1280(%rsp), %rdi
	movl	%edx, 20(%rdi)
	movq	1256(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	%rax, 1256(%rsp)
	leaq	1280(%rsp), %rdi
	leaq	32(%rsp), %rax
	movq	%rcx, %rdx
	movq	%rax, %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkfromsig$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rdx
	movq	1256(%rsp), %rax
	lfence
	movq	$0, %rcx
	ret
.Lwots_sign$1:
	leaq	56(%rsp), %r9
	movq	%r9, %r10
	movq	$0, %r11
	movl	$0, %ecx
	movl	$0, %ebx
	jmp 	.Lwots_sign$104
.Lwots_sign$105:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$104:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$105
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, (%r10)
	jmp 	.Lwots_sign$102
.Lwots_sign$103:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$102:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$103
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 4(%r10)
	jmp 	.Lwots_sign$100
.Lwots_sign$101:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$100:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$101
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 8(%r10)
	jmp 	.Lwots_sign$98
.Lwots_sign$99:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$98:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$99
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 12(%r10)
	jmp 	.Lwots_sign$96
.Lwots_sign$97:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$96:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$97
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 16(%r10)
	jmp 	.Lwots_sign$94
.Lwots_sign$95:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$94:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$95
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 20(%r10)
	jmp 	.Lwots_sign$92
.Lwots_sign$93:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$92:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$93
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 24(%r10)
	jmp 	.Lwots_sign$90
.Lwots_sign$91:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$90:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$91
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 28(%r10)
	jmp 	.Lwots_sign$88
.Lwots_sign$89:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$88:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$89
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 32(%r10)
	jmp 	.Lwots_sign$86
.Lwots_sign$87:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$86:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$87
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 36(%r10)
	jmp 	.Lwots_sign$84
.Lwots_sign$85:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$84:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$85
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 40(%r10)
	jmp 	.Lwots_sign$82
.Lwots_sign$83:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$82:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$83
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 44(%r10)
	jmp 	.Lwots_sign$80
.Lwots_sign$81:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$80:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$81
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 48(%r10)
	jmp 	.Lwots_sign$78
.Lwots_sign$79:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$78:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$79
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 52(%r10)
	jmp 	.Lwots_sign$76
.Lwots_sign$77:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$76:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$77
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 56(%r10)
	jmp 	.Lwots_sign$74
.Lwots_sign$75:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
	orl 	%ebp, %ebx
	incq	%r11
	addl	$8, %ecx
.Lwots_sign$74:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$75
	movl	%ebx, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 60(%r10)
	jmp 	.Lwots_sign$72
.Lwots_sign$73:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 64(%r10)
	jmp 	.Lwots_sign$70
.Lwots_sign$71:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 68(%r10)
	jmp 	.Lwots_sign$68
.Lwots_sign$69:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 72(%r10)
	jmp 	.Lwots_sign$66
.Lwots_sign$67:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 76(%r10)
	jmp 	.Lwots_sign$64
.Lwots_sign$65:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 80(%r10)
	jmp 	.Lwots_sign$62
.Lwots_sign$63:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 84(%r10)
	jmp 	.Lwots_sign$60
.Lwots_sign$61:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 88(%r10)
	jmp 	.Lwots_sign$58
.Lwots_sign$59:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 92(%r10)
	jmp 	.Lwots_sign$56
.Lwots_sign$57:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 96(%r10)
	jmp 	.Lwots_sign$54
.Lwots_sign$55:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 100(%r10)
	jmp 	.Lwots_sign$52
.Lwots_sign$53:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 104(%r10)
	jmp 	.Lwots_sign$50
.Lwots_sign$51:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 108(%r10)
	jmp 	.Lwots_sign$48
.Lwots_sign$49:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 112(%r10)
	jmp 	.Lwots_sign$46
.Lwots_sign$47:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 116(%r10)
	jmp 	.Lwots_sign$44
.Lwots_sign$45:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 120(%r10)
	jmp 	.Lwots_sign$42
.Lwots_sign$43:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 124(%r10)
	jmp 	.Lwots_sign$40
.Lwots_sign$41:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 128(%r10)
	jmp 	.Lwots_sign$38
.Lwots_sign$39:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 132(%r10)
	jmp 	.Lwots_sign$36
.Lwots_sign$37:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 136(%r10)
	jmp 	.Lwots_sign$34
.Lwots_sign$35:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 140(%r10)
	jmp 	.Lwots_sign$32
.Lwots_sign$33:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 144(%r10)
	jmp 	.Lwots_sign$30
.Lwots_sign$31:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 148(%r10)
	jmp 	.Lwots_sign$28
.Lwots_sign$29:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 152(%r10)
	jmp 	.Lwots_sign$26
.Lwots_sign$27:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 156(%r10)
	jmp 	.Lwots_sign$24
.Lwots_sign$25:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 160(%r10)
	jmp 	.Lwots_sign$22
.Lwots_sign$23:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 164(%r10)
	jmp 	.Lwots_sign$20
.Lwots_sign$21:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 168(%r10)
	jmp 	.Lwots_sign$18
.Lwots_sign$19:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 172(%r10)
	jmp 	.Lwots_sign$16
.Lwots_sign$17:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 176(%r10)
	jmp 	.Lwots_sign$14
.Lwots_sign$15:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 180(%r10)
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%ebp, 184(%r10)
	jmp 	.Lwots_sign$10
.Lwots_sign$11:
	shll	$8, %ebx
	movzbl	(%r8,%r11), %ebp
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
	movl	%r11d, 188(%r10)
	movq	%r9, %rcx
	movl	$720, %r8d
	subl	(%rcx), %r8d
	subl	4(%rcx), %r8d
	subl	8(%rcx), %r8d
	subl	12(%rcx), %r8d
	subl	16(%rcx), %r8d
	subl	20(%rcx), %r8d
	subl	24(%rcx), %r8d
	subl	28(%rcx), %r8d
	subl	32(%rcx), %r8d
	subl	36(%rcx), %r8d
	subl	40(%rcx), %r8d
	subl	44(%rcx), %r8d
	subl	48(%rcx), %r8d
	subl	52(%rcx), %r8d
	subl	56(%rcx), %r8d
	subl	60(%rcx), %r8d
	subl	64(%rcx), %r8d
	subl	68(%rcx), %r8d
	subl	72(%rcx), %r8d
	subl	76(%rcx), %r8d
	subl	80(%rcx), %r8d
	subl	84(%rcx), %r8d
	subl	88(%rcx), %r8d
	subl	92(%rcx), %r8d
	subl	96(%rcx), %r8d
	subl	100(%rcx), %r8d
	subl	104(%rcx), %r8d
	subl	108(%rcx), %r8d
	subl	112(%rcx), %r8d
	subl	116(%rcx), %r8d
	subl	120(%rcx), %r8d
	subl	124(%rcx), %r8d
	subl	128(%rcx), %r8d
	subl	132(%rcx), %r8d
	subl	136(%rcx), %r8d
	subl	140(%rcx), %r8d
	subl	144(%rcx), %r8d
	subl	148(%rcx), %r8d
	subl	152(%rcx), %r8d
	subl	156(%rcx), %r8d
	subl	160(%rcx), %r8d
	subl	164(%rcx), %r8d
	subl	168(%rcx), %r8d
	subl	172(%rcx), %r8d
	subl	176(%rcx), %r8d
	subl	180(%rcx), %r8d
	subl	184(%rcx), %r8d
	subl	188(%rcx), %r8d
	shll	$4, %r8d
	movl	%r8d, %ecx
	shrl	$0, %ecx
	andl	$255, %ecx
	movb	%cl, 465(%rsp)
	shrl	$8, %r8d
	andl	$255, %r8d
	movb	%r8b, 464(%rsp)
	leaq	192(%r9), %r8
	leaq	464(%rsp), %r9
	movq	$0, %r10
	movl	$0, %ecx
	movl	$0, %r11d
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %r11d
	movzbl	(%r9,%r10), %ebx
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
	movl	%ebx, (%r8)
	jmp 	.Lwots_sign$6
.Lwots_sign$7:
	shll	$8, %r11d
	movzbl	(%r9,%r10), %ebx
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
	movl	%ebx, 4(%r8)
	jmp 	.Lwots_sign$4
.Lwots_sign$5:
	shll	$8, %r11d
	movzbl	(%r9,%r10), %ebx
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
	movl	%r11d, 8(%r8)
	leaq	24(%rsp), %rcx
	movq	(%rdi), %r8
	movq	%r8, (%rcx)
	movq	8(%rdi), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rdi), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rdi), %r8
	movq	%r8, 24(%rcx)
	leaq	24(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$5, 16(%r9)
	movl	20(%rdi), %ecx
	leaq	24(%rsp), %r9
	movl	%ecx, 20(%r9)
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	leaq	24(%rsp), %rcx
	movq	%rax, %r8
	leaq	-1464(%rsp), %rsp
	call	.Lwots_sk_x4$1
.Lwots_sign$3:
	leaq	1464(%rsp), %rsp
	movq	8(%rsp), %rdi
	movq	16(%rsp), %rsi
	lfence
	movq	$0, %rax
	movl	$0, %edx
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
	movl	%edx, 336(%rsp)
	movl	%edx, 340(%rsp)
	movl	%edx, 344(%rsp)
	movl	%edx, 348(%rsp)
	movl	%edx, 352(%rsp)
	movl	%edx, 356(%rsp)
	movl	%edx, 360(%rsp)
	movl	%edx, 364(%rsp)
	movl	%edx, 368(%rsp)
	movl	%edx, 372(%rsp)
	movl	%edx, 376(%rsp)
	movl	%edx, 380(%rsp)
	movl	%edx, 384(%rsp)
	movl	%edx, 388(%rsp)
	movl	%edx, 392(%rsp)
	movl	%edx, 396(%rsp)
	movl	%edx, 400(%rsp)
	movl	%edx, 404(%rsp)
	movl	%edx, 408(%rsp)
	movl	%edx, 412(%rsp)
	movl	%edx, 416(%rsp)
	movl	%edx, 420(%rsp)
	movl	%edx, 424(%rsp)
	movl	%edx, 428(%rsp)
	movl	%edx, 432(%rsp)
	movl	%edx, 436(%rsp)
	movl	%edx, 440(%rsp)
	movl	%edx, 444(%rsp)
	movl	%edx, 448(%rsp)
	movl	%edx, 452(%rsp)
	movl	%edx, 456(%rsp)
	movl	%edx, 460(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	260(%rsp), %rax
	leaq	56(%rsp), %rdx
	movq	%rcx, %r8
	movq	%rax, %rcx
	leaq	-2232(%rsp), %rsp
	call	.Lwots_chains_refill_x4$1
.Lwots_sign$2:
	leaq	2232(%rsp), %rsp
	movq	16(%rsp), %rax
	lfence
	movq	$0, %rdx
	ret
.Lwots_pkgen$1:
	movq	%rcx, 1256(%rsp)
	leaq	1280(%rsp), %rcx
	movq	(%rdi), %r8
	movq	%r8, (%rcx)
	movq	8(%rdi), %r8
	movq	%r8, 8(%rcx)
	movq	16(%rdi), %r8
	movq	%r8, 16(%rcx)
	movq	24(%rdi), %r8
	movq	%r8, 24(%rcx)
	leaq	1280(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$5, 16(%r9)
	movl	20(%rdi), %ecx
	leaq	1280(%rsp), %r9
	movl	%ecx, 20(%r9)
	movq	%rdi, 1264(%rsp)
	movq	%rsi, 1272(%rsp)
	leaq	32(%rsp), %rcx
	leaq	1280(%rsp), %rdi
	movq	%rcx, %r8
	movq	%rdi, %rcx
	leaq	-1464(%rsp), %rsp
	call	.Lwots_sk_x4$1
.Lwots_pkgen$4:
	leaq	1464(%rsp), %rsp
	movq	1264(%rsp), %rdi
	movq	1272(%rsp), %rsi
	lfence
	movq	$0, %rcx
	movl	$0, %edx
	movl	%edx, 1312(%rsp)
	movl	%edx, 1316(%rsp)
	movl	%edx, 1320(%rsp)
	movl	%edx, 1324(%rsp)
	movl	%edx, 1328(%rsp)
	movl	%edx, 1332(%rsp)
	movl	%edx, 1336(%rsp)
	movl	%edx, 1340(%rsp)
	movl	%edx, 1344(%rsp)
	movl	%edx, 1348(%rsp)
	movl	%edx, 1352(%rsp)
	movl	%edx, 1356(%rsp)
	movl	%edx, 1360(%rsp)
	movl	%edx, 1364(%rsp)
	movl	%edx, 1368(%rsp)
	movl	%edx, 1372(%rsp)
	movl	%edx, 1376(%rsp)
	movl	%edx, 1380(%rsp)
	movl	%edx, 1384(%rsp)
	movl	%edx, 1388(%rsp)
	movl	%edx, 1392(%rsp)
	movl	%edx, 1396(%rsp)
	movl	%edx, 1400(%rsp)
	movl	%edx, 1404(%rsp)
	movl	%edx, 1408(%rsp)
	movl	%edx, 1412(%rsp)
	movl	%edx, 1416(%rsp)
	movl	%edx, 1420(%rsp)
	movl	%edx, 1424(%rsp)
	movl	%edx, 1428(%rsp)
	movl	%edx, 1432(%rsp)
	movl	%edx, 1436(%rsp)
	movl	%edx, 1440(%rsp)
	movl	%edx, 1444(%rsp)
	movl	%edx, 1448(%rsp)
	movl	%edx, 1452(%rsp)
	movl	%edx, 1456(%rsp)
	movl	%edx, 1460(%rsp)
	movl	%edx, 1464(%rsp)
	movl	%edx, 1468(%rsp)
	movl	%edx, 1472(%rsp)
	movl	%edx, 1476(%rsp)
	movl	%edx, 1480(%rsp)
	movl	%edx, 1484(%rsp)
	movl	%edx, 1488(%rsp)
	movl	%edx, 1492(%rsp)
	movl	%edx, 1496(%rsp)
	movl	%edx, 1500(%rsp)
	movl	%edx, 1504(%rsp)
	movl	%edx, 1508(%rsp)
	movl	%edx, 1512(%rsp)
	movl	$15, %edx
	movl	%edx, 1516(%rsp)
	movl	%edx, 1520(%rsp)
	movl	%edx, 1524(%rsp)
	movl	%edx, 1528(%rsp)
	movl	%edx, 1532(%rsp)
	movl	%edx, 1536(%rsp)
	movl	%edx, 1540(%rsp)
	movl	%edx, 1544(%rsp)
	movl	%edx, 1548(%rsp)
	movl	%edx, 1552(%rsp)
	movl	%edx, 1556(%rsp)
	movl	%edx, 1560(%rsp)
	movl	%edx, 1564(%rsp)
	movl	%edx, 1568(%rsp)
	movl	%edx, 1572(%rsp)
	movl	%edx, 1576(%rsp)
	movl	%edx, 1580(%rsp)
	movl	%edx, 1584(%rsp)
	movl	%edx, 1588(%rsp)
	movl	%edx, 1592(%rsp)
	movl	%edx, 1596(%rsp)
	movl	%edx, 1600(%rsp)
	movl	%edx, 1604(%rsp)
	movl	%edx, 1608(%rsp)
	movl	%edx, 1612(%rsp)
	movl	%edx, 1616(%rsp)
	movl	%edx, 1620(%rsp)
	movl	%edx, 1624(%rsp)
	movl	%edx, 1628(%rsp)
	movl	%edx, 1632(%rsp)
	movl	%edx, 1636(%rsp)
	movl	%edx, 1640(%rsp)
	movl	%edx, 1644(%rsp)
	movl	%edx, 1648(%rsp)
	movl	%edx, 1652(%rsp)
	movl	%edx, 1656(%rsp)
	movl	%edx, 1660(%rsp)
	movl	%edx, 1664(%rsp)
	movl	%edx, 1668(%rsp)
	movl	%edx, 1672(%rsp)
	movl	%edx, 1676(%rsp)
	movl	%edx, 1680(%rsp)
	movl	%edx, 1684(%rsp)
	movl	%edx, 1688(%rsp)
	movl	%edx, 1692(%rsp)
	movl	%edx, 1696(%rsp)
	movl	%edx, 1700(%rsp)
	movl	%edx, 1704(%rsp)
	movl	%edx, 1708(%rsp)
	movl	%edx, 1712(%rsp)
	movl	%edx, 1716(%rsp)
	movq	%rdi, 1272(%rsp)
	movq	%rsi, 1264(%rsp)
	leaq	32(%rsp), %rcx
	leaq	1312(%rsp), %rdx
	leaq	1516(%rsp), %r8
	movq	%rcx, %r9
	movq	%rdx, %rcx
	movq	%r8, %rdx
	leaq	-1880(%rsp), %rsp
	call	.Lwots_chains_x4$1
.Lwots_pkgen$3:
	leaq	1880(%rsp), %rsp
	movq	1272(%rsp), %rdi
	movq	1264(%rsp), %rsi
	lfence
	movq	$0, %rcx
	leaq	1280(%rsp), %r9
	movq	$0, 16(%r9)
	movq	$0, 24(%r9)
	movl	$1, 16(%r9)
	movl	20(%rdi), %ecx
	leaq	1280(%rsp), %r9
	movl	%ecx, 20(%r9)
	movq	1256(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	%rdi, 1256(%rsp)
	leaq	1280(%rsp), %rdi
	leaq	32(%rsp), %r8
	movq	%rcx, %rdx
	movq	%r8, %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	40(%rsp), %rsp
	movq	1256(%rsp), %rdi
	lfence
	movq	$0, %rdx
	ret
.Lwots_sk_x4$1:
	movq	%r8, 8(%rsp)
	leaq	32(%rsp), %rdi
	movb	(%rsi), %r8b
	movb	%r8b, (%rdi)
	movb	1(%rsi), %r8b
	movb	%r8b, 1(%rdi)
	movb	2(%rsi), %r8b
	movb	%r8b, 2(%rdi)
	movb	3(%rsi), %r8b
	movb	%r8b, 3(%rdi)
	movb	4(%rsi), %r8b
	movb	%r8b, 4(%rdi)
	movb	5(%rsi), %r8b
	movb	%r8b, 5(%rdi)
	movb	6(%rsi), %r8b
	movb	%r8b, 6(%rdi)
	movb	7(%rsi), %r8b
	movb	%r8b, 7(%rdi)
	movb	8(%rsi), %r8b
	movb	%r8b, 8(%rdi)
	movb	9(%rsi), %r8b
	movb	%r8b, 9(%rdi)
	movb	10(%rsi), %r8b
	movb	%r8b, 10(%rdi)
	movb	11(%rsi), %r8b
	movb	%r8b, 11(%rdi)
	movb	12(%rsi), %r8b
	movb	%r8b, 12(%rdi)
	movb	13(%rsi), %r8b
	movb	%r8b, 13(%rdi)
	movb	14(%rsi), %r8b
	movb	%r8b, 14(%rdi)
	movb	15(%rsi), %r8b
	movb	%r8b, 15(%rdi)
	movb	16(%rsi), %r8b
	movb	%r8b, 16(%rdi)
	movb	17(%rsi), %r8b
	movb	%r8b, 17(%rdi)
	movb	18(%rsi), %r8b
	movb	%r8b, 18(%rdi)
	movb	19(%rsi), %r8b
	movb	%r8b, 19(%rdi)
	movb	20(%rsi), %r8b
	movb	%r8b, 20(%rdi)
	movb	21(%rsi), %r8b
	movb	%r8b, 21(%rdi)
	movb	22(%rsi), %r8b
	movb	%r8b, 22(%rdi)
	movb	23(%rsi), %r8b
	movb	%r8b, 23(%rdi)
	leaq	56(%rsp), %rsi
	movq	(%rcx), %r8
	movq	%r8, (%rsi)
	movq	8(%rcx), %r8
	movq	%r8, 8(%rsi)
	movq	16(%rcx), %r8
	movq	%r8, 16(%rsi)
	movq	24(%rcx), %rcx
	movq	%rcx, 24(%rsi)
	leaq	88(%rsp), %rcx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %r8b
	movb	%r8b, 23(%rcx)
	leaq	112(%rsp), %rcx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %r8b
	movb	%r8b, 23(%rcx)
	leaq	136(%rsp), %rcx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %r8b
	movb	%r8b, 23(%rcx)
	leaq	160(%rsp), %rcx
	movb	(%rdx), %r8b
	movb	%r8b, (%rcx)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rcx)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rcx)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rcx)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rcx)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rcx)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rcx)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rcx)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rcx)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rcx)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rcx)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rcx)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rcx)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rcx)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rcx)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rcx)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rcx)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rcx)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rcx)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rcx)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rcx)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rcx)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	movq	$0, %rsi
	jmp 	.Lwots_sk_x4$2
.Lwots_sk_x4$3:
	movl	$0, %ecx
	movl	%esi, %edx
	shll	$2, %edx
	movl	%edx, 1432(%rsp)
	movl	%ecx, 1436(%rsp)
	incl	%edx
	movl	%edx, 1440(%rsp)
	movl	%ecx, 1444(%rsp)
	incl	%edx
	movl	%edx, 1448(%rsp)
	movl	%ecx, 1452(%rsp)
	incl	%edx
	movl	%edx, 1456(%rsp)
	movl	%ecx, 1460(%rsp)
	movq	%rsi, %rdi
	imulq	$96, %rdi, %rdi
	movq	%rsi, 16(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	184(%rsp,%rdi), %rdi
	leaq	88(%rsp), %rdx
	leaq	32(%rsp), %rsi
	leaq	56(%rsp), %r9
	leaq	1432(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lwots_sk_x4$4:
	leaq	824(%rsp), %rsp
	movq	16(%rsp), %rsi
	lfence
	movq	$0, %rcx
	incq	%rsi
.Lwots_sk_x4$2:
	cmpq	$13, %rsi
	jb  	.Lwots_sk_x4$3
	movq	8(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	184(%rsp), %rdx
	movq	%rdx, (%rcx)
	movq	192(%rsp), %rdx
	movq	%rdx, 8(%rcx)
	movq	200(%rsp), %rdx
	movq	%rdx, 16(%rcx)
	movq	208(%rsp), %rdx
	movq	%rdx, 24(%rcx)
	movq	216(%rsp), %rdx
	movq	%rdx, 32(%rcx)
	movq	224(%rsp), %rdx
	movq	%rdx, 40(%rcx)
	movq	232(%rsp), %rdx
	movq	%rdx, 48(%rcx)
	movq	240(%rsp), %rdx
	movq	%rdx, 56(%rcx)
	movq	248(%rsp), %rdx
	movq	%rdx, 64(%rcx)
	movq	256(%rsp), %rdx
	movq	%rdx, 72(%rcx)
	movq	264(%rsp), %rdx
	movq	%rdx, 80(%rcx)
	movq	272(%rsp), %rdx
	movq	%rdx, 88(%rcx)
	movq	280(%rsp), %rdx
	movq	%rdx, 96(%rcx)
	movq	288(%rsp), %rdx
	movq	%rdx, 104(%rcx)
	movq	296(%rsp), %rdx
	movq	%rdx, 112(%rcx)
	movq	304(%rsp), %rdx
	movq	%rdx, 120(%rcx)
	movq	312(%rsp), %rdx
	movq	%rdx, 128(%rcx)
	movq	320(%rsp), %rdx
	movq	%rdx, 136(%rcx)
	movq	328(%rsp), %rdx
	movq	%rdx, 144(%rcx)
	movq	336(%rsp), %rdx
	movq	%rdx, 152(%rcx)
	movq	344(%rsp), %rdx
	movq	%rdx, 160(%rcx)
	movq	352(%rsp), %rdx
	movq	%rdx, 168(%rcx)
	movq	360(%rsp), %rdx
	movq	%rdx, 176(%rcx)
	movq	368(%rsp), %rdx
	movq	%rdx, 184(%rcx)
	movq	376(%rsp), %rdx
	movq	%rdx, 192(%rcx)
	movq	384(%rsp), %rdx
	movq	%rdx, 200(%rcx)
	movq	392(%rsp), %rdx
	movq	%rdx, 208(%rcx)
	movq	400(%rsp), %rdx
	movq	%rdx, 216(%rcx)
	movq	408(%rsp), %rdx
	movq	%rdx, 224(%rcx)
	movq	416(%rsp), %rdx
	movq	%rdx, 232(%rcx)
	movq	424(%rsp), %rdx
	movq	%rdx, 240(%rcx)
	movq	432(%rsp), %rdx
	movq	%rdx, 248(%rcx)
	movq	440(%rsp), %rdx
	movq	%rdx, 256(%rcx)
	movq	448(%rsp), %rdx
	movq	%rdx, 264(%rcx)
	movq	456(%rsp), %rdx
	movq	%rdx, 272(%rcx)
	movq	464(%rsp), %rdx
	movq	%rdx, 280(%rcx)
	movq	472(%rsp), %rdx
	movq	%rdx, 288(%rcx)
	movq	480(%rsp), %rdx
	movq	%rdx, 296(%rcx)
	movq	488(%rsp), %rdx
	movq	%rdx, 304(%rcx)
	movq	496(%rsp), %rdx
	movq	%rdx, 312(%rcx)
	movq	504(%rsp), %rdx
	movq	%rdx, 320(%rcx)
	movq	512(%rsp), %rdx
	movq	%rdx, 328(%rcx)
	movq	520(%rsp), %rdx
	movq	%rdx, 336(%rcx)
	movq	528(%rsp), %rdx
	movq	%rdx, 344(%rcx)
	movq	536(%rsp), %rdx
	movq	%rdx, 352(%rcx)
	movq	544(%rsp), %rdx
	movq	%rdx, 360(%rcx)
	movq	552(%rsp), %rdx
	movq	%rdx, 368(%rcx)
	movq	560(%rsp), %rdx
	movq	%rdx, 376(%rcx)
	movq	568(%rsp), %rdx
	movq	%rdx, 384(%rcx)
	movq	576(%rsp), %rdx
	movq	%rdx, 392(%rcx)
	movq	584(%rsp), %rdx
	movq	%rdx, 400(%rcx)
	movq	592(%rsp), %rdx
	movq	%rdx, 408(%rcx)
	movq	600(%rsp), %rdx
	movq	%rdx, 416(%rcx)
	movq	608(%rsp), %rdx
	movq	%rdx, 424(%rcx)
	movq	616(%rsp), %rdx
	movq	%rdx, 432(%rcx)
	movq	624(%rsp), %rdx
	movq	%rdx, 440(%rcx)
	movq	632(%rsp), %rdx
	movq	%rdx, 448(%rcx)
	movq	640(%rsp), %rdx
	movq	%rdx, 456(%rcx)
	movq	648(%rsp), %rdx
	movq	%rdx, 464(%rcx)
	movq	656(%rsp), %rdx
	movq	%rdx, 472(%rcx)
	movq	664(%rsp), %rdx
	movq	%rdx, 480(%rcx)
	movq	672(%rsp), %rdx
	movq	%rdx, 488(%rcx)
	movq	680(%rsp), %rdx
	movq	%rdx, 496(%rcx)
	movq	688(%rsp), %rdx
	movq	%rdx, 504(%rcx)
	movq	696(%rsp), %rdx
	movq	%rdx, 512(%rcx)
	movq	704(%rsp), %rdx
	movq	%rdx, 520(%rcx)
	movq	712(%rsp), %rdx
	movq	%rdx, 528(%rcx)
	movq	720(%rsp), %rdx
	movq	%rdx, 536(%rcx)
	movq	728(%rsp), %rdx
	movq	%rdx, 544(%rcx)
	movq	736(%rsp), %rdx
	movq	%rdx, 552(%rcx)
	movq	744(%rsp), %rdx
	movq	%rdx, 560(%rcx)
	movq	752(%rsp), %rdx
	movq	%rdx, 568(%rcx)
	movq	760(%rsp), %rdx
	movq	%rdx, 576(%rcx)
	movq	768(%rsp), %rdx
	movq	%rdx, 584(%rcx)
	movq	776(%rsp), %rdx
	movq	%rdx, 592(%rcx)
	movq	784(%rsp), %rdx
	movq	%rdx, 600(%rcx)
	movq	792(%rsp), %rdx
	movq	%rdx, 608(%rcx)
	movq	800(%rsp), %rdx
	movq	%rdx, 616(%rcx)
	movq	808(%rsp), %rdx
	movq	%rdx, 624(%rcx)
	movq	816(%rsp), %rdx
	movq	%rdx, 632(%rcx)
	movq	824(%rsp), %rdx
	movq	%rdx, 640(%rcx)
	movq	832(%rsp), %rdx
	movq	%rdx, 648(%rcx)
	movq	840(%rsp), %rdx
	movq	%rdx, 656(%rcx)
	movq	848(%rsp), %rdx
	movq	%rdx, 664(%rcx)
	movq	856(%rsp), %rdx
	movq	%rdx, 672(%rcx)
	movq	864(%rsp), %rdx
	movq	%rdx, 680(%rcx)
	movq	872(%rsp), %rdx
	movq	%rdx, 688(%rcx)
	movq	880(%rsp), %rdx
	movq	%rdx, 696(%rcx)
	movq	888(%rsp), %rdx
	movq	%rdx, 704(%rcx)
	movq	896(%rsp), %rdx
	movq	%rdx, 712(%rcx)
	movq	904(%rsp), %rdx
	movq	%rdx, 720(%rcx)
	movq	912(%rsp), %rdx
	movq	%rdx, 728(%rcx)
	movq	920(%rsp), %rdx
	movq	%rdx, 736(%rcx)
	movq	928(%rsp), %rdx
	movq	%rdx, 744(%rcx)
	movq	936(%rsp), %rdx
	movq	%rdx, 752(%rcx)
	movq	944(%rsp), %rdx
	movq	%rdx, 760(%rcx)
	movq	952(%rsp), %rdx
	movq	%rdx, 768(%rcx)
	movq	960(%rsp), %rdx
	movq	%rdx, 776(%rcx)
	movq	968(%rsp), %rdx
	movq	%rdx, 784(%rcx)
	movq	976(%rsp), %rdx
	movq	%rdx, 792(%rcx)
	movq	984(%rsp), %rdx
	movq	%rdx, 800(%rcx)
	movq	992(%rsp), %rdx
	movq	%rdx, 808(%rcx)
	movq	1000(%rsp), %rdx
	movq	%rdx, 816(%rcx)
	movq	1008(%rsp), %rdx
	movq	%rdx, 824(%rcx)
	movq	1016(%rsp), %rdx
	movq	%rdx, 832(%rcx)
	movq	1024(%rsp), %rdx
	movq	%rdx, 840(%rcx)
	movq	1032(%rsp), %rdx
	movq	%rdx, 848(%rcx)
	movq	1040(%rsp), %rdx
	movq	%rdx, 856(%rcx)
	movq	1048(%rsp), %rdx
	movq	%rdx, 864(%rcx)
	movq	1056(%rsp), %rdx
	movq	%rdx, 872(%rcx)
	movq	1064(%rsp), %rdx
	movq	%rdx, 880(%rcx)
	movq	1072(%rsp), %rdx
	movq	%rdx, 888(%rcx)
	movq	1080(%rsp), %rdx
	movq	%rdx, 896(%rcx)
	movq	1088(%rsp), %rdx
	movq	%rdx, 904(%rcx)
	movq	1096(%rsp), %rdx
	movq	%rdx, 912(%rcx)
	movq	1104(%rsp), %rdx
	movq	%rdx, 920(%rcx)
	movq	1112(%rsp), %rdx
	movq	%rdx, 928(%rcx)
	movq	1120(%rsp), %rdx
	movq	%rdx, 936(%rcx)
	movq	1128(%rsp), %rdx
	movq	%rdx, 944(%rcx)
	movq	1136(%rsp), %rdx
	movq	%rdx, 952(%rcx)
	movq	1144(%rsp), %rdx
	movq	%rdx, 960(%rcx)
	movq	1152(%rsp), %rdx
	movq	%rdx, 968(%rcx)
	movq	1160(%rsp), %rdx
	movq	%rdx, 976(%rcx)
	movq	1168(%rsp), %rdx
	movq	%rdx, 984(%rcx)
	movq	1176(%rsp), %rdx
	movq	%rdx, 992(%rcx)
	movq	1184(%rsp), %rdx
	movq	%rdx, 1000(%rcx)
	movq	1192(%rsp), %rdx
	movq	%rdx, 1008(%rcx)
	movq	1200(%rsp), %rdx
	movq	%rdx, 1016(%rcx)
	movq	1208(%rsp), %rdx
	movq	%rdx, 1024(%rcx)
	movq	1216(%rsp), %rdx
	movq	%rdx, 1032(%rcx)
	movq	1224(%rsp), %rdx
	movq	%rdx, 1040(%rcx)
	movq	1232(%rsp), %rdx
	movq	%rdx, 1048(%rcx)
	movq	1240(%rsp), %rdx
	movq	%rdx, 1056(%rcx)
	movq	1248(%rsp), %rdx
	movq	%rdx, 1064(%rcx)
	movq	1256(%rsp), %rdx
	movq	%rdx, 1072(%rcx)
	movq	1264(%rsp), %rdx
	movq	%rdx, 1080(%rcx)
	movq	1272(%rsp), %rdx
	movq	%rdx, 1088(%rcx)
	movq	1280(%rsp), %rdx
	movq	%rdx, 1096(%rcx)
	movq	1288(%rsp), %rdx
	movq	%rdx, 1104(%rcx)
	movq	1296(%rsp), %rdx
	movq	%rdx, 1112(%rcx)
	movq	1304(%rsp), %rdx
	movq	%rdx, 1120(%rcx)
	movq	1312(%rsp), %rdx
	movq	%rdx, 1128(%rcx)
	movq	1320(%rsp), %rdx
	movq	%rdx, 1136(%rcx)
	movq	1328(%rsp), %rdx
	movq	%rdx, 1144(%rcx)
	movq	1336(%rsp), %rdx
	movq	%rdx, 1152(%rcx)
	movq	1344(%rsp), %rdx
	movq	%rdx, 1160(%rcx)
	movq	1352(%rsp), %rdx
	movq	%rdx, 1168(%rcx)
	movq	1360(%rsp), %rdx
	movq	%rdx, 1176(%rcx)
	movq	1368(%rsp), %rdx
	movq	%rdx, 1184(%rcx)
	movq	1376(%rsp), %rdx
	movq	%rdx, 1192(%rcx)
	movq	1384(%rsp), %rdx
	movq	%rdx, 1200(%rcx)
	movq	1392(%rsp), %rdx
	movq	%rdx, 1208(%rcx)
	movq	1400(%rsp), %rdx
	movq	%rdx, 1216(%rcx)
	ret
.Lwots_chains_refill_x4$1:
	movq	%r8, 8(%rsp)
	lfence
	movq	$0, %rax
	movl	$51, 1600(%rsp)
	movl	$51, 1604(%rsp)
	movl	$51, 1608(%rsp)
	movl	$51, 1612(%rsp)
	movl	$51, 1616(%rsp)
	movl	$51, 1620(%rsp)
	movl	$51, 1624(%rsp)
	movl	$51, 1628(%rsp)
	movl	$51, 1632(%rsp)
	movl	$51, 1636(%rsp)
	movl	$51, 1640(%rsp)
	movl	$51, 1644(%rsp)
	movl	$51, 1648(%rsp)
	movl	$51, 1652(%rsp)
	movl	$51, 1656(%rsp)
	movl	$51, 1660(%rsp)
	movl	$51, 1664(%rsp)
	movl	$51, 1668(%rsp)
	movl	$51, 1672(%rsp)
	movl	$51, 1676(%rsp)
	movl	$51, 1680(%rsp)
	movl	$51, 1684(%rsp)
	movl	$51, 1688(%rsp)
	movl	$51, 1692(%rsp)
	movl	$51, 1696(%rsp)
	movl	$51, 1700(%rsp)
	movl	$51, 1704(%rsp)
	movl	$51, 1708(%rsp)
	movl	$51, 1712(%rsp)
	movl	$51, 1716(%rsp)
	movl	$51, 1720(%rsp)
	movl	$51, 1724(%rsp)
	movl	$51, 1728(%rsp)
	movl	$51, 1732(%rsp)
	movl	$51, 1736(%rsp)
	movl	$51, 1740(%rsp)
	movl	$51, 1744(%rsp)
	movl	$51, 1748(%rsp)
	movl	$51, 1752(%rsp)
	movl	$51, 1756(%rsp)
	movl	$51, 1760(%rsp)
	movl	$51, 1764(%rsp)
	movl	$51, 1768(%rsp)
	movl	$51, 1772(%rsp)
	movl	$51, 1776(%rsp)
	movl	$51, 1780(%rsp)
	movl	$51, 1784(%rsp)
	movl	$51, 1788(%rsp)
	movl	$51, 1792(%rsp)
	movl	$51, 1796(%rsp)
	movl	$51, 1800(%rsp)
	movl	$51, 1804(%rsp)
	movl	$0, %r8d
	movl	$1, %r9d
	movl	(%rcx), %r10d
	movl	%r10d, 2016(%rsp)
	movl	(%rdx), %r11d
	movl	%r11d, 1808(%rsp)
	movl	%r8d, %ebx
	movl	$0, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	4(%rcx), %r10d
	movl	%r10d, 2020(%rsp)
	movl	4(%rdx), %r11d
	movl	%r11d, 1812(%rsp)
	movl	%r8d, %ebx
	movl	$1, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	8(%rcx), %r10d
	movl	%r10d, 2024(%rsp)
	movl	8(%rdx), %r11d
	movl	%r11d, 1816(%rsp)
	movl	%r8d, %ebx
	movl	$2, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	12(%rcx), %r10d
	movl	%r10d, 2028(%rsp)
	movl	12(%rdx), %r11d
	movl	%r11d, 1820(%rsp)
	movl	%r8d, %ebx
	movl	$3, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	16(%rcx), %r10d
	movl	%r10d, 2032(%rsp)
	movl	16(%rdx), %r11d
	movl	%r11d, 1824(%rsp)
	movl	%r8d, %ebx
	movl	$4, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	20(%rcx), %r10d
	movl	%r10d, 2036(%rsp)
	movl	20(%rdx), %r11d
	movl	%r11d, 1828(%rsp)
	movl	%r8d, %ebx
	movl	$5, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	24(%rcx), %r10d
	movl	%r10d, 2040(%rsp)
	movl	24(%rdx), %r11d
	movl	%r11d, 1832(%rsp)
	movl	%r8d, %ebx
	movl	$6, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	28(%rcx), %r10d
	movl	%r10d, 2044(%rsp)
	movl	28(%rdx), %r11d
	movl	%r11d, 1836(%rsp)
	movl	%r8d, %ebx
	movl	$7, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	32(%rcx), %r10d
	movl	%r10d, 2048(%rsp)
	movl	32(%rdx), %r11d
	movl	%r11d, 1840(%rsp)
	movl	%r8d, %ebx
	movl	$8, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	36(%rcx), %r10d
	movl	%r10d, 2052(%rsp)
	movl	36(%rdx), %r11d
	movl	%r11d, 1844(%rsp)
	movl	%r8d, %ebx
	movl	$9, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	40(%rcx), %r10d
	movl	%r10d, 2056(%rsp)
	movl	40(%rdx), %r11d
	movl	%r11d, 1848(%rsp)
	movl	%r8d, %ebx
	movl	$10, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	44(%rcx), %r10d
	movl	%r10d, 2060(%rsp)
	movl	44(%rdx), %r11d
	movl	%r11d, 1852(%rsp)
	movl	%r8d, %ebx
	movl	$11, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	48(%rcx), %r10d
	movl	%r10d, 2064(%rsp)
	movl	48(%rdx), %r11d
	movl	%r11d, 1856(%rsp)
	movl	%r8d, %ebx
	movl	$12, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	52(%rcx), %r10d
	movl	%r10d, 2068(%rsp)
	movl	52(%rdx), %r11d
	movl	%r11d, 1860(%rsp)
	movl	%r8d, %ebx
	movl	$13, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	56(%rcx), %r10d
	movl	%r10d, 2072(%rsp)
	movl	56(%rdx), %r11d
	movl	%r11d, 1864(%rsp)
	movl	%r8d, %ebx
	movl	$14, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	60(%rcx), %r10d
	movl	%r10d, 2076(%rsp)
	movl	60(%rdx), %r11d
	movl	%r11d, 1868(%rsp)
	movl	%r8d, %ebx
	movl	$15, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	64(%rcx), %r10d
	movl	%r10d, 2080(%rsp)
	movl	64(%rdx), %r11d
	movl	%r11d, 1872(%rsp)
	movl	%r8d, %ebx
	movl	$16, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	68(%rcx), %r10d
	movl	%r10d, 2084(%rsp)
	movl	68(%rdx), %r11d
	movl	%r11d, 1876(%rsp)
	movl	%r8d, %ebx
	movl	$17, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	72(%rcx), %r10d
	movl	%r10d, 2088(%rsp)
	movl	72(%rdx), %r11d
	movl	%r11d, 1880(%rsp)
	movl	%r8d, %ebx
	movl	$18, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	76(%rcx), %r10d
	movl	%r10d, 2092(%rsp)
	movl	76(%rdx), %r11d
	movl	%r11d, 1884(%rsp)
	movl	%r8d, %ebx
	movl	$19, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	80(%rcx), %r10d
	movl	%r10d, 2096(%rsp)
	movl	80(%rdx), %r11d
	movl	%r11d, 1888(%rsp)
	movl	%r8d, %ebx
	movl	$20, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	84(%rcx), %r10d
	movl	%r10d, 2100(%rsp)
	movl	84(%rdx), %r11d
	movl	%r11d, 1892(%rsp)
	movl	%r8d, %ebx
	movl	$21, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	88(%rcx), %r10d
	movl	%r10d, 2104(%rsp)
	movl	88(%rdx), %r11d
	movl	%r11d, 1896(%rsp)
	movl	%r8d, %ebx
	movl	$22, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	92(%rcx), %r10d
	movl	%r10d, 2108(%rsp)
	movl	92(%rdx), %r11d
	movl	%r11d, 1900(%rsp)
	movl	%r8d, %ebx
	movl	$23, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	96(%rcx), %r10d
	movl	%r10d, 2112(%rsp)
	movl	96(%rdx), %r11d
	movl	%r11d, 1904(%rsp)
	movl	%r8d, %ebx
	movl	$24, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	100(%rcx), %r10d
	movl	%r10d, 2116(%rsp)
	movl	100(%rdx), %r11d
	movl	%r11d, 1908(%rsp)
	movl	%r8d, %ebx
	movl	$25, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	104(%rcx), %r10d
	movl	%r10d, 2120(%rsp)
	movl	104(%rdx), %r11d
	movl	%r11d, 1912(%rsp)
	movl	%r8d, %ebx
	movl	$26, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	108(%rcx), %r10d
	movl	%r10d, 2124(%rsp)
	movl	108(%rdx), %r11d
	movl	%r11d, 1916(%rsp)
	movl	%r8d, %ebx
	movl	$27, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	112(%rcx), %r10d
	movl	%r10d, 2128(%rsp)
	movl	112(%rdx), %r11d
	movl	%r11d, 1920(%rsp)
	movl	%r8d, %ebx
	movl	$28, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	116(%rcx), %r10d
	movl	%r10d, 2132(%rsp)
	movl	116(%rdx), %r11d
	movl	%r11d, 1924(%rsp)
	movl	%r8d, %ebx
	movl	$29, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	120(%rcx), %r10d
	movl	%r10d, 2136(%rsp)
	movl	120(%rdx), %r11d
	movl	%r11d, 1928(%rsp)
	movl	%r8d, %ebx
	movl	$30, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	124(%rcx), %r10d
	movl	%r10d, 2140(%rsp)
	movl	124(%rdx), %r11d
	movl	%r11d, 1932(%rsp)
	movl	%r8d, %ebx
	movl	$31, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	128(%rcx), %r10d
	movl	%r10d, 2144(%rsp)
	movl	128(%rdx), %r11d
	movl	%r11d, 1936(%rsp)
	movl	%r8d, %ebx
	movl	$32, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	132(%rcx), %r10d
	movl	%r10d, 2148(%rsp)
	movl	132(%rdx), %r11d
	movl	%r11d, 1940(%rsp)
	movl	%r8d, %ebx
	movl	$33, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	136(%rcx), %r10d
	movl	%r10d, 2152(%rsp)
	movl	136(%rdx), %r11d
	movl	%r11d, 1944(%rsp)
	movl	%r8d, %ebx
	movl	$34, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	140(%rcx), %r10d
	movl	%r10d, 2156(%rsp)
	movl	140(%rdx), %r11d
	movl	%r11d, 1948(%rsp)
	movl	%r8d, %ebx
	movl	$35, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	144(%rcx), %r10d
	movl	%r10d, 2160(%rsp)
	movl	144(%rdx), %r11d
	movl	%r11d, 1952(%rsp)
	movl	%r8d, %ebx
	movl	$36, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	148(%rcx), %r10d
	movl	%r10d, 2164(%rsp)
	movl	148(%rdx), %r11d
	movl	%r11d, 1956(%rsp)
	movl	%r8d, %ebx
	movl	$37, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	152(%rcx), %r10d
	movl	%r10d, 2168(%rsp)
	movl	152(%rdx), %r11d
	movl	%r11d, 1960(%rsp)
	movl	%r8d, %ebx
	movl	$38, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	156(%rcx), %r10d
	movl	%r10d, 2172(%rsp)
	movl	156(%rdx), %r11d
	movl	%r11d, 1964(%rsp)
	movl	%r8d, %ebx
	movl	$39, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	160(%rcx), %r10d
	movl	%r10d, 2176(%rsp)
	movl	160(%rdx), %r11d
	movl	%r11d, 1968(%rsp)
	movl	%r8d, %ebx
	movl	$40, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	164(%rcx), %r10d
	movl	%r10d, 2180(%rsp)
	movl	164(%rdx), %r11d
	movl	%r11d, 1972(%rsp)
	movl	%r8d, %ebx
	movl	$41, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	168(%rcx), %r10d
	movl	%r10d, 2184(%rsp)
	movl	168(%rdx), %r11d
	movl	%r11d, 1976(%rsp)
	movl	%r8d, %ebx
	movl	$42, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	172(%rcx), %r10d
	movl	%r10d, 2188(%rsp)
	movl	172(%rdx), %r11d
	movl	%r11d, 1980(%rsp)
	movl	%r8d, %ebx
	movl	$43, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	176(%rcx), %r10d
	movl	%r10d, 2192(%rsp)
	movl	176(%rdx), %r11d
	movl	%r11d, 1984(%rsp)
	movl	%r8d, %ebx
	movl	$44, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	180(%rcx), %r10d
	movl	%r10d, 2196(%rsp)
	movl	180(%rdx), %r11d
	movl	%r11d, 1988(%rsp)
	movl	%r8d, %ebx
	movl	$45, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	184(%rcx), %r10d
	movl	%r10d, 2200(%rsp)
	movl	184(%rdx), %r11d
	movl	%r11d, 1992(%rsp)
	movl	%r8d, %ebx
	movl	$46, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	188(%rcx), %r10d
	movl	%r10d, 2204(%rsp)
	movl	188(%rdx), %r11d
	movl	%r11d, 1996(%rsp)
	movl	%r8d, %ebx
	movl	$47, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	192(%rcx), %r10d
	movl	%r10d, 2208(%rsp)
	movl	192(%rdx), %r11d
	movl	%r11d, 2000(%rsp)
	movl	%r8d, %ebx
	movl	$48, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	196(%rcx), %r10d
	movl	%r10d, 2212(%rsp)
	movl	196(%rdx), %r11d
	movl	%r11d, 2004(%rsp)
	movl	%r8d, %ebx
	movl	$49, 1600(%rsp,%rbx,4)
	movl	$0, %ebx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ebx
	addl	%ebx, %r8d
	orl 	%eax, %r8d
	movl	200(%rcx), %r10d
	movl	%r10d, 2216(%rsp)
	movl	200(%rdx), %r11d
	movl	%r11d, 2008(%rsp)
	movl	%r8d, %edx
	movl	$50, 1600(%rsp,%rdx,4)
	movl	$0, %ecx
	cmpl	%r11d, %r10d
	cmovb	%r9d, %ecx
	addl	%ecx, %r8d
	orl 	%eax, %r8d
	movl	$0, 2220(%rsp)
	movl	$0, 2012(%rsp)
	movl	%r8d, 1512(%rsp)
	movl	$0, 1516(%rsp)
	movq	8(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 264(%rsp)
	movq	8(%rcx), %rdx
	movq	%rdx, 272(%rsp)
	movq	16(%rcx), %rdx
	movq	%rdx, 280(%rsp)
	movq	24(%rcx), %rdx
	movq	%rdx, 288(%rsp)
	movq	32(%rcx), %rdx
	movq	%rdx, 296(%rsp)
	movq	40(%rcx), %rdx
	movq	%rdx, 304(%rsp)
	movq	48(%rcx), %rdx
	movq	%rdx, 312(%rsp)
	movq	56(%rcx), %rdx
	movq	%rdx, 320(%rsp)
	movq	64(%rcx), %rdx
	movq	%rdx, 328(%rsp)
	movq	72(%rcx), %rdx
	movq	%rdx, 336(%rsp)
	movq	80(%rcx), %rdx
	movq	%rdx, 344(%rsp)
	movq	88(%rcx), %rdx
	movq	%rdx, 352(%rsp)
	movq	96(%rcx), %rdx
	movq	%rdx, 360(%rsp)
	movq	104(%rcx), %rdx
	movq	%rdx, 368(%rsp)
	movq	112(%rcx), %rdx
	movq	%rdx, 376(%rsp)
	movq	120(%rcx), %rdx
	movq	%rdx, 384(%rsp)
	movq	128(%rcx), %rdx
	movq	%rdx, 392(%rsp)
	movq	136(%rcx), %rdx
	movq	%rdx, 400(%rsp)
	movq	144(%rcx), %rdx
	movq	%rdx, 408(%rsp)
	movq	152(%rcx), %rdx
	movq	%rdx, 416(%rsp)
	movq	160(%rcx), %rdx
	movq	%rdx, 424(%rsp)
	movq	168(%rcx), %rdx
	movq	%rdx, 432(%rsp)
	movq	176(%rcx), %rdx
	movq	%rdx, 440(%rsp)
	movq	184(%rcx), %rdx
	movq	%rdx, 448(%rsp)
	movq	192(%rcx), %rdx
	movq	%rdx, 456(%rsp)
	movq	200(%rcx), %rdx
	movq	%rdx, 464(%rsp)
	movq	208(%rcx), %rdx
	movq	%rdx, 472(%rsp)
	movq	216(%rcx), %rdx
	movq	%rdx, 480(%rsp)
	movq	224(%rcx), %rdx
	movq	%rdx, 488(%rsp)
	movq	232(%rcx), %rdx
	movq	%rdx, 496(%rsp)
	movq	240(%rcx), %rdx
	movq	%rdx, 504(%rsp)
	movq	248(%rcx), %rdx
	movq	%rdx, 512(%rsp)
	movq	256(%rcx), %rdx
	movq	%rdx, 520(%rsp)
	movq	264(%rcx), %rdx
	movq	%rdx, 528(%rsp)
	movq	272(%rcx), %rdx
	movq	%rdx, 536(%rsp)
	movq	280(%rcx), %rdx
	movq	%rdx, 544(%rsp)
	movq	288(%rcx), %rdx
	movq	%rdx, 552(%rsp)
	movq	296(%rcx), %rdx
	movq	%rdx, 560(%rsp)
	movq	304(%rcx), %rdx
	movq	%rdx, 568(%rsp)
	movq	312(%rcx), %rdx
	movq	%rdx, 576(%rsp)
	movq	320(%rcx), %rdx
	movq	%rdx, 584(%rsp)
	movq	328(%rcx), %rdx
	movq	%rdx, 592(%rsp)
	movq	336(%rcx), %rdx
	movq	%rdx, 600(%rsp)
	movq	344(%rcx), %rdx
	movq	%rdx, 608(%rsp)
	movq	352(%rcx), %rdx
	movq	%rdx, 616(%rsp)
	movq	360(%rcx), %rdx
	movq	%rdx, 624(%rsp)
	movq	368(%rcx), %rdx
	movq	%rdx, 632(%rsp)
	movq	376(%rcx), %rdx
	movq	%rdx, 640(%rsp)
	movq	384(%rcx), %rdx
	movq	%rdx, 648(%rsp)
	movq	392(%rcx), %rdx
	movq	%rdx, 656(%rsp)
	movq	400(%rcx), %rdx
	movq	%rdx, 664(%rsp)
	movq	408(%rcx), %rdx
	movq	%rdx, 672(%rsp)
	movq	416(%rcx), %rdx
	movq	%rdx, 680(%rsp)
	movq	424(%rcx), %rdx
	movq	%rdx, 688(%rsp)
	movq	432(%rcx), %rdx
	movq	%rdx, 696(%rsp)
	movq	440(%rcx), %rdx
	movq	%rdx, 704(%rsp)
	movq	448(%rcx), %rdx
	movq	%rdx, 712(%rsp)
	movq	456(%rcx), %rdx
	movq	%rdx, 720(%rsp)
	movq	464(%rcx), %rdx
	movq	%rdx, 728(%rsp)
	movq	472(%rcx), %rdx
	movq	%rdx, 736(%rsp)
	movq	480(%rcx), %rdx
	movq	%rdx, 744(%rsp)
	movq	488(%rcx), %rdx
	movq	%rdx, 752(%rsp)
	movq	496(%rcx), %rdx
	movq	%rdx, 760(%rsp)
	movq	504(%rcx), %rdx
	movq	%rdx, 768(%rsp)
	movq	512(%rcx), %rdx
	movq	%rdx, 776(%rsp)
	movq	520(%rcx), %rdx
	movq	%rdx, 784(%rsp)
	movq	528(%rcx), %rdx
	movq	%rdx, 792(%rsp)
	movq	536(%rcx), %rdx
	movq	%rdx, 800(%rsp)
	movq	544(%rcx), %rdx
	movq	%rdx, 808(%rsp)
	movq	552(%rcx), %rdx
	movq	%rdx, 816(%rsp)
	movq	560(%rcx), %rdx
	movq	%rdx, 824(%rsp)
	movq	568(%rcx), %rdx
	movq	%rdx, 832(%rsp)
	movq	576(%rcx), %rdx
	movq	%rdx, 840(%rsp)
	movq	584(%rcx), %rdx
	movq	%rdx, 848(%rsp)
	movq	592(%rcx), %rdx
	movq	%rdx, 856(%rsp)
	movq	600(%rcx), %rdx
	movq	%rdx, 864(%rsp)
	movq	608(%rcx), %rdx
	movq	%rdx, 872(%rsp)
	movq	616(%rcx), %rdx
	movq	%rdx, 880(%rsp)
	movq	624(%rcx), %rdx
	movq	%rdx, 888(%rsp)
	movq	632(%rcx), %rdx
	movq	%rdx, 896(%rsp)
	movq	640(%rcx), %rdx
	movq	%rdx, 904(%rsp)
	movq	648(%rcx), %rdx
	movq	%rdx, 912(%rsp)
	movq	656(%rcx), %rdx
	movq	%rdx, 920(%rsp)
	movq	664(%rcx), %rdx
	movq	%rdx, 928(%rsp)
	movq	672(%rcx), %rdx
	movq	%rdx, 936(%rsp)
	movq	680(%rcx), %rdx
	movq	%rdx, 944(%rsp)
	movq	688(%rcx), %rdx
	movq	%rdx, 952(%rsp)
	movq	696(%rcx), %rdx
	movq	%rdx, 960(%rsp)
	movq	704(%rcx), %rdx
	movq	%rdx, 968(%rsp)
	movq	712(%rcx), %rdx
	movq	%rdx, 976(%rsp)
	movq	720(%rcx), %rdx
	movq	%rdx, 984(%rsp)
	movq	728(%rcx), %rdx
	movq	%rdx, 992(%rsp)
	movq	736(%rcx), %rdx
	movq	%rdx, 1000(%rsp)
	movq	744(%rcx), %rdx
	movq	%rdx, 1008(%rsp)
	movq	752(%rcx), %rdx
	movq	%rdx, 1016(%rsp)
	movq	760(%rcx), %rdx
	movq	%rdx, 1024(%rsp)
	movq	768(%rcx), %rdx
	movq	%rdx, 1032(%rsp)
	movq	776(%rcx), %rdx
	movq	%rdx, 1040(%rsp)
	movq	784(%rcx), %rdx
	movq	%rdx, 1048(%rsp)
	movq	792(%rcx), %rdx
	movq	%rdx, 1056(%rsp)
	movq	800(%rcx), %rdx
	movq	%rdx, 1064(%rsp)
	movq	808(%rcx), %rdx
	movq	%rdx, 1072(%rsp)
	movq	816(%rcx), %rdx
	movq	%rdx, 1080(%rsp)
	movq	824(%rcx), %rdx
	movq	%rdx, 1088(%rsp)
	movq	832(%rcx), %rdx
	movq	%rdx, 1096(%rsp)
	movq	840(%rcx), %rdx
	movq	%rdx, 1104(%rsp)
	movq	848(%rcx), %rdx
	movq	%rdx, 1112(%rsp)
	movq	856(%rcx), %rdx
	movq	%rdx, 1120(%rsp)
	movq	864(%rcx), %rdx
	movq	%rdx, 1128(%rsp)
	movq	872(%rcx), %rdx
	movq	%rdx, 1136(%rsp)
	movq	880(%rcx), %rdx
	movq	%rdx, 1144(%rsp)
	movq	888(%rcx), %rdx
	movq	%rdx, 1152(%rsp)
	movq	896(%rcx), %rdx
	movq	%rdx, 1160(%rsp)
	movq	904(%rcx), %rdx
	movq	%rdx, 1168(%rsp)
	movq	912(%rcx), %rdx
	movq	%rdx, 1176(%rsp)
	movq	920(%rcx), %rdx
	movq	%rdx, 1184(%rsp)
	movq	928(%rcx), %rdx
	movq	%rdx, 1192(%rsp)
	movq	936(%rcx), %rdx
	movq	%rdx, 1200(%rsp)
	movq	944(%rcx), %rdx
	movq	%rdx, 1208(%rsp)
	movq	952(%rcx), %rdx
	movq	%rdx, 1216(%rsp)
	movq	960(%rcx), %rdx
	movq	%rdx, 1224(%rsp)
	movq	968(%rcx), %rdx
	movq	%rdx, 1232(%rsp)
	movq	976(%rcx), %rdx
	movq	%rdx, 1240(%rsp)
	movq	984(%rcx), %rdx
	movq	%rdx, 1248(%rsp)
	movq	992(%rcx), %rdx
	movq	%rdx, 1256(%rsp)
	movq	1000(%rcx), %rdx
	movq	%rdx, 1264(%rsp)
	movq	1008(%rcx), %rdx
	movq	%rdx, 1272(%rsp)
	movq	1016(%rcx), %rdx
	movq	%rdx, 1280(%rsp)
	movq	1024(%rcx), %rdx
	movq	%rdx, 1288(%rsp)
	movq	1032(%rcx), %rdx
	movq	%rdx, 1296(%rsp)
	movq	1040(%rcx), %rdx
	movq	%rdx, 1304(%rsp)
	movq	1048(%rcx), %rdx
	movq	%rdx, 1312(%rsp)
	movq	1056(%rcx), %rdx
	movq	%rdx, 1320(%rsp)
	movq	1064(%rcx), %rdx
	movq	%rdx, 1328(%rsp)
	movq	1072(%rcx), %rdx
	movq	%rdx, 1336(%rsp)
	movq	1080(%rcx), %rdx
	movq	%rdx, 1344(%rsp)
	movq	1088(%rcx), %rdx
	movq	%rdx, 1352(%rsp)
	movq	1096(%rcx), %rdx
	movq	%rdx, 1360(%rsp)
	movq	1104(%rcx), %rdx
	movq	%rdx, 1368(%rsp)
	movq	1112(%rcx), %rdx
	movq	%rdx, 1376(%rsp)
	movq	1120(%rcx), %rdx
	movq	%rdx, 1384(%rsp)
	movq	1128(%rcx), %rdx
	movq	%rdx, 1392(%rsp)
	movq	1136(%rcx), %rdx
	movq	%rdx, 1400(%rsp)
	movq	1144(%rcx), %rdx
	movq	%rdx, 1408(%rsp)
	movq	1152(%rcx), %rdx
	movq	%rdx, 1416(%rsp)
	movq	1160(%rcx), %rdx
	movq	%rdx, 1424(%rsp)
	movq	1168(%rcx), %rdx
	movq	%rdx, 1432(%rsp)
	movq	1176(%rcx), %rdx
	movq	%rdx, 1440(%rsp)
	movq	1184(%rcx), %rdx
	movq	%rdx, 1448(%rsp)
	movq	1192(%rcx), %rdx
	movq	%rdx, 1456(%rsp)
	movq	1200(%rcx), %rdx
	movq	%rdx, 1464(%rsp)
	movq	1208(%rcx), %rdx
	movq	%rdx, 1472(%rsp)
	movq	1216(%rcx), %rdx
	movq	%rdx, 1480(%rsp)
	movq	$0, 1488(%rsp)
	movq	$0, 1496(%rsp)
	movq	$0, 1504(%rsp)
	movl	$0, 1552(%rsp)
	movl	$0, 1536(%rsp)
	movl	$51, 1520(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 176(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 184(%rsp)
	movq	$0, 88(%rsp)
	movl	$0, 1556(%rsp)
	movl	$0, 1540(%rsp)
	movl	$51, 1524(%rsp)
	movq	$0, 192(%rsp)
	movq	$0, 96(%rsp)
	movq	$0, 200(%rsp)
	movq	$0, 104(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 112(%rsp)
	movl	$0, 1560(%rsp)
	movl	$0, 1544(%rsp)
	movl	$51, 1528(%rsp)
	movq	$0, 216(%rsp)
	movq	$0, 120(%rsp)
	movq	$0, 224(%rsp)
	movq	$0, 128(%rsp)
	movq	$0, 232(%rsp)
	movq	$0, 136(%rsp)
	movl	$0, 1564(%rsp)
	movl	$0, 1548(%rsp)
	movl	$51, 1532(%rsp)
	movq	$0, 240(%rsp)
	movq	$0, 144(%rsp)
	movq	$0, 248(%rsp)
	movq	$0, 152(%rsp)
	movq	$0, 256(%rsp)
	movq	$0, 160(%rsp)
	leaq	16(%rsp), %rcx
	movb	(%rsi), %dl
	movb	%dl, (%rcx)
	movb	1(%rsi), %dl
	movb	%dl, 1(%rcx)
	movb	2(%rsi), %dl
	movb	%dl, 2(%rcx)
	movb	3(%rsi), %dl
	movb	%dl, 3(%rcx)
	movb	4(%rsi), %dl
	movb	%dl, 4(%rcx)
	movb	5(%rsi), %dl
	movb	%dl, 5(%rcx)
	movb	6(%rsi), %dl
	movb	%dl, 6(%rcx)
	movb	7(%rsi), %dl
	movb	%dl, 7(%rcx)
	movb	8(%rsi), %dl
	movb	%dl, 8(%rcx)
	movb	9(%rsi), %dl
	movb	%dl, 9(%rcx)
	movb	10(%rsi), %dl
	movb	%dl, 10(%rcx)
	movb	11(%rsi), %dl
	movb	%dl, 11(%rcx)
	movb	12(%rsi), %dl
	movb	%dl, 12(%rcx)
	movb	13(%rsi), %dl
	movb	%dl, 13(%rcx)
	movb	14(%rsi), %dl
	movb	%dl, 14(%rcx)
	movb	15(%rsi), %dl
	movb	%dl, 15(%rcx)
	movb	16(%rsi), %dl
	movb	%dl, 16(%rcx)
	movb	17(%rsi), %dl
	movb	%dl, 17(%rcx)
	movb	18(%rsi), %dl
	movb	%dl, 18(%rcx)
	movb	19(%rsi), %dl
	movb	%dl, 19(%rcx)
	movb	20(%rsi), %dl
	movb	%dl, 20(%rcx)
	movb	21(%rsi), %dl
	movb	%dl, 21(%rcx)
	movb	22(%rsi), %dl
	movb	%dl, 22(%rcx)
	movb	23(%rsi), %dl
	movb	%dl, 23(%rcx)
	leaq	40(%rsp), %rcx
	movq	(%rdi), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rdi), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rdi), %rdx
	movq	%rdx, 24(%rcx)
	jmp 	.Lwots_chains_refill_x4$2
.Lwots_chains_refill_x4$3:
	movl	1520(%rsp), %eax
	movl	%eax, 1568(%rsp)
	movl	1552(%rsp), %eax
	movl	%eax, 1572(%rsp)
	movl	1524(%rsp), %eax
	movl	%eax, 1576(%rsp)
	movl	1556(%rsp), %eax
	movl	%eax, 1580(%rsp)
	movl	1528(%rsp), %eax
	movl	%eax, 1584(%rsp)
	movl	1560(%rsp), %eax
	movl	%eax, 1588(%rsp)
	movl	1532(%rsp), %eax
	movl	%eax, 1592(%rsp)
	movl	1564(%rsp), %eax
	movl	%eax, 1596(%rsp)
	leaq	72(%rsp), %rdi
	leaq	168(%rsp), %rdx
	leaq	16(%rsp), %rsi
	leaq	40(%rsp), %r9
	leaq	1568(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lwots_chains_refill_x4$4:
	leaq	824(%rsp), %rsp
	lfence
	movq	$0, %rax
.Lwots_chains_refill_x4$2:
	movl	1516(%rsp), %ecx
	movl	1512(%rsp), %edx
	movl	$0, %esi
	movl	$1, %edi
	movl	1552(%rsp), %r8d
	movl	1536(%rsp), %r9d
	movl	1520(%rsp), %r10d
	orl 	%eax, %r10d
	movq	168(%rsp), %r11
	movq	72(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 168(%rsp)
	movq	176(%rsp), %r11
	movq	80(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 176(%rsp)
	movq	184(%rsp), %r11
	movq	88(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 184(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$24, %r11, %r11
	movq	168(%rsp), %rbx
	movq	%rbx, 264(%rsp,%r11)
	movq	176(%rsp), %rbx
	movq	%rbx, 272(%rsp,%r11)
	movq	184(%rsp), %rbx
	movq	%rbx, 280(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %ebx
	movl	1600(%rsp,%rbx,4), %ebx
	orl 	%eax, %ebx
	cmpl	$0, %r11d
	cmovne	%ebx, %r10d
	movl	%ebx, %ebp
	movl	2016(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1808(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%ebx, %ebx
	imulq	$24, %rbx, %rbx
	movq	168(%rsp), %rbp
	movq	264(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 168(%rsp)
	movq	176(%rsp), %rbp
	movq	272(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 176(%rsp)
	movq	184(%rsp), %rbp
	movq	280(%rsp,%rbx), %rbx
	cmpl	$0, %r11d
	cmovne	%rbx, %rbp
	movq	%rbp, 184(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 1552(%rsp)
	movl	%r9d, 1536(%rsp)
	movl	%r10d, 1520(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	1556(%rsp), %r8d
	movl	1540(%rsp), %r9d
	movl	1524(%rsp), %r10d
	orl 	%eax, %r10d
	movq	192(%rsp), %r11
	movq	96(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 192(%rsp)
	movq	200(%rsp), %r11
	movq	104(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 200(%rsp)
	movq	208(%rsp), %r11
	movq	112(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 208(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$24, %r11, %r11
	movq	192(%rsp), %rbx
	movq	%rbx, 264(%rsp,%r11)
	movq	200(%rsp), %rbx
	movq	%rbx, 272(%rsp,%r11)
	movq	208(%rsp), %rbx
	movq	%rbx, 280(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %ebx
	movl	1600(%rsp,%rbx,4), %ebx
	orl 	%eax, %ebx
	cmpl	$0, %r11d
	cmovne	%ebx, %r10d
	movl	%ebx, %ebp
	movl	2016(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1808(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%ebx, %ebx
	imulq	$24, %rbx, %rbx
	movq	192(%rsp), %rbp
	movq	264(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 192(%rsp)
	movq	200(%rsp), %rbp
	movq	272(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 200(%rsp)
	movq	208(%rsp), %rbp
	movq	280(%rsp,%rbx), %rbx
	cmpl	$0, %r11d
	cmovne	%rbx, %rbp
	movq	%rbp, 208(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 1556(%rsp)
	movl	%r9d, 1540(%rsp)
	movl	%r10d, 1524(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	1560(%rsp), %r8d
	movl	1544(%rsp), %r9d
	movl	1528(%rsp), %r10d
	orl 	%eax, %r10d
	movq	216(%rsp), %r11
	movq	120(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 216(%rsp)
	movq	224(%rsp), %r11
	movq	128(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 224(%rsp)
	movq	232(%rsp), %r11
	movq	136(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 232(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$24, %r11, %r11
	movq	216(%rsp), %rbx
	movq	%rbx, 264(%rsp,%r11)
	movq	224(%rsp), %rbx
	movq	%rbx, 272(%rsp,%r11)
	movq	232(%rsp), %rbx
	movq	%rbx, 280(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %ebx
	movl	1600(%rsp,%rbx,4), %ebx
	orl 	%eax, %ebx
	cmpl	$0, %r11d
	cmovne	%ebx, %r10d
	movl	%ebx, %ebp
	movl	2016(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1808(%rsp,%rbp,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%ebx, %ebx
	imulq	$24, %rbx, %rbx
	movq	216(%rsp), %rbp
	movq	264(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 216(%rsp)
	movq	224(%rsp), %rbp
	movq	272(%rsp,%rbx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbp
	movq	%rbp, 224(%rsp)
	movq	232(%rsp), %rbp
	movq	280(%rsp,%rbx), %rbx
	cmpl	$0, %r11d
	cmovne	%rbx, %rbp
	movq	%rbp, 232(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 1560(%rsp)
	movl	%r9d, 1544(%rsp)
	movl	%r10d, 1528(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	1564(%rsp), %r8d
	movl	1548(%rsp), %r9d
	movl	1532(%rsp), %r10d
	orl 	%eax, %r10d
	movq	240(%rsp), %r11
	movq	144(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 240(%rsp)
	movq	248(%rsp), %r11
	movq	152(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 248(%rsp)
	movq	256(%rsp), %r11
	movq	160(%rsp), %rbx
	cmpl	%r9d, %r8d
	cmovb	%rbx, %r11
	movq	%r11, 256(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %r8d
	movl	%r10d, %r11d
	imulq	$24, %r11, %r11
	movq	240(%rsp), %rbx
	movq	%rbx, 264(%rsp,%r11)
	movq	248(%rsp), %rbx
	movq	%rbx, 272(%rsp,%r11)
	movq	256(%rsp), %rbx
	movq	%rbx, 280(%rsp,%r11)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmove	%edi, %r11d
	movl	$0, %ebx
	cmpl	%edx, %ecx
	cmovb	%edi, %ebx
	andl	%ebx, %r11d
	orl 	%eax, %ecx
	movl	%ecx, %edx
	movl	1600(%rsp,%rdx,4), %edx
	orl 	%eax, %edx
	cmpl	$0, %r11d
	cmovne	%edx, %r10d
	movl	%edx, %ebx
	movl	2016(%rsp,%rbx,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r8d
	movl	1808(%rsp,%rbx,4), %r12d
	cmpl	$0, %r11d
	cmovne	%r12d, %r9d
	movl	%edx, %edx
	imulq	$24, %rdx, %rdx
	movq	240(%rsp), %rbx
	movq	264(%rsp,%rdx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbx
	movq	%rbx, 240(%rsp)
	movq	248(%rsp), %rbx
	movq	272(%rsp,%rdx), %r12
	cmpl	$0, %r11d
	cmovne	%r12, %rbx
	movq	%rbx, 248(%rsp)
	movq	256(%rsp), %rbx
	movq	280(%rsp,%rdx), %rdx
	cmpl	$0, %r11d
	cmovne	%rdx, %rbx
	movq	%rbx, 256(%rsp)
	addl	%r11d, %ecx
	movl	%r8d, 1564(%rsp)
	movl	%r9d, 1548(%rsp)
	movl	%r10d, 1532(%rsp)
	movl	$0, %r11d
	cmpl	%r9d, %r8d
	cmovb	%edi, %r11d
	addl	%r11d, %esi
	movl	%ecx, 1516(%rsp)
	orl 	%eax, %esi
	cmpl	$0, %esi
	jne 	.Lwots_chains_refill_x4$3
	movq	8(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	264(%rsp), %rdx
	movq	%rdx, (%rcx)
	movq	272(%rsp), %rdx
	movq	%rdx, 8(%rcx)
	movq	280(%rsp), %rdx
	movq	%rdx, 16(%rcx)
	movq	288(%rsp), %rdx
	movq	%rdx, 24(%rcx)
	movq	296(%rsp), %rdx
	movq	%rdx, 32(%rcx)
	movq	304(%rsp), %rdx
	movq	%rdx, 40(%rcx)
	movq	312(%rsp), %rdx
	movq	%rdx, 48(%rcx)
	movq	320(%rsp), %rdx
	movq	%rdx, 56(%rcx)
	movq	328(%rsp), %rdx
	movq	%rdx, 64(%rcx)
	movq	336(%rsp), %rdx
	movq	%rdx, 72(%rcx)
	movq	344(%rsp), %rdx
	movq	%rdx, 80(%rcx)
	movq	352(%rsp), %rdx
	movq	%rdx, 88(%rcx)
	movq	360(%rsp), %rdx
	movq	%rdx, 96(%rcx)
	movq	368(%rsp), %rdx
	movq	%rdx, 104(%rcx)
	movq	376(%rsp), %rdx
	movq	%rdx, 112(%rcx)
	movq	384(%rsp), %rdx
	movq	%rdx, 120(%rcx)
	movq	392(%rsp), %rdx
	movq	%rdx, 128(%rcx)
	movq	400(%rsp), %rdx
	movq	%rdx, 136(%rcx)
	movq	408(%rsp), %rdx
	movq	%rdx, 144(%rcx)
	movq	416(%rsp), %rdx
	movq	%rdx, 152(%rcx)
	movq	424(%rsp), %rdx
	movq	%rdx, 160(%rcx)
	movq	432(%rsp), %rdx
	movq	%rdx, 168(%rcx)
	movq	440(%rsp), %rdx
	movq	%rdx, 176(%rcx)
	movq	448(%rsp), %rdx
	movq	%rdx, 184(%rcx)
	movq	456(%rsp), %rdx
	movq	%rdx, 192(%rcx)
	movq	464(%rsp), %rdx
	movq	%rdx, 200(%rcx)
	movq	472(%rsp), %rdx
	movq	%rdx, 208(%rcx)
	movq	480(%rsp), %rdx
	movq	%rdx, 216(%rcx)
	movq	488(%rsp), %rdx
	movq	%rdx, 224(%rcx)
	movq	496(%rsp), %rdx
	movq	%rdx, 232(%rcx)
	movq	504(%rsp), %rdx
	movq	%rdx, 240(%rcx)
	movq	512(%rsp), %rdx
	movq	%rdx, 248(%rcx)
	movq	520(%rsp), %rdx
	movq	%rdx, 256(%rcx)
	movq	528(%rsp), %rdx
	movq	%rdx, 264(%rcx)
	movq	536(%rsp), %rdx
	movq	%rdx, 272(%rcx)
	movq	544(%rsp), %rdx
	movq	%rdx, 280(%rcx)
	movq	552(%rsp), %rdx
	movq	%rdx, 288(%rcx)
	movq	560(%rsp), %rdx
	movq	%rdx, 296(%rcx)
	movq	568(%rsp), %rdx
	movq	%rdx, 304(%rcx)
	movq	576(%rsp), %rdx
	movq	%rdx, 312(%rcx)
	movq	584(%rsp), %rdx
	movq	%rdx, 320(%rcx)
	movq	592(%rsp), %rdx
	movq	%rdx, 328(%rcx)
	movq	600(%rsp), %rdx
	movq	%rdx, 336(%rcx)
	movq	608(%rsp), %rdx
	movq	%rdx, 344(%rcx)
	movq	616(%rsp), %rdx
	movq	%rdx, 352(%rcx)
	movq	624(%rsp), %rdx
	movq	%rdx, 360(%rcx)
	movq	632(%rsp), %rdx
	movq	%rdx, 368(%rcx)
	movq	640(%rsp), %rdx
	movq	%rdx, 376(%rcx)
	movq	648(%rsp), %rdx
	movq	%rdx, 384(%rcx)
	movq	656(%rsp), %rdx
	movq	%rdx, 392(%rcx)
	movq	664(%rsp), %rdx
	movq	%rdx, 400(%rcx)
	movq	672(%rsp), %rdx
	movq	%rdx, 408(%rcx)
	movq	680(%rsp), %rdx
	movq	%rdx, 416(%rcx)
	movq	688(%rsp), %rdx
	movq	%rdx, 424(%rcx)
	movq	696(%rsp), %rdx
	movq	%rdx, 432(%rcx)
	movq	704(%rsp), %rdx
	movq	%rdx, 440(%rcx)
	movq	712(%rsp), %rdx
	movq	%rdx, 448(%rcx)
	movq	720(%rsp), %rdx
	movq	%rdx, 456(%rcx)
	movq	728(%rsp), %rdx
	movq	%rdx, 464(%rcx)
	movq	736(%rsp), %rdx
	movq	%rdx, 472(%rcx)
	movq	744(%rsp), %rdx
	movq	%rdx, 480(%rcx)
	movq	752(%rsp), %rdx
	movq	%rdx, 488(%rcx)
	movq	760(%rsp), %rdx
	movq	%rdx, 496(%rcx)
	movq	768(%rsp), %rdx
	movq	%rdx, 504(%rcx)
	movq	776(%rsp), %rdx
	movq	%rdx, 512(%rcx)
	movq	784(%rsp), %rdx
	movq	%rdx, 520(%rcx)
	movq	792(%rsp), %rdx
	movq	%rdx, 528(%rcx)
	movq	800(%rsp), %rdx
	movq	%rdx, 536(%rcx)
	movq	808(%rsp), %rdx
	movq	%rdx, 544(%rcx)
	movq	816(%rsp), %rdx
	movq	%rdx, 552(%rcx)
	movq	824(%rsp), %rdx
	movq	%rdx, 560(%rcx)
	movq	832(%rsp), %rdx
	movq	%rdx, 568(%rcx)
	movq	840(%rsp), %rdx
	movq	%rdx, 576(%rcx)
	movq	848(%rsp), %rdx
	movq	%rdx, 584(%rcx)
	movq	856(%rsp), %rdx
	movq	%rdx, 592(%rcx)
	movq	864(%rsp), %rdx
	movq	%rdx, 600(%rcx)
	movq	872(%rsp), %rdx
	movq	%rdx, 608(%rcx)
	movq	880(%rsp), %rdx
	movq	%rdx, 616(%rcx)
	movq	888(%rsp), %rdx
	movq	%rdx, 624(%rcx)
	movq	896(%rsp), %rdx
	movq	%rdx, 632(%rcx)
	movq	904(%rsp), %rdx
	movq	%rdx, 640(%rcx)
	movq	912(%rsp), %rdx
	movq	%rdx, 648(%rcx)
	movq	920(%rsp), %rdx
	movq	%rdx, 656(%rcx)
	movq	928(%rsp), %rdx
	movq	%rdx, 664(%rcx)
	movq	936(%rsp), %rdx
	movq	%rdx, 672(%rcx)
	movq	944(%rsp), %rdx
	movq	%rdx, 680(%rcx)
	movq	952(%rsp), %rdx
	movq	%rdx, 688(%rcx)
	movq	960(%rsp), %rdx
	movq	%rdx, 696(%rcx)
	movq	968(%rsp), %rdx
	movq	%rdx, 704(%rcx)
	movq	976(%rsp), %rdx
	movq	%rdx, 712(%rcx)
	movq	984(%rsp), %rdx
	movq	%rdx, 720(%rcx)
	movq	992(%rsp), %rdx
	movq	%rdx, 728(%rcx)
	movq	1000(%rsp), %rdx
	movq	%rdx, 736(%rcx)
	movq	1008(%rsp), %rdx
	movq	%rdx, 744(%rcx)
	movq	1016(%rsp), %rdx
	movq	%rdx, 752(%rcx)
	movq	1024(%rsp), %rdx
	movq	%rdx, 760(%rcx)
	movq	1032(%rsp), %rdx
	movq	%rdx, 768(%rcx)
	movq	1040(%rsp), %rdx
	movq	%rdx, 776(%rcx)
	movq	1048(%rsp), %rdx
	movq	%rdx, 784(%rcx)
	movq	1056(%rsp), %rdx
	movq	%rdx, 792(%rcx)
	movq	1064(%rsp), %rdx
	movq	%rdx, 800(%rcx)
	movq	1072(%rsp), %rdx
	movq	%rdx, 808(%rcx)
	movq	1080(%rsp), %rdx
	movq	%rdx, 816(%rcx)
	movq	1088(%rsp), %rdx
	movq	%rdx, 824(%rcx)
	movq	1096(%rsp), %rdx
	movq	%rdx, 832(%rcx)
	movq	1104(%rsp), %rdx
	movq	%rdx, 840(%rcx)
	movq	1112(%rsp), %rdx
	movq	%rdx, 848(%rcx)
	movq	1120(%rsp), %rdx
	movq	%rdx, 856(%rcx)
	movq	1128(%rsp), %rdx
	movq	%rdx, 864(%rcx)
	movq	1136(%rsp), %rdx
	movq	%rdx, 872(%rcx)
	movq	1144(%rsp), %rdx
	movq	%rdx, 880(%rcx)
	movq	1152(%rsp), %rdx
	movq	%rdx, 888(%rcx)
	movq	1160(%rsp), %rdx
	movq	%rdx, 896(%rcx)
	movq	1168(%rsp), %rdx
	movq	%rdx, 904(%rcx)
	movq	1176(%rsp), %rdx
	movq	%rdx, 912(%rcx)
	movq	1184(%rsp), %rdx
	movq	%rdx, 920(%rcx)
	movq	1192(%rsp), %rdx
	movq	%rdx, 928(%rcx)
	movq	1200(%rsp), %rdx
	movq	%rdx, 936(%rcx)
	movq	1208(%rsp), %rdx
	movq	%rdx, 944(%rcx)
	movq	1216(%rsp), %rdx
	movq	%rdx, 952(%rcx)
	movq	1224(%rsp), %rdx
	movq	%rdx, 960(%rcx)
	movq	1232(%rsp), %rdx
	movq	%rdx, 968(%rcx)
	movq	1240(%rsp), %rdx
	movq	%rdx, 976(%rcx)
	movq	1248(%rsp), %rdx
	movq	%rdx, 984(%rcx)
	movq	1256(%rsp), %rdx
	movq	%rdx, 992(%rcx)
	movq	1264(%rsp), %rdx
	movq	%rdx, 1000(%rcx)
	movq	1272(%rsp), %rdx
	movq	%rdx, 1008(%rcx)
	movq	1280(%rsp), %rdx
	movq	%rdx, 1016(%rcx)
	movq	1288(%rsp), %rdx
	movq	%rdx, 1024(%rcx)
	movq	1296(%rsp), %rdx
	movq	%rdx, 1032(%rcx)
	movq	1304(%rsp), %rdx
	movq	%rdx, 1040(%rcx)
	movq	1312(%rsp), %rdx
	movq	%rdx, 1048(%rcx)
	movq	1320(%rsp), %rdx
	movq	%rdx, 1056(%rcx)
	movq	1328(%rsp), %rdx
	movq	%rdx, 1064(%rcx)
	movq	1336(%rsp), %rdx
	movq	%rdx, 1072(%rcx)
	movq	1344(%rsp), %rdx
	movq	%rdx, 1080(%rcx)
	movq	1352(%rsp), %rdx
	movq	%rdx, 1088(%rcx)
	movq	1360(%rsp), %rdx
	movq	%rdx, 1096(%rcx)
	movq	1368(%rsp), %rdx
	movq	%rdx, 1104(%rcx)
	movq	1376(%rsp), %rdx
	movq	%rdx, 1112(%rcx)
	movq	1384(%rsp), %rdx
	movq	%rdx, 1120(%rcx)
	movq	1392(%rsp), %rdx
	movq	%rdx, 1128(%rcx)
	movq	1400(%rsp), %rdx
	movq	%rdx, 1136(%rcx)
	movq	1408(%rsp), %rdx
	movq	%rdx, 1144(%rcx)
	movq	1416(%rsp), %rdx
	movq	%rdx, 1152(%rcx)
	movq	1424(%rsp), %rdx
	movq	%rdx, 1160(%rcx)
	movq	1432(%rsp), %rdx
	movq	%rdx, 1168(%rcx)
	movq	1440(%rsp), %rdx
	movq	%rdx, 1176(%rcx)
	movq	1448(%rsp), %rdx
	movq	%rdx, 1184(%rcx)
	movq	1456(%rsp), %rdx
	movq	%rdx, 1192(%rcx)
	movq	1464(%rsp), %rdx
	movq	%rdx, 1200(%rcx)
	movq	1472(%rsp), %rdx
	movq	%rdx, 1208(%rcx)
	movq	1480(%rsp), %rdx
	movq	%rdx, 1216(%rcx)
	ret
.Lwots_chains_x4$1:
	movq	%r9, 8(%rsp)
	leaq	32(%rsp), %r9
	movb	(%rsi), %r8b
	movb	%r8b, (%r9)
	movb	1(%rsi), %r8b
	movb	%r8b, 1(%r9)
	movb	2(%rsi), %r8b
	movb	%r8b, 2(%r9)
	movb	3(%rsi), %r8b
	movb	%r8b, 3(%r9)
	movb	4(%rsi), %r8b
	movb	%r8b, 4(%r9)
	movb	5(%rsi), %r8b
	movb	%r8b, 5(%r9)
	movb	6(%rsi), %r8b
	movb	%r8b, 6(%r9)
	movb	7(%rsi), %r8b
	movb	%r8b, 7(%r9)
	movb	8(%rsi), %r8b
	movb	%r8b, 8(%r9)
	movb	9(%rsi), %r8b
	movb	%r8b, 9(%r9)
	movb	10(%rsi), %r8b
	movb	%r8b, 10(%r9)
	movb	11(%rsi), %r8b
	movb	%r8b, 11(%r9)
	movb	12(%rsi), %r8b
	movb	%r8b, 12(%r9)
	movb	13(%rsi), %r8b
	movb	%r8b, 13(%r9)
	movb	14(%rsi), %r8b
	movb	%r8b, 14(%r9)
	movb	15(%rsi), %r8b
	movb	%r8b, 15(%r9)
	movb	16(%rsi), %r8b
	movb	%r8b, 16(%r9)
	movb	17(%rsi), %r8b
	movb	%r8b, 17(%r9)
	movb	18(%rsi), %r8b
	movb	%r8b, 18(%r9)
	movb	19(%rsi), %r8b
	movb	%r8b, 19(%r9)
	movb	20(%rsi), %r8b
	movb	%r8b, 20(%r9)
	movb	21(%rsi), %r8b
	movb	%r8b, 21(%r9)
	movb	22(%rsi), %r8b
	movb	%r8b, 22(%r9)
	movb	23(%rsi), %r8b
	movb	%r8b, 23(%r9)
	leaq	56(%rsp), %rsi
	movq	(%rdi), %r8
	movq	%r8, (%rsi)
	movq	8(%rdi), %r8
	movq	%r8, 8(%rsi)
	movq	16(%rdi), %r8
	movq	%r8, 16(%rsi)
	movq	24(%rdi), %r8
	movq	%r8, 24(%rsi)
	movl	$0, %esi
	movl	(%rcx), %r10d
	movl	%r10d, 1680(%rsp)
	movl	(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1472(%rsp)
	movl	4(%rcx), %r10d
	movl	%r10d, 1684(%rsp)
	movl	4(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1476(%rsp)
	movl	8(%rcx), %r10d
	movl	%r10d, 1688(%rsp)
	movl	8(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1480(%rsp)
	movl	12(%rcx), %r10d
	movl	%r10d, 1692(%rsp)
	movl	12(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1484(%rsp)
	movl	16(%rcx), %r10d
	movl	%r10d, 1696(%rsp)
	movl	16(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1488(%rsp)
	movl	20(%rcx), %r10d
	movl	%r10d, 1700(%rsp)
	movl	20(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1492(%rsp)
	movl	24(%rcx), %r10d
	movl	%r10d, 1704(%rsp)
	movl	24(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1496(%rsp)
	movl	28(%rcx), %r10d
	movl	%r10d, 1708(%rsp)
	movl	28(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1500(%rsp)
	movl	32(%rcx), %r10d
	movl	%r10d, 1712(%rsp)
	movl	32(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1504(%rsp)
	movl	36(%rcx), %r10d
	movl	%r10d, 1716(%rsp)
	movl	36(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1508(%rsp)
	movl	40(%rcx), %r10d
	movl	%r10d, 1720(%rsp)
	movl	40(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1512(%rsp)
	movl	44(%rcx), %r10d
	movl	%r10d, 1724(%rsp)
	movl	44(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1516(%rsp)
	movl	48(%rcx), %r10d
	movl	%r10d, 1728(%rsp)
	movl	48(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1520(%rsp)
	movl	52(%rcx), %r10d
	movl	%r10d, 1732(%rsp)
	movl	52(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1524(%rsp)
	movl	56(%rcx), %r10d
	movl	%r10d, 1736(%rsp)
	movl	56(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1528(%rsp)
	movl	60(%rcx), %r10d
	movl	%r10d, 1740(%rsp)
	movl	60(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1532(%rsp)
	movl	64(%rcx), %r10d
	movl	%r10d, 1744(%rsp)
	movl	64(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1536(%rsp)
	movl	68(%rcx), %r10d
	movl	%r10d, 1748(%rsp)
	movl	68(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1540(%rsp)
	movl	72(%rcx), %r10d
	movl	%r10d, 1752(%rsp)
	movl	72(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1544(%rsp)
	movl	76(%rcx), %r10d
	movl	%r10d, 1756(%rsp)
	movl	76(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1548(%rsp)
	movl	80(%rcx), %r10d
	movl	%r10d, 1760(%rsp)
	movl	80(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1552(%rsp)
	movl	84(%rcx), %r10d
	movl	%r10d, 1764(%rsp)
	movl	84(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1556(%rsp)
	movl	88(%rcx), %r10d
	movl	%r10d, 1768(%rsp)
	movl	88(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1560(%rsp)
	movl	92(%rcx), %r10d
	movl	%r10d, 1772(%rsp)
	movl	92(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1564(%rsp)
	movl	96(%rcx), %r10d
	movl	%r10d, 1776(%rsp)
	movl	96(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1568(%rsp)
	movl	100(%rcx), %r10d
	movl	%r10d, 1780(%rsp)
	movl	100(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1572(%rsp)
	movl	104(%rcx), %r10d
	movl	%r10d, 1784(%rsp)
	movl	104(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1576(%rsp)
	movl	108(%rcx), %r10d
	movl	%r10d, 1788(%rsp)
	movl	108(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1580(%rsp)
	movl	112(%rcx), %r10d
	movl	%r10d, 1792(%rsp)
	movl	112(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1584(%rsp)
	movl	116(%rcx), %r10d
	movl	%r10d, 1796(%rsp)
	movl	116(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1588(%rsp)
	movl	120(%rcx), %r10d
	movl	%r10d, 1800(%rsp)
	movl	120(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1592(%rsp)
	movl	124(%rcx), %r10d
	movl	%r10d, 1804(%rsp)
	movl	124(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1596(%rsp)
	movl	128(%rcx), %r10d
	movl	%r10d, 1808(%rsp)
	movl	128(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1600(%rsp)
	movl	132(%rcx), %r10d
	movl	%r10d, 1812(%rsp)
	movl	132(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1604(%rsp)
	movl	136(%rcx), %r10d
	movl	%r10d, 1816(%rsp)
	movl	136(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1608(%rsp)
	movl	140(%rcx), %r10d
	movl	%r10d, 1820(%rsp)
	movl	140(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1612(%rsp)
	movl	144(%rcx), %r10d
	movl	%r10d, 1824(%rsp)
	movl	144(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1616(%rsp)
	movl	148(%rcx), %r10d
	movl	%r10d, 1828(%rsp)
	movl	148(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1620(%rsp)
	movl	152(%rcx), %r10d
	movl	%r10d, 1832(%rsp)
	movl	152(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1624(%rsp)
	movl	156(%rcx), %r10d
	movl	%r10d, 1836(%rsp)
	movl	156(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1628(%rsp)
	movl	160(%rcx), %r10d
	movl	%r10d, 1840(%rsp)
	movl	160(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1632(%rsp)
	movl	164(%rcx), %r10d
	movl	%r10d, 1844(%rsp)
	movl	164(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1636(%rsp)
	movl	168(%rcx), %r10d
	movl	%r10d, 1848(%rsp)
	movl	168(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1640(%rsp)
	movl	172(%rcx), %r10d
	movl	%r10d, 1852(%rsp)
	movl	172(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1644(%rsp)
	movl	176(%rcx), %r10d
	movl	%r10d, 1856(%rsp)
	movl	176(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1648(%rsp)
	movl	180(%rcx), %r10d
	movl	%r10d, 1860(%rsp)
	movl	180(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1652(%rsp)
	movl	184(%rcx), %r10d
	movl	%r10d, 1864(%rsp)
	movl	184(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1656(%rsp)
	movl	188(%rcx), %r10d
	movl	%r10d, 1868(%rsp)
	movl	188(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1660(%rsp)
	movl	192(%rcx), %r10d
	movl	%r10d, 1872(%rsp)
	movl	192(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1664(%rsp)
	movl	196(%rcx), %r10d
	movl	%r10d, 1876(%rsp)
	movl	196(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1668(%rsp)
	movl	200(%rcx), %r10d
	movl	%r10d, 1880(%rsp)
	movl	200(%rdx), %edi
	subl	%r10d, %edi
	movl	%edi, 1672(%rsp)
	movl	%esi, 1884(%rsp)
	movl	%esi, 1676(%rsp)
	movq	8(%rsp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 184(%rsp)
	movq	8(%rcx), %rdx
	movq	%rdx, 192(%rsp)
	movq	16(%rcx), %rdx
	movq	%rdx, 200(%rsp)
	movq	24(%rcx), %rdx
	movq	%rdx, 208(%rsp)
	movq	32(%rcx), %rdx
	movq	%rdx, 216(%rsp)
	movq	40(%rcx), %rdx
	movq	%rdx, 224(%rsp)
	movq	48(%rcx), %rdx
	movq	%rdx, 232(%rsp)
	movq	56(%rcx), %rdx
	movq	%rdx, 240(%rsp)
	movq	64(%rcx), %rdx
	movq	%rdx, 248(%rsp)
	movq	72(%rcx), %rdx
	movq	%rdx, 256(%rsp)
	movq	80(%rcx), %rdx
	movq	%rdx, 264(%rsp)
	movq	88(%rcx), %rdx
	movq	%rdx, 272(%rsp)
	movq	96(%rcx), %rdx
	movq	%rdx, 280(%rsp)
	movq	104(%rcx), %rdx
	movq	%rdx, 288(%rsp)
	movq	112(%rcx), %rdx
	movq	%rdx, 296(%rsp)
	movq	120(%rcx), %rdx
	movq	%rdx, 304(%rsp)
	movq	128(%rcx), %rdx
	movq	%rdx, 312(%rsp)
	movq	136(%rcx), %rdx
	movq	%rdx, 320(%rsp)
	movq	144(%rcx), %rdx
	movq	%rdx, 328(%rsp)
	movq	152(%rcx), %rdx
	movq	%rdx, 336(%rsp)
	movq	160(%rcx), %rdx
	movq	%rdx, 344(%rsp)
	movq	168(%rcx), %rdx
	movq	%rdx, 352(%rsp)
	movq	176(%rcx), %rdx
	movq	%rdx, 360(%rsp)
	movq	184(%rcx), %rdx
	movq	%rdx, 368(%rsp)
	movq	192(%rcx), %rdx
	movq	%rdx, 376(%rsp)
	movq	200(%rcx), %rdx
	movq	%rdx, 384(%rsp)
	movq	208(%rcx), %rdx
	movq	%rdx, 392(%rsp)
	movq	216(%rcx), %rdx
	movq	%rdx, 400(%rsp)
	movq	224(%rcx), %rdx
	movq	%rdx, 408(%rsp)
	movq	232(%rcx), %rdx
	movq	%rdx, 416(%rsp)
	movq	240(%rcx), %rdx
	movq	%rdx, 424(%rsp)
	movq	248(%rcx), %rdx
	movq	%rdx, 432(%rsp)
	movq	256(%rcx), %rdx
	movq	%rdx, 440(%rsp)
	movq	264(%rcx), %rdx
	movq	%rdx, 448(%rsp)
	movq	272(%rcx), %rdx
	movq	%rdx, 456(%rsp)
	movq	280(%rcx), %rdx
	movq	%rdx, 464(%rsp)
	movq	288(%rcx), %rdx
	movq	%rdx, 472(%rsp)
	movq	296(%rcx), %rdx
	movq	%rdx, 480(%rsp)
	movq	304(%rcx), %rdx
	movq	%rdx, 488(%rsp)
	movq	312(%rcx), %rdx
	movq	%rdx, 496(%rsp)
	movq	320(%rcx), %rdx
	movq	%rdx, 504(%rsp)
	movq	328(%rcx), %rdx
	movq	%rdx, 512(%rsp)
	movq	336(%rcx), %rdx
	movq	%rdx, 520(%rsp)
	movq	344(%rcx), %rdx
	movq	%rdx, 528(%rsp)
	movq	352(%rcx), %rdx
	movq	%rdx, 536(%rsp)
	movq	360(%rcx), %rdx
	movq	%rdx, 544(%rsp)
	movq	368(%rcx), %rdx
	movq	%rdx, 552(%rsp)
	movq	376(%rcx), %rdx
	movq	%rdx, 560(%rsp)
	movq	384(%rcx), %rdx
	movq	%rdx, 568(%rsp)
	movq	392(%rcx), %rdx
	movq	%rdx, 576(%rsp)
	movq	400(%rcx), %rdx
	movq	%rdx, 584(%rsp)
	movq	408(%rcx), %rdx
	movq	%rdx, 592(%rsp)
	movq	416(%rcx), %rdx
	movq	%rdx, 600(%rsp)
	movq	424(%rcx), %rdx
	movq	%rdx, 608(%rsp)
	movq	432(%rcx), %rdx
	movq	%rdx, 616(%rsp)
	movq	440(%rcx), %rdx
	movq	%rdx, 624(%rsp)
	movq	448(%rcx), %rdx
	movq	%rdx, 632(%rsp)
	movq	456(%rcx), %rdx
	movq	%rdx, 640(%rsp)
	movq	464(%rcx), %rdx
	movq	%rdx, 648(%rsp)
	movq	472(%rcx), %rdx
	movq	%rdx, 656(%rsp)
	movq	480(%rcx), %rdx
	movq	%rdx, 664(%rsp)
	movq	488(%rcx), %rdx
	movq	%rdx, 672(%rsp)
	movq	496(%rcx), %rdx
	movq	%rdx, 680(%rsp)
	movq	504(%rcx), %rdx
	movq	%rdx, 688(%rsp)
	movq	512(%rcx), %rdx
	movq	%rdx, 696(%rsp)
	movq	520(%rcx), %rdx
	movq	%rdx, 704(%rsp)
	movq	528(%rcx), %rdx
	movq	%rdx, 712(%rsp)
	movq	536(%rcx), %rdx
	movq	%rdx, 720(%rsp)
	movq	544(%rcx), %rdx
	movq	%rdx, 728(%rsp)
	movq	552(%rcx), %rdx
	movq	%rdx, 736(%rsp)
	movq	560(%rcx), %rdx
	movq	%rdx, 744(%rsp)
	movq	568(%rcx), %rdx
	movq	%rdx, 752(%rsp)
	movq	576(%rcx), %rdx
	movq	%rdx, 760(%rsp)
	movq	584(%rcx), %rdx
	movq	%rdx, 768(%rsp)
	movq	592(%rcx), %rdx
	movq	%rdx, 776(%rsp)
	movq	600(%rcx), %rdx
	movq	%rdx, 784(%rsp)
	movq	608(%rcx), %rdx
	movq	%rdx, 792(%rsp)
	movq	616(%rcx), %rdx
	movq	%rdx, 800(%rsp)
	movq	624(%rcx), %rdx
	movq	%rdx, 808(%rsp)
	movq	632(%rcx), %rdx
	movq	%rdx, 816(%rsp)
	movq	640(%rcx), %rdx
	movq	%rdx, 824(%rsp)
	movq	648(%rcx), %rdx
	movq	%rdx, 832(%rsp)
	movq	656(%rcx), %rdx
	movq	%rdx, 840(%rsp)
	movq	664(%rcx), %rdx
	movq	%rdx, 848(%rsp)
	movq	672(%rcx), %rdx
	movq	%rdx, 856(%rsp)
	movq	680(%rcx), %rdx
	movq	%rdx, 864(%rsp)
	movq	688(%rcx), %rdx
	movq	%rdx, 872(%rsp)
	movq	696(%rcx), %rdx
	movq	%rdx, 880(%rsp)
	movq	704(%rcx), %rdx
	movq	%rdx, 888(%rsp)
	movq	712(%rcx), %rdx
	movq	%rdx, 896(%rsp)
	movq	720(%rcx), %rdx
	movq	%rdx, 904(%rsp)
	movq	728(%rcx), %rdx
	movq	%rdx, 912(%rsp)
	movq	736(%rcx), %rdx
	movq	%rdx, 920(%rsp)
	movq	744(%rcx), %rdx
	movq	%rdx, 928(%rsp)
	movq	752(%rcx), %rdx
	movq	%rdx, 936(%rsp)
	movq	760(%rcx), %rdx
	movq	%rdx, 944(%rsp)
	movq	768(%rcx), %rdx
	movq	%rdx, 952(%rsp)
	movq	776(%rcx), %rdx
	movq	%rdx, 960(%rsp)
	movq	784(%rcx), %rdx
	movq	%rdx, 968(%rsp)
	movq	792(%rcx), %rdx
	movq	%rdx, 976(%rsp)
	movq	800(%rcx), %rdx
	movq	%rdx, 984(%rsp)
	movq	808(%rcx), %rdx
	movq	%rdx, 992(%rsp)
	movq	816(%rcx), %rdx
	movq	%rdx, 1000(%rsp)
	movq	824(%rcx), %rdx
	movq	%rdx, 1008(%rsp)
	movq	832(%rcx), %rdx
	movq	%rdx, 1016(%rsp)
	movq	840(%rcx), %rdx
	movq	%rdx, 1024(%rsp)
	movq	848(%rcx), %rdx
	movq	%rdx, 1032(%rsp)
	movq	856(%rcx), %rdx
	movq	%rdx, 1040(%rsp)
	movq	864(%rcx), %rdx
	movq	%rdx, 1048(%rsp)
	movq	872(%rcx), %rdx
	movq	%rdx, 1056(%rsp)
	movq	880(%rcx), %rdx
	movq	%rdx, 1064(%rsp)
	movq	888(%rcx), %rdx
	movq	%rdx, 1072(%rsp)
	movq	896(%rcx), %rdx
	movq	%rdx, 1080(%rsp)
	movq	904(%rcx), %rdx
	movq	%rdx, 1088(%rsp)
	movq	912(%rcx), %rdx
	movq	%rdx, 1096(%rsp)
	movq	920(%rcx), %rdx
	movq	%rdx, 1104(%rsp)
	movq	928(%rcx), %rdx
	movq	%rdx, 1112(%rsp)
	movq	936(%rcx), %rdx
	movq	%rdx, 1120(%rsp)
	movq	944(%rcx), %rdx
	movq	%rdx, 1128(%rsp)
	movq	952(%rcx), %rdx
	movq	%rdx, 1136(%rsp)
	movq	960(%rcx), %rdx
	movq	%rdx, 1144(%rsp)
	movq	968(%rcx), %rdx
	movq	%rdx, 1152(%rsp)
	movq	976(%rcx), %rdx
	movq	%rdx, 1160(%rsp)
	movq	984(%rcx), %rdx
	movq	%rdx, 1168(%rsp)
	movq	992(%rcx), %rdx
	movq	%rdx, 1176(%rsp)
	movq	1000(%rcx), %rdx
	movq	%rdx, 1184(%rsp)
	movq	1008(%rcx), %rdx
	movq	%rdx, 1192(%rsp)
	movq	1016(%rcx), %rdx
	movq	%rdx, 1200(%rsp)
	movq	1024(%rcx), %rdx
	movq	%rdx, 1208(%rsp)
	movq	1032(%rcx), %rdx
	movq	%rdx, 1216(%rsp)
	movq	1040(%rcx), %rdx
	movq	%rdx, 1224(%rsp)
	movq	1048(%rcx), %rdx
	movq	%rdx, 1232(%rsp)
	movq	1056(%rcx), %rdx
	movq	%rdx, 1240(%rsp)
	movq	1064(%rcx), %rdx
	movq	%rdx, 1248(%rsp)
	movq	1072(%rcx), %rdx
	movq	%rdx, 1256(%rsp)
	movq	1080(%rcx), %rdx
	movq	%rdx, 1264(%rsp)
	movq	1088(%rcx), %rdx
	movq	%rdx, 1272(%rsp)
	movq	1096(%rcx), %rdx
	movq	%rdx, 1280(%rsp)
	movq	1104(%rcx), %rdx
	movq	%rdx, 1288(%rsp)
	movq	1112(%rcx), %rdx
	movq	%rdx, 1296(%rsp)
	movq	1120(%rcx), %rdx
	movq	%rdx, 1304(%rsp)
	movq	1128(%rcx), %rdx
	movq	%rdx, 1312(%rsp)
	movq	1136(%rcx), %rdx
	movq	%rdx, 1320(%rsp)
	movq	1144(%rcx), %rdx
	movq	%rdx, 1328(%rsp)
	movq	1152(%rcx), %rdx
	movq	%rdx, 1336(%rsp)
	movq	1160(%rcx), %rdx
	movq	%rdx, 1344(%rsp)
	movq	1168(%rcx), %rdx
	movq	%rdx, 1352(%rsp)
	movq	1176(%rcx), %rdx
	movq	%rdx, 1360(%rsp)
	movq	1184(%rcx), %rdx
	movq	%rdx, 1368(%rsp)
	movq	1192(%rcx), %rdx
	movq	%rdx, 1376(%rsp)
	movq	1200(%rcx), %rdx
	movq	%rdx, 1384(%rsp)
	movq	1208(%rcx), %rdx
	movq	%rdx, 1392(%rsp)
	movq	1216(%rcx), %rdx
	movq	%rdx, 1400(%rsp)
	movq	$0, 1408(%rsp)
	movq	$0, 1416(%rsp)
	movq	$0, 1424(%rsp)
	movq	$0, %rcx
	jmp 	.Lwots_chains_x4$2
.Lwots_chains_x4$3:
	movl	%ecx, %edx
	shll	$2, %edx
	movl	%edx, 1440(%rsp)
	incl	%edx
	movl	%edx, 1448(%rsp)
	incl	%edx
	movl	%edx, 1456(%rsp)
	incl	%edx
	movl	%edx, 1464(%rsp)
	movl	$16, %edx
	movl	$0, %esi
	movl	$0, %edi
	movq	%rcx, %r8
	shlq	$2, %r8
	movl	1680(%rsp,%r8,4), %r10d
	movl	1472(%rsp,%r8,4), %r9d
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
	movl	1684(%rsp,%r8,4), %r10d
	movl	1476(%rsp,%r8,4), %r9d
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
	movl	1688(%rsp,%r8,4), %r10d
	movl	1480(%rsp,%r8,4), %r9d
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
	movl	1692(%rsp,%r8,4), %r10d
	movl	1484(%rsp,%r8,4), %r9d
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
	movq	$0, %r9
	movq	%rcx, %rdi
	imulq	$96, %rdi, %rdi
	jmp 	.Lwots_chains_x4$4
.Lwots_chains_x4$5:
	movl	%edx, 1444(%rsp)
	movl	%edx, 1452(%rsp)
	movl	%edx, 1460(%rsp)
	movl	%edx, 1468(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movl	%edx, 1432(%rsp)
	movl	%esi, 1436(%rsp)
	leaq	184(%rsp,%rdi), %rdx
	leaq	88(%rsp), %rdi
	leaq	32(%rsp), %rsi
	leaq	56(%rsp), %r9
	leaq	1440(%rsp), %rcx
	leaq	-824(%rsp), %rsp
	call	.Lthash_x4_n__thash_x4$1
.Lwots_chains_x4$6:
	leaq	824(%rsp), %rsp
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rdi
	movl	1432(%rsp), %edx
	movl	1436(%rsp), %esi
	lfence
	movq	$0, %r8
	movq	%rcx, %r8
	shlq	$2, %r8
	movl	%edx, %r9d
	movl	1680(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	1472(%rsp,%r8,4), %r10d
	movq	184(%rsp,%rdi), %r11
	movq	88(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 184(%rsp,%rdi)
	movq	192(%rsp,%rdi), %r11
	movq	96(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 192(%rsp,%rdi)
	movq	200(%rsp,%rdi), %r11
	movq	104(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 200(%rsp,%rdi)
	movl	%edx, %r9d
	movl	1684(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	1476(%rsp,%r8,4), %r10d
	movq	208(%rsp,%rdi), %r11
	movq	112(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 208(%rsp,%rdi)
	movq	216(%rsp,%rdi), %r11
	movq	120(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 216(%rsp,%rdi)
	movq	224(%rsp,%rdi), %r11
	movq	128(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 224(%rsp,%rdi)
	movl	%edx, %r9d
	movl	1688(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	1480(%rsp,%r8,4), %r10d
	movq	232(%rsp,%rdi), %r11
	movq	136(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 232(%rsp,%rdi)
	movq	240(%rsp,%rdi), %r11
	movq	144(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 240(%rsp,%rdi)
	movq	248(%rsp,%rdi), %r11
	movq	152(%rsp), %rbx
	cmpl	%r10d, %r9d
	cmovb	%rbx, %r11
	movq	%r11, 248(%rsp,%rdi)
	movl	%edx, %r9d
	movl	1692(%rsp,%r8,4), %r10d
	subl	%r10d, %r9d
	movl	1484(%rsp,%r8,4), %r10d
	movq	256(%rsp,%rdi), %r11
	movq	160(%rsp), %r8
	cmpl	%r10d, %r9d
	cmovb	%r8, %r11
	movq	%r11, 256(%rsp,%rdi)
	movq	264(%rsp,%rdi), %r11
	movq	168(%rsp), %r8
	cmpl	%r10d, %r9d
	cmovb	%r8, %r11
	movq	%r11, 264(%rsp,%rdi)
	movq	272(%rsp,%rdi), %r11
	movq	176(%rsp), %r8
	cmpl	%r10d, %r9d
	cmovb	%r8, %r11
	movq	%r11, 272(%rsp,%rdi)
	incl	%edx
.Lwots_chains_x4$4:
	cmpl	%esi, %edx
	jb  	.Lwots_chains_x4$5
	incq	%rcx
.Lwots_chains_x4$2:
	cmpq	$13, %rcx
	jb  	.Lwots_chains_x4$3
	movq	8(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	184(%rsp), %rdx
	movq	%rdx, (%rcx)
	movq	192(%rsp), %rdx
	movq	%rdx, 8(%rcx)
	movq	200(%rsp), %rdx
	movq	%rdx, 16(%rcx)
	movq	208(%rsp), %rdx
	movq	%rdx, 24(%rcx)
	movq	216(%rsp), %rdx
	movq	%rdx, 32(%rcx)
	movq	224(%rsp), %rdx
	movq	%rdx, 40(%rcx)
	movq	232(%rsp), %rdx
	movq	%rdx, 48(%rcx)
	movq	240(%rsp), %rdx
	movq	%rdx, 56(%rcx)
	movq	248(%rsp), %rdx
	movq	%rdx, 64(%rcx)
	movq	256(%rsp), %rdx
	movq	%rdx, 72(%rcx)
	movq	264(%rsp), %rdx
	movq	%rdx, 80(%rcx)
	movq	272(%rsp), %rdx
	movq	%rdx, 88(%rcx)
	movq	280(%rsp), %rdx
	movq	%rdx, 96(%rcx)
	movq	288(%rsp), %rdx
	movq	%rdx, 104(%rcx)
	movq	296(%rsp), %rdx
	movq	%rdx, 112(%rcx)
	movq	304(%rsp), %rdx
	movq	%rdx, 120(%rcx)
	movq	312(%rsp), %rdx
	movq	%rdx, 128(%rcx)
	movq	320(%rsp), %rdx
	movq	%rdx, 136(%rcx)
	movq	328(%rsp), %rdx
	movq	%rdx, 144(%rcx)
	movq	336(%rsp), %rdx
	movq	%rdx, 152(%rcx)
	movq	344(%rsp), %rdx
	movq	%rdx, 160(%rcx)
	movq	352(%rsp), %rdx
	movq	%rdx, 168(%rcx)
	movq	360(%rsp), %rdx
	movq	%rdx, 176(%rcx)
	movq	368(%rsp), %rdx
	movq	%rdx, 184(%rcx)
	movq	376(%rsp), %rdx
	movq	%rdx, 192(%rcx)
	movq	384(%rsp), %rdx
	movq	%rdx, 200(%rcx)
	movq	392(%rsp), %rdx
	movq	%rdx, 208(%rcx)
	movq	400(%rsp), %rdx
	movq	%rdx, 216(%rcx)
	movq	408(%rsp), %rdx
	movq	%rdx, 224(%rcx)
	movq	416(%rsp), %rdx
	movq	%rdx, 232(%rcx)
	movq	424(%rsp), %rdx
	movq	%rdx, 240(%rcx)
	movq	432(%rsp), %rdx
	movq	%rdx, 248(%rcx)
	movq	440(%rsp), %rdx
	movq	%rdx, 256(%rcx)
	movq	448(%rsp), %rdx
	movq	%rdx, 264(%rcx)
	movq	456(%rsp), %rdx
	movq	%rdx, 272(%rcx)
	movq	464(%rsp), %rdx
	movq	%rdx, 280(%rcx)
	movq	472(%rsp), %rdx
	movq	%rdx, 288(%rcx)
	movq	480(%rsp), %rdx
	movq	%rdx, 296(%rcx)
	movq	488(%rsp), %rdx
	movq	%rdx, 304(%rcx)
	movq	496(%rsp), %rdx
	movq	%rdx, 312(%rcx)
	movq	504(%rsp), %rdx
	movq	%rdx, 320(%rcx)
	movq	512(%rsp), %rdx
	movq	%rdx, 328(%rcx)
	movq	520(%rsp), %rdx
	movq	%rdx, 336(%rcx)
	movq	528(%rsp), %rdx
	movq	%rdx, 344(%rcx)
	movq	536(%rsp), %rdx
	movq	%rdx, 352(%rcx)
	movq	544(%rsp), %rdx
	movq	%rdx, 360(%rcx)
	movq	552(%rsp), %rdx
	movq	%rdx, 368(%rcx)
	movq	560(%rsp), %rdx
	movq	%rdx, 376(%rcx)
	movq	568(%rsp), %rdx
	movq	%rdx, 384(%rcx)
	movq	576(%rsp), %rdx
	movq	%rdx, 392(%rcx)
	movq	584(%rsp), %rdx
	movq	%rdx, 400(%rcx)
	movq	592(%rsp), %rdx
	movq	%rdx, 408(%rcx)
	movq	600(%rsp), %rdx
	movq	%rdx, 416(%rcx)
	movq	608(%rsp), %rdx
	movq	%rdx, 424(%rcx)
	movq	616(%rsp), %rdx
	movq	%rdx, 432(%rcx)
	movq	624(%rsp), %rdx
	movq	%rdx, 440(%rcx)
	movq	632(%rsp), %rdx
	movq	%rdx, 448(%rcx)
	movq	640(%rsp), %rdx
	movq	%rdx, 456(%rcx)
	movq	648(%rsp), %rdx
	movq	%rdx, 464(%rcx)
	movq	656(%rsp), %rdx
	movq	%rdx, 472(%rcx)
	movq	664(%rsp), %rdx
	movq	%rdx, 480(%rcx)
	movq	672(%rsp), %rdx
	movq	%rdx, 488(%rcx)
	movq	680(%rsp), %rdx
	movq	%rdx, 496(%rcx)
	movq	688(%rsp), %rdx
	movq	%rdx, 504(%rcx)
	movq	696(%rsp), %rdx
	movq	%rdx, 512(%rcx)
	movq	704(%rsp), %rdx
	movq	%rdx, 520(%rcx)
	movq	712(%rsp), %rdx
	movq	%rdx, 528(%rcx)
	movq	720(%rsp), %rdx
	movq	%rdx, 536(%rcx)
	movq	728(%rsp), %rdx
	movq	%rdx, 544(%rcx)
	movq	736(%rsp), %rdx
	movq	%rdx, 552(%rcx)
	movq	744(%rsp), %rdx
	movq	%rdx, 560(%rcx)
	movq	752(%rsp), %rdx
	movq	%rdx, 568(%rcx)
	movq	760(%rsp), %rdx
	movq	%rdx, 576(%rcx)
	movq	768(%rsp), %rdx
	movq	%rdx, 584(%rcx)
	movq	776(%rsp), %rdx
	movq	%rdx, 592(%rcx)
	movq	784(%rsp), %rdx
	movq	%rdx, 600(%rcx)
	movq	792(%rsp), %rdx
	movq	%rdx, 608(%rcx)
	movq	800(%rsp), %rdx
	movq	%rdx, 616(%rcx)
	movq	808(%rsp), %rdx
	movq	%rdx, 624(%rcx)
	movq	816(%rsp), %rdx
	movq	%rdx, 632(%rcx)
	movq	824(%rsp), %rdx
	movq	%rdx, 640(%rcx)
	movq	832(%rsp), %rdx
	movq	%rdx, 648(%rcx)
	movq	840(%rsp), %rdx
	movq	%rdx, 656(%rcx)
	movq	848(%rsp), %rdx
	movq	%rdx, 664(%rcx)
	movq	856(%rsp), %rdx
	movq	%rdx, 672(%rcx)
	movq	864(%rsp), %rdx
	movq	%rdx, 680(%rcx)
	movq	872(%rsp), %rdx
	movq	%rdx, 688(%rcx)
	movq	880(%rsp), %rdx
	movq	%rdx, 696(%rcx)
	movq	888(%rsp), %rdx
	movq	%rdx, 704(%rcx)
	movq	896(%rsp), %rdx
	movq	%rdx, 712(%rcx)
	movq	904(%rsp), %rdx
	movq	%rdx, 720(%rcx)
	movq	912(%rsp), %rdx
	movq	%rdx, 728(%rcx)
	movq	920(%rsp), %rdx
	movq	%rdx, 736(%rcx)
	movq	928(%rsp), %rdx
	movq	%rdx, 744(%rcx)
	movq	936(%rsp), %rdx
	movq	%rdx, 752(%rcx)
	movq	944(%rsp), %rdx
	movq	%rdx, 760(%rcx)
	movq	952(%rsp), %rdx
	movq	%rdx, 768(%rcx)
	movq	960(%rsp), %rdx
	movq	%rdx, 776(%rcx)
	movq	968(%rsp), %rdx
	movq	%rdx, 784(%rcx)
	movq	976(%rsp), %rdx
	movq	%rdx, 792(%rcx)
	movq	984(%rsp), %rdx
	movq	%rdx, 800(%rcx)
	movq	992(%rsp), %rdx
	movq	%rdx, 808(%rcx)
	movq	1000(%rsp), %rdx
	movq	%rdx, 816(%rcx)
	movq	1008(%rsp), %rdx
	movq	%rdx, 824(%rcx)
	movq	1016(%rsp), %rdx
	movq	%rdx, 832(%rcx)
	movq	1024(%rsp), %rdx
	movq	%rdx, 840(%rcx)
	movq	1032(%rsp), %rdx
	movq	%rdx, 848(%rcx)
	movq	1040(%rsp), %rdx
	movq	%rdx, 856(%rcx)
	movq	1048(%rsp), %rdx
	movq	%rdx, 864(%rcx)
	movq	1056(%rsp), %rdx
	movq	%rdx, 872(%rcx)
	movq	1064(%rsp), %rdx
	movq	%rdx, 880(%rcx)
	movq	1072(%rsp), %rdx
	movq	%rdx, 888(%rcx)
	movq	1080(%rsp), %rdx
	movq	%rdx, 896(%rcx)
	movq	1088(%rsp), %rdx
	movq	%rdx, 904(%rcx)
	movq	1096(%rsp), %rdx
	movq	%rdx, 912(%rcx)
	movq	1104(%rsp), %rdx
	movq	%rdx, 920(%rcx)
	movq	1112(%rsp), %rdx
	movq	%rdx, 928(%rcx)
	movq	1120(%rsp), %rdx
	movq	%rdx, 936(%rcx)
	movq	1128(%rsp), %rdx
	movq	%rdx, 944(%rcx)
	movq	1136(%rsp), %rdx
	movq	%rdx, 952(%rcx)
	movq	1144(%rsp), %rdx
	movq	%rdx, 960(%rcx)
	movq	1152(%rsp), %rdx
	movq	%rdx, 968(%rcx)
	movq	1160(%rsp), %rdx
	movq	%rdx, 976(%rcx)
	movq	1168(%rsp), %rdx
	movq	%rdx, 984(%rcx)
	movq	1176(%rsp), %rdx
	movq	%rdx, 992(%rcx)
	movq	1184(%rsp), %rdx
	movq	%rdx, 1000(%rcx)
	movq	1192(%rsp), %rdx
	movq	%rdx, 1008(%rcx)
	movq	1200(%rsp), %rdx
	movq	%rdx, 1016(%rcx)
	movq	1208(%rsp), %rdx
	movq	%rdx, 1024(%rcx)
	movq	1216(%rsp), %rdx
	movq	%rdx, 1032(%rcx)
	movq	1224(%rsp), %rdx
	movq	%rdx, 1040(%rcx)
	movq	1232(%rsp), %rdx
	movq	%rdx, 1048(%rcx)
	movq	1240(%rsp), %rdx
	movq	%rdx, 1056(%rcx)
	movq	1248(%rsp), %rdx
	movq	%rdx, 1064(%rcx)
	movq	1256(%rsp), %rdx
	movq	%rdx, 1072(%rcx)
	movq	1264(%rsp), %rdx
	movq	%rdx, 1080(%rcx)
	movq	1272(%rsp), %rdx
	movq	%rdx, 1088(%rcx)
	movq	1280(%rsp), %rdx
	movq	%rdx, 1096(%rcx)
	movq	1288(%rsp), %rdx
	movq	%rdx, 1104(%rcx)
	movq	1296(%rsp), %rdx
	movq	%rdx, 1112(%rcx)
	movq	1304(%rsp), %rdx
	movq	%rdx, 1120(%rcx)
	movq	1312(%rsp), %rdx
	movq	%rdx, 1128(%rcx)
	movq	1320(%rsp), %rdx
	movq	%rdx, 1136(%rcx)
	movq	1328(%rsp), %rdx
	movq	%rdx, 1144(%rcx)
	movq	1336(%rsp), %rdx
	movq	%rdx, 1152(%rcx)
	movq	1344(%rsp), %rdx
	movq	%rdx, 1160(%rcx)
	movq	1352(%rsp), %rdx
	movq	%rdx, 1168(%rcx)
	movq	1360(%rsp), %rdx
	movq	%rdx, 1176(%rcx)
	movq	1368(%rsp), %rdx
	movq	%rdx, 1184(%rcx)
	movq	1376(%rsp), %rdx
	movq	%rdx, 1192(%rcx)
	movq	1384(%rsp), %rdx
	movq	%rdx, 1200(%rcx)
	movq	1392(%rsp), %rdx
	movq	%rdx, 1208(%rcx)
	movq	1400(%rsp), %rdx
	movq	%rdx, 1216(%rcx)
	ret
.LT_k$1:
	movq	%rcx, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%rsi,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rsi,%rcx), %xmm2
	vmovdqu	%xmm2, %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
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
	movq	$0, %r8
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%r8), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%r8), %rdx
	vmovq	%rdx, %xmm2
	movq	24(%rcx,%r8), %rcx
	vmovq	%rcx, %xmm6
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
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
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rax,%rcx), %xmm0
	vpslldq	$8, %xmm0, %xmm0
	vmovdqu	%xmm0, %xmm0
	vmovdqu	8(%rax,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm0, %ymm14
	movq	24(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	32(%rax,%rcx), %ymm13
	movq	64(%rax,%rcx), %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm9
	movq	72(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm0
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm0, %xmm0
	vmovdqu	%xmm0, %xmm0
	vpxor	%xmm2, %xmm2, %xmm2
	vinserti128	$1, %xmm2, %ymm0, %ymm0
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
	addq	$80, %rcx
	call	.L_keccakf1600_avx2$1
.LT_k$9:
	movq	$0, %r8
	jmp 	.LT_k$6
.LT_k$7:
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm9
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
	vmovdqu	%xmm7, %xmm7
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
	incq	%r8
.LT_k$6:
	cmpq	$2, %r8
	jb  	.LT_k$7
	vpbroadcastq	(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rax,%rcx), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm8
	movq	48(%rax,%rcx), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm7, %ymm14
	movq	$0, %rcx
	vmovq	%rcx, %xmm10
	vpxor	%ymm13, %ymm13, %ymm13
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
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rax
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	.LT_k$3
.LT_k$4:
	call	.L_keccakf1600_avx2$1
.LT_k$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rax,%rcx)
	vmovdqu	%ymm4, 8(%rax,%rcx)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rax,%rcx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rax,%rcx)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rax,%rcx)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rax,%rcx)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rax,%rcx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rax,%rcx)
	addq	$136, %rcx
	incq	%r8
.LT_k$3:
	cmpq	$0, %r8
	jb  	.LT_k$4
	call	.L_keccakf1600_avx2$1
.LT_k$2:
	movq	%xmm5, (%rax,%rcx)
	vmovdqu	%xmm4, 8(%rax,%rcx)
	ret
.LT_len$1:
	movq	%rdx, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %r8
	vpbroadcastq	(%rsi,%r8), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rsi,%r8), %xmm2
	vmovdqu	%xmm2, %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
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
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rdx,%r8), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rdx,%r8), %rsi
	vmovq	%rsi, %xmm2
	movq	24(%rdx,%r8), %rdx
	vmovq	%rdx, %xmm6
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
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
	movq	$0, %r8
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rcx,%r8), %xmm0
	vpslldq	$8, %xmm0, %xmm0
	vmovdqu	%xmm0, %xmm0
	vmovdqu	8(%rcx,%r8), %xmm9
	vinserti128	$1, %xmm9, %ymm0, %ymm14
	movq	24(%rcx,%r8), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	32(%rcx,%r8), %ymm13
	movq	64(%rcx,%r8), %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm9
	movq	72(%rcx,%r8), %rdx
	vmovq	%rdx, %xmm0
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm0, %xmm0
	vmovdqu	%xmm0, %xmm0
	vpxor	%xmm2, %xmm2, %xmm2
	vinserti128	$1, %xmm2, %ymm0, %ymm0
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
	addq	$80, %r8
	call	.L_keccakf1600_avx2$1
.LT_len$9:
	movq	$0, %r10
	jmp 	.LT_len$6
.LT_len$7:
	vpbroadcastq	(%rcx,%r8), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%r8), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%r8), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	48(%rcx,%r8), %ymm14
	movq	80(%rcx,%r8), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	88(%rcx,%r8), %ymm13
	movq	120(%rcx,%r8), %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm9
	movq	128(%rcx,%r8), %rdx
	vmovq	%rdx, %xmm7
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
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
	addq	$136, %r8
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%r10
.LT_len$6:
	cmpq	$8, %r10
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%r8), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%r8), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%r8), %rdx
	vmovq	%rdx, %xmm8
	movq	48(%rcx,%r8), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
	vmovdqu	%xmm7, %xmm7
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm7, %ymm14
	movq	$0, %rcx
	vmovq	%rcx, %xmm10
	vpxor	%ymm13, %ymm13, %ymm13
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
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	%mm0, %rcx
	movq	$0, %r8
	movq	$0, %r10
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%r8)
	vmovdqu	%ymm4, 8(%rcx,%r8)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%r8)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%r8)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%r8)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%r8)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%r8)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%r8)
	addq	$136, %r8
	incq	%r10
.LT_len$3:
	cmpq	$0, %r10
	jb  	.LT_len$4
	call	.L_keccakf1600_avx2$1
.LT_len$2:
	movq	%xmm5, (%rcx,%r8)
	vmovdqu	%xmm4, 8(%rcx,%r8)
	ret
.LH$1:
	movq	%rcx, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%rsi,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rsi,%rcx), %xmm2
	vmovdqu	%xmm2, %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%rdi), %esi
	bswapl	%esi
	movl	%esi, (%rcx)
	movl	4(%rdi), %esi
	bswapl	%esi
	movl	%esi, 4(%rcx)
	movl	8(%rdi), %esi
	bswapl	%esi
	movl	%esi, 8(%rcx)
	movl	12(%rdi), %esi
	bswapl	%esi
	movl	%esi, 12(%rcx)
	movl	16(%rdi), %esi
	bswapl	%esi
	movl	%esi, 16(%rcx)
	movl	20(%rdi), %esi
	bswapl	%esi
	movl	%esi, 20(%rcx)
	movl	24(%rdi), %esi
	bswapl	%esi
	movl	%esi, 24(%rcx)
	movl	28(%rdi), %esi
	bswapl	%esi
	movl	%esi, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %r8
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%r8), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%r8), %rsi
	vmovq	%rsi, %xmm2
	movq	24(%rcx,%r8), %rcx
	vmovq	%rcx, %xmm6
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
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
	vmovdqu	(%rax,%rcx), %xmm6
	vpslldq	$8, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
	vmovdqu	8(%rax,%rcx), %xmm9
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
	movq	$0, %rax
	movq	$0, %rsi
	vmovq	%rsi, %xmm2
	vpxor	%ymm14, %ymm14, %ymm14
	movq	(%rdx,%rax), %rcx
	vmovq	%rcx, %xmm6
	vmovdqu	8(%rdx,%rax), %xmm9
	vmovdqu	%xmm9, %xmm11
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vmovq	%rcx, %xmm9
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm11, %ymm13
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
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm8
	vpxor	%ymm8, %ymm7, %ymm0
	movq	%mm0, %rax
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rax,%rcx)
	vmovdqu	%ymm4, 8(%rax,%rcx)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rax,%rcx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rax,%rcx)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rax,%rcx)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rax,%rcx)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rax,%rcx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rax,%rcx)
	addq	$136, %rcx
	incq	%r8
.LH$3:
	cmpq	$0, %r8
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm5, (%rax,%rcx)
	vmovdqu	%xmm4, 8(%rax,%rcx)
	ret
.LF$1:
	movq	%rcx, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %r8
	vpbroadcastq	(%rsi,%r8), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rsi,%r8), %xmm2
	vmovdqu	%xmm2, %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	leaq	16(%rsp), %rdx
	movl	(%rax), %esi
	bswapl	%esi
	movl	%esi, (%rdx)
	movl	4(%rax), %esi
	bswapl	%esi
	movl	%esi, 4(%rdx)
	movl	8(%rax), %esi
	bswapl	%esi
	movl	%esi, 8(%rdx)
	movl	12(%rax), %esi
	bswapl	%esi
	movl	%esi, 12(%rdx)
	movl	16(%rax), %esi
	bswapl	%esi
	movl	%esi, 16(%rdx)
	movl	20(%rax), %esi
	bswapl	%esi
	movl	%esi, 20(%rdx)
	movl	24(%rax), %esi
	bswapl	%esi
	movl	%esi, 24(%rdx)
	movl	28(%rax), %esi
	bswapl	%esi
	movl	%esi, 28(%rdx)
	leaq	16(%rsp), %rdx
	movq	$0, %rax
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rdx,%rax), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rdx,%rax), %rsi
	vmovq	%rsi, %xmm2
	movq	24(%rdx,%rax), %rdx
	vmovq	%rdx, %xmm6
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
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
	vpxor	%ymm6, %ymm0, %ymm0
	movq	$0, %rax
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rcx,%rax), %xmm6
	vpslldq	$8, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
	vmovdqu	8(%rcx,%rax), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vmovq	%rcx, %xmm6
	vpxor	%ymm13, %ymm13, %ymm13
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
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm8
	vpxor	%ymm8, %ymm7, %ymm0
	movq	%mm0, %rcx
	movq	$0, %rax
	movq	$0, %r8
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rax)
	vmovdqu	%ymm4, 8(%rcx,%rax)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
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
	movq	%xmm8, %rsi
	movq	%rsi, 120(%rcx,%rax)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%rax)
	addq	$136, %rax
	incq	%r8
.LF$3:
	cmpq	$0, %r8
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm5, (%rcx,%rax)
	vmovdqu	%xmm4, 8(%rcx,%rax)
	ret
.LPRF$1:
	movq	%rax, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rax
	vpbroadcastq	(%rsi,%rax), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rsi,%rax), %xmm2
	vmovdqu	%xmm2, %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
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
	movq	$0, %rax
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%rax), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%rax), %rdx
	vmovq	%rdx, %xmm2
	movq	24(%rcx,%rax), %rcx
	vmovq	%rcx, %xmm6
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
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
	movq	$0, %rax
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rbx,%rax), %xmm6
	vpslldq	$8, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
	vmovdqu	8(%rbx,%rax), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rcx
	movq	$31, %rax
	shlq	$0, %rax
	orq 	%rax, %rcx
	vmovq	%rcx, %xmm6
	vpxor	%ymm13, %ymm13, %ymm13
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
	movq	$1, %rdx
	shlq	$63, %rdx
	vmovq	%rdx, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm8
	vpxor	%ymm8, %ymm7, %ymm0
	movq	%mm0, %rax
	movq	$0, %rcx
	movq	$0, %r8
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rax,%rcx)
	vmovdqu	%ymm4, 8(%rax,%rcx)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rax,%rcx)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rax,%rcx)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rax,%rcx)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rax,%rcx)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rax,%rcx)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rax,%rcx)
	addq	$136, %rcx
	incq	%r8
.LPRF$3:
	cmpq	$0, %r8
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm5, (%rax,%rcx)
	vmovdqu	%xmm4, 8(%rax,%rcx)
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
	movb	(%rsi), %dl
	movb	%dl, 32(%rsp)
	movb	1(%rsi), %dl
	movb	%dl, 33(%rsp)
	movb	2(%rsi), %dl
	movb	%dl, 34(%rsp)
	movb	3(%rsi), %dl
	movb	%dl, 35(%rsp)
	movb	4(%rsi), %dl
	movb	%dl, 36(%rsp)
	movb	5(%rsi), %dl
	movb	%dl, 37(%rsp)
	movb	6(%rsi), %dl
	movb	%dl, 38(%rsp)
	movb	7(%rsi), %dl
	movb	%dl, 39(%rsp)
	movb	8(%rsi), %dl
	movb	%dl, 40(%rsp)
	movb	9(%rsi), %dl
	movb	%dl, 41(%rsp)
	movb	10(%rsi), %dl
	movb	%dl, 42(%rsp)
	movb	11(%rsi), %dl
	movb	%dl, 43(%rsp)
	movb	12(%rsi), %dl
	movb	%dl, 44(%rsp)
	movb	13(%rsi), %dl
	movb	%dl, 45(%rsp)
	movb	14(%rsi), %dl
	movb	%dl, 46(%rsp)
	movb	15(%rsi), %dl
	movb	%dl, 47(%rsp)
	movb	16(%rsi), %dl
	movb	%dl, 48(%rsp)
	movb	17(%rsi), %dl
	movb	%dl, 49(%rsp)
	movb	18(%rsi), %dl
	movb	%dl, 50(%rsp)
	movb	19(%rsi), %dl
	movb	%dl, 51(%rsp)
	movb	20(%rsi), %dl
	movb	%dl, 52(%rsp)
	movb	21(%rsi), %dl
	movb	%dl, 53(%rsp)
	movb	22(%rsi), %dl
	movb	%dl, 54(%rsp)
	movb	23(%rsi), %dl
	movb	%dl, 55(%rsp)
	movb	(%rdi), %dl
	movb	%dl, 56(%rsp)
	movb	1(%rdi), %dl
	movb	%dl, 57(%rsp)
	movb	2(%rdi), %dl
	movb	%dl, 58(%rsp)
	movb	3(%rdi), %dl
	movb	%dl, 59(%rsp)
	movb	4(%rdi), %dl
	movb	%dl, 60(%rsp)
	movb	5(%rdi), %dl
	movb	%dl, 61(%rsp)
	movb	6(%rdi), %dl
	movb	%dl, 62(%rsp)
	movb	7(%rdi), %dl
	movb	%dl, 63(%rsp)
	movb	8(%rdi), %dl
	movb	%dl, 64(%rsp)
	movb	9(%rdi), %dl
	movb	%dl, 65(%rsp)
	movb	10(%rdi), %dl
	movb	%dl, 66(%rsp)
	movb	11(%rdi), %dl
	movb	%dl, 67(%rsp)
	movb	12(%rdi), %dl
	movb	%dl, 68(%rsp)
	movb	13(%rdi), %dl
	movb	%dl, 69(%rsp)
	movb	14(%rdi), %dl
	movb	%dl, 70(%rsp)
	movb	15(%rdi), %dl
	movb	%dl, 71(%rsp)
	movb	16(%rdi), %dl
	movb	%dl, 72(%rsp)
	movb	17(%rdi), %dl
	movb	%dl, 73(%rsp)
	movb	18(%rdi), %dl
	movb	%dl, 74(%rsp)
	movb	19(%rdi), %dl
	movb	%dl, 75(%rsp)
	movb	20(%rdi), %dl
	movb	%dl, 76(%rsp)
	movb	21(%rdi), %dl
	movb	%dl, 77(%rsp)
	movb	22(%rdi), %dl
	movb	%dl, 78(%rsp)
	movb	23(%rdi), %dl
	movb	%dl, 79(%rsp)
	movb	$0, 80(%rsp)
	movb	%cl, 81(%rsp)
	movq	$50, %rcx
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
	movb	32(%rsp), %dl
	movb	%dl, (%rcx)
	movb	33(%rsp), %dl
	movb	%dl, 1(%rcx)
	movb	34(%rsp), %dl
	movb	%dl, 2(%rcx)
	movb	35(%rsp), %dl
	movb	%dl, 3(%rcx)
	movb	36(%rsp), %dl
	movb	%dl, 4(%rcx)
	movb	37(%rsp), %dl
	movb	%dl, 5(%rcx)
	movb	38(%rsp), %dl
	movb	%dl, 6(%rcx)
	movb	39(%rsp), %dl
	movb	%dl, 7(%rcx)
	movb	40(%rsp), %dl
	movb	%dl, 8(%rcx)
	movb	41(%rsp), %dl
	movb	%dl, 9(%rcx)
	movb	42(%rsp), %dl
	movb	%dl, 10(%rcx)
	movb	43(%rsp), %dl
	movb	%dl, 11(%rcx)
	movb	44(%rsp), %dl
	movb	%dl, 12(%rcx)
	movb	45(%rsp), %dl
	movb	%dl, 13(%rcx)
	movb	46(%rsp), %dl
	movb	%dl, 14(%rcx)
	movb	47(%rsp), %dl
	movb	%dl, 15(%rcx)
	movb	48(%rsp), %dl
	movb	%dl, 16(%rcx)
	movb	49(%rsp), %dl
	movb	%dl, 17(%rcx)
	movb	50(%rsp), %dl
	movb	%dl, 18(%rcx)
	movb	51(%rsp), %dl
	movb	%dl, 19(%rcx)
	movb	52(%rsp), %dl
	movb	%dl, 20(%rcx)
	movb	53(%rsp), %dl
	movb	%dl, 21(%rcx)
	movb	54(%rsp), %dl
	movb	%dl, 22(%rcx)
	movb	55(%rsp), %dl
	movb	%dl, 23(%rcx)
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
	movb	(%r8), %dl
	movb	%dl, 32(%rsp)
	movb	1(%r8), %dl
	movb	%dl, 33(%rsp)
	movb	2(%r8), %dl
	movb	%dl, 34(%rsp)
	movb	3(%r8), %dl
	movb	%dl, 35(%rsp)
	movb	4(%r8), %dl
	movb	%dl, 36(%rsp)
	movb	5(%r8), %dl
	movb	%dl, 37(%rsp)
	movb	6(%r8), %dl
	movb	%dl, 38(%rsp)
	movb	7(%r8), %dl
	movb	%dl, 39(%rsp)
	movb	8(%r8), %dl
	movb	%dl, 40(%rsp)
	movb	9(%r8), %dl
	movb	%dl, 41(%rsp)
	movb	10(%r8), %dl
	movb	%dl, 42(%rsp)
	movb	11(%r8), %dl
	movb	%dl, 43(%rsp)
	movb	12(%r8), %dl
	movb	%dl, 44(%rsp)
	movb	13(%r8), %dl
	movb	%dl, 45(%rsp)
	movb	14(%r8), %dl
	movb	%dl, 46(%rsp)
	movb	15(%r8), %dl
	movb	%dl, 47(%rsp)
	movb	16(%r8), %dl
	movb	%dl, 48(%rsp)
	movb	17(%r8), %dl
	movb	%dl, 49(%rsp)
	movb	18(%r8), %dl
	movb	%dl, 50(%rsp)
	movb	19(%r8), %dl
	movb	%dl, 51(%rsp)
	movb	20(%r8), %dl
	movb	%dl, 52(%rsp)
	movb	21(%r8), %dl
	movb	%dl, 53(%rsp)
	movb	22(%r8), %dl
	movb	%dl, 54(%rsp)
	movb	23(%r8), %dl
	movb	%dl, 55(%rsp)
	movb	(%r9), %dl
	movb	%dl, 56(%rsp)
	movb	1(%r9), %dl
	movb	%dl, 57(%rsp)
	movb	2(%r9), %dl
	movb	%dl, 58(%rsp)
	movb	3(%r9), %dl
	movb	%dl, 59(%rsp)
	movb	4(%r9), %dl
	movb	%dl, 60(%rsp)
	movb	5(%r9), %dl
	movb	%dl, 61(%rsp)
	movb	6(%r9), %dl
	movb	%dl, 62(%rsp)
	movb	7(%r9), %dl
	movb	%dl, 63(%rsp)
	movb	8(%r9), %dl
	movb	%dl, 64(%rsp)
	movb	9(%r9), %dl
	movb	%dl, 65(%rsp)
	movb	10(%r9), %dl
	movb	%dl, 66(%rsp)
	movb	11(%r9), %dl
	movb	%dl, 67(%rsp)
	movb	12(%r9), %dl
	movb	%dl, 68(%rsp)
	movb	13(%r9), %dl
	movb	%dl, 69(%rsp)
	movb	14(%r9), %dl
	movb	%dl, 70(%rsp)
	movb	15(%r9), %dl
	movb	%dl, 71(%rsp)
	movb	16(%r9), %dl
	movb	%dl, 72(%rsp)
	movb	17(%r9), %dl
	movb	%dl, 73(%rsp)
	movb	18(%r9), %dl
	movb	%dl, 74(%rsp)
	movb	19(%r9), %dl
	movb	%dl, 75(%rsp)
	movb	20(%r9), %dl
	movb	%dl, 76(%rsp)
	movb	21(%r9), %dl
	movb	%dl, 77(%rsp)
	movb	22(%r9), %dl
	movb	%dl, 78(%rsp)
	movb	23(%r9), %dl
	movb	%dl, 79(%rsp)
	movb	(%r10), %dl
	movb	%dl, 80(%rsp)
	movb	1(%r10), %dl
	movb	%dl, 81(%rsp)
	movb	2(%r10), %dl
	movb	%dl, 82(%rsp)
	movb	3(%r10), %dl
	movb	%dl, 83(%rsp)
	movb	4(%r10), %dl
	movb	%dl, 84(%rsp)
	movb	5(%r10), %dl
	movb	%dl, 85(%rsp)
	movb	6(%r10), %dl
	movb	%dl, 86(%rsp)
	movb	7(%r10), %dl
	movb	%dl, 87(%rsp)
	movb	8(%r10), %dl
	movb	%dl, 88(%rsp)
	movb	9(%r10), %dl
	movb	%dl, 89(%rsp)
	movb	10(%r10), %dl
	movb	%dl, 90(%rsp)
	movb	11(%r10), %dl
	movb	%dl, 91(%rsp)
	movb	12(%r10), %dl
	movb	%dl, 92(%rsp)
	movb	13(%r10), %dl
	movb	%dl, 93(%rsp)
	movb	14(%r10), %dl
	movb	%dl, 94(%rsp)
	movb	15(%r10), %dl
	movb	%dl, 95(%rsp)
	movb	16(%r10), %dl
	movb	%dl, 96(%rsp)
	movb	17(%r10), %dl
	movb	%dl, 97(%rsp)
	movb	18(%r10), %dl
	movb	%dl, 98(%rsp)
	movb	19(%r10), %dl
	movb	%dl, 99(%rsp)
	movb	20(%r10), %dl
	movb	%dl, 100(%rsp)
	movb	21(%r10), %dl
	movb	%dl, 101(%rsp)
	movb	22(%r10), %dl
	movb	%dl, 102(%rsp)
	movb	23(%r10), %dl
	movb	%dl, 103(%rsp)
	movb	$0, 104(%rsp)
	movb	%cl, 105(%rsp)
	movq	$74, %rcx
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
	movq	%mm0, %rcx
	movb	32(%rsp), %r9b
	movb	%r9b, (%rcx)
	movb	33(%rsp), %r9b
	movb	%r9b, 1(%rcx)
	movb	34(%rsp), %r9b
	movb	%r9b, 2(%rcx)
	movb	35(%rsp), %r9b
	movb	%r9b, 3(%rcx)
	movb	36(%rsp), %r9b
	movb	%r9b, 4(%rcx)
	movb	37(%rsp), %r9b
	movb	%r9b, 5(%rcx)
	movb	38(%rsp), %r9b
	movb	%r9b, 6(%rcx)
	movb	39(%rsp), %r9b
	movb	%r9b, 7(%rcx)
	movb	40(%rsp), %r9b
	movb	%r9b, 8(%rcx)
	movb	41(%rsp), %r9b
	movb	%r9b, 9(%rcx)
	movb	42(%rsp), %r9b
	movb	%r9b, 10(%rcx)
	movb	43(%rsp), %r9b
	movb	%r9b, 11(%rcx)
	movb	44(%rsp), %r9b
	movb	%r9b, 12(%rcx)
	movb	45(%rsp), %r9b
	movb	%r9b, 13(%rcx)
	movb	46(%rsp), %r9b
	movb	%r9b, 14(%rcx)
	movb	47(%rsp), %r9b
	movb	%r9b, 15(%rcx)
	movb	48(%rsp), %r9b
	movb	%r9b, 16(%rcx)
	movb	49(%rsp), %r9b
	movb	%r9b, 17(%rcx)
	movb	50(%rsp), %r9b
	movb	%r9b, 18(%rcx)
	movb	51(%rsp), %r9b
	movb	%r9b, 19(%rcx)
	movb	52(%rsp), %r9b
	movb	%r9b, 20(%rcx)
	movb	53(%rsp), %r9b
	movb	%r9b, 21(%rcx)
	movb	54(%rsp), %r9b
	movb	%r9b, 22(%rcx)
	movb	55(%rsp), %r9b
	movb	%r9b, 23(%rcx)
	movb	56(%rsp), %r9b
	movb	%r9b, 24(%rcx)
	movb	57(%rsp), %r9b
	movb	%r9b, 25(%rcx)
	movb	58(%rsp), %r9b
	movb	%r9b, 26(%rcx)
	movb	59(%rsp), %r9b
	movb	%r9b, 27(%rcx)
	movb	60(%rsp), %r9b
	movb	%r9b, 28(%rcx)
	movb	61(%rsp), %r9b
	movb	%r9b, 29(%rcx)
	movb	62(%rsp), %r9b
	movb	%r9b, 30(%rcx)
	movb	63(%rsp), %r9b
	movb	%r9b, 31(%rcx)
	movb	64(%rsp), %r9b
	movb	%r9b, 32(%rcx)
	movb	65(%rsp), %r9b
	movb	%r9b, 33(%rcx)
	movb	66(%rsp), %r9b
	movb	%r9b, 34(%rcx)
	movb	67(%rsp), %r9b
	movb	%r9b, 35(%rcx)
	movb	68(%rsp), %r9b
	movb	%r9b, 36(%rcx)
	movb	69(%rsp), %r9b
	movb	%r9b, 37(%rcx)
	movb	70(%rsp), %r9b
	movb	%r9b, 38(%rcx)
	ret
.Lthash_x4_2n__thash_x4$1:
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
	movq	(%rsi), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rcx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	8(%rsi), %rcx
	movq	%rcx, 64(%rsp)
	movq	%rcx, 72(%rsp)
	movq	%rcx, 80(%rsp)
	movq	%rcx, 88(%rsp)
	movq	16(%rsi), %rcx
	movq	%rcx, 96(%rsp)
	movq	%rcx, 104(%rsp)
	movq	%rcx, 112(%rsp)
	movq	%rcx, 120(%rsp)
	movl	(%rdi), %ecx
	bswapl	%ecx
	movl	4(%rdi), %esi
	bswapl	%esi
	movl	%ecx, 128(%rsp)
	movl	%esi, 132(%rsp)
	movl	%ecx, 136(%rsp)
	movl	%esi, 140(%rsp)
	movl	%ecx, 144(%rsp)
	movl	%esi, 148(%rsp)
	movl	%ecx, 152(%rsp)
	movl	%esi, 156(%rsp)
	movl	8(%rdi), %ecx
	bswapl	%ecx
	movl	12(%rdi), %esi
	bswapl	%esi
	movl	%ecx, 160(%rsp)
	movl	%esi, 164(%rsp)
	movl	%ecx, 168(%rsp)
	movl	%esi, 172(%rsp)
	movl	%ecx, 176(%rsp)
	movl	%esi, 180(%rsp)
	movl	%ecx, 184(%rsp)
	movl	%esi, 188(%rsp)
	movl	16(%rdi), %ecx
	bswapl	%ecx
	movl	20(%rdi), %esi
	bswapl	%esi
	movl	%ecx, 192(%rsp)
	movl	%esi, 196(%rsp)
	movl	%ecx, 200(%rsp)
	movl	%esi, 204(%rsp)
	movl	%ecx, 208(%rsp)
	movl	%esi, 212(%rsp)
	movl	%ecx, 216(%rsp)
	movl	%esi, 220(%rsp)
	movl	(%rax), %ecx
	bswapl	%ecx
	movl	4(%rax), %esi
	bswapl	%esi
	movl	%ecx, 224(%rsp)
	movl	%esi, 228(%rsp)
	movl	8(%rax), %ecx
	bswapl	%ecx
	movl	12(%rax), %esi
	bswapl	%esi
	movl	%ecx, 232(%rsp)
	movl	%esi, 236(%rsp)
	movl	16(%rax), %ecx
	bswapl	%ecx
	movl	20(%rax), %esi
	bswapl	%esi
	movl	%ecx, 240(%rsp)
	movl	%esi, 244(%rsp)
	movl	24(%rax), %ecx
	bswapl	%ecx
	movl	28(%rax), %esi
	bswapl	%esi
	movl	%ecx, 248(%rsp)
	movl	%esi, 252(%rsp)
	movq	(%rdx), %rcx
	movq	%rcx, 256(%rsp)
	movq	48(%rdx), %rcx
	movq	%rcx, 264(%rsp)
	movq	96(%rdx), %rcx
	movq	%rcx, 272(%rsp)
	movq	144(%rdx), %rcx
	movq	%rcx, 280(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 288(%rsp)
	movq	56(%rdx), %rcx
	movq	%rcx, 296(%rsp)
	movq	104(%rdx), %rcx
	movq	%rcx, 304(%rsp)
	movq	152(%rdx), %rcx
	movq	%rcx, 312(%rsp)
	movq	16(%rdx), %rcx
	movq	%rcx, 320(%rsp)
	movq	64(%rdx), %rcx
	movq	%rcx, 328(%rsp)
	movq	112(%rdx), %rcx
	movq	%rcx, 336(%rsp)
	movq	160(%rdx), %rcx
	movq	%rcx, 344(%rsp)
	movq	24(%rdx), %rcx
	movq	%rcx, 352(%rsp)
	movq	72(%rdx), %rcx
	movq	%rcx, 360(%rsp)
	movq	120(%rdx), %rcx
	movq	%rcx, 368(%rsp)
	movq	168(%rdx), %rcx
	movq	%rcx, 376(%rsp)
	movq	32(%rdx), %rcx
	movq	%rcx, 384(%rsp)
	movq	80(%rdx), %rcx
	movq	%rcx, 392(%rsp)
	movq	128(%rdx), %rcx
	movq	%rcx, 400(%rsp)
	movq	176(%rdx), %rcx
	movq	%rcx, 408(%rsp)
	movq	40(%rdx), %rcx
	movq	%rcx, 416(%rsp)
	movq	88(%rdx), %rcx
	movq	%rcx, 424(%rsp)
	movq	136(%rdx), %rcx
	movq	%rcx, 432(%rsp)
	movq	184(%rdx), %rcx
	movq	%rcx, 440(%rsp)
	movq	$-9223372036854775808, %rcx
	movq	448(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 448(%rsp)
	movq	544(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 544(%rsp)
	movq	456(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 456(%rsp)
	movq	552(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 552(%rsp)
	movq	464(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 464(%rsp)
	movq	560(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 560(%rsp)
	movq	472(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 472(%rsp)
	movq	568(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 568(%rsp)
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.Lthash_x4_2n__thash_x4$2:
	movq	%mm0, %rax
	movq	32(%rsp), %rcx
	movq	%rcx, (%rax)
	movq	64(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	96(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	40(%rsp), %rcx
	movq	%rcx, 24(%rax)
	movq	72(%rsp), %rcx
	movq	%rcx, 32(%rax)
	movq	104(%rsp), %rcx
	movq	%rcx, 40(%rax)
	movq	48(%rsp), %rcx
	movq	%rcx, 48(%rax)
	movq	80(%rsp), %rcx
	movq	%rcx, 56(%rax)
	movq	112(%rsp), %rcx
	movq	%rcx, 64(%rax)
	movq	56(%rsp), %rcx
	movq	%rcx, 72(%rax)
	movq	88(%rsp), %rcx
	movq	%rcx, 80(%rax)
	movq	120(%rsp), %rcx
	movq	%rcx, 88(%rax)
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
	movq	(%rsi), %rdi
	movq	%rdi, 32(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%rdi, 48(%rsp)
	movq	%rdi, 56(%rsp)
	movq	8(%rsi), %rdi
	movq	%rdi, 64(%rsp)
	movq	%rdi, 72(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%rdi, 88(%rsp)
	movq	16(%rsi), %rsi
	movq	%rsi, 96(%rsp)
	movq	%rsi, 104(%rsp)
	movq	%rsi, 112(%rsp)
	movq	%rsi, 120(%rsp)
	movl	(%r9), %esi
	bswapl	%esi
	movl	4(%r9), %edi
	bswapl	%edi
	movl	%esi, 128(%rsp)
	movl	%edi, 132(%rsp)
	movl	%esi, 136(%rsp)
	movl	%edi, 140(%rsp)
	movl	%esi, 144(%rsp)
	movl	%edi, 148(%rsp)
	movl	%esi, 152(%rsp)
	movl	%edi, 156(%rsp)
	movl	8(%r9), %esi
	bswapl	%esi
	movl	12(%r9), %edi
	bswapl	%edi
	movl	%esi, 160(%rsp)
	movl	%edi, 164(%rsp)
	movl	%esi, 168(%rsp)
	movl	%edi, 172(%rsp)
	movl	%esi, 176(%rsp)
	movl	%edi, 180(%rsp)
	movl	%esi, 184(%rsp)
	movl	%edi, 188(%rsp)
	movl	16(%r9), %esi
	bswapl	%esi
	movl	20(%r9), %edi
	bswapl	%edi
	movl	%esi, 192(%rsp)
	movl	%edi, 196(%rsp)
	movl	%esi, 200(%rsp)
	movl	%edi, 204(%rsp)
	movl	%esi, 208(%rsp)
	movl	%edi, 212(%rsp)
	movl	%esi, 216(%rsp)
	movl	%edi, 220(%rsp)
	movl	(%rcx), %esi
	bswapl	%esi
	movl	4(%rcx), %edi
	bswapl	%edi
	movl	%esi, 224(%rsp)
	movl	%edi, 228(%rsp)
	movl	8(%rcx), %esi
	bswapl	%esi
	movl	12(%rcx), %edi
	bswapl	%edi
	movl	%esi, 232(%rsp)
	movl	%edi, 236(%rsp)
	movl	16(%rcx), %esi
	bswapl	%esi
	movl	20(%rcx), %edi
	bswapl	%edi
	movl	%esi, 240(%rsp)
	movl	%edi, 244(%rsp)
	movl	24(%rcx), %esi
	bswapl	%esi
	movl	28(%rcx), %ecx
	bswapl	%ecx
	movl	%esi, 248(%rsp)
	movl	%ecx, 252(%rsp)
	movq	(%rdx), %rcx
	movq	%rcx, 256(%rsp)
	movq	24(%rdx), %rcx
	movq	%rcx, 264(%rsp)
	movq	48(%rdx), %rcx
	movq	%rcx, 272(%rsp)
	movq	72(%rdx), %rcx
	movq	%rcx, 280(%rsp)
	movq	8(%rdx), %rcx
	movq	%rcx, 288(%rsp)
	movq	32(%rdx), %rcx
	movq	%rcx, 296(%rsp)
	movq	56(%rdx), %rcx
	movq	%rcx, 304(%rsp)
	movq	80(%rdx), %rcx
	movq	%rcx, 312(%rsp)
	movq	16(%rdx), %rcx
	movq	%rcx, 320(%rsp)
	movq	40(%rdx), %rcx
	movq	%rcx, 328(%rsp)
	movq	64(%rdx), %rcx
	movq	%rcx, 336(%rsp)
	movq	88(%rdx), %rcx
	movq	%rcx, 344(%rsp)
	movq	$-9223372036854775808, %rcx
	movq	352(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 352(%rsp)
	movq	544(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 544(%rsp)
	movq	360(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 360(%rsp)
	movq	552(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 552(%rsp)
	movq	368(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 368(%rsp)
	movq	560(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 560(%rsp)
	movq	376(%rsp), %rsi
	xorq	$31, %rsi
	movq	%rsi, 376(%rsp)
	movq	568(%rsp), %rsi
	xorq	%rcx, %rsi
	movq	%rsi, 568(%rsp)
	leaq	32(%rsp), %rcx
	call	.L_keccakf1600_avx2x4_nat$1
.Lthash_x4_n__thash_x4$2:
	movq	%mm1, %rdi
	movq	32(%rsp), %rcx
	movq	%rcx, (%rdi)
	movq	64(%rsp), %rcx
	movq	%rcx, 8(%rdi)
	movq	96(%rsp), %rcx
	movq	%rcx, 16(%rdi)
	movq	40(%rsp), %rcx
	movq	%rcx, 24(%rdi)
	movq	72(%rsp), %rcx
	movq	%rcx, 32(%rdi)
	movq	104(%rsp), %rcx
	movq	%rcx, 40(%rdi)
	movq	48(%rsp), %rcx
	movq	%rcx, 48(%rdi)
	movq	80(%rsp), %rcx
	movq	%rcx, 56(%rdi)
	movq	112(%rsp), %rcx
	movq	%rcx, 64(%rdi)
	movq	56(%rsp), %rcx
	movq	%rcx, 72(%rdi)
	movq	88(%rsp), %rcx
	movq	%rcx, 80(%rdi)
	movq	120(%rsp), %rcx
	movq	%rcx, 88(%rdi)
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
	leaq	glob_data + 448(%rip), %rdx
	movq	$0, %rsi
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
	vpbroadcastq	(%rdx,%rsi,8), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	incq	%rsi
	cmpq	$24, %rsi
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
