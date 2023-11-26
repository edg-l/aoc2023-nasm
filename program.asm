    global _start

    section .data
msg db `hello world 2\n`
msg_len equ $ - msg

    section .bss
str_buf resb 32


%include 'lib/lib.asm'

  section .text

_start:
    mov rdi, [rsp] ; number of cli arguments
    lea rsi, [rsp + 8] ; first arg (*path)
    call main

; main(argc, argv)
; rdi, rsi
main:
    call alloc_init

    lea rdx, [str_buf]
    mov rdi, 169
    mov rsi, 16
    call int_to_str

    lea rdi, [str_buf]
    mov rsi, rax
    call println

    mov rdi, rax
    call exit
