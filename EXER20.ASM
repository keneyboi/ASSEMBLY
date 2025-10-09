; Filename: EXER20.ASM
; Gets String input from user and display back String.
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.DATA

    MAXIMUM_STRING_LENGTH EQU 1000
    StringInput DB MAXIMUM_STRING_LENGTH DUP (?)
    InputPrompt DB 'Enter text: $'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax 

    mov dx,OFFSET InputPrompt
    mov ah,9
    int 21h

    mov ah,3fh 
    mov bx,0 
    mov cx,MAXIMUM_STRING_LENGTH 
    mov dx,OFFSET StringInput 
    int 21h 

    and ax,ax 
    jz Done
    mov cx,ax 
    push cx

    mov bx,OFFSET StringInput
    pop cx 
    mov ah,40h 
    mov bx,1
    mov dx,OFFSET StringInput 
    int 21h 

Done:
    mov ah,4ch ; DOS terminate program function
    int 21h ; terminate the program
END ProgramStart