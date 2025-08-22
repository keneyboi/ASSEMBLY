; Filename: EXER12.ASM
; Display Stundent 
; Name: Ken Horigome
; Date: August 22, 2025
 
.model small
.stack 100h
 
.data

    fLine    db "Ken N. Horigome", 0ah, '$'
    sLine    db "Bachelor of Science in Computer Science 2nd Year", 0ah, '$'
    tLine    db "College of Computer Studies", 0ah, '$'
    foLine   db "Cebu Institute of Technology - University", 0ah, '$'

.code
start: 

        mov ax, @data
        mov ds, ax

        mov ah, 09h

        mov dx, offset fLine
        int 21h

        mov dx, offset sLine
        int 21h

        mov dx, offset tLine
        int 21h

        mov dx, offset foLine
        int 21h

     
        int 27h

    
end start