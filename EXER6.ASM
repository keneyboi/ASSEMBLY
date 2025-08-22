; Filename: EXER5.ASM
; Displaying Special Characters
; Name: Ken Horigome
; Date: August 22, 2025

.model small
.code
.stack 100
start: 
        

        mov ah, 02h
        mov cl, '0' 
        mov dl, cl  
        int 21h    

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '1'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '2'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '3'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '4'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '5' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '6' 
        mov dl, cl  
        int 21h    

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '7'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '8'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '9'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 0ah
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '!'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '*' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h
        
        mov ah, 02h
        mov cl, '#'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '$' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h
        
        mov ah, 02h
        mov cl, '%'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '^' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h
        
        mov ah, 02h
        mov cl, '&'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '*' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h
        
        mov ah, 02h
        mov cl, '('
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ')' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

;
        mov ah, 02h
        mov cl, 0ah
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '-'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '_' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h
        
        mov ah, 02h
        mov cl, '+'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '=' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h
        
        mov ah, 02h
        mov cl, '{'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '}' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h
        
        mov ah, 02h
        mov cl, '['
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ']' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h
        
        mov ah, 02h
        mov cl, '<'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ')' 
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ' '
        mov dl, cl
        int 21h




int 27h
end start