; Filename: EXER25.ASM
; Prompts the user about their school information and
; summarizes it properly.
; Name: Ken N. Horigome
; Date: September 13, 2025

.model small
.stack 200h
.DATA
MAX_INPUT EQU 50

; Input storage variables
    studentID db MAX_INPUT DUP (?)
    firstName db MAX_INPUT DUP (?)
    middleName db MAX_INPUT DUP (?)
    lastName db MAX_INPUT DUP (?)
    address db MAX_INPUT DUP (?)
    course db MAX_INPUT DUP (?)
    year db MAX_INPUT DUP (?)
    birthMonth db MAX_INPUT DUP (?)
    birthDay db MAX_INPUT DUP (?)
    birthYear db MAX_INPUT DUP (?)
    email db MAX_INPUT DUP (?)

; Header messages
    header1 db 'Cebu Institute of Technology - University',13,10,'$'
    header2 db 'STUDENT ENROLLMENT FORM',13,10,'$'
    instruction db 'Please enter the following information:',13,10,'$'

; Input prompts
    idPrompt db 'Student ID Number: $'
    fnPrompt db 'First Name: $'
    mnPrompt db 'Middle Name: $'
    lnPrompt db 'Last Name: $'
    addrPrompt db 'Address: $'
    coursePrompt db 'Course: $'
    yearPrompt db 'Year: $'
    monthPrompt db 'Birthday Month: $'
    dayPrompt db 'Birthday Day: $'
    birthYearPrompt db 'Birthday Year: $'
    emailPrompt db 'Email Address: $'

; Summary section
    summaryHeader db 13,10,'SUMMARY',13,10,'$'
    summaryInstruct db 'Please check if all pieces of information are correct.', 0dh, 0ah ,13,10,'$'
    idLabel db 'ID Number: $'
    nameLabel db 'Full Name: $'
    addrLabel db 'Address: $'
    courseLabel db 'Course & Year: $'
    bdayLabel db 'Birthday: $'
    emailLabel db 'Email Address: $'
    thankYou db 0dh, 0ah, 'Thank you for enrolling at CIT-U.',13,10,'$'
    copyright db 'Copyright 2025',13,10,'$'
    programmer db 'Programmer: Ken N. Horigome',13,10,'$'

; Formatting
    comma db ', $'
    space db ' $'
    newline db 13,10,'$'

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax
    
    ; Display header
    mov dx,OFFSET header1
    mov ah,9
    int 21h
    mov dx,OFFSET header2
    mov ah,9
    int 21h
    mov dx,OFFSET instruction
    mov ah,9
    int 21h
    
    ; Get Student ID
    mov dx,OFFSET idPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET studentID
    call GetInput
    
    ; Get First Name
    mov dx,OFFSET fnPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET firstName
    call GetInput
    
    ; Get Middle Name
    mov dx,OFFSET mnPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET middleName
    call GetInput
    
    ; Get Last Name
    mov dx,OFFSET lnPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET lastName
    call GetInput
    
    ; Get Address
    mov dx,OFFSET addrPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET address
    call GetInput
    
    ; Get Course
    mov dx,OFFSET coursePrompt
    mov ah,9
    int 21h
    mov dx,OFFSET course
    call GetInput
    
    ; Get Year
    mov dx,OFFSET yearPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET year
    call GetInput
    
    ; Get Birthday Month
    mov dx,OFFSET monthPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET birthMonth
    call GetInput
    
    ; Get Birthday Day
    mov dx,OFFSET dayPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET birthDay
    call GetInput
    
    ; Get Birthday Year
    mov dx,OFFSET birthYearPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET birthYear
    call GetInput
    
    ; Get Email
    mov dx,OFFSET emailPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET email
    call GetInput
    
    ; Display Summary
    mov dx,OFFSET summaryHeader
    mov ah,9
    int 21h
    mov dx,OFFSET summaryInstruct
    mov ah,9
    int 21h
    
    ; Display ID Number
    mov dx,OFFSET idLabel
    mov ah,9
    int 21h
    mov dx,OFFSET studentID
    call DisplayString
    mov dx,OFFSET newline
    mov ah,9
    int 21h
    
    ; Display Full Name (Last, First Middle)
    mov dx,OFFSET nameLabel
    mov ah,9
    int 21h
    mov dx,OFFSET lastName
    call DisplayString
    mov dx,OFFSET comma
    mov ah,9
    int 21h
    mov dx,OFFSET firstName
    call DisplayString
    mov dx,OFFSET space
    mov ah,9
    int 21h
    mov dx,OFFSET middleName
    call DisplayString
    mov dx,OFFSET newline
    mov ah,9
    int 21h
    
    ; Display Address
    mov dx,OFFSET addrLabel
    mov ah,9
    int 21h
    mov dx,OFFSET address
    call DisplayString
    mov dx,OFFSET newline
    mov ah,9
    int 21h
    
    ; Display Course & Year
    mov dx,OFFSET courseLabel
    mov ah,9
    int 21h
    mov dx,OFFSET course
    call DisplayString
    mov dx,OFFSET space
    mov ah,9
    int 21h
    mov dx,OFFSET year
    call DisplayString
    mov dx,OFFSET newline
    mov ah,9
    int 21h
    
    ; Display Birthday
    mov dx,OFFSET bdayLabel
    mov ah,9
    int 21h
    mov dx,OFFSET birthMonth
    call DisplayString
    mov dx,OFFSET space
    mov ah,9
    int 21h
    mov dx,OFFSET birthDay
    call DisplayString
    mov dx,OFFSET comma
    mov ah,9
    int 21h
    mov dx,OFFSET birthYear
    call DisplayString
    mov dx,OFFSET newline
    mov ah,9
    int 21h
    
    ; Display Email
    mov dx,OFFSET emailLabel
    mov ah,9
    int 21h
    mov dx,OFFSET email
    call DisplayString
    mov dx,OFFSET newline
    mov ah,9
    int 21h
    
    ; Display closing
    mov dx,OFFSET thankYou
    mov ah,9
    int 21h
    mov dx,OFFSET copyright
    mov ah,9
    int 21h
    mov dx,OFFSET programmer
    mov ah,9
    int 21h
    
    ; Exit program
    mov ah,4ch
    int 21h

; Procedure to get input
GetInput:
    push ax
    push bx
    push cx
    mov ah,3fh
    mov bx,0
    mov cx,MAX_INPUT
    int 21h
    ; Remove newline characters
    push dx
    mov si,dx
    call RemoveNewlineFromString
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; Procedure to display string
DisplayString:
    push ax
    push bx
    push cx
    mov ah,40h
    mov bx,1
    call FindStringLength
    int 21h
    pop cx
    pop bx
    pop ax
    ret

; Remove newline from string
RemoveNewlineFromString:
    push ax
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
    jmp RemoveDone
RemoveDone:
    pop ax
    ret

; Find string length
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