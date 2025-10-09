; Filename: EXER17.ASM
; Getting single charcter input and displaying it.
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.data
    
    inputChar db ? 


    inputMsg  db 'Enter a character: $'
    outputMsg db 0dh, 0ah, 'You entered: $'

.CODE
Main:
 
    mov ax, @data
    mov ds, ax
    
    mov dx,offset inputMsg
    mov ah,09h
    int 21h

    ; read a character from the keyboard
    mov ah,01h 
    int 21h 
    
    ; call DOS interrupt
    mov inputChar, al 

    ; display the output message
    mov dx,offset outputMsg
    mov ah,09h
    int 21h

    ; display the character back
    mov dl, inputChar
    mov ah,02h 
    int 21h 

    mov ax,4C00h 
    int 21h

END Main