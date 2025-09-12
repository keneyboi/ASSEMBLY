; Filename: EXER14.ASM
; Display Interface
; Name: Ken Horigome
; Date: August 28, 2025

 
.model small
.stack 100h
 
.data
     space db "                                                                                ", '$'
     first db "      -------- / O \ ---------                                                  ", '$'
    second db "          HIGH SCHOOL BAND                   Band Camp Registration             ", '$'
     third db "      -------- \ O / ---------                                                  ", '$'

    fourth db "    Student Information:                                                        ", '$'
     fifth db "    Name *                                                                      ", '$'
     sixth db "    " ,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,"       ",219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219, 219,219,"   ",  '$'
   seventh db "      Date of Birth *               Email *                Grade *              ", '$'
    eighth db "      " ,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,"      ",219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,"      ",219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,"   ",  '$'
     ninth db "      Address *                                                                   ", '$'
     tenth db "    " ,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219, 219,219,"   ",  '$'
    eleventh db "      T-Shirt Size *                         Instrument *                       ", '$'
     twelfth db "      " ,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,"       ",219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219, 219,219,"     ",  '$'
  thirteenth db "    Parent/Guardian Information *                                               ", '$'
  thirfour db "    Name *                                                                      ", '$'
  fourteenth db "    " ,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,"       ",219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219, 219,219,"     ",  '$'
   fifteenth db "    Phone *                                Email *                              ", '$'
  sixteenth db "    " ,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,"       ",219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219,219, 219,219,"   ",  '$'
  seventeenth db "                                      SUBMIT", '$'
 
 
.code
start:
    mov ax, @data
    mov ds, ax
 
    mov ah, 09h
 
    mov bl, 04eh
    mov cx, 100
    int 10h
    
    mov dx, offset space
    int 21h
    mov dx, offset first
    int 21h
    mov dx, offset second
    int 21h
    mov dx, offset third
    int 21h
    mov dx, offset space
    int 21h

    mov bl, 03eh
    mov cx, 100
    int 10h

    mov dx, offset space
    int 21h
    mov dx, offset fourth
    int 21h
    mov dx, offset fifth
    int 21h
    mov dx, offset sixth
    int 21h
    mov dx, offset seventh
    int 21h
    mov dx, offset eighth
    int 21h
    mov dx, offset ninth
    int 21h
    mov dx, offset tenth
    int 21h
    mov dx, offset eleventh
    int 21h
    mov dx, offset twelfth
    int 21h
    mov dx, offset space
    int 21h

    mov bl, 04eh
    mov cx, 100
    int 10h

    mov dx, offset space
    int 21h
    mov dx, offset thirteenth
    int 21h
    mov dx, offset thirfour
    int 21h
    mov dx, offset fourteenth
    int 21h
    mov dx, offset fifteenth
    int 21h
    mov dx, offset sixteenth
    int 21h
    mov dx, offset space
    int 21h

    mov bl, 08eh
    mov cx, 100
    int 10h

    mov dx, offset seventeenth
    int 21h

 
    int 27h
 
end start
