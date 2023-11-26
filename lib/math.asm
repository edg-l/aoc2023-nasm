%ifndef INCLUDE_MATH
%define INCLUDE_MATH

section .text

; rax is the arg, and it modifies rax
next_pow_2:
    dec eax
    bsr rcx, rax
    inc ecx
    mov eax, 1
    shl rax, cl
    ret

; abs(num)
; rdi -> rax
numabs:
    mov rsi, rax
    neg rax
    cmovl rax, rsi ; if rax is neg, restore its value
    ret

%endif
