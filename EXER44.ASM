; Filename: EXER44.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 16, 2025
; Description: This programp prompts the user an input and 
; displays the corresponding greeting.

.model small
.stack 200h
.data
    greetMenu db 0Dh,0Ah,'Greetings',0Dh,0Ah,\
                 'Main Menu',0Dh,0Ah,\
                 '1. Good Morning',0Dh,0Ah,\
                 '2. Good Afternoon',0Dh,0Ah,\
                 '3. Good Evening',0Dh,0Ah,\
                 '4. Exit Program',0Dh,0Ah,\
                 'Enter choice: $'
    msgMorning db 0Dh,0Ah,'Good Morning!$'
    msgAfternoon db 0Dh,0Ah,'Good Afternoon!$'
    msgEvening db 0Dh,0Ah,'Good Evening!$'
    msgInvalid db 0Dh,0Ah,'Invalid choice. Please try again.$'
    msgExit db 0Dh,0Ah,'Thank you! Program will now exit.$'
    newLine db 0Dh,0Ah,'$'
.code
start proc
    mov ax,@data
    mov ds,ax
menu_start:
    mov ah,9
    lea dx,greetMenu
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    cmp bl,'1'
    je opt_morning
    cmp bl,'2'
    je opt_afternoon
    cmp bl,'3'
    je opt_evening
    cmp bl,'4'
    je opt_exit
    jmp opt_invalid
opt_morning:
    call show_morning
    jmp menu_start
opt_afternoon:
    call show_afternoon
    jmp menu_start
opt_evening:
    call show_evening
    jmp menu_start
opt_exit:
    call exit_msg
opt_invalid:
    call invalid_msg
    jmp menu_start
start endp

show_morning proc
    lea dx,msgMorning
    mov ah,9
    int 21h
    lea dx,newLine
    mov ah,9
    int 21h
    int 21h
    ret
show_morning endp

show_afternoon proc
    lea dx,msgAfternoon
    mov ah,9
    int 21h
    lea dx,newLine
    mov ah,9
    int 21h
    int 21h
    ret
show_afternoon endp

show_evening proc
    lea dx,msgEvening
    mov ah,9
    int 21h
    lea dx,newLine
    mov ah,9
    int 21h
    int 21h
    ret
show_evening endp

exit_msg proc
    lea dx,msgExit
    mov ah,9
    int 21h
    lea dx,newLine
    mov ah,9
    int 21h
    int 21h
    mov ah,4ch
    mov al,0
    int 21h
exit_msg endp

invalid_msg proc
    lea dx,msgInvalid
    mov ah,9
    int 21h
    lea dx,newLine
    mov ah,9
    int 21h
    int 21h
    ret
invalid_msg endp
end start