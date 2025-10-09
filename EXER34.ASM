; Filename: EXER34.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 9, 2025
; Description: This program takes a single-digit input (0–9) from the user
; and determines whether it is less than, equal to, or greater than 5.

.model small
.stack 100h
.data
    prompt_message db 'Enter a number (0-9): $'
    message_equal  db 'The number is equal to 5.$'
    message_less   db 'The number is less than 5.$'
    message_greater db 'The number is greater than 5.$'

.code
main proc
            mov ax, @data
            mov ds, ax

            mov ah, 9
            lea dx, prompt_message
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

            cmp bl, 5
            je  is_equal
            jl  is_less
            jg  is_greater

is_equal:
            mov ah, 9
            lea dx, message_equal
            int 21h
            jmp exit_program

is_less:
            mov ah, 9
            lea dx, message_less
            int 21h
            jmp exit_program

is_greater:
            mov ah, 9
            lea dx, message_greater
            int 21h

exit_program:
            mov ah, 4Ch
            int 21h
main endp
end main