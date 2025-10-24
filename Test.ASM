.model small
.stack 100h
.code

main proc
    mov ah, 02h        ; Function: set cursor position
    mov bh, 0          ; Page number (usually 0)
    mov dh, 5          ; Row (Y position) → line 6 (0-based)
    mov dl, 10         ; Column (X position) → column 11 (0-based)
    int 10h            ; BIOS interrupt

    mov ah, 09h        ; Print a string
    lea dx, msg
    int 21h

    mov ah, 4Ch        ; Exit to DOS
    int 21h
main endp

msg db 'Hello from here!$'
end main