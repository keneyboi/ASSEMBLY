; Filename: EXER13.ASM
; Display Calendar 
; Name: Ken Horigome
; Date: August 22, 2025

.model small
.stack 100h

.data
    title1    db '                                 AUGUST 2025            $'
    newline   db 0Dh,0Ah,'$'
    topBorder db '+----------+----------+----------+----------+----------+----------+----------+$'
    header    db '|  Sunday  |  Monday  |  Tuesday | Wednesday| Thursday |  Friday  | Saturday |$'
    rowEmpty  db '|          |          |          |          |          |          |          |$'

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Clear screen
    mov ax,0003h
    int 10h

    ; ---------- Print the calendar grid (strings) ----------
    ; Title
    mov ah,9
    mov dx,offset title1
    int 21h
    call newlineProc

    ; Top border
    mov ah,9
    mov dx,offset topBorder
    int 21h
    call newlineProc

    ; Header
    mov ah,9
    mov dx,offset header
    int 21h
    call newlineProc

    ; Separator
    mov ah,9
    mov dx,offset topBorder
    int 21h
    call newlineProc

    ; 6 week rows (empty) + border after each
    mov cx,6
printRows:
    mov ah,9
    mov dx,offset rowEmpty
    int 21h
    call newlineProc

    mov ah,9
    mov dx,offset topBorder
    int 21h
    call newlineProc
    loop printRows

    ; ---------- Week 1 (Row 4):      | | | | | Fri=1 | Sat=2 |
    ; Friday 1 (white)
    mov dh,4      ; row
    mov dl,60     ; Friday center
    mov al,'1'
    mov bl,07h    ; white
    call print_char_at

    ; Saturday 2 (blue)
    mov dh,4
    mov dl,71
    mov al,'2'
    mov bl,09h    ; blue
    call print_char_at

    ; ---------- Week 2 (Row 6): Sun=3 .. Sat=9
    ; Sunday 3 (red)
    mov dh,6
    mov dl,5
    mov al,'3'
    mov bl,0Ch    ; red
    call print_char_at

    ; Monday 4 (white)
    mov dh,6
    mov dl,16
    mov al,'4'
    mov bl,07h
    call print_char_at

    ; Tuesday 5
    mov dh,6
    mov dl,27
    mov al,'5'
    mov bl,07h
    call print_char_at

    ; Wednesday 6
    mov dh,6
    mov dl,38
    mov al,'6'
    mov bl,07h
    call print_char_at

    ; Thursday 7
    mov dh,6
    mov dl,49
    mov al,'7'
    mov bl,07h
    call print_char_at

    ; Friday 8
    mov dh,6
    mov dl,60
    mov al,'8'
    mov bl,07h
    call print_char_at

    ; Saturday 9 (blue)
    mov dh,6
    mov dl,71
    mov al,'9'
    mov bl,09h
    call print_char_at

    ; ---------- Week 3 (Row 8): 10..16
    ; Sunday 10 (red) -> '1' at 4, '0' at 5
    mov dh,8
    mov dl,4
    mov al,'1'
    mov bl,0Ch
    call print_char_at
    mov dh,8
    mov dl,5
    mov al,'0'
    mov bl,0Ch
    call print_char_at

    ; Monday 11 (white) -> 15,16
    mov dh,8
    mov dl,15
    mov al,'1'
    mov bl,07h
    call print_char_at
    mov dh,8
    mov dl,16
    mov al,'1'
    mov bl,07h
    call print_char_at

    ; Tuesday 12 -> 26,27
    mov dh,8
    mov dl,26
    mov al,'1'
    mov bl,07h
    call print_char_at
    mov dh,8
    mov dl,27
    mov al,'2'
    mov bl,07h
    call print_char_at

    ; Wednesday 13 -> 37,38
    mov dh,8
    mov dl,37
    mov al,'1'
    mov bl,07h
    call print_char_at
    mov dh,8
    mov dl,38
    mov al,'3'
    mov bl,07h
    call print_char_at

    ; Thursday 14 -> 48,49
    mov dh,8
    mov dl,48
    mov al,'1'
    mov bl,07h
    call print_char_at
    mov dh,8
    mov dl,49
    mov al,'4'
    mov bl,07h
    call print_char_at

    ; Friday 15 -> 59,60
    mov dh,8
    mov dl,59
    mov al,'1'
    mov bl,07h
    call print_char_at
    mov dh,8
    mov dl,60
    mov al,'5'
    mov bl,07h
    call print_char_at

    ; Saturday 16 (blue) -> 70,71
    mov dh,8
    mov dl,70
    mov al,'1'
    mov bl,09h
    call print_char_at
    mov dh,8
    mov dl,71
    mov al,'6'
    mov bl,09h
    call print_char_at

    ; ---------- Week 4 (Row 10): 17..23
    ; Sunday 17 (red) -> 4,5
    mov dh,10
    mov dl,4
    mov al,'1'
    mov bl,0Ch
    call print_char_at
    mov dh,10
    mov dl,5
    mov al,'7'
    mov bl,0Ch
    call print_char_at

    ; Monday 18 -> 15,16
    mov dh,10
    mov dl,15
    mov al,'1'
    mov bl,07h
    call print_char_at
    mov dh,10
    mov dl,16
    mov al,'8'
    mov bl,07h
    call print_char_at

    ; Tuesday 19 -> 26,27
    mov dh,10
    mov dl,26
    mov al,'1'
    mov bl,07h
    call print_char_at
    mov dh,10
    mov dl,27
    mov al,'9'
    mov bl,07h
    call print_char_at

    ; Wednesday 20 -> 37,38
    mov dh,10
    mov dl,37
    mov al,'2'
    mov bl,07h
    call print_char_at
    mov dh,10
    mov dl,38
    mov al,'0'
    mov bl,07h
    call print_char_at

    ; Thursday 21 -> 48,49
    mov dh,10
    mov dl,48
    mov al,'2'
    mov bl,07h
    call print_char_at
    mov dh,10
    mov dl,49
    mov al,'1'
    mov bl,07h
    call print_char_at

    ; Friday 22 -> 59,60
    mov dh,10
    mov dl,59
    mov al,'2'
    mov bl,07h
    call print_char_at
    mov dh,10
    mov dl,60
    mov al,'2'
    mov bl,07h
    call print_char_at

    ; Saturday 23 (blue) -> 70,71
    mov dh,10
    mov dl,70
    mov al,'2'
    mov bl,09h
    call print_char_at
    mov dh,10
    mov dl,71
    mov al,'3'
    mov bl,09h
    call print_char_at

    ; ---------- Week 5 (Row 12): 24..30
    ; Sunday 24 (red) -> 4,5
    mov dh,12
    mov dl,4
    mov al,'2'
    mov bl,0Ch
    call print_char_at
    mov dh,12
    mov dl,5
    mov al,'4'
    mov bl,0Ch
    call print_char_at

    ; Monday 25 -> 15,16
    mov dh,12
    mov dl,15
    mov al,'2'
    mov bl,07h
    call print_char_at
    mov dh,12
    mov dl,16
    mov al,'5'
    mov bl,07h
    call print_char_at

    ; Tuesday 26 -> 26,27
    mov dh,12
    mov dl,26
    mov al,'2'
    mov bl,07h
    call print_char_at
    mov dh,12
    mov dl,27
    mov al,'6'
    mov bl,07h
    call print_char_at

    ; Wednesday 27 -> 37,38
    mov dh,12
    mov dl,37
    mov al,'2'
    mov bl,07h
    call print_char_at
    mov dh,12
    mov dl,38
    mov al,'7'
    mov bl,07h
    call print_char_at

    ; Thursday 28 -> 48,49
    mov dh,12
    mov dl,48
    mov al,'2'
    mov bl,07h
    call print_char_at
    mov dh,12
    mov dl,49
    mov al,'8'
    mov bl,07h
    call print_char_at

    ; Friday 29 -> 59,60
    mov dh,12
    mov dl,59
    mov al,'2'
    mov bl,07h
    call print_char_at
    mov dh,12
    mov dl,60
    mov al,'9'
    mov bl,07h
    call print_char_at

    ; Saturday 30 (blue) -> 70,71
    mov dh,12
    mov dl,70
    mov al,'3'
    mov bl,09h
    call print_char_at
    mov dh,12
    mov dl,71
    mov al,'0'
    mov bl,09h
    call print_char_at

    ; ---------- Week 6 (Row 14): 31
    ; Sunday 31 (red) -> 4,5
    mov dh,14
    mov dl,4
    mov al,'3'
    mov bl,0Ch
    call print_char_at
    mov dh,14
    mov dl,5
    mov al,'1'
    mov bl,0Ch
    call print_char_at

    ; Wait for key
    mov ah,08h
    int 21h

    ; Exit
    mov ax,4C00h
    int 21h
main endp

; -------- Helpers (same style as Exer7) --------
; print_char_at: uses current DH=row, DL=col, AL=char, BL=attr
print_char_at proc
    push ax
    push bx
    push cx
    push dx

    ; Set cursor
    mov ah,02h
    mov bh,0
    int 10h

    ; Write character with attribute
    mov ah,09h
    mov bh,0
    mov cx,1
    int 10h

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_char_at endp

newlineProc proc
    mov ah,9
    mov dx,offset newline
    int 21h
    ret
newlineProc endp

end main