%ifndef INCLUDE_IO
%define INCLUDE_IO

section .text

; void print_str(string *address, int len)
print_str:
    push rdi
    push rsi
    mov rdx, rsi
    mov rsi, rdi
    mov rax, 1 ; syscall id
    mov rdi, 1 ; stdout
    syscall
    pop rsi
    pop rdi
    ret

%endif
