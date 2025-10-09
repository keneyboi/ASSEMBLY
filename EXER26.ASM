; Filename: EXER26.ASM
; An automated teller machine that prompts the user an option
; and displays accordingly the selected transaction
; Name: Ken N. Horigome
; Date: September 13, 2025

.model small
.stack 200h
.DATA
choice db ?

; Header
header1 db 'Cebu Institute of Technology - University',13,10,'$'
header2 db 'Automated Teller Machine',13,10,'$'
menuTitle db 'Main Menu',13,10,'$'

; Menu options
option1 db '1 Balance Inquiry',13,10,'$'
option2 db '2 Withdrawal',13,10,'$'
option3 db '3 Deposit',13,10,'$'
option4 db '4 Transfer',13,10,'$'
option5 db '5 Bills Payment',13,10,'$'
option6 db '6 Change Pin',13,10,'$'
option7 db '7 Exit',13,10,'$'

; Input prompt
prompt db 'Enter number of your choice: $'

; Output messages
outputMsg1 db 0dh, 0ah, 'You have chosen $'
balanceMsg db ' Balance Inquiry.',13,10,'$'
withdrawalMsg db ' Withdrawal.',13,10,'$'
depositMsg db ' Deposit.',13,10,'$'
transferMsg db ' Transfer.',13,10,'$'
billsMsg db ' Bills Payment.',13,10,'$'
pinMsg db ' Change Pin.',13,10,'$'
exitMsg db ' Exit.',13,10,'$'

; Closing
thankYou db 0dh, 0ah, 'Thank you for banking with us!',13,10,'$'
copyright db 'Copyright 2025 ',13,10,'$'
programmer db 'Programmer: Ken N. Horigome',13,10,'$'

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
    mov dx,OFFSET menuTitle
    mov ah,9
    int 21h
    
    ; Display menu options
    mov dx,OFFSET option1
    mov ah,9
    int 21h
    mov dx,OFFSET option2
    mov ah,9
    int 21h
    mov dx,OFFSET option3
    mov ah,9
    int 21h
    mov dx,OFFSET option4
    mov ah,9
    int 21h
    mov dx,OFFSET option5
    mov ah,9
    int 21h
    mov dx,OFFSET option6
    mov ah,9
    int 21h
    mov dx,OFFSET option7
    mov ah,9
    int 21h
    
    ; Get user choice
    mov dx,OFFSET prompt
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov choice,al
    
    ; Print newline
    mov dl,13
    mov ah,2
    int 21h
    mov dl,10
    mov ah,2
    int 21h
    
    ; Display chosen option
    mov dx,OFFSET outputMsg1
    mov ah,9
    int 21h
    mov dl,choice
    mov ah,2
    int 21h
    
    ; Check which option was selected and display corresponding message
    cmp choice,'1'
    jz ShowBalance
    cmp choice,'2'
    jz ShowWithdrawal
    cmp choice,'3'
    jz ShowDeposit
    cmp choice,'4'
    jz ShowTransfer
    cmp choice,'5'
    jz ShowBills
    cmp choice,'6'
    jz ShowPin
    cmp choice,'7'
    jz ShowExit
    jmp ShowExit ; Default to exit if invalid choice

ShowBalance:
    mov dx,OFFSET balanceMsg
    jmp DisplayChoice
ShowWithdrawal:
    mov dx,OFFSET withdrawalMsg
    jmp DisplayChoice
ShowDeposit:
    mov dx,OFFSET depositMsg
    jmp DisplayChoice
ShowTransfer:
    mov dx,OFFSET transferMsg
    jmp DisplayChoice
ShowBills:
    mov dx,OFFSET billsMsg
    jmp DisplayChoice
ShowPin:
    mov dx,OFFSET pinMsg
    jmp DisplayChoice
ShowExit:
    mov dx,OFFSET exitMsg

DisplayChoice:
    mov ah,9
    int 21h
    
    ; Display closing messages
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
    
END ProgramStart