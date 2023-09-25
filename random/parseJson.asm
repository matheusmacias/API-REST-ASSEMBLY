; random code to test nasm

section .data
    msg_json        db "{'name': 'John Doe', 'age': 42}", 0xA
    msg_json_len    equ $ - msg_json

    char_e          db 'e', 0xA
section .bss
    name resb 20        ; Reserva 20 bytes para name
    age  resb 4         ; Reserva 4 bytes para age
    n1 resd 2           ; Reserva 2 bytes para n1
    rj resb 2           ; Reserva 2 bytes para rj


section .text
global _start

_start:
    mov dword [n1], 0       ; Inicialize n1 com 0

    call _parseJson         ; Chame a função _parseJson

call _exit                  ; Chame a função _exit



_parseJson:
    mov cl, [n1]
    mov dl, msg_json_len
    cmp cl, dl
    jle _continue           ; Se cl <= dl, continue
    jmp _exit               ; Se cl > dl, saia

_continue:
    mov edi, [n1]
    lea rsi, msg_json[edi]
    mov al, byte [rsi]
    mov [rj], al
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall

    mov cl, [n1]
    inc cl
    mov [n1], cl

;    mov bl, byte [rj]
;    cmp bl, byte [char_e]
;    jz _exit

    jmp _parseJson         ; back to _parseJson



_exit:
    mov rax, 60         ; syscall number for exit
    xor rdi, rdi        ; exit status 0
    syscall
