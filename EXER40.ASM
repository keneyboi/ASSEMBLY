; Filename: EXER40.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 16, 2025
; Description: This program repeatedly asks for an input
; and displays "Thank you." when 0 is inputted.

.model small
.stack 200h
.data
msg_input db 'Enter a single digit number: $'
msg_thanks db 13,10,'Thank you.$'
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
    cmp al,'0'
    je done
    lea dx,msg_newline
    mov ah,9
    int 21h
    int 21h
    jmp input_loop
done:
    lea dx,msg_newline
    mov ah,9
    int 21h
    lea dx,msg_thanks
    mov ah,9
    int 21h
    mov ah,4ch
    mov al,0
    int 21h
start endp
end start