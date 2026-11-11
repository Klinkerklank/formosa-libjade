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
	leaq	-8(%rsp), %rsp
	andq	$-32, %rsp
	movq	%rax, (%rsp)
	movq	%rdx, %rax
	lfence
	movq	$0, %rcx
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
	movq	56(%rsp), %r8
	movq	64(%rsp), %rax
	movq	72(%rsp), %rdi
	lfence
	movq	$0, %rcx
	leaq	128(%rsp), %rcx
	leaq	158(%rsp), %rdx
	leaq	165(%rsp), %rsi
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
	movzbl	(%rsi), %r9d
	orl 	%r9d, %edx
	shll	$8, %edx
	movzbl	1(%rsi), %r9d
	orl 	%r9d, %edx
	andl	$511, %edx
	leaq	80(%rsp), %r11
	movl	116(%rsp), %esi
	movl	%esi, 4(%r11)
	movl	120(%rsp), %esi
	movl	%esi, 8(%r11)
	movl	124(%rsp), %esi
	movl	%esi, 12(%r11)
	leaq	80(%rsp), %r11
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$3, 16(%r11)
	leaq	80(%rsp), %r11
	movl	%edx, 20(%r11)
	leaq	24(%rdi), %r9
	movq	%r8, 72(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rdi, 56(%rsp)
	movl	%edx, 112(%rsp)
	leaq	32(%rsp), %rax
	leaq	80(%rsp), %rdi
	movq	%rax, %rsi
	movq	%r9, %rax
	movq	%rcx, %rdx
	leaq	-728(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	728(%rsp), %rsp
	movq	72(%rsp), %r8
	movq	64(%rsp), %r10
	movq	56(%rsp), %rdi
	movl	112(%rsp), %edx
	lfence
	movq	$0, %rax
	leaq	32(%rsp), %rax
	leaq	6144(%rdi), %rcx
	leaq	116(%rsp), %rsi
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
	movq	80(%rsp), %r8
	movq	72(%rsp), %rdi
	movq	64(%rsp), %rsi
	lfence
	movq	$0, %rax
	leaq	152(%rsp), %rcx
	leaq	182(%rsp), %rdx
	leaq	189(%rsp), %rax
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
	movzbl	(%rax), %r9d
	orl 	%r9d, %edx
	shll	$8, %edx
	movzbl	1(%rax), %r9d
	orl 	%r9d, %edx
	andl	$511, %edx
	leaq	104(%rsp), %r11
	movl	140(%rsp), %eax
	movl	%eax, 4(%r11)
	movl	144(%rsp), %eax
	movl	%eax, 8(%r11)
	movl	148(%rsp), %eax
	movl	%eax, 12(%r11)
	leaq	104(%rsp), %r11
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$3, 16(%r11)
	leaq	104(%rsp), %r11
	movl	%edx, 20(%r11)
	leaq	24(%rdi), %r9
	movq	%rsi, 64(%rsp)
	movq	%r8, 72(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%rcx, 56(%rsp)
	movl	%edx, 136(%rsp)
	leaq	104(%rsp), %rdi
	movq	%rcx, %rax
	movq	%rsi, %r11
	leaq	-152(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	152(%rsp), %rsp
	movq	%r9, %rax
// declassify_mem 6120 [RAX]
	movq	64(%rsp), %rsi
	movq	72(%rsp), %r8
	movq	80(%rsp), %rdi
	movq	56(%rsp), %rdx
	movl	136(%rsp), %ecx
	lfence
	movq	$0, %r9
	movq	%rsi, 56(%rsp)
	movq	%r8, 80(%rsp)
	movq	%rdi, 72(%rsp)
	movl	%ecx, 136(%rsp)
	leaq	32(%rsp), %rcx
	leaq	104(%rsp), %rdi
	movq	%rcx, %rsi
	leaq	-728(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	728(%rsp), %rsp
	movq	56(%rsp), %r11
	movq	80(%rsp), %r8
	movq	72(%rsp), %rdi
	movl	136(%rsp), %edx
	lfence
	movq	$0, %rax
	leaq	6144(%rdi), %rcx
	movq	%rdi, 72(%rsp)
	leaq	32(%rsp), %rax
	leaq	140(%rsp), %rsi
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
	movb	(%rdx), %al
	movb	%al, (%rcx)
	movb	1(%rdx), %al
	movb	%al, 1(%rcx)
	movb	2(%rdx), %al
	movb	%al, 2(%rcx)
	movb	3(%rdx), %al
	movb	%al, 3(%rcx)
	movb	4(%rdx), %al
	movb	%al, 4(%rcx)
	movb	5(%rdx), %al
	movb	%al, 5(%rcx)
	movb	6(%rdx), %al
	movb	%al, 6(%rcx)
	movb	7(%rdx), %al
	movb	%al, 7(%rcx)
	movb	8(%rdx), %al
	movb	%al, 8(%rcx)
	movb	9(%rdx), %al
	movb	%al, 9(%rcx)
	movb	10(%rdx), %al
	movb	%al, 10(%rcx)
	movb	11(%rdx), %al
	movb	%al, 11(%rcx)
	movb	12(%rdx), %al
	movb	%al, 12(%rcx)
	movb	13(%rdx), %al
	movb	%al, 13(%rcx)
	movb	14(%rdx), %al
	movb	%al, 14(%rcx)
	movb	15(%rdx), %al
	movb	%al, 15(%rcx)
	movb	16(%rdx), %al
	movb	%al, 16(%rcx)
	movb	17(%rdx), %al
	movb	%al, 17(%rcx)
	movb	18(%rdx), %al
	movb	%al, 18(%rcx)
	movb	19(%rdx), %al
	movb	%al, 19(%rcx)
	movb	20(%rdx), %al
	movb	%al, 20(%rcx)
	movb	21(%rdx), %al
	movb	%al, 21(%rcx)
	movb	22(%rdx), %al
	movb	%al, 22(%rcx)
	movb	23(%rdx), %al
	movb	%al, 23(%rcx)
	movq	%rsi, %r11
	leaq	48(%rsi), %r8
	leaq	24(%rsp), %rax
	movq	$0, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$6, %r10d
	leaq	24(%rsp), %rax
	movl	%r10d, (%rax)
	movl	$0, %eax
	movl	$9, %edx
	leaq	72(%rsi), %rcx
	movq	%rsi, 8(%rsp)
	movq	%rdi, 16(%rsp)
	leaq	24(%rsp), %rdi
	movl	%eax, %esi
	leaq	-24696(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	24696(%rsp), %rsp
	movq	%rcx, %rdx
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	lfence
	movq	$0, %rax
	leaq	24(%rdi), %rcx
	movb	(%rdx), %al
	movb	%al, (%rcx)
	movb	1(%rdx), %al
	movb	%al, 1(%rcx)
	movb	2(%rdx), %al
	movb	%al, 2(%rcx)
	movb	3(%rdx), %al
	movb	%al, 3(%rcx)
	movb	4(%rdx), %al
	movb	%al, 4(%rcx)
	movb	5(%rdx), %al
	movb	%al, 5(%rcx)
	movb	6(%rdx), %al
	movb	%al, 6(%rcx)
	movb	7(%rdx), %al
	movb	%al, 7(%rcx)
	movb	8(%rdx), %al
	movb	%al, 8(%rcx)
	movb	9(%rdx), %al
	movb	%al, 9(%rcx)
	movb	10(%rdx), %al
	movb	%al, 10(%rcx)
	movb	11(%rdx), %al
	movb	%al, 11(%rcx)
	movb	12(%rdx), %al
	movb	%al, 12(%rcx)
	movb	13(%rdx), %al
	movb	%al, 13(%rcx)
	movb	14(%rdx), %al
	movb	%al, 14(%rcx)
	movb	15(%rdx), %al
	movb	%al, 15(%rcx)
	movb	16(%rdx), %al
	movb	%al, 16(%rcx)
	movb	17(%rdx), %al
	movb	%al, 17(%rcx)
	movb	18(%rdx), %al
	movb	%al, 18(%rcx)
	movb	19(%rdx), %al
	movb	%al, 19(%rcx)
	movb	20(%rdx), %al
	movb	%al, 20(%rcx)
	movb	21(%rdx), %al
	movb	%al, 21(%rcx)
	movb	22(%rdx), %al
	movb	%al, 22(%rcx)
	movb	23(%rdx), %al
	movb	%al, 23(%rcx)
// declassify_mem 48 [RDI]
	ret
.Lfors_pkfromsig$1:
	movq	%rsi, 568(%rsp)
	leaq	664(%rsp), %rsi
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
	movl	%r11d, (%rsi)
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
	movl	%r11d, 4(%rsi)
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
	movl	%r11d, 8(%rsi)
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
	movl	%r11d, 12(%rsi)
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
	movl	%r11d, 16(%rsi)
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
	movl	%r11d, 20(%rsi)
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
	movl	%r11d, 24(%rsi)
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
	movl	%r11d, 28(%rsi)
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
	movl	%r11d, 32(%rsi)
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
	movl	%r11d, 36(%rsi)
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
	movl	%r11d, 40(%rsi)
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
	movl	%r11d, 44(%rsi)
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
	movl	%r11d, 48(%rsi)
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
	movl	%r11d, 52(%rsi)
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
	movl	%r11d, 56(%rsi)
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
	movl	%r11d, 60(%rsi)
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
	movl	%r11d, 64(%rsi)
	movq	$0, %rcx
	movq	$0, %rdx
	movq	$0, %rsi
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
	movl	%esi, %edx
	shll	$14, %edx
	addl	664(%rsp,%rsi,4), %edx
	lfence
	movq	$0, %r9
	movl	%edx, 28(%rdi)
	movq	%r8, 584(%rsp)
	movq	%rdi, 592(%rsp)
	movq	%rax, 600(%rsp)
	movq	%rsi, 608(%rsp)
	movq	%rcx, 616(%rsp)
	leaq	64(%rsp), %rcx
	movq	%rdi, %r11
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	40(%rsp), %rsp
	movq	584(%rsp), %r8
	movq	592(%rsp), %rdi
	movq	600(%rsp), %rax
	movq	608(%rsp), %rsi
	movq	616(%rsp), %rcx
	lfence
	movq	$0, %rdx
	addq	$24, %rcx
	movl	664(%rsp,%rsi,4), %r9d
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
	movq	%r8, 616(%rsp)
	movq	%rdi, 608(%rsp)
	movq	%rax, 600(%rsp)
	movq	%rsi, 592(%rsp)
	movq	%rcx, 584(%rsp)
	leaq	32(%rsp), %rcx
	leaq	544(%rsp), %rdx
	leaq	512(%rsp), %rsi
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	40(%rsp), %rsp
	movq	616(%rsp), %r8
	movq	608(%rsp), %rdi
	movq	600(%rsp), %rax
	movq	592(%rsp), %rsi
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
	incq	%rsi
.Lfors_pkfromsig$3:
	cmpq	$17, %rsi
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
	movq	%rcx, %rax
	ret
.Lfors_sign$1:
	leaq	64(%rsp), %rsi
	movq	$0, %rdx
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lfors_sign$40
.Lfors_sign$41:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$40:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$41
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, (%rsi)
	jmp 	.Lfors_sign$38
.Lfors_sign$39:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$38:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$39
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 4(%rsi)
	jmp 	.Lfors_sign$36
.Lfors_sign$37:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$36:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$37
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 8(%rsi)
	jmp 	.Lfors_sign$34
.Lfors_sign$35:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$34:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$35
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 12(%rsi)
	jmp 	.Lfors_sign$32
.Lfors_sign$33:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$32:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$33
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 16(%rsi)
	jmp 	.Lfors_sign$30
.Lfors_sign$31:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$30:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$31
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 20(%rsi)
	jmp 	.Lfors_sign$28
.Lfors_sign$29:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$28:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$29
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 24(%rsi)
	jmp 	.Lfors_sign$26
.Lfors_sign$27:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$26:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$27
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 28(%rsi)
	jmp 	.Lfors_sign$24
.Lfors_sign$25:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$24:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$25
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 32(%rsi)
	jmp 	.Lfors_sign$22
.Lfors_sign$23:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$22:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$23
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 36(%rsi)
	jmp 	.Lfors_sign$20
.Lfors_sign$21:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$20:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$21
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 40(%rsi)
	jmp 	.Lfors_sign$18
.Lfors_sign$19:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$18:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$19
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 44(%rsi)
	jmp 	.Lfors_sign$16
.Lfors_sign$17:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$16:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$17
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 48(%rsi)
	jmp 	.Lfors_sign$14
.Lfors_sign$15:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$14:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$15
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 52(%rsi)
	jmp 	.Lfors_sign$12
.Lfors_sign$13:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$12:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$13
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 56(%rsi)
	jmp 	.Lfors_sign$10
.Lfors_sign$11:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$10:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$11
	movl	%r10d, %ebx
	addl	$-14, %ecx
	shrq	%cl, %rbx
	andq	$16383, %rbx
	movl	%ebx, 60(%rsi)
	jmp 	.Lfors_sign$8
.Lfors_sign$9:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebx
	orl 	%ebx, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lfors_sign$8:
	cmpl	$14, %ecx
	jb  	.Lfors_sign$9
	movl	%r10d, %eax
	addl	$-14, %ecx
	shrq	%cl, %rax
	andq	$16383, %rax
	movl	%eax, 64(%rsi)
	movq	$0, %rax
	movq	$0, %r10
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%r10d, %edx
	shll	$14, %edx
	addl	64(%rsp,%r10,4), %edx
	lfence
	movq	$0, %rcx
	leaq	(%r9,%rax), %rsi
	movq	%r11, 8(%rsp)
	movq	%r8, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%r9, 32(%rsp)
	movq	%r10, 40(%rsp)
	movq	%rax, 48(%rsp)
	movl	%edx, %r9d
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %r11
	movq	16(%rsp), %r8
	movq	24(%rsp), %rdi
	movq	32(%rsp), %r9
	movq	40(%rsp), %r10
	movq	48(%rsp), %rax
	lfence
	movq	$0, %rdx
	addq	$24, %rax
	movl	64(%rsp,%r10,4), %esi
	lfence
	movq	$0, %rdx
	xorl	$1, %esi
	movl	$0, %edx
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%r11, 48(%rsp)
	movq	%r8, 40(%rsp)
	movq	%r10, 32(%rsp)
	movl	%edx, 56(%rsp)
	movq	%rax, 24(%rsp)
	movl	%esi, 60(%rsp)
	movl	$14, %ecx
	subl	%edx, %ecx
	shlq	%cl, %r10
	addl	%esi, %r10d
	leaq	(%r9,%rax), %rcx
	movq	%r9, 16(%rsp)
	movl	%r10d, %esi
	leaq	-786584(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	786584(%rsp), %rsp
	movq	16(%rsp), %r9
	lfence
	movq	$0, %rax
	movq	48(%rsp), %r11
	movq	40(%rsp), %r8
	movq	32(%rsp), %r10
	movl	56(%rsp), %edx
	movq	24(%rsp), %rax
	movl	60(%rsp), %esi
	lfence
	movq	$0, %rcx
	shrl	$1, %esi
	xorl	$1, %esi
	addq	$24, %rax
	incl	%edx
.Lfors_sign$4:
	cmpl	$14, %edx
	jb  	.Lfors_sign$5
	incq	%r10
.Lfors_sign$2:
	cmpq	$17, %r10
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rcx, 786504(%rsp)
	movq	$0, %rax
	movl	$0, %r10d
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%edx, 786544(%rsp)
	movl	%edx, %ecx
	subl	%r10d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r9d
	imull	%esi, %r9d
	addl	%r9d, %edx
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%r11, 786512(%rsp)
	movl	%edx, 786548(%rsp)
	cmpl	$0, %r10d
	je  	.Lfors_node$6
	movl	%r9d, %eax
	imull	$2, %eax, %eax
	movl	%r10d, %edx
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
	movb	(%rdx), %al
	movb	%al, (%rcx)
	movb	1(%rdx), %al
	movb	%al, 1(%rcx)
	movb	2(%rdx), %al
	movb	%al, 2(%rcx)
	movb	3(%rdx), %al
	movb	%al, 3(%rcx)
	movb	4(%rdx), %al
	movb	%al, 4(%rcx)
	movb	5(%rdx), %al
	movb	%al, 5(%rcx)
	movb	6(%rdx), %al
	movb	%al, 6(%rcx)
	movb	7(%rdx), %al
	movb	%al, 7(%rcx)
	movb	8(%rdx), %al
	movb	%al, 8(%rcx)
	movb	9(%rdx), %al
	movb	%al, 9(%rcx)
	movb	10(%rdx), %al
	movb	%al, 10(%rcx)
	movb	11(%rdx), %al
	movb	%al, 11(%rcx)
	movb	12(%rdx), %al
	movb	%al, 12(%rcx)
	movb	13(%rdx), %al
	movb	%al, 13(%rcx)
	movb	14(%rdx), %al
	movb	%al, 14(%rcx)
	movb	15(%rdx), %al
	movb	%al, 15(%rcx)
	movb	16(%rdx), %al
	movb	%al, 16(%rcx)
	movb	17(%rdx), %al
	movb	%al, 17(%rcx)
	movb	18(%rdx), %al
	movb	%al, 18(%rcx)
	movb	19(%rdx), %al
	movb	%al, 19(%rcx)
	movb	20(%rdx), %al
	movb	%al, 20(%rcx)
	movb	21(%rdx), %al
	movb	%al, 21(%rcx)
	movb	22(%rdx), %al
	movb	%al, 22(%rcx)
	movb	23(%rdx), %al
	movb	%al, 23(%rcx)
	movl	%r10d, 24(%rdi)
	movl	%r9d, 28(%rdi)
	movl	$15, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %r11
	subl	%r10d, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %r11
	shrq	$1, %rbp
	movl	%r9d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %r11
	imulq	$24, %r11, %rax
	movq	%r8, 786520(%rsp)
	movq	%rdi, 786528(%rsp)
	movl	%esi, 786552(%rsp)
	movl	%r10d, 786556(%rsp)
	movl	%r9d, 786560(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	786480(%rsp), %rdx
	leaq	786448(%rsp), %rsi
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lfors_node$10:
	leaq	40(%rsp), %rsp
	movq	786520(%rsp), %r8
	movq	786528(%rsp), %rdi
	movl	786552(%rsp), %esi
	movl	786556(%rsp), %r10d
	movl	786560(%rsp), %r9d
	lfence
	movq	$0, %rcx
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%r10d, 24(%rdi)
	movl	%r9d, 28(%rdi)
	movl	$15, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbx
	subl	%r10d, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %rbx
	shrq	$1, %rbp
	movl	%r9d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %rbx
	imulq	$24, %rbx, %rax
	movq	%r8, 786520(%rsp)
	movq	%rdi, 786528(%rsp)
	movl	%esi, 786552(%rsp)
	movl	%r10d, 786556(%rsp)
	movl	%r9d, 786560(%rsp)
	movq	%rax, 786536(%rsp)
	leaq	32(%rsp,%rax), %rsi
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$9:
	leaq	40(%rsp), %rsp
	movq	786520(%rsp), %r8
	movq	786528(%rsp), %rax
	movl	786552(%rsp), %esi
	movl	786556(%rsp), %r10d
	movl	786560(%rsp), %r9d
	movq	786536(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	%r8, 786536(%rsp)
	movq	%rax, 786528(%rsp)
	movl	%esi, 786560(%rsp)
	movl	%r10d, 786556(%rsp)
	movl	%r9d, 786552(%rsp)
	movq	%rcx, 786520(%rsp)
	leaq	32(%rsp,%rcx), %rcx
	movq	%rax, %r11
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lfors_node$8:
	leaq	40(%rsp), %rsp
	movq	786536(%rsp), %r8
	movq	786528(%rsp), %rdi
	movl	786560(%rsp), %esi
	movl	786556(%rsp), %r10d
	movl	786552(%rsp), %r9d
	movq	786520(%rsp), %rax
	lfence
	movq	$0, %rcx
.Lfors_node$7:
	movq	786512(%rsp), %r11
	movl	786548(%rsp), %edx
	lfence
	movq	$0, %rcx
	incl	%r9d
.Lfors_node$4:
	cmpl	%edx, %r9d
	jb  	.Lfors_node$5
	movl	786544(%rsp), %edx
	lfence
	movq	$0, %rcx
	incl	%r10d
.Lfors_node$2:
	cmpl	%edx, %r10d
	jbe 	.Lfors_node$3
	movq	786504(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp,%rax), %rdx
	movb	(%rdx), %al
	movb	%al, (%rcx)
	movb	1(%rdx), %al
	movb	%al, 1(%rcx)
	movb	2(%rdx), %al
	movb	%al, 2(%rcx)
	movb	3(%rdx), %al
	movb	%al, 3(%rcx)
	movb	4(%rdx), %al
	movb	%al, 4(%rcx)
	movb	5(%rdx), %al
	movb	%al, 5(%rcx)
	movb	6(%rdx), %al
	movb	%al, 6(%rcx)
	movb	7(%rdx), %al
	movb	%al, 7(%rcx)
	movb	8(%rdx), %al
	movb	%al, 8(%rcx)
	movb	9(%rdx), %al
	movb	%al, 9(%rcx)
	movb	10(%rdx), %al
	movb	%al, 10(%rcx)
	movb	11(%rdx), %al
	movb	%al, 11(%rcx)
	movb	12(%rdx), %al
	movb	%al, 12(%rcx)
	movb	13(%rdx), %al
	movb	%al, 13(%rcx)
	movb	14(%rdx), %al
	movb	%al, 14(%rcx)
	movb	15(%rdx), %al
	movb	%al, 15(%rcx)
	movb	16(%rdx), %al
	movb	%al, 16(%rcx)
	movb	17(%rdx), %al
	movb	%al, 17(%rcx)
	movb	18(%rdx), %al
	movb	%al, 18(%rcx)
	movb	19(%rdx), %al
	movb	%al, 19(%rcx)
	movb	20(%rdx), %al
	movb	%al, 20(%rcx)
	movb	21(%rdx), %al
	movb	%al, 21(%rcx)
	movb	22(%rdx), %al
	movb	%al, 22(%rcx)
	movb	23(%rdx), %al
	movb	%al, 23(%rcx)
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
	movl	20(%rdi), %edx
	leaq	8(%rsp), %rax
	movl	%edx, 20(%rax)
	leaq	8(%rsp), %rax
	movl	%r9d, 28(%rax)
	leaq	8(%rsp), %rax
	movq	%rsi, %rcx
	movq	%rax, %rdi
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	40(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%rsi), %r10d
	movl	%r10d, 76(%rsp)
	movl	4(%rsi), %r10d
	movl	%r10d, 80(%rsp)
	movl	8(%rsi), %esi
	movl	%esi, 84(%rsp)
	leaq	40(%rsp), %rdi
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	leaq	40(%rsp), %rdi
	movl	76(%rsp), %esi
	movl	%esi, 4(%rdi)
	movl	80(%rsp), %esi
	movl	%esi, 8(%rdi)
	movl	84(%rsp), %esi
	movl	%esi, 12(%rdi)
	movq	%rcx, %rsi
	movq	%r8, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	88(%rsp), %rcx
	leaq	40(%rsp), %rdi
	movq	%rdi, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %r8
	movq	24(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	$1440, %rax
	movl	$1, %r10d
	jmp 	.Lht_verify$2
.Lht_verify$3:
	movl	%r10d, 72(%rsp)
	movq	%rax, 24(%rsp)
	leaq	76(%rsp), %rsi
	movl	8(%rsi), %edx
	andl	$511, %edx
	shrl	$9, 8(%rsi)
	movl	4(%rsi), %r9d
	shll	$23, %r9d
	orl 	%r9d, 8(%rsi)
	shrl	$9, 4(%rsi)
	movl	(%rsi), %r9d
	shll	$23, %r9d
	orl 	%r9d, 4(%rsi)
	shrl	$9, (%rsi)
	leaq	40(%rsp), %rdi
	movl	%r10d, (%rdi)
	leaq	40(%rsp), %rdi
	movl	76(%rsp), %esi
	movl	%esi, 4(%rdi)
	movl	80(%rsp), %esi
	movl	%esi, 8(%rdi)
	movl	84(%rsp), %esi
	movl	%esi, 12(%rdi)
	leaq	112(%rsp), %rdi
	leaq	88(%rsp), %r9
	movb	(%r9), %sil
	movb	%sil, (%rdi)
	movb	1(%r9), %sil
	movb	%sil, 1(%rdi)
	movb	2(%r9), %sil
	movb	%sil, 2(%rdi)
	movb	3(%r9), %sil
	movb	%sil, 3(%rdi)
	movb	4(%r9), %sil
	movb	%sil, 4(%rdi)
	movb	5(%r9), %sil
	movb	%sil, 5(%rdi)
	movb	6(%r9), %sil
	movb	%sil, 6(%rdi)
	movb	7(%r9), %sil
	movb	%sil, 7(%rdi)
	movb	8(%r9), %sil
	movb	%sil, 8(%rdi)
	movb	9(%r9), %sil
	movb	%sil, 9(%rdi)
	movb	10(%r9), %sil
	movb	%sil, 10(%rdi)
	movb	11(%r9), %sil
	movb	%sil, 11(%rdi)
	movb	12(%r9), %sil
	movb	%sil, 12(%rdi)
	movb	13(%r9), %sil
	movb	%sil, 13(%rdi)
	movb	14(%r9), %sil
	movb	%sil, 14(%rdi)
	movb	15(%r9), %sil
	movb	%sil, 15(%rdi)
	movb	16(%r9), %sil
	movb	%sil, 16(%rdi)
	movb	17(%r9), %sil
	movb	%sil, 17(%rdi)
	movb	18(%r9), %sil
	movb	%sil, 18(%rdi)
	movb	19(%r9), %sil
	movb	%sil, 19(%rdi)
	movb	20(%r9), %sil
	movb	%sil, 20(%rdi)
	movb	21(%r9), %sil
	movb	%sil, 21(%rdi)
	movb	22(%r9), %sil
	movb	%sil, 22(%rdi)
	movb	23(%r9), %sil
	movb	%sil, 23(%rdi)
	leaq	(%rcx,%rax), %rsi
	movq	%r8, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	88(%rsp), %rcx
	leaq	112(%rsp), %rax
	leaq	40(%rsp), %rdi
	movq	%rdi, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %r8
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
	movl	(%rsi), %r10d
	movl	%r10d, 80(%rsp)
	movl	4(%rsi), %r10d
	movl	%r10d, 84(%rsp)
	movl	8(%rsi), %esi
	movl	%esi, 88(%rsp)
	leaq	40(%rsp), %rdi
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	leaq	40(%rsp), %rdi
	movl	80(%rsp), %esi
	movl	%esi, 4(%rdi)
	movl	84(%rsp), %esi
	movl	%esi, 8(%rdi)
	movl	88(%rsp), %esi
	movl	%esi, 12(%rdi)
	movq	%rcx, %rsi
	movq	%rcx, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%r8, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%edx, 72(%rsp)
	leaq	40(%rsp), %rdi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rsi
// declassify_mem 1440 [RSI]
	movq	8(%rsp), %rax
	movq	16(%rsp), %r11
	movq	24(%rsp), %r8
	movq	32(%rsp), %rdi
	movl	72(%rsp), %edx
	lfence
	movq	$0, %rcx
	movq	%r11, 32(%rsp)
	movq	%r8, 24(%rsp)
	movq	%rax, 16(%rsp)
	leaq	92(%rsp), %rcx
	leaq	40(%rsp), %r11
	movq	%rdi, %rax
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	216(%rsp), %rsp
	movq	32(%rsp), %r11
	movq	24(%rsp), %r8
	movq	16(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	$1440, %rsi
	movl	$1, %r10d
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%r11, 16(%rsp)
	leaq	80(%rsp), %rcx
	movl	8(%rcx), %edx
	andl	$511, %edx
	shrl	$9, 8(%rcx)
	movl	4(%rcx), %r9d
	shll	$23, %r9d
	orl 	%r9d, 8(%rcx)
	shrl	$9, 4(%rcx)
	movl	(%rcx), %r9d
	shll	$23, %r9d
	orl 	%r9d, 4(%rcx)
	shrl	$9, (%rcx)
	leaq	40(%rsp), %rdi
	movl	%r10d, (%rdi)
	leaq	40(%rsp), %rdi
	movl	80(%rsp), %ecx
	movl	%ecx, 4(%rdi)
	movl	84(%rsp), %ecx
	movl	%ecx, 8(%rdi)
	movl	88(%rsp), %ecx
	movl	%ecx, 12(%rdi)
	leaq	116(%rsp), %rcx
	leaq	92(%rsp), %r9
	movb	(%r9), %dil
	movb	%dil, (%rcx)
	movb	1(%r9), %dil
	movb	%dil, 1(%rcx)
	movb	2(%r9), %dil
	movb	%dil, 2(%rcx)
	movb	3(%r9), %dil
	movb	%dil, 3(%rcx)
	movb	4(%r9), %dil
	movb	%dil, 4(%rcx)
	movb	5(%r9), %dil
	movb	%dil, 5(%rcx)
	movb	6(%r9), %dil
	movb	%dil, 6(%rcx)
	movb	7(%r9), %dil
	movb	%dil, 7(%rcx)
	movb	8(%r9), %dil
	movb	%dil, 8(%rcx)
	movb	9(%r9), %dil
	movb	%dil, 9(%rcx)
	movb	10(%r9), %dil
	movb	%dil, 10(%rcx)
	movb	11(%r9), %dil
	movb	%dil, 11(%rcx)
	movb	12(%r9), %dil
	movb	%dil, 12(%rcx)
	movb	13(%r9), %dil
	movb	%dil, 13(%rcx)
	movb	14(%r9), %dil
	movb	%dil, 14(%rcx)
	movb	15(%r9), %dil
	movb	%dil, 15(%rcx)
	movb	16(%r9), %dil
	movb	%dil, 16(%rcx)
	movb	17(%r9), %dil
	movb	%dil, 17(%rcx)
	movb	18(%r9), %dil
	movb	%dil, 18(%rcx)
	movb	19(%r9), %dil
	movb	%dil, 19(%rcx)
	movb	20(%r9), %dil
	movb	%dil, 20(%rcx)
	movb	21(%r9), %dil
	movb	%dil, 21(%rcx)
	movb	22(%r9), %dil
	movb	%dil, 22(%rcx)
	movb	23(%r9), %dil
	movb	%dil, 23(%rcx)
	leaq	(%rax,%rsi), %rcx
	movq	%rax, 24(%rsp)
	movq	%r8, 32(%rsp)
	movl	%r10d, 72(%rsp)
	movq	%rsi, 8(%rsp)
	movl	%edx, 76(%rsp)
	leaq	116(%rsp), %rax
	leaq	40(%rsp), %rdi
	movq	%rcx, %rsi
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdi
// declassify_mem 1440 [RDI]
	movq	24(%rsp), %rax
	movq	32(%rsp), %r8
	movl	72(%rsp), %r10d
	movq	8(%rsp), %rsi
	movl	76(%rsp), %edx
	lfence
	movq	$0, %rcx
	cmpl	$6, %r10d
	jnb 	.Lht_sign$4
	movq	%r8, 8(%rsp)
	movq	%rax, 32(%rsp)
	movl	%r10d, 76(%rsp)
	movq	%rsi, 24(%rsp)
	leaq	92(%rsp), %rcx
	leaq	116(%rsp), %rax
	leaq	40(%rsp), %r11
	movq	%rdi, %rsi
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	216(%rsp), %rsp
	movq	8(%rsp), %r8
	movq	32(%rsp), %rax
	movl	76(%rsp), %r10d
	movq	24(%rsp), %rsi
	lfence
	movq	$0, %rcx
.Lht_sign$4:
	movq	16(%rsp), %r11
	lfence
	movq	$0, %rcx
	addq	$1440, %rsi
	incl	%r10d
.Lht_sign$2:
	cmpl	$7, %r10d
	jb  	.Lht_sign$3
	ret
.Lxmss_pkfromsig$1:
	movq	%rcx, 152(%rsp)
	movq	$0, 16(%r11)
	movq	$0, 24(%r11)
	movl	$0, 16(%r11)
	movl	%edx, 20(%r11)
	movq	%rsi, %rcx
	movq	%r8, 160(%rsp)
	movl	%edx, 192(%rsp)
	movq	%rsi, 168(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	leaq	-1528(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	1528(%rsp), %rsp
	movq	%rax, %rdi
	movq	160(%rsp), %r8
	movl	192(%rsp), %edx
	movq	168(%rsp), %rsi
	lfence
	movq	$0, %rax
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%edx, 28(%rdi)
	movq	$1224, %rax
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
	leaq	(%rsi,%rax), %rdx
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
	leaq	(%rsi,%rax), %rdx
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
	movq	%r8, 168(%rsp)
	movq	%rdi, 160(%rsp)
	movq	%rsi, 176(%rsp)
	movq	%rax, 184(%rsp)
	leaq	64(%rsp), %rcx
	leaq	128(%rsp), %rdx
	leaq	96(%rsp), %rsi
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	40(%rsp), %rsp
	movq	168(%rsp), %r8
	movq	160(%rsp), %rdi
	movq	176(%rsp), %rsi
	movq	184(%rsp), %rax
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
	addq	$24, %rax
	incl	%ecx
.Lxmss_pkfromsig$2:
	cmpl	$9, %ecx
	jb  	.Lxmss_pkfromsig$3
	movq	152(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp), %rdx
	movb	(%rdx), %al
	movb	%al, (%rcx)
	movb	1(%rdx), %al
	movb	%al, 1(%rcx)
	movb	2(%rdx), %al
	movb	%al, 2(%rcx)
	movb	3(%rdx), %al
	movb	%al, 3(%rcx)
	movb	4(%rdx), %al
	movb	%al, 4(%rcx)
	movb	5(%rdx), %al
	movb	%al, 5(%rcx)
	movb	6(%rdx), %al
	movb	%al, 6(%rcx)
	movb	7(%rdx), %al
	movb	%al, 7(%rcx)
	movb	8(%rdx), %al
	movb	%al, 8(%rcx)
	movb	9(%rdx), %al
	movb	%al, 9(%rcx)
	movb	10(%rdx), %al
	movb	%al, 10(%rcx)
	movb	11(%rdx), %al
	movb	%al, 11(%rcx)
	movb	12(%rdx), %al
	movb	%al, 12(%rcx)
	movb	13(%rdx), %al
	movb	%al, 13(%rcx)
	movb	14(%rdx), %al
	movb	%al, 14(%rcx)
	movb	15(%rdx), %al
	movb	%al, 15(%rcx)
	movb	16(%rdx), %al
	movb	%al, 16(%rcx)
	movb	17(%rdx), %al
	movb	%al, 17(%rcx)
	movb	18(%rdx), %al
	movb	%al, 18(%rcx)
	movb	19(%rdx), %al
	movb	%al, 19(%rcx)
	movb	20(%rdx), %al
	movb	%al, 20(%rcx)
	movb	21(%rdx), %al
	movb	%al, 21(%rcx)
	movb	22(%rdx), %al
	movb	%al, 22(%rcx)
	movb	23(%rdx), %al
	movb	%al, 23(%rcx)
	ret
.Lxmss_sign$1:
	movq	%rax, 8(%rsp)
	movq	$1224, %rcx
	movl	%edx, %eax
	xorl	$1, %eax
	movl	$0, %r10d
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%r11, 16(%rsp)
	movq	%r8, 24(%rsp)
	movl	%edx, 48(%rsp)
	movl	%r10d, 52(%rsp)
	movl	%eax, 56(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	(%rsi,%rcx), %rcx
	movq	%rsi, 40(%rsp)
	movl	%eax, %esi
	movl	%r10d, %edx
	leaq	-24696(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	24696(%rsp), %rsp
	movq	40(%rsp), %rsi
	lfence
	movq	$0, %rax
	movq	16(%rsp), %r11
	movq	24(%rsp), %r8
	movl	48(%rsp), %edx
	movl	52(%rsp), %r10d
	movl	56(%rsp), %eax
	movq	32(%rsp), %rcx
	lfence
	movq	$0, %r9
	shrl	$1, %eax
	xorl	$1, %eax
	addq	$24, %rcx
	incl	%r10d
.Lxmss_sign$3:
	cmpl	$9, %r10d
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rax
	lfence
	movq	$0, %rcx
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%edx, 20(%rdi)
	movq	%rsi, %rbx
	movq	%rsi, 8(%rsp)
	leaq	-296(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	296(%rsp), %rsp
	movq	8(%rsp), %rcx
	lfence
	movq	$0, %rax
	ret
.Lxmss_node$1:
	movq	%rcx, 24648(%rsp)
	movq	$0, %rax
	movl	$0, %r10d
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%edx, 24680(%rsp)
	movl	%edx, %ecx
	subl	%r10d, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r9d
	imull	%esi, %r9d
	addl	%r9d, %edx
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%r11, 24656(%rsp)
	movq	%r8, 24664(%rsp)
	movl	%esi, 24684(%rsp)
	movl	%r10d, 24688(%rsp)
	movl	%r9d, 24692(%rsp)
	movl	%edx, 24696(%rsp)
	cmpl	$0, %r10d
	je  	.Lxmss_node$6
	movl	%r9d, %eax
	imull	$2, %eax, %eax
	movl	%r10d, %edx
	decl	%edx
	movl	$10, %ecx
	movq	$1, %r11
	shlq	%cl, %r11
	subl	%edx, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subq	%rdx, %r11
	movl	%eax, %eax
	addq	%rax, %r11
	imulq	$24, %r11, %r11
	movq	%r11, %rax
	addq	$24, %rax
	leaq	24624(%rsp), %rcx
	leaq	32(%rsp,%r11), %rdx
	movb	(%rdx), %sil
	movb	%sil, (%rcx)
	movb	1(%rdx), %sil
	movb	%sil, 1(%rcx)
	movb	2(%rdx), %sil
	movb	%sil, 2(%rcx)
	movb	3(%rdx), %sil
	movb	%sil, 3(%rcx)
	movb	4(%rdx), %sil
	movb	%sil, 4(%rcx)
	movb	5(%rdx), %sil
	movb	%sil, 5(%rcx)
	movb	6(%rdx), %sil
	movb	%sil, 6(%rcx)
	movb	7(%rdx), %sil
	movb	%sil, 7(%rcx)
	movb	8(%rdx), %sil
	movb	%sil, 8(%rcx)
	movb	9(%rdx), %sil
	movb	%sil, 9(%rcx)
	movb	10(%rdx), %sil
	movb	%sil, 10(%rcx)
	movb	11(%rdx), %sil
	movb	%sil, 11(%rcx)
	movb	12(%rdx), %sil
	movb	%sil, 12(%rcx)
	movb	13(%rdx), %sil
	movb	%sil, 13(%rcx)
	movb	14(%rdx), %sil
	movb	%sil, 14(%rcx)
	movb	15(%rdx), %sil
	movb	%sil, 15(%rcx)
	movb	16(%rdx), %sil
	movb	%sil, 16(%rcx)
	movb	17(%rdx), %sil
	movb	%sil, 17(%rcx)
	movb	18(%rdx), %sil
	movb	%sil, 18(%rcx)
	movb	19(%rdx), %sil
	movb	%sil, 19(%rcx)
	movb	20(%rdx), %sil
	movb	%sil, 20(%rcx)
	movb	21(%rdx), %sil
	movb	%sil, 21(%rcx)
	movb	22(%rdx), %sil
	movb	%sil, 22(%rcx)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rcx)
	leaq	24592(%rsp), %rcx
	leaq	32(%rsp,%rax), %rdx
	movb	(%rdx), %al
	movb	%al, (%rcx)
	movb	1(%rdx), %al
	movb	%al, 1(%rcx)
	movb	2(%rdx), %al
	movb	%al, 2(%rcx)
	movb	3(%rdx), %al
	movb	%al, 3(%rcx)
	movb	4(%rdx), %al
	movb	%al, 4(%rcx)
	movb	5(%rdx), %al
	movb	%al, 5(%rcx)
	movb	6(%rdx), %al
	movb	%al, 6(%rcx)
	movb	7(%rdx), %al
	movb	%al, 7(%rcx)
	movb	8(%rdx), %al
	movb	%al, 8(%rcx)
	movb	9(%rdx), %al
	movb	%al, 9(%rcx)
	movb	10(%rdx), %al
	movb	%al, 10(%rcx)
	movb	11(%rdx), %al
	movb	%al, 11(%rcx)
	movb	12(%rdx), %al
	movb	%al, 12(%rcx)
	movb	13(%rdx), %al
	movb	%al, 13(%rcx)
	movb	14(%rdx), %al
	movb	%al, 14(%rcx)
	movb	15(%rdx), %al
	movb	%al, 15(%rcx)
	movb	16(%rdx), %al
	movb	%al, 16(%rcx)
	movb	17(%rdx), %al
	movb	%al, 17(%rcx)
	movb	18(%rdx), %al
	movb	%al, 18(%rcx)
	movb	19(%rdx), %al
	movb	%al, 19(%rcx)
	movb	20(%rdx), %al
	movb	%al, 20(%rcx)
	movb	21(%rdx), %al
	movb	%al, 21(%rcx)
	movb	22(%rdx), %al
	movb	%al, 22(%rcx)
	movb	23(%rdx), %al
	movb	%al, 23(%rcx)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$2, 16(%rdi)
	movl	%r10d, 24(%rdi)
	movl	%r9d, 28(%rdi)
	movl	$10, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subl	%r10d, %ecx
	movq	$1, %r10
	shlq	%cl, %r10
	subq	%r10, %rdx
	movl	%r9d, %eax
	addq	%rax, %rdx
	imulq	$24, %rdx, %rax
	movq	%rdi, 24672(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	24624(%rsp), %rdx
	leaq	24592(%rsp), %rsi
	leaq	-40(%rsp), %rsp
	call	.LH$1
.Lxmss_node$9:
	leaq	40(%rsp), %rsp
	movq	24672(%rsp), %rdi
	lfence
	movq	$0, %rcx
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movl	$0, 16(%rdi)
	movl	%r9d, 20(%rdi)
	movl	%r9d, %eax
	imulq	$24, %rax, %rax
	leaq	32(%rsp,%rax), %rcx
	leaq	-1336(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	1336(%rsp), %rsp
.Lxmss_node$7:
	movq	24656(%rsp), %r11
	movq	24664(%rsp), %r8
	movl	24684(%rsp), %esi
	movl	24688(%rsp), %r10d
	movl	24692(%rsp), %r9d
	movl	24696(%rsp), %edx
	lfence
	movq	$0, %rcx
	incl	%r9d
.Lxmss_node$4:
	cmpl	%edx, %r9d
	jb  	.Lxmss_node$5
	movl	24680(%rsp), %edx
	lfence
	movq	$0, %rcx
	incl	%r10d
.Lxmss_node$2:
	cmpl	%edx, %r10d
	jbe 	.Lxmss_node$3
	movq	24648(%rsp), %rcx
	lfence
	movq	$0, %rdx
	leaq	32(%rsp,%rax), %rdx
	movb	(%rdx), %al
	movb	%al, (%rcx)
	movb	1(%rdx), %al
	movb	%al, 1(%rcx)
	movb	2(%rdx), %al
	movb	%al, 2(%rcx)
	movb	3(%rdx), %al
	movb	%al, 3(%rcx)
	movb	4(%rdx), %al
	movb	%al, 4(%rcx)
	movb	5(%rdx), %al
	movb	%al, 5(%rcx)
	movb	6(%rdx), %al
	movb	%al, 6(%rcx)
	movb	7(%rdx), %al
	movb	%al, 7(%rcx)
	movb	8(%rdx), %al
	movb	%al, 8(%rcx)
	movb	9(%rdx), %al
	movb	%al, 9(%rcx)
	movb	10(%rdx), %al
	movb	%al, 10(%rcx)
	movb	11(%rdx), %al
	movb	%al, 11(%rcx)
	movb	12(%rdx), %al
	movb	%al, 12(%rcx)
	movb	13(%rdx), %al
	movb	%al, 13(%rcx)
	movb	14(%rdx), %al
	movb	%al, 14(%rcx)
	movb	15(%rdx), %al
	movb	%al, 15(%rcx)
	movb	16(%rdx), %al
	movb	%al, 16(%rcx)
	movb	17(%rdx), %al
	movb	%al, 17(%rcx)
	movb	18(%rdx), %al
	movb	%al, 18(%rcx)
	movb	19(%rdx), %al
	movb	%al, 19(%rcx)
	movb	20(%rdx), %al
	movb	%al, 20(%rcx)
	movb	21(%rdx), %al
	movb	%al, 21(%rcx)
	movb	22(%rdx), %al
	movb	%al, 22(%rcx)
	movb	23(%rdx), %al
	movb	%al, 23(%rcx)
	ret
.Lwots_pkfromsig$1:
	movq	%rsi, 1256(%rsp)
	leaq	1316(%rsp), %rsi
	movq	%rsi, %rdi
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
	movl	%ebx, (%rdi)
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
	movl	%ebx, 4(%rdi)
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
	movl	%ebx, 8(%rdi)
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
	movl	%ebx, 12(%rdi)
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
	movl	%ebx, 16(%rdi)
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
	movl	%ebx, 20(%rdi)
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
	movl	%ebx, 24(%rdi)
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
	movl	%ebx, 28(%rdi)
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
	movl	%ebx, 32(%rdi)
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
	movl	%ebx, 36(%rdi)
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
	movl	%ebx, 40(%rdi)
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
	movl	%ebx, 44(%rdi)
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
	movl	%ebx, 48(%rdi)
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
	movl	%ebx, 52(%rdi)
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
	movl	%ebx, 56(%rdi)
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
	movl	%ebx, 60(%rdi)
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
	movl	%ebx, 64(%rdi)
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
	movl	%ebx, 68(%rdi)
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
	movl	%ebx, 72(%rdi)
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
	movl	%ebx, 76(%rdi)
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
	movl	%ebx, 80(%rdi)
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
	movl	%ebx, 84(%rdi)
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
	movl	%ebx, 88(%rdi)
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
	movl	%ebx, 92(%rdi)
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
	movl	%ebx, 96(%rdi)
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
	movl	%ebx, 100(%rdi)
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
	movl	%ebx, 104(%rdi)
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
	movl	%ebx, 108(%rdi)
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
	movl	%ebx, 112(%rdi)
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
	movl	%ebx, 116(%rdi)
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
	movl	%ebx, 120(%rdi)
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
	movl	%ebx, 124(%rdi)
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
	movl	%ebx, 128(%rdi)
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
	movl	%ebx, 132(%rdi)
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
	movl	%ebx, 136(%rdi)
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
	movl	%ebx, 140(%rdi)
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
	movl	%ebx, 144(%rdi)
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
	movl	%ebx, 148(%rdi)
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
	movl	%ebx, 152(%rdi)
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
	movl	%ebx, 156(%rdi)
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
	movl	%ebx, 160(%rdi)
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
	movl	%ebx, 164(%rdi)
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
	movl	%ebx, 168(%rdi)
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
	movl	%ebx, 172(%rdi)
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
	movl	%ebx, 176(%rdi)
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
	movl	%ebx, 180(%rdi)
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
	movl	%ebx, 184(%rdi)
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
	movl	%eax, 188(%rdi)
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
	leaq	192(%rsi), %rsi
	leaq	1520(%rsp), %rax
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_pkfromsig$10
.Lwots_pkfromsig$11:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %edi
	orl 	%edi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$10:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$11
	movl	%r10d, %edi
	addl	$-4, %ecx
	shrq	%cl, %rdi
	andq	$15, %rdi
	movl	%edi, (%rsi)
	jmp 	.Lwots_pkfromsig$8
.Lwots_pkfromsig$9:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %edi
	orl 	%edi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$8:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$9
	movl	%r10d, %edi
	addl	$-4, %ecx
	shrq	%cl, %rdi
	andq	$15, %rdi
	movl	%edi, 4(%rsi)
	jmp 	.Lwots_pkfromsig$6
.Lwots_pkfromsig$7:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %edi
	orl 	%edi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_pkfromsig$6:
	cmpl	$4, %ecx
	jb  	.Lwots_pkfromsig$7
	movl	%r10d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 8(%rsi)
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
	movb	560(%rdx), %al
	movb	%al, 592(%rsp)
	movb	561(%rdx), %al
	movb	%al, 593(%rsp)
	movb	562(%rdx), %al
	movb	%al, 594(%rsp)
	movb	563(%rdx), %al
	movb	%al, 595(%rsp)
	movb	564(%rdx), %al
	movb	%al, 596(%rsp)
	movb	565(%rdx), %al
	movb	%al, 597(%rsp)
	movb	566(%rdx), %al
	movb	%al, 598(%rsp)
	movb	567(%rdx), %al
	movb	%al, 599(%rsp)
	movb	568(%rdx), %al
	movb	%al, 600(%rsp)
	movb	569(%rdx), %al
	movb	%al, 601(%rsp)
	movb	570(%rdx), %al
	movb	%al, 602(%rsp)
	movb	571(%rdx), %al
	movb	%al, 603(%rsp)
	movb	572(%rdx), %al
	movb	%al, 604(%rsp)
	movb	573(%rdx), %al
	movb	%al, 605(%rsp)
	movb	574(%rdx), %al
	movb	%al, 606(%rsp)
	movb	575(%rdx), %al
	movb	%al, 607(%rsp)
	movb	576(%rdx), %al
	movb	%al, 608(%rsp)
	movb	577(%rdx), %al
	movb	%al, 609(%rsp)
	movb	578(%rdx), %al
	movb	%al, 610(%rsp)
	movb	579(%rdx), %al
	movb	%al, 611(%rsp)
	movb	580(%rdx), %al
	movb	%al, 612(%rsp)
	movb	581(%rdx), %al
	movb	%al, 613(%rsp)
	movb	582(%rdx), %al
	movb	%al, 614(%rsp)
	movb	583(%rdx), %al
	movb	%al, 615(%rsp)
	movb	584(%rdx), %al
	movb	%al, 616(%rsp)
	movb	585(%rdx), %al
	movb	%al, 617(%rsp)
	movb	586(%rdx), %al
	movb	%al, 618(%rsp)
	movb	587(%rdx), %al
	movb	%al, 619(%rsp)
	movb	588(%rdx), %al
	movb	%al, 620(%rsp)
	movb	589(%rdx), %al
	movb	%al, 621(%rsp)
	movb	590(%rdx), %al
	movb	%al, 622(%rsp)
	movb	591(%rdx), %al
	movb	%al, 623(%rsp)
	movb	592(%rdx), %al
	movb	%al, 624(%rsp)
	movb	593(%rdx), %al
	movb	%al, 625(%rsp)
	movb	594(%rdx), %al
	movb	%al, 626(%rsp)
	movb	595(%rdx), %al
	movb	%al, 627(%rsp)
	movb	596(%rdx), %al
	movb	%al, 628(%rsp)
	movb	597(%rdx), %al
	movb	%al, 629(%rsp)
	movb	598(%rdx), %al
	movb	%al, 630(%rsp)
	movb	599(%rdx), %al
	movb	%al, 631(%rsp)
	movb	600(%rdx), %al
	movb	%al, 632(%rsp)
	movb	601(%rdx), %al
	movb	%al, 633(%rsp)
	movb	602(%rdx), %al
	movb	%al, 634(%rsp)
	movb	603(%rdx), %al
	movb	%al, 635(%rsp)
	movb	604(%rdx), %al
	movb	%al, 636(%rsp)
	movb	605(%rdx), %al
	movb	%al, 637(%rsp)
	movb	606(%rdx), %al
	movb	%al, 638(%rsp)
	movb	607(%rdx), %al
	movb	%al, 639(%rsp)
	movb	608(%rdx), %al
	movb	%al, 640(%rsp)
	movb	609(%rdx), %al
	movb	%al, 641(%rsp)
	movb	610(%rdx), %al
	movb	%al, 642(%rsp)
	movb	611(%rdx), %al
	movb	%al, 643(%rsp)
	movb	612(%rdx), %al
	movb	%al, 644(%rsp)
	movb	613(%rdx), %al
	movb	%al, 645(%rsp)
	movb	614(%rdx), %al
	movb	%al, 646(%rsp)
	movb	615(%rdx), %al
	movb	%al, 647(%rsp)
	movb	616(%rdx), %al
	movb	%al, 648(%rsp)
	movb	617(%rdx), %al
	movb	%al, 649(%rsp)
	movb	618(%rdx), %al
	movb	%al, 650(%rsp)
	movb	619(%rdx), %al
	movb	%al, 651(%rsp)
	movb	620(%rdx), %al
	movb	%al, 652(%rsp)
	movb	621(%rdx), %al
	movb	%al, 653(%rsp)
	movb	622(%rdx), %al
	movb	%al, 654(%rsp)
	movb	623(%rdx), %al
	movb	%al, 655(%rsp)
	movb	624(%rdx), %al
	movb	%al, 656(%rsp)
	movb	625(%rdx), %al
	movb	%al, 657(%rsp)
	movb	626(%rdx), %al
	movb	%al, 658(%rsp)
	movb	627(%rdx), %al
	movb	%al, 659(%rsp)
	movb	628(%rdx), %al
	movb	%al, 660(%rsp)
	movb	629(%rdx), %al
	movb	%al, 661(%rsp)
	movb	630(%rdx), %al
	movb	%al, 662(%rsp)
	movb	631(%rdx), %al
	movb	%al, 663(%rsp)
	movb	632(%rdx), %al
	movb	%al, 664(%rsp)
	movb	633(%rdx), %al
	movb	%al, 665(%rsp)
	movb	634(%rdx), %al
	movb	%al, 666(%rsp)
	movb	635(%rdx), %al
	movb	%al, 667(%rsp)
	movb	636(%rdx), %al
	movb	%al, 668(%rsp)
	movb	637(%rdx), %al
	movb	%al, 669(%rsp)
	movb	638(%rdx), %al
	movb	%al, 670(%rsp)
	movb	639(%rdx), %al
	movb	%al, 671(%rsp)
	movb	640(%rdx), %al
	movb	%al, 672(%rsp)
	movb	641(%rdx), %al
	movb	%al, 673(%rsp)
	movb	642(%rdx), %al
	movb	%al, 674(%rsp)
	movb	643(%rdx), %al
	movb	%al, 675(%rsp)
	movb	644(%rdx), %al
	movb	%al, 676(%rsp)
	movb	645(%rdx), %al
	movb	%al, 677(%rsp)
	movb	646(%rdx), %al
	movb	%al, 678(%rsp)
	movb	647(%rdx), %al
	movb	%al, 679(%rsp)
	movb	648(%rdx), %al
	movb	%al, 680(%rsp)
	movb	649(%rdx), %al
	movb	%al, 681(%rsp)
	movb	650(%rdx), %al
	movb	%al, 682(%rsp)
	movb	651(%rdx), %al
	movb	%al, 683(%rsp)
	movb	652(%rdx), %al
	movb	%al, 684(%rsp)
	movb	653(%rdx), %al
	movb	%al, 685(%rsp)
	movb	654(%rdx), %al
	movb	%al, 686(%rsp)
	movb	655(%rdx), %al
	movb	%al, 687(%rsp)
	movb	656(%rdx), %al
	movb	%al, 688(%rsp)
	movb	657(%rdx), %al
	movb	%al, 689(%rsp)
	movb	658(%rdx), %al
	movb	%al, 690(%rsp)
	movb	659(%rdx), %al
	movb	%al, 691(%rsp)
	movb	660(%rdx), %al
	movb	%al, 692(%rsp)
	movb	661(%rdx), %al
	movb	%al, 693(%rsp)
	movb	662(%rdx), %al
	movb	%al, 694(%rsp)
	movb	663(%rdx), %al
	movb	%al, 695(%rsp)
	movb	664(%rdx), %al
	movb	%al, 696(%rsp)
	movb	665(%rdx), %al
	movb	%al, 697(%rsp)
	movb	666(%rdx), %al
	movb	%al, 698(%rsp)
	movb	667(%rdx), %al
	movb	%al, 699(%rsp)
	movb	668(%rdx), %al
	movb	%al, 700(%rsp)
	movb	669(%rdx), %al
	movb	%al, 701(%rsp)
	movb	670(%rdx), %al
	movb	%al, 702(%rsp)
	movb	671(%rdx), %al
	movb	%al, 703(%rsp)
	movb	672(%rdx), %al
	movb	%al, 704(%rsp)
	movb	673(%rdx), %al
	movb	%al, 705(%rsp)
	movb	674(%rdx), %al
	movb	%al, 706(%rsp)
	movb	675(%rdx), %al
	movb	%al, 707(%rsp)
	movb	676(%rdx), %al
	movb	%al, 708(%rsp)
	movb	677(%rdx), %al
	movb	%al, 709(%rsp)
	movb	678(%rdx), %al
	movb	%al, 710(%rsp)
	movb	679(%rdx), %al
	movb	%al, 711(%rsp)
	movb	680(%rdx), %al
	movb	%al, 712(%rsp)
	movb	681(%rdx), %al
	movb	%al, 713(%rsp)
	movb	682(%rdx), %al
	movb	%al, 714(%rsp)
	movb	683(%rdx), %al
	movb	%al, 715(%rsp)
	movb	684(%rdx), %al
	movb	%al, 716(%rsp)
	movb	685(%rdx), %al
	movb	%al, 717(%rsp)
	movb	686(%rdx), %al
	movb	%al, 718(%rsp)
	movb	687(%rdx), %al
	movb	%al, 719(%rsp)
	movb	688(%rdx), %al
	movb	%al, 720(%rsp)
	movb	689(%rdx), %al
	movb	%al, 721(%rsp)
	movb	690(%rdx), %al
	movb	%al, 722(%rsp)
	movb	691(%rdx), %al
	movb	%al, 723(%rsp)
	movb	692(%rdx), %al
	movb	%al, 724(%rsp)
	movb	693(%rdx), %al
	movb	%al, 725(%rsp)
	movb	694(%rdx), %al
	movb	%al, 726(%rsp)
	movb	695(%rdx), %al
	movb	%al, 727(%rsp)
	movb	696(%rdx), %al
	movb	%al, 728(%rsp)
	movb	697(%rdx), %al
	movb	%al, 729(%rsp)
	movb	698(%rdx), %al
	movb	%al, 730(%rsp)
	movb	699(%rdx), %al
	movb	%al, 731(%rsp)
	movb	700(%rdx), %al
	movb	%al, 732(%rsp)
	movb	701(%rdx), %al
	movb	%al, 733(%rsp)
	movb	702(%rdx), %al
	movb	%al, 734(%rsp)
	movb	703(%rdx), %al
	movb	%al, 735(%rsp)
	movb	704(%rdx), %al
	movb	%al, 736(%rsp)
	movb	705(%rdx), %al
	movb	%al, 737(%rsp)
	movb	706(%rdx), %al
	movb	%al, 738(%rsp)
	movb	707(%rdx), %al
	movb	%al, 739(%rsp)
	movb	708(%rdx), %al
	movb	%al, 740(%rsp)
	movb	709(%rdx), %al
	movb	%al, 741(%rsp)
	movb	710(%rdx), %al
	movb	%al, 742(%rsp)
	movb	711(%rdx), %al
	movb	%al, 743(%rsp)
	movb	712(%rdx), %al
	movb	%al, 744(%rsp)
	movb	713(%rdx), %al
	movb	%al, 745(%rsp)
	movb	714(%rdx), %al
	movb	%al, 746(%rsp)
	movb	715(%rdx), %al
	movb	%al, 747(%rsp)
	movb	716(%rdx), %al
	movb	%al, 748(%rsp)
	movb	717(%rdx), %al
	movb	%al, 749(%rsp)
	movb	718(%rdx), %al
	movb	%al, 750(%rsp)
	movb	719(%rdx), %al
	movb	%al, 751(%rsp)
	movb	720(%rdx), %al
	movb	%al, 752(%rsp)
	movb	721(%rdx), %al
	movb	%al, 753(%rsp)
	movb	722(%rdx), %al
	movb	%al, 754(%rsp)
	movb	723(%rdx), %al
	movb	%al, 755(%rsp)
	movb	724(%rdx), %al
	movb	%al, 756(%rsp)
	movb	725(%rdx), %al
	movb	%al, 757(%rsp)
	movb	726(%rdx), %al
	movb	%al, 758(%rsp)
	movb	727(%rdx), %al
	movb	%al, 759(%rsp)
	movb	728(%rdx), %al
	movb	%al, 760(%rsp)
	movb	729(%rdx), %al
	movb	%al, 761(%rsp)
	movb	730(%rdx), %al
	movb	%al, 762(%rsp)
	movb	731(%rdx), %al
	movb	%al, 763(%rsp)
	movb	732(%rdx), %al
	movb	%al, 764(%rsp)
	movb	733(%rdx), %al
	movb	%al, 765(%rsp)
	movb	734(%rdx), %al
	movb	%al, 766(%rsp)
	movb	735(%rdx), %al
	movb	%al, 767(%rsp)
	movb	736(%rdx), %al
	movb	%al, 768(%rsp)
	movb	737(%rdx), %al
	movb	%al, 769(%rsp)
	movb	738(%rdx), %al
	movb	%al, 770(%rsp)
	movb	739(%rdx), %al
	movb	%al, 771(%rsp)
	movb	740(%rdx), %al
	movb	%al, 772(%rsp)
	movb	741(%rdx), %al
	movb	%al, 773(%rsp)
	movb	742(%rdx), %al
	movb	%al, 774(%rsp)
	movb	743(%rdx), %al
	movb	%al, 775(%rsp)
	movb	744(%rdx), %al
	movb	%al, 776(%rsp)
	movb	745(%rdx), %al
	movb	%al, 777(%rsp)
	movb	746(%rdx), %al
	movb	%al, 778(%rsp)
	movb	747(%rdx), %al
	movb	%al, 779(%rsp)
	movb	748(%rdx), %al
	movb	%al, 780(%rsp)
	movb	749(%rdx), %al
	movb	%al, 781(%rsp)
	movb	750(%rdx), %al
	movb	%al, 782(%rsp)
	movb	751(%rdx), %al
	movb	%al, 783(%rsp)
	movb	752(%rdx), %al
	movb	%al, 784(%rsp)
	movb	753(%rdx), %al
	movb	%al, 785(%rsp)
	movb	754(%rdx), %al
	movb	%al, 786(%rsp)
	movb	755(%rdx), %al
	movb	%al, 787(%rsp)
	movb	756(%rdx), %al
	movb	%al, 788(%rsp)
	movb	757(%rdx), %al
	movb	%al, 789(%rsp)
	movb	758(%rdx), %al
	movb	%al, 790(%rsp)
	movb	759(%rdx), %al
	movb	%al, 791(%rsp)
	movb	760(%rdx), %al
	movb	%al, 792(%rsp)
	movb	761(%rdx), %al
	movb	%al, 793(%rsp)
	movb	762(%rdx), %al
	movb	%al, 794(%rsp)
	movb	763(%rdx), %al
	movb	%al, 795(%rsp)
	movb	764(%rdx), %al
	movb	%al, 796(%rsp)
	movb	765(%rdx), %al
	movb	%al, 797(%rsp)
	movb	766(%rdx), %al
	movb	%al, 798(%rsp)
	movb	767(%rdx), %al
	movb	%al, 799(%rsp)
	movb	768(%rdx), %al
	movb	%al, 800(%rsp)
	movb	769(%rdx), %al
	movb	%al, 801(%rsp)
	movb	770(%rdx), %al
	movb	%al, 802(%rsp)
	movb	771(%rdx), %al
	movb	%al, 803(%rsp)
	movb	772(%rdx), %al
	movb	%al, 804(%rsp)
	movb	773(%rdx), %al
	movb	%al, 805(%rsp)
	movb	774(%rdx), %al
	movb	%al, 806(%rsp)
	movb	775(%rdx), %al
	movb	%al, 807(%rsp)
	movb	776(%rdx), %al
	movb	%al, 808(%rsp)
	movb	777(%rdx), %al
	movb	%al, 809(%rsp)
	movb	778(%rdx), %al
	movb	%al, 810(%rsp)
	movb	779(%rdx), %al
	movb	%al, 811(%rsp)
	movb	780(%rdx), %al
	movb	%al, 812(%rsp)
	movb	781(%rdx), %al
	movb	%al, 813(%rsp)
	movb	782(%rdx), %al
	movb	%al, 814(%rsp)
	movb	783(%rdx), %al
	movb	%al, 815(%rsp)
	movb	784(%rdx), %al
	movb	%al, 816(%rsp)
	movb	785(%rdx), %al
	movb	%al, 817(%rsp)
	movb	786(%rdx), %al
	movb	%al, 818(%rsp)
	movb	787(%rdx), %al
	movb	%al, 819(%rsp)
	movb	788(%rdx), %al
	movb	%al, 820(%rsp)
	movb	789(%rdx), %al
	movb	%al, 821(%rsp)
	movb	790(%rdx), %al
	movb	%al, 822(%rsp)
	movb	791(%rdx), %al
	movb	%al, 823(%rsp)
	movb	792(%rdx), %al
	movb	%al, 824(%rsp)
	movb	793(%rdx), %al
	movb	%al, 825(%rsp)
	movb	794(%rdx), %al
	movb	%al, 826(%rsp)
	movb	795(%rdx), %al
	movb	%al, 827(%rsp)
	movb	796(%rdx), %al
	movb	%al, 828(%rsp)
	movb	797(%rdx), %al
	movb	%al, 829(%rsp)
	movb	798(%rdx), %al
	movb	%al, 830(%rsp)
	movb	799(%rdx), %al
	movb	%al, 831(%rsp)
	movb	800(%rdx), %al
	movb	%al, 832(%rsp)
	movb	801(%rdx), %al
	movb	%al, 833(%rsp)
	movb	802(%rdx), %al
	movb	%al, 834(%rsp)
	movb	803(%rdx), %al
	movb	%al, 835(%rsp)
	movb	804(%rdx), %al
	movb	%al, 836(%rsp)
	movb	805(%rdx), %al
	movb	%al, 837(%rsp)
	movb	806(%rdx), %al
	movb	%al, 838(%rsp)
	movb	807(%rdx), %al
	movb	%al, 839(%rsp)
	movb	808(%rdx), %al
	movb	%al, 840(%rsp)
	movb	809(%rdx), %al
	movb	%al, 841(%rsp)
	movb	810(%rdx), %al
	movb	%al, 842(%rsp)
	movb	811(%rdx), %al
	movb	%al, 843(%rsp)
	movb	812(%rdx), %al
	movb	%al, 844(%rsp)
	movb	813(%rdx), %al
	movb	%al, 845(%rsp)
	movb	814(%rdx), %al
	movb	%al, 846(%rsp)
	movb	815(%rdx), %al
	movb	%al, 847(%rsp)
	movb	816(%rdx), %al
	movb	%al, 848(%rsp)
	movb	817(%rdx), %al
	movb	%al, 849(%rsp)
	movb	818(%rdx), %al
	movb	%al, 850(%rsp)
	movb	819(%rdx), %al
	movb	%al, 851(%rsp)
	movb	820(%rdx), %al
	movb	%al, 852(%rsp)
	movb	821(%rdx), %al
	movb	%al, 853(%rsp)
	movb	822(%rdx), %al
	movb	%al, 854(%rsp)
	movb	823(%rdx), %al
	movb	%al, 855(%rsp)
	movb	824(%rdx), %al
	movb	%al, 856(%rsp)
	movb	825(%rdx), %al
	movb	%al, 857(%rsp)
	movb	826(%rdx), %al
	movb	%al, 858(%rsp)
	movb	827(%rdx), %al
	movb	%al, 859(%rsp)
	movb	828(%rdx), %al
	movb	%al, 860(%rsp)
	movb	829(%rdx), %al
	movb	%al, 861(%rsp)
	movb	830(%rdx), %al
	movb	%al, 862(%rsp)
	movb	831(%rdx), %al
	movb	%al, 863(%rsp)
	movb	832(%rdx), %al
	movb	%al, 864(%rsp)
	movb	833(%rdx), %al
	movb	%al, 865(%rsp)
	movb	834(%rdx), %al
	movb	%al, 866(%rsp)
	movb	835(%rdx), %al
	movb	%al, 867(%rsp)
	movb	836(%rdx), %al
	movb	%al, 868(%rsp)
	movb	837(%rdx), %al
	movb	%al, 869(%rsp)
	movb	838(%rdx), %al
	movb	%al, 870(%rsp)
	movb	839(%rdx), %al
	movb	%al, 871(%rsp)
	movb	840(%rdx), %al
	movb	%al, 872(%rsp)
	movb	841(%rdx), %al
	movb	%al, 873(%rsp)
	movb	842(%rdx), %al
	movb	%al, 874(%rsp)
	movb	843(%rdx), %al
	movb	%al, 875(%rsp)
	movb	844(%rdx), %al
	movb	%al, 876(%rsp)
	movb	845(%rdx), %al
	movb	%al, 877(%rsp)
	movb	846(%rdx), %al
	movb	%al, 878(%rsp)
	movb	847(%rdx), %al
	movb	%al, 879(%rsp)
	movb	848(%rdx), %al
	movb	%al, 880(%rsp)
	movb	849(%rdx), %al
	movb	%al, 881(%rsp)
	movb	850(%rdx), %al
	movb	%al, 882(%rsp)
	movb	851(%rdx), %al
	movb	%al, 883(%rsp)
	movb	852(%rdx), %al
	movb	%al, 884(%rsp)
	movb	853(%rdx), %al
	movb	%al, 885(%rsp)
	movb	854(%rdx), %al
	movb	%al, 886(%rsp)
	movb	855(%rdx), %al
	movb	%al, 887(%rsp)
	movb	856(%rdx), %al
	movb	%al, 888(%rsp)
	movb	857(%rdx), %al
	movb	%al, 889(%rsp)
	movb	858(%rdx), %al
	movb	%al, 890(%rsp)
	movb	859(%rdx), %al
	movb	%al, 891(%rsp)
	movb	860(%rdx), %al
	movb	%al, 892(%rsp)
	movb	861(%rdx), %al
	movb	%al, 893(%rsp)
	movb	862(%rdx), %al
	movb	%al, 894(%rsp)
	movb	863(%rdx), %al
	movb	%al, 895(%rsp)
	movb	864(%rdx), %al
	movb	%al, 896(%rsp)
	movb	865(%rdx), %al
	movb	%al, 897(%rsp)
	movb	866(%rdx), %al
	movb	%al, 898(%rsp)
	movb	867(%rdx), %al
	movb	%al, 899(%rsp)
	movb	868(%rdx), %al
	movb	%al, 900(%rsp)
	movb	869(%rdx), %al
	movb	%al, 901(%rsp)
	movb	870(%rdx), %al
	movb	%al, 902(%rsp)
	movb	871(%rdx), %al
	movb	%al, 903(%rsp)
	movb	872(%rdx), %al
	movb	%al, 904(%rsp)
	movb	873(%rdx), %al
	movb	%al, 905(%rsp)
	movb	874(%rdx), %al
	movb	%al, 906(%rsp)
	movb	875(%rdx), %al
	movb	%al, 907(%rsp)
	movb	876(%rdx), %al
	movb	%al, 908(%rsp)
	movb	877(%rdx), %al
	movb	%al, 909(%rsp)
	movb	878(%rdx), %al
	movb	%al, 910(%rsp)
	movb	879(%rdx), %al
	movb	%al, 911(%rsp)
	movb	880(%rdx), %al
	movb	%al, 912(%rsp)
	movb	881(%rdx), %al
	movb	%al, 913(%rsp)
	movb	882(%rdx), %al
	movb	%al, 914(%rsp)
	movb	883(%rdx), %al
	movb	%al, 915(%rsp)
	movb	884(%rdx), %al
	movb	%al, 916(%rsp)
	movb	885(%rdx), %al
	movb	%al, 917(%rsp)
	movb	886(%rdx), %al
	movb	%al, 918(%rsp)
	movb	887(%rdx), %al
	movb	%al, 919(%rsp)
	movb	888(%rdx), %al
	movb	%al, 920(%rsp)
	movb	889(%rdx), %al
	movb	%al, 921(%rsp)
	movb	890(%rdx), %al
	movb	%al, 922(%rsp)
	movb	891(%rdx), %al
	movb	%al, 923(%rsp)
	movb	892(%rdx), %al
	movb	%al, 924(%rsp)
	movb	893(%rdx), %al
	movb	%al, 925(%rsp)
	movb	894(%rdx), %al
	movb	%al, 926(%rsp)
	movb	895(%rdx), %al
	movb	%al, 927(%rsp)
	movb	896(%rdx), %al
	movb	%al, 928(%rsp)
	movb	897(%rdx), %al
	movb	%al, 929(%rsp)
	movb	898(%rdx), %al
	movb	%al, 930(%rsp)
	movb	899(%rdx), %al
	movb	%al, 931(%rsp)
	movb	900(%rdx), %al
	movb	%al, 932(%rsp)
	movb	901(%rdx), %al
	movb	%al, 933(%rsp)
	movb	902(%rdx), %al
	movb	%al, 934(%rsp)
	movb	903(%rdx), %al
	movb	%al, 935(%rsp)
	movb	904(%rdx), %al
	movb	%al, 936(%rsp)
	movb	905(%rdx), %al
	movb	%al, 937(%rsp)
	movb	906(%rdx), %al
	movb	%al, 938(%rsp)
	movb	907(%rdx), %al
	movb	%al, 939(%rsp)
	movb	908(%rdx), %al
	movb	%al, 940(%rsp)
	movb	909(%rdx), %al
	movb	%al, 941(%rsp)
	movb	910(%rdx), %al
	movb	%al, 942(%rsp)
	movb	911(%rdx), %al
	movb	%al, 943(%rsp)
	movb	912(%rdx), %al
	movb	%al, 944(%rsp)
	movb	913(%rdx), %al
	movb	%al, 945(%rsp)
	movb	914(%rdx), %al
	movb	%al, 946(%rsp)
	movb	915(%rdx), %al
	movb	%al, 947(%rsp)
	movb	916(%rdx), %al
	movb	%al, 948(%rsp)
	movb	917(%rdx), %al
	movb	%al, 949(%rsp)
	movb	918(%rdx), %al
	movb	%al, 950(%rsp)
	movb	919(%rdx), %al
	movb	%al, 951(%rsp)
	movb	920(%rdx), %al
	movb	%al, 952(%rsp)
	movb	921(%rdx), %al
	movb	%al, 953(%rsp)
	movb	922(%rdx), %al
	movb	%al, 954(%rsp)
	movb	923(%rdx), %al
	movb	%al, 955(%rsp)
	movb	924(%rdx), %al
	movb	%al, 956(%rsp)
	movb	925(%rdx), %al
	movb	%al, 957(%rsp)
	movb	926(%rdx), %al
	movb	%al, 958(%rsp)
	movb	927(%rdx), %al
	movb	%al, 959(%rsp)
	movb	928(%rdx), %al
	movb	%al, 960(%rsp)
	movb	929(%rdx), %al
	movb	%al, 961(%rsp)
	movb	930(%rdx), %al
	movb	%al, 962(%rsp)
	movb	931(%rdx), %al
	movb	%al, 963(%rsp)
	movb	932(%rdx), %al
	movb	%al, 964(%rsp)
	movb	933(%rdx), %al
	movb	%al, 965(%rsp)
	movb	934(%rdx), %al
	movb	%al, 966(%rsp)
	movb	935(%rdx), %al
	movb	%al, 967(%rsp)
	movb	936(%rdx), %al
	movb	%al, 968(%rsp)
	movb	937(%rdx), %al
	movb	%al, 969(%rsp)
	movb	938(%rdx), %al
	movb	%al, 970(%rsp)
	movb	939(%rdx), %al
	movb	%al, 971(%rsp)
	movb	940(%rdx), %al
	movb	%al, 972(%rsp)
	movb	941(%rdx), %al
	movb	%al, 973(%rsp)
	movb	942(%rdx), %al
	movb	%al, 974(%rsp)
	movb	943(%rdx), %al
	movb	%al, 975(%rsp)
	movb	944(%rdx), %al
	movb	%al, 976(%rsp)
	movb	945(%rdx), %al
	movb	%al, 977(%rsp)
	movb	946(%rdx), %al
	movb	%al, 978(%rsp)
	movb	947(%rdx), %al
	movb	%al, 979(%rsp)
	movb	948(%rdx), %al
	movb	%al, 980(%rsp)
	movb	949(%rdx), %al
	movb	%al, 981(%rsp)
	movb	950(%rdx), %al
	movb	%al, 982(%rsp)
	movb	951(%rdx), %al
	movb	%al, 983(%rsp)
	movb	952(%rdx), %al
	movb	%al, 984(%rsp)
	movb	953(%rdx), %al
	movb	%al, 985(%rsp)
	movb	954(%rdx), %al
	movb	%al, 986(%rsp)
	movb	955(%rdx), %al
	movb	%al, 987(%rsp)
	movb	956(%rdx), %al
	movb	%al, 988(%rsp)
	movb	957(%rdx), %al
	movb	%al, 989(%rsp)
	movb	958(%rdx), %al
	movb	%al, 990(%rsp)
	movb	959(%rdx), %al
	movb	%al, 991(%rsp)
	movb	960(%rdx), %al
	movb	%al, 992(%rsp)
	movb	961(%rdx), %al
	movb	%al, 993(%rsp)
	movb	962(%rdx), %al
	movb	%al, 994(%rsp)
	movb	963(%rdx), %al
	movb	%al, 995(%rsp)
	movb	964(%rdx), %al
	movb	%al, 996(%rsp)
	movb	965(%rdx), %al
	movb	%al, 997(%rsp)
	movb	966(%rdx), %al
	movb	%al, 998(%rsp)
	movb	967(%rdx), %al
	movb	%al, 999(%rsp)
	movb	968(%rdx), %al
	movb	%al, 1000(%rsp)
	movb	969(%rdx), %al
	movb	%al, 1001(%rsp)
	movb	970(%rdx), %al
	movb	%al, 1002(%rsp)
	movb	971(%rdx), %al
	movb	%al, 1003(%rsp)
	movb	972(%rdx), %al
	movb	%al, 1004(%rsp)
	movb	973(%rdx), %al
	movb	%al, 1005(%rsp)
	movb	974(%rdx), %al
	movb	%al, 1006(%rsp)
	movb	975(%rdx), %al
	movb	%al, 1007(%rsp)
	movb	976(%rdx), %al
	movb	%al, 1008(%rsp)
	movb	977(%rdx), %al
	movb	%al, 1009(%rsp)
	movb	978(%rdx), %al
	movb	%al, 1010(%rsp)
	movb	979(%rdx), %al
	movb	%al, 1011(%rsp)
	movb	980(%rdx), %al
	movb	%al, 1012(%rsp)
	movb	981(%rdx), %al
	movb	%al, 1013(%rsp)
	movb	982(%rdx), %al
	movb	%al, 1014(%rsp)
	movb	983(%rdx), %al
	movb	%al, 1015(%rsp)
	movb	984(%rdx), %al
	movb	%al, 1016(%rsp)
	movb	985(%rdx), %al
	movb	%al, 1017(%rsp)
	movb	986(%rdx), %al
	movb	%al, 1018(%rsp)
	movb	987(%rdx), %al
	movb	%al, 1019(%rsp)
	movb	988(%rdx), %al
	movb	%al, 1020(%rsp)
	movb	989(%rdx), %al
	movb	%al, 1021(%rsp)
	movb	990(%rdx), %al
	movb	%al, 1022(%rsp)
	movb	991(%rdx), %al
	movb	%al, 1023(%rsp)
	movb	992(%rdx), %al
	movb	%al, 1024(%rsp)
	movb	993(%rdx), %al
	movb	%al, 1025(%rsp)
	movb	994(%rdx), %al
	movb	%al, 1026(%rsp)
	movb	995(%rdx), %al
	movb	%al, 1027(%rsp)
	movb	996(%rdx), %al
	movb	%al, 1028(%rsp)
	movb	997(%rdx), %al
	movb	%al, 1029(%rsp)
	movb	998(%rdx), %al
	movb	%al, 1030(%rsp)
	movb	999(%rdx), %al
	movb	%al, 1031(%rsp)
	movb	1000(%rdx), %al
	movb	%al, 1032(%rsp)
	movb	1001(%rdx), %al
	movb	%al, 1033(%rsp)
	movb	1002(%rdx), %al
	movb	%al, 1034(%rsp)
	movb	1003(%rdx), %al
	movb	%al, 1035(%rsp)
	movb	1004(%rdx), %al
	movb	%al, 1036(%rsp)
	movb	1005(%rdx), %al
	movb	%al, 1037(%rsp)
	movb	1006(%rdx), %al
	movb	%al, 1038(%rsp)
	movb	1007(%rdx), %al
	movb	%al, 1039(%rsp)
	movb	1008(%rdx), %al
	movb	%al, 1040(%rsp)
	movb	1009(%rdx), %al
	movb	%al, 1041(%rsp)
	movb	1010(%rdx), %al
	movb	%al, 1042(%rsp)
	movb	1011(%rdx), %al
	movb	%al, 1043(%rsp)
	movb	1012(%rdx), %al
	movb	%al, 1044(%rsp)
	movb	1013(%rdx), %al
	movb	%al, 1045(%rsp)
	movb	1014(%rdx), %al
	movb	%al, 1046(%rsp)
	movb	1015(%rdx), %al
	movb	%al, 1047(%rsp)
	movb	1016(%rdx), %al
	movb	%al, 1048(%rsp)
	movb	1017(%rdx), %al
	movb	%al, 1049(%rsp)
	movb	1018(%rdx), %al
	movb	%al, 1050(%rsp)
	movb	1019(%rdx), %al
	movb	%al, 1051(%rsp)
	movb	1020(%rdx), %al
	movb	%al, 1052(%rsp)
	movb	1021(%rdx), %al
	movb	%al, 1053(%rsp)
	movb	1022(%rdx), %al
	movb	%al, 1054(%rsp)
	movb	1023(%rdx), %al
	movb	%al, 1055(%rsp)
	movb	1024(%rdx), %al
	movb	%al, 1056(%rsp)
	movb	1025(%rdx), %al
	movb	%al, 1057(%rsp)
	movb	1026(%rdx), %al
	movb	%al, 1058(%rsp)
	movb	1027(%rdx), %al
	movb	%al, 1059(%rsp)
	movb	1028(%rdx), %al
	movb	%al, 1060(%rsp)
	movb	1029(%rdx), %al
	movb	%al, 1061(%rsp)
	movb	1030(%rdx), %al
	movb	%al, 1062(%rsp)
	movb	1031(%rdx), %al
	movb	%al, 1063(%rsp)
	movb	1032(%rdx), %al
	movb	%al, 1064(%rsp)
	movb	1033(%rdx), %al
	movb	%al, 1065(%rsp)
	movb	1034(%rdx), %al
	movb	%al, 1066(%rsp)
	movb	1035(%rdx), %al
	movb	%al, 1067(%rsp)
	movb	1036(%rdx), %al
	movb	%al, 1068(%rsp)
	movb	1037(%rdx), %al
	movb	%al, 1069(%rsp)
	movb	1038(%rdx), %al
	movb	%al, 1070(%rsp)
	movb	1039(%rdx), %al
	movb	%al, 1071(%rsp)
	movb	1040(%rdx), %al
	movb	%al, 1072(%rsp)
	movb	1041(%rdx), %al
	movb	%al, 1073(%rsp)
	movb	1042(%rdx), %al
	movb	%al, 1074(%rsp)
	movb	1043(%rdx), %al
	movb	%al, 1075(%rsp)
	movb	1044(%rdx), %al
	movb	%al, 1076(%rsp)
	movb	1045(%rdx), %al
	movb	%al, 1077(%rsp)
	movb	1046(%rdx), %al
	movb	%al, 1078(%rsp)
	movb	1047(%rdx), %al
	movb	%al, 1079(%rsp)
	movb	1048(%rdx), %al
	movb	%al, 1080(%rsp)
	movb	1049(%rdx), %al
	movb	%al, 1081(%rsp)
	movb	1050(%rdx), %al
	movb	%al, 1082(%rsp)
	movb	1051(%rdx), %al
	movb	%al, 1083(%rsp)
	movb	1052(%rdx), %al
	movb	%al, 1084(%rsp)
	movb	1053(%rdx), %al
	movb	%al, 1085(%rsp)
	movb	1054(%rdx), %al
	movb	%al, 1086(%rsp)
	movb	1055(%rdx), %al
	movb	%al, 1087(%rsp)
	movb	1056(%rdx), %al
	movb	%al, 1088(%rsp)
	movb	1057(%rdx), %al
	movb	%al, 1089(%rsp)
	movb	1058(%rdx), %al
	movb	%al, 1090(%rsp)
	movb	1059(%rdx), %al
	movb	%al, 1091(%rsp)
	movb	1060(%rdx), %al
	movb	%al, 1092(%rsp)
	movb	1061(%rdx), %al
	movb	%al, 1093(%rsp)
	movb	1062(%rdx), %al
	movb	%al, 1094(%rsp)
	movb	1063(%rdx), %al
	movb	%al, 1095(%rsp)
	movb	1064(%rdx), %al
	movb	%al, 1096(%rsp)
	movb	1065(%rdx), %al
	movb	%al, 1097(%rsp)
	movb	1066(%rdx), %al
	movb	%al, 1098(%rsp)
	movb	1067(%rdx), %al
	movb	%al, 1099(%rsp)
	movb	1068(%rdx), %al
	movb	%al, 1100(%rsp)
	movb	1069(%rdx), %al
	movb	%al, 1101(%rsp)
	movb	1070(%rdx), %al
	movb	%al, 1102(%rsp)
	movb	1071(%rdx), %al
	movb	%al, 1103(%rsp)
	movb	1072(%rdx), %al
	movb	%al, 1104(%rsp)
	movb	1073(%rdx), %al
	movb	%al, 1105(%rsp)
	movb	1074(%rdx), %al
	movb	%al, 1106(%rsp)
	movb	1075(%rdx), %al
	movb	%al, 1107(%rsp)
	movb	1076(%rdx), %al
	movb	%al, 1108(%rsp)
	movb	1077(%rdx), %al
	movb	%al, 1109(%rsp)
	movb	1078(%rdx), %al
	movb	%al, 1110(%rsp)
	movb	1079(%rdx), %al
	movb	%al, 1111(%rsp)
	movb	1080(%rdx), %al
	movb	%al, 1112(%rsp)
	movb	1081(%rdx), %al
	movb	%al, 1113(%rsp)
	movb	1082(%rdx), %al
	movb	%al, 1114(%rsp)
	movb	1083(%rdx), %al
	movb	%al, 1115(%rsp)
	movb	1084(%rdx), %al
	movb	%al, 1116(%rsp)
	movb	1085(%rdx), %al
	movb	%al, 1117(%rsp)
	movb	1086(%rdx), %al
	movb	%al, 1118(%rsp)
	movb	1087(%rdx), %al
	movb	%al, 1119(%rsp)
	movb	1088(%rdx), %al
	movb	%al, 1120(%rsp)
	movb	1089(%rdx), %al
	movb	%al, 1121(%rsp)
	movb	1090(%rdx), %al
	movb	%al, 1122(%rsp)
	movb	1091(%rdx), %al
	movb	%al, 1123(%rsp)
	movb	1092(%rdx), %al
	movb	%al, 1124(%rsp)
	movb	1093(%rdx), %al
	movb	%al, 1125(%rsp)
	movb	1094(%rdx), %al
	movb	%al, 1126(%rsp)
	movb	1095(%rdx), %al
	movb	%al, 1127(%rsp)
	movb	1096(%rdx), %al
	movb	%al, 1128(%rsp)
	movb	1097(%rdx), %al
	movb	%al, 1129(%rsp)
	movb	1098(%rdx), %al
	movb	%al, 1130(%rsp)
	movb	1099(%rdx), %al
	movb	%al, 1131(%rsp)
	movb	1100(%rdx), %al
	movb	%al, 1132(%rsp)
	movb	1101(%rdx), %al
	movb	%al, 1133(%rsp)
	movb	1102(%rdx), %al
	movb	%al, 1134(%rsp)
	movb	1103(%rdx), %al
	movb	%al, 1135(%rsp)
	movb	1104(%rdx), %al
	movb	%al, 1136(%rsp)
	movb	1105(%rdx), %al
	movb	%al, 1137(%rsp)
	movb	1106(%rdx), %al
	movb	%al, 1138(%rsp)
	movb	1107(%rdx), %al
	movb	%al, 1139(%rsp)
	movb	1108(%rdx), %al
	movb	%al, 1140(%rsp)
	movb	1109(%rdx), %al
	movb	%al, 1141(%rsp)
	movb	1110(%rdx), %al
	movb	%al, 1142(%rsp)
	movb	1111(%rdx), %al
	movb	%al, 1143(%rsp)
	movb	1112(%rdx), %al
	movb	%al, 1144(%rsp)
	movb	1113(%rdx), %al
	movb	%al, 1145(%rsp)
	movb	1114(%rdx), %al
	movb	%al, 1146(%rsp)
	movb	1115(%rdx), %al
	movb	%al, 1147(%rsp)
	movb	1116(%rdx), %al
	movb	%al, 1148(%rsp)
	movb	1117(%rdx), %al
	movb	%al, 1149(%rsp)
	movb	1118(%rdx), %al
	movb	%al, 1150(%rsp)
	movb	1119(%rdx), %al
	movb	%al, 1151(%rsp)
	movb	1120(%rdx), %al
	movb	%al, 1152(%rsp)
	movb	1121(%rdx), %al
	movb	%al, 1153(%rsp)
	movb	1122(%rdx), %al
	movb	%al, 1154(%rsp)
	movb	1123(%rdx), %al
	movb	%al, 1155(%rsp)
	movb	1124(%rdx), %al
	movb	%al, 1156(%rsp)
	movb	1125(%rdx), %al
	movb	%al, 1157(%rsp)
	movb	1126(%rdx), %al
	movb	%al, 1158(%rsp)
	movb	1127(%rdx), %al
	movb	%al, 1159(%rsp)
	movb	1128(%rdx), %al
	movb	%al, 1160(%rsp)
	movb	1129(%rdx), %al
	movb	%al, 1161(%rsp)
	movb	1130(%rdx), %al
	movb	%al, 1162(%rsp)
	movb	1131(%rdx), %al
	movb	%al, 1163(%rsp)
	movb	1132(%rdx), %al
	movb	%al, 1164(%rsp)
	movb	1133(%rdx), %al
	movb	%al, 1165(%rsp)
	movb	1134(%rdx), %al
	movb	%al, 1166(%rsp)
	movb	1135(%rdx), %al
	movb	%al, 1167(%rsp)
	movb	1136(%rdx), %al
	movb	%al, 1168(%rsp)
	movb	1137(%rdx), %al
	movb	%al, 1169(%rsp)
	movb	1138(%rdx), %al
	movb	%al, 1170(%rsp)
	movb	1139(%rdx), %al
	movb	%al, 1171(%rsp)
	movb	1140(%rdx), %al
	movb	%al, 1172(%rsp)
	movb	1141(%rdx), %al
	movb	%al, 1173(%rsp)
	movb	1142(%rdx), %al
	movb	%al, 1174(%rsp)
	movb	1143(%rdx), %al
	movb	%al, 1175(%rsp)
	movb	1144(%rdx), %al
	movb	%al, 1176(%rsp)
	movb	1145(%rdx), %al
	movb	%al, 1177(%rsp)
	movb	1146(%rdx), %al
	movb	%al, 1178(%rsp)
	movb	1147(%rdx), %al
	movb	%al, 1179(%rsp)
	movb	1148(%rdx), %al
	movb	%al, 1180(%rsp)
	movb	1149(%rdx), %al
	movb	%al, 1181(%rsp)
	movb	1150(%rdx), %al
	movb	%al, 1182(%rsp)
	movb	1151(%rdx), %al
	movb	%al, 1183(%rsp)
	movb	1152(%rdx), %al
	movb	%al, 1184(%rsp)
	movb	1153(%rdx), %al
	movb	%al, 1185(%rsp)
	movb	1154(%rdx), %al
	movb	%al, 1186(%rsp)
	movb	1155(%rdx), %al
	movb	%al, 1187(%rsp)
	movb	1156(%rdx), %al
	movb	%al, 1188(%rsp)
	movb	1157(%rdx), %al
	movb	%al, 1189(%rsp)
	movb	1158(%rdx), %al
	movb	%al, 1190(%rsp)
	movb	1159(%rdx), %al
	movb	%al, 1191(%rsp)
	movb	1160(%rdx), %al
	movb	%al, 1192(%rsp)
	movb	1161(%rdx), %al
	movb	%al, 1193(%rsp)
	movb	1162(%rdx), %al
	movb	%al, 1194(%rsp)
	movb	1163(%rdx), %al
	movb	%al, 1195(%rsp)
	movb	1164(%rdx), %al
	movb	%al, 1196(%rsp)
	movb	1165(%rdx), %al
	movb	%al, 1197(%rsp)
	movb	1166(%rdx), %al
	movb	%al, 1198(%rsp)
	movb	1167(%rdx), %al
	movb	%al, 1199(%rsp)
	movb	1168(%rdx), %al
	movb	%al, 1200(%rsp)
	movb	1169(%rdx), %al
	movb	%al, 1201(%rsp)
	movb	1170(%rdx), %al
	movb	%al, 1202(%rsp)
	movb	1171(%rdx), %al
	movb	%al, 1203(%rsp)
	movb	1172(%rdx), %al
	movb	%al, 1204(%rsp)
	movb	1173(%rdx), %al
	movb	%al, 1205(%rsp)
	movb	1174(%rdx), %al
	movb	%al, 1206(%rsp)
	movb	1175(%rdx), %al
	movb	%al, 1207(%rsp)
	movb	1176(%rdx), %al
	movb	%al, 1208(%rsp)
	movb	1177(%rdx), %al
	movb	%al, 1209(%rsp)
	movb	1178(%rdx), %al
	movb	%al, 1210(%rsp)
	movb	1179(%rdx), %al
	movb	%al, 1211(%rsp)
	movb	1180(%rdx), %al
	movb	%al, 1212(%rsp)
	movb	1181(%rdx), %al
	movb	%al, 1213(%rsp)
	movb	1182(%rdx), %al
	movb	%al, 1214(%rsp)
	movb	1183(%rdx), %al
	movb	%al, 1215(%rsp)
	movb	1184(%rdx), %al
	movb	%al, 1216(%rsp)
	movb	1185(%rdx), %al
	movb	%al, 1217(%rsp)
	movb	1186(%rdx), %al
	movb	%al, 1218(%rsp)
	movb	1187(%rdx), %al
	movb	%al, 1219(%rsp)
	movb	1188(%rdx), %al
	movb	%al, 1220(%rsp)
	movb	1189(%rdx), %al
	movb	%al, 1221(%rsp)
	movb	1190(%rdx), %al
	movb	%al, 1222(%rsp)
	movb	1191(%rdx), %al
	movb	%al, 1223(%rsp)
	movb	1192(%rdx), %al
	movb	%al, 1224(%rsp)
	movb	1193(%rdx), %al
	movb	%al, 1225(%rsp)
	movb	1194(%rdx), %al
	movb	%al, 1226(%rsp)
	movb	1195(%rdx), %al
	movb	%al, 1227(%rsp)
	movb	1196(%rdx), %al
	movb	%al, 1228(%rsp)
	movb	1197(%rdx), %al
	movb	%al, 1229(%rsp)
	movb	1198(%rdx), %al
	movb	%al, 1230(%rsp)
	movb	1199(%rdx), %al
	movb	%al, 1231(%rsp)
	movb	1200(%rdx), %al
	movb	%al, 1232(%rsp)
	movb	1201(%rdx), %al
	movb	%al, 1233(%rsp)
	movb	1202(%rdx), %al
	movb	%al, 1234(%rsp)
	movb	1203(%rdx), %al
	movb	%al, 1235(%rsp)
	movb	1204(%rdx), %al
	movb	%al, 1236(%rsp)
	movb	1205(%rdx), %al
	movb	%al, 1237(%rsp)
	movb	1206(%rdx), %al
	movb	%al, 1238(%rsp)
	movb	1207(%rdx), %al
	movb	%al, 1239(%rsp)
	movb	1208(%rdx), %al
	movb	%al, 1240(%rsp)
	movb	1209(%rdx), %al
	movb	%al, 1241(%rsp)
	movb	1210(%rdx), %al
	movb	%al, 1242(%rsp)
	movb	1211(%rdx), %al
	movb	%al, 1243(%rsp)
	movb	1212(%rdx), %al
	movb	%al, 1244(%rsp)
	movb	1213(%rdx), %al
	movb	%al, 1245(%rsp)
	movb	1214(%rdx), %al
	movb	%al, 1246(%rsp)
	movb	1215(%rdx), %al
	movb	%al, 1247(%rsp)
	movb	1216(%rdx), %al
	movb	%al, 1248(%rsp)
	movb	1217(%rdx), %al
	movb	%al, 1249(%rsp)
	movb	1218(%rdx), %al
	movb	%al, 1250(%rsp)
	movb	1219(%rdx), %al
	movb	%al, 1251(%rsp)
	movb	1220(%rdx), %al
	movb	%al, 1252(%rsp)
	movb	1221(%rdx), %al
	movb	%al, 1253(%rsp)
	movb	1222(%rdx), %al
	movb	%al, 1254(%rsp)
	movb	1223(%rdx), %al
	movb	%al, 1255(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkfromsig$3
.Lwots_pkfromsig$4:
	movq	%r8, 1264(%rsp)
	movl	%ecx, 1312(%rsp)
	movq	%rdx, 1272(%rsp)
	movl	%ecx, %eax
	movl	%eax, 24(%r11)
	movl	%ecx, %eax
	movl	1316(%rsp,%rax,4), %esi
	lfence
	movq	$0, %rax
	movl	$15, %eax
	subl	%esi, %eax
	leaq	32(%rsp,%rdx), %rcx
	movl	%eax, %edx
	leaq	-8(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkfromsig$5:
	leaq	8(%rsp), %rsp
	movq	1264(%rsp), %r8
	movl	1312(%rsp), %ecx
	movq	1272(%rsp), %rdx
	lfence
	movq	$0, %rax
	incl	%ecx
	addq	$24, %rdx
.Lwots_pkfromsig$3:
	cmpl	$51, %ecx
	jb  	.Lwots_pkfromsig$4
	leaq	1280(%rsp), %rax
	movq	(%r11), %rcx
	movq	%rcx, (%rax)
	movq	8(%r11), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%r11), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%r11), %rcx
	movq	%rcx, 24(%rax)
	leaq	1280(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$1, 16(%rax)
	movl	20(%r11), %edx
	leaq	1280(%rsp), %rax
	movl	%edx, 20(%rax)
	movq	1256(%rsp), %rcx
	lfence
	movq	$0, %rax
	movq	%r11, 1256(%rsp)
	leaq	1280(%rsp), %rdi
	leaq	32(%rsp), %rax
	movq	%rcx, %r9
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
	leaq	84(%rsp), %rsi
	movq	%rsi, %rdx
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_sign$108
.Lwots_sign$109:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, (%rdx)
	jmp 	.Lwots_sign$106
.Lwots_sign$107:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 4(%rdx)
	jmp 	.Lwots_sign$104
.Lwots_sign$105:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 8(%rdx)
	jmp 	.Lwots_sign$102
.Lwots_sign$103:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 12(%rdx)
	jmp 	.Lwots_sign$100
.Lwots_sign$101:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 16(%rdx)
	jmp 	.Lwots_sign$98
.Lwots_sign$99:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 20(%rdx)
	jmp 	.Lwots_sign$96
.Lwots_sign$97:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 24(%rdx)
	jmp 	.Lwots_sign$94
.Lwots_sign$95:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 28(%rdx)
	jmp 	.Lwots_sign$92
.Lwots_sign$93:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 32(%rdx)
	jmp 	.Lwots_sign$90
.Lwots_sign$91:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 36(%rdx)
	jmp 	.Lwots_sign$88
.Lwots_sign$89:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 40(%rdx)
	jmp 	.Lwots_sign$86
.Lwots_sign$87:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 44(%rdx)
	jmp 	.Lwots_sign$84
.Lwots_sign$85:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 48(%rdx)
	jmp 	.Lwots_sign$82
.Lwots_sign$83:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 52(%rdx)
	jmp 	.Lwots_sign$80
.Lwots_sign$81:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 56(%rdx)
	jmp 	.Lwots_sign$78
.Lwots_sign$79:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 60(%rdx)
	jmp 	.Lwots_sign$76
.Lwots_sign$77:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 64(%rdx)
	jmp 	.Lwots_sign$74
.Lwots_sign$75:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 68(%rdx)
	jmp 	.Lwots_sign$72
.Lwots_sign$73:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 72(%rdx)
	jmp 	.Lwots_sign$70
.Lwots_sign$71:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 76(%rdx)
	jmp 	.Lwots_sign$68
.Lwots_sign$69:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 80(%rdx)
	jmp 	.Lwots_sign$66
.Lwots_sign$67:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 84(%rdx)
	jmp 	.Lwots_sign$64
.Lwots_sign$65:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 88(%rdx)
	jmp 	.Lwots_sign$62
.Lwots_sign$63:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 92(%rdx)
	jmp 	.Lwots_sign$60
.Lwots_sign$61:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 96(%rdx)
	jmp 	.Lwots_sign$58
.Lwots_sign$59:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 100(%rdx)
	jmp 	.Lwots_sign$56
.Lwots_sign$57:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 104(%rdx)
	jmp 	.Lwots_sign$54
.Lwots_sign$55:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 108(%rdx)
	jmp 	.Lwots_sign$52
.Lwots_sign$53:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 112(%rdx)
	jmp 	.Lwots_sign$50
.Lwots_sign$51:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 116(%rdx)
	jmp 	.Lwots_sign$48
.Lwots_sign$49:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 120(%rdx)
	jmp 	.Lwots_sign$46
.Lwots_sign$47:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 124(%rdx)
	jmp 	.Lwots_sign$44
.Lwots_sign$45:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 128(%rdx)
	jmp 	.Lwots_sign$42
.Lwots_sign$43:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 132(%rdx)
	jmp 	.Lwots_sign$40
.Lwots_sign$41:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 136(%rdx)
	jmp 	.Lwots_sign$38
.Lwots_sign$39:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 140(%rdx)
	jmp 	.Lwots_sign$36
.Lwots_sign$37:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 144(%rdx)
	jmp 	.Lwots_sign$34
.Lwots_sign$35:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 148(%rdx)
	jmp 	.Lwots_sign$32
.Lwots_sign$33:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 152(%rdx)
	jmp 	.Lwots_sign$30
.Lwots_sign$31:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 156(%rdx)
	jmp 	.Lwots_sign$28
.Lwots_sign$29:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 160(%rdx)
	jmp 	.Lwots_sign$26
.Lwots_sign$27:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 164(%rdx)
	jmp 	.Lwots_sign$24
.Lwots_sign$25:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 168(%rdx)
	jmp 	.Lwots_sign$22
.Lwots_sign$23:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 172(%rdx)
	jmp 	.Lwots_sign$20
.Lwots_sign$21:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 176(%rdx)
	jmp 	.Lwots_sign$18
.Lwots_sign$19:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 180(%rdx)
	jmp 	.Lwots_sign$16
.Lwots_sign$17:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
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
	movl	%ebp, 184(%rdx)
	jmp 	.Lwots_sign$14
.Lwots_sign$15:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %ebp
	orl 	%ebp, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$14:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$15
	movl	%r10d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 188(%rdx)
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
	movb	%al, 289(%rsp)
	shrl	$8, %ecx
	andl	$255, %ecx
	movb	%cl, 288(%rsp)
	leaq	192(%rsi), %rdx
	leaq	288(%rsp), %rax
	movq	$0, %r9
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %esi
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
	movl	%esi, (%rdx)
	jmp 	.Lwots_sign$10
.Lwots_sign$11:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %esi
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
	movl	%esi, 4(%rdx)
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %r10d
	movzbl	(%rax,%r9), %esi
	orl 	%esi, %r10d
	incq	%r9
	addl	$8, %ecx
.Lwots_sign$8:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$9
	movl	%r10d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 8(%rdx)
	leaq	48(%rsp), %rax
	movq	(%rdi), %rcx
	movq	%rcx, (%rax)
	movq	8(%rdi), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%rdi), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%rdi), %rcx
	movq	%rcx, 24(%rax)
	leaq	48(%rsp), %rax
	movq	$0, 16(%rax)
	movq	$0, 24(%rax)
	movl	$5, 16(%rax)
	movl	20(%rdi), %edx
	leaq	48(%rsp), %rax
	movl	%edx, 20(%rax)
	movq	%rdi, 8(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_sign$5
.Lwots_sign$6:
	movq	%r11, 16(%rsp)
	movq	%r8, 24(%rsp)
	movl	%ecx, 80(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%ecx, %eax
	leaq	48(%rsp), %rdi
	movl	%eax, 24(%rdi)
	leaq	(%rbx,%rdx), %rcx
	movq	%rbx, 40(%rsp)
	leaq	48(%rsp), %rax
	movq	%rax, %rdi
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lwots_sign$7:
	leaq	40(%rsp), %rsp
	movq	40(%rsp), %rbx
	lfence
	movq	$0, %rax
	movq	16(%rsp), %r11
	movq	24(%rsp), %r8
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rdx
	lfence
	movq	$0, %rax
	incl	%ecx
	addq	$24, %rdx
.Lwots_sign$5:
	cmpl	$51, %ecx
	jb  	.Lwots_sign$6
	movq	8(%rsp), %rdi
	lfence
	movq	$0, %rax
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_sign$2
.Lwots_sign$3:
	movq	%r8, 8(%rsp)
	movl	%ecx, 80(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%ecx, %eax
	movl	%eax, 24(%rdi)
	movl	$0, %esi
	movl	%ecx, %eax
	movl	84(%rsp,%rax,4), %eax
	lfence
	movq	$0, %rcx
	leaq	(%rbx,%rdx), %rcx
	movq	%rbx, 24(%rsp)
	movl	%eax, %edx
	movq	%rdi, %r11
	leaq	-8(%rsp), %rsp
	call	.Lchain$1
.Lwots_sign$4:
	leaq	8(%rsp), %rsp
	movq	%r11, %rdi
	movq	24(%rsp), %rbx
	lfence
	movq	$0, %rax
	movq	8(%rsp), %r8
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rdx
	lfence
	movq	$0, %rax
	incl	%ecx
	addq	$24, %rdx
.Lwots_sign$2:
	cmpl	$51, %ecx
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
	movl	20(%rdi), %edx
	leaq	1296(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movl	%edx, 1328(%rsp)
	movq	%rdi, 1264(%rsp)
	movq	$0, %rdx
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$6
.Lwots_pkgen$7:
	movq	%r11, 1272(%rsp)
	movq	%r8, 1280(%rsp)
	movl	%ecx, 1332(%rsp)
	movq	%rdx, 1288(%rsp)
	leaq	1296(%rsp), %rdi
	movl	%ecx, 24(%rdi)
	leaq	32(%rsp,%rdx), %rcx
	leaq	1296(%rsp), %rdi
	leaq	-40(%rsp), %rsp
	call	.LPRF$1
.Lwots_pkgen$8:
	leaq	40(%rsp), %rsp
	movq	1272(%rsp), %r11
	movq	1280(%rsp), %r8
	movl	1332(%rsp), %ecx
	movq	1288(%rsp), %rdx
	lfence
	movq	$0, %rsi
	incl	%ecx
	addq	$24, %rdx
.Lwots_pkgen$6:
	cmpl	$51, %ecx
	jb  	.Lwots_pkgen$7
	movq	1264(%rsp), %rdi
	lfence
	movq	$0, %rcx
	movq	$0, %r9
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$3
.Lwots_pkgen$4:
	movq	%r8, 1264(%rsp)
	movl	%ecx, 1332(%rsp)
	movq	%r9, 1288(%rsp)
	movl	%ecx, 24(%rdi)
	movl	$0, %esi
	movl	$15, %edx
	leaq	32(%rsp,%r9), %rcx
	movq	%rdi, %r11
	leaq	-8(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkgen$5:
	leaq	8(%rsp), %rsp
	movq	%r11, %rdi
	movq	1264(%rsp), %r8
	movl	1332(%rsp), %ecx
	movq	1288(%rsp), %r9
	lfence
	movq	$0, %rdx
	incl	%ecx
	addq	$24, %r9
.Lwots_pkgen$3:
	cmpl	$51, %ecx
	jb  	.Lwots_pkgen$4
	leaq	1296(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$1, 16(%rcx)
	movl	1328(%rsp), %edx
	lfence
	movq	$0, %rcx
	leaq	1296(%rsp), %rcx
	movl	%edx, 20(%rcx)
	movq	1256(%rsp), %rcx
	lfence
	movq	$0, %rdx
	movq	%rdi, 1256(%rsp)
	leaq	1296(%rsp), %rdi
	leaq	32(%rsp), %rdx
	movq	%rcx, %r9
	movq	%rdx, %rcx
	leaq	-40(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	40(%rsp), %rsp
	movq	1256(%rsp), %rdi
	lfence
	movq	$0, %rdx
	ret
.Lchain$1:
	movl	%esi, %edi
	addl	%edx, %edi
	jmp 	.Lchain$2
.Lchain$3:
	movl	%esi, 28(%r11)
	movq	%r8, %mm0
	movq	%r11, %mm1
	movd	%esi, %mm2
	movd	%edi, %mm3
	leaq	-40(%rsp), %rsp
	call	.LF$1
.Lchain$4:
	leaq	40(%rsp), %rsp
	movq	%mm0, %r8
	movq	%mm1, %r11
	movd	%mm2, %esi
	movd	%mm3, %edi
	incl	%esi
.Lchain$2:
	cmpl	%edi, %esi
	jb  	.Lchain$3
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
	vpbroadcastq	(%r8,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r8,%rcx), %xmm2
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
	movq	$0, %rsi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%rsi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm2
	movq	24(%rcx,%rsi), %rcx
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
	movq	$0, %rsi
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
	incq	%rsi
.LT_k$6:
	cmpq	$2, %rsi
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
	movq	%mm0, %rcx
	movq	$0, %rax
	movq	$0, %rsi
	jmp 	.LT_k$3
.LT_k$4:
	call	.L_keccakf1600_avx2$1
.LT_k$5:
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
	vmovdqu	%xmm4, 8(%rcx,%rax)
	ret
.LT_len$1:
	movq	%r9, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rsi
	vpbroadcastq	(%r8,%rsi), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r8,%rsi), %xmm2
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
	movq	$0, %rsi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rdx,%rsi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rdx,%rsi), %rdi
	vmovq	%rdi, %xmm2
	movq	24(%rdx,%rsi), %rdx
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
	movq	$0, %rsi
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rcx,%rsi), %xmm0
	vpslldq	$8, %xmm0, %xmm0
	vmovdqu	%xmm0, %xmm0
	vmovdqu	8(%rcx,%rsi), %xmm9
	vinserti128	$1, %xmm9, %ymm0, %ymm14
	movq	24(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	32(%rcx,%rsi), %ymm13
	movq	64(%rcx,%rsi), %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm9
	movq	72(%rcx,%rsi), %rdx
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
	addq	$80, %rsi
	call	.L_keccakf1600_avx2$1
.LT_len$9:
	movq	$0, %r10
	jmp 	.LT_len$6
.LT_len$7:
	vpbroadcastq	(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	48(%rcx,%rsi), %ymm14
	movq	80(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	88(%rcx,%rsi), %ymm13
	movq	120(%rcx,%rsi), %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm9
	movq	128(%rcx,%rsi), %rdx
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
	addq	$136, %rsi
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%r10
.LT_len$6:
	cmpq	$8, %r10
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%rsi), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm8
	movq	48(%rcx,%rsi), %rcx
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
	movq	%mm0, %rcx
	movq	$0, %rsi
	movq	$0, %r10
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rsi)
	vmovdqu	%ymm4, 8(%rcx,%rsi)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
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
	incq	%r10
.LT_len$3:
	cmpq	$0, %r10
	jb  	.LT_len$4
	call	.L_keccakf1600_avx2$1
.LT_len$2:
	movq	%xmm5, (%rcx,%rsi)
	vmovdqu	%xmm4, 8(%rcx,%rsi)
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
	vpbroadcastq	(%r8,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r8,%rcx), %xmm2
	vmovdqu	%xmm2, %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
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
	movq	$0, %rdi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%rdi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%rdi), %r8
	vmovq	%r8, %xmm2
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
	movq	$0, %rdi
	vmovq	%rdi, %xmm2
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
	movq	(%rsi,%rcx), %rdx
	vmovq	%rdx, %xmm6
	vmovdqu	8(%rsi,%rcx), %xmm9
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
	movq	%mm0, %rcx
	movq	$0, %rsi
	movq	$0, %r10
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rsi)
	vmovdqu	%ymm4, 8(%rcx,%rsi)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
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
	incq	%r10
.LH$3:
	cmpq	$0, %r10
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm5, (%rcx,%rsi)
	vmovdqu	%xmm4, 8(%rcx,%rsi)
	ret
.LF$1:
	movq	%rcx, %mm4
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rsi
	vpbroadcastq	(%r8,%rsi), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r8,%rsi), %xmm2
	vmovdqu	%xmm2, %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	leaq	16(%rsp), %rdx
	movl	(%r11), %esi
	bswapl	%esi
	movl	%esi, (%rdx)
	movl	4(%r11), %esi
	bswapl	%esi
	movl	%esi, 4(%rdx)
	movl	8(%r11), %esi
	bswapl	%esi
	movl	%esi, 8(%rdx)
	movl	12(%r11), %esi
	bswapl	%esi
	movl	%esi, 12(%rdx)
	movl	16(%r11), %esi
	bswapl	%esi
	movl	%esi, 16(%rdx)
	movl	20(%r11), %esi
	bswapl	%esi
	movl	%esi, 20(%rdx)
	movl	24(%r11), %esi
	bswapl	%esi
	movl	%esi, 24(%rdx)
	movl	28(%r11), %esi
	bswapl	%esi
	movl	%esi, 28(%rdx)
	leaq	16(%rsp), %rdx
	movq	$0, %rsi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rdx,%rsi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rdx,%rsi), %rdi
	vmovq	%rdi, %xmm2
	movq	24(%rdx,%rsi), %rdx
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
	movq	$0, %rsi
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rcx,%rsi), %xmm6
	vpslldq	$8, %xmm6, %xmm6
	vmovdqu	%xmm6, %xmm6
	vmovdqu	8(%rcx,%rsi), %xmm9
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
	movq	%mm4, %rcx
	movq	$0, %rsi
	movq	$0, %r10
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rsi)
	vmovdqu	%ymm4, 8(%rcx,%rsi)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
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
	incq	%r10
.LF$3:
	cmpq	$0, %r10
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm5, (%rcx,%rsi)
	vmovdqu	%xmm4, 8(%rcx,%rsi)
	ret
.LPRF$1:
	movq	%rcx, %mm0
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%r8,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%r8,%rcx), %xmm2
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
	movq	$0, %rsi
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%rsi), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%rsi), %rdx
	vmovq	%rdx, %xmm2
	movq	24(%rcx,%rsi), %rcx
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
	movq	%mm0, %rcx
	movq	$0, %rsi
	movq	$0, %r10
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%rsi)
	vmovdqu	%ymm4, 8(%rcx,%rsi)
	vextracti128	$1, %ymm6, %xmm8
	vmovdqu	%xmm6, %xmm7
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
	incq	%r10
.LPRF$3:
	cmpq	$0, %r10
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm5, (%rcx,%rsi)
	vmovdqu	%xmm4, 8(%rcx,%rsi)
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
	movb	(%rsi), %al
	movb	%al, 32(%rsp)
	movb	1(%rsi), %al
	movb	%al, 33(%rsp)
	movb	2(%rsi), %al
	movb	%al, 34(%rsp)
	movb	3(%rsi), %al
	movb	%al, 35(%rsp)
	movb	4(%rsi), %al
	movb	%al, 36(%rsp)
	movb	5(%rsi), %al
	movb	%al, 37(%rsp)
	movb	6(%rsi), %al
	movb	%al, 38(%rsp)
	movb	7(%rsi), %al
	movb	%al, 39(%rsp)
	movb	8(%rsi), %al
	movb	%al, 40(%rsp)
	movb	9(%rsi), %al
	movb	%al, 41(%rsp)
	movb	10(%rsi), %al
	movb	%al, 42(%rsp)
	movb	11(%rsi), %al
	movb	%al, 43(%rsp)
	movb	12(%rsi), %al
	movb	%al, 44(%rsp)
	movb	13(%rsi), %al
	movb	%al, 45(%rsp)
	movb	14(%rsi), %al
	movb	%al, 46(%rsp)
	movb	15(%rsi), %al
	movb	%al, 47(%rsp)
	movb	16(%rsi), %al
	movb	%al, 48(%rsp)
	movb	17(%rsi), %al
	movb	%al, 49(%rsp)
	movb	18(%rsi), %al
	movb	%al, 50(%rsp)
	movb	19(%rsi), %al
	movb	%al, 51(%rsp)
	movb	20(%rsi), %al
	movb	%al, 52(%rsp)
	movb	21(%rsi), %al
	movb	%al, 53(%rsp)
	movb	22(%rsi), %al
	movb	%al, 54(%rsp)
	movb	23(%rsi), %al
	movb	%al, 55(%rsp)
	movb	(%rdi), %al
	movb	%al, 56(%rsp)
	movb	1(%rdi), %al
	movb	%al, 57(%rsp)
	movb	2(%rdi), %al
	movb	%al, 58(%rsp)
	movb	3(%rdi), %al
	movb	%al, 59(%rsp)
	movb	4(%rdi), %al
	movb	%al, 60(%rsp)
	movb	5(%rdi), %al
	movb	%al, 61(%rsp)
	movb	6(%rdi), %al
	movb	%al, 62(%rsp)
	movb	7(%rdi), %al
	movb	%al, 63(%rsp)
	movb	8(%rdi), %al
	movb	%al, 64(%rsp)
	movb	9(%rdi), %al
	movb	%al, 65(%rsp)
	movb	10(%rdi), %al
	movb	%al, 66(%rsp)
	movb	11(%rdi), %al
	movb	%al, 67(%rsp)
	movb	12(%rdi), %al
	movb	%al, 68(%rsp)
	movb	13(%rdi), %al
	movb	%al, 69(%rsp)
	movb	14(%rdi), %al
	movb	%al, 70(%rsp)
	movb	15(%rdi), %al
	movb	%al, 71(%rsp)
	movb	16(%rdi), %al
	movb	%al, 72(%rsp)
	movb	17(%rdi), %al
	movb	%al, 73(%rsp)
	movb	18(%rdi), %al
	movb	%al, 74(%rsp)
	movb	19(%rdi), %al
	movb	%al, 75(%rsp)
	movb	20(%rdi), %al
	movb	%al, 76(%rsp)
	movb	21(%rdi), %al
	movb	%al, 77(%rsp)
	movb	22(%rdi), %al
	movb	%al, 78(%rsp)
	movb	23(%rdi), %al
	movb	%al, 79(%rsp)
	movb	$0, 80(%rsp)
	movb	%cl, 81(%rsp)
	movq	$50, %rsi
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
	movb	32(%rsp), %al
	movb	%al, (%rcx)
	movb	33(%rsp), %al
	movb	%al, 1(%rcx)
	movb	34(%rsp), %al
	movb	%al, 2(%rcx)
	movb	35(%rsp), %al
	movb	%al, 3(%rcx)
	movb	36(%rsp), %al
	movb	%al, 4(%rcx)
	movb	37(%rsp), %al
	movb	%al, 5(%rcx)
	movb	38(%rsp), %al
	movb	%al, 6(%rcx)
	movb	39(%rsp), %al
	movb	%al, 7(%rcx)
	movb	40(%rsp), %al
	movb	%al, 8(%rcx)
	movb	41(%rsp), %al
	movb	%al, 9(%rcx)
	movb	42(%rsp), %al
	movb	%al, 10(%rcx)
	movb	43(%rsp), %al
	movb	%al, 11(%rcx)
	movb	44(%rsp), %al
	movb	%al, 12(%rcx)
	movb	45(%rsp), %al
	movb	%al, 13(%rcx)
	movb	46(%rsp), %al
	movb	%al, 14(%rcx)
	movb	47(%rsp), %al
	movb	%al, 15(%rcx)
	movb	48(%rsp), %al
	movb	%al, 16(%rcx)
	movb	49(%rsp), %al
	movb	%al, 17(%rcx)
	movb	50(%rsp), %al
	movb	%al, 18(%rcx)
	movb	51(%rsp), %al
	movb	%al, 19(%rcx)
	movb	52(%rsp), %al
	movb	%al, 20(%rcx)
	movb	53(%rsp), %al
	movb	%al, 21(%rcx)
	movb	54(%rsp), %al
	movb	%al, 22(%rcx)
	movb	55(%rsp), %al
	movb	%al, 23(%rcx)
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
	movb	(%r8), %al
	movb	%al, 32(%rsp)
	movb	1(%r8), %al
	movb	%al, 33(%rsp)
	movb	2(%r8), %al
	movb	%al, 34(%rsp)
	movb	3(%r8), %al
	movb	%al, 35(%rsp)
	movb	4(%r8), %al
	movb	%al, 36(%rsp)
	movb	5(%r8), %al
	movb	%al, 37(%rsp)
	movb	6(%r8), %al
	movb	%al, 38(%rsp)
	movb	7(%r8), %al
	movb	%al, 39(%rsp)
	movb	8(%r8), %al
	movb	%al, 40(%rsp)
	movb	9(%r8), %al
	movb	%al, 41(%rsp)
	movb	10(%r8), %al
	movb	%al, 42(%rsp)
	movb	11(%r8), %al
	movb	%al, 43(%rsp)
	movb	12(%r8), %al
	movb	%al, 44(%rsp)
	movb	13(%r8), %al
	movb	%al, 45(%rsp)
	movb	14(%r8), %al
	movb	%al, 46(%rsp)
	movb	15(%r8), %al
	movb	%al, 47(%rsp)
	movb	16(%r8), %al
	movb	%al, 48(%rsp)
	movb	17(%r8), %al
	movb	%al, 49(%rsp)
	movb	18(%r8), %al
	movb	%al, 50(%rsp)
	movb	19(%r8), %al
	movb	%al, 51(%rsp)
	movb	20(%r8), %al
	movb	%al, 52(%rsp)
	movb	21(%r8), %al
	movb	%al, 53(%rsp)
	movb	22(%r8), %al
	movb	%al, 54(%rsp)
	movb	23(%r8), %al
	movb	%al, 55(%rsp)
	movb	(%r9), %al
	movb	%al, 56(%rsp)
	movb	1(%r9), %al
	movb	%al, 57(%rsp)
	movb	2(%r9), %al
	movb	%al, 58(%rsp)
	movb	3(%r9), %al
	movb	%al, 59(%rsp)
	movb	4(%r9), %al
	movb	%al, 60(%rsp)
	movb	5(%r9), %al
	movb	%al, 61(%rsp)
	movb	6(%r9), %al
	movb	%al, 62(%rsp)
	movb	7(%r9), %al
	movb	%al, 63(%rsp)
	movb	8(%r9), %al
	movb	%al, 64(%rsp)
	movb	9(%r9), %al
	movb	%al, 65(%rsp)
	movb	10(%r9), %al
	movb	%al, 66(%rsp)
	movb	11(%r9), %al
	movb	%al, 67(%rsp)
	movb	12(%r9), %al
	movb	%al, 68(%rsp)
	movb	13(%r9), %al
	movb	%al, 69(%rsp)
	movb	14(%r9), %al
	movb	%al, 70(%rsp)
	movb	15(%r9), %al
	movb	%al, 71(%rsp)
	movb	16(%r9), %al
	movb	%al, 72(%rsp)
	movb	17(%r9), %al
	movb	%al, 73(%rsp)
	movb	18(%r9), %al
	movb	%al, 74(%rsp)
	movb	19(%r9), %al
	movb	%al, 75(%rsp)
	movb	20(%r9), %al
	movb	%al, 76(%rsp)
	movb	21(%r9), %al
	movb	%al, 77(%rsp)
	movb	22(%r9), %al
	movb	%al, 78(%rsp)
	movb	23(%r9), %al
	movb	%al, 79(%rsp)
	movb	(%r10), %al
	movb	%al, 80(%rsp)
	movb	1(%r10), %al
	movb	%al, 81(%rsp)
	movb	2(%r10), %al
	movb	%al, 82(%rsp)
	movb	3(%r10), %al
	movb	%al, 83(%rsp)
	movb	4(%r10), %al
	movb	%al, 84(%rsp)
	movb	5(%r10), %al
	movb	%al, 85(%rsp)
	movb	6(%r10), %al
	movb	%al, 86(%rsp)
	movb	7(%r10), %al
	movb	%al, 87(%rsp)
	movb	8(%r10), %al
	movb	%al, 88(%rsp)
	movb	9(%r10), %al
	movb	%al, 89(%rsp)
	movb	10(%r10), %al
	movb	%al, 90(%rsp)
	movb	11(%r10), %al
	movb	%al, 91(%rsp)
	movb	12(%r10), %al
	movb	%al, 92(%rsp)
	movb	13(%r10), %al
	movb	%al, 93(%rsp)
	movb	14(%r10), %al
	movb	%al, 94(%rsp)
	movb	15(%r10), %al
	movb	%al, 95(%rsp)
	movb	16(%r10), %al
	movb	%al, 96(%rsp)
	movb	17(%r10), %al
	movb	%al, 97(%rsp)
	movb	18(%r10), %al
	movb	%al, 98(%rsp)
	movb	19(%r10), %al
	movb	%al, 99(%rsp)
	movb	20(%r10), %al
	movb	%al, 100(%rsp)
	movb	21(%r10), %al
	movb	%al, 101(%rsp)
	movb	22(%r10), %al
	movb	%al, 102(%rsp)
	movb	23(%r10), %al
	movb	%al, 103(%rsp)
	movb	$0, 104(%rsp)
	movb	%cl, 105(%rsp)
	movq	$74, %rsi
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
