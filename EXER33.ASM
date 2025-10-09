; Filename: EXER33.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 9, 2025
; Description: This program takes a single character input from the user.
; If the entered character is 'A', it displays "You entered A."
; Otherwise, it displays "You entered not A."

.model small
.stack 100h
.data
    message_a       db 'You entered A.$'
    message_not_a   db 'You entered not A.$'
    prompt_message  db 'Enter a character: $'

.code
main proc
          mov ax, @data
          mov ds, ax

          mov ah, 9
          lea dx, prompt_message
          int 21h

          mov ah, 1
          int 21h
          mov bl, al

          mov ah, 2
          mov dl, 0Ah
          int 21h
          mov dl, 0Dh
          int 21h

          cmp bl, 'A'
          je  is_a

not_a:
          mov ah, 9
          lea dx, message_not_a
          int 21h
          jmp exit_program

is_a:
          mov ah, 9
          lea dx, message_a
          int 21h

exit_program:
          mov ah, 4Ch
          int 21h
main endp
end main