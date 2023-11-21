%ifndef INCLUDE_STRING
%define INCLUDE_STRING

; int str_to_int(string *, int len, int base)
; rdi, rsi, rdx
str_to_int:
    push rdi
    push rsi
    push rdx
    push r9 ; store current digit

    xor rax, rax

.loop:
    cmp rsi, 0
    je .done

    ; calc digit
    mov r9, [rdi]
    sub r9, '0'
    imul rax, rdx
    add rax, r9

    jmp .loop

.done:
    pop r9
    pop rdx
    pop rsi
    pop rdi
    ret

; int int_to_str(int number, int base, buff)
; returns length of str
; rdi, rsi, rdx
int_to_str:
    push rdi ; num
    push rsi ; base
    push rdx; buf
    push r9 ; current length
    xor r9, r9

    ; TODO finish

.done:
    pop r9
    pop rdx
    pop rsi
    pop rdi
    ret

; int cstr_len(cstring )
; rdi
; calculates the length of the c string
cstr_len:
    xor rax, rax
.loop:
    cmp byte [rdi], 0
    je .done
    inc rax
    add rdi, 1
    jmp .loop
.done:
    ret


%endif
