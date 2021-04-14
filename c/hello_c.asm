; Hello, Wolrd written in x86 Assembly with C library.

global main
extern puts

section .text
  main:
    mov rdi, message
    call puts  ; calls the C function!
    ret  ; return
  message:
    db "Hello, world!", 0  ; in C strings are terminated with 0
