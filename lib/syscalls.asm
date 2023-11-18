%ifndef INCLUDE_SYSCALLS
%define INCLUDE_SYSCALLS

section .text

; exit syscall
exit:
    mov rax, 60
    syscall

; int open(string path, int mode)
; rdi, rsi
; returns fd in rax
open:
    mov rax, 85 ; sys_creat
    ; rdi path
    ; rsi mode
    syscall
    ret

; size_t write(fd, buf, count)
; rdi, rsi, rdx
; returns bytes written in rax
write:
    mov rax, 1 ; sys_write
    syscall
    ret

; size_t read(fd, buf[.count], count)
; rdi, rsi, rdx
; returns bytes written in rax
read:
    mov rax, 0 ; sys_read
    syscall
    ret

; void close(fd)
; rdi
; returns 0 on succes or -1 on error in rax
close:
    mov rax, 3 ; sys_read
    syscall
    ret


; void *mmap(void addr[.length], size_t length, int prot, int flags,
;                  int fd, off_t offset);
; returns ptr in rax
mmap:
    mov rax, 9
    syscall
    ret

; int munmap(void addr[.length], size_t length);
munmap:
    mov rax, 11
    syscall
    ret

; int brk(void *addr);
; https://stackoverflow.com/questions/22586532/assembly-x86-brk-call-use
brk:
    mov rax, 12
    syscall
    ret

%endif
