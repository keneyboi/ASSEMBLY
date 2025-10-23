; Filename: EXER38.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 16, 2025
; Description: This program prompts the user a number from
; 1 - 8 and displays 1 to the entered number: it also displays
; an error message when the input is invalid.

.model small
.stack 200h
.data
msg_input db 'enter a number from 1 to 8: $'
msg_error db 13,10,'error: number out of range!$'
msg_newline db 13,10,'$'
.code
start proc
    mov ax,@data
    mov ds,ax

input_loop:
    lea dx,msg_input
    mov ah,9
    int 21h

    mov ah,1
    int 21h

    cmp al,'1'
    jb error_show
    cmp al,'8'
    ja error_show

    push ax
    lea dx,msg_newline
    mov ah,9
    int 21h
    pop ax
    sub al,'0'

    xor ch,ch
    mov cl,al
    mov bh,1

    lea dx,msg_newline
    mov ah,9
    int 21h

display_loop:
    mov dl,bh
    add dl,'0'
    mov ah,2
    int 21h
    mov dl,' '
    mov ah,2
    int 21h
    inc bh
    loop display_loop

    mov ah,4ch
    mov al,0
    int 21h

error_show:
    lea dx,msg_newline
    mov ah,9
    int 21h
    lea dx,msg_error
    mov ah,9
    int 21h
    lea dx,msg_newline
    mov ah,9
    int 21h
    lea dx,msg_newline
    mov ah,9
    int 21h
    jmp input_loop
start endp
end start