%include "labels.asm"
%include "constants.asm"

global _start

struc sockaddr_in
    .sin_family resw 1
    .sin_port resw 1
    .sin_addr resd 1
    .sin_zero resb 8
endstruc

struc timespec
        .tv_sec resq 1
        .tv_nsec resq 1
endstruc

section .bss
        sock resw 2
        client resw 2
        echobuf resb 256
        read_count resw 2

section .data
        response_msg db 'HTTP/1.1 200 OK', 0xA
                    db 'Content-Type: application/json', 0xA
                    db 'Connection: close', 0xA
                    db 'Content-Length: 109', 0xA
                    db 0xA
                    db '{', 0xA
                    db '    "message": "Funcionando!"', 0xA
                    db '}', 0xA
        response_msg_len equ $ - response_msg

        pop_sa istruc sockaddr_in
            at sockaddr_in.sin_family, dw 2
            at sockaddr_in.sin_port, dw 0xa1ed
            at sockaddr_in.sin_addr, dd 0
            at sockaddr_in.sin_zero, dd 0, 0
        iend
        sockaddr_in_len     equ $ - pop_sa

section .text

_start:
    mov      word [sock], 0
    mov      word [client], 0


    pop       rax
    pop       rax
    pop       rsi

    call string_to_int

    mov       bl, ah
    mov       bh, al

    mov [pop_sa + sockaddr_in.sin_port], bx

    call     _socket

    call     _listen


    .mainloop:
        call     _accept

        .readloop:
            call     _read
            call     _echo

             mov     rax, [read_count]
             cmp     rax, 0
             jmp      .read_complete
         jmp .readloop

        .read_complete:

        mov rax, 35
        mov rdi, timespec
        xor rsi, rsi        
        syscall


        mov    rdi, [client]
        call   _close_sock
        mov    word [client], 0
    jmp    .mainloop

    mov     rdi, 0
    call     _exit
