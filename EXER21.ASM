; Filename: EXER21.ASM
; Gets String input from user and display back the revese of the input.
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.DATA

    MAXIMUM_STRING_LENGTH EQU 100
    StringInput DB MAXIMUM_STRING_LENGTH DUP (?)
    InputPrompt DB 'Enter text: $'
    OutputPrompt DB 13,10,'Reversed text: $'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax ; set DS to point to the data segment
    
    ; Display input prompt
    mov dx,OFFSET InputPrompt
    mov ah,9
    int 21h
    
    ; Read string input
    mov ah,3fh ; DOS read from handle function
    mov bx,0 ; standard input handle
    mov cx,MAXIMUM_STRING_LENGTH ; read up to maximum number of characters
    mov dx,OFFSET StringInput ; store the string here
    int 21h ; get the string
    
    and ax,ax ; were any characters read?
    jz Done ; no, so you're done
    
    mov cx,ax ; put string length in CX
    dec cx ; exclude the Enter character (carriage return)
    dec cx ; exclude the line feed character
    
    ; Display output prompt
    mov dx,OFFSET OutputPrompt
    mov ah,9
    int 21h
    
    ; Reverse and display the string
    mov si,OFFSET StringInput
    add si,cx ; point to last character
    dec si ; adjust for zero-based indexing
    
ReverseLoop:
    mov dl,[si] ; get character from end
    mov ah,2 ; DOS display character function
    int 21h ; display the character
    dec si ; move to previous character
    loop ReverseLoop ; continue until CX = 0
    
    ; Display newline
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h

Done:
    mov ah,4ch ; DOS terminate program function
    int 21h ; terminate the program
    
END ProgramStart