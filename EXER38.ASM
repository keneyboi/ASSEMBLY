; Filename: EXER38.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 16, 2025
; Description: This program displays the numbers from 1 - 20
; horizontal with single spaces in-between

.model small
.stack 200h
.data
    count dw 0
    num dw 0
.code
start proc
    mov ax,@data
    mov ds,ax

    mov cx,20
    mov bx,1
    mov count,cx
    mov num,bx

loop_print:
    cmp bx,20
    je print20
    cmp bx,10
    jl single

    mov dl,'1'
    mov ah,2
    int 21h
    mov al,bl
    sub al,10
    add al,'0'
    mov dl,al
    mov ah,2
    int 21h
    jmp spacer

single:
    mov al,bl
    add al,'0'
    mov dl,al
    mov ah,2
    int 21h
    jmp spacer

print20:
    mov dl,'2'
    mov ah,2
    int 21h
    mov dl,'0'
    mov ah,2
    int 21h

spacer:
    mov dl,' '
    mov ah,2
    int 21h
    inc bx
    loop loop_print

    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h

    mov ah,4ch
    mov al,0
    int 21h
start endp
end start