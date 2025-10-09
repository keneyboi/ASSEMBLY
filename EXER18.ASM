; Filename: EXER18.ASM
; Getting charcter input and displaying it until enter is pressed.
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.data
    char db ?
    inputMsg db "Enter a character: $"
    outputMsg db "You entered: ", '$' 
    exitMsg db "Exiting program... $"
    nl db 0Ah, '$'
 
 
.code
main:
    mov ax, @data
    mov ds, ax
 
ReadChar:
 
    mov ah, 09h
    mov dx, offset nl
    int 21h
    mov dx, offset inputMsg
    int 21h
 
    
    mov ah, 01h ; READ
    int 21h
 
    cmp al, 13
    je ExitProgram
 
    mov char, al
 
    mov ah, 09h
    mov dx, offset nl
    int 21h
    mov dx, offset outputMsg
    int 21h    
 
    mov ah, 02h
    mov dl, char ; display the character input
    int 21h
    jmp readChar
 
ExitProgram:
    mov ah, 09h
    mov dx, offset exitMsg
    int 21h
 
    int 27h
 
end main