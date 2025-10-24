; Filename: EXER20.ASM
; Gets String input from user and compares it to "1234".
; Name: HORIGOME, KEN
; Date: September 13, 2025

.model small
.stack 200h

.DATA
MAXIMUM_STRING_LENGTH EQU 100

StringInput DB MAXIMUM_STRING_LENGTH DUP (?)
buffer      DB 100, ?, 100 DUP(?)        ; DOS input buffer

HEADER      DB 0Ah, "CIT-U BANK", 0Ah, 0Dh, \
                "Automatic Teller Machine", 0Ah, 0Dh, \
                "Copyright 2025", 0Ah, 0Dh, \
                "Programmer: KEN HORIGOME", 0Ah, 0Dh, \
                "Welcome!", 0Ah, 0Ah, 0Dh, '$'

MAIN_MENU   DB "MAIN MENU", 0Ah, 0Dh, \
                "1 Balance Inquiry", 0Ah, 0Dh, \
                "2 Deposit", 0Ah, 0Dh, \
                "3 Withdraw", 0Ah, 0Dh, \
                "4 Pay Bills", 0Ah, 0Dh, \
                "5 Exit", 0Ah, 0Dh, \
                "Please enter number of your choice: ", 0Ah, 0Ah, 0Dh, '$'

OPEN_SCREEN DB "Please insert your card.", 0Ah, 0Dh, '$'
PROMPT1     DB 'Enter your PIN: $'

StringCompareTo DB "1234", 0

msg_equal   DB 0Ah, 0Dh, "Strings are equal!", 0Ah, 0Dh, '$'
msg_noteq   DB 0Ah, 0Dh, "WRONG PIN!", 0Ah, 0Dh, '$'

.CODE

ProgramStart:
    mov ax, @data
    mov ds, ax

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
    mov ah, 09h
    lea dx, msg_noteq
    int 21h
    ret
compare_loop ENDP

clear_screen:
    mov ax, 0600h
    mov bh, 07h
    mov cx, 0000h
    mov dx, 184Fh
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
    lea dx, PROMPT1
    int 21h

END ProgramStart
