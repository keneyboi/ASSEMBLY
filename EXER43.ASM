; Filename: EXER43.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 16, 2025
; Description: This program prompts the user to input a 5-digit
; number and displays it back.

.model small
.stack 200h
.data
msg_prompt db 'Enter a 5-digit number: $'
msg_output db 'You entered: $'
msg_newline db 13,10,'$'
nums db 5 dup(?)
.code
start proc
    mov ax,@data
    mov ds,ax
    lea dx,msg_prompt
    mov ah,9
    int 21h
    mov si,0
read_input:
    mov ah,1
    int 21h
    cmp al,0dh
    je input_done
    mov nums[si],al
    inc si
    cmp si,5
    jl read_input
input_done:
    lea dx,msg_newline
    mov ah,9
    int 21h
    lea dx,msg_output
    mov ah,9
    int 21h
    mov cx,5
    mov si,0
display_loop:
    mov dl,nums[si]
    mov ah,2
    int 21h
    inc si
    loop display_loop
    mov ax,4c00h
    int 21h
start endp
end start