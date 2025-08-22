; Filename: EXER5.ASM
; Displaying lowercase and uppercase letters with space
; Name: Ken Horigome
; Date: August 22, 2025

.model small
.code
.stack 100
start: 


        mov ah, 02h
        mov cl, 'a'
        mov dl, cl  
        int 21h    

        mov ah, 02h
        mov cl, 'b'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'c'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'd'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, 'f' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'g'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'h'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'j' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'k'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'l'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'm'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'n'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'p'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'q'
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, 'r' 
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, 's'
        mov dl ,cl
        int 21h

        mov ah, 02h
        mov cl, 't'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'u'
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, 'v'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'w'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'x'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'y'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'z'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 0ah
        mov dl, cl 
        int 21h
        
        ;A
        mov ah, 02h
        mov cl, 41h 
        mov dl, cl  
        int 21h    

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;B
        mov ah, 02h
        mov cl, 42h
        mov dl, cl
        int 21h

        
        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h


        ;C
        mov ah, 02h
        mov cl, 43h
        mov dl, cl
        int 21h


        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h


        ;D
        mov ah, 02h
        mov cl, 44h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;E 
        mov ah, 02h
        mov cl, 45h
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;F
        mov ah, 02h
        mov cl, 46h 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;G
        mov ah, 02h
        mov cl, 47h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;H 
        mov ah, 02h
        mov cl, 48h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;I
        mov ah, 02h
        mov cl, 49h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;J
        mov ah, 02h
        mov cl, 4ah 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;K
        mov ah, 02h
        mov cl, 4bh
        mov dl, cl
        int 21h

       mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;L
        mov ah, 02h
        mov cl, 4ch
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;M
        mov ah, 02h
        mov cl, 4dh
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;N
        mov ah, 02h
        mov cl, 4eh
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h
        
        ;O
        mov ah, 02h
        mov cl, 4fh
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;P
        mov ah, 02h
        mov cl, 50h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;Q
        mov ah, 02h
        mov cl, 51h
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;R
        mov ah, 02h
        mov cl, 52h 
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;S
        mov ah, 02h
        mov cl, 53h
        mov dl ,cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;T
        mov ah, 02h
        mov cl, 54h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;U
        mov ah, 02h
        mov cl, 55h
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;V
        mov ah, 02h
        mov cl, 56h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;W
        mov ah, 02h
        mov cl, 57h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;X
        mov ah, 02h
        mov cl, 58h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;Y
        mov ah, 02h
        mov cl, 59h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        ;Z
        mov ah, 02h
        mov cl, 5ah
        mov dl, cl
        int 21h


int 27h
end start