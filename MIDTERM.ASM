; Filename: PRELIM.ASM
; Display Google Login Interface
; Name: Ken Horigome
; Date: September 12, 2025

 
.model small
.stack 100h
 
.data
        

    
.code
start:
    mov ax, @data
    mov ds, ax
 
    mov ah, 09h

    ; color
    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset top
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset middleSpace
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; -------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 78h
    mov cx, 100
    int 10h

    mov dx, offset first
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset middleSpace
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset second
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset third
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 78h
    mov cx, 100
    int 10h

    mov dx, offset fourth
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------
mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset fifth
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------
    
    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset sixth
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 78h
    mov cx, 100
    int 10h

    mov dx, offset seventh
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset eight
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset nineFirst
    int 21h

    mov bl, 71h
    mov cx, 100
    int 10h

    mov dx, offset nineSecond
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------
    
    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset middleSpace
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset greyBorder
    int 21h

    mov bl, 10h
    mov cx, 100
    int 10h

    mov dx, offset blueButton
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset greyBorder
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset greyBorder
    int 21h

    mov bl, 17h
    mov cx, 100
    int 10h

    mov dx, offset blueButton1
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset greyBorder
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    
        mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset greyBorder
    int 21h

    mov bl, 10h
    mov cx, 100
    int 10h

    mov dx, offset blueButton
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset greyBorder
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

     mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset third
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset signInFirst
    int 21h

    mov bl, 7eh
    mov cx, 100
    int 10h

    mov dx, offset signInSecond
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset signInThird
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------
mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset fifth
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

        mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 78h
    mov cx, 100
    int 10h

    mov dx, offset tenFirst
    int 21h

    mov bl, 71h
    mov cx, 100
    int 10h

    mov dx, offset tenSecond
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; ------------------------------------

        mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset middleSpace
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; -------------------------------------

        mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset nameKo
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; -------------------------------------

        mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 70h
    mov cx, 100
    int 10h

    mov dx, offset middleSpace
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset border
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline
    int 21h

    ; -------------------------------------

    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset bottom
    int 21h

    mov bl, 000h
    mov cx, 100
    int 10h

    mov dx, offset emptyline1
    int 21h

    ; ------------------------------------------------
 
    int 27h
 
end start
