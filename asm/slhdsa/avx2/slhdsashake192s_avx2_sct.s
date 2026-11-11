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
	movq	(%rsi), %rax
	movq	8(%rsi), %rsi
	movq	%rcx, %r9
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
	movq	%rdi, %rax
	movq	(%rdx), %rdi
	movq	8(%rdx), %rdx
	movq	%rcx, %r10
	cmpq	$255, %rdx
	jbe 	.Lslh_dsa_shake192s_sign$1
	movq	$-1, %rax
	jmp 	.Lslh_dsa_shake192s_sign$2
.Lslh_dsa_shake192s_sign$1:
	movq	%rdi, %rcx
	movq	%r10, %rdi
	leaq	-184(%rsp), %rsp
	call	.Lslh_sign_internal_$1
.Lslh_dsa_shake192s_sign$3:
	leaq	184(%rsp), %rsp
	movq	%rcx, %rax
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
	leaq	-8(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rax, (%rsp)
	movq	%rdx, %rax
	leaq	-56(%rsp), %rsp
	call	.Lslh_keygen_internal_$1
.Lslh_dsa_shake192s_keygen$1:
	leaq	56(%rsp), %rsp
	movq	(%rsp), %rsp
	ret
.Lslh_verify_internal_$1:
	leaq	80(%rsp), %r11
	movq	$0, (%r11)
	movq	$0, 8(%r11)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
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
	movq	72(%rsp), %rcx
	leaq	128(%rsp), %rdx
	leaq	158(%rsp), %rdi
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
	movzbl	(%rdi), %r9d
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
	movzbl	1(%rdi), %r9d
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
	movzbl	2(%rdi), %r9d
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
	movzbl	3(%rdi), %r9d
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
	movzbl	4(%rdi), %r9d
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
	movzbl	5(%rdi), %r9d
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
	movzbl	6(%rdi), %r9d
	orl 	%r9d, 124(%rsp)
	movl	$0, 116(%rsp)
	andl	$4194303, 120(%rsp)
	movl	$0, %edi
	shll	$8, %edi
	movzbl	(%r8), %r9d
	orl 	%r9d, %edi
	shll	$8, %edi
	movzbl	1(%r8), %r9d
	orl 	%r9d, %edi
	andl	$511, %edi
	leaq	80(%rsp), %r11
	movl	116(%rsp), %r8d
	movl	%r8d, 4(%r11)
	movl	120(%rsp), %r8d
	movl	%r8d, 8(%r11)
	movl	124(%rsp), %r8d
	movl	%r8d, 12(%r11)
	leaq	80(%rsp), %r11
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$3, 16(%r11)
	leaq	80(%rsp), %r11
	movl	%edi, 20(%r11)
	leaq	24(%rcx), %r8
	movq	%rsi, 72(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rcx, 56(%rsp)
	movl	%edi, 112(%rsp)
	leaq	32(%rsp), %rax
	leaq	80(%rsp), %rdi
	movq	%rax, %rcx
	movq	%r8, %rax
	leaq	-728(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	728(%rsp), %rsp
	movq	72(%rsp), %rsi
	movq	64(%rsp), %r10
	movq	56(%rsp), %rax
	movl	112(%rsp), %edx
	leaq	32(%rsp), %rcx
	leaq	6144(%rax), %rdi
	leaq	116(%rsp), %r8
	movq	%rcx, %rax
	movq	%rdi, %rcx
	leaq	-152(%rsp), %rsp
	call	.Lht_verify$1
.Lslh_verify_internal_$2:
	leaq	152(%rsp), %rsp
	ret
.Lslh_sign_internal_$1:
	leaq	104(%rsp), %r11
	movq	$0, (%r11)
	movq	$0, 8(%r11)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movq	%rcx, 56(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%rdi, 72(%rsp)
	movq	%r8, 80(%rsp)
	leaq	24(%rsi), %r10
	movq	%rax, %r11
	movq	%rax, 88(%rsp)
	movq	%rsi, 96(%rsp)
	movq	%r10, %rax
	movq	%r9, %rsi
	leaq	-280(%rsp), %rsp
	call	.LPRF_msg$1
.Lslh_sign_internal_$6:
	leaq	280(%rsp), %rsp
	movq	88(%rsp), %rcx
	movq	96(%rsp), %rdi
	movq	56(%rsp), %r11
	movq	64(%rsp), %rbx
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rsi
	leaq	48(%rdi), %r9
	leaq	72(%rdi), %r10
// declassify_mem 24 [R9]
	movq	%r9, 80(%rsp)
	movq	%rcx, 72(%rsp)
	movq	%rdi, 64(%rsp)
	leaq	152(%rsp), %rdi
	movq	%rax, %r8
	movq	%rbx, %rcx
	leaq	-280(%rsp), %rsp
	call	.LH_msg$1
.Lslh_sign_internal_$5:
	leaq	280(%rsp), %rsp
// declassify_mem 39 [RSP + 152]
	movq	80(%rsp), %rsi
	movq	72(%rsp), %rax
	movq	64(%rsp), %rcx
	leaq	152(%rsp), %rdx
	leaq	182(%rsp), %rdi
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
	movzbl	(%rdi), %r9d
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
	movzbl	1(%rdi), %r9d
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
	movzbl	2(%rdi), %r9d
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
	movzbl	3(%rdi), %r9d
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
	movzbl	4(%rdi), %r9d
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
	movzbl	5(%rdi), %r9d
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
	movzbl	6(%rdi), %r9d
	orl 	%r9d, 148(%rsp)
	movl	$0, 140(%rsp)
	andl	$4194303, 144(%rsp)
	movl	$0, %edi
	shll	$8, %edi
	movzbl	(%r8), %r9d
	orl 	%r9d, %edi
	shll	$8, %edi
	movzbl	1(%r8), %r9d
	orl 	%r9d, %edi
	andl	$511, %edi
	leaq	104(%rsp), %r11
	movl	140(%rsp), %r8d
	movl	%r8d, 4(%r11)
	movl	144(%rsp), %r8d
	movl	%r8d, 8(%r11)
	movl	148(%rsp), %r8d
	movl	%r8d, 12(%r11)
	leaq	104(%rsp), %r11
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$3, 16(%r11)
	leaq	104(%rsp), %r11
	movl	%edi, 20(%r11)
	leaq	24(%rax), %r8
	movq	%rcx, 64(%rsp)
	movq	%rsi, 72(%rsp)
	movq	%rax, 80(%rsp)
	movq	%rdx, 56(%rsp)
	movl	%edi, 136(%rsp)
	leaq	104(%rsp), %rdi
	movq	%r8, %rax
	movq	%rcx, %r11
	leaq	-152(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	152(%rsp), %rsp
// declassify_mem 6120 [RAX]
	movq	64(%rsp), %rcx
	movq	72(%rsp), %rsi
	movq	80(%rsp), %r8
	movq	56(%rsp), %rdx
	movl	136(%rsp), %edi
	movq	%rcx, 56(%rsp)
	movq	%rsi, 80(%rsp)
	movq	%r8, 72(%rsp)
	movl	%edi, 136(%rsp)
	leaq	32(%rsp), %rcx
	leaq	104(%rsp), %rdi
	leaq	-728(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	728(%rsp), %rsp
	movq	56(%rsp), %r11
	movq	80(%rsp), %rsi
	movq	72(%rsp), %rax
	movl	136(%rsp), %edx
	leaq	6144(%rax), %rcx
	movq	%rax, 72(%rsp)
	leaq	32(%rsp), %rax
	leaq	140(%rsp), %r8
	leaq	-152(%rsp), %rsp
	call	.Lht_sign$1
.Lslh_sign_internal_$2:
	leaq	152(%rsp), %rsp
	movq	72(%rsp), %rax
// declassify_mem 16224 [RAX]
	movq	$0, %rcx
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
	movq	%rsi, %r11
	leaq	48(%rsi), %r9
	leaq	24(%rsp), %rax
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$6, %r8d
	leaq	24(%rsp), %rax
	movl	%r8d, (%rax)
	movl	$0, %r10d
	movl	$9, %eax
	leaq	72(%rsi), %rcx
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rdi
	movl	%eax, %edx
	movq	%r9, %rsi
	leaq	-24696(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	24696(%rsp), %rsp
	movq	%rcx, %rdx
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdi
	leaq	24(%rdi), %rax
	movb	(%rdx), %r8b
	movb	%r8b, (%rax)
	movb	1(%rdx), %r8b
	movb	%r8b, 1(%rax)
	movb	2(%rdx), %r8b
	movb	%r8b, 2(%rax)
	movb	3(%rdx), %r8b
	movb	%r8b, 3(%rax)
	movb	4(%rdx), %r8b
	movb	%r8b, 4(%rax)
	movb	5(%rdx), %r8b
	movb	%r8b, 5(%rax)
	movb	6(%rdx), %r8b
	movb	%r8b, 6(%rax)
	movb	7(%rdx), %r8b
	movb	%r8b, 7(%rax)
	movb	8(%rdx), %r8b
	movb	%r8b, 8(%rax)
	movb	9(%rdx), %r8b
	movb	%r8b, 9(%rax)
	movb	10(%rdx), %r8b
	movb	%r8b, 10(%rax)
	movb	11(%rdx), %r8b
	movb	%r8b, 11(%rax)
	movb	12(%rdx), %r8b
	movb	%r8b, 12(%rax)
	movb	13(%rdx), %r8b
	movb	%r8b, 13(%rax)
	movb	14(%rdx), %r8b
	movb	%r8b, 14(%rax)
	movb	15(%rdx), %r8b
	movb	%r8b, 15(%rax)
	movb	16(%rdx), %r8b
	movb	%r8b, 16(%rax)
	movb	17(%rdx), %r8b
	movb	%r8b, 17(%rax)
	movb	18(%rdx), %r8b
	movb	%r8b, 18(%rax)
	movb	19(%rdx), %r8b
	movb	%r8b, 19(%rax)
	movb	20(%rdx), %r8b
	movb	%r8b, 20(%rax)
	movb	21(%rdx), %r8b
	movb	%r8b, 21(%rax)
	movb	22(%rdx), %r8b
	movb	%r8b, 22(%rax)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rax)
// declassify_mem 48 [RDI]
	ret
.Lfors_pkfromsig$1:
	movq	%rcx, 568(%rsp)
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
	movq	$0, %r10
	jmp 	.Lfors_pkfromsig$3
.Lfors_pkfromsig$4:
	movq	%rdx, 576(%rsp)
	leaq	(%rax,%rcx), %rdx
	leaq	64(%rsp), %r8
	movb	(%rdx), %r9b
	movb	%r9b, (%r8)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%r8)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%r8)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%r8)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%r8)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%r8)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%r8)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%r8)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%r8)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%r8)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%r8)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%r8)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%r8)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%r8)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%r8)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%r8)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%r8)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%r8)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%r8)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%r8)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%r8)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%r8)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%r8)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r8)
	movl	$0, %r9d
	movl	%r9d, 24(%rdi)
	movl	%r10d, %edx
	shll	$14, %edx
	addl	664(%rsp,%r10,4), %edx
	movl	%edx, 28(%rdi)
	movq	%rsi, 584(%rsp)
	movq	%rdi, 592(%rsp)
	movq	%rax, 600(%rsp)
	movq	%r10, 608(%rsp)
	movq	%rcx, 616(%rsp)
	leaq	64(%rsp), %rcx
	movq	%rsi, %r9
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	56(%rsp), %rsp
	movq	584(%rsp), %rsi
	movq	592(%rsp), %rdi
	movq	600(%rsp), %rax
	movq	608(%rsp), %r10
	movq	616(%rsp), %rcx
	addq	$24, %rcx
	movl	664(%rsp,%r10,4), %r11d
	movl	$0, %r8d
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movl	%r8d, %r9d
	incl	%r9d
	movl	%r9d, 24(%rdi)
	movl	%r11d, %edx
	andl	$1, %edx
	movl	%r8d, 656(%rsp)
	movl	%r11d, 660(%rsp)
	cmpl	$0, %edx
	je  	.Lfors_pkfromsig$8
	movl	28(%rdi), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	544(%rsp), %r8
	leaq	(%rax,%rcx), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%r8)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%r8)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%r8)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%r8)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%r8)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%r8)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%r8)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%r8)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%r8)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%r8)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%r8)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%r8)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%r8)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%r8)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%r8)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%r8)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%r8)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%r8)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%r8)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%r8)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%r8)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%r8)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%r8)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r8)
	leaq	512(%rsp), %r8
	leaq	64(%rsp), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%r8)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%r8)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%r8)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%r8)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%r8)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%r8)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%r8)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%r8)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%r8)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%r8)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%r8)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%r8)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%r8)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%r8)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%r8)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%r8)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%r8)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%r8)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%r8)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%r8)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%r8)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%r8)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%r8)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r8)
	jmp 	.Lfors_pkfromsig$9
.Lfors_pkfromsig$8:
	movl	28(%rdi), %edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	544(%rsp), %r8
	leaq	64(%rsp), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%r8)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%r8)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%r8)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%r8)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%r8)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%r8)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%r8)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%r8)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%r8)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%r8)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%r8)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%r8)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%r8)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%r8)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%r8)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%r8)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%r8)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%r8)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%r8)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%r8)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%r8)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%r8)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%r8)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r8)
	leaq	512(%rsp), %r8
	leaq	(%rax,%rcx), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%r8)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%r8)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%r8)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%r8)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%r8)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%r8)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%r8)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%r8)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%r8)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%r8)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%r8)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%r8)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%r8)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%r8)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%r8)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%r8)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%r8)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%r8)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%r8)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%r8)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%r8)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%r8)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%r8)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r8)
.Lfors_pkfromsig$9:
	movq	%rsi, 616(%rsp)
	movq	%rdi, 608(%rsp)
	movq	%rax, 600(%rsp)
	movq	%r10, 592(%rsp)
	movq	%rcx, 584(%rsp)
	leaq	32(%rsp), %rcx
	leaq	544(%rsp), %rdx
	leaq	512(%rsp), %r8
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	56(%rsp), %rsp
	movq	616(%rsp), %rsi
	movq	608(%rsp), %rdi
	movq	600(%rsp), %rax
	movq	592(%rsp), %r10
	movq	584(%rsp), %rcx
	leaq	64(%rsp), %r8
	leaq	32(%rsp), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%r8)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%r8)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%r8)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%r8)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%r8)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%r8)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%r8)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%r8)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%r8)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%r8)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%r8)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%r8)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%r8)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%r8)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%r8)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%r8)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%r8)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%r8)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%r8)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%r8)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%r8)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%r8)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%r8)
	movb	23(%rdx), %dl
	movb	%dl, 23(%r8)
	movl	656(%rsp), %r8d
	movl	660(%rsp), %r11d
	shrl	$1, %r11d
	addq	$24, %rcx
	incl	%r8d
.Lfors_pkfromsig$5:
	cmpl	$14, %r8d
	jb  	.Lfors_pkfromsig$6
	movq	576(%rsp), %rdx
	leaq	96(%rsp,%rdx), %r8
	leaq	64(%rsp), %r9
	movb	(%r9), %r11b
	movb	%r11b, (%r8)
	movb	1(%r9), %r11b
	movb	%r11b, 1(%r8)
	movb	2(%r9), %r11b
	movb	%r11b, 2(%r8)
	movb	3(%r9), %r11b
	movb	%r11b, 3(%r8)
	movb	4(%r9), %r11b
	movb	%r11b, 4(%r8)
	movb	5(%r9), %r11b
	movb	%r11b, 5(%r8)
	movb	6(%r9), %r11b
	movb	%r11b, 6(%r8)
	movb	7(%r9), %r11b
	movb	%r11b, 7(%r8)
	movb	8(%r9), %r11b
	movb	%r11b, 8(%r8)
	movb	9(%r9), %r11b
	movb	%r11b, 9(%r8)
	movb	10(%r9), %r11b
	movb	%r11b, 10(%r8)
	movb	11(%r9), %r11b
	movb	%r11b, 11(%r8)
	movb	12(%r9), %r11b
	movb	%r11b, 12(%r8)
	movb	13(%r9), %r11b
	movb	%r11b, 13(%r8)
	movb	14(%r9), %r11b
	movb	%r11b, 14(%r8)
	movb	15(%r9), %r11b
	movb	%r11b, 15(%r8)
	movb	16(%r9), %r11b
	movb	%r11b, 16(%r8)
	movb	17(%r9), %r11b
	movb	%r11b, 17(%r8)
	movb	18(%r9), %r11b
	movb	%r11b, 18(%r8)
	movb	19(%r9), %r11b
	movb	%r11b, 19(%r8)
	movb	20(%r9), %r11b
	movb	%r11b, 20(%r8)
	movb	21(%r9), %r11b
	movb	%r11b, 21(%r8)
	movb	22(%r9), %r11b
	movb	%r11b, 22(%r8)
	movb	23(%r9), %r9b
	movb	%r9b, 23(%r8)
	addq	$24, %rdx
	incq	%r10
.Lfors_pkfromsig$3:
	cmpq	$17, %r10
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
	movl	20(%rdi), %edi
	leaq	624(%rsp), %rax
	movl	%edi, 20(%rax)
	movq	568(%rsp), %rax
	leaq	624(%rsp), %rdi
	leaq	96(%rsp), %rcx
	movq	%rax, %r8
	movq	%rcx, %rax
	leaq	-56(%rsp), %rsp
	call	.LT_k$1
.Lfors_pkfromsig$2:
	leaq	56(%rsp), %rsp
	ret
.Lfors_sign$1:
	leaq	64(%rsp), %r8
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$41
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, (%r8)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$39
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 4(%r8)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$37
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 8(%r8)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$35
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 12(%r8)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$33
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 16(%r8)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$31
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 20(%r8)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$29
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 24(%r8)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$27
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 28(%r8)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$25
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 32(%r8)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$23
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 36(%r8)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$21
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 40(%r8)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$19
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 44(%r8)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$17
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 48(%r8)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$15
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 52(%r8)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$13
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 56(%r8)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$11
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 60(%r8)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$9
	movl	%r10d, %edx
	addl	$-14, %ecx
	shrq	%cl, %rdx
	andq	$16383, %rdx
	movl	%edx, 64(%r8)
	movq	$0, %r8
	movq	$0, %r10
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%r10d, %edx
	shll	$14, %edx
	addl	64(%rsp,%r10,4), %edx
	leaq	(%rax,%r8), %rcx
	movq	%r11, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%rax, 32(%rsp)
	movq	%r10, 40(%rsp)
	movq	%r8, 48(%rsp)
	movl	%edx, %r8d
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %r11
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rdi
	movq	32(%rsp), %rax
	movq	40(%rsp), %r10
	movq	48(%rsp), %r8
	addq	$24, %r8
	movl	64(%rsp,%r10,4), %edx
	xorl	$1, %edx
	movl	$0, %r9d
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%r11, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	%r10, 32(%rsp)
	movl	%r9d, 56(%rsp)
	movq	%r8, 24(%rsp)
	movl	%edx, 60(%rsp)
	movl	$14, %ecx
	subl	%r9d, %ecx
	shlq	%cl, %r10
	addl	%edx, %r10d
	leaq	(%rax,%r8), %rcx
	movq	%rax, 16(%rsp)
	movl	%r9d, %edx
	leaq	-786584(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	786584(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	48(%rsp), %r11
	movq	40(%rsp), %rsi
	movq	32(%rsp), %r10
	movl	56(%rsp), %r9d
	movq	24(%rsp), %r8
	movl	60(%rsp), %edx
	shrl	$1, %edx
	xorl	$1, %edx
	addq	$24, %r8
	incl	%r9d
.Lfors_sign$4:
	cmpl	$14, %r9d
	jb  	.Lfors_sign$5
	incq	%r10
.Lfors_sign$2:
	cmpq	$17, %r10
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rcx, 786504(%rsp)
	movl	$0, %r9d
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%edx, 786544(%rsp)
	movl	%edx, %ecx
	subl	%r9d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r8d
	imull	%r10d, %r8d
	addl	%r8d, %edx
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%r11, 786512(%rsp)
	movl	%edx, 786548(%rsp)
	cmpl	$0, %r9d
	je  	.Lfors_node$6
	movl	%r8d, %eax
	imull	$2, %eax, %eax
	movl	%r9d, %edx
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
	imulq	$24, %r11, %r11
	movq	%r11, %rax
	addq	$24, %rax
	leaq	786480(%rsp), %rcx
	leaq	32(%rsp,%r11), %rdx
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
	leaq	786448(%rsp), %rcx
	leaq	32(%rsp,%rax), %rdx
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
	movl	%r9d, 24(%rdi)
	movl	%r8d, 28(%rdi)
	movl	$15, %ecx
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
	imulq	$24, %r11, %rax
	movq	%rsi, 786520(%rsp)
	movq	%rdi, 786528(%rsp)
	movl	%r10d, 786552(%rsp)
	movl	%r9d, 786556(%rsp)
	movl	%r8d, 786560(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	786480(%rsp), %rdx
	leaq	786448(%rsp), %r8
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_node$10:
	leaq	56(%rsp), %rsp
	movq	786520(%rsp), %rsi
	movq	786528(%rsp), %rdi
	movl	786552(%rsp), %r10d
	movl	786556(%rsp), %r9d
	movl	786560(%rsp), %r8d
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%r9d, 24(%rdi)
	movl	%r8d, 28(%rdi)
	movl	$15, %ecx
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
	imulq	$24, %rbx, %rax
	movq	%rsi, 786520(%rsp)
	movq	%rdi, 786528(%rsp)
	movl	%r10d, 786552(%rsp)
	movl	%r9d, 786556(%rsp)
	movl	%r8d, 786560(%rsp)
	movq	%rax, 786536(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$9:
	leaq	40(%rsp), %rsp
	movq	786520(%rsp), %rsi
	movq	786528(%rsp), %rax
	movl	786552(%rsp), %r10d
	movl	786556(%rsp), %r8d
	movl	786560(%rsp), %edx
	movq	786536(%rsp), %rcx
	movq	%rsi, 786536(%rsp)
	movq	%rax, 786528(%rsp)
	movl	%r10d, 786560(%rsp)
	movl	%r8d, 786556(%rsp)
	movl	%edx, 786552(%rsp)
	movq	%rcx, 786520(%rsp)
	leaq	32(%rsp,%rcx), %rcx
	movq	%rsi, %r9
	movq	%rax, %rdi
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_node$8:
	leaq	56(%rsp), %rsp
	movq	786536(%rsp), %rsi
	movq	786528(%rsp), %rdi
	movl	786560(%rsp), %r10d
	movl	786556(%rsp), %r9d
	movl	786552(%rsp), %r8d
	movq	786520(%rsp), %rax
.Lfors_node$7:
	movq	786512(%rsp), %r11
	movl	786548(%rsp), %edx
	incl	%r8d
.Lfors_node$4:
	cmpl	%edx, %r8d
	jb  	.Lfors_node$5
	movl	786544(%rsp), %edx
	incl	%r9d
.Lfors_node$2:
	cmpl	%edx, %r9d
	jbe 	.Lfors_node$3
	movq	786504(%rsp), %rcx
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
	movl	20(%rdi), %edi
	leaq	8(%rsp), %rax
	movl	%edi, 20(%rax)
	leaq	8(%rsp), %rax
	movl	%r8d, 28(%rax)
	leaq	8(%rsp), %rax
	movq	%rcx, %r8
	movq	%rax, %rdx
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	56(%rsp), %rsp
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%r8), %r9d
	movl	%r9d, 76(%rsp)
	movl	4(%r8), %r9d
	movl	%r9d, 80(%rsp)
	movl	8(%r8), %r8d
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
	leaq	40(%rsp), %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rcx
	movq	$1440, %rdi
	movl	$1, %r8d
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%r8d, 72(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	76(%rsp), %rax
	movl	8(%rax), %edx
	andl	$511, %edx
	shrl	$9, 8(%rax)
	movl	4(%rax), %r9d
	shll	$23, %r9d
	orl 	%r9d, 8(%rax)
	shrl	$9, 4(%rax)
	movl	(%rax), %r9d
	shll	$23, %r9d
	orl 	%r9d, 4(%rax)
	shrl	$9, (%rax)
	leaq	40(%rsp), %rax
	movl	%r8d, (%rax)
	leaq	40(%rsp), %rax
	movl	76(%rsp), %r8d
	movl	%r8d, 4(%rax)
	movl	80(%rsp), %r8d
	movl	%r8d, 8(%rax)
	movl	84(%rsp), %r8d
	movl	%r8d, 12(%rax)
	leaq	112(%rsp), %rax
	leaq	88(%rsp), %r9
	movb	(%r9), %r8b
	movb	%r8b, (%rax)
	movb	1(%r9), %r8b
	movb	%r8b, 1(%rax)
	movb	2(%r9), %r8b
	movb	%r8b, 2(%rax)
	movb	3(%r9), %r8b
	movb	%r8b, 3(%rax)
	movb	4(%r9), %r8b
	movb	%r8b, 4(%rax)
	movb	5(%r9), %r8b
	movb	%r8b, 5(%rax)
	movb	6(%r9), %r8b
	movb	%r8b, 6(%rax)
	movb	7(%r9), %r8b
	movb	%r8b, 7(%rax)
	movb	8(%r9), %r8b
	movb	%r8b, 8(%rax)
	movb	9(%r9), %r8b
	movb	%r8b, 9(%rax)
	movb	10(%r9), %r8b
	movb	%r8b, 10(%rax)
	movb	11(%r9), %r8b
	movb	%r8b, 11(%rax)
	movb	12(%r9), %r8b
	movb	%r8b, 12(%rax)
	movb	13(%r9), %r8b
	movb	%r8b, 13(%rax)
	movb	14(%r9), %r8b
	movb	%r8b, 14(%rax)
	movb	15(%r9), %r8b
	movb	%r8b, 15(%rax)
	movb	16(%r9), %r8b
	movb	%r8b, 16(%rax)
	movb	17(%r9), %r8b
	movb	%r8b, 17(%rax)
	movb	18(%r9), %r8b
	movb	%r8b, 18(%rax)
	movb	19(%r9), %r8b
	movb	%r8b, 19(%rax)
	movb	20(%r9), %r8b
	movb	%r8b, 20(%rax)
	movb	21(%r9), %r8b
	movb	%r8b, 21(%rax)
	movb	22(%r9), %r8b
	movb	%r8b, 22(%rax)
	movb	23(%r9), %r8b
	movb	%r8b, 23(%rax)
	leaq	(%rcx,%rdi), %rdi
	movq	%rsi, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	88(%rsp), %rcx
	leaq	112(%rsp), %rax
	leaq	40(%rsp), %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %rsi
	movq	32(%rsp), %rcx
	movl	72(%rsp), %r8d
	movq	24(%rsp), %rdi
	addq	$1440, %rdi
	incl	%r8d
.Lht_verify$2:
	cmpl	$7, %r8d
	jb  	.Lht_verify$3
	movq	8(%rsp), %rax
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
	movl	(%r8), %r9d
	movl	%r9d, 80(%rsp)
	movl	4(%r8), %r9d
	movl	%r9d, 84(%rsp)
	movl	8(%r8), %r8d
	movl	%r8d, 88(%rsp)
	leaq	40(%rsp), %rdi
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	leaq	40(%rsp), %rdi
	movl	80(%rsp), %r8d
	movl	%r8d, 4(%rdi)
	movl	84(%rsp), %r8d
	movl	%r8d, 8(%rdi)
	movl	88(%rsp), %r8d
	movl	%r8d, 12(%rdi)
	movq	%rcx, %rdi
	movq	%rcx, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%edx, 72(%rsp)
	leaq	40(%rsp), %rcx
	movq	%rax, %r8
	movq	%rcx, %rax
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
// declassify_mem 1440 [RDI]
	movq	8(%rsp), %rcx
	movq	16(%rsp), %r11
	movq	24(%rsp), %rsi
	movq	32(%rsp), %rax
	movl	72(%rsp), %edx
	movq	%r11, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rcx, 16(%rsp)
	leaq	92(%rsp), %rcx
	leaq	40(%rsp), %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	216(%rsp), %rsp
	movq	32(%rsp), %r11
	movq	24(%rsp), %rsi
	movq	16(%rsp), %rcx
	movq	$1440, %rdi
	movl	$1, %r8d
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%r11, 16(%rsp)
	leaq	80(%rsp), %rax
	movl	8(%rax), %edx
	andl	$511, %edx
	shrl	$9, 8(%rax)
	movl	4(%rax), %r9d
	shll	$23, %r9d
	orl 	%r9d, 8(%rax)
	shrl	$9, 4(%rax)
	movl	(%rax), %r9d
	shll	$23, %r9d
	orl 	%r9d, 4(%rax)
	shrl	$9, (%rax)
	leaq	40(%rsp), %rax
	movl	%r8d, (%rax)
	leaq	40(%rsp), %rax
	movl	80(%rsp), %r9d
	movl	%r9d, 4(%rax)
	movl	84(%rsp), %r9d
	movl	%r9d, 8(%rax)
	movl	88(%rsp), %r9d
	movl	%r9d, 12(%rax)
	leaq	116(%rsp), %rax
	leaq	92(%rsp), %r9
	movb	(%r9), %r10b
	movb	%r10b, (%rax)
	movb	1(%r9), %r10b
	movb	%r10b, 1(%rax)
	movb	2(%r9), %r10b
	movb	%r10b, 2(%rax)
	movb	3(%r9), %r10b
	movb	%r10b, 3(%rax)
	movb	4(%r9), %r10b
	movb	%r10b, 4(%rax)
	movb	5(%r9), %r10b
	movb	%r10b, 5(%rax)
	movb	6(%r9), %r10b
	movb	%r10b, 6(%rax)
	movb	7(%r9), %r10b
	movb	%r10b, 7(%rax)
	movb	8(%r9), %r10b
	movb	%r10b, 8(%rax)
	movb	9(%r9), %r10b
	movb	%r10b, 9(%rax)
	movb	10(%r9), %r10b
	movb	%r10b, 10(%rax)
	movb	11(%r9), %r10b
	movb	%r10b, 11(%rax)
	movb	12(%r9), %r10b
	movb	%r10b, 12(%rax)
	movb	13(%r9), %r10b
	movb	%r10b, 13(%rax)
	movb	14(%r9), %r10b
	movb	%r10b, 14(%rax)
	movb	15(%r9), %r10b
	movb	%r10b, 15(%rax)
	movb	16(%r9), %r10b
	movb	%r10b, 16(%rax)
	movb	17(%r9), %r10b
	movb	%r10b, 17(%rax)
	movb	18(%r9), %r10b
	movb	%r10b, 18(%rax)
	movb	19(%r9), %r10b
	movb	%r10b, 19(%rax)
	movb	20(%r9), %r10b
	movb	%r10b, 20(%rax)
	movb	21(%r9), %r10b
	movb	%r10b, 21(%rax)
	movb	22(%r9), %r10b
	movb	%r10b, 22(%rax)
	movb	23(%r9), %r9b
	movb	%r9b, 23(%rax)
	leaq	(%rcx,%rdi), %rax
	movq	%rcx, 24(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%r8d, 72(%rsp)
	movq	%rdi, 8(%rsp)
	movl	%edx, 76(%rsp)
	leaq	116(%rsp), %r8
	leaq	40(%rsp), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rax
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	%rdi, %rax
// declassify_mem 1440 [RAX]
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rsi
	movl	72(%rsp), %r8d
	movq	8(%rsp), %rdi
	movl	76(%rsp), %edx
	cmpl	$6, %r8d
	jnb 	.Lht_sign$4
	movq	%rsi, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movl	%r8d, 76(%rsp)
	movq	%rdi, 24(%rsp)
	leaq	92(%rsp), %rcx
	leaq	116(%rsp), %r8
	leaq	40(%rsp), %r11
	movq	%rax, %rdi
	movq	%r8, %rax
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	216(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	32(%rsp), %rcx
	movl	76(%rsp), %r8d
	movq	24(%rsp), %rdi
.Lht_sign$4:
	movq	16(%rsp), %r11
	addq	$1440, %rdi
	incl	%r8d
.Lht_sign$2:
	cmpl	$7, %r8d
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 152(%rsp)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$0, 16(%r11)
	movl	%edx, 20(%r11)
	movq	%rdi, %rcx
	movq	%rsi, 160(%rsp)
	movl	%edx, 192(%rsp)
	movq	%rdi, 168(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %r8
	movq	%rcx, %rdx
	movq	%rsi, %rdi
	leaq	-1528(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	1528(%rsp), %rsp
	movq	%rax, %rdi
	movq	160(%rsp), %rsi
	movl	192(%rsp), %edx
	movq	168(%rsp), %rax
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%edx, 28(%rdi)
	movq	$1224, %r8
	movl	%edx, %r11d
	movl	$0, %ecx
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%ecx, %r9d
	incl	%r9d
	movl	%r9d, 24(%rdi)
	movl	%r11d, %edx
	andl	$1, %edx
	movl	%ecx, 192(%rsp)
	movl	%r11d, 196(%rsp)
	cmpl	$0, %edx
	je  	.Lxmss_pkfromsig$5
	movl	28(%rdi), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	128(%rsp), %rcx
	leaq	(%rax,%r8), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rcx)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rcx)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rcx)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rcx)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rcx)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rcx)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rcx)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rcx)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rcx)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rcx)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rcx)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rcx)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rcx)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rcx)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rcx)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rcx)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rcx)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rcx)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rcx)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rcx)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rcx)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rcx)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	96(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rcx)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rcx)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rcx)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rcx)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rcx)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rcx)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rcx)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rcx)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rcx)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rcx)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rcx)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rcx)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rcx)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rcx)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rcx)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rcx)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rcx)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rcx)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rcx)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rcx)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rcx)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rcx)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	jmp 	.Lxmss_pkfromsig$6
.Lxmss_pkfromsig$5:
	movl	28(%rdi), %edx
	shrl	$1, %edx
	movl	%edx, 28(%rdi)
	leaq	128(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rcx)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rcx)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rcx)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rcx)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rcx)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rcx)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rcx)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rcx)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rcx)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rcx)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rcx)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rcx)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rcx)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rcx)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rcx)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rcx)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rcx)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rcx)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rcx)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rcx)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rcx)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rcx)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	96(%rsp), %rcx
	leaq	(%rax,%r8), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rcx)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rcx)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rcx)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rcx)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rcx)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rcx)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rcx)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rcx)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rcx)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rcx)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rcx)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rcx)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rcx)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rcx)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rcx)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rcx)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rcx)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rcx)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rcx)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rcx)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rcx)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rcx)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
.Lxmss_pkfromsig$6:
	movq	%rsi, 168(%rsp)
	movq	%rdi, 160(%rsp)
	movq	%rax, 176(%rsp)
	movq	%r8, 184(%rsp)
	leaq	64(%rsp), %rcx
	leaq	128(%rsp), %rdx
	leaq	96(%rsp), %r8
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	56(%rsp), %rsp
	movq	168(%rsp), %rsi
	movq	160(%rsp), %rdi
	movq	176(%rsp), %rax
	movq	184(%rsp), %r8
	leaq	32(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rcx)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rcx)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rcx)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rcx)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rcx)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rcx)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rcx)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rcx)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rcx)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rcx)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rcx)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rcx)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rcx)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rcx)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rcx)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rcx)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rcx)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rcx)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rcx)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rcx)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rcx)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rcx)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	movl	192(%rsp), %ecx
	movl	196(%rsp), %r11d
	shrl	$1, %r11d
	addq	$24, %r8
	incl	%ecx
.Lxmss_pkfromsig$2:
	cmpl	$9, %ecx
	jb  	.Lxmss_pkfromsig$3
	movq	152(%rsp), %rcx
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
	movq	$1224, %rcx
	movl	%edx, %r10d
	xorl	$1, %r10d
	movl	$0, %r9d
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%r11, 16(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%edx, 48(%rsp)
	movl	%r9d, 52(%rsp)
	movl	%r10d, 56(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	(%rdi,%rcx), %rcx
	movq	%rdi, 40(%rsp)
	movl	%r9d, %edx
	movq	%rax, %rdi
	leaq	-24696(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	24696(%rsp), %rsp
	movq	%rdi, %rax
	movq	40(%rsp), %rdi
	movq	16(%rsp), %r11
	movq	24(%rsp), %rsi
	movl	48(%rsp), %edx
	movl	52(%rsp), %r9d
	movl	56(%rsp), %r10d
	movq	32(%rsp), %rcx
	shrl	$1, %r10d
	xorl	$1, %r10d
	addq	$24, %rcx
	incl	%r9d
.Lxmss_sign$3:
	cmpl	$9, %r9d
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %r8
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$0, 16(%rax)
	movl	%edx, 20(%rax)
	movq	%rdi, %rbx
	movq	%rdi, 8(%rsp)
	movq	%r8, %rdx
	movq	%rsi, %rdi
	leaq	-296(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	296(%rsp), %rsp
	movq	8(%rsp), %rdi
	ret
.Lxmss_node$1:
	movq	%rcx, 24648(%rsp)
	movl	$0, %r8d
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%edx, 24680(%rsp)
	movl	%edx, %ecx
	subl	%r8d, %ecx
	movq	$1, %r9
	shlq	%cl, %r9
	movl	%r9d, %edx
	imull	%r10d, %edx
	addl	%edx, %r9d
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%r11, 24656(%rsp)
	movq	%rsi, 24664(%rsp)
	movl	%r10d, 24684(%rsp)
	movl	%r8d, 24688(%rsp)
	movl	%edx, 24692(%rsp)
	movl	%r9d, 24696(%rsp)
	cmpl	$0, %r8d
	je  	.Lxmss_node$6
	movl	%edx, %eax
	imull	$2, %eax, %eax
	movl	%r8d, %r9d
	decl	%r9d
	movl	$10, %ecx
	movq	$1, %r10
	shlq	%cl, %r10
	subl	%r9d, %ecx
	movq	$1, %r9
	shlq	%cl, %r9
	subq	%r9, %r10
	movl	%eax, %eax
	addq	%rax, %r10
	imulq	$24, %r10, %r10
	movq	%r10, %rax
	addq	$24, %rax
	leaq	24624(%rsp), %rcx
	leaq	32(%rsp,%r10), %r9
	movb	(%r9), %r10b
	movb	%r10b, (%rcx)
	movb	1(%r9), %r10b
	movb	%r10b, 1(%rcx)
	movb	2(%r9), %r10b
	movb	%r10b, 2(%rcx)
	movb	3(%r9), %r10b
	movb	%r10b, 3(%rcx)
	movb	4(%r9), %r10b
	movb	%r10b, 4(%rcx)
	movb	5(%r9), %r10b
	movb	%r10b, 5(%rcx)
	movb	6(%r9), %r10b
	movb	%r10b, 6(%rcx)
	movb	7(%r9), %r10b
	movb	%r10b, 7(%rcx)
	movb	8(%r9), %r10b
	movb	%r10b, 8(%rcx)
	movb	9(%r9), %r10b
	movb	%r10b, 9(%rcx)
	movb	10(%r9), %r10b
	movb	%r10b, 10(%rcx)
	movb	11(%r9), %r10b
	movb	%r10b, 11(%rcx)
	movb	12(%r9), %r10b
	movb	%r10b, 12(%rcx)
	movb	13(%r9), %r10b
	movb	%r10b, 13(%rcx)
	movb	14(%r9), %r10b
	movb	%r10b, 14(%rcx)
	movb	15(%r9), %r10b
	movb	%r10b, 15(%rcx)
	movb	16(%r9), %r10b
	movb	%r10b, 16(%rcx)
	movb	17(%r9), %r10b
	movb	%r10b, 17(%rcx)
	movb	18(%r9), %r10b
	movb	%r10b, 18(%rcx)
	movb	19(%r9), %r10b
	movb	%r10b, 19(%rcx)
	movb	20(%r9), %r10b
	movb	%r10b, 20(%rcx)
	movb	21(%r9), %r10b
	movb	%r10b, 21(%rcx)
	movb	22(%r9), %r10b
	movb	%r10b, 22(%rcx)
	movb	23(%r9), %r9b
	movb	%r9b, 23(%rcx)
	leaq	24592(%rsp), %rcx
	leaq	32(%rsp,%rax), %r9
	movb	(%r9), %r10b
	movb	%r10b, (%rcx)
	movb	1(%r9), %r10b
	movb	%r10b, 1(%rcx)
	movb	2(%r9), %r10b
	movb	%r10b, 2(%rcx)
	movb	3(%r9), %r10b
	movb	%r10b, 3(%rcx)
	movb	4(%r9), %r10b
	movb	%r10b, 4(%rcx)
	movb	5(%r9), %r10b
	movb	%r10b, 5(%rcx)
	movb	6(%r9), %r10b
	movb	%r10b, 6(%rcx)
	movb	7(%r9), %r10b
	movb	%r10b, 7(%rcx)
	movb	8(%r9), %r10b
	movb	%r10b, 8(%rcx)
	movb	9(%r9), %r10b
	movb	%r10b, 9(%rcx)
	movb	10(%r9), %r10b
	movb	%r10b, 10(%rcx)
	movb	11(%r9), %r10b
	movb	%r10b, 11(%rcx)
	movb	12(%r9), %r10b
	movb	%r10b, 12(%rcx)
	movb	13(%r9), %r10b
	movb	%r10b, 13(%rcx)
	movb	14(%r9), %r10b
	movb	%r10b, 14(%rcx)
	movb	15(%r9), %r10b
	movb	%r10b, 15(%rcx)
	movb	16(%r9), %r10b
	movb	%r10b, 16(%rcx)
	movb	17(%r9), %r10b
	movb	%r10b, 17(%rcx)
	movb	18(%r9), %r10b
	movb	%r10b, 18(%rcx)
	movb	19(%r9), %r10b
	movb	%r10b, 19(%rcx)
	movb	20(%r9), %r10b
	movb	%r10b, 20(%rcx)
	movb	21(%r9), %r10b
	movb	%r10b, 21(%rcx)
	movb	22(%r9), %r10b
	movb	%r10b, 22(%rcx)
	movb	23(%r9), %r9b
	movb	%r9b, 23(%rcx)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%r8d, 24(%rdi)
	movl	%edx, 28(%rdi)
	movl	$10, %ecx
	movq	$1, %r9
	shlq	%cl, %r9
	subl	%r8d, %ecx
	movq	$1, %r10
	shlq	%cl, %r10
	subq	%r10, %r9
	movl	%edx, %eax
	addq	%rax, %r9
	imulq	$24, %r9, %rax
	movq	%rdi, 24672(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	24624(%rsp), %rdx
	leaq	24592(%rsp), %r8
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_node$9:
	leaq	56(%rsp), %rsp
	movq	24672(%rsp), %rdi
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%edx, 20(%rdi)
	movl	%edx, %eax
	imulq	$24, %rax, %rax
	leaq	32(%rsp,%rax), %rcx
	leaq	-1336(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	1336(%rsp), %rsp
	movq	%rdx, %rdi
.Lxmss_node$7:
	movq	24656(%rsp), %r11
	movq	24664(%rsp), %rsi
	movl	24684(%rsp), %r10d
	movl	24688(%rsp), %r8d
	movl	24692(%rsp), %edx
	movl	24696(%rsp), %r9d
	incl	%edx
.Lxmss_node$4:
	cmpl	%r9d, %edx
	jb  	.Lxmss_node$5
	movl	24680(%rsp), %edx
	incl	%r8d
.Lxmss_node$2:
	cmpl	%edx, %r8d
	jbe 	.Lxmss_node$3
	movq	24648(%rsp), %rcx
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
	leaq	1316(%rsp), %rsi
	movq	%rsi, %r8
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_pkfromsig$106
.Lwots_pkfromsig$107:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$106:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$107
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, (%r8)
	jmp 	.Lwots_pkfromsig$104
.Lwots_pkfromsig$105:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$104:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$105
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 4(%r8)
	jmp 	.Lwots_pkfromsig$102
.Lwots_pkfromsig$103:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$102:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$103
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 8(%r8)
	jmp 	.Lwots_pkfromsig$100
.Lwots_pkfromsig$101:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$100:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$101
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 12(%r8)
	jmp 	.Lwots_pkfromsig$98
.Lwots_pkfromsig$99:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$98:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$99
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 16(%r8)
	jmp 	.Lwots_pkfromsig$96
.Lwots_pkfromsig$97:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$96:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$97
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 20(%r8)
	jmp 	.Lwots_pkfromsig$94
.Lwots_pkfromsig$95:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$94:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$95
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 24(%r8)
	jmp 	.Lwots_pkfromsig$92
.Lwots_pkfromsig$93:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$92:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$93
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 28(%r8)
	jmp 	.Lwots_pkfromsig$90
.Lwots_pkfromsig$91:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$90:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$91
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 32(%r8)
	jmp 	.Lwots_pkfromsig$88
.Lwots_pkfromsig$89:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$88:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$89
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 36(%r8)
	jmp 	.Lwots_pkfromsig$86
.Lwots_pkfromsig$87:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$86:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$87
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 40(%r8)
	jmp 	.Lwots_pkfromsig$84
.Lwots_pkfromsig$85:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$84:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$85
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 44(%r8)
	jmp 	.Lwots_pkfromsig$82
.Lwots_pkfromsig$83:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$82:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$83
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 48(%r8)
	jmp 	.Lwots_pkfromsig$80
.Lwots_pkfromsig$81:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$80:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$81
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 52(%r8)
	jmp 	.Lwots_pkfromsig$78
.Lwots_pkfromsig$79:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$78:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$79
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 56(%r8)
	jmp 	.Lwots_pkfromsig$76
.Lwots_pkfromsig$77:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$76:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$77
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 60(%r8)
	jmp 	.Lwots_pkfromsig$74
.Lwots_pkfromsig$75:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$74:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$75
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 64(%r8)
	jmp 	.Lwots_pkfromsig$72
.Lwots_pkfromsig$73:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$72:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$73
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 68(%r8)
	jmp 	.Lwots_pkfromsig$70
.Lwots_pkfromsig$71:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$70:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$71
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 72(%r8)
	jmp 	.Lwots_pkfromsig$68
.Lwots_pkfromsig$69:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$68:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$69
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 76(%r8)
	jmp 	.Lwots_pkfromsig$66
.Lwots_pkfromsig$67:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$66:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$67
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 80(%r8)
	jmp 	.Lwots_pkfromsig$64
.Lwots_pkfromsig$65:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$64:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$65
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 84(%r8)
	jmp 	.Lwots_pkfromsig$62
.Lwots_pkfromsig$63:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$62:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$63
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 88(%r8)
	jmp 	.Lwots_pkfromsig$60
.Lwots_pkfromsig$61:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$60:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$61
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 92(%r8)
	jmp 	.Lwots_pkfromsig$58
.Lwots_pkfromsig$59:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$58:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$59
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 96(%r8)
	jmp 	.Lwots_pkfromsig$56
.Lwots_pkfromsig$57:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$56:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$57
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 100(%r8)
	jmp 	.Lwots_pkfromsig$54
.Lwots_pkfromsig$55:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$54:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$55
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 104(%r8)
	jmp 	.Lwots_pkfromsig$52
.Lwots_pkfromsig$53:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$52:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$53
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 108(%r8)
	jmp 	.Lwots_pkfromsig$50
.Lwots_pkfromsig$51:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$50:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$51
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 112(%r8)
	jmp 	.Lwots_pkfromsig$48
.Lwots_pkfromsig$49:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$48:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$49
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 116(%r8)
	jmp 	.Lwots_pkfromsig$46
.Lwots_pkfromsig$47:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$46:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$47
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 120(%r8)
	jmp 	.Lwots_pkfromsig$44
.Lwots_pkfromsig$45:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$44:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$45
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 124(%r8)
	jmp 	.Lwots_pkfromsig$42
.Lwots_pkfromsig$43:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$42:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$43
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 128(%r8)
	jmp 	.Lwots_pkfromsig$40
.Lwots_pkfromsig$41:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$40:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$41
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 132(%r8)
	jmp 	.Lwots_pkfromsig$38
.Lwots_pkfromsig$39:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$38:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$39
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 136(%r8)
	jmp 	.Lwots_pkfromsig$36
.Lwots_pkfromsig$37:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$36:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$37
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 140(%r8)
	jmp 	.Lwots_pkfromsig$34
.Lwots_pkfromsig$35:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$34:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$35
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 144(%r8)
	jmp 	.Lwots_pkfromsig$32
.Lwots_pkfromsig$33:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$32:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$33
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 148(%r8)
	jmp 	.Lwots_pkfromsig$30
.Lwots_pkfromsig$31:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$30:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$31
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 152(%r8)
	jmp 	.Lwots_pkfromsig$28
.Lwots_pkfromsig$29:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$28:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$29
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 156(%r8)
	jmp 	.Lwots_pkfromsig$26
.Lwots_pkfromsig$27:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$26:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$27
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 160(%r8)
	jmp 	.Lwots_pkfromsig$24
.Lwots_pkfromsig$25:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$24:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$25
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 164(%r8)
	jmp 	.Lwots_pkfromsig$22
.Lwots_pkfromsig$23:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$22:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$23
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 168(%r8)
	jmp 	.Lwots_pkfromsig$20
.Lwots_pkfromsig$21:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$20:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$21
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 172(%r8)
	jmp 	.Lwots_pkfromsig$18
.Lwots_pkfromsig$19:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$18:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$19
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 176(%r8)
	jmp 	.Lwots_pkfromsig$16
.Lwots_pkfromsig$17:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$16:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$17
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 180(%r8)
	jmp 	.Lwots_pkfromsig$14
.Lwots_pkfromsig$15:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$14:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$15
	movl	%r10d, %ebx
	addl	$-4, %ecx
	shrq	%cl, %rbx
	andq	$15, %rbx
	movl	%ebx, 184(%r8)
	jmp 	.Lwots_pkfromsig$12
.Lwots_pkfromsig$13:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebx
	orl 	%ebx, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$12:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$13
	movl	%r10d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 188(%r8)
	movq	%rsi, %rax
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
	movb	%al, 1521(%rsp)
	shrl	$8, %ecx
	andl	$255, %ecx
	movb	%cl, 1520(%rsp)
	leaq	192(%rsi), %r8
	leaq	1520(%rsp), %rax
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_pkfromsig$10
.Lwots_pkfromsig$11:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %esi
	orl 	%esi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$10:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$11
	movl	%r10d, %esi
	addl	$-4, %ecx
	shrq	%cl, %rsi
	andq	$15, %rsi
	movl	%esi, (%r8)
	jmp 	.Lwots_pkfromsig$8
.Lwots_pkfromsig$9:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %esi
	orl 	%esi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$8:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$9
	movl	%r10d, %esi
	addl	$-4, %ecx
	shrq	%cl, %rsi
	andq	$15, %rsi
	movl	%esi, 4(%r8)
	jmp 	.Lwots_pkfromsig$6
.Lwots_pkfromsig$7:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %esi
	orl 	%esi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$6:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$7
	movl	%r10d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 8(%r8)
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
	movb	1223(%rdx), %dl
	movb	%dl, 1255(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkfromsig$3
.Lwots_pkfromsig$4:
	movq	%rdi, 1264(%rsp)
	movl	%ecx, 1312(%rsp)
	movq	%rdx, 1272(%rsp)
	movl	%ecx, %eax
	movl	%eax, 24(%r11)
	movl	%ecx, %eax
	movl	1316(%rsp,%rax,4), %r10d
	movl	$15, %eax
	subl	%r10d, %eax
	leaq	32(%rsp,%rdx), %rcx
	movl	%eax, %edx
	movq	%rdi, %r9
	movq	%r11, %rdi
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkfromsig$5:
	leaq	24(%rsp), %rsp
	movq	%rdi, %r11
	movq	1264(%rsp), %rdi
	movl	1312(%rsp), %ecx
	movq	1272(%rsp), %rdx
	incl	%ecx
	addq	$24, %rdx
.Lwots_pkfromsig$3:
	cmpl	$51, %ecx
	jb  	.Lwots_pkfromsig$4
	leaq	1280(%rsp), %rax
	movq	(%r11), %rdx
	movq	%rdx, (%rax)
	movq	8(%r11), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r11), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r11), %rdx
	movq	%rdx, 24(%rax)
	leaq	1280(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$1, 16(%rax)
	movl	20(%r11), %eax
	leaq	1280(%rsp), %rcx
	movl	%eax, 20(%rcx)
	movq	1256(%rsp), %rax
	movq	%r11, 1256(%rsp)
	leaq	1280(%rsp), %rcx
	leaq	32(%rsp), %rdx
	movq	%rax, %r8
	movq	%rdi, %rsi
	movq	%rcx, %rdi
	movq	%rdx, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkfromsig$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdx
	movq	1256(%rsp), %rax
	ret
.Lwots_sign$1:
	leaq	84(%rsp), %rsi
	movq	%rsi, %r8
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_sign$108
.Lwots_sign$109:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$108:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$109
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, (%r8)
	jmp 	.Lwots_sign$106
.Lwots_sign$107:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$106:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$107
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 4(%r8)
	jmp 	.Lwots_sign$104
.Lwots_sign$105:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$104:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$105
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 8(%r8)
	jmp 	.Lwots_sign$102
.Lwots_sign$103:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$102:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$103
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 12(%r8)
	jmp 	.Lwots_sign$100
.Lwots_sign$101:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$100:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$101
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 16(%r8)
	jmp 	.Lwots_sign$98
.Lwots_sign$99:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$98:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$99
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 20(%r8)
	jmp 	.Lwots_sign$96
.Lwots_sign$97:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$96:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$97
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 24(%r8)
	jmp 	.Lwots_sign$94
.Lwots_sign$95:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$94:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$95
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 28(%r8)
	jmp 	.Lwots_sign$92
.Lwots_sign$93:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$92:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$93
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 32(%r8)
	jmp 	.Lwots_sign$90
.Lwots_sign$91:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$90:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$91
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 36(%r8)
	jmp 	.Lwots_sign$88
.Lwots_sign$89:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$88:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$89
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 40(%r8)
	jmp 	.Lwots_sign$86
.Lwots_sign$87:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$86:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$87
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 44(%r8)
	jmp 	.Lwots_sign$84
.Lwots_sign$85:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$84:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$85
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 48(%r8)
	jmp 	.Lwots_sign$82
.Lwots_sign$83:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$82:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$83
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 52(%r8)
	jmp 	.Lwots_sign$80
.Lwots_sign$81:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$80:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$81
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 56(%r8)
	jmp 	.Lwots_sign$78
.Lwots_sign$79:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$78:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$79
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 60(%r8)
	jmp 	.Lwots_sign$76
.Lwots_sign$77:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$76:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$77
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 64(%r8)
	jmp 	.Lwots_sign$74
.Lwots_sign$75:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$74:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$75
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 68(%r8)
	jmp 	.Lwots_sign$72
.Lwots_sign$73:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$72:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$73
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 72(%r8)
	jmp 	.Lwots_sign$70
.Lwots_sign$71:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$70:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$71
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 76(%r8)
	jmp 	.Lwots_sign$68
.Lwots_sign$69:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$68:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$69
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 80(%r8)
	jmp 	.Lwots_sign$66
.Lwots_sign$67:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$66:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$67
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 84(%r8)
	jmp 	.Lwots_sign$64
.Lwots_sign$65:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$64:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$65
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 88(%r8)
	jmp 	.Lwots_sign$62
.Lwots_sign$63:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$62:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$63
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 92(%r8)
	jmp 	.Lwots_sign$60
.Lwots_sign$61:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$60:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$61
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 96(%r8)
	jmp 	.Lwots_sign$58
.Lwots_sign$59:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$58:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$59
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 100(%r8)
	jmp 	.Lwots_sign$56
.Lwots_sign$57:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$56:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$57
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 104(%r8)
	jmp 	.Lwots_sign$54
.Lwots_sign$55:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$54:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$55
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 108(%r8)
	jmp 	.Lwots_sign$52
.Lwots_sign$53:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$52:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$53
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 112(%r8)
	jmp 	.Lwots_sign$50
.Lwots_sign$51:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$50:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$51
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 116(%r8)
	jmp 	.Lwots_sign$48
.Lwots_sign$49:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$48:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$49
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 120(%r8)
	jmp 	.Lwots_sign$46
.Lwots_sign$47:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$46:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$47
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 124(%r8)
	jmp 	.Lwots_sign$44
.Lwots_sign$45:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$44:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$45
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 128(%r8)
	jmp 	.Lwots_sign$42
.Lwots_sign$43:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$42:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$43
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 132(%r8)
	jmp 	.Lwots_sign$40
.Lwots_sign$41:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$40:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$41
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 136(%r8)
	jmp 	.Lwots_sign$38
.Lwots_sign$39:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$38:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$39
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 140(%r8)
	jmp 	.Lwots_sign$36
.Lwots_sign$37:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$36:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$37
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 144(%r8)
	jmp 	.Lwots_sign$34
.Lwots_sign$35:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$34:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$35
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 148(%r8)
	jmp 	.Lwots_sign$32
.Lwots_sign$33:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$32:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$33
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 152(%r8)
	jmp 	.Lwots_sign$30
.Lwots_sign$31:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$30:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$31
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 156(%r8)
	jmp 	.Lwots_sign$28
.Lwots_sign$29:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$28:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$29
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 160(%r8)
	jmp 	.Lwots_sign$26
.Lwots_sign$27:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$26:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$27
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 164(%r8)
	jmp 	.Lwots_sign$24
.Lwots_sign$25:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$24:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$25
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 168(%r8)
	jmp 	.Lwots_sign$22
.Lwots_sign$23:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$22:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$23
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 172(%r8)
	jmp 	.Lwots_sign$20
.Lwots_sign$21:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$20:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$21
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 176(%r8)
	jmp 	.Lwots_sign$18
.Lwots_sign$19:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$18:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$19
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 180(%r8)
	jmp 	.Lwots_sign$16
.Lwots_sign$17:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$16:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$17
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 184(%r8)
	jmp 	.Lwots_sign$14
.Lwots_sign$15:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$14:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$15
	movl	%r10d, %edx
	addl	$-4, %ecx
	shrq	%cl, %rdx
	andq	$15, %rdx
	movl	%edx, 188(%r8)
	movq	%rsi, %rcx
	movl	$720, %edx
	subl	(%rcx), %edx
	subl	4(%rcx), %edx
	subl	8(%rcx), %edx
	subl	12(%rcx), %edx
	subl	16(%rcx), %edx
	subl	20(%rcx), %edx
	subl	24(%rcx), %edx
	subl	28(%rcx), %edx
	subl	32(%rcx), %edx
	subl	36(%rcx), %edx
	subl	40(%rcx), %edx
	subl	44(%rcx), %edx
	subl	48(%rcx), %edx
	subl	52(%rcx), %edx
	subl	56(%rcx), %edx
	subl	60(%rcx), %edx
	subl	64(%rcx), %edx
	subl	68(%rcx), %edx
	subl	72(%rcx), %edx
	subl	76(%rcx), %edx
	subl	80(%rcx), %edx
	subl	84(%rcx), %edx
	subl	88(%rcx), %edx
	subl	92(%rcx), %edx
	subl	96(%rcx), %edx
	subl	100(%rcx), %edx
	subl	104(%rcx), %edx
	subl	108(%rcx), %edx
	subl	112(%rcx), %edx
	subl	116(%rcx), %edx
	subl	120(%rcx), %edx
	subl	124(%rcx), %edx
	subl	128(%rcx), %edx
	subl	132(%rcx), %edx
	subl	136(%rcx), %edx
	subl	140(%rcx), %edx
	subl	144(%rcx), %edx
	subl	148(%rcx), %edx
	subl	152(%rcx), %edx
	subl	156(%rcx), %edx
	subl	160(%rcx), %edx
	subl	164(%rcx), %edx
	subl	168(%rcx), %edx
	subl	172(%rcx), %edx
	subl	176(%rcx), %edx
	subl	180(%rcx), %edx
	subl	184(%rcx), %edx
	subl	188(%rcx), %edx
	shll	$4, %edx
	movl	%edx, %ecx
	shrl	$0, %ecx
	andl	$255, %ecx
	movb	%cl, 289(%rsp)
	shrl	$8, %edx
	andl	$255, %edx
	movb	%dl, 288(%rsp)
	leaq	192(%rsi), %r8
	leaq	288(%rsp), %rdx
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %esi
	orl 	%esi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$12:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$13
	movl	%r10d, %esi
	addl	$-4, %ecx
	shrq	%cl, %rsi
	andq	$15, %rsi
	movl	%esi, (%r8)
	jmp 	.Lwots_sign$10
.Lwots_sign$11:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %esi
	orl 	%esi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$10:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$11
	movl	%r10d, %esi
	addl	$-4, %ecx
	shrq	%cl, %rsi
	andq	$15, %rsi
	movl	%esi, 4(%r8)
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %r10d
	movzbl	(%rdx,%r9), %esi
	orl 	%esi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$8:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$9
	movl	%r10d, %edx
	addl	$-4, %ecx
	shrq	%cl, %rdx
	andq	$15, %rdx
	movl	%edx, 8(%r8)
	leaq	48(%rsp), %rcx
	movq	(%rax), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
	leaq	48(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%rax), %ecx
	leaq	48(%rsp), %rdx
	movl	%ecx, 20(%rdx)
	movq	%rax, 8(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_sign$5
.Lwots_sign$6:
	movq	%r11, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movl	%ecx, 80(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%ecx, %eax
	leaq	48(%rsp), %rcx
	movl	%eax, 24(%rcx)
	leaq	(%rbx,%rdx), %rax
	movq	%rbx, 40(%rsp)
	leaq	48(%rsp), %rcx
	movq	%rax, %r8
	movq	%rdi, %rsi
	movq	%rcx, %rdx
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_sign$7:
	leaq	56(%rsp), %rsp
	movq	40(%rsp), %rbx
	movq	16(%rsp), %r11
	movq	24(%rsp), %rdi
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rdx
	incl	%ecx
	addq	$24, %rdx
.Lwots_sign$5:
	cmpl	$51, %ecx
	jb  	.Lwots_sign$6
	movq	8(%rsp), %rax
	movq	$0, %rsi
	movl	$0, %edx
	jmp 	.Lwots_sign$2
.Lwots_sign$3:
	movq	%rdi, 8(%rsp)
	movl	%edx, 80(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%edx, %ecx
	movl	%ecx, 24(%rax)
	movl	$0, %r10d
	movl	%edx, %ecx
	movl	84(%rsp,%rcx,4), %edx
	leaq	(%rbx,%rsi), %rcx
	movq	%rbx, 24(%rsp)
	movq	%rdi, %r9
	movq	%rax, %rdi
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_sign$4:
	leaq	24(%rsp), %rsp
	movq	%rdi, %rax
	movq	24(%rsp), %rbx
	movq	8(%rsp), %rdi
	movl	80(%rsp), %edx
	movq	32(%rsp), %rsi
	incl	%edx
	addq	$24, %rsi
.Lwots_sign$2:
	cmpl	$51, %edx
	jb  	.Lwots_sign$3
	ret
.Lwots_pkgen$1:
	movq	%rcx, 1256(%rsp)
	leaq	1296(%rsp), %rcx
	movq	(%rdi), %rdx
	movq	%rdx, (%rcx)
	movq	8(%rdi), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%rdi), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%rdi), %rdx
	movq	%rdx, 24(%rcx)
	leaq	1296(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%rdi), %ecx
	leaq	1296(%rsp), %rdx
	movl	%ecx, 20(%rdx)
	movl	%ecx, 1328(%rsp)
	movq	%rdi, 1264(%rsp)
	movq	$0, %rdi
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$6
.Lwots_pkgen$7:
	movq	%r11, 1272(%rsp)
	movq	%rsi, 1280(%rsp)
	movl	%ecx, 1332(%rsp)
	movq	%rdi, 1288(%rsp)
	leaq	1296(%rsp), %rdx
	movl	%ecx, 24(%rdx)
	leaq	32(%rsp,%rdi), %rcx
	leaq	1296(%rsp), %rdx
	movq	%rcx, %r8
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_pkgen$8:
	leaq	56(%rsp), %rsp
	movq	1272(%rsp), %r11
	movq	1280(%rsp), %rsi
	movl	1332(%rsp), %ecx
	movq	1288(%rsp), %rdi
	incl	%ecx
	addq	$24, %rdi
.Lwots_pkgen$6:
	cmpl	$51, %ecx
	jb  	.Lwots_pkgen$7
	movq	1264(%rsp), %rdi
	movq	$0, %r8
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$3
.Lwots_pkgen$4:
	movq	%rsi, 1264(%rsp)
	movl	%ecx, 1332(%rsp)
	movq	%r8, 1288(%rsp)
	movl	%ecx, 24(%rdi)
	movl	$0, %r10d
	movl	$15, %edx
	leaq	32(%rsp,%r8), %rcx
	movq	%rsi, %r9
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkgen$5:
	leaq	24(%rsp), %rsp
	movq	1264(%rsp), %rsi
	movl	1332(%rsp), %ecx
	movq	1288(%rsp), %r8
	incl	%ecx
	addq	$24, %r8
.Lwots_pkgen$3:
	cmpl	$51, %ecx
	jb  	.Lwots_pkgen$4
	leaq	1296(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$1, 16(%rcx)
	movl	1328(%rsp), %ecx
	leaq	1296(%rsp), %rdx
	movl	%ecx, 20(%rdx)
	movq	1256(%rsp), %rcx
	movq	%rdi, 1256(%rsp)
	leaq	1296(%rsp), %rdi
	leaq	32(%rsp), %rdx
	movq	%rcx, %r8
	movq	%rdx, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	56(%rsp), %rsp
	movq	1256(%rsp), %rdx
	ret
.Lchain$1:
	movl	%r10d, %esi
	addl	%edx, %esi
	jmp 	.Lchain$2
.Lchain$3:
	movl	%r10d, 28(%rdi)
	movq	%r9, 8(%rsp)
	movq	%rdi, 16(%rsp)
	movl	%r10d, 24(%rsp)
	movl	%esi, 28(%rsp)
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lchain$4:
	leaq	56(%rsp), %rsp
	movq	8(%rsp), %r9
	movq	16(%rsp), %rdi
	movl	24(%rsp), %r10d
	movl	28(%rsp), %esi
	incl	%r10d
.Lchain$2:
	cmpl	%esi, %r10d
	jb  	.Lchain$3
	ret
.LT_k$1:
	movq	%r8, 48(%rsp)
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
	movq	$0, %rdi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm2
	movq	24(%rcx,%rdi), %rcx
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
	movq	$0, %r10
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
	vpblendd	$240, %ymm13, %ymm7, %ymm8
	vpblendd	$240, %ymm7, %ymm13, %ymm7
	vpxor	%ymm14, %ymm0, %ymm0
	vpxor	%ymm11, %ymm2, %ymm2
	vpxor	%ymm8, %ymm1, %ymm1
	vpxor	%ymm7, %ymm3, %ymm3
	vmovdqu	%xmm10, %xmm7
	vinserti128	$1, %xmm9, %ymm7, %ymm7
	vpxor	%ymm7, %ymm6, %ymm6
	addq	$136, %rcx
	call	.L_keccakf1600_avx2$1
.LT_k$8:
	incq	%r10
.LT_k$6:
	cmpq	$2, %r10
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
	movq	$1, %rax
	shlq	$63, %rax
	vmovq	%rax, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	48(%rsp), %rax
	movq	$0, %rcx
	movq	$0, %r10
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
	incq	%r10
.LT_k$3:
	cmpq	$0, %r10
	jb  	.LT_k$4
	call	.L_keccakf1600_avx2$1
.LT_k$2:
	movq	%xmm5, (%rax,%rcx)
	vmovdqu	%xmm4, 8(%rax,%rcx)
	ret
.LT_len$1:
	movq	%r8, 48(%rsp)
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
	movq	$0, %rdi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rdx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rdx,%rdi), %rsi
	vmovq	%rsi, %xmm2
	movq	24(%rdx,%rdi), %rdx
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
	movq	$0, %rdi
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rcx,%rdi), %xmm0
	vpslldq	$8, %xmm0, %xmm0
	vmovdqu	%xmm0, %xmm0
	vmovdqu	8(%rcx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm0, %ymm14
	movq	24(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	32(%rcx,%rdi), %ymm13
	movq	64(%rcx,%rdi), %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm9
	movq	72(%rcx,%rdi), %rdx
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
	addq	$80, %rdi
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
	vmovq	%rdx, %xmm8
	vmovdqu	48(%rcx,%rdi), %ymm14
	movq	80(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	88(%rcx,%rdi), %ymm13
	movq	120(%rcx,%rdi), %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm9
	movq	128(%rcx,%rdi), %rdx
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
	addq	$136, %rdi
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%r10
.LT_len$6:
	cmpq	$8, %r10
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%rdi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rdi), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm8
	movq	48(%rcx,%rdi), %rcx
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
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm7
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm7, %ymm8, %ymm8
	vpxor	%ymm8, %ymm0, %ymm0
	movq	48(%rsp), %rcx
	movq	$0, %rdi
	movq	$0, %r10
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm4, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rdi)
	movq	%xmm8, %rdx
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
	vmovdqu	%xmm4, 8(%rcx,%rdi)
	ret
.LH$1:
	movq	%rcx, 48(%rsp)
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
	movq	$0, %rdi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%rdi), %rsi
	vmovq	%rsi, %xmm2
	movq	24(%rcx,%rdi), %rcx
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
	vmovdqu	(%rdx,%rcx), %xmm6
	vpslldq	$8, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
	vmovdqu	8(%rdx,%rcx), %xmm9
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
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vpxor	%ymm14, %ymm14, %ymm14
	movq	(%r8,%rcx), %rdx
	vmovq	%rdx, %xmm6
	vmovdqu	8(%r8,%rcx), %xmm9
	vmovdqu	%xmm9, %xmm11
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
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
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm8
	vpxor	%ymm8, %ymm7, %ymm0
	movq	48(%rsp), %rcx
	movq	$0, %rdi
	movq	$0, %r10
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm4, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rdi)
	movq	%xmm8, %rdx
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
	vmovdqu	%xmm4, 8(%rcx,%rdi)
	ret
.LF$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %r8
	vpbroadcastq	(%r9,%r8), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r9,%r8), %xmm2
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
	movq	$0, %rdi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rdx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rdx,%rdi), %rsi
	vmovq	%rsi, %xmm2
	movq	24(%rdx,%rdi), %rdx
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
	movq	$0, %rdi
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rcx,%rdi), %xmm6
	vpslldq	$8, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
	vmovdqu	8(%rcx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
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
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm8
	vpxor	%ymm8, %ymm7, %ymm0
	movq	48(%rsp), %rcx
	movq	$0, %rdi
	movq	$0, %r10
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm4, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rdi)
	movq	%xmm8, %rdx
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
	vmovdqu	%xmm4, 8(%rcx,%rdi)
	ret
.LPRF$1:
	movq	%r8, 48(%rsp)
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
	movl	(%rdx), %esi
	bswapl	%esi
	movl	%esi, (%rcx)
	movl	4(%rdx), %esi
	bswapl	%esi
	movl	%esi, 4(%rcx)
	movl	8(%rdx), %esi
	bswapl	%esi
	movl	%esi, 8(%rcx)
	movl	12(%rdx), %esi
	bswapl	%esi
	movl	%esi, 12(%rcx)
	movl	16(%rdx), %esi
	bswapl	%esi
	movl	%esi, 16(%rcx)
	movl	20(%rdx), %esi
	bswapl	%esi
	movl	%esi, 20(%rcx)
	movl	24(%rdx), %esi
	bswapl	%esi
	movl	%esi, 24(%rcx)
	movl	28(%rdx), %edx
	bswapl	%edx
	movl	%edx, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %rdi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%rdi), %rdx
	vmovq	%rdx, %xmm2
	movq	24(%rcx,%rdi), %rcx
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
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%r11,%rcx), %xmm6
	vpslldq	$8, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
	vmovdqu	8(%r11,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rcx
	movq	$31, %rdx
	shlq	$0, %rdx
	orq 	%rdx, %rcx
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
	movq	$1, %rcx
	shlq	$63, %rcx
	vmovq	%rcx, %xmm0
	vpxor	%ymm8, %ymm8, %ymm8
	vinserti128	$0, %xmm0, %ymm8, %ymm8
	vpxor	%ymm8, %ymm7, %ymm0
	movq	48(%rsp), %rcx
	movq	$0, %rdi
	movq	$0, %r10
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rdi)
	vmovdqu	%ymm4, 8(%rcx,%rdi)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%rdi)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%rdi)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%rdi)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%rdi)
	movq	%xmm8, %rdx
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
	vmovdqu	%xmm4, 8(%rcx,%rdi)
	ret
.LPRF_msg$1:
	movq	%r11, 232(%rsp)
	movq	%rcx, 240(%rsp)
	movq	%rdx, 248(%rsp)
	movq	%rdi, 256(%rsp)
	movq	%r8, 264(%rsp)
	leaq	32(%rsp), %rcx
	vpxor	%ymm0, %ymm0, %ymm0
	vmovdqu	%ymm0, (%rcx)
	vmovdqu	%ymm0, 32(%rcx)
	vmovdqu	%ymm0, 64(%rcx)
	vmovdqu	%ymm0, 96(%rcx)
	vmovdqu	%ymm0, 128(%rcx)
	vmovdqu	%ymm0, 160(%rcx)
	movq	$0, 192(%rcx)
	movb	(%rax), %r8b
	movb	%r8b, 32(%rsp)
	movb	1(%rax), %r8b
	movb	%r8b, 33(%rsp)
	movb	2(%rax), %r8b
	movb	%r8b, 34(%rsp)
	movb	3(%rax), %r8b
	movb	%r8b, 35(%rsp)
	movb	4(%rax), %r8b
	movb	%r8b, 36(%rsp)
	movb	5(%rax), %r8b
	movb	%r8b, 37(%rsp)
	movb	6(%rax), %r8b
	movb	%r8b, 38(%rsp)
	movb	7(%rax), %r8b
	movb	%r8b, 39(%rsp)
	movb	8(%rax), %r8b
	movb	%r8b, 40(%rsp)
	movb	9(%rax), %r8b
	movb	%r8b, 41(%rsp)
	movb	10(%rax), %r8b
	movb	%r8b, 42(%rsp)
	movb	11(%rax), %r8b
	movb	%r8b, 43(%rsp)
	movb	12(%rax), %r8b
	movb	%r8b, 44(%rsp)
	movb	13(%rax), %r8b
	movb	%r8b, 45(%rsp)
	movb	14(%rax), %r8b
	movb	%r8b, 46(%rsp)
	movb	15(%rax), %r8b
	movb	%r8b, 47(%rsp)
	movb	16(%rax), %r8b
	movb	%r8b, 48(%rsp)
	movb	17(%rax), %r8b
	movb	%r8b, 49(%rsp)
	movb	18(%rax), %r8b
	movb	%r8b, 50(%rsp)
	movb	19(%rax), %r8b
	movb	%r8b, 51(%rsp)
	movb	20(%rax), %r8b
	movb	%r8b, 52(%rsp)
	movb	21(%rax), %r8b
	movb	%r8b, 53(%rsp)
	movb	22(%rax), %r8b
	movb	%r8b, 54(%rsp)
	movb	23(%rax), %r8b
	movb	%r8b, 55(%rsp)
	movb	(%rsi), %r8b
	movb	%r8b, 56(%rsp)
	movb	1(%rsi), %r8b
	movb	%r8b, 57(%rsp)
	movb	2(%rsi), %r8b
	movb	%r8b, 58(%rsp)
	movb	3(%rsi), %r8b
	movb	%r8b, 59(%rsp)
	movb	4(%rsi), %r8b
	movb	%r8b, 60(%rsp)
	movb	5(%rsi), %r8b
	movb	%r8b, 61(%rsp)
	movb	6(%rsi), %r8b
	movb	%r8b, 62(%rsp)
	movb	7(%rsi), %r8b
	movb	%r8b, 63(%rsp)
	movb	8(%rsi), %r8b
	movb	%r8b, 64(%rsp)
	movb	9(%rsi), %r8b
	movb	%r8b, 65(%rsp)
	movb	10(%rsi), %r8b
	movb	%r8b, 66(%rsp)
	movb	11(%rsi), %r8b
	movb	%r8b, 67(%rsp)
	movb	12(%rsi), %r8b
	movb	%r8b, 68(%rsp)
	movb	13(%rsi), %r8b
	movb	%r8b, 69(%rsp)
	movb	14(%rsi), %r8b
	movb	%r8b, 70(%rsp)
	movb	15(%rsi), %r8b
	movb	%r8b, 71(%rsp)
	movb	16(%rsi), %r8b
	movb	%r8b, 72(%rsp)
	movb	17(%rsi), %r8b
	movb	%r8b, 73(%rsp)
	movb	18(%rsi), %r8b
	movb	%r8b, 74(%rsp)
	movb	19(%rsi), %r8b
	movb	%r8b, 75(%rsp)
	movb	20(%rsi), %r8b
	movb	%r8b, 76(%rsp)
	movb	21(%rsi), %r8b
	movb	%r8b, 77(%rsp)
	movb	22(%rsi), %r8b
	movb	%r8b, 78(%rsp)
	movb	23(%rsi), %r8b
	movb	%r8b, 79(%rsp)
	movb	$0, 80(%rsp)
	movb	%dl, 81(%rsp)
	movq	$50, %r8
	movq	$0, %rax
	movq	240(%rsp), %rdi
	movq	248(%rsp), %rcx
	jmp 	.LPRF_msg$11
.LPRF_msg$12:
	cmpq	$136, %r8
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
	movq	$0, %r8
.LPRF_msg$13:
	movb	(%rdi,%rax), %r9b
	incq	%rax
	xorb	%r9b, 32(%rsp,%r8)
	incq	%r8
.LPRF_msg$11:
	cmpq	%rcx, %rax
	jb  	.LPRF_msg$12
	movq	$0, %rax
	movq	256(%rsp), %rdx
	movq	264(%rsp), %rsi
	jmp 	.LPRF_msg$7
.LPRF_msg$8:
	cmpq	$136, %r8
	jb  	.LPRF_msg$9
	movq	%rdx, 264(%rsp)
	movq	%rax, 256(%rsp)
	movq	%rsi, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$10:
	leaq	200(%rsp), %rsp
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rax
	movq	272(%rsp), %rsi
	movq	$0, %r8
.LPRF_msg$9:
	movb	(%rdx,%rax), %r9b
	incq	%rax
	xorb	%r9b, 32(%rsp,%r8)
	incq	%r8
.LPRF_msg$7:
	cmpq	%rsi, %rax
	jb  	.LPRF_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %r8
	jb  	.LPRF_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LPRF_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %r8
.LPRF_msg$5:
	xorb	$31, 32(%rsp,%r8)
	leaq	32(%rsp), %rax
	cmpq	$136, %r8
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
	movq	232(%rsp), %rax
	movb	32(%rsp), %dl
	movb	%dl, (%rax)
	movb	33(%rsp), %dl
	movb	%dl, 1(%rax)
	movb	34(%rsp), %dl
	movb	%dl, 2(%rax)
	movb	35(%rsp), %dl
	movb	%dl, 3(%rax)
	movb	36(%rsp), %dl
	movb	%dl, 4(%rax)
	movb	37(%rsp), %dl
	movb	%dl, 5(%rax)
	movb	38(%rsp), %dl
	movb	%dl, 6(%rax)
	movb	39(%rsp), %dl
	movb	%dl, 7(%rax)
	movb	40(%rsp), %dl
	movb	%dl, 8(%rax)
	movb	41(%rsp), %dl
	movb	%dl, 9(%rax)
	movb	42(%rsp), %dl
	movb	%dl, 10(%rax)
	movb	43(%rsp), %dl
	movb	%dl, 11(%rax)
	movb	44(%rsp), %dl
	movb	%dl, 12(%rax)
	movb	45(%rsp), %dl
	movb	%dl, 13(%rax)
	movb	46(%rsp), %dl
	movb	%dl, 14(%rax)
	movb	47(%rsp), %dl
	movb	%dl, 15(%rax)
	movb	48(%rsp), %dl
	movb	%dl, 16(%rax)
	movb	49(%rsp), %dl
	movb	%dl, 17(%rax)
	movb	50(%rsp), %dl
	movb	%dl, 18(%rax)
	movb	51(%rsp), %dl
	movb	%dl, 19(%rax)
	movb	52(%rsp), %dl
	movb	%dl, 20(%rax)
	movb	53(%rsp), %dl
	movb	%dl, 21(%rax)
	movb	54(%rsp), %dl
	movb	%dl, 22(%rax)
	movb	55(%rsp), %dl
	movb	%dl, 23(%rax)
	ret
.LH_msg$1:
	movq	%rdi, 232(%rsp)
	movq	%r11, 240(%rsp)
	movq	%rcx, 248(%rsp)
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
	movq	$74, %r8
	movq	$0, %rax
	movq	240(%rsp), %rdi
	movq	248(%rsp), %rcx
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %r8
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
	movq	$0, %r8
.LH_msg$13:
	movb	(%rdi,%rax), %r9b
	incq	%rax
	xorb	%r9b, 32(%rsp,%r8)
	incq	%r8
.LH_msg$11:
	cmpq	%rcx, %rax
	jb  	.LH_msg$12
	movq	$0, %rax
	movq	256(%rsp), %rdx
	movq	264(%rsp), %rsi
	jmp 	.LH_msg$7
.LH_msg$8:
	cmpq	$136, %r8
	jb  	.LH_msg$9
	movq	%rdx, 264(%rsp)
	movq	%rax, 256(%rsp)
	movq	%rsi, 272(%rsp)
	leaq	32(%rsp), %rax
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$10:
	leaq	200(%rsp), %rsp
	movq	264(%rsp), %rdx
	movq	256(%rsp), %rax
	movq	272(%rsp), %rsi
	movq	$0, %r8
.LH_msg$9:
	movb	(%rdx,%rax), %r9b
	incq	%rax
	xorb	%r9b, 32(%rsp,%r8)
	incq	%r8
.LH_msg$7:
	cmpq	%rsi, %rax
	jb  	.LH_msg$8
	leaq	32(%rsp), %rax
	cmpq	$136, %r8
	jb  	.LH_msg$5
	leaq	-200(%rsp), %rsp
	call	.L_keccakf1600_opt$1
.LH_msg$6:
	leaq	200(%rsp), %rsp
	movq	$0, %r8
.LH_msg$5:
	xorb	$31, 32(%rsp,%r8)
	leaq	32(%rsp), %rax
	cmpq	$136, %r8
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
	movq	232(%rsp), %rax
	movb	32(%rsp), %r9b
	movb	%r9b, (%rax)
	movb	33(%rsp), %r9b
	movb	%r9b, 1(%rax)
	movb	34(%rsp), %r9b
	movb	%r9b, 2(%rax)
	movb	35(%rsp), %r9b
	movb	%r9b, 3(%rax)
	movb	36(%rsp), %r9b
	movb	%r9b, 4(%rax)
	movb	37(%rsp), %r9b
	movb	%r9b, 5(%rax)
	movb	38(%rsp), %r9b
	movb	%r9b, 6(%rax)
	movb	39(%rsp), %r9b
	movb	%r9b, 7(%rax)
	movb	40(%rsp), %r9b
	movb	%r9b, 8(%rax)
	movb	41(%rsp), %r9b
	movb	%r9b, 9(%rax)
	movb	42(%rsp), %r9b
	movb	%r9b, 10(%rax)
	movb	43(%rsp), %r9b
	movb	%r9b, 11(%rax)
	movb	44(%rsp), %r9b
	movb	%r9b, 12(%rax)
	movb	45(%rsp), %r9b
	movb	%r9b, 13(%rax)
	movb	46(%rsp), %r9b
	movb	%r9b, 14(%rax)
	movb	47(%rsp), %r9b
	movb	%r9b, 15(%rax)
	movb	48(%rsp), %r9b
	movb	%r9b, 16(%rax)
	movb	49(%rsp), %r9b
	movb	%r9b, 17(%rax)
	movb	50(%rsp), %r9b
	movb	%r9b, 18(%rax)
	movb	51(%rsp), %r9b
	movb	%r9b, 19(%rax)
	movb	52(%rsp), %r9b
	movb	%r9b, 20(%rax)
	movb	53(%rsp), %r9b
	movb	%r9b, 21(%rax)
	movb	54(%rsp), %r9b
	movb	%r9b, 22(%rax)
	movb	55(%rsp), %r9b
	movb	%r9b, 23(%rax)
	movb	56(%rsp), %r9b
	movb	%r9b, 24(%rax)
	movb	57(%rsp), %r9b
	movb	%r9b, 25(%rax)
	movb	58(%rsp), %r9b
	movb	%r9b, 26(%rax)
	movb	59(%rsp), %r9b
	movb	%r9b, 27(%rax)
	movb	60(%rsp), %r9b
	movb	%r9b, 28(%rax)
	movb	61(%rsp), %r9b
	movb	%r9b, 29(%rax)
	movb	62(%rsp), %r9b
	movb	%r9b, 30(%rax)
	movb	63(%rsp), %r9b
	movb	%r9b, 31(%rax)
	movb	64(%rsp), %r9b
	movb	%r9b, 32(%rax)
	movb	65(%rsp), %r9b
	movb	%r9b, 33(%rax)
	movb	66(%rsp), %r9b
	movb	%r9b, 34(%rax)
	movb	67(%rsp), %r9b
	movb	%r9b, 35(%rax)
	movb	68(%rsp), %r9b
	movb	%r9b, 36(%rax)
	movb	69(%rsp), %r9b
	movb	%r9b, 37(%rax)
	movb	70(%rsp), %r9b
	movb	%r9b, 38(%rax)
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
