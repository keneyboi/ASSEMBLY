; Filename: EXER15.ASM
; Displaying multiple string variables within a single line.
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.data
    String1 db 'Line1 ','$'
    String2 db 'Line2 ','$'
    String3 db 'Line3 ','$'
    String4 db 'Line4 ','$'
    
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