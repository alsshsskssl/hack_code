; FIle name: execve.asm

;nasm -f elf64 execve.asm	;create blank.o
;objdump -d execve.o
;objcopy --dump-section .text=execve.bin execve.o	;create execve.bin
;xxd blank.bin

section .text
global _start
_start:
mov rax, 0x68732f6e69622f	;"/bin/sh"
push rax
mov rdi, rsp	; rdi = "/bin/sh\x00"
xor rsi, rsi	; rsi = NULL
xor rdx, rdx	; rdx = NULL
mov rax, 0x3b	; rax = sys_execve
syscall		; execve("/bin/sh", null, null) = execve(rdi, rsi, rdx)


