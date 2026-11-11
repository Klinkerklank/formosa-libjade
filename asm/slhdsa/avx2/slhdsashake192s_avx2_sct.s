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
	movq	%rdi, %rax
	movq	%rdx, %rcx
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
	leaq	-248(%rsp), %rsp
	call	.LH_msg$1
.Lslh_verify_internal_$4:
	leaq	248(%rsp), %rsp
	movq	56(%rsp), %rdi
	movq	64(%rsp), %rax
	movq	72(%rsp), %rcx
	leaq	128(%rsp), %rdx
	leaq	158(%rsp), %rsi
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
	movzbl	(%rsi), %r9d
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
	movzbl	1(%rsi), %r9d
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
	movzbl	2(%rsi), %r9d
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
	movzbl	3(%rsi), %r9d
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
	movzbl	4(%rsi), %r9d
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
	movzbl	5(%rsi), %r9d
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
	movzbl	6(%rsi), %r9d
	orl 	%r9d, 124(%rsp)
	movl	$0, 116(%rsp)
	andl	$4194303, 120(%rsp)
	movl	$0, %esi
	shll	$8, %esi
	movzbl	(%r8), %r9d
	orl 	%r9d, %esi
	shll	$8, %esi
	movzbl	1(%r8), %r9d
	orl 	%r9d, %esi
	andl	$511, %esi
	leaq	80(%rsp), %r8
	movl	116(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	120(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	124(%rsp), %r9d
	movl	%r9d, 12(%r8)
	leaq	80(%rsp), %r8
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$3, 16(%r8)
	leaq	80(%rsp), %r8
	movl	%esi, 20(%r8)
	leaq	24(%rcx), %r8
	movq	%rdi, 72(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rcx, 56(%rsp)
	movl	%esi, 112(%rsp)
	leaq	32(%rsp), %rax
	leaq	80(%rsp), %r11
	movq	%rax, %rcx
	movq	%r8, %rax
	movq	%r11, %r8
	leaq	-728(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_verify_internal_$3:
	leaq	728(%rsp), %rsp
	movq	72(%rsp), %rdi
	movq	64(%rsp), %r10
	movq	56(%rsp), %rax
	movl	112(%rsp), %edx
	leaq	32(%rsp), %rcx
	leaq	6144(%rax), %rsi
	leaq	116(%rsp), %r8
	movq	%rcx, %rax
	movq	%rsi, %rcx
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
	leaq	-248(%rsp), %rsp
	call	.LPRF_msg$1
.Lslh_sign_internal_$6:
	leaq	248(%rsp), %rsp
	movq	88(%rsp), %rax
	movq	96(%rsp), %rdi
	movq	56(%rsp), %r11
	movq	64(%rsp), %rbx
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rsi
	leaq	48(%rdi), %r9
	leaq	72(%rdi), %r10
	movq	%r9, 80(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rdi, 64(%rsp)
	leaq	152(%rsp), %rdi
	movq	%rcx, %r8
	movq	%rbx, %rcx
	leaq	-248(%rsp), %rsp
	call	.LH_msg$1
.Lslh_sign_internal_$5:
	leaq	248(%rsp), %rsp
	movq	80(%rsp), %rdi
	movq	72(%rsp), %rax
	movq	64(%rsp), %rsi
	leaq	152(%rsp), %rdx
	leaq	182(%rsp), %rcx
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
	movzbl	(%rcx), %r9d
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
	movzbl	1(%rcx), %r9d
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
	movzbl	2(%rcx), %r9d
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
	movzbl	3(%rcx), %r9d
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
	movzbl	4(%rcx), %r9d
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
	movzbl	5(%rcx), %r9d
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
	movzbl	6(%rcx), %r9d
	orl 	%r9d, 148(%rsp)
	movl	$0, 140(%rsp)
	andl	$4194303, 144(%rsp)
	movl	$0, %ecx
	shll	$8, %ecx
	movzbl	(%r8), %r9d
	orl 	%r9d, %ecx
	shll	$8, %ecx
	movzbl	1(%r8), %r9d
	orl 	%r9d, %ecx
	andl	$511, %ecx
	leaq	104(%rsp), %r8
	movl	140(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	144(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	148(%rsp), %r9d
	movl	%r9d, 12(%r8)
	leaq	104(%rsp), %r8
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$3, 16(%r8)
	leaq	104(%rsp), %r8
	movl	%ecx, 20(%r8)
	leaq	24(%rax), %r8
	movq	%rsi, 64(%rsp)
	movq	%rdi, 72(%rsp)
	movq	%rax, 80(%rsp)
	movq	%rdx, 56(%rsp)
	movl	%ecx, 136(%rsp)
	leaq	104(%rsp), %rcx
	movq	%r8, %rax
	movq	%rsi, %r11
	movq	%rcx, %r8
	leaq	-152(%rsp), %rsp
	call	.Lfors_sign$1
.Lslh_sign_internal_$4:
	leaq	152(%rsp), %rsp
	movq	64(%rsp), %rsi
	movq	72(%rsp), %rdi
	movq	80(%rsp), %rcx
	movq	56(%rsp), %rdx
	movl	136(%rsp), %r8d
	movq	%rsi, 56(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%rcx, 72(%rsp)
	movl	%r8d, 136(%rsp)
	leaq	32(%rsp), %rcx
	leaq	104(%rsp), %r8
	leaq	-728(%rsp), %rsp
	call	.Lfors_pkfromsig$1
.Lslh_sign_internal_$3:
	leaq	728(%rsp), %rsp
	movq	56(%rsp), %r11
	movq	80(%rsp), %rdi
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
	movq	$0, %rcx
	ret
.Lslh_keygen_internal_$1:
	movq	%rsi, %rdi
	movq	%rcx, %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rdi)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rdi)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rdi)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rdi)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rdi)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rdi)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rdi)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rdi)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rdi)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rdi)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rdi)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rdi)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rdi)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rdi)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rdi)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rdi)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rdi)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rdi)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rdi)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rdi)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rdi)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rdi)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rdi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rdi)
	leaq	24(%rsi), %rdi
	leaq	24(%rcx), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rdi)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rdi)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rdi)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rdi)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rdi)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rdi)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rdi)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rdi)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rdi)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rdi)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rdi)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rdi)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rdi)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rdi)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rdi)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rdi)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rdi)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rdi)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rdi)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rdi)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rdi)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rdi)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rdi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rdi)
	leaq	48(%rsi), %rdi
	leaq	48(%rcx), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rdi)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rdi)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rdi)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rdi)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rdi)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rdi)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rdi)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rdi)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rdi)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rdi)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rdi)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rdi)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rdi)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rdi)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rdi)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rdi)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rdi)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rdi)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rdi)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rdi)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rdi)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rdi)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rdi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rdi)
	movq	%rax, %rdi
	leaq	48(%rcx), %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rdi)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rdi)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rdi)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rdi)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rdi)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rdi)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rdi)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rdi)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rdi)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rdi)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rdi)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rdi)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rdi)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rdi)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rdi)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rdi)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rdi)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rdi)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rdi)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rdi)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rdi)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rdi)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rdi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rdi)
	movq	%rsi, %r11
	leaq	48(%rsi), %rdi
	leaq	24(%rsp), %rcx
	movq	$0, (%rcx)
	movq	$0, 8(%rcx)
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$6, %r8d
	leaq	24(%rsp), %rcx
	movl	%r8d, (%rcx)
	movl	$0, %r10d
	movl	$9, %edx
	leaq	72(%rsi), %rcx
	movq	%rsi, 8(%rsp)
	movq	%rax, 16(%rsp)
	leaq	24(%rsp), %r8
	leaq	-24696(%rsp), %rsp
	call	.Lxmss_node$1
.Lslh_keygen_internal_$2:
	leaq	24696(%rsp), %rsp
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rax
	leaq	24(%rax), %rdi
	movq	%rcx, %rdx
	movb	(%rdx), %r9b
	movb	%r9b, (%rdi)
	movb	1(%rdx), %r9b
	movb	%r9b, 1(%rdi)
	movb	2(%rdx), %r9b
	movb	%r9b, 2(%rdi)
	movb	3(%rdx), %r9b
	movb	%r9b, 3(%rdi)
	movb	4(%rdx), %r9b
	movb	%r9b, 4(%rdi)
	movb	5(%rdx), %r9b
	movb	%r9b, 5(%rdi)
	movb	6(%rdx), %r9b
	movb	%r9b, 6(%rdi)
	movb	7(%rdx), %r9b
	movb	%r9b, 7(%rdi)
	movb	8(%rdx), %r9b
	movb	%r9b, 8(%rdi)
	movb	9(%rdx), %r9b
	movb	%r9b, 9(%rdi)
	movb	10(%rdx), %r9b
	movb	%r9b, 10(%rdi)
	movb	11(%rdx), %r9b
	movb	%r9b, 11(%rdi)
	movb	12(%rdx), %r9b
	movb	%r9b, 12(%rdi)
	movb	13(%rdx), %r9b
	movb	%r9b, 13(%rdi)
	movb	14(%rdx), %r9b
	movb	%r9b, 14(%rdi)
	movb	15(%rdx), %r9b
	movb	%r9b, 15(%rdi)
	movb	16(%rdx), %r9b
	movb	%r9b, 16(%rdi)
	movb	17(%rdx), %r9b
	movb	%r9b, 17(%rdi)
	movb	18(%rdx), %r9b
	movb	%r9b, 18(%rdi)
	movb	19(%rdx), %r9b
	movb	%r9b, 19(%rdi)
	movb	20(%rdx), %r9b
	movb	%r9b, 20(%rdi)
	movb	21(%rdx), %r9b
	movb	%r9b, 21(%rdi)
	movb	22(%rdx), %r9b
	movb	%r9b, 22(%rdi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rdi)
	ret
.Lfors_pkfromsig$1:
	movq	%rcx, 568(%rsp)
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
	movq	$0, %r9
	jmp 	.Lfors_pkfromsig$3
.Lfors_pkfromsig$4:
	movq	%rdx, 576(%rsp)
	leaq	(%rax,%rcx), %rdx
	leaq	64(%rsp), %rsi
	movb	(%rdx), %r10b
	movb	%r10b, (%rsi)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rsi)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rsi)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rsi)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rsi)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rsi)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rsi)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rsi)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rsi)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rsi)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rsi)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rsi)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rsi)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rsi)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rsi)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rsi)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rsi)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rsi)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rsi)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rsi)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rsi)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rsi)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rsi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rsi)
	movl	$0, %edx
	movl	%edx, 24(%r8)
	movl	%r9d, %edx
	shll	$14, %edx
	addl	664(%rsp,%r9,4), %edx
	movl	%edx, 28(%r8)
	movq	%rdi, 584(%rsp)
	movq	%r8, 592(%rsp)
	movq	%rax, 600(%rsp)
	movq	%r9, 608(%rsp)
	movq	%rcx, 616(%rsp)
	leaq	64(%rsp), %rcx
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_pkfromsig$10:
	leaq	56(%rsp), %rsp
	movq	584(%rsp), %rdi
	movq	592(%rsp), %r8
	movq	600(%rsp), %rax
	movq	608(%rsp), %r9
	movq	616(%rsp), %rcx
	addq	$24, %rcx
	movl	664(%rsp,%r9,4), %r10d
	movl	$0, %esi
	jmp 	.Lfors_pkfromsig$5
.Lfors_pkfromsig$6:
	movl	%esi, %edx
	incl	%edx
	movl	%edx, 24(%r8)
	movl	%r10d, %edx
	andl	$1, %edx
	movl	%esi, 656(%rsp)
	movl	%r10d, 660(%rsp)
	cmpl	$0, %edx
	je  	.Lfors_pkfromsig$8
	movl	28(%r8), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
	leaq	544(%rsp), %rsi
	leaq	(%rax,%rcx), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rsi)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rsi)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rsi)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rsi)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rsi)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rsi)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rsi)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rsi)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rsi)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rsi)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rsi)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rsi)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rsi)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rsi)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rsi)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rsi)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rsi)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rsi)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rsi)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rsi)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rsi)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rsi)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rsi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rsi)
	leaq	512(%rsp), %rsi
	leaq	64(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rsi)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rsi)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rsi)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rsi)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rsi)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rsi)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rsi)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rsi)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rsi)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rsi)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rsi)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rsi)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rsi)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rsi)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rsi)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rsi)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rsi)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rsi)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rsi)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rsi)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rsi)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rsi)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rsi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rsi)
	jmp 	.Lfors_pkfromsig$9
.Lfors_pkfromsig$8:
	movl	28(%r8), %edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
	leaq	544(%rsp), %rsi
	leaq	64(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rsi)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rsi)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rsi)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rsi)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rsi)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rsi)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rsi)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rsi)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rsi)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rsi)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rsi)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rsi)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rsi)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rsi)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rsi)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rsi)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rsi)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rsi)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rsi)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rsi)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rsi)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rsi)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rsi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rsi)
	leaq	512(%rsp), %rsi
	leaq	(%rax,%rcx), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rsi)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rsi)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rsi)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rsi)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rsi)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rsi)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rsi)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rsi)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rsi)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rsi)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rsi)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rsi)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rsi)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rsi)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rsi)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rsi)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rsi)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rsi)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rsi)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rsi)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rsi)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rsi)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rsi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rsi)
.Lfors_pkfromsig$9:
	movq	%rdi, 616(%rsp)
	movq	%r8, 608(%rsp)
	movq	%rax, 600(%rsp)
	movq	%r9, 592(%rsp)
	movq	%rcx, 584(%rsp)
	leaq	32(%rsp), %rcx
	leaq	544(%rsp), %rdx
	leaq	512(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_pkfromsig$7:
	leaq	56(%rsp), %rsp
	movq	616(%rsp), %rdi
	movq	608(%rsp), %r8
	movq	600(%rsp), %rax
	movq	592(%rsp), %r9
	movq	584(%rsp), %rcx
	leaq	64(%rsp), %rsi
	leaq	32(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rsi)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rsi)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rsi)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rsi)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rsi)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rsi)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rsi)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rsi)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rsi)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rsi)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rsi)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rsi)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rsi)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rsi)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rsi)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rsi)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rsi)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rsi)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rsi)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rsi)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rsi)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rsi)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rsi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rsi)
	movl	656(%rsp), %esi
	movl	660(%rsp), %r10d
	shrl	$1, %r10d
	addq	$24, %rcx
	incl	%esi
.Lfors_pkfromsig$5:
	cmpl	$14, %esi
	jb  	.Lfors_pkfromsig$6
	movq	576(%rsp), %rdx
	leaq	96(%rsp,%rdx), %rsi
	leaq	64(%rsp), %r10
	movb	(%r10), %r11b
	movb	%r11b, (%rsi)
	movb	1(%r10), %r11b
	movb	%r11b, 1(%rsi)
	movb	2(%r10), %r11b
	movb	%r11b, 2(%rsi)
	movb	3(%r10), %r11b
	movb	%r11b, 3(%rsi)
	movb	4(%r10), %r11b
	movb	%r11b, 4(%rsi)
	movb	5(%r10), %r11b
	movb	%r11b, 5(%rsi)
	movb	6(%r10), %r11b
	movb	%r11b, 6(%rsi)
	movb	7(%r10), %r11b
	movb	%r11b, 7(%rsi)
	movb	8(%r10), %r11b
	movb	%r11b, 8(%rsi)
	movb	9(%r10), %r11b
	movb	%r11b, 9(%rsi)
	movb	10(%r10), %r11b
	movb	%r11b, 10(%rsi)
	movb	11(%r10), %r11b
	movb	%r11b, 11(%rsi)
	movb	12(%r10), %r11b
	movb	%r11b, 12(%rsi)
	movb	13(%r10), %r11b
	movb	%r11b, 13(%rsi)
	movb	14(%r10), %r11b
	movb	%r11b, 14(%rsi)
	movb	15(%r10), %r11b
	movb	%r11b, 15(%rsi)
	movb	16(%r10), %r11b
	movb	%r11b, 16(%rsi)
	movb	17(%r10), %r11b
	movb	%r11b, 17(%rsi)
	movb	18(%r10), %r11b
	movb	%r11b, 18(%rsi)
	movb	19(%r10), %r11b
	movb	%r11b, 19(%rsi)
	movb	20(%r10), %r11b
	movb	%r11b, 20(%rsi)
	movb	21(%r10), %r11b
	movb	%r11b, 21(%rsi)
	movb	22(%r10), %r11b
	movb	%r11b, 22(%rsi)
	movb	23(%r10), %r10b
	movb	%r10b, 23(%rsi)
	addq	$24, %rdx
	incq	%r9
.Lfors_pkfromsig$3:
	cmpq	$17, %r9
	jb  	.Lfors_pkfromsig$4
	leaq	624(%rsp), %rax
	movq	(%r8), %rdx
	movq	%rdx, (%rax)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rax)
	leaq	624(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$4, 16(%rcx)
	movl	20(%r8), %ecx
	leaq	624(%rsp), %r8
	movl	%ecx, 20(%r8)
	movq	568(%rsp), %rcx
	leaq	624(%rsp), %r8
	leaq	96(%rsp), %rax
	leaq	-56(%rsp), %rsp
	call	.LT_k$1
.Lfors_pkfromsig$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rax
	ret
.Lfors_sign$1:
	leaq	64(%rsp), %rsi
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
	movl	%ebx, (%rsi)
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
	movl	%ebx, 4(%rsi)
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
	movl	%ebx, 8(%rsi)
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
	movl	%ebx, 12(%rsi)
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
	movl	%ebx, 16(%rsi)
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
	movl	%ebx, 20(%rsi)
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
	movl	%ebx, 24(%rsi)
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
	movl	%ebx, 28(%rsi)
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
	movl	%ebx, 32(%rsi)
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
	movl	%ebx, 36(%rsi)
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
	movl	%ebx, 40(%rsi)
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
	movl	%ebx, 44(%rsi)
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
	movl	%ebx, 48(%rsi)
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
	movl	%ebx, 52(%rsi)
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
	movl	%ebx, 56(%rsi)
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
	movl	%ebx, 60(%rsi)
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
	movl	%edx, 64(%rsi)
	movq	$0, %r10
	movq	$0, %r9
	jmp 	.Lfors_sign$2
.Lfors_sign$3:
	movl	%r9d, %edx
	shll	$14, %edx
	addl	64(%rsp,%r9,4), %edx
	leaq	(%rax,%r10), %rsi
	movq	%r11, 8(%rsp)
	movq	%rdi, 16(%rsp)
	movq	%r8, 24(%rsp)
	movq	%rax, 32(%rsp)
	movq	%r9, 40(%rsp)
	movq	%r10, 48(%rsp)
	movl	%edx, %r9d
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_sign$7:
	leaq	40(%rsp), %rsp
	movq	8(%rsp), %r11
	movq	16(%rsp), %rdi
	movq	24(%rsp), %r8
	movq	32(%rsp), %rax
	movq	40(%rsp), %r9
	movq	48(%rsp), %r10
	addq	$24, %r10
	movl	64(%rsp,%r9,4), %edx
	xorl	$1, %edx
	movl	$0, %esi
	jmp 	.Lfors_sign$4
.Lfors_sign$5:
	movq	%r11, 48(%rsp)
	movq	%rdi, 40(%rsp)
	movq	%r9, 32(%rsp)
	movl	%esi, 56(%rsp)
	movq	%r10, 24(%rsp)
	movl	%edx, 60(%rsp)
	movl	$14, %ecx
	subl	%esi, %ecx
	shlq	%cl, %r9
	addl	%edx, %r9d
	leaq	(%rax,%r10), %rcx
	movq	%rax, 16(%rsp)
	movl	%r9d, %r10d
	movl	%esi, %edx
	leaq	-786584(%rsp), %rsp
	call	.Lfors_node$1
.Lfors_sign$6:
	leaq	786584(%rsp), %rsp
	movq	16(%rsp), %rax
	movq	48(%rsp), %r11
	movq	40(%rsp), %rdi
	movq	32(%rsp), %r9
	movl	56(%rsp), %esi
	movq	24(%rsp), %r10
	movl	60(%rsp), %edx
	shrl	$1, %edx
	xorl	$1, %edx
	addq	$24, %r10
	incl	%esi
.Lfors_sign$4:
	cmpl	$14, %esi
	jb  	.Lfors_sign$5
	incq	%r9
.Lfors_sign$2:
	cmpq	$17, %r9
	jb  	.Lfors_sign$3
	ret
.Lfors_node$1:
	movq	%rcx, 786504(%rsp)
	movl	$0, %esi
	jmp 	.Lfors_node$2
.Lfors_node$3:
	movl	%edx, 786544(%rsp)
	movl	%edx, %ecx
	subl	%esi, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r9d
	imull	%r10d, %r9d
	addl	%r9d, %edx
	jmp 	.Lfors_node$4
.Lfors_node$5:
	movq	%r11, 786512(%rsp)
	movl	%edx, 786548(%rsp)
	cmpl	$0, %esi
	je  	.Lfors_node$6
	movl	%r9d, %eax
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
	movl	%esi, 24(%r8)
	movl	%r9d, 28(%r8)
	movl	$15, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %r11
	subl	%esi, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %r11
	shrq	$1, %rbp
	movl	%r9d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %r11
	imulq	$24, %r11, %rax
	movq	%rdi, 786520(%rsp)
	movq	%r8, 786528(%rsp)
	movl	%r10d, 786552(%rsp)
	movl	%esi, 786556(%rsp)
	movl	%r9d, 786560(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	786480(%rsp), %rdx
	leaq	786448(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lfors_node$10:
	leaq	56(%rsp), %rsp
	movq	786520(%rsp), %rdi
	movq	786528(%rsp), %r8
	movl	786552(%rsp), %r10d
	movl	786556(%rsp), %esi
	movl	786560(%rsp), %r9d
	jmp 	.Lfors_node$7
.Lfors_node$6:
	movl	%esi, 24(%r8)
	movl	%r9d, 28(%r8)
	movl	$15, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movq	%rdx, %rbx
	subl	%esi, %ecx
	movq	$1, %rbp
	shlq	%cl, %rbp
	subq	%rbp, %rbx
	shrq	$1, %rbp
	movl	%r9d, %eax
	xorl	%edx, %edx
	divq	%rbp
	addq	%rdx, %rbx
	imulq	$24, %rbx, %rax
	movq	%rdi, 786520(%rsp)
	movq	%r8, 786528(%rsp)
	movl	%r10d, 786552(%rsp)
	movl	%esi, 786556(%rsp)
	movl	%r9d, 786560(%rsp)
	movq	%rax, 786536(%rsp)
	leaq	32(%rsp,%rax), %rsi
	leaq	-40(%rsp), %rsp
	call	.Lfors_skgen$1
.Lfors_node$9:
	leaq	40(%rsp), %rsp
	movq	786520(%rsp), %rdi
	movq	786528(%rsp), %r8
	movl	786552(%rsp), %r9d
	movl	786556(%rsp), %esi
	movl	786560(%rsp), %eax
	movq	786536(%rsp), %rcx
	movq	%rdi, 786536(%rsp)
	movq	%r8, 786528(%rsp)
	movl	%r9d, 786560(%rsp)
	movl	%esi, 786556(%rsp)
	movl	%eax, 786552(%rsp)
	movq	%rcx, 786520(%rsp)
	leaq	32(%rsp,%rcx), %rcx
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lfors_node$8:
	leaq	56(%rsp), %rsp
	movq	786536(%rsp), %rdi
	movq	786528(%rsp), %r8
	movl	786560(%rsp), %r10d
	movl	786556(%rsp), %esi
	movl	786552(%rsp), %r9d
	movq	786520(%rsp), %rax
.Lfors_node$7:
	movq	786512(%rsp), %r11
	movl	786548(%rsp), %edx
	incl	%r9d
.Lfors_node$4:
	cmpl	%edx, %r9d
	jb  	.Lfors_node$5
	movl	786544(%rsp), %edx
	incl	%esi
.Lfors_node$2:
	cmpl	%edx, %esi
	jbe 	.Lfors_node$3
	movq	786504(%rsp), %rcx
	leaq	32(%rsp,%rax), %rdx
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
	ret
.Lfors_skgen$1:
	leaq	8(%rsp), %rax
	movq	(%r8), %rdx
	movq	%rdx, (%rax)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rax)
	leaq	8(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$6, 16(%rcx)
	movl	20(%r8), %ecx
	leaq	8(%rsp), %r8
	movl	%ecx, 20(%r8)
	leaq	8(%rsp), %rcx
	movl	%r9d, 28(%rcx)
	leaq	8(%rsp), %rcx
	movq	%rcx, %rdx
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lfors_skgen$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rsi
	ret
.Lht_verify$1:
	movq	%r10, 8(%rsp)
	movl	(%r8), %r9d
	movl	%r9d, 76(%rsp)
	movl	4(%r8), %r9d
	movl	%r9d, 80(%rsp)
	movl	8(%r8), %r9d
	movl	%r9d, 84(%rsp)
	leaq	40(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	leaq	40(%rsp), %r8
	movl	76(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	80(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	84(%rsp), %r9d
	movl	%r9d, 12(%r8)
	movq	%rcx, %rsi
	movq	%rdi, 16(%rsp)
	movq	%rcx, 24(%rsp)
	leaq	88(%rsp), %rcx
	leaq	40(%rsp), %r8
	movq	%r8, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$5:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rcx
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
	leaq	40(%rsp), %r8
	movl	%r10d, (%r8)
	leaq	40(%rsp), %r8
	movl	76(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	80(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	84(%rsp), %r9d
	movl	%r9d, 12(%r8)
	leaq	112(%rsp), %rsi
	leaq	88(%rsp), %r9
	movb	(%r9), %r10b
	movb	%r10b, (%rsi)
	movb	1(%r9), %r10b
	movb	%r10b, 1(%rsi)
	movb	2(%r9), %r10b
	movb	%r10b, 2(%rsi)
	movb	3(%r9), %r10b
	movb	%r10b, 3(%rsi)
	movb	4(%r9), %r10b
	movb	%r10b, 4(%rsi)
	movb	5(%r9), %r10b
	movb	%r10b, 5(%rsi)
	movb	6(%r9), %r10b
	movb	%r10b, 6(%rsi)
	movb	7(%r9), %r10b
	movb	%r10b, 7(%rsi)
	movb	8(%r9), %r10b
	movb	%r10b, 8(%rsi)
	movb	9(%r9), %r10b
	movb	%r10b, 9(%rsi)
	movb	10(%r9), %r10b
	movb	%r10b, 10(%rsi)
	movb	11(%r9), %r10b
	movb	%r10b, 11(%rsi)
	movb	12(%r9), %r10b
	movb	%r10b, 12(%rsi)
	movb	13(%r9), %r10b
	movb	%r10b, 13(%rsi)
	movb	14(%r9), %r10b
	movb	%r10b, 14(%rsi)
	movb	15(%r9), %r10b
	movb	%r10b, 15(%rsi)
	movb	16(%r9), %r10b
	movb	%r10b, 16(%rsi)
	movb	17(%r9), %r10b
	movb	%r10b, 17(%rsi)
	movb	18(%r9), %r10b
	movb	%r10b, 18(%rsi)
	movb	19(%r9), %r10b
	movb	%r10b, 19(%rsi)
	movb	20(%r9), %r10b
	movb	%r10b, 20(%rsi)
	movb	21(%r9), %r10b
	movb	%r10b, 21(%rsi)
	movb	22(%r9), %r10b
	movb	%r10b, 22(%rsi)
	movb	23(%r9), %r9b
	movb	%r9b, 23(%rsi)
	leaq	(%rcx,%rax), %rsi
	movq	%rdi, 16(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	88(%rsp), %rcx
	leaq	112(%rsp), %rax
	leaq	40(%rsp), %r8
	movq	%r8, %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_verify$4:
	leaq	216(%rsp), %rsp
	movq	16(%rsp), %rdi
	movq	32(%rsp), %rcx
	movl	72(%rsp), %r10d
	movq	24(%rsp), %rax
	addq	$1440, %rax
	incl	%r10d
.Lht_verify$2:
	cmpl	$7, %r10d
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
	movl	8(%r8), %r9d
	movl	%r9d, 88(%rsp)
	leaq	40(%rsp), %r8
	movq	$0, (%r8)
	movq	$0, 8(%r8)
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	leaq	40(%rsp), %r8
	movl	80(%rsp), %r9d
	movl	%r9d, 4(%r8)
	movl	84(%rsp), %r9d
	movl	%r9d, 8(%r8)
	movl	88(%rsp), %r9d
	movl	%r9d, 12(%r8)
	movq	%rcx, %rsi
	movq	%rcx, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%rax, 32(%rsp)
	movl	%edx, 72(%rsp)
	leaq	40(%rsp), %r8
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$8:
	leaq	56(%rsp), %rsp
	movq	8(%rsp), %rax
	movq	16(%rsp), %r11
	movq	24(%rsp), %rdi
	movq	32(%rsp), %r8
	movl	72(%rsp), %edx
	movq	%r11, 32(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%rax, 16(%rsp)
	leaq	92(%rsp), %rcx
	leaq	40(%rsp), %r11
	movq	%r8, %rax
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$7:
	leaq	216(%rsp), %rsp
	movq	32(%rsp), %r11
	movq	24(%rsp), %rdi
	movq	16(%rsp), %rax
	movq	$1440, %r9
	movl	$1, %r8d
	jmp 	.Lht_sign$2
.Lht_sign$3:
	movq	%r11, 16(%rsp)
	leaq	80(%rsp), %rdx
	movl	8(%rdx), %ecx
	andl	$511, %ecx
	shrl	$9, 8(%rdx)
	movl	4(%rdx), %esi
	shll	$23, %esi
	orl 	%esi, 8(%rdx)
	shrl	$9, 4(%rdx)
	movl	(%rdx), %esi
	shll	$23, %esi
	orl 	%esi, 4(%rdx)
	shrl	$9, (%rdx)
	leaq	40(%rsp), %rdx
	movl	%r8d, (%rdx)
	leaq	40(%rsp), %rdx
	movl	80(%rsp), %r10d
	movl	%r10d, 4(%rdx)
	movl	84(%rsp), %r10d
	movl	%r10d, 8(%rdx)
	movl	88(%rsp), %r10d
	movl	%r10d, 12(%rdx)
	leaq	116(%rsp), %rsi
	leaq	92(%rsp), %rdx
	movb	(%rdx), %r10b
	movb	%r10b, (%rsi)
	movb	1(%rdx), %r10b
	movb	%r10b, 1(%rsi)
	movb	2(%rdx), %r10b
	movb	%r10b, 2(%rsi)
	movb	3(%rdx), %r10b
	movb	%r10b, 3(%rsi)
	movb	4(%rdx), %r10b
	movb	%r10b, 4(%rsi)
	movb	5(%rdx), %r10b
	movb	%r10b, 5(%rsi)
	movb	6(%rdx), %r10b
	movb	%r10b, 6(%rsi)
	movb	7(%rdx), %r10b
	movb	%r10b, 7(%rsi)
	movb	8(%rdx), %r10b
	movb	%r10b, 8(%rsi)
	movb	9(%rdx), %r10b
	movb	%r10b, 9(%rsi)
	movb	10(%rdx), %r10b
	movb	%r10b, 10(%rsi)
	movb	11(%rdx), %r10b
	movb	%r10b, 11(%rsi)
	movb	12(%rdx), %r10b
	movb	%r10b, 12(%rsi)
	movb	13(%rdx), %r10b
	movb	%r10b, 13(%rsi)
	movb	14(%rdx), %r10b
	movb	%r10b, 14(%rsi)
	movb	15(%rdx), %r10b
	movb	%r10b, 15(%rsi)
	movb	16(%rdx), %r10b
	movb	%r10b, 16(%rsi)
	movb	17(%rdx), %r10b
	movb	%r10b, 17(%rsi)
	movb	18(%rdx), %r10b
	movb	%r10b, 18(%rsi)
	movb	19(%rdx), %r10b
	movb	%r10b, 19(%rsi)
	movb	20(%rdx), %r10b
	movb	%r10b, 20(%rsi)
	movb	21(%rdx), %r10b
	movb	%r10b, 21(%rsi)
	movb	22(%rdx), %r10b
	movb	%r10b, 22(%rsi)
	movb	23(%rdx), %dl
	movb	%dl, 23(%rsi)
	leaq	(%rax,%r9), %rsi
	movq	%rax, 24(%rsp)
	movq	%rdi, 32(%rsp)
	movl	%r8d, 72(%rsp)
	movq	%r9, 8(%rsp)
	movl	%ecx, 76(%rsp)
	leaq	116(%rsp), %rax
	leaq	40(%rsp), %r8
	movl	%ecx, %edx
	leaq	-56(%rsp), %rsp
	call	.Lxmss_sign$1
.Lht_sign$6:
	leaq	56(%rsp), %rsp
	movq	24(%rsp), %rax
	movq	32(%rsp), %rdi
	movl	72(%rsp), %r8d
	movq	8(%rsp), %r9
	movl	76(%rsp), %edx
	cmpl	$6, %r8d
	jnb 	.Lht_sign$4
	movq	%rdi, 8(%rsp)
	movq	%rax, 32(%rsp)
	movl	%r8d, 76(%rsp)
	movq	%r9, 24(%rsp)
	leaq	92(%rsp), %rcx
	leaq	116(%rsp), %rax
	leaq	40(%rsp), %r11
	leaq	-216(%rsp), %rsp
	call	.Lxmss_pkfromsig$1
.Lht_sign$5:
	leaq	216(%rsp), %rsp
	movq	8(%rsp), %rdi
	movq	32(%rsp), %rax
	movl	76(%rsp), %r8d
	movq	24(%rsp), %r9
.Lht_sign$4:
	movq	16(%rsp), %r11
	addq	$1440, %r9
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
	movq	%rsi, %rcx
	movq	%rdi, 160(%rsp)
	movl	%edx, 192(%rsp)
	movq	%rsi, 168(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	movq	%rdi, %r8
	leaq	-1528(%rsp), %rsp
	call	.Lwots_pkfromsig$1
.Lxmss_pkfromsig$7:
	leaq	1528(%rsp), %rsp
	movq	%rcx, %r8
	movq	160(%rsp), %rdi
	movl	192(%rsp), %edx
	movq	168(%rsp), %rsi
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$2, 16(%r8)
	movl	%edx, 28(%r8)
	movq	$1224, %rax
	movl	%edx, %r10d
	movl	$0, %ecx
	jmp 	.Lxmss_pkfromsig$2
.Lxmss_pkfromsig$3:
	movl	%ecx, %edx
	incl	%edx
	movl	%edx, 24(%r8)
	movl	%r10d, %edx
	andl	$1, %edx
	movl	%ecx, 192(%rsp)
	movl	%r10d, 196(%rsp)
	cmpl	$0, %edx
	je  	.Lxmss_pkfromsig$5
	movl	28(%r8), %edx
	decl	%edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
	leaq	128(%rsp), %rcx
	leaq	(%rsi,%rax), %rdx
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
	movl	28(%r8), %edx
	shrl	$1, %edx
	movl	%edx, 28(%r8)
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
	leaq	(%rsi,%rax), %rdx
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
	movq	%rdi, 168(%rsp)
	movq	%r8, 160(%rsp)
	movq	%rsi, 176(%rsp)
	movq	%rax, 184(%rsp)
	leaq	64(%rsp), %rcx
	leaq	128(%rsp), %rdx
	leaq	96(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_pkfromsig$4:
	leaq	56(%rsp), %rsp
	movq	168(%rsp), %rdi
	movq	160(%rsp), %r8
	movq	176(%rsp), %rsi
	movq	184(%rsp), %rax
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
	movl	196(%rsp), %r10d
	shrl	$1, %r10d
	addq	$24, %rax
	incl	%ecx
.Lxmss_pkfromsig$2:
	cmpl	$9, %ecx
	jb  	.Lxmss_pkfromsig$3
	movq	152(%rsp), %rcx
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
	ret
.Lxmss_sign$1:
	movq	%rax, 8(%rsp)
	movq	$1224, %rcx
	movl	%edx, %eax
	xorl	$1, %eax
	movl	$0, %r9d
	jmp 	.Lxmss_sign$3
.Lxmss_sign$4:
	movq	%r11, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movl	%edx, 48(%rsp)
	movl	%r9d, 52(%rsp)
	movl	%eax, 56(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	(%rsi,%rcx), %rcx
	movq	%rsi, 40(%rsp)
	movl	%eax, %r10d
	movl	%r9d, %edx
	leaq	-24696(%rsp), %rsp
	call	.Lxmss_node$1
.Lxmss_sign$5:
	leaq	24696(%rsp), %rsp
	movq	40(%rsp), %rsi
	movq	16(%rsp), %r11
	movq	24(%rsp), %rdi
	movl	48(%rsp), %edx
	movl	52(%rsp), %r9d
	movl	56(%rsp), %eax
	movq	32(%rsp), %rcx
	shrl	$1, %eax
	xorl	$1, %eax
	addq	$24, %rcx
	incl	%r9d
.Lxmss_sign$3:
	cmpl	$9, %r9d
	jb  	.Lxmss_sign$4
	movq	8(%rsp), %rax
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$0, 16(%r8)
	movl	%edx, 20(%r8)
	movq	%rsi, %rbx
	movq	%rsi, 8(%rsp)
	movq	%rdi, %r9
	leaq	-296(%rsp), %rsp
	call	.Lwots_sign$1
.Lxmss_sign$2:
	leaq	296(%rsp), %rsp
	movq	%rdx, %rcx
	movq	8(%rsp), %rsi
	ret
.Lxmss_node$1:
	movq	%rcx, 24648(%rsp)
	movl	$0, %esi
	jmp 	.Lxmss_node$2
.Lxmss_node$3:
	movl	%edx, 24680(%rsp)
	movl	%edx, %ecx
	subl	%esi, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	movl	%edx, %r9d
	imull	%r10d, %r9d
	addl	%r9d, %edx
	jmp 	.Lxmss_node$4
.Lxmss_node$5:
	movq	%r11, 24656(%rsp)
	movq	%rdi, 24664(%rsp)
	movl	%r10d, 24684(%rsp)
	movl	%esi, 24688(%rsp)
	movl	%r9d, 24692(%rsp)
	movl	%edx, 24696(%rsp)
	cmpl	$0, %esi
	je  	.Lxmss_node$6
	movl	%r9d, %eax
	imull	$2, %eax, %eax
	movl	%esi, %edx
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
	leaq	24592(%rsp), %rcx
	leaq	32(%rsp,%rax), %rdx
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
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$2, 16(%r8)
	movl	%esi, 24(%r8)
	movl	%r9d, 28(%r8)
	movl	$10, %ecx
	movq	$1, %rdx
	shlq	%cl, %rdx
	subl	%esi, %ecx
	movq	$1, %r11
	shlq	%cl, %r11
	subq	%r11, %rdx
	movl	%r9d, %eax
	addq	%rax, %rdx
	imulq	$24, %rdx, %rax
	movq	%r8, 24672(%rsp)
	leaq	32(%rsp,%rax), %rcx
	leaq	24624(%rsp), %rdx
	leaq	24592(%rsp), %rsi
	leaq	-56(%rsp), %rsp
	call	.LH$1
.Lxmss_node$9:
	leaq	56(%rsp), %rsp
	movq	24672(%rsp), %r8
	jmp 	.Lxmss_node$7
.Lxmss_node$6:
	movq	$0, 16(%r8)
	movq	$0, 24(%r8)
	movl	$0, 16(%r8)
	movl	%r9d, 20(%r8)
	movl	%r9d, %eax
	imulq	$24, %rax, %rax
	leaq	32(%rsp,%rax), %rcx
	leaq	-1336(%rsp), %rsp
	call	.Lwots_pkgen$1
.Lxmss_node$8:
	leaq	1336(%rsp), %rsp
	movq	%rdx, %r8
.Lxmss_node$7:
	movq	24656(%rsp), %r11
	movq	24664(%rsp), %rdi
	movl	24684(%rsp), %r10d
	movl	24688(%rsp), %esi
	movl	24692(%rsp), %r9d
	movl	24696(%rsp), %edx
	incl	%r9d
.Lxmss_node$4:
	cmpl	%edx, %r9d
	jb  	.Lxmss_node$5
	movl	24680(%rsp), %edx
	incl	%esi
.Lxmss_node$2:
	cmpl	%edx, %esi
	jbe 	.Lxmss_node$3
	movq	24648(%rsp), %rcx
	leaq	32(%rsp,%rax), %rdx
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
	movb	559(%rdx), %r9b
	movb	%r9b, 591(%rsp)
	movb	560(%rdx), %r9b
	movb	%r9b, 592(%rsp)
	movb	561(%rdx), %r9b
	movb	%r9b, 593(%rsp)
	movb	562(%rdx), %r9b
	movb	%r9b, 594(%rsp)
	movb	563(%rdx), %r9b
	movb	%r9b, 595(%rsp)
	movb	564(%rdx), %r9b
	movb	%r9b, 596(%rsp)
	movb	565(%rdx), %r9b
	movb	%r9b, 597(%rsp)
	movb	566(%rdx), %r9b
	movb	%r9b, 598(%rsp)
	movb	567(%rdx), %r9b
	movb	%r9b, 599(%rsp)
	movb	568(%rdx), %r9b
	movb	%r9b, 600(%rsp)
	movb	569(%rdx), %r9b
	movb	%r9b, 601(%rsp)
	movb	570(%rdx), %r9b
	movb	%r9b, 602(%rsp)
	movb	571(%rdx), %r9b
	movb	%r9b, 603(%rsp)
	movb	572(%rdx), %r9b
	movb	%r9b, 604(%rsp)
	movb	573(%rdx), %r9b
	movb	%r9b, 605(%rsp)
	movb	574(%rdx), %r9b
	movb	%r9b, 606(%rsp)
	movb	575(%rdx), %r9b
	movb	%r9b, 607(%rsp)
	movb	576(%rdx), %r9b
	movb	%r9b, 608(%rsp)
	movb	577(%rdx), %r9b
	movb	%r9b, 609(%rsp)
	movb	578(%rdx), %r9b
	movb	%r9b, 610(%rsp)
	movb	579(%rdx), %r9b
	movb	%r9b, 611(%rsp)
	movb	580(%rdx), %r9b
	movb	%r9b, 612(%rsp)
	movb	581(%rdx), %r9b
	movb	%r9b, 613(%rsp)
	movb	582(%rdx), %r9b
	movb	%r9b, 614(%rsp)
	movb	583(%rdx), %r9b
	movb	%r9b, 615(%rsp)
	movb	584(%rdx), %r9b
	movb	%r9b, 616(%rsp)
	movb	585(%rdx), %r9b
	movb	%r9b, 617(%rsp)
	movb	586(%rdx), %r9b
	movb	%r9b, 618(%rsp)
	movb	587(%rdx), %r9b
	movb	%r9b, 619(%rsp)
	movb	588(%rdx), %r9b
	movb	%r9b, 620(%rsp)
	movb	589(%rdx), %r9b
	movb	%r9b, 621(%rsp)
	movb	590(%rdx), %r9b
	movb	%r9b, 622(%rsp)
	movb	591(%rdx), %r9b
	movb	%r9b, 623(%rsp)
	movb	592(%rdx), %r9b
	movb	%r9b, 624(%rsp)
	movb	593(%rdx), %r9b
	movb	%r9b, 625(%rsp)
	movb	594(%rdx), %r9b
	movb	%r9b, 626(%rsp)
	movb	595(%rdx), %r9b
	movb	%r9b, 627(%rsp)
	movb	596(%rdx), %r9b
	movb	%r9b, 628(%rsp)
	movb	597(%rdx), %r9b
	movb	%r9b, 629(%rsp)
	movb	598(%rdx), %r9b
	movb	%r9b, 630(%rsp)
	movb	599(%rdx), %r9b
	movb	%r9b, 631(%rsp)
	movb	600(%rdx), %r9b
	movb	%r9b, 632(%rsp)
	movb	601(%rdx), %r9b
	movb	%r9b, 633(%rsp)
	movb	602(%rdx), %r9b
	movb	%r9b, 634(%rsp)
	movb	603(%rdx), %r9b
	movb	%r9b, 635(%rsp)
	movb	604(%rdx), %r9b
	movb	%r9b, 636(%rsp)
	movb	605(%rdx), %r9b
	movb	%r9b, 637(%rsp)
	movb	606(%rdx), %r9b
	movb	%r9b, 638(%rsp)
	movb	607(%rdx), %r9b
	movb	%r9b, 639(%rsp)
	movb	608(%rdx), %r9b
	movb	%r9b, 640(%rsp)
	movb	609(%rdx), %r9b
	movb	%r9b, 641(%rsp)
	movb	610(%rdx), %r9b
	movb	%r9b, 642(%rsp)
	movb	611(%rdx), %r9b
	movb	%r9b, 643(%rsp)
	movb	612(%rdx), %r9b
	movb	%r9b, 644(%rsp)
	movb	613(%rdx), %r9b
	movb	%r9b, 645(%rsp)
	movb	614(%rdx), %r9b
	movb	%r9b, 646(%rsp)
	movb	615(%rdx), %r9b
	movb	%r9b, 647(%rsp)
	movb	616(%rdx), %r9b
	movb	%r9b, 648(%rsp)
	movb	617(%rdx), %r9b
	movb	%r9b, 649(%rsp)
	movb	618(%rdx), %r9b
	movb	%r9b, 650(%rsp)
	movb	619(%rdx), %r9b
	movb	%r9b, 651(%rsp)
	movb	620(%rdx), %r9b
	movb	%r9b, 652(%rsp)
	movb	621(%rdx), %r9b
	movb	%r9b, 653(%rsp)
	movb	622(%rdx), %r9b
	movb	%r9b, 654(%rsp)
	movb	623(%rdx), %r9b
	movb	%r9b, 655(%rsp)
	movb	624(%rdx), %r9b
	movb	%r9b, 656(%rsp)
	movb	625(%rdx), %r9b
	movb	%r9b, 657(%rsp)
	movb	626(%rdx), %r9b
	movb	%r9b, 658(%rsp)
	movb	627(%rdx), %r9b
	movb	%r9b, 659(%rsp)
	movb	628(%rdx), %r9b
	movb	%r9b, 660(%rsp)
	movb	629(%rdx), %r9b
	movb	%r9b, 661(%rsp)
	movb	630(%rdx), %r9b
	movb	%r9b, 662(%rsp)
	movb	631(%rdx), %r9b
	movb	%r9b, 663(%rsp)
	movb	632(%rdx), %r9b
	movb	%r9b, 664(%rsp)
	movb	633(%rdx), %r9b
	movb	%r9b, 665(%rsp)
	movb	634(%rdx), %r9b
	movb	%r9b, 666(%rsp)
	movb	635(%rdx), %r9b
	movb	%r9b, 667(%rsp)
	movb	636(%rdx), %r9b
	movb	%r9b, 668(%rsp)
	movb	637(%rdx), %r9b
	movb	%r9b, 669(%rsp)
	movb	638(%rdx), %r9b
	movb	%r9b, 670(%rsp)
	movb	639(%rdx), %r9b
	movb	%r9b, 671(%rsp)
	movb	640(%rdx), %r9b
	movb	%r9b, 672(%rsp)
	movb	641(%rdx), %r9b
	movb	%r9b, 673(%rsp)
	movb	642(%rdx), %r9b
	movb	%r9b, 674(%rsp)
	movb	643(%rdx), %r9b
	movb	%r9b, 675(%rsp)
	movb	644(%rdx), %r9b
	movb	%r9b, 676(%rsp)
	movb	645(%rdx), %r9b
	movb	%r9b, 677(%rsp)
	movb	646(%rdx), %r9b
	movb	%r9b, 678(%rsp)
	movb	647(%rdx), %r9b
	movb	%r9b, 679(%rsp)
	movb	648(%rdx), %r9b
	movb	%r9b, 680(%rsp)
	movb	649(%rdx), %r9b
	movb	%r9b, 681(%rsp)
	movb	650(%rdx), %r9b
	movb	%r9b, 682(%rsp)
	movb	651(%rdx), %r9b
	movb	%r9b, 683(%rsp)
	movb	652(%rdx), %r9b
	movb	%r9b, 684(%rsp)
	movb	653(%rdx), %r9b
	movb	%r9b, 685(%rsp)
	movb	654(%rdx), %r9b
	movb	%r9b, 686(%rsp)
	movb	655(%rdx), %r9b
	movb	%r9b, 687(%rsp)
	movb	656(%rdx), %r9b
	movb	%r9b, 688(%rsp)
	movb	657(%rdx), %r9b
	movb	%r9b, 689(%rsp)
	movb	658(%rdx), %r9b
	movb	%r9b, 690(%rsp)
	movb	659(%rdx), %r9b
	movb	%r9b, 691(%rsp)
	movb	660(%rdx), %r9b
	movb	%r9b, 692(%rsp)
	movb	661(%rdx), %r9b
	movb	%r9b, 693(%rsp)
	movb	662(%rdx), %r9b
	movb	%r9b, 694(%rsp)
	movb	663(%rdx), %r9b
	movb	%r9b, 695(%rsp)
	movb	664(%rdx), %r9b
	movb	%r9b, 696(%rsp)
	movb	665(%rdx), %r9b
	movb	%r9b, 697(%rsp)
	movb	666(%rdx), %r9b
	movb	%r9b, 698(%rsp)
	movb	667(%rdx), %r9b
	movb	%r9b, 699(%rsp)
	movb	668(%rdx), %r9b
	movb	%r9b, 700(%rsp)
	movb	669(%rdx), %r9b
	movb	%r9b, 701(%rsp)
	movb	670(%rdx), %r9b
	movb	%r9b, 702(%rsp)
	movb	671(%rdx), %r9b
	movb	%r9b, 703(%rsp)
	movb	672(%rdx), %r9b
	movb	%r9b, 704(%rsp)
	movb	673(%rdx), %r9b
	movb	%r9b, 705(%rsp)
	movb	674(%rdx), %r9b
	movb	%r9b, 706(%rsp)
	movb	675(%rdx), %r9b
	movb	%r9b, 707(%rsp)
	movb	676(%rdx), %r9b
	movb	%r9b, 708(%rsp)
	movb	677(%rdx), %r9b
	movb	%r9b, 709(%rsp)
	movb	678(%rdx), %r9b
	movb	%r9b, 710(%rsp)
	movb	679(%rdx), %r9b
	movb	%r9b, 711(%rsp)
	movb	680(%rdx), %r9b
	movb	%r9b, 712(%rsp)
	movb	681(%rdx), %r9b
	movb	%r9b, 713(%rsp)
	movb	682(%rdx), %r9b
	movb	%r9b, 714(%rsp)
	movb	683(%rdx), %r9b
	movb	%r9b, 715(%rsp)
	movb	684(%rdx), %r9b
	movb	%r9b, 716(%rsp)
	movb	685(%rdx), %r9b
	movb	%r9b, 717(%rsp)
	movb	686(%rdx), %r9b
	movb	%r9b, 718(%rsp)
	movb	687(%rdx), %r9b
	movb	%r9b, 719(%rsp)
	movb	688(%rdx), %r9b
	movb	%r9b, 720(%rsp)
	movb	689(%rdx), %r9b
	movb	%r9b, 721(%rsp)
	movb	690(%rdx), %r9b
	movb	%r9b, 722(%rsp)
	movb	691(%rdx), %r9b
	movb	%r9b, 723(%rsp)
	movb	692(%rdx), %r9b
	movb	%r9b, 724(%rsp)
	movb	693(%rdx), %r9b
	movb	%r9b, 725(%rsp)
	movb	694(%rdx), %r9b
	movb	%r9b, 726(%rsp)
	movb	695(%rdx), %r9b
	movb	%r9b, 727(%rsp)
	movb	696(%rdx), %r9b
	movb	%r9b, 728(%rsp)
	movb	697(%rdx), %r9b
	movb	%r9b, 729(%rsp)
	movb	698(%rdx), %r9b
	movb	%r9b, 730(%rsp)
	movb	699(%rdx), %r9b
	movb	%r9b, 731(%rsp)
	movb	700(%rdx), %r9b
	movb	%r9b, 732(%rsp)
	movb	701(%rdx), %r9b
	movb	%r9b, 733(%rsp)
	movb	702(%rdx), %r9b
	movb	%r9b, 734(%rsp)
	movb	703(%rdx), %r9b
	movb	%r9b, 735(%rsp)
	movb	704(%rdx), %r9b
	movb	%r9b, 736(%rsp)
	movb	705(%rdx), %r9b
	movb	%r9b, 737(%rsp)
	movb	706(%rdx), %r9b
	movb	%r9b, 738(%rsp)
	movb	707(%rdx), %r9b
	movb	%r9b, 739(%rsp)
	movb	708(%rdx), %r9b
	movb	%r9b, 740(%rsp)
	movb	709(%rdx), %r9b
	movb	%r9b, 741(%rsp)
	movb	710(%rdx), %r9b
	movb	%r9b, 742(%rsp)
	movb	711(%rdx), %r9b
	movb	%r9b, 743(%rsp)
	movb	712(%rdx), %r9b
	movb	%r9b, 744(%rsp)
	movb	713(%rdx), %r9b
	movb	%r9b, 745(%rsp)
	movb	714(%rdx), %r9b
	movb	%r9b, 746(%rsp)
	movb	715(%rdx), %r9b
	movb	%r9b, 747(%rsp)
	movb	716(%rdx), %r9b
	movb	%r9b, 748(%rsp)
	movb	717(%rdx), %r9b
	movb	%r9b, 749(%rsp)
	movb	718(%rdx), %r9b
	movb	%r9b, 750(%rsp)
	movb	719(%rdx), %r9b
	movb	%r9b, 751(%rsp)
	movb	720(%rdx), %r9b
	movb	%r9b, 752(%rsp)
	movb	721(%rdx), %r9b
	movb	%r9b, 753(%rsp)
	movb	722(%rdx), %r9b
	movb	%r9b, 754(%rsp)
	movb	723(%rdx), %r9b
	movb	%r9b, 755(%rsp)
	movb	724(%rdx), %r9b
	movb	%r9b, 756(%rsp)
	movb	725(%rdx), %r9b
	movb	%r9b, 757(%rsp)
	movb	726(%rdx), %r9b
	movb	%r9b, 758(%rsp)
	movb	727(%rdx), %r9b
	movb	%r9b, 759(%rsp)
	movb	728(%rdx), %r9b
	movb	%r9b, 760(%rsp)
	movb	729(%rdx), %r9b
	movb	%r9b, 761(%rsp)
	movb	730(%rdx), %r9b
	movb	%r9b, 762(%rsp)
	movb	731(%rdx), %r9b
	movb	%r9b, 763(%rsp)
	movb	732(%rdx), %r9b
	movb	%r9b, 764(%rsp)
	movb	733(%rdx), %r9b
	movb	%r9b, 765(%rsp)
	movb	734(%rdx), %r9b
	movb	%r9b, 766(%rsp)
	movb	735(%rdx), %r9b
	movb	%r9b, 767(%rsp)
	movb	736(%rdx), %r9b
	movb	%r9b, 768(%rsp)
	movb	737(%rdx), %r9b
	movb	%r9b, 769(%rsp)
	movb	738(%rdx), %r9b
	movb	%r9b, 770(%rsp)
	movb	739(%rdx), %r9b
	movb	%r9b, 771(%rsp)
	movb	740(%rdx), %r9b
	movb	%r9b, 772(%rsp)
	movb	741(%rdx), %r9b
	movb	%r9b, 773(%rsp)
	movb	742(%rdx), %r9b
	movb	%r9b, 774(%rsp)
	movb	743(%rdx), %r9b
	movb	%r9b, 775(%rsp)
	movb	744(%rdx), %r9b
	movb	%r9b, 776(%rsp)
	movb	745(%rdx), %r9b
	movb	%r9b, 777(%rsp)
	movb	746(%rdx), %r9b
	movb	%r9b, 778(%rsp)
	movb	747(%rdx), %r9b
	movb	%r9b, 779(%rsp)
	movb	748(%rdx), %r9b
	movb	%r9b, 780(%rsp)
	movb	749(%rdx), %r9b
	movb	%r9b, 781(%rsp)
	movb	750(%rdx), %r9b
	movb	%r9b, 782(%rsp)
	movb	751(%rdx), %r9b
	movb	%r9b, 783(%rsp)
	movb	752(%rdx), %r9b
	movb	%r9b, 784(%rsp)
	movb	753(%rdx), %r9b
	movb	%r9b, 785(%rsp)
	movb	754(%rdx), %r9b
	movb	%r9b, 786(%rsp)
	movb	755(%rdx), %r9b
	movb	%r9b, 787(%rsp)
	movb	756(%rdx), %r9b
	movb	%r9b, 788(%rsp)
	movb	757(%rdx), %r9b
	movb	%r9b, 789(%rsp)
	movb	758(%rdx), %r9b
	movb	%r9b, 790(%rsp)
	movb	759(%rdx), %r9b
	movb	%r9b, 791(%rsp)
	movb	760(%rdx), %r9b
	movb	%r9b, 792(%rsp)
	movb	761(%rdx), %r9b
	movb	%r9b, 793(%rsp)
	movb	762(%rdx), %r9b
	movb	%r9b, 794(%rsp)
	movb	763(%rdx), %r9b
	movb	%r9b, 795(%rsp)
	movb	764(%rdx), %r9b
	movb	%r9b, 796(%rsp)
	movb	765(%rdx), %r9b
	movb	%r9b, 797(%rsp)
	movb	766(%rdx), %r9b
	movb	%r9b, 798(%rsp)
	movb	767(%rdx), %r9b
	movb	%r9b, 799(%rsp)
	movb	768(%rdx), %r9b
	movb	%r9b, 800(%rsp)
	movb	769(%rdx), %r9b
	movb	%r9b, 801(%rsp)
	movb	770(%rdx), %r9b
	movb	%r9b, 802(%rsp)
	movb	771(%rdx), %r9b
	movb	%r9b, 803(%rsp)
	movb	772(%rdx), %r9b
	movb	%r9b, 804(%rsp)
	movb	773(%rdx), %r9b
	movb	%r9b, 805(%rsp)
	movb	774(%rdx), %r9b
	movb	%r9b, 806(%rsp)
	movb	775(%rdx), %r9b
	movb	%r9b, 807(%rsp)
	movb	776(%rdx), %r9b
	movb	%r9b, 808(%rsp)
	movb	777(%rdx), %r9b
	movb	%r9b, 809(%rsp)
	movb	778(%rdx), %r9b
	movb	%r9b, 810(%rsp)
	movb	779(%rdx), %r9b
	movb	%r9b, 811(%rsp)
	movb	780(%rdx), %r9b
	movb	%r9b, 812(%rsp)
	movb	781(%rdx), %r9b
	movb	%r9b, 813(%rsp)
	movb	782(%rdx), %r9b
	movb	%r9b, 814(%rsp)
	movb	783(%rdx), %r9b
	movb	%r9b, 815(%rsp)
	movb	784(%rdx), %r9b
	movb	%r9b, 816(%rsp)
	movb	785(%rdx), %r9b
	movb	%r9b, 817(%rsp)
	movb	786(%rdx), %r9b
	movb	%r9b, 818(%rsp)
	movb	787(%rdx), %r9b
	movb	%r9b, 819(%rsp)
	movb	788(%rdx), %r9b
	movb	%r9b, 820(%rsp)
	movb	789(%rdx), %r9b
	movb	%r9b, 821(%rsp)
	movb	790(%rdx), %r9b
	movb	%r9b, 822(%rsp)
	movb	791(%rdx), %r9b
	movb	%r9b, 823(%rsp)
	movb	792(%rdx), %r9b
	movb	%r9b, 824(%rsp)
	movb	793(%rdx), %r9b
	movb	%r9b, 825(%rsp)
	movb	794(%rdx), %r9b
	movb	%r9b, 826(%rsp)
	movb	795(%rdx), %r9b
	movb	%r9b, 827(%rsp)
	movb	796(%rdx), %r9b
	movb	%r9b, 828(%rsp)
	movb	797(%rdx), %r9b
	movb	%r9b, 829(%rsp)
	movb	798(%rdx), %r9b
	movb	%r9b, 830(%rsp)
	movb	799(%rdx), %r9b
	movb	%r9b, 831(%rsp)
	movb	800(%rdx), %r9b
	movb	%r9b, 832(%rsp)
	movb	801(%rdx), %r9b
	movb	%r9b, 833(%rsp)
	movb	802(%rdx), %r9b
	movb	%r9b, 834(%rsp)
	movb	803(%rdx), %r9b
	movb	%r9b, 835(%rsp)
	movb	804(%rdx), %r9b
	movb	%r9b, 836(%rsp)
	movb	805(%rdx), %r9b
	movb	%r9b, 837(%rsp)
	movb	806(%rdx), %r9b
	movb	%r9b, 838(%rsp)
	movb	807(%rdx), %r9b
	movb	%r9b, 839(%rsp)
	movb	808(%rdx), %r9b
	movb	%r9b, 840(%rsp)
	movb	809(%rdx), %r9b
	movb	%r9b, 841(%rsp)
	movb	810(%rdx), %r9b
	movb	%r9b, 842(%rsp)
	movb	811(%rdx), %r9b
	movb	%r9b, 843(%rsp)
	movb	812(%rdx), %r9b
	movb	%r9b, 844(%rsp)
	movb	813(%rdx), %r9b
	movb	%r9b, 845(%rsp)
	movb	814(%rdx), %r9b
	movb	%r9b, 846(%rsp)
	movb	815(%rdx), %r9b
	movb	%r9b, 847(%rsp)
	movb	816(%rdx), %r9b
	movb	%r9b, 848(%rsp)
	movb	817(%rdx), %r9b
	movb	%r9b, 849(%rsp)
	movb	818(%rdx), %r9b
	movb	%r9b, 850(%rsp)
	movb	819(%rdx), %r9b
	movb	%r9b, 851(%rsp)
	movb	820(%rdx), %r9b
	movb	%r9b, 852(%rsp)
	movb	821(%rdx), %r9b
	movb	%r9b, 853(%rsp)
	movb	822(%rdx), %r9b
	movb	%r9b, 854(%rsp)
	movb	823(%rdx), %r9b
	movb	%r9b, 855(%rsp)
	movb	824(%rdx), %r9b
	movb	%r9b, 856(%rsp)
	movb	825(%rdx), %r9b
	movb	%r9b, 857(%rsp)
	movb	826(%rdx), %r9b
	movb	%r9b, 858(%rsp)
	movb	827(%rdx), %r9b
	movb	%r9b, 859(%rsp)
	movb	828(%rdx), %r9b
	movb	%r9b, 860(%rsp)
	movb	829(%rdx), %r9b
	movb	%r9b, 861(%rsp)
	movb	830(%rdx), %r9b
	movb	%r9b, 862(%rsp)
	movb	831(%rdx), %r9b
	movb	%r9b, 863(%rsp)
	movb	832(%rdx), %r9b
	movb	%r9b, 864(%rsp)
	movb	833(%rdx), %r9b
	movb	%r9b, 865(%rsp)
	movb	834(%rdx), %r9b
	movb	%r9b, 866(%rsp)
	movb	835(%rdx), %r9b
	movb	%r9b, 867(%rsp)
	movb	836(%rdx), %r9b
	movb	%r9b, 868(%rsp)
	movb	837(%rdx), %r9b
	movb	%r9b, 869(%rsp)
	movb	838(%rdx), %r9b
	movb	%r9b, 870(%rsp)
	movb	839(%rdx), %r9b
	movb	%r9b, 871(%rsp)
	movb	840(%rdx), %r9b
	movb	%r9b, 872(%rsp)
	movb	841(%rdx), %r9b
	movb	%r9b, 873(%rsp)
	movb	842(%rdx), %r9b
	movb	%r9b, 874(%rsp)
	movb	843(%rdx), %r9b
	movb	%r9b, 875(%rsp)
	movb	844(%rdx), %r9b
	movb	%r9b, 876(%rsp)
	movb	845(%rdx), %r9b
	movb	%r9b, 877(%rsp)
	movb	846(%rdx), %r9b
	movb	%r9b, 878(%rsp)
	movb	847(%rdx), %r9b
	movb	%r9b, 879(%rsp)
	movb	848(%rdx), %r9b
	movb	%r9b, 880(%rsp)
	movb	849(%rdx), %r9b
	movb	%r9b, 881(%rsp)
	movb	850(%rdx), %r9b
	movb	%r9b, 882(%rsp)
	movb	851(%rdx), %r9b
	movb	%r9b, 883(%rsp)
	movb	852(%rdx), %r9b
	movb	%r9b, 884(%rsp)
	movb	853(%rdx), %r9b
	movb	%r9b, 885(%rsp)
	movb	854(%rdx), %r9b
	movb	%r9b, 886(%rsp)
	movb	855(%rdx), %r9b
	movb	%r9b, 887(%rsp)
	movb	856(%rdx), %r9b
	movb	%r9b, 888(%rsp)
	movb	857(%rdx), %r9b
	movb	%r9b, 889(%rsp)
	movb	858(%rdx), %r9b
	movb	%r9b, 890(%rsp)
	movb	859(%rdx), %r9b
	movb	%r9b, 891(%rsp)
	movb	860(%rdx), %r9b
	movb	%r9b, 892(%rsp)
	movb	861(%rdx), %r9b
	movb	%r9b, 893(%rsp)
	movb	862(%rdx), %r9b
	movb	%r9b, 894(%rsp)
	movb	863(%rdx), %r9b
	movb	%r9b, 895(%rsp)
	movb	864(%rdx), %r9b
	movb	%r9b, 896(%rsp)
	movb	865(%rdx), %r9b
	movb	%r9b, 897(%rsp)
	movb	866(%rdx), %r9b
	movb	%r9b, 898(%rsp)
	movb	867(%rdx), %r9b
	movb	%r9b, 899(%rsp)
	movb	868(%rdx), %r9b
	movb	%r9b, 900(%rsp)
	movb	869(%rdx), %r9b
	movb	%r9b, 901(%rsp)
	movb	870(%rdx), %r9b
	movb	%r9b, 902(%rsp)
	movb	871(%rdx), %r9b
	movb	%r9b, 903(%rsp)
	movb	872(%rdx), %r9b
	movb	%r9b, 904(%rsp)
	movb	873(%rdx), %r9b
	movb	%r9b, 905(%rsp)
	movb	874(%rdx), %r9b
	movb	%r9b, 906(%rsp)
	movb	875(%rdx), %r9b
	movb	%r9b, 907(%rsp)
	movb	876(%rdx), %r9b
	movb	%r9b, 908(%rsp)
	movb	877(%rdx), %r9b
	movb	%r9b, 909(%rsp)
	movb	878(%rdx), %r9b
	movb	%r9b, 910(%rsp)
	movb	879(%rdx), %r9b
	movb	%r9b, 911(%rsp)
	movb	880(%rdx), %r9b
	movb	%r9b, 912(%rsp)
	movb	881(%rdx), %r9b
	movb	%r9b, 913(%rsp)
	movb	882(%rdx), %r9b
	movb	%r9b, 914(%rsp)
	movb	883(%rdx), %r9b
	movb	%r9b, 915(%rsp)
	movb	884(%rdx), %r9b
	movb	%r9b, 916(%rsp)
	movb	885(%rdx), %r9b
	movb	%r9b, 917(%rsp)
	movb	886(%rdx), %r9b
	movb	%r9b, 918(%rsp)
	movb	887(%rdx), %r9b
	movb	%r9b, 919(%rsp)
	movb	888(%rdx), %r9b
	movb	%r9b, 920(%rsp)
	movb	889(%rdx), %r9b
	movb	%r9b, 921(%rsp)
	movb	890(%rdx), %r9b
	movb	%r9b, 922(%rsp)
	movb	891(%rdx), %r9b
	movb	%r9b, 923(%rsp)
	movb	892(%rdx), %r9b
	movb	%r9b, 924(%rsp)
	movb	893(%rdx), %r9b
	movb	%r9b, 925(%rsp)
	movb	894(%rdx), %r9b
	movb	%r9b, 926(%rsp)
	movb	895(%rdx), %r9b
	movb	%r9b, 927(%rsp)
	movb	896(%rdx), %r9b
	movb	%r9b, 928(%rsp)
	movb	897(%rdx), %r9b
	movb	%r9b, 929(%rsp)
	movb	898(%rdx), %r9b
	movb	%r9b, 930(%rsp)
	movb	899(%rdx), %r9b
	movb	%r9b, 931(%rsp)
	movb	900(%rdx), %r9b
	movb	%r9b, 932(%rsp)
	movb	901(%rdx), %r9b
	movb	%r9b, 933(%rsp)
	movb	902(%rdx), %r9b
	movb	%r9b, 934(%rsp)
	movb	903(%rdx), %r9b
	movb	%r9b, 935(%rsp)
	movb	904(%rdx), %r9b
	movb	%r9b, 936(%rsp)
	movb	905(%rdx), %r9b
	movb	%r9b, 937(%rsp)
	movb	906(%rdx), %r9b
	movb	%r9b, 938(%rsp)
	movb	907(%rdx), %r9b
	movb	%r9b, 939(%rsp)
	movb	908(%rdx), %r9b
	movb	%r9b, 940(%rsp)
	movb	909(%rdx), %r9b
	movb	%r9b, 941(%rsp)
	movb	910(%rdx), %r9b
	movb	%r9b, 942(%rsp)
	movb	911(%rdx), %r9b
	movb	%r9b, 943(%rsp)
	movb	912(%rdx), %r9b
	movb	%r9b, 944(%rsp)
	movb	913(%rdx), %r9b
	movb	%r9b, 945(%rsp)
	movb	914(%rdx), %r9b
	movb	%r9b, 946(%rsp)
	movb	915(%rdx), %r9b
	movb	%r9b, 947(%rsp)
	movb	916(%rdx), %r9b
	movb	%r9b, 948(%rsp)
	movb	917(%rdx), %r9b
	movb	%r9b, 949(%rsp)
	movb	918(%rdx), %r9b
	movb	%r9b, 950(%rsp)
	movb	919(%rdx), %r9b
	movb	%r9b, 951(%rsp)
	movb	920(%rdx), %r9b
	movb	%r9b, 952(%rsp)
	movb	921(%rdx), %r9b
	movb	%r9b, 953(%rsp)
	movb	922(%rdx), %r9b
	movb	%r9b, 954(%rsp)
	movb	923(%rdx), %r9b
	movb	%r9b, 955(%rsp)
	movb	924(%rdx), %r9b
	movb	%r9b, 956(%rsp)
	movb	925(%rdx), %r9b
	movb	%r9b, 957(%rsp)
	movb	926(%rdx), %r9b
	movb	%r9b, 958(%rsp)
	movb	927(%rdx), %r9b
	movb	%r9b, 959(%rsp)
	movb	928(%rdx), %r9b
	movb	%r9b, 960(%rsp)
	movb	929(%rdx), %r9b
	movb	%r9b, 961(%rsp)
	movb	930(%rdx), %r9b
	movb	%r9b, 962(%rsp)
	movb	931(%rdx), %r9b
	movb	%r9b, 963(%rsp)
	movb	932(%rdx), %r9b
	movb	%r9b, 964(%rsp)
	movb	933(%rdx), %r9b
	movb	%r9b, 965(%rsp)
	movb	934(%rdx), %r9b
	movb	%r9b, 966(%rsp)
	movb	935(%rdx), %r9b
	movb	%r9b, 967(%rsp)
	movb	936(%rdx), %r9b
	movb	%r9b, 968(%rsp)
	movb	937(%rdx), %r9b
	movb	%r9b, 969(%rsp)
	movb	938(%rdx), %r9b
	movb	%r9b, 970(%rsp)
	movb	939(%rdx), %r9b
	movb	%r9b, 971(%rsp)
	movb	940(%rdx), %r9b
	movb	%r9b, 972(%rsp)
	movb	941(%rdx), %r9b
	movb	%r9b, 973(%rsp)
	movb	942(%rdx), %r9b
	movb	%r9b, 974(%rsp)
	movb	943(%rdx), %r9b
	movb	%r9b, 975(%rsp)
	movb	944(%rdx), %r9b
	movb	%r9b, 976(%rsp)
	movb	945(%rdx), %r9b
	movb	%r9b, 977(%rsp)
	movb	946(%rdx), %r9b
	movb	%r9b, 978(%rsp)
	movb	947(%rdx), %r9b
	movb	%r9b, 979(%rsp)
	movb	948(%rdx), %r9b
	movb	%r9b, 980(%rsp)
	movb	949(%rdx), %r9b
	movb	%r9b, 981(%rsp)
	movb	950(%rdx), %r9b
	movb	%r9b, 982(%rsp)
	movb	951(%rdx), %r9b
	movb	%r9b, 983(%rsp)
	movb	952(%rdx), %r9b
	movb	%r9b, 984(%rsp)
	movb	953(%rdx), %r9b
	movb	%r9b, 985(%rsp)
	movb	954(%rdx), %r9b
	movb	%r9b, 986(%rsp)
	movb	955(%rdx), %r9b
	movb	%r9b, 987(%rsp)
	movb	956(%rdx), %r9b
	movb	%r9b, 988(%rsp)
	movb	957(%rdx), %r9b
	movb	%r9b, 989(%rsp)
	movb	958(%rdx), %r9b
	movb	%r9b, 990(%rsp)
	movb	959(%rdx), %r9b
	movb	%r9b, 991(%rsp)
	movb	960(%rdx), %r9b
	movb	%r9b, 992(%rsp)
	movb	961(%rdx), %r9b
	movb	%r9b, 993(%rsp)
	movb	962(%rdx), %r9b
	movb	%r9b, 994(%rsp)
	movb	963(%rdx), %r9b
	movb	%r9b, 995(%rsp)
	movb	964(%rdx), %r9b
	movb	%r9b, 996(%rsp)
	movb	965(%rdx), %r9b
	movb	%r9b, 997(%rsp)
	movb	966(%rdx), %r9b
	movb	%r9b, 998(%rsp)
	movb	967(%rdx), %r9b
	movb	%r9b, 999(%rsp)
	movb	968(%rdx), %r9b
	movb	%r9b, 1000(%rsp)
	movb	969(%rdx), %r9b
	movb	%r9b, 1001(%rsp)
	movb	970(%rdx), %r9b
	movb	%r9b, 1002(%rsp)
	movb	971(%rdx), %r9b
	movb	%r9b, 1003(%rsp)
	movb	972(%rdx), %r9b
	movb	%r9b, 1004(%rsp)
	movb	973(%rdx), %r9b
	movb	%r9b, 1005(%rsp)
	movb	974(%rdx), %r9b
	movb	%r9b, 1006(%rsp)
	movb	975(%rdx), %r9b
	movb	%r9b, 1007(%rsp)
	movb	976(%rdx), %r9b
	movb	%r9b, 1008(%rsp)
	movb	977(%rdx), %r9b
	movb	%r9b, 1009(%rsp)
	movb	978(%rdx), %r9b
	movb	%r9b, 1010(%rsp)
	movb	979(%rdx), %r9b
	movb	%r9b, 1011(%rsp)
	movb	980(%rdx), %r9b
	movb	%r9b, 1012(%rsp)
	movb	981(%rdx), %r9b
	movb	%r9b, 1013(%rsp)
	movb	982(%rdx), %r9b
	movb	%r9b, 1014(%rsp)
	movb	983(%rdx), %r9b
	movb	%r9b, 1015(%rsp)
	movb	984(%rdx), %r9b
	movb	%r9b, 1016(%rsp)
	movb	985(%rdx), %r9b
	movb	%r9b, 1017(%rsp)
	movb	986(%rdx), %r9b
	movb	%r9b, 1018(%rsp)
	movb	987(%rdx), %r9b
	movb	%r9b, 1019(%rsp)
	movb	988(%rdx), %r9b
	movb	%r9b, 1020(%rsp)
	movb	989(%rdx), %r9b
	movb	%r9b, 1021(%rsp)
	movb	990(%rdx), %r9b
	movb	%r9b, 1022(%rsp)
	movb	991(%rdx), %r9b
	movb	%r9b, 1023(%rsp)
	movb	992(%rdx), %r9b
	movb	%r9b, 1024(%rsp)
	movb	993(%rdx), %r9b
	movb	%r9b, 1025(%rsp)
	movb	994(%rdx), %r9b
	movb	%r9b, 1026(%rsp)
	movb	995(%rdx), %r9b
	movb	%r9b, 1027(%rsp)
	movb	996(%rdx), %r9b
	movb	%r9b, 1028(%rsp)
	movb	997(%rdx), %r9b
	movb	%r9b, 1029(%rsp)
	movb	998(%rdx), %r9b
	movb	%r9b, 1030(%rsp)
	movb	999(%rdx), %r9b
	movb	%r9b, 1031(%rsp)
	movb	1000(%rdx), %r9b
	movb	%r9b, 1032(%rsp)
	movb	1001(%rdx), %r9b
	movb	%r9b, 1033(%rsp)
	movb	1002(%rdx), %r9b
	movb	%r9b, 1034(%rsp)
	movb	1003(%rdx), %r9b
	movb	%r9b, 1035(%rsp)
	movb	1004(%rdx), %r9b
	movb	%r9b, 1036(%rsp)
	movb	1005(%rdx), %r9b
	movb	%r9b, 1037(%rsp)
	movb	1006(%rdx), %r9b
	movb	%r9b, 1038(%rsp)
	movb	1007(%rdx), %r9b
	movb	%r9b, 1039(%rsp)
	movb	1008(%rdx), %r9b
	movb	%r9b, 1040(%rsp)
	movb	1009(%rdx), %r9b
	movb	%r9b, 1041(%rsp)
	movb	1010(%rdx), %r9b
	movb	%r9b, 1042(%rsp)
	movb	1011(%rdx), %r9b
	movb	%r9b, 1043(%rsp)
	movb	1012(%rdx), %r9b
	movb	%r9b, 1044(%rsp)
	movb	1013(%rdx), %r9b
	movb	%r9b, 1045(%rsp)
	movb	1014(%rdx), %r9b
	movb	%r9b, 1046(%rsp)
	movb	1015(%rdx), %r9b
	movb	%r9b, 1047(%rsp)
	movb	1016(%rdx), %r9b
	movb	%r9b, 1048(%rsp)
	movb	1017(%rdx), %r9b
	movb	%r9b, 1049(%rsp)
	movb	1018(%rdx), %r9b
	movb	%r9b, 1050(%rsp)
	movb	1019(%rdx), %r9b
	movb	%r9b, 1051(%rsp)
	movb	1020(%rdx), %r9b
	movb	%r9b, 1052(%rsp)
	movb	1021(%rdx), %r9b
	movb	%r9b, 1053(%rsp)
	movb	1022(%rdx), %r9b
	movb	%r9b, 1054(%rsp)
	movb	1023(%rdx), %r9b
	movb	%r9b, 1055(%rsp)
	movb	1024(%rdx), %r9b
	movb	%r9b, 1056(%rsp)
	movb	1025(%rdx), %r9b
	movb	%r9b, 1057(%rsp)
	movb	1026(%rdx), %r9b
	movb	%r9b, 1058(%rsp)
	movb	1027(%rdx), %r9b
	movb	%r9b, 1059(%rsp)
	movb	1028(%rdx), %r9b
	movb	%r9b, 1060(%rsp)
	movb	1029(%rdx), %r9b
	movb	%r9b, 1061(%rsp)
	movb	1030(%rdx), %r9b
	movb	%r9b, 1062(%rsp)
	movb	1031(%rdx), %r9b
	movb	%r9b, 1063(%rsp)
	movb	1032(%rdx), %r9b
	movb	%r9b, 1064(%rsp)
	movb	1033(%rdx), %r9b
	movb	%r9b, 1065(%rsp)
	movb	1034(%rdx), %r9b
	movb	%r9b, 1066(%rsp)
	movb	1035(%rdx), %r9b
	movb	%r9b, 1067(%rsp)
	movb	1036(%rdx), %r9b
	movb	%r9b, 1068(%rsp)
	movb	1037(%rdx), %r9b
	movb	%r9b, 1069(%rsp)
	movb	1038(%rdx), %r9b
	movb	%r9b, 1070(%rsp)
	movb	1039(%rdx), %r9b
	movb	%r9b, 1071(%rsp)
	movb	1040(%rdx), %r9b
	movb	%r9b, 1072(%rsp)
	movb	1041(%rdx), %r9b
	movb	%r9b, 1073(%rsp)
	movb	1042(%rdx), %r9b
	movb	%r9b, 1074(%rsp)
	movb	1043(%rdx), %r9b
	movb	%r9b, 1075(%rsp)
	movb	1044(%rdx), %r9b
	movb	%r9b, 1076(%rsp)
	movb	1045(%rdx), %r9b
	movb	%r9b, 1077(%rsp)
	movb	1046(%rdx), %r9b
	movb	%r9b, 1078(%rsp)
	movb	1047(%rdx), %r9b
	movb	%r9b, 1079(%rsp)
	movb	1048(%rdx), %r9b
	movb	%r9b, 1080(%rsp)
	movb	1049(%rdx), %r9b
	movb	%r9b, 1081(%rsp)
	movb	1050(%rdx), %r9b
	movb	%r9b, 1082(%rsp)
	movb	1051(%rdx), %r9b
	movb	%r9b, 1083(%rsp)
	movb	1052(%rdx), %r9b
	movb	%r9b, 1084(%rsp)
	movb	1053(%rdx), %r9b
	movb	%r9b, 1085(%rsp)
	movb	1054(%rdx), %r9b
	movb	%r9b, 1086(%rsp)
	movb	1055(%rdx), %r9b
	movb	%r9b, 1087(%rsp)
	movb	1056(%rdx), %r9b
	movb	%r9b, 1088(%rsp)
	movb	1057(%rdx), %r9b
	movb	%r9b, 1089(%rsp)
	movb	1058(%rdx), %r9b
	movb	%r9b, 1090(%rsp)
	movb	1059(%rdx), %r9b
	movb	%r9b, 1091(%rsp)
	movb	1060(%rdx), %r9b
	movb	%r9b, 1092(%rsp)
	movb	1061(%rdx), %r9b
	movb	%r9b, 1093(%rsp)
	movb	1062(%rdx), %r9b
	movb	%r9b, 1094(%rsp)
	movb	1063(%rdx), %r9b
	movb	%r9b, 1095(%rsp)
	movb	1064(%rdx), %r9b
	movb	%r9b, 1096(%rsp)
	movb	1065(%rdx), %r9b
	movb	%r9b, 1097(%rsp)
	movb	1066(%rdx), %r9b
	movb	%r9b, 1098(%rsp)
	movb	1067(%rdx), %r9b
	movb	%r9b, 1099(%rsp)
	movb	1068(%rdx), %r9b
	movb	%r9b, 1100(%rsp)
	movb	1069(%rdx), %r9b
	movb	%r9b, 1101(%rsp)
	movb	1070(%rdx), %r9b
	movb	%r9b, 1102(%rsp)
	movb	1071(%rdx), %r9b
	movb	%r9b, 1103(%rsp)
	movb	1072(%rdx), %r9b
	movb	%r9b, 1104(%rsp)
	movb	1073(%rdx), %r9b
	movb	%r9b, 1105(%rsp)
	movb	1074(%rdx), %r9b
	movb	%r9b, 1106(%rsp)
	movb	1075(%rdx), %r9b
	movb	%r9b, 1107(%rsp)
	movb	1076(%rdx), %r9b
	movb	%r9b, 1108(%rsp)
	movb	1077(%rdx), %r9b
	movb	%r9b, 1109(%rsp)
	movb	1078(%rdx), %r9b
	movb	%r9b, 1110(%rsp)
	movb	1079(%rdx), %r9b
	movb	%r9b, 1111(%rsp)
	movb	1080(%rdx), %r9b
	movb	%r9b, 1112(%rsp)
	movb	1081(%rdx), %r9b
	movb	%r9b, 1113(%rsp)
	movb	1082(%rdx), %r9b
	movb	%r9b, 1114(%rsp)
	movb	1083(%rdx), %r9b
	movb	%r9b, 1115(%rsp)
	movb	1084(%rdx), %r9b
	movb	%r9b, 1116(%rsp)
	movb	1085(%rdx), %r9b
	movb	%r9b, 1117(%rsp)
	movb	1086(%rdx), %r9b
	movb	%r9b, 1118(%rsp)
	movb	1087(%rdx), %r9b
	movb	%r9b, 1119(%rsp)
	movb	1088(%rdx), %r9b
	movb	%r9b, 1120(%rsp)
	movb	1089(%rdx), %r9b
	movb	%r9b, 1121(%rsp)
	movb	1090(%rdx), %r9b
	movb	%r9b, 1122(%rsp)
	movb	1091(%rdx), %r9b
	movb	%r9b, 1123(%rsp)
	movb	1092(%rdx), %r9b
	movb	%r9b, 1124(%rsp)
	movb	1093(%rdx), %r9b
	movb	%r9b, 1125(%rsp)
	movb	1094(%rdx), %r9b
	movb	%r9b, 1126(%rsp)
	movb	1095(%rdx), %r9b
	movb	%r9b, 1127(%rsp)
	movb	1096(%rdx), %r9b
	movb	%r9b, 1128(%rsp)
	movb	1097(%rdx), %r9b
	movb	%r9b, 1129(%rsp)
	movb	1098(%rdx), %r9b
	movb	%r9b, 1130(%rsp)
	movb	1099(%rdx), %r9b
	movb	%r9b, 1131(%rsp)
	movb	1100(%rdx), %r9b
	movb	%r9b, 1132(%rsp)
	movb	1101(%rdx), %r9b
	movb	%r9b, 1133(%rsp)
	movb	1102(%rdx), %r9b
	movb	%r9b, 1134(%rsp)
	movb	1103(%rdx), %r9b
	movb	%r9b, 1135(%rsp)
	movb	1104(%rdx), %r9b
	movb	%r9b, 1136(%rsp)
	movb	1105(%rdx), %r9b
	movb	%r9b, 1137(%rsp)
	movb	1106(%rdx), %r9b
	movb	%r9b, 1138(%rsp)
	movb	1107(%rdx), %r9b
	movb	%r9b, 1139(%rsp)
	movb	1108(%rdx), %r9b
	movb	%r9b, 1140(%rsp)
	movb	1109(%rdx), %r9b
	movb	%r9b, 1141(%rsp)
	movb	1110(%rdx), %r9b
	movb	%r9b, 1142(%rsp)
	movb	1111(%rdx), %r9b
	movb	%r9b, 1143(%rsp)
	movb	1112(%rdx), %r9b
	movb	%r9b, 1144(%rsp)
	movb	1113(%rdx), %r9b
	movb	%r9b, 1145(%rsp)
	movb	1114(%rdx), %r9b
	movb	%r9b, 1146(%rsp)
	movb	1115(%rdx), %r9b
	movb	%r9b, 1147(%rsp)
	movb	1116(%rdx), %r9b
	movb	%r9b, 1148(%rsp)
	movb	1117(%rdx), %r9b
	movb	%r9b, 1149(%rsp)
	movb	1118(%rdx), %r9b
	movb	%r9b, 1150(%rsp)
	movb	1119(%rdx), %r9b
	movb	%r9b, 1151(%rsp)
	movb	1120(%rdx), %r9b
	movb	%r9b, 1152(%rsp)
	movb	1121(%rdx), %r9b
	movb	%r9b, 1153(%rsp)
	movb	1122(%rdx), %r9b
	movb	%r9b, 1154(%rsp)
	movb	1123(%rdx), %r9b
	movb	%r9b, 1155(%rsp)
	movb	1124(%rdx), %r9b
	movb	%r9b, 1156(%rsp)
	movb	1125(%rdx), %r9b
	movb	%r9b, 1157(%rsp)
	movb	1126(%rdx), %r9b
	movb	%r9b, 1158(%rsp)
	movb	1127(%rdx), %r9b
	movb	%r9b, 1159(%rsp)
	movb	1128(%rdx), %r9b
	movb	%r9b, 1160(%rsp)
	movb	1129(%rdx), %r9b
	movb	%r9b, 1161(%rsp)
	movb	1130(%rdx), %r9b
	movb	%r9b, 1162(%rsp)
	movb	1131(%rdx), %r9b
	movb	%r9b, 1163(%rsp)
	movb	1132(%rdx), %r9b
	movb	%r9b, 1164(%rsp)
	movb	1133(%rdx), %r9b
	movb	%r9b, 1165(%rsp)
	movb	1134(%rdx), %r9b
	movb	%r9b, 1166(%rsp)
	movb	1135(%rdx), %r9b
	movb	%r9b, 1167(%rsp)
	movb	1136(%rdx), %r9b
	movb	%r9b, 1168(%rsp)
	movb	1137(%rdx), %r9b
	movb	%r9b, 1169(%rsp)
	movb	1138(%rdx), %r9b
	movb	%r9b, 1170(%rsp)
	movb	1139(%rdx), %r9b
	movb	%r9b, 1171(%rsp)
	movb	1140(%rdx), %r9b
	movb	%r9b, 1172(%rsp)
	movb	1141(%rdx), %r9b
	movb	%r9b, 1173(%rsp)
	movb	1142(%rdx), %r9b
	movb	%r9b, 1174(%rsp)
	movb	1143(%rdx), %r9b
	movb	%r9b, 1175(%rsp)
	movb	1144(%rdx), %r9b
	movb	%r9b, 1176(%rsp)
	movb	1145(%rdx), %r9b
	movb	%r9b, 1177(%rsp)
	movb	1146(%rdx), %r9b
	movb	%r9b, 1178(%rsp)
	movb	1147(%rdx), %r9b
	movb	%r9b, 1179(%rsp)
	movb	1148(%rdx), %r9b
	movb	%r9b, 1180(%rsp)
	movb	1149(%rdx), %r9b
	movb	%r9b, 1181(%rsp)
	movb	1150(%rdx), %r9b
	movb	%r9b, 1182(%rsp)
	movb	1151(%rdx), %r9b
	movb	%r9b, 1183(%rsp)
	movb	1152(%rdx), %r9b
	movb	%r9b, 1184(%rsp)
	movb	1153(%rdx), %r9b
	movb	%r9b, 1185(%rsp)
	movb	1154(%rdx), %r9b
	movb	%r9b, 1186(%rsp)
	movb	1155(%rdx), %r9b
	movb	%r9b, 1187(%rsp)
	movb	1156(%rdx), %r9b
	movb	%r9b, 1188(%rsp)
	movb	1157(%rdx), %r9b
	movb	%r9b, 1189(%rsp)
	movb	1158(%rdx), %r9b
	movb	%r9b, 1190(%rsp)
	movb	1159(%rdx), %r9b
	movb	%r9b, 1191(%rsp)
	movb	1160(%rdx), %r9b
	movb	%r9b, 1192(%rsp)
	movb	1161(%rdx), %r9b
	movb	%r9b, 1193(%rsp)
	movb	1162(%rdx), %r9b
	movb	%r9b, 1194(%rsp)
	movb	1163(%rdx), %r9b
	movb	%r9b, 1195(%rsp)
	movb	1164(%rdx), %r9b
	movb	%r9b, 1196(%rsp)
	movb	1165(%rdx), %r9b
	movb	%r9b, 1197(%rsp)
	movb	1166(%rdx), %r9b
	movb	%r9b, 1198(%rsp)
	movb	1167(%rdx), %r9b
	movb	%r9b, 1199(%rsp)
	movb	1168(%rdx), %r9b
	movb	%r9b, 1200(%rsp)
	movb	1169(%rdx), %r9b
	movb	%r9b, 1201(%rsp)
	movb	1170(%rdx), %r9b
	movb	%r9b, 1202(%rsp)
	movb	1171(%rdx), %r9b
	movb	%r9b, 1203(%rsp)
	movb	1172(%rdx), %r9b
	movb	%r9b, 1204(%rsp)
	movb	1173(%rdx), %r9b
	movb	%r9b, 1205(%rsp)
	movb	1174(%rdx), %r9b
	movb	%r9b, 1206(%rsp)
	movb	1175(%rdx), %r9b
	movb	%r9b, 1207(%rsp)
	movb	1176(%rdx), %r9b
	movb	%r9b, 1208(%rsp)
	movb	1177(%rdx), %r9b
	movb	%r9b, 1209(%rsp)
	movb	1178(%rdx), %r9b
	movb	%r9b, 1210(%rsp)
	movb	1179(%rdx), %r9b
	movb	%r9b, 1211(%rsp)
	movb	1180(%rdx), %r9b
	movb	%r9b, 1212(%rsp)
	movb	1181(%rdx), %r9b
	movb	%r9b, 1213(%rsp)
	movb	1182(%rdx), %r9b
	movb	%r9b, 1214(%rsp)
	movb	1183(%rdx), %r9b
	movb	%r9b, 1215(%rsp)
	movb	1184(%rdx), %r9b
	movb	%r9b, 1216(%rsp)
	movb	1185(%rdx), %r9b
	movb	%r9b, 1217(%rsp)
	movb	1186(%rdx), %r9b
	movb	%r9b, 1218(%rsp)
	movb	1187(%rdx), %r9b
	movb	%r9b, 1219(%rsp)
	movb	1188(%rdx), %r9b
	movb	%r9b, 1220(%rsp)
	movb	1189(%rdx), %r9b
	movb	%r9b, 1221(%rsp)
	movb	1190(%rdx), %r9b
	movb	%r9b, 1222(%rsp)
	movb	1191(%rdx), %r9b
	movb	%r9b, 1223(%rsp)
	movb	1192(%rdx), %r9b
	movb	%r9b, 1224(%rsp)
	movb	1193(%rdx), %r9b
	movb	%r9b, 1225(%rsp)
	movb	1194(%rdx), %r9b
	movb	%r9b, 1226(%rsp)
	movb	1195(%rdx), %r9b
	movb	%r9b, 1227(%rsp)
	movb	1196(%rdx), %r9b
	movb	%r9b, 1228(%rsp)
	movb	1197(%rdx), %r9b
	movb	%r9b, 1229(%rsp)
	movb	1198(%rdx), %r9b
	movb	%r9b, 1230(%rsp)
	movb	1199(%rdx), %r9b
	movb	%r9b, 1231(%rsp)
	movb	1200(%rdx), %r9b
	movb	%r9b, 1232(%rsp)
	movb	1201(%rdx), %r9b
	movb	%r9b, 1233(%rsp)
	movb	1202(%rdx), %r9b
	movb	%r9b, 1234(%rsp)
	movb	1203(%rdx), %r9b
	movb	%r9b, 1235(%rsp)
	movb	1204(%rdx), %r9b
	movb	%r9b, 1236(%rsp)
	movb	1205(%rdx), %r9b
	movb	%r9b, 1237(%rsp)
	movb	1206(%rdx), %r9b
	movb	%r9b, 1238(%rsp)
	movb	1207(%rdx), %r9b
	movb	%r9b, 1239(%rsp)
	movb	1208(%rdx), %r9b
	movb	%r9b, 1240(%rsp)
	movb	1209(%rdx), %r9b
	movb	%r9b, 1241(%rsp)
	movb	1210(%rdx), %r9b
	movb	%r9b, 1242(%rsp)
	movb	1211(%rdx), %r9b
	movb	%r9b, 1243(%rsp)
	movb	1212(%rdx), %r9b
	movb	%r9b, 1244(%rsp)
	movb	1213(%rdx), %r9b
	movb	%r9b, 1245(%rsp)
	movb	1214(%rdx), %r9b
	movb	%r9b, 1246(%rsp)
	movb	1215(%rdx), %r9b
	movb	%r9b, 1247(%rsp)
	movb	1216(%rdx), %r9b
	movb	%r9b, 1248(%rsp)
	movb	1217(%rdx), %r9b
	movb	%r9b, 1249(%rsp)
	movb	1218(%rdx), %r9b
	movb	%r9b, 1250(%rsp)
	movb	1219(%rdx), %r9b
	movb	%r9b, 1251(%rsp)
	movb	1220(%rdx), %r9b
	movb	%r9b, 1252(%rsp)
	movb	1221(%rdx), %r9b
	movb	%r9b, 1253(%rsp)
	movb	1222(%rdx), %r9b
	movb	%r9b, 1254(%rsp)
	movb	1223(%rdx), %dl
	movb	%dl, 1255(%rsp)
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
	movl	1316(%rsp,%rax,4), %r10d
	movl	$15, %eax
	subl	%r10d, %eax
	leaq	32(%rsp,%rdx), %rcx
	movl	%eax, %esi
	movq	%r8, %rdi
	movq	%r11, %r8
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkfromsig$5:
	leaq	24(%rsp), %rsp
	movq	%r8, %r11
	movq	1264(%rsp), %r8
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
	leaq	1280(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$1, 16(%rcx)
	movl	20(%r11), %ecx
	leaq	1280(%rsp), %rdx
	movl	%ecx, 20(%rdx)
	movq	1256(%rsp), %rcx
	movq	%r11, 1256(%rsp)
	leaq	1280(%rsp), %rdx
	leaq	32(%rsp), %rax
	movq	%rcx, %rsi
	movq	%r8, %rdi
	movq	%rdx, %r8
	movq	%rax, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkfromsig$2:
	leaq	56(%rsp), %rsp
	movq	%rcx, %rdx
	movq	1256(%rsp), %rcx
	ret
.Lwots_sign$1:
	leaq	84(%rsp), %rsi
	movq	%rsi, %rdi
	movq	$0, %rdx
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_sign$108
.Lwots_sign$109:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$108:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$109
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, (%rdi)
	jmp 	.Lwots_sign$106
.Lwots_sign$107:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$106:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$107
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 4(%rdi)
	jmp 	.Lwots_sign$104
.Lwots_sign$105:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$104:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$105
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 8(%rdi)
	jmp 	.Lwots_sign$102
.Lwots_sign$103:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$102:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$103
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 12(%rdi)
	jmp 	.Lwots_sign$100
.Lwots_sign$101:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$100:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$101
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 16(%rdi)
	jmp 	.Lwots_sign$98
.Lwots_sign$99:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$98:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$99
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 20(%rdi)
	jmp 	.Lwots_sign$96
.Lwots_sign$97:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$96:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$97
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 24(%rdi)
	jmp 	.Lwots_sign$94
.Lwots_sign$95:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$94:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$95
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 28(%rdi)
	jmp 	.Lwots_sign$92
.Lwots_sign$93:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$92:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$93
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 32(%rdi)
	jmp 	.Lwots_sign$90
.Lwots_sign$91:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$90:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$91
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 36(%rdi)
	jmp 	.Lwots_sign$88
.Lwots_sign$89:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$88:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$89
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 40(%rdi)
	jmp 	.Lwots_sign$86
.Lwots_sign$87:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$86:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$87
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 44(%rdi)
	jmp 	.Lwots_sign$84
.Lwots_sign$85:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$84:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$85
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 48(%rdi)
	jmp 	.Lwots_sign$82
.Lwots_sign$83:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$82:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$83
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 52(%rdi)
	jmp 	.Lwots_sign$80
.Lwots_sign$81:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$80:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$81
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 56(%rdi)
	jmp 	.Lwots_sign$78
.Lwots_sign$79:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$78:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$79
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 60(%rdi)
	jmp 	.Lwots_sign$76
.Lwots_sign$77:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$76:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$77
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 64(%rdi)
	jmp 	.Lwots_sign$74
.Lwots_sign$75:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$74:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$75
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 68(%rdi)
	jmp 	.Lwots_sign$72
.Lwots_sign$73:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$72:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$73
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 72(%rdi)
	jmp 	.Lwots_sign$70
.Lwots_sign$71:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$70:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$71
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 76(%rdi)
	jmp 	.Lwots_sign$68
.Lwots_sign$69:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$68:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$69
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 80(%rdi)
	jmp 	.Lwots_sign$66
.Lwots_sign$67:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$66:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$67
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 84(%rdi)
	jmp 	.Lwots_sign$64
.Lwots_sign$65:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$64:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$65
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 88(%rdi)
	jmp 	.Lwots_sign$62
.Lwots_sign$63:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$62:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$63
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 92(%rdi)
	jmp 	.Lwots_sign$60
.Lwots_sign$61:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$60:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$61
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 96(%rdi)
	jmp 	.Lwots_sign$58
.Lwots_sign$59:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$58:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$59
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 100(%rdi)
	jmp 	.Lwots_sign$56
.Lwots_sign$57:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$56:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$57
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 104(%rdi)
	jmp 	.Lwots_sign$54
.Lwots_sign$55:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$54:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$55
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 108(%rdi)
	jmp 	.Lwots_sign$52
.Lwots_sign$53:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$52:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$53
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 112(%rdi)
	jmp 	.Lwots_sign$50
.Lwots_sign$51:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$50:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$51
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 116(%rdi)
	jmp 	.Lwots_sign$48
.Lwots_sign$49:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$48:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$49
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 120(%rdi)
	jmp 	.Lwots_sign$46
.Lwots_sign$47:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$46:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$47
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 124(%rdi)
	jmp 	.Lwots_sign$44
.Lwots_sign$45:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$44:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$45
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 128(%rdi)
	jmp 	.Lwots_sign$42
.Lwots_sign$43:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$42:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$43
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 132(%rdi)
	jmp 	.Lwots_sign$40
.Lwots_sign$41:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$40:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$41
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 136(%rdi)
	jmp 	.Lwots_sign$38
.Lwots_sign$39:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$38:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$39
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 140(%rdi)
	jmp 	.Lwots_sign$36
.Lwots_sign$37:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$36:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$37
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 144(%rdi)
	jmp 	.Lwots_sign$34
.Lwots_sign$35:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$34:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$35
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 148(%rdi)
	jmp 	.Lwots_sign$32
.Lwots_sign$33:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$32:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$33
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 152(%rdi)
	jmp 	.Lwots_sign$30
.Lwots_sign$31:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$30:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$31
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 156(%rdi)
	jmp 	.Lwots_sign$28
.Lwots_sign$29:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$28:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$29
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 160(%rdi)
	jmp 	.Lwots_sign$26
.Lwots_sign$27:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$26:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$27
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 164(%rdi)
	jmp 	.Lwots_sign$24
.Lwots_sign$25:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$24:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$25
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 168(%rdi)
	jmp 	.Lwots_sign$22
.Lwots_sign$23:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$22:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$23
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 172(%rdi)
	jmp 	.Lwots_sign$20
.Lwots_sign$21:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$20:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$21
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 176(%rdi)
	jmp 	.Lwots_sign$18
.Lwots_sign$19:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$18:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$19
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 180(%rdi)
	jmp 	.Lwots_sign$16
.Lwots_sign$17:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$16:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$17
	movl	%r10d, %ebp
	addl	$-4, %ecx
	shrq	%cl, %rbp
	andq	$15, %rbp
	movl	%ebp, 184(%rdi)
	jmp 	.Lwots_sign$14
.Lwots_sign$15:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %ebp
	orl 	%ebp, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$14:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$15
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
	movb	%al, 289(%rsp)
	shrl	$8, %ecx
	andl	$255, %ecx
	movb	%cl, 288(%rsp)
	leaq	192(%rsi), %rsi
	leaq	288(%rsp), %rax
	movq	$0, %rdx
	movl	$0, %ecx
	movl	$0, %r10d
	jmp 	.Lwots_sign$12
.Lwots_sign$13:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %edi
	orl 	%edi, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$12:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$13
	movl	%r10d, %edi
	addl	$-4, %ecx
	shrq	%cl, %rdi
	andq	$15, %rdi
	movl	%edi, (%rsi)
	jmp 	.Lwots_sign$10
.Lwots_sign$11:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %edi
	orl 	%edi, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$10:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$11
	movl	%r10d, %edi
	addl	$-4, %ecx
	shrq	%cl, %rdi
	andq	$15, %rdi
	movl	%edi, 4(%rsi)
	jmp 	.Lwots_sign$8
.Lwots_sign$9:
	shll	$8, %r10d
	movzbl	(%rax,%rdx), %edi
	orl 	%edi, %r10d
	incq	%rdx
	addl	$8, %ecx
.Lwots_sign$8:
	cmpl	$4, %ecx
	jb  	.Lwots_sign$9
	movl	%r10d, %eax
	addl	$-4, %ecx
	shrq	%cl, %rax
	andq	$15, %rax
	movl	%eax, 8(%rsi)
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
	movl	20(%r8), %ecx
	leaq	48(%rsp), %rdx
	movl	%ecx, 20(%rdx)
	movq	%r8, 8(%rsp)
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
	leaq	48(%rsp), %rdx
	movq	%rcx, %rsi
	movq	%r9, %rdi
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_sign$7:
	leaq	56(%rsp), %rsp
	movq	40(%rsp), %rbx
	movq	16(%rsp), %r11
	movq	24(%rsp), %r9
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rdx
	incl	%ecx
	addq	$24, %rdx
.Lwots_sign$5:
	cmpl	$51, %ecx
	jb  	.Lwots_sign$6
	movq	8(%rsp), %rdx
	movq	$0, %rsi
	movl	$0, %ecx
	jmp 	.Lwots_sign$2
.Lwots_sign$3:
	movq	%r9, 8(%rsp)
	movl	%ecx, 80(%rsp)
	movq	%rsi, 32(%rsp)
	movl	%ecx, %eax
	movl	%eax, 24(%rdx)
	movl	$0, %r10d
	movl	%ecx, %eax
	movl	84(%rsp,%rax,4), %eax
	leaq	(%rbx,%rsi), %rcx
	movq	%rbx, 24(%rsp)
	movl	%eax, %esi
	movq	%r9, %rdi
	movq	%rdx, %r8
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_sign$4:
	leaq	24(%rsp), %rsp
	movq	%r8, %rdx
	movq	24(%rsp), %rbx
	movq	8(%rsp), %r9
	movl	80(%rsp), %ecx
	movq	32(%rsp), %rsi
	incl	%ecx
	addq	$24, %rsi
.Lwots_sign$2:
	cmpl	$51, %ecx
	jb  	.Lwots_sign$3
	ret
.Lwots_pkgen$1:
	movq	%rcx, 1256(%rsp)
	leaq	1296(%rsp), %rcx
	movq	(%r8), %rdx
	movq	%rdx, (%rcx)
	movq	8(%r8), %rdx
	movq	%rdx, 8(%rcx)
	movq	16(%r8), %rdx
	movq	%rdx, 16(%rcx)
	movq	24(%r8), %rdx
	movq	%rdx, 24(%rcx)
	leaq	1296(%rsp), %rcx
	movq	$0, 16(%rcx)
	movq	$0, 24(%rcx)
	movl	$5, 16(%rcx)
	movl	20(%r8), %ecx
	leaq	1296(%rsp), %rdx
	movl	%ecx, 20(%rdx)
	movl	%ecx, 1328(%rsp)
	movq	%r8, 1264(%rsp)
	movq	$0, %rsi
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$6
.Lwots_pkgen$7:
	movq	%r11, 1272(%rsp)
	movq	%rdi, 1280(%rsp)
	movl	%ecx, 1332(%rsp)
	movq	%rsi, 1288(%rsp)
	leaq	1296(%rsp), %rdx
	movl	%ecx, 24(%rdx)
	leaq	32(%rsp,%rsi), %rcx
	leaq	1296(%rsp), %rdx
	movq	%rcx, %rsi
	leaq	-56(%rsp), %rsp
	call	.LPRF$1
.Lwots_pkgen$8:
	leaq	56(%rsp), %rsp
	movq	1272(%rsp), %r11
	movq	1280(%rsp), %rdi
	movl	1332(%rsp), %ecx
	movq	1288(%rsp), %rsi
	incl	%ecx
	addq	$24, %rsi
.Lwots_pkgen$6:
	cmpl	$51, %ecx
	jb  	.Lwots_pkgen$7
	movq	1264(%rsp), %r8
	movq	$0, %rsi
	movl	$0, %ecx
	jmp 	.Lwots_pkgen$3
.Lwots_pkgen$4:
	movq	%rdi, 1264(%rsp)
	movl	%ecx, 1332(%rsp)
	movq	%rsi, 1288(%rsp)
	movl	%ecx, 24(%r8)
	movl	$0, %r10d
	movl	$15, %edx
	leaq	32(%rsp,%rsi), %rcx
	movl	%edx, %esi
	leaq	-24(%rsp), %rsp
	call	.Lchain$1
.Lwots_pkgen$5:
	leaq	24(%rsp), %rsp
	movq	1264(%rsp), %rdi
	movl	1332(%rsp), %ecx
	movq	1288(%rsp), %rsi
	incl	%ecx
	addq	$24, %rsi
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
	movq	%r8, 1256(%rsp)
	leaq	1296(%rsp), %r8
	leaq	32(%rsp), %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rcx
	leaq	-56(%rsp), %rsp
	call	.LT_len$1
.Lwots_pkgen$2:
	leaq	56(%rsp), %rsp
	movq	1256(%rsp), %rdx
	ret
.Lchain$1:
	movl	%r10d, %edx
	addl	%esi, %edx
	jmp 	.Lchain$2
.Lchain$3:
	movl	%r10d, 28(%r8)
	movq	%rdi, 8(%rsp)
	movq	%r8, 16(%rsp)
	movl	%r10d, 24(%rsp)
	movl	%edx, 28(%rsp)
	leaq	-56(%rsp), %rsp
	call	.LF$1
.Lchain$4:
	leaq	56(%rsp), %rsp
	movq	8(%rsp), %rdi
	movq	16(%rsp), %r8
	movl	24(%rsp), %r10d
	movl	28(%rsp), %edx
	incl	%r10d
.Lchain$2:
	cmpl	%edx, %r10d
	jb  	.Lchain$3
	ret
.LT_k$1:
	movq	%rcx, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%rdi,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rdi,%rcx), %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
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
	movq	$0, %r9
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%r9), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%r9), %rdx
	vmovq	%rdx, %xmm2
	movq	24(%rcx,%r9), %rcx
	vmovq	%rcx, %xmm6
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
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
	vmovdqu	8(%rax,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm0, %ymm14
	movq	24(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	32(%rax,%rcx), %ymm13
	movq	64(%rax,%rcx), %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm9
	movq	72(%rax,%rcx), %rdx
	vmovq	%rdx, %xmm2
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm0
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
	movq	$0, %r9
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
	incq	%r9
.LT_k$6:
	cmpq	$2, %r9
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
	orq 	%rax, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
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
	movq	48(%rsp), %rcx
	movq	$0, %rax
	movq	$0, %r9
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
	incq	%r9
.LT_k$3:
	cmpq	$0, %r9
	jb  	.LT_k$4
	call	.L_keccakf1600_avx2$1
.LT_k$2:
	movq	%xmm5, (%rcx,%rax)
	vmovdqu	%xmm4, 8(%rcx,%rax)
	ret
.LT_len$1:
	movq	%rsi, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %r9
	vpbroadcastq	(%rdi,%r9), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rdi,%r9), %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
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
	movq	$0, %r9
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rdx,%r9), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rdx,%r9), %rsi
	vmovq	%rsi, %xmm2
	movq	24(%rdx,%r9), %rdx
	vmovq	%rdx, %xmm6
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm6, %xmm6
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
	movq	$0, %r9
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rcx,%r9), %xmm0
	vpslldq	$8, %xmm0, %xmm0
	vmovdqu	8(%rcx,%r9), %xmm9
	vinserti128	$1, %xmm9, %ymm0, %ymm14
	movq	24(%rcx,%r9), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	32(%rcx,%r9), %ymm13
	movq	64(%rcx,%r9), %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm9
	movq	72(%rcx,%r9), %rdx
	vmovq	%rdx, %xmm2
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm2, %xmm0
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
	addq	$80, %r9
	call	.L_keccakf1600_avx2$1
.LT_len$9:
	movq	$0, %r10
	jmp 	.LT_len$6
.LT_len$7:
	vpbroadcastq	(%rcx,%r9), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%r9), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%r9), %rdx
	vmovq	%rdx, %xmm8
	vmovdqu	48(%rcx,%r9), %ymm14
	movq	80(%rcx,%r9), %rdx
	vmovq	%rdx, %xmm10
	vmovdqu	88(%rcx,%r9), %ymm13
	movq	120(%rcx,%r9), %rdx
	vpinsrq	$1, %rdx, %xmm8, %xmm9
	movq	128(%rcx,%r9), %rdx
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
	addq	$136, %r9
	call	.L_keccakf1600_avx2$1
.LT_len$8:
	incq	%r10
.LT_len$6:
	cmpq	$8, %r10
	jb  	.LT_len$7
	vpbroadcastq	(%rcx,%r9), %ymm7
	vpxor	%ymm7, %ymm5, %ymm5
	vmovdqu	8(%rcx,%r9), %ymm7
	vpxor	%ymm7, %ymm4, %ymm4
	movq	40(%rcx,%r9), %rdx
	vmovq	%rdx, %xmm8
	movq	48(%rcx,%r9), %rcx
	vmovq	%rcx, %xmm7
	movq	$0, %rcx
	movq	$31, %rdx
	orq 	%rdx, %rcx
	vpinsrq	$1, %rcx, %xmm7, %xmm7
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
	movq	$0, %r9
	movq	$0, %r10
	jmp 	.LT_len$3
.LT_len$4:
	call	.L_keccakf1600_avx2$1
.LT_len$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%r9)
	vmovdqu	%ymm4, 8(%rcx,%r9)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%r9)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%r9)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%r9)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%r9)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%r9)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%r9)
	addq	$136, %r9
	incq	%r10
.LT_len$3:
	cmpq	$0, %r10
	jb  	.LT_len$4
	call	.L_keccakf1600_avx2$1
.LT_len$2:
	movq	%xmm5, (%rcx,%r9)
	vmovdqu	%xmm4, 8(%rcx,%r9)
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
	vpbroadcastq	(%rdi,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rdi,%rcx), %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	leaq	16(%rsp), %rcx
	movl	(%r8), %edi
	bswapl	%edi
	movl	%edi, (%rcx)
	movl	4(%r8), %edi
	bswapl	%edi
	movl	%edi, 4(%rcx)
	movl	8(%r8), %edi
	bswapl	%edi
	movl	%edi, 8(%rcx)
	movl	12(%r8), %edi
	bswapl	%edi
	movl	%edi, 12(%rcx)
	movl	16(%r8), %edi
	bswapl	%edi
	movl	%edi, 16(%rcx)
	movl	20(%r8), %edi
	bswapl	%edi
	movl	%edi, 20(%rcx)
	movl	24(%r8), %edi
	bswapl	%edi
	movl	%edi, 24(%rcx)
	movl	28(%r8), %edi
	bswapl	%edi
	movl	%edi, 28(%rcx)
	leaq	16(%rsp), %rcx
	movq	$0, %r9
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%r9), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%r9), %rdi
	vmovq	%rdi, %xmm2
	movq	24(%rcx,%r9), %rcx
	vmovq	%rcx, %xmm6
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
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
	movq	$0, %rcx
	movq	$31, %rdx
	orq 	%rdx, %rcx
	vmovq	%rcx, %xmm11
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm11, %xmm10
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
	movq	$0, %r9
	movq	$0, %r10
	jmp 	.LH$3
.LH$4:
	call	.L_keccakf1600_avx2$1
.LH$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%r9)
	vmovdqu	%ymm4, 8(%rcx,%r9)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%r9)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%r9)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%r9)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%r9)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%r9)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%r9)
	addq	$136, %r9
	incq	%r10
.LH$3:
	cmpq	$0, %r10
	jb  	.LH$4
	call	.L_keccakf1600_avx2$1
.LH$2:
	movq	%xmm5, (%rcx,%r9)
	vmovdqu	%xmm4, 8(%rcx,%r9)
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
	movq	$0, %r9
	vpbroadcastq	(%rdi,%r9), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rdi,%r9), %xmm2
	vpxor	%xmm9, %xmm9, %xmm9
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
	movq	$0, %r9
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rdx,%r9), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rdx,%r9), %rsi
	vmovq	%rsi, %xmm2
	movq	24(%rdx,%r9), %rdx
	vmovq	%rdx, %xmm6
	movq	$0, %rdx
	vpinsrq	$1, %rdx, %xmm6, %xmm6
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
	movq	$0, %r9
	movq	$0, %rdx
	vmovq	%rdx, %xmm2
	vmovdqu	(%rcx,%r9), %xmm6
	vpslldq	$8, %xmm6, %xmm6
	vmovdqu	8(%rcx,%r9), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rcx
	movq	$31, %rdx
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
	movq	$0, %r9
	movq	$0, %r10
	jmp 	.LF$3
.LF$4:
	call	.L_keccakf1600_avx2$1
.LF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%r9)
	vmovdqu	%ymm4, 8(%rcx,%r9)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%r9)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%r9)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%r9)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%r9)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%r9)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%r9)
	addq	$136, %r9
	incq	%r10
.LF$3:
	cmpq	$0, %r10
	jb  	.LF$4
	call	.L_keccakf1600_avx2$1
.LF$2:
	movq	%xmm5, (%rcx,%r9)
	vmovdqu	%xmm4, 8(%rcx,%r9)
	ret
.LPRF$1:
	movq	%rsi, 48(%rsp)
	vpxor	%ymm5, %ymm5, %ymm5
	vpxor	%ymm4, %ymm4, %ymm4
	vpxor	%ymm0, %ymm0, %ymm0
	vpxor	%ymm7, %ymm7, %ymm7
	vpxor	%ymm8, %ymm8, %ymm8
	vpxor	%ymm1, %ymm1, %ymm1
	vpxor	%ymm3, %ymm3, %ymm3
	movq	$0, %rcx
	vpbroadcastq	(%rdi,%rcx), %ymm2
	vpxor	%ymm2, %ymm5, %ymm5
	vmovdqu	8(%rdi,%rcx), %xmm2
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
	movq	$0, %r9
	vpxor	%ymm2, %ymm2, %ymm2
	vmovdqu	(%rcx,%r9), %xmm9
	vinserti128	$1, %xmm9, %ymm2, %ymm2
	vpxor	%ymm2, %ymm4, %ymm4
	movq	16(%rcx,%r9), %rdx
	vmovq	%rdx, %xmm2
	movq	24(%rcx,%r9), %rcx
	vmovq	%rcx, %xmm6
	movq	$0, %rcx
	vpinsrq	$1, %rcx, %xmm6, %xmm6
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
	vmovdqu	8(%r11,%rcx), %xmm9
	vinserti128	$1, %xmm9, %ymm6, %ymm14
	movq	$0, %rcx
	movq	$31, %rdx
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
	movq	$0, %r9
	movq	$0, %r10
	jmp 	.LPRF$3
.LPRF$4:
	call	.L_keccakf1600_avx2$1
.LPRF$5:
	vmovdqu	%xmm5, %xmm7
	movq	%xmm7, (%rcx,%r9)
	vmovdqu	%ymm4, 8(%rcx,%r9)
	vmovdqu	%xmm6, %xmm7
	vextracti128	$1, %ymm6, %xmm8
	movq	%xmm8, %rdx
	movq	%rdx, 40(%rcx,%r9)
	vpunpckhqdq	%xmm8, %xmm8, %xmm8
	vpblendd	$240, %ymm2, %ymm0, %ymm10
	vpblendd	$240, %ymm0, %ymm2, %ymm12
	vpblendd	$240, %ymm3, %ymm1, %ymm13
	vpblendd	$240, %ymm1, %ymm3, %ymm9
	vpblendd	$195, %ymm9, %ymm10, %ymm11
	vmovdqu	%ymm11, 48(%rcx,%r9)
	movq	%xmm7, %rdx
	movq	%rdx, 80(%rcx,%r9)
	vpblendd	$195, %ymm12, %ymm9, %ymm7
	vmovdqu	%ymm7, 88(%rcx,%r9)
	movq	%xmm8, %rdx
	movq	%rdx, 120(%rcx,%r9)
	vpblendd	$195, %ymm10, %ymm13, %ymm7
	movq	%xmm7, 128(%rcx,%r9)
	addq	$136, %r9
	incq	%r10
.LPRF$3:
	cmpq	$0, %r10
	jb  	.LPRF$4
	call	.L_keccakf1600_avx2$1
.LPRF$2:
	movq	%xmm5, (%rcx,%r9)
	vmovdqu	%xmm4, 8(%rcx,%r9)
	ret
.LPRF_msg$1:
	movq	%r11, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%rdi, 32(%rsp)
	movq	%r8, 40(%rsp)
	leaq	56(%rsp), %rcx
	xorl	%edi, %edi
	movq	%rdi, (%rcx)
	movq	%rdi, 8(%rcx)
	movq	%rdi, 16(%rcx)
	movq	%rdi, 24(%rcx)
	movq	%rdi, 32(%rcx)
	movq	%rdi, 40(%rcx)
	movq	%rdi, 48(%rcx)
	movq	%rdi, 56(%rcx)
	movq	%rdi, 64(%rcx)
	movq	%rdi, 72(%rcx)
	movq	%rdi, 80(%rcx)
	movq	%rdi, 88(%rcx)
	movq	%rdi, 96(%rcx)
	movq	%rdi, 104(%rcx)
	movq	%rdi, 112(%rcx)
	movq	%rdi, 120(%rcx)
	movq	%rdi, 128(%rcx)
	movq	%rdi, 136(%rcx)
	movq	%rdi, 144(%rcx)
	movq	%rdi, 152(%rcx)
	movq	%rdi, 160(%rcx)
	movq	%rdi, 168(%rcx)
	movq	%rdi, 176(%rcx)
	movq	%rdi, 184(%rcx)
	movq	%rdi, 192(%rcx)
	movb	(%rax), %r9b
	movb	%r9b, 56(%rsp)
	movb	1(%rax), %r9b
	movb	%r9b, 57(%rsp)
	movb	2(%rax), %r9b
	movb	%r9b, 58(%rsp)
	movb	3(%rax), %r9b
	movb	%r9b, 59(%rsp)
	movb	4(%rax), %r9b
	movb	%r9b, 60(%rsp)
	movb	5(%rax), %r9b
	movb	%r9b, 61(%rsp)
	movb	6(%rax), %r9b
	movb	%r9b, 62(%rsp)
	movb	7(%rax), %r9b
	movb	%r9b, 63(%rsp)
	movb	8(%rax), %r9b
	movb	%r9b, 64(%rsp)
	movb	9(%rax), %r9b
	movb	%r9b, 65(%rsp)
	movb	10(%rax), %r9b
	movb	%r9b, 66(%rsp)
	movb	11(%rax), %r9b
	movb	%r9b, 67(%rsp)
	movb	12(%rax), %r9b
	movb	%r9b, 68(%rsp)
	movb	13(%rax), %r9b
	movb	%r9b, 69(%rsp)
	movb	14(%rax), %r9b
	movb	%r9b, 70(%rsp)
	movb	15(%rax), %r9b
	movb	%r9b, 71(%rsp)
	movb	16(%rax), %r9b
	movb	%r9b, 72(%rsp)
	movb	17(%rax), %r9b
	movb	%r9b, 73(%rsp)
	movb	18(%rax), %r9b
	movb	%r9b, 74(%rsp)
	movb	19(%rax), %r9b
	movb	%r9b, 75(%rsp)
	movb	20(%rax), %r9b
	movb	%r9b, 76(%rsp)
	movb	21(%rax), %r9b
	movb	%r9b, 77(%rsp)
	movb	22(%rax), %r9b
	movb	%r9b, 78(%rsp)
	movb	23(%rax), %r9b
	movb	%r9b, 79(%rsp)
	movb	(%rsi), %r9b
	movb	%r9b, 80(%rsp)
	movb	1(%rsi), %r9b
	movb	%r9b, 81(%rsp)
	movb	2(%rsi), %r9b
	movb	%r9b, 82(%rsp)
	movb	3(%rsi), %r9b
	movb	%r9b, 83(%rsp)
	movb	4(%rsi), %r9b
	movb	%r9b, 84(%rsp)
	movb	5(%rsi), %r9b
	movb	%r9b, 85(%rsp)
	movb	6(%rsi), %r9b
	movb	%r9b, 86(%rsp)
	movb	7(%rsi), %r9b
	movb	%r9b, 87(%rsp)
	movb	8(%rsi), %r9b
	movb	%r9b, 88(%rsp)
	movb	9(%rsi), %r9b
	movb	%r9b, 89(%rsp)
	movb	10(%rsi), %r9b
	movb	%r9b, 90(%rsp)
	movb	11(%rsi), %r9b
	movb	%r9b, 91(%rsp)
	movb	12(%rsi), %r9b
	movb	%r9b, 92(%rsp)
	movb	13(%rsi), %r9b
	movb	%r9b, 93(%rsp)
	movb	14(%rsi), %r9b
	movb	%r9b, 94(%rsp)
	movb	15(%rsi), %r9b
	movb	%r9b, 95(%rsp)
	movb	16(%rsi), %r9b
	movb	%r9b, 96(%rsp)
	movb	17(%rsi), %r9b
	movb	%r9b, 97(%rsp)
	movb	18(%rsi), %r9b
	movb	%r9b, 98(%rsp)
	movb	19(%rsi), %r9b
	movb	%r9b, 99(%rsp)
	movb	20(%rsi), %r9b
	movb	%r9b, 100(%rsp)
	movb	21(%rsi), %r9b
	movb	%r9b, 101(%rsp)
	movb	22(%rsi), %r9b
	movb	%r9b, 102(%rsp)
	movb	23(%rsi), %r9b
	movb	%r9b, 103(%rsp)
	movb	$0, 104(%rsp)
	movb	%dl, 105(%rsp)
	movq	$50, %r10
	movq	$0, %rax
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rcx
	jmp 	.LPRF_msg$11
.LPRF_msg$12:
	cmpq	$136, %r10
	jb  	.LPRF_msg$13
	movq	%rdi, 24(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rcx, 48(%rsp)
	leaq	56(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$14:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rdi
	movq	16(%rsp), %rax
	movq	48(%rsp), %rcx
	movq	$0, %r10
.LPRF_msg$13:
	movb	(%rdi,%rax), %r9b
	incq	%rax
	xorb	%r9b, 56(%rsp,%r10)
	incq	%r10
.LPRF_msg$11:
	cmpq	%rcx, %rax
	jb  	.LPRF_msg$12
	movq	$0, %rax
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rsi
	jmp 	.LPRF_msg$7
.LPRF_msg$8:
	cmpq	$136, %r10
	jb  	.LPRF_msg$9
	movq	%rdx, 40(%rsp)
	movq	%rax, 32(%rsp)
	movq	%rsi, 48(%rsp)
	leaq	56(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$10:
	leaq	208(%rsp), %rsp
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rax
	movq	48(%rsp), %rsi
	movq	$0, %r10
.LPRF_msg$9:
	movb	(%rdx,%rax), %r9b
	incq	%rax
	xorb	%r9b, 56(%rsp,%r10)
	incq	%r10
.LPRF_msg$7:
	cmpq	%rsi, %rax
	jb  	.LPRF_msg$8
	leaq	56(%rsp), %rax
	cmpq	$136, %r10
	jb  	.LPRF_msg$5
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$6:
	leaq	208(%rsp), %rsp
	movq	$0, %r10
.LPRF_msg$5:
	xorb	$31, 56(%rsp,%r10)
	leaq	56(%rsp), %rax
	cmpq	$136, %r10
	jb  	.LPRF_msg$3
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$4:
	leaq	208(%rsp), %rsp
.LPRF_msg$3:
	xorb	$128, 191(%rsp)
	leaq	56(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LPRF_msg$2:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rcx
	movb	56(%rsp), %dl
	movb	%dl, (%rcx)
	movb	57(%rsp), %dl
	movb	%dl, 1(%rcx)
	movb	58(%rsp), %dl
	movb	%dl, 2(%rcx)
	movb	59(%rsp), %dl
	movb	%dl, 3(%rcx)
	movb	60(%rsp), %dl
	movb	%dl, 4(%rcx)
	movb	61(%rsp), %dl
	movb	%dl, 5(%rcx)
	movb	62(%rsp), %dl
	movb	%dl, 6(%rcx)
	movb	63(%rsp), %dl
	movb	%dl, 7(%rcx)
	movb	64(%rsp), %dl
	movb	%dl, 8(%rcx)
	movb	65(%rsp), %dl
	movb	%dl, 9(%rcx)
	movb	66(%rsp), %dl
	movb	%dl, 10(%rcx)
	movb	67(%rsp), %dl
	movb	%dl, 11(%rcx)
	movb	68(%rsp), %dl
	movb	%dl, 12(%rcx)
	movb	69(%rsp), %dl
	movb	%dl, 13(%rcx)
	movb	70(%rsp), %dl
	movb	%dl, 14(%rcx)
	movb	71(%rsp), %dl
	movb	%dl, 15(%rcx)
	movb	72(%rsp), %dl
	movb	%dl, 16(%rcx)
	movb	73(%rsp), %dl
	movb	%dl, 17(%rcx)
	movb	74(%rsp), %dl
	movb	%dl, 18(%rcx)
	movb	75(%rsp), %dl
	movb	%dl, 19(%rcx)
	movb	76(%rsp), %dl
	movb	%dl, 20(%rcx)
	movb	77(%rsp), %dl
	movb	%dl, 21(%rcx)
	movb	78(%rsp), %dl
	movb	%dl, 22(%rcx)
	movb	79(%rsp), %dl
	movb	%dl, 23(%rcx)
	ret
.LH_msg$1:
	movq	%rdi, 8(%rsp)
	movq	%r11, 16(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rsi, 40(%rsp)
	leaq	56(%rsp), %rax
	xorl	%edx, %edx
	movq	%rdx, (%rax)
	movq	%rdx, 8(%rax)
	movq	%rdx, 16(%rax)
	movq	%rdx, 24(%rax)
	movq	%rdx, 32(%rax)
	movq	%rdx, 40(%rax)
	movq	%rdx, 48(%rax)
	movq	%rdx, 56(%rax)
	movq	%rdx, 64(%rax)
	movq	%rdx, 72(%rax)
	movq	%rdx, 80(%rax)
	movq	%rdx, 88(%rax)
	movq	%rdx, 96(%rax)
	movq	%rdx, 104(%rax)
	movq	%rdx, 112(%rax)
	movq	%rdx, 120(%rax)
	movq	%rdx, 128(%rax)
	movq	%rdx, 136(%rax)
	movq	%rdx, 144(%rax)
	movq	%rdx, 152(%rax)
	movq	%rdx, 160(%rax)
	movq	%rdx, 168(%rax)
	movq	%rdx, 176(%rax)
	movq	%rdx, 184(%rax)
	movq	%rdx, 192(%rax)
	movb	(%r8), %dl
	movb	%dl, 56(%rsp)
	movb	1(%r8), %dl
	movb	%dl, 57(%rsp)
	movb	2(%r8), %dl
	movb	%dl, 58(%rsp)
	movb	3(%r8), %dl
	movb	%dl, 59(%rsp)
	movb	4(%r8), %dl
	movb	%dl, 60(%rsp)
	movb	5(%r8), %dl
	movb	%dl, 61(%rsp)
	movb	6(%r8), %dl
	movb	%dl, 62(%rsp)
	movb	7(%r8), %dl
	movb	%dl, 63(%rsp)
	movb	8(%r8), %dl
	movb	%dl, 64(%rsp)
	movb	9(%r8), %dl
	movb	%dl, 65(%rsp)
	movb	10(%r8), %dl
	movb	%dl, 66(%rsp)
	movb	11(%r8), %dl
	movb	%dl, 67(%rsp)
	movb	12(%r8), %dl
	movb	%dl, 68(%rsp)
	movb	13(%r8), %dl
	movb	%dl, 69(%rsp)
	movb	14(%r8), %dl
	movb	%dl, 70(%rsp)
	movb	15(%r8), %dl
	movb	%dl, 71(%rsp)
	movb	16(%r8), %dl
	movb	%dl, 72(%rsp)
	movb	17(%r8), %dl
	movb	%dl, 73(%rsp)
	movb	18(%r8), %dl
	movb	%dl, 74(%rsp)
	movb	19(%r8), %dl
	movb	%dl, 75(%rsp)
	movb	20(%r8), %dl
	movb	%dl, 76(%rsp)
	movb	21(%r8), %dl
	movb	%dl, 77(%rsp)
	movb	22(%r8), %dl
	movb	%dl, 78(%rsp)
	movb	23(%r8), %dl
	movb	%dl, 79(%rsp)
	movb	(%r9), %dl
	movb	%dl, 80(%rsp)
	movb	1(%r9), %dl
	movb	%dl, 81(%rsp)
	movb	2(%r9), %dl
	movb	%dl, 82(%rsp)
	movb	3(%r9), %dl
	movb	%dl, 83(%rsp)
	movb	4(%r9), %dl
	movb	%dl, 84(%rsp)
	movb	5(%r9), %dl
	movb	%dl, 85(%rsp)
	movb	6(%r9), %dl
	movb	%dl, 86(%rsp)
	movb	7(%r9), %dl
	movb	%dl, 87(%rsp)
	movb	8(%r9), %dl
	movb	%dl, 88(%rsp)
	movb	9(%r9), %dl
	movb	%dl, 89(%rsp)
	movb	10(%r9), %dl
	movb	%dl, 90(%rsp)
	movb	11(%r9), %dl
	movb	%dl, 91(%rsp)
	movb	12(%r9), %dl
	movb	%dl, 92(%rsp)
	movb	13(%r9), %dl
	movb	%dl, 93(%rsp)
	movb	14(%r9), %dl
	movb	%dl, 94(%rsp)
	movb	15(%r9), %dl
	movb	%dl, 95(%rsp)
	movb	16(%r9), %dl
	movb	%dl, 96(%rsp)
	movb	17(%r9), %dl
	movb	%dl, 97(%rsp)
	movb	18(%r9), %dl
	movb	%dl, 98(%rsp)
	movb	19(%r9), %dl
	movb	%dl, 99(%rsp)
	movb	20(%r9), %dl
	movb	%dl, 100(%rsp)
	movb	21(%r9), %dl
	movb	%dl, 101(%rsp)
	movb	22(%r9), %dl
	movb	%dl, 102(%rsp)
	movb	23(%r9), %dl
	movb	%dl, 103(%rsp)
	movb	(%r10), %dl
	movb	%dl, 104(%rsp)
	movb	1(%r10), %dl
	movb	%dl, 105(%rsp)
	movb	2(%r10), %dl
	movb	%dl, 106(%rsp)
	movb	3(%r10), %dl
	movb	%dl, 107(%rsp)
	movb	4(%r10), %dl
	movb	%dl, 108(%rsp)
	movb	5(%r10), %dl
	movb	%dl, 109(%rsp)
	movb	6(%r10), %dl
	movb	%dl, 110(%rsp)
	movb	7(%r10), %dl
	movb	%dl, 111(%rsp)
	movb	8(%r10), %dl
	movb	%dl, 112(%rsp)
	movb	9(%r10), %dl
	movb	%dl, 113(%rsp)
	movb	10(%r10), %dl
	movb	%dl, 114(%rsp)
	movb	11(%r10), %dl
	movb	%dl, 115(%rsp)
	movb	12(%r10), %dl
	movb	%dl, 116(%rsp)
	movb	13(%r10), %dl
	movb	%dl, 117(%rsp)
	movb	14(%r10), %dl
	movb	%dl, 118(%rsp)
	movb	15(%r10), %dl
	movb	%dl, 119(%rsp)
	movb	16(%r10), %dl
	movb	%dl, 120(%rsp)
	movb	17(%r10), %dl
	movb	%dl, 121(%rsp)
	movb	18(%r10), %dl
	movb	%dl, 122(%rsp)
	movb	19(%r10), %dl
	movb	%dl, 123(%rsp)
	movb	20(%r10), %dl
	movb	%dl, 124(%rsp)
	movb	21(%r10), %dl
	movb	%dl, 125(%rsp)
	movb	22(%r10), %dl
	movb	%dl, 126(%rsp)
	movb	23(%r10), %dl
	movb	%dl, 127(%rsp)
	movb	$0, 128(%rsp)
	movb	%cl, 129(%rsp)
	movq	$74, %r10
	movq	$0, %rax
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rcx
	jmp 	.LH_msg$11
.LH_msg$12:
	cmpq	$136, %r10
	jb  	.LH_msg$13
	movq	%rdi, 24(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rcx, 48(%rsp)
	leaq	56(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$14:
	leaq	208(%rsp), %rsp
	movq	24(%rsp), %rdi
	movq	16(%rsp), %rax
	movq	48(%rsp), %rcx
	movq	$0, %r10
.LH_msg$13:
	movb	(%rdi,%rax), %r9b
	incq	%rax
	xorb	%r9b, 56(%rsp,%r10)
	incq	%r10
.LH_msg$11:
	cmpq	%rcx, %rax
	jb  	.LH_msg$12
	movq	$0, %rax
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rsi
	jmp 	.LH_msg$7
.LH_msg$8:
	cmpq	$136, %r10
	jb  	.LH_msg$9
	movq	%rdx, 40(%rsp)
	movq	%rax, 32(%rsp)
	movq	%rsi, 48(%rsp)
	leaq	56(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$10:
	leaq	208(%rsp), %rsp
	movq	40(%rsp), %rdx
	movq	32(%rsp), %rax
	movq	48(%rsp), %rsi
	movq	$0, %r10
.LH_msg$9:
	movb	(%rdx,%rax), %r9b
	incq	%rax
	xorb	%r9b, 56(%rsp,%r10)
	incq	%r10
.LH_msg$7:
	cmpq	%rsi, %rax
	jb  	.LH_msg$8
	leaq	56(%rsp), %rax
	cmpq	$136, %r10
	jb  	.LH_msg$5
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$6:
	leaq	208(%rsp), %rsp
	movq	$0, %r10
.LH_msg$5:
	xorb	$31, 56(%rsp,%r10)
	leaq	56(%rsp), %rax
	cmpq	$136, %r10
	jb  	.LH_msg$3
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$4:
	leaq	208(%rsp), %rsp
.LH_msg$3:
	xorb	$128, 191(%rsp)
	leaq	56(%rsp), %rax
	leaq	-208(%rsp), %rsp
	call	.L_keccakf1600_ref1$1
.LH_msg$2:
	leaq	208(%rsp), %rsp
	movq	8(%rsp), %rcx
	movb	56(%rsp), %r9b
	movb	%r9b, (%rcx)
	movb	57(%rsp), %r9b
	movb	%r9b, 1(%rcx)
	movb	58(%rsp), %r9b
	movb	%r9b, 2(%rcx)
	movb	59(%rsp), %r9b
	movb	%r9b, 3(%rcx)
	movb	60(%rsp), %r9b
	movb	%r9b, 4(%rcx)
	movb	61(%rsp), %r9b
	movb	%r9b, 5(%rcx)
	movb	62(%rsp), %r9b
	movb	%r9b, 6(%rcx)
	movb	63(%rsp), %r9b
	movb	%r9b, 7(%rcx)
	movb	64(%rsp), %r9b
	movb	%r9b, 8(%rcx)
	movb	65(%rsp), %r9b
	movb	%r9b, 9(%rcx)
	movb	66(%rsp), %r9b
	movb	%r9b, 10(%rcx)
	movb	67(%rsp), %r9b
	movb	%r9b, 11(%rcx)
	movb	68(%rsp), %r9b
	movb	%r9b, 12(%rcx)
	movb	69(%rsp), %r9b
	movb	%r9b, 13(%rcx)
	movb	70(%rsp), %r9b
	movb	%r9b, 14(%rcx)
	movb	71(%rsp), %r9b
	movb	%r9b, 15(%rcx)
	movb	72(%rsp), %r9b
	movb	%r9b, 16(%rcx)
	movb	73(%rsp), %r9b
	movb	%r9b, 17(%rcx)
	movb	74(%rsp), %r9b
	movb	%r9b, 18(%rcx)
	movb	75(%rsp), %r9b
	movb	%r9b, 19(%rcx)
	movb	76(%rsp), %r9b
	movb	%r9b, 20(%rcx)
	movb	77(%rsp), %r9b
	movb	%r9b, 21(%rcx)
	movb	78(%rsp), %r9b
	movb	%r9b, 22(%rcx)
	movb	79(%rsp), %r9b
	movb	%r9b, 23(%rcx)
	movb	80(%rsp), %r9b
	movb	%r9b, 24(%rcx)
	movb	81(%rsp), %r9b
	movb	%r9b, 25(%rcx)
	movb	82(%rsp), %r9b
	movb	%r9b, 26(%rcx)
	movb	83(%rsp), %r9b
	movb	%r9b, 27(%rcx)
	movb	84(%rsp), %r9b
	movb	%r9b, 28(%rcx)
	movb	85(%rsp), %r9b
	movb	%r9b, 29(%rcx)
	movb	86(%rsp), %r9b
	movb	%r9b, 30(%rcx)
	movb	87(%rsp), %r9b
	movb	%r9b, 31(%rcx)
	movb	88(%rsp), %r9b
	movb	%r9b, 32(%rcx)
	movb	89(%rsp), %r9b
	movb	%r9b, 33(%rcx)
	movb	90(%rsp), %r9b
	movb	%r9b, 34(%rcx)
	movb	91(%rsp), %r9b
	movb	%r9b, 35(%rcx)
	movb	92(%rsp), %r9b
	movb	%r9b, 36(%rcx)
	movb	93(%rsp), %r9b
	movb	%r9b, 37(%rcx)
	movb	94(%rsp), %r9b
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
