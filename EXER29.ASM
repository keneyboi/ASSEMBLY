; Filename: EXER29.asm
; Programmer Name: Horigome, Ken N.
; Date: October 2, 2025
; Description: This program asks the user two one-digit numbers
; and outputs the sum

.model small
.stack 100h
.data
    first_num db ?
    second_num db ?
    total db ?
    prompt1 db 'Enter first number (0-9): $'
    prompt2 db 0dh, 0ah, 'Enter second number (0-9): $'
    prompt3 db 0dh, 0ah, 'The sum is: $'
.code
main proc
         mov ax, @data
         mov ds, ax

         lea dx, prompt1
         mov ah, 09h
         int 21h

         mov ah, 01h
         int 21h
         sub al, '0'
         mov first_num, al

         lea dx, prompt2
         mov ah, 09h
         int 21h

         mov ah, 01h
         int 21h
         sub al, '0'
         mov second_num, al

         mov al, first_num
         add al, second_num
         mov total, al

         lea dx, prompt3
         mov ah, 09h
         int 21h

         add total, '0'
         mov dl, total
         mov ah, 02h
         int 21h

         mov ax, 4c00h
         int 21h
main endp
end main