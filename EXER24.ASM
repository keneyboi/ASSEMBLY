; Filename: EXER24.ASM
; Prompts the user to enter first, middle, and last name and display a greeting
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h
.DATA
    MAX_NAME_LENGTH EQU 50
    firstName db MAX_NAME_LENGTH DUP (?)
    middleName db MAX_NAME_LENGTH DUP (?)
    familyName db MAX_NAME_LENGTH DUP (?)
    firstPrompt db 'Enter First Name: $'
    middlePrompt db 'Enter Middle Name: $'
    familyPrompt db 'Enter Family Name: $'
    helloMsg db 0dh, 0ah, 'Hello, $'
    space db ' $'
    exclamation db '!',13,10,'$'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax
    
    ; Get first name
    mov dx,OFFSET firstPrompt
    mov ah,9
    int 21h
    mov ah,3fh
    mov bx,0
    mov cx,MAX_NAME_LENGTH
    mov dx,OFFSET firstName
    int 21h
    
    ; Get middle name
    mov dx,OFFSET middlePrompt
    mov ah,9
    int 21h
    mov ah,3fh
    mov bx,0
    mov cx,MAX_NAME_LENGTH
    mov dx,OFFSET middleName
    int 21h
    
    ; Get family name
    mov dx,OFFSET familyPrompt
    mov ah,9
    int 21h
    mov ah,3fh
    mov bx,0
    mov cx,MAX_NAME_LENGTH
    mov dx,OFFSET familyName
    int 21h
    
    ; Remove newline characters from strings
    call RemoveNewlines
    
    ; Display greeting
    mov dx,OFFSET helloMsg
    mov ah,9
    int 21h
    
    ; Display first name
    mov ah,40h
    mov bx,1
    mov dx,OFFSET firstName
    mov cx,MAX_NAME_LENGTH
    call FindStringLength
    int 21h
    
    mov dx,OFFSET space
    mov ah,9
    int 21h
    
    ; Display middle name
    mov ah,40h
    mov bx,1
    mov dx,OFFSET middleName
    mov cx,MAX_NAME_LENGTH
    call FindStringLength
    int 21h
    
    mov dx,OFFSET space
    mov ah,9
    int 21h
    
    ; Display family name
    mov ah,40h
    mov bx,1
    mov dx,OFFSET familyName
    mov cx,MAX_NAME_LENGTH
    call FindStringLength
    int 21h
    
    mov dx,OFFSET exclamation
    mov ah,9
    int 21h
    
    ; Exit program
    mov ah,4ch
    int 21h

RemoveNewlines:
    ; Remove newlines from firstName
    mov si,OFFSET firstName
    call RemoveNewlineFromString
    
    ; Remove newlines from middleName
    mov si,OFFSET middleName
    call RemoveNewlineFromString
    
    ; Remove newlines from familyName
    mov si,OFFSET familyName
    call RemoveNewlineFromString
    ret

RemoveNewlineFromString:
    push ax
    push si
RemoveLoop:
    mov al,[si]
    cmp al,0
    jz RemoveDone
    cmp al,13
    jz ReplaceChar
    cmp al,10
    jz ReplaceChar
    inc si
    jmp RemoveLoop
ReplaceChar:
    mov byte ptr [si],0
RemoveDone:
    pop si
    pop ax
    ret

FindStringLength:
    push ax
    push si
    mov si,dx
    mov cx,0
FindLoop:
    mov al,[si]
    cmp al,0
    jz FindDone
    cmp al,13
    jz FindDone
    cmp al,10
    jz FindDone
    inc cx
    inc si
    jmp FindLoop
FindDone:
    pop si
    pop ax
    ret

END ProgramStart