from pwn import *

#set environment

context.arch = 'amd64'

code = shellcraft.sh()
#code is string type
print(code)

run_assembly(code).interactive()
#run_shellcode(asm(code)).interactive()

