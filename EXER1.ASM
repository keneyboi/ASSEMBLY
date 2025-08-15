; Filename EXER1.ASM
; Displaying single characters, numbers. and symbols
; Name: Ken Horigome
; Date: August 15, 2025

.model small   ; Directive to use "small" memory model
.code          ; section of program containing ecxecutable code
.stack 100     ; define the size of the program stack;
start:          ; start of the program


mov ah, 02h ; Set AH to dislay a character

        ;A
        
        mov cl, 'a' ; 41h is capital A
        mov dl, cl  ; copies 8-bit value in cl to dl
        int 21h     ; interupt for input/output

       
        mov cl, 0ah
        mov dl, cl
        int 21h

        ;B
        mov cl, 42h
        mov dl, cl
        int 21h


int 27h     ; Terminate program
end start   ; end program