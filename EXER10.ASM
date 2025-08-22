; Filename: EXER12.ASM
; Display Duck
; Name: Ken Horigome
; Date: August 22, 2025
 
.model small
.stack 100h
.data
.code

start: 

        mov ah 09h

        mov al, ' '
        mov bh, 0
        mov bl, 40h
        int 10h

        mov ah, 4ch
        int 27h
    
end start