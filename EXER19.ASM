; Filename: EXER19.ASM
; Displaying greeting based on Y or N input from User.
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.DATA
    TimePrompt DB 'Is it after 12 noon (Y/N)?$'
    GoodMorningMessage LABEL BYTE 
    DB 13,10,'Good morning, world!',13,10,'$'
    GoodAfternoonMessage LABEL BYTE 
    DB 13,10,'Good afternoon, world!',13,10,'$'
.CODE
ProgramStart:

    mov ax,@data
    mov ds,ax 
    mov dx,OFFSET TimePrompt 

    mov ah,9 
    int 21h 

    mov ah,1 
    int 21h 

    cmp al,'y' 
    jz IsAfternoon 

    cmp al,'Y' 
    jnz IsMorning 

IsAfternoon:
    mov dx,OFFSET GoodAfternoonMessage 
    jmp DisplayGreeting 

IsMorning:
    mov dx,OFFSET GoodMorningMessage 

DisplayGreeting:
    mov ah,9 
    int 21h

    mov ah,4ch
    int 21h 

END ProgramStart