; Filename: EXER41.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 16, 2025
; Description: This program acts as a ATM Machine
; and displays the said choosen menu by the user.

.model small
.stack 200h
.data
    testing db 'CIT-U ATM',13,10,'$'
    menu db 13,10,'A. Balance Inquiry',13,10,'B. Deposit',13,10,'C. Withdrawal',13,10,'D. Bills payment',13,10,'E. Exit',13,10,'$'
    prompt db 'Enter choice: $'
    newline db 13,10,'$'
    invalid db 'Invalid input!$'
    msg_a db 'Balance Inquiry$'
    msg_b db 'Deposit$'
    msg_c db 'Withdrawal$'
    msg_d db 'Bills Payment$'
    msg_e db 'Exiting... Thank you!$'
.code
print_text proc
    push dx
    lea dx,newline
    mov ah,9
    int 21h
    int 21h
    pop dx
    mov ah,9
    int 21h
    lea dx,newline
    mov ah,9
    int 21h
    int 21h
    int 21h
    ret
print_text endp

start proc
    mov ax,@data
    mov ds,ax

menu_start:
    lea dx,testing
    mov ah,9
    int 21h
    lea dx,menu
    mov ah,9
    int 21h
    lea dx,newline
    mov ah,9
    int 21h
    lea dx,prompt
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    cmp al,'a'
    jb verify
    cmp al,'z'
    ja verify
    or al,20h
    lea dx,newline
    mov ah,9
    int 21h
verify:
    cmp al,'A'
    je opt_a
    cmp al,'B'
    je opt_b
    cmp al,'C'
    je opt_c
    cmp al,'D'
    je opt_d
    cmp al,'E'
    je opt_e
invalid_label:
    lea dx,newline
    mov ah,9
    int 21h
    int 21h
    lea dx,invalid
    mov ah,9
    int 21h
    lea dx,newline
    mov ah,9
    int 21h
    int 21h
    int 21h
    jmp menu_start
opt_a:
    lea dx,msg_a
    call print_text
    jmp menu_start
opt_b:
    lea dx,msg_b
    call print_text
    jmp menu_start
opt_c:
    lea dx,msg_c
    call print_text
    jmp menu_start
opt_d:
    lea dx,msg_d
    call print_text
    jmp menu_start
opt_e:
    lea dx,msg_e
    call print_text
    mov ah,4ch
    mov al,0
    int 21h

start endp
end start