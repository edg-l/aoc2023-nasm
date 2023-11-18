    global _start

    section .data
msg db `hello world 2\n`
msg_len equ $ - msg


%include 'lib/lib.asm'

  section .text

_start:
    call alloc_init

    mov rdi, 5 ; 5 bytes
    call alloc
    lea rdi, [rax]
    mov byte [rdi], 'A'
    mov byte [rdi + 1], 'B'
    mov byte [rdi + 2], 'C'
    mov byte [rdi + 3], 'D'
    mov byte [rdi + 4], `\n`

    mov rsi, 5
    call print_str

    mov rdi, 0
    call exit
