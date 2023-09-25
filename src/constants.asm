segment .data
        sock_err_msg        db "Failed to initialise socket", 0x0a, 0
        sock_err_msg_len    equ $ - sock_err_msg

        bind_err_msg        db "Failed to bind socket to listening address", 0x0a, 0
        bind_err_msg_len    equ $ - bind_err_msg

        lstn_err_msg        db "Failed to listen on socket", 0x0a, 0
        lstn_err_msg_len    equ $ - lstn_err_msg

        accept_err_msg      db "Could not accept connection attempt", 0x0a, 0
        accept_err_msg_len  equ $ - accept_err_msg

        accept_msg          db "Cliente conectado com  sucesso!", 0x0a, 0
        accept_msg_len      equ $ - accept_msg


