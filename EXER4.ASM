; Filename EXER2.ASM
; Displaying the alphabet
; Name: Ken Horigome
; Date: August 15, 2025

.model small   ; Directive to use "small" memory model
.code          ; section of program containing ecxecutable code
.stack 100     ; define the size of the program stack;
start:          ; start of the program

        mov ah, 02h
        mov cl, 41h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 42h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 4fh
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 55h
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl , 54h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl ,cl
        int 21h

        mov ah, 02h
        mov cl, 4dh
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 45h
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, 0ah
        mov dl, cl
        int 21h


        mov ah, 02h
        mov cl, 49h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 44h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        ;NUMBER
        mov ah, 02h
        mov cl, 4eh
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 75h
        mov dl, cl
        int 21h


        mov ah, 02h
        mov cl, 6dh
        mov dl ,cl
        int 21h

        mov ah, 02h
        mov cl, 62h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 65h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 72h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 3ah
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '2'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '4'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '-'
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, '0'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '8'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '9'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '5'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '-'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '3'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '7'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '6'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 0ah
        mov dl, cl
        int 21h

        ; First name
        mov ah, 02h
        mov cl, 'F'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'r'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 's'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 't'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'N'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'a'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'm'
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl ,cl
        int 21h

        mov ah, 02h
        mov cl, ':'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'K'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl 
        int 21h

        mov ah, 02h
        mov cl, 'n'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 0ah
        mov dl, cl
        int 21h

        ; Middle Name
        mov ah, 02h
        mov cl, 'M'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'd'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'd'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'l'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'N'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'a'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'm'
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl ,cl
        int 21h

        mov ah, 02h
        mov cl, ':'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'N'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl ,cl
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
        mov cl, 0ah
        mov dl, cl
        int 21h

        ; Last Name
        mov ah, 02h
        mov cl, 'L'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'a'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 's'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 't'
        mov dl, cl
        int 21h
        
        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'N'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'a'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'm'
        mov dl , cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl ,cl
        int 21h

        mov ah, 02h
        mov cl, ':'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'H'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'r'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'g'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'm'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 0ah
        mov dl, cl
        int 21h

        ; Course and Year
        mov ah, 02h
        mov cl, 'C'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'u'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'r'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 's'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'a'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'n'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'd'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'Y'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'a'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'r'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ':'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'B'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'a'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'c'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'h'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'l'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'r'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'f'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'S'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'c'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'n'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'c'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'n'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'C'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'm'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'p'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'u'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 't'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'r'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'S'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'c'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'n'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'c'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '2'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 0ah
        mov dl, cl
        int 21h
        
        ;School
        mov ah, 02h
        mov cl, 'S'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'c'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'h'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'l'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, ':'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'C'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'b'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'u'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'I'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'n'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 's'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 't'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 't'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'u'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 't'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'f'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'T'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'c'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'h'
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
        mov cl, 'l'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'o'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'g'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'y'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, '-'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 20h
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'U'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'n'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'v'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'e'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'r'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 's'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'i'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 't'
        mov dl, cl
        int 21h

        mov ah, 02h
        mov cl, 'y'
        mov dl, cl
        int 21h

int 27h
end start