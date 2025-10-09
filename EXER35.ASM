; Filename: EXER35.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 9, 2025
; Description: This program accepts two single-digit integers (0–9),
; compares them, and displays whether they are equal,
; or which number is greater.

.model small
.stack 100h
.data
    prompt_num1    db 'Enter first number (0-9): $'
    prompt_num2    db 'Enter second number (0-9): $'
    message_equal  db 'The numbers are equal.$'
    message_first  db 'The first number is greater.$'
    message_second db 'The second number is greater.$'

.code
main proc
                   mov ax, @data
                   mov ds, ax

                   mov ah, 9
                   lea dx, prompt_num1
                   int 21h

                   mov ah, 1
                   int 21h
                   sub al, 30h
                   mov bl, al

                   mov ah, 2
                   mov dl, 0Ah
                   int 21h
                   mov dl, 0Dh
                   int 21h

                   mov ah, 9
                   lea dx, prompt_num2
                   int 21h

                   mov ah, 1
                   int 21h
                   sub al, 30h
                   mov bh, al

                   mov ah, 2
                   mov dl, 0Ah
                   int 21h
                   mov dl, 0Dh
                   int 21h

                   mov al, bl
                   cmp al, bh
                   je  is_equal
                   jg  first_greater
                   jl  second_greater

is_equal:
                   mov ah, 9
                   lea dx, message_equal
                   int 21h
                   jmp exit_program

first_greater:
                   mov ah, 9
                   lea dx, message_first
                   int 21h
                   jmp exit_program

second_greater:
                   mov ah, 9
                   lea dx, message_second
                   int 21h

exit_program:
                   mov ah, 4Ch
                   int 21h
main endp
end main