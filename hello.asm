; Hello, Wolrd written in x86 Assembly.
; Credit: https://cs.lmu.edu/~ray/notes/x86assembly/

global    _start

section   .text
_start:   
  mov       rax, 1                  ; system call for write
  mov       rdi, 1                  ; file handle 1 is stdout
  mov       rsi, message            ; address of string to output
  mov       rdx, 13                 ; number of bytes
  syscall
  mov       rax, 60                 ; system call for exit
  xor       rdi, rdi                ; exit code 0 (1 ^ 1 = 0)
  syscall

section   .data
  message:  db        "Hello, World", 10      ; note the newline at the end