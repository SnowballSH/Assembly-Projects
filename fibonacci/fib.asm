global main
extern printf  ; C's printf function
; printf(format, values...)

; Calling C function:
; For integers and pointers, rdi, rsi, rdx, rcx, r8, r9.
; For floating-point (float, double), xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7.

section .text
  main:
    push rbx  ; save the register
    mov cx, 20  ; amount of fib numbers to generate
    xor rax, rax  ; current number (0)
    xor rbx, rbx  ; next number (1)
    inc rbx  ; make it 1

  turn:
    push rax  ; save it or printf will break it
    push rcx  ; same thing

    ; format
    mov rdi, format

    ; current number
    mov rsi, rax

    xor rax, rax  ; TODO I don't know what this line of code does. Works without this line too.

    call printf  ; printf("%18ld\n", rax)

    pop rcx  ; restore value
    pop rax  ; restore value

    mov rdx, rax  ; save old number to temp register rdx
    mov rax, rbx  ; move next to current

    add rbx, rdx  ; rbx += rdx
    dec cx  ; turn ends
    jnz turn  ; jump if non zero

    pop rbx  ; restore rbx before returning (basically freeing some memory)
    ret

  format:
    db "%5ld", 10, 0  ; "%18ld\n" and terminate
