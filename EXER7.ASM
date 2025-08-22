; Filename: EXER5.ASM
; Display "College of Computer Studies"
; Name: Ken Horigome
; Date: August 22, 2025
 
.model small
.stack 100h
 
.data

    college     db "College", 0ah, '$'
    of          db "of", 0ah, '$'
    computer    db "Computer", 0ah, '$'
    studies     db "Studies", 0ah, '$'

.code
start: 

        mov ax, @data
        mov ds, ax

        mov ah, 09h

        mov bl, 3eh
        mov cx, 1d
        int 10h

        mov dx, offset college
        int 21h

        mov bl, 00h
        mov cx, 100d
        int 10h


        mov bl, 2bh
        mov cx, 2d
        int 10h

        mov dx, offset of
        int 21h

        mov bl, 00h
        mov cx, 100d
        int 10h


        mov bl, 2ah
        mov cx, 8d
        int 10h

        mov dx, offset computer
        int 21h

        mov bl, 00h
        mov cx, 100d
        int 10h


        mov bl, 4bh
        mov cx, 7d
        int 10h

        mov dx, offset studies
        int 21h

        mov bl, 00h
        mov cx, 100d
        int 10h

     
        int 27h

    

end start
 
