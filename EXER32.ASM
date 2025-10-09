; Filename: EXER32.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 9, 2025
; Description: This program prompts the user to enter two single-digit numbers,
; divides the first number by the second, and displays the quotient.

.model small
.stack 100h
.data
    prompt1       db 'Enter first number (0-9): $'
    prompt2       db 0ah,'Enter second number (1-9): $'
    output_msg    db 0ah,'The quotient is: $'
    first_num     db ?
    second_num    db ?
    quotient      db ?
.code
main:
                 mov  ax, @data
                 mov  ds, ax

                 mov  ah, 09h
                 lea  dx, prompt1
                 int  21h
                 call get_input
                 mov  first_num, al

                 mov  ah, 09h
                 lea  dx, prompt2
                 int  21h
                 call get_input
                 mov  second_num, al

                 cmp  second_num, 0
                 je   div_by_zero

                 mov  al, first_num
                 xor  ah, ah
                 mov  bl, second_num
                 div  bl
                 mov  quotient, al

                 mov  ah, 09h
                 lea  dx, output_msg
                 int  21h
                 call show_output

                 mov  ax, 4C00h
                 int  21h

div_by_zero:
                 mov  ah, 09h
                 lea  dx, prompt2
                 int  21h
                 mov  ax, 4C00h
                 int  21h

get_input proc
                 mov  ah, 01h
                 int  21h
                 sub  al, '0'
                 ret
get_input endp

show_output proc
                 add  quotient, '0'
                 mov  ah, 0Eh
                 mov  al, quotient
                 int  10h
                 ret
show_output endp

end main