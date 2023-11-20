%ifndef INCLUDE_ALLOC
%define INCLUDE_ALLOC

%include "lib/syscalls.asm"

%define PROT_READ       0x1
%define PROT_WRITE      0x2
%define MAP_PRIVATE     0x02
%define MAP_ANONYMOUS   0x20

    section .bss

    section .text

; void* alloc(size_t bytes)
; returns a ptr to the allocated bytes on rax
alloc:
    mov rsi, rdi ; rdi has the bytes
    xor rdi, rdi ; addr 0
    mov rdx, PROT_READ|PROT_WRITE
    mov r10, MAP_PRIVATE|MAP_ANONYMOUS
    mov r8, -1
    xor r9, r9
    call mmap
    ret

%endif
