%ifndef INCLUDE_STRING
%define INCLUDE_STRING

%include "lib/math.asm"

section .text

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
    mov r10, rdx ; save rdx as its used for remainder
    mov r12, rdx ; save base ptr
    mov r11, 0 ; is negative flag

    ; handle if num == 0
    cmp rdi, 0
    jne .is_not_zero
    mov byte [r10], '0'
    inc rax
    ret

.is_not_zero:
    ; only handle neg for base 10
    cmp rdi, 0
    jnl .not_base_10_or_neg
    cmp rsi, 10
    jne .not_base_10_or_neg
    inc r11 ; set is negative to true
    call numabs
    mov rdi, rax

.not_base_10_or_neg:

    xor r9, r9 ; str length

.loop:
    cmp rdi, 0
    je .done

    ; str[i++] = (rem > 9) ? (rem - 10) + 'a' : rem + '0';

    mov rax, rdi
    xor rdx, rdx ; clear rdx as its used in division too
    div rsi ; rdi = num / base, rdx = num % base
    mov rdi, rax

    cmp rdx, 9
    jg .is_base_over_9
    add rdx, '0'
    mov [r10], dl
    jmp .loop_inc

.is_base_over_9:
    sub rdx, 10
    add rdx, 'a'
    mov [r10], dl

.loop_inc:
    inc r10 ; inc ptr
    inc r9 ; inc str count

    jmp .loop

    cmp r11, 0

.is_neg:
    mov byte [r10], '-'
    inc r9

.done:
    mov rdi, r12
    mov rsi, r9
    call reverse_str
    mov rax, r9

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

; reverse_str(str, len)
; rdi, rsi
reverse_str:
    ; rdi start ptr
    ; rax end ptr
    mov rax, rdi
    add rax, rsi
    sub rax, 1

.loop:
    cmp rdi, rax
    jge .done
    mov r10b, [rax]
    mov r11b, [rdi]
    mov [rax], r11b
    mov [rdi], r10b
    add rdi, 1
    sub rax, 1

    jmp .loop

.done:
    ret

%endif
