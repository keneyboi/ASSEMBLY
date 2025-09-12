; Filename: PRELIM.ASM
; Display Google Login Interface
; Name: Ken Horigome
; Date: September 12, 2025

 
.model small
.stack 100h
 
.data
        top db "                                                     ", '$'
     bottom db "                                                     ", '$'
   middleSpace db "                                                 ", '$'
   nameKo      db "    Created by: HORIGOME, KEN                    ", '$'
     emptyline db "                           ", '$'
     emptyline1 db ""
     border    db "  ", '$'
     first     db "   Please enter your details                     ", '$'
     second    db "   Welcome back                                  ", '$'
    third      db "   ", 218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191, "   ", '$'
    fourth     db "   ", 179, " Email address                           ", 179, "   ", '$'
    signInFirst     db "   ", 179, "          ", '$'
    signInSecond    db "G", '$'
    signInThird     db " Sign in with Google          ", 179, "   ", '$'
    fifth      db "   ", 192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217, "   ", '$'
    sixth      db "   ", 218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191, "   ", '$'
    seventh    db "   ", 179, " Password                                ", 179, "   ", '$'
    eight      db "   ", 192,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,217, "   ", '$'
 nineFirst     db "   [] Remember for 30 days    ", '$'
 nineSecond    db "Forgot password    ", '$'
   greyBorder  db "    ", '$'
    blueButton db "                                         ", '$'
   blueButton1 db "                 Sign up                 ", '$'
   tenFirst    db "         Don't have an account?", '$'
  tenSecond    db "  Sign up         ", '$' 

    
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
