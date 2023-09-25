; random code to test nasm
; nasm -f elf64 -o program.o struc.asm && ld program.o -o program
; ./program

struc user
    .name:      resb  12
    .age:       resb  256
endstruc

section .data
    user_struct istruc user
        at user.name, db "John test", 0xA
        at user.age, dd "42", 0xA
    iend
    user_len     equ $ - user_struct

section .bss
section .text
global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, user_struct
    mov rdx, user_len
    syscall

    mov rax, 60
    mov rdi, 0
    syscall



