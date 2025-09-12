; Filename: EXER11.ASM
; Display Character
; Name: Ken Horigome
; Date: August 22, 2025
 
.model small
.stack 100h
 
.data
  
duck_pattern  db 6,6,6,6,6,6,6,6,6,6,6,6,6,6
 db 6,6,6,6,6,6,3,3,6,6,6,6,6,6
 db 6,6,6,6,3,3,6,6,3,3,6,6,6,6
 db 6,6,6,3,6,6,6,6,6,6,3,6,6,6
 db 6,6,6,3,6,6,6,6,6,6,3,6,6,6
 db 6,6,6,6,3,6,6,6,6,3,6,6,6,6
 db 6,6,6,6,3,3,3,3,3,3,6,6,6,6
 db 6,6,6,3,1,1,1,1,1,1,3,6,6,6
 db 6,6,3,1,1,1,1,1,1,1,1,3,6,6
 db 6,6,3,3,1,3,3,1,3,1,1,3,6,6
 db 6,6,3,1,3,2,2,3,1,1,1,3,6,6
 db 6,6,3,1,1,3,3,1,1,1,1,1,3,6
 db 6,6,3,1,1,1,1,1,1,1,1,1,3,6
 
.code
main proc
    mov ax, @data
    mov ds, ax
   
    mov ax, 0003h
    int 10h
   

    mov si, 0       
    mov dh, 5     

draw_duck:
    mov dl, 10       
    call set_cursor
   
    mov di, 0      
draw_row:

    mov al, duck_pattern[si]
    inc si

    cmp al, 0
    je skip_char    
    cmp al, 1
    je yellow_char
    cmp al, 2
    je orange_char
    cmp al, 3
    je black_char
    cmp al, 4
    je blink_yellow_char
    cmp al, 5
    je blink_black_char
    cmp al, 6
    je white_char

white_char:
    mov al, ' '
    mov bl, 70h   
    jmp draw_char   

yellow_char:
    mov al, ' '
    mov bl, 11h   
    jmp draw_char
   
orange_char:
    mov al, ' '
    mov bl, 0eeh    
    jmp draw_char
   
black_char:
    mov al, ' '
    mov bl, 00h    
    jmp draw_char
   
blink_yellow_char:
    mov al, 219
    mov bl, 8eh      
    jmp draw_char
 
blink_black_char:
    mov al, ' '
    mov bl, 80h    
    jmp draw_char
   
draw_char:
    call display_char
   
skip_char:

    inc dl
    call set_cursor
    inc di
    cmp di, 14     
    jl draw_row
   

    inc dh
    cmp dh, 18     
    jl draw_duck
   

    mov ah, 1
    int 21h
   

    mov ax, 4C00h
    int 21h
main endp

set_cursor proc
    mov ah, 02h      
    mov bh, 0       
    int 10h
    ret
set_cursor endp
 

display_char proc
    mov ah, 09h      
    mov bh, 0       
    mov cx, 1    
    int 10h
    ret
display_char endp
 
end main
 