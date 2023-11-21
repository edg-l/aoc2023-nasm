%ifndef INCLUDE_ALLOC
%define INCLUDE_ALLOC

%include "lib/syscalls.asm"
%include "lib/math.asm"

%define PROT_READ       0x1
%define PROT_WRITE      0x2
%define MAP_PRIVATE     0x02
%define MAP_ANONYMOUS   0x20

    section .bss
_alloc_current_addr: resq 1
_alloc_upper_addr: resq 1


    section .text

; bump allocator

alloc_init:
    mov qword [_alloc_current_addr], 0
    mov qword [_alloc_upper_addr], 0
    ret

; void* alloc(size_t bytes)
; returns a ptr to the allocated bytes on rax
alloc:
    mov rax, [_alloc_current_addr]
    mov rcx, [_alloc_upper_addr]
    sub rcx, rax; _alloc_upper_addr - _alloc_current_addr = space left
    ; TODO: align?
    cmp rcx, rdi
    jge .enough ;  if greater equal
    jmp .not_enough

.enough:
    ; rax already has the current addr,
    mov rcx, rax
    add rcx, rdi ; rdi has the bytes
    mov [_alloc_current_addr], rcx
    ret

.not_enough:
    ; rdi has the bytes
    mov rax, rdi
    call next_pow_2

    mov rsi, rax
    xor rdi, rdi ; addr 0
    mov rdx, PROT_READ|PROT_WRITE
    mov r10, MAP_PRIVATE|MAP_ANONYMOUS
    mov r8, -1
    xor r9, r9
    call mmap
    mov [_alloc_current_addr], rax
    add rax, rdi
    mov [_alloc_upper_addr], rax
    sub rax, rdi
    ret

%endif
