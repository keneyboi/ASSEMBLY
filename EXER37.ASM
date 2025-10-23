; Filename: EXER37.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 16, 2025
; Description: This programs verticaly displays the
; numbers 1 - 10;

.model small
.stack 200h
.data
    ctr dw 10
    num db 1
.code
start proc
    mov ax,@data
    mov ds,ax

    mov cx,ctr
    mov bl,num

loop_disp:
    cmp bl,10
    jne single_disp

    mov dl,'1'
    mov ah,2
    int 21h
    mov dl,'0'
    mov ah,2
    int 21h
    jmp newline

single_disp:
    mov al,bl
    add al,'0'
    mov dl,al
    mov ah,2
    int 21h

newline:
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h

    inc bl
    loop loop_disp

    mov ah,4ch
    mov al,0
    int 21h
start endp
end start