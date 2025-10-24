; Filename: MIDTERM_HORIGOME
; Automatic teller machine that gets input from user
; Name: HORIGOME, KEN
; Date: OCTOBER 24, 2025

.model small
.stack 200h

.DATA
MAXIMUM_STRING_LENGTH EQU 100

StringInput DB MAXIMUM_STRING_LENGTH DUP (?)
inputChar db ? 
buffer      DB 100, ?, 100 DUP(?)        ; DOS input buffer

HEADER      DB  0ah, "  CIT-U BANK", 0Ah, 0ah, 0Dh, \
                "  Automatic Teller Machine", 0Ah, 0Dh, \
                "  Copyright 2025", 0Ah, 0Dh, \
                "  Programmer: KEN HORIGOME", 0Ah, 0Dh, \
                "  Welcome!", 0Ah, 0Ah, 0Dh, '$'

MAIN_MENU   DB "  MAIN MENU", 0Ah, 0Dh, \
                "  1 Balance Inquiry", 0Ah, 0Dh, \
                "  2 Deposit", 0Ah, 0Dh, \
                "  3 Withdraw", 0Ah, 0Dh, \
                "  4 Pay Bills", 0Ah, 0Dh, \
                "  5 Exit", 0Ah, 0Dh, '$'



OPEN_SCREEN DB "  Please insert your card.", 0Ah, 0Dh, '$'
PROMPT1     DB '  Enter your PIN: $'
PROMPT2     DB '  Please enter number of your choice: $'
PROMPT3     DB '  Continue Y/N: $'

StringCompareTo DB "1234", 0

msg_equal   DB 0Ah, 0Dh, "Strings are equal!", 0Ah, 0Dh, '$'
msg_noteq   DB "WRONG PIN!"

BALANCE_INQUIRY DB 0Ah, 0Dh, 0Ah, 0Dh, "  BALANCE INQUIRY", 0Ah, 0Dh, '$'
DEPOSIT_MSG     DB 0Ah, 0Dh, 0Ah, 0Dh,"  DEPOSIT", 0Ah, 0Dh, '$'
WITHDRAW_MSG    DB 0Ah, 0Dh, 0Ah, 0Dh,"  WITHDRAW", 0Ah, 0Dh, '$'
PAYBILLS_MSG    DB 0Ah, 0Dh, 0Ah, 0Dh,"  PAY BILLS", 0Ah, 0Dh, '$'
EXIT_MSG        DB 0Ah, 0Dh, 0Ah, 0Dh,"  EXIT", 0Ah, 0Dh, "  Please get your card. Thank you.", 0Ah, 0Dh,'$'
INVALID_MSG     DB "WRONG CHOICE"



.CODE

ProgramStart:
    mov ax, @data
    mov ds, ax

    call clear_screen

    mov ah, 09h
    lea dx, HEADER
    int 21h

    mov ah, 09h
    lea dx, OPEN_SCREEN
    int 21h

    mov ah, 09h
    lea dx, PROMPT1
    int 21h

    call get_input

    lea si, StringInput
    lea di, StringCompareTo
    call compare_loop

    mov ah, 4Ch
    int 21h

get_input PROC
    mov ah, 0Ah
    lea dx, buffer
    int 21h

    mov cl, [buffer+1]   ; number of chars entered
    mov ch, 0
    lea si, [buffer+2]   ; start of actual input
    lea di, StringInput

copy_loop:
    cmp cl, 0
    je terminate_input
    mov al, [si]
    mov [di], al
    inc si
    inc di
    dec cl
    jmp copy_loop

terminate_input:
    mov byte ptr [di], 0 ; null-terminate
    ret
get_input ENDP


compare_loop PROC
next_char:
    mov al, [si]
    mov bl, [di]
    cmp al, bl
    jne not_equal_label
    cmp al, 0
    je equal_label
    inc si
    inc di
    jmp next_char

equal_label:
    call clear_screen
    jmp main
    ret

not_equal_label:
    


    mov ah, 02h
    mov dl, 0ah
    int 21h
    
    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h
    
    

    mov ah, 09h
    mov bl, 0bfh
    mov cx, 10
    int 10h

     

    mov ah, 09h
    mov dx, OFFSET msg_noteq
    int 21h

    jmp ExitProgram

compare_loop ENDP

clear_screen:
    mov ax, 0600h
    mov bh, 04eh
    mov cx, 0000h
    mov dx, 184Fh
    int 10h

    mov ah, 02h          ; Set cursor position
    mov bh, 0            ; Page number (0)
    mov dh, 0            ; Row = 0
    mov dl, 0            ; Column = 0
    int 10h

    ret

main: 
    mov ah, 09h
    lea dx, HEADER
    int 21h

    mov ah, 09h
    lea dx, MAIN_MENU
    int 21h

    mov ah, 09h
    lea dx, PROMPT2
    int 21h

    call Menu_Handler
    
Menu_Handler PROC
    ; Wait for user input
    mov ah, 01h
    int 21h          ; Read single character
    mov inputChar, al

    ; Compare against menu choices
    cmp al, '1'
    je Option1
    cmp al, '2'
    je Option2
    cmp al, '3'
    je Option3
    cmp al, '4'
    je Option4
    cmp al, '5'
    je Option5
    jmp InvalidChoice

; --------------------------
Option1:
    mov ah, 09h
    lea dx, BALANCE_INQUIRY
    int 21h
    jmp AskContinue

Option2:
    mov ah, 09h
    lea dx, DEPOSIT_MSG
    int 21h
    jmp AskContinue

Option3:
    mov ah, 09h
    lea dx, WITHDRAW_MSG
    int 21h
    jmp AskContinue

Option4:
    mov ah, 09h
    lea dx, PAYBILLS_MSG
    int 21h
    jmp AskContinue

Option5:
    mov ah, 09h
    lea dx, EXIT_MSG
    int 21h
    jmp ExitProgram

; --------------------------
AskContinue:
    mov ah, 09h
    lea dx, PROMPT3
    int 21h

    mov ah, 01h
    int 21h
    mov inputChar, al

    cmp al, 'Y'
    je ReturnToMenu
    cmp al, 'y'
    je ReturnToMenu

    jmp ExitProgram

ReturnToMenu:
    call clear_screen
    jmp main
    ret

InvalidChoice:
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ah, 02h
    mov dl, ' '
    int 21h
    
    

    mov ah, 09h
    mov bl, 0bfh
    mov cx, 12
    int 10h


    mov ah, 09h
    mov dx, OFFSET INVALID_MSG
    int 21h
    jmp ExitProgram


Menu_Handler ENDP
ExitProgram:
    mov ah, 4Ch
    int 21h
END ProgramStart
