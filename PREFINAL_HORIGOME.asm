; FIlename: PREFINAL_HORIGOME
; Name: Horigome, Ken N.
; Date: November 21, 2025
; Description: CIT-U AIR CONDITION UNIT
 
.MODEL SMALL
.STACK 100h
.DATA
 
AC_POWER      DB 0
AC_SWING      DB 0
AC_QUIET      DB 0
AC_ECO        DB 0
AC_FAN        DB 0
AC_COOL       DB 0
AC_TURBO      DB 0
AC_TIMER      DB 0
AC_SLEEP      DB 0


SPACE_LINE      DB  0Dh, 0Ah, 0Dh, 0Ah,0Dh, 0Ah, '$'
TITLE_LINE      DB  '               ',218,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191, 0Dh, 0Ah, 0Dh, 0Ah, '$'
AC_NAME         DB '                              CIT-U AIR CONDITION UNIT', 0Dh, 0Ah, '$'
PROGRAMMER_INFO DB '                          Programmer ---> Horigome, Ken N.', 0Dh, 0Ah, 0Dh, 0Ah, '$'
WELCOME_MSG     DB '                                     WELCOME! ', 0Dh, 0Ah, 0Dh, 0Ah, '$'
MENU_HEADER     DB '               ----------------> MAIN MENU STATUS <----------------', 0Dh, 0Ah, 0Dh, 0Ah, '$'
LINE1_MAIN      DB '                  1 Power: $'
LINE1_ECO       DB '    4 Eco Mode: $'
LINE1_TURBO     DB '    7 Turbo: $'
LINE1_EXIT      DB '', 0Dh, 0Ah, '$'
LINE2_SWING     DB '                  2 Swing: $'
LINE2_FAN       DB '    5 Fan:      $'
LINE2_TIMER     DB '    8 Timer: $'
LINE2_END       DB 0Dh, 0Ah, '$'
LINE3_QUIET     DB '                  3 Quiet: $'
LINE3_COOL      DB '    6 Cool    : $'
LINE3_SLEEP     DB '    9 Sleep: $'
LINE3_END       DB 0Dh, 0Ah, 0Dh, 0Ah, '$'
PROMPT_MSG      DB '               ---------------------> 0 Exit <---------------------', 0Dh, 0Ah, '                                Enter choice: $'
STATUS_ON  DB 'ON ','$'
STATUS_OFF DB 'OFF','$'
ERROR_MSG       DB '                              >>> INPUT ERROR! <<<', '$'
; New error message formatted like original ERROR_MSG
POWER_ERR_MSG   DB '                              >>> UNIT IS OFF! <<<', '$'
EXIT_MSG        DB 0Dh, 0Ah, 0Dh, 0Ah,0Dh, 0Ah, 0Dh, 0Ah,0Dh, 0Ah, 0Dh, 0Ah,'                           Thank you. Be cool always!', 0Dh, 0Ah, 0Dh, 0Ah, 0Ah, 0Dh, 0Ah,0Dh, 0Ah, 0Dh, 0Ah, '$'
.CODE

 
setColor macro count, color
    MOV AH, 09h
    MOV BH, 0
    MOV BL, color
    MOV CX, count
    INT 10h
endm
printStr macro str
    MOV AH, 09h
    LEA DX, str
    INT 21h
endm
 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

 
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
MAIN_LOOP:
    CALL CLEAR_SCREEN
    CALL DISPLAY_MENU
    CALL GET_INPUT
    CMP AL, '0'
    JNE .chk1
    JMP EXIT_PROGRAM
.chk1:
    CMP AL, '1'
    JNE .chk2
    JMP TOGGLE_POWER
.chk2:
    CMP AL, '2'
    JNE .chk3
    JMP TOGGLE_SWING
.chk3:
    CMP AL, '3'
    JNE .chk4
    JMP TOGGLE_QUIET
.chk4:
    CMP AL, '4'
    JNE .chk5
    JMP TOGGLE_ECO
.chk5:
    CMP AL, '5'
    JNE .chk6
    JMP TOGGLE_FAN
.chk6:
    CMP AL, '6'
    JNE .chk7
    JMP TOGGLE_COOL
.chk7:
    CMP AL, '7'
    JNE .chk8
    JMP TOGGLE_TURBO
.chk8:
    CMP AL, '8'
    JNE .chk9
    JMP TOGGLE_TIMER
.chk9:
    CMP AL, '9'
    JNE .INVALID_INPUT
    JMP TOGGLE_SLEEP
.INVALID_INPUT:
    CALL SHOW_ERROR
    JMP MAIN_LOOP
 
TOGGLE_POWER:
    CALL DELAY_250MS     ; Added Delay
    XOR AC_POWER, 1
    CMP AC_POWER, 0
    JNE POWER_ON_LABEL
    CALL POWER_OFF
POWER_ON_LABEL:
    JMP MAIN_LOOP
TOGGLE_SWING:
    CALL CHECK_POWER     ; Logic update: Checks power, shows error if off
    CALL DELAY_250MS     ; Added Delay
    XOR AC_SWING, 1
    JMP MAIN_LOOP
TOGGLE_QUIET:
    CALL CHECK_POWER
    CALL DELAY_250MS
    XOR AC_QUIET, 1
    JMP MAIN_LOOP
TOGGLE_ECO:
    CALL CHECK_POWER
    CALL DELAY_250MS
    XOR AC_ECO, 1
    JMP MAIN_LOOP
TOGGLE_FAN:
    CALL CHECK_POWER
    CALL DELAY_250MS
    XOR AC_FAN, 1
    JMP MAIN_LOOP
TOGGLE_COOL:
    CALL CHECK_POWER
    CALL DELAY_250MS
    XOR AC_COOL, 1
    JMP MAIN_LOOP
TOGGLE_TURBO:
    CALL CHECK_POWER
    CALL DELAY_250MS
    XOR AC_TURBO, 1
    JMP MAIN_LOOP
TOGGLE_TIMER:
    CALL CHECK_POWER
    CALL DELAY_250MS
    XOR AC_TIMER, 1
    JMP MAIN_LOOP
TOGGLE_SLEEP:
    CALL CHECK_POWER
    CALL DELAY_250MS
    XOR AC_SLEEP, 1
    JMP MAIN_LOOP

 
EXIT_PROGRAM:
    CALL CLEAR_SCREEN

    printStr EXIT_MSG
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
 
CLEAR_SCREEN PROC
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
    RET
CLEAR_SCREEN ENDP

DISPLAY_MENU PROC
    printStr SPACE_LINE
    setColor 67, 04h
    printStr TITLE_LINE
    setColor 54, 0Eh
    printStr AC_NAME
    setColor 58, 0Eh
    printStr PROGRAMMER_INFO
    setColor 67, 04h
    printStr TITLE_LINE
    setColor 46, 0Eh
    printStr WELCOME_MSG
    setColor 67, 0Eh
    printStr MENU_HEADER
    CALL DISPLAY_LINE1
    CALL DISPLAY_LINE2
    CALL DISPLAY_LINE3
    setColor 67, 0Eh
    printStr PROMPT_MSG
    RET
DISPLAY_MENU ENDP

DISPLAY_LINE1 PROC
    setColor 1, 0Eh
    printStr LINE1_MAIN
    MOV AL, AC_POWER
    CALL PRINT_STATUS
    printStr LINE1_ECO
    MOV AL, AC_ECO
    CALL PRINT_STATUS
    printStr LINE1_TURBO
    MOV AL, AC_TURBO
    CALL PRINT_STATUS
    printStr LINE1_EXIT
    RET
DISPLAY_LINE1 ENDP
DISPLAY_LINE2 PROC
    setColor 1, 0Eh
    printStr LINE2_SWING
    MOV AL, AC_SWING
    CALL PRINT_STATUS
    printStr LINE2_FAN
    MOV AL, AC_FAN
    CALL PRINT_STATUS
    printStr LINE2_TIMER
    MOV AL, AC_TIMER
    CALL PRINT_STATUS
    printStr LINE2_END
    RET
DISPLAY_LINE2 ENDP
DISPLAY_LINE3 PROC
    setColor 1, 0Eh
    printStr LINE3_QUIET
    MOV AL, AC_QUIET
    CALL PRINT_STATUS
    printStr LINE3_COOL
    MOV AL, AC_COOL
    CALL PRINT_STATUS
    printStr LINE3_SLEEP
    MOV AL, AC_SLEEP
    CALL PRINT_STATUS
    printStr LINE3_END
    RET
DISPLAY_LINE3 ENDP
PRINT_STATUS PROC
    CMP AL, 1
    JE PRINT_ON_LABEL
    setColor 3, 0Ch
    printStr STATUS_OFF
    JMP PRINT_STATUS_END
PRINT_ON_LABEL:
    setColor 2, 0Ah
    printStr STATUS_ON
PRINT_STATUS_END:
    RET
PRINT_STATUS ENDP
GET_INPUT PROC
    MOV AH,1
    INT 21h
    RET
GET_INPUT ENDP
SHOW_ERROR PROC
 
    MOV AH, 02h
    MOV DL, 0Dh  
    INT 21h
    MOV DL, 0Ah    
    INT 21h
    MOV DL, 0Dh   
    INT 21h
    MOV DL, 0Ah   
    INT 21h
 
    MOV AL, ' '   
    setColor 76, 8Ch 

 
    printStr ERROR_MSG

 
    MOV AH, 1
    INT 21h
    RET
SHOW_ERROR ENDP

; New Proc: Shows error if unit is off, matches SHOW_ERROR style
SHOW_POWER_ERROR PROC
    MOV AH, 02h
    MOV DL, 0Dh  
    INT 21h
    MOV DL, 0Ah    
    INT 21h
    MOV DL, 0Dh   
    INT 21h
    MOV DL, 0Ah   
    INT 21h
 
    MOV AL, ' '   
    setColor 76, 8Ch 

    printStr POWER_ERR_MSG

    MOV AH, 1
    INT 21h
    RET
SHOW_POWER_ERROR ENDP

; New Proc: 0.25s delay
DELAY_250MS PROC
    MOV CX, 0FFFFh      
D1: 
    MOV BX, 05h         
D2: 
    DEC BX
    JNZ D2
    LOOP D1
    RET
DELAY_250MS ENDP

POWER_OFF PROC
    MOV AC_SWING,0
    MOV AC_QUIET,0
    MOV AC_ECO,0
    MOV AC_FAN,0
    MOV AC_COOL,0
    MOV AC_TURBO,0
    MOV AC_TIMER,0
    MOV AC_SLEEP,0
    JMP MAIN_LOOP
POWER_OFF ENDP
WAIT_FOR_ENTER PROC
WAIT_LOOP:
    MOV AH,1
    INT 21h
    CMP AL,13
    JNE WAIT_LOOP
    RET
WAIT_FOR_ENTER ENDP
CHECK_POWER PROC
    CMP AC_POWER,1
    JE POWER_OK
    POP AX 
    CALL SHOW_POWER_ERROR
    JMP MAIN_LOOP
POWER_OK:
    RET
CHECK_POWER ENDP
END MAIN