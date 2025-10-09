; Filename: EXER28.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 2, 2025
; Description: This program accepts user input in string and displays it
; to the user in seperate lines.
.MODEL SMALL
.STACK 100h
.DATA
    inpStr1  DB 50 DUP('$')                       
    inpStr2  DB 50 DUP('$')
    inpStr3  DB 50 DUP('$')
    prompt1 DB 'Enter first string: $'
    prompt2 DB 'Enter second string: $'
    prompt3 DB 'Enter third string: $'
    output1 DB 'You entered first string: $'
    output2 DB 'You entered second string: $'
    output3 DB 'You entered third string: $'
.CODE
MAIN PROC
         MOV AX, @DATA
         MOV DS, AX
         LEA DX, prompt1
         MOV AH, 09h
         INT 21h
         LEA DX, inpStr1
         MOV AH, 0Ah
         INT 21h
         mov ah,02h
         mov dl,0Ah
         int 21h
         LEA DX, prompt2
         MOV AH, 09h
         INT 21h
         LEA DX, inpStr2
         MOV AH, 0Ah
         INT 21h
         mov ah,02h
         mov dl,0Ah
         int 21h
         LEA DX, prompt3
         MOV AH, 09h
         INT 21h
         LEA DX, inpStr3
         MOV AH, 0Ah
         INT 21h
         mov ah,02h
         mov dl,0Ah
         int 21h
         LEA DX, output1
         MOV AH, 09h
         INT 21h
         LEA DX, inpStr1 + 2
         MOV AH, 09h
         INT 21h
         mov ah,02h
         mov dl,0Ah
         int 21h
         LEA DX, output2
         MOV AH, 09h
         INT 21h
         LEA DX, inpStr2 + 2
         MOV AH, 09h
         INT 21h
         mov ah,02h
         mov dl,0Ah
         int 21h
         LEA DX, output3
         MOV AH, 09h
         INT 21h
         LEA DX, inpStr3 + 2
         MOV AH, 09h
         INT 21h
         MOV AX, 4C00h
         INT 21h
MAIN ENDP
END MAIN
