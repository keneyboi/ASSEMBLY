; Filename EXER3.ASM
; Displaying the 1-10 with spaces
; Name: Ken Horigome
; Date: August 15, 2025

.model small   ; Directive to use "small" memory model
.code          ; section of program containing ecxecutable code
.stack 100     ; define the size of the program stack;
start:          ; start of the program

        mov ah, 02h
        mov cl, 31h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 32h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 33h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 34h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 35h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 36h
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 37h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 38h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 39h
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 31h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 30h
        mov dl, cl
        int 21h


int 27h
end start
