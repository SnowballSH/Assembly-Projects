; Prints a triangle!

global _start

section .text
  _start:
    mov rdx, out  ; rdx = next byte to write
    mov r11, 1  ; number of chars to write
    mov r12, 0  ; number of chars written so far

  writeLine:
    mov byte [rdx], '\'  ; move char to rdx
    inc rdx
    inc r12
    cmp r12, r11  ; comparison
    jne writeLine  ; jump back if not finished

  lineDone:
    mov byte [rdx], 10  ; move char to rdx
    inc rdx
    inc r11  ; write one more next time
    mov r12, 0  ; replace the count with 0
    cmp r11, lineLimit  ; did we finish?
    jng writeLine  ; if not, write it
  
  finish:
    mov rax, 1  ; write
    mov rdi, 1  ; stdout
    mov rsi, out  ; move to output
    mov rdx, dataSize
    syscall

    mov rax, 60  ; exit
    mov rdi, 0  ; 0
    syscall

section .bss  ; writable data
  lineLimit equ 8
  dataSize equ 44
  out:
    resb dataSize

; Result:
; #
; ##
; ###
; ####
; #####
; ######
; #######
; ########
