; Filename: EXER42.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 16, 2025
; Description: This program asks for a 2-digit number and
; adds both of them, and displays the result

.model small
.stack 200h
.data
msg_ask1 db 13,10,'Enter first number: $'
msg_ask2 db 13,10,'Enter second number: $'
msg_out db 13,10,'The result is: $'
.code
start proc
    mov ax,@data
    mov ds,ax

    mov dx,offset msg_ask1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,30h
    mov bl,al
    rol bl,4
    mov ah,1
    int 21h
    sub al,30h
    add bl,al

    mov dx,offset msg_ask2
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    sub al,30h
    mov cl,al
    rol cl,4
    mov ah,1
    int 21h
    sub al,30h
    add cl,al

    xor bh,bh
    mov al,bl
    add al,cl
    daa
    jnc skip_carry
    inc bh
skip_carry:
    mov bl,al
    mov dx,offset msg_out
    mov ah,9
    int 21h
    cmp bh,0
    je tens_only
    mov dl,bh
    add dl,30h
    mov ah,2
    int 21h
tens_only:
    mov al,bl
    and al,0f0h
    ror al,4
    add al,30h
    mov dl,al
    mov ah,2
    int 21h
    mov al,bl
    and al,0fh
    add al,30h
    mov dl,al
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
start endp
end start