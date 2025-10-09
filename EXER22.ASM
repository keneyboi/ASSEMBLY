; Filename: EXER22.ASM
; Gets 3 char input from user and displays each on its own line
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.DATA
    char1 db ?
    char2 db ?
    char3 db ?
    prompt1 db 'Enter first character: $'
    prompt2 db 'Enter second character: $'
    prompt3 db 'Enter third character: $'
    output1 db 'The first character is $'
    output2 db 'The second character is $'
    output3 db 'The third character is $'
    period db '.',13,10,'$'
    newline db 13,10,'$'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax
    
    ; prompts first character
    mov dx,OFFSET prompt1
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov char1,al
    
    ; Print newline
    mov dx,OFFSET newline
    mov ah,9
    int 21h
    
    ; prompts second character
    mov dx,OFFSET prompt2
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov char2,al
    
    ; Print newline
    mov dx,OFFSET newline
    mov ah,9
    int 21h
    
    ; prompts third character
    mov dx,OFFSET prompt3
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov char3,al
    
    ; Print newline
    mov dx,OFFSET newline
    mov ah,9
    int 21h
    
    ; Display the first character
    mov dx,OFFSET output1
    mov ah,9
    int 21h
    mov dl,char1
    mov ah,2
    int 21h
    mov dx,OFFSET period
    mov ah,9
    int 21h
    
    ; Displays the second character
    mov dx,OFFSET output2
    mov ah,9
    int 21h
    mov dl,char2
    mov ah,2
    int 21h
    mov dx,OFFSET period
    mov ah,9
    int 21h
    
    ; Displays the third character
    mov dx,OFFSET output3
    mov ah,9
    int 21h
    mov dl,char3
    mov ah,2
    int 21h
    mov dx,OFFSET period
    mov ah,9
    int 21h
    
    mov ah,4ch
    int 21h
    
END ProgramStart