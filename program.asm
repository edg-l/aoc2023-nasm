    global _start
    section .note.GNU-stack noalloc noexec nowrite progbits

    section .data
msg db `hello world\n`
msg_len equ $ - msg


    section .text

%include 'lib/lib.asm'

_start:
    mov rdi, msg
    mov rsi, msg_len
    call print_str
    call exit
