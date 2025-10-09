; Filename: EXER16.ASM
; Displaying multiple string variables on multiple lines.
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.data
    String1 db 'Line1 ', 0dh, 0ah, '$'
    String2 db 'Line2 ', 0dh, 0ah, '$'
    String3 db 'Line3 ', 0dh, 0ah, '$'
    String4 db 'Line4 ', 0dh, 0ah, '$'
    
.code
start:
    mov ax, @data
    mov ds, ax

    mov ah, 09h

    mov dx, offset String1
    int 21h
    mov dx, offset String2
    int 21h
    mov dx, offset String3
    int 21h
    mov dx, offset String4
    int 21h
    
    int 27h

end start