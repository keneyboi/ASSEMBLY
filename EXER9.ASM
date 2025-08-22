; Filename: EXER9.ASM
; Display I <3 U with blinking red heart
; Name: Ken Horigome
; Date: August 22, 2025
 
.model small
.stack 100h
 
.data
.code
 
main:

    int 10h

    mov ah, 09h
    mov al, 'I'
    mov bh, 0
    mov bl, 0eh
    mov cx, 1
    int 10h

    
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 2
    int 10h


    mov ah, 09h
    mov al, 3
    mov bh, 0
    mov bl, 8ch
    mov cx, 1
    int 10h
    
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 4
    int 10h

    mov ah, 09h
    mov al, 'U'
    mov bh, 0
    mov bl, 0eh
    mov cx, 1
    int 10h

    mov ah, 4ch
    int 21h

end main