; Filename: EXER8.ASM
; Display colored patterns (Big Cross) using just spaces
; Red Cross with Blue background, 5 rows x 8 columns
; Name: Ken Horigome
; Date: August 22, 2025
 
.model small
.stack 100h
 
.data
.code
 
main:
    mov ax, @data
    mov ds, ax
 
    ; clear screen
    mov ah, 0
    mov al, 3
    int 10h
 
    mov dh, 5          ; starting row (screen row)
    mov si, 0          ; row index (0..4)
 
row_loop:
    mov dl, 30         ; starting column (screen column)
    mov di, 0          ; col index (0..7)
 
col_loop:
    ; set cursor position
    mov ah, 02h
    mov bh, 0
    int 10h
 
    mov ah, 09h
    mov al, ' '        ; print space
 
    ; default: blue background, blue foreground
    mov bl, 11h        ; 1 = blue bg, 1 = blue fg
 
    ; Draw cross not touching borders:
    ; Vertical bar: columns 3 and 4, rows 1..3 (si == 1,2,3)
    ; Horizontal bar: row 2, columns 1..6 (si == 2, di == 1..6)
    cmp di, 3
    je check_vertical
    cmp di, 4
    je check_vertical
    cmp si, 2
    jne print_cell
    cmp di, 1
    jb print_cell
    cmp di, 6
    ja print_cell
    jmp make_red
 
check_vertical:
    cmp si, 1
    jb print_cell
    cmp si, 3
    ja print_cell
    jmp make_red
 
make_red:
    mov bl, 4Ch        ; red bg, bright red fg
 
print_cell:
    mov bh, 0
    mov cx, 1
    int 10h            ; write character
 
    inc dl             ; next column (screen)
    inc di             ; next column (index)
    cmp di, 8
    jl col_loop
 
    inc dh             ; next row (screen)
    inc si             ; next row (index)
    cmp si, 5
    jl row_loop
 
    ; exit program
    mov ah, 4Ch
    int 21h
 
end main