; Filename: EXER23.ASM
; Check whether the user input is 'A' and displays appropriate message
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.DATA

    inputChar db ?
    prompt db 'Enter a character: $'
    yesMsg db 'Yes, you have entered letter A.',13,10,'$'
    noMsg1 db 'No, you have not entered letter A.', 0dh, 0ah, 'You entered character $'
    noMsg2 db '.',13,10,'$'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax
    
    ; Display prompt
    mov dx,OFFSET prompt
    mov ah,9
    int 21h
    
    ; Get character input
    mov ah,1
    int 21h
    mov inputChar,al
    
    ; Print newline
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    
    ; Check if character is 'A'
    cmp inputChar, 41h
    jz IsLetterA
    
    ; Display "No" message
    mov dx,OFFSET noMsg1
    mov ah,9
    int 21h
    mov dl,inputChar
    mov ah,2
    int 21h
    mov dx,OFFSET noMsg2
    mov ah,9
    int 21h
    jmp Done
    
IsLetterA:
    ; Display "Yes" message
    mov dx,OFFSET yesMsg
    mov ah,9
    int 21h
    
Done:
    ; Exit program
    mov ah,4ch
    int 21h
    
END ProgramStart