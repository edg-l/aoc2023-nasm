%ifndef INCLUDE_MATH
%define INCLUDE_MATH

; rax is the arg, and it modifies rax
next_pow_2:
    dec eax
    bsr rcx, rax
    inc ecx
    mov eax, 1
    shl rax, cl
    ret

%endif
