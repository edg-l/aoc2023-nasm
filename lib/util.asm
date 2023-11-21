%ifndef INCLUDE_UTIL
%define INCLUDE_UTIL

; rax is the arg, and it modifies rax
next_pow_2:
    dec eax
    bsr rcx, rax
    inc ecx
    mov eax, 1
    shl rax, cl
    ret

%endif
