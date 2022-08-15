; FIle name: blank.asm

;nasm -f elf64 blank.asm	;create blank.o
;objdump -d blank.o
;objcopy --dump-section .text=blank.bin blank.o	;create blank.bin
;xxd blank.bin

section .text
global _start
_start:

;input asm code!


