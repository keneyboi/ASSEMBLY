; Filename: EXER31.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 9, 2025
; Description: This program asks the user to enter two single-digit numbers,
; multiplies the two numbers, and displays the product of the two numbers.

.model small
.stack 100h
.data
    prompt1       db 'Enter first number (0-9): $'
    prompt2       db 0ah,'Enter second number (0-9): $'
    output_msg    db 0ah,'The product is: $'
    first_num     db ?
    second_num    db ?
    product       db ?
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

                 mov  al, first_num
                 mov  bl, second_num
                 mul  bl
                 mov  product, al

                 mov  ah, 09h
                 lea  dx, output_msg
                 int  21h
                 call show_output

                 ; Exit Program
                 mov  ax, 4C00h
                 int  21h

get_input proc
                 mov  ah, 01h
                 int  21h
                 sub  al, '0'
                 ret
get_input endp

show_output proc
                 add  product, '0'
                 mov  ah, 0Eh
                 mov  al, product
                 int  10h
                 ret
show_output endp

end main