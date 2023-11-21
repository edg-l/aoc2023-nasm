%ifndef INCLUDE_IO
%define INCLUDE_IO

%include "lib/syscalls.asm"

section .text

; void print(string *address, int len)
print:
    push rdi
    push rsi
    mov rdx, rsi ; buf
    mov rsi, rdi ; count
    mov rdi, 1 ; stdout
    call write
    pop rsi
    pop rdi
    ret

; void print(string *address, int len)
println:
    push rdi
    push rsi
    mov rdx, rsi ; buf
    mov rsi, rdi ; count
    mov rdi, 1 ; stdout
    call write
    mov rdx, `\n` ; buf
    mov rsi, 1 ; count
    call write
    pop rsi
    pop rdi
    ret

%endif
