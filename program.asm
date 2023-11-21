    global _start

    section .data
msg db `hello world 2\n`
msg_len equ $ - msg


%include 'lib/lib.asm'

  section .text

_start:
    mov rdi, rsp ; number of cli arguments
    lea rsi, [rsp + 8] ; first arg (path)
    call main

; main(argc, argv)
; rdi, rsi
main:
    call alloc_init
    mov rdi, 5 ; bytes
    call alloc
    lea rdi, [rax]
    mov byte [rdi], 'A'
    mov byte [rdi + 1], 'B'
    mov byte [rdi + 2], 'C'
    mov byte [rdi + 3], 'D'
    mov byte [rdi + 4], `\n`

    mov rdi, 64 ; bytes
    call alloc
    lea rdi, [rax]
    mov byte [rdi], 'B'
    mov byte [rdi + 1], 'C'
    mov byte [rdi + 2], 'N'
    mov byte [rdi + 3], 'D'
    mov byte [rdi + 4], `\n`

    mov rsi, 5
    call print_str

    mov rdi, 0
    call exit
