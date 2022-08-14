#like input ls

from pwn import *

#set environment

context.arch = 'amd64'

code = b''
code += asm(shellcraft.pushstr(".\x00"))
code += asm(shellcraft.open("rsp","O_RDONLY",0))
code += asm(shellcraft.syscall("SYS_getdents",3,"rsp",1000)) #1000 is length
code += asm(shellcraft.write(1,"rsp",1000)) #1000 is length

print(code)
print(disasm(code))

run_shellcode(code).interactive()
