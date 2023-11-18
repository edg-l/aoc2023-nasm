%ifndef INCLUDE_ALLOC
%define INCLUDE_ALLOC

%include "lib/syscalls.asm"

    section .bss
brk_current_addr: resq 1

    section .text

; initializes the allocator
; doing some needed setup
; mainly getting the initial brk address
alloc_init:
    push rdi
    mov rdi, 0
    call brk
    mov qword [brk_current_addr], rax
    pop rdi
    ret

; void* alloc(size_t bytes)
; returns a ptr to the allocated bytes on rax
alloc:
    push rdi ; push keeps a copy
    push rsi
    mov rsi, [brk_current_addr]
    lea rdi, [rsi + rdi]
    call brk
    mov qword [brk_current_addr], rax
    mov rax, rsi
    pop rsi
    pop rdi
    ret

%endif
