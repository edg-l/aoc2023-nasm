    global _start

    section .data
msg db `hello world 2\n`
msg_len equ $ - msg


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

    mov rdi, [rsi]
    call cstr_len

    mov rdi, rax
    call exit
