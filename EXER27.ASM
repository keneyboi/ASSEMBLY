; Filename: EXER27.ASM
; A Vehicle Sticker Application Form that prompts the user 
; details about their application and displays it via a custom GUI
; Name: Ken N. Horigome
; Date: September 13, 2025

.model small
.stack 200h
.DATA
MAX_INPUT EQU 20

; Input storage variables (kept as you had them)
personnelType db MAX_INPUT DUP (?)
applicantName db MAX_INPUT DUP (?)
contactNumber db MAX_INPUT DUP (?)
vehicleBrand  db MAX_INPUT DUP (?)
vehicleColor  db MAX_INPUT DUP (?)
parkingArea   db MAX_INPUT DUP (?)
employeeID    db MAX_INPUT DUP (?)
address       db MAX_INPUT DUP (?)
plateNumber   db MAX_INPUT DUP (?)
wheelCount    db MAX_INPUT DUP (?)

; Header messages for input phase
header1 db 'Cebu Institute of Technology - University',13,10,'$'
header2 db 'VEHICLE STICKER APPLICATION FORM',13,10,'$'
instruction db 'Please enter the needed information:',13,10,'$'
newline db 13,10,'$'

; Input prompts
typePrompt db 'Personnel Type: $'
namePrompt db 'Name of Applicant/Driver: $'
contactPrompt db 'Mobile Number: $'
brandPrompt db 'Vehicle Make(s)/Brand: $'
colorPrompt db 'Vehicle Color: $'
parkPrompt db 'Vehicle Sticker Type: $'
idPrompt db 'ID Number: $'
addrPrompt db 'Address: $'
platePrompt db 'Plate Number: $'
wheelPrompt db 'Vehicle Type: $'

; Text strings for colored display (already $-terminated)
summaryTitle db 'SUMMARY$'
headerText1 db 'Cebu Institute of Technology - University$'
headerText2 db 'VEHICLE STICKER APPLICATION FORM$'
headerText3 db 'Please fill out form below:$'
submitText db 'SUBMIT$'
copyrightText db 'Copyright 2024 YOUR FULL NAME HERE$'
thankYouText db 'Thank you!$'

; Field labels
labelPersonnel db 'Personnel Type:$'
labelName db 'Name of Appli/Dri.:$'
labelMobile db 'Mobile Number:$'
labelVehicle db 'Veh. Make/Brand:$'
labelColor db 'Vehicle Color:$'
labelSticker db 'Vehicle Sticker Type:$'
labelID db 'ID Number:$'
labelAddress db 'Address:$'
labelPlate db 'Plate Number:$'
labelType db 'Vehicle Type:$'

; Color constants (kept for readability)
BLACK equ 0
BLUE equ 1
GREEN equ 2
CYAN equ 3
RED equ 4
MAGENTA equ 5
BROWN equ 6
WHITE equ 7
GRAY equ 8
LIGHT_BLUE equ 9
LIGHT_GREEN equ 10
LIGHT_CYAN equ 11
LIGHT_RED equ 12
LIGHT_MAGENTA equ 13
YELLOW equ 14
BRIGHT_WHITE equ 15

.CODE
ProgramStart:
    mov ax,@data
    mov ds,ax

    ; Set text mode 3 (80x25)
    mov ax,0003h
    int 10h

    ; --- Input phase (prompts + reading) ---
    mov dx,OFFSET header1
    mov ah,9
    int 21h
    mov dx,OFFSET header2
    mov ah,9
    int 21h
    mov dx,OFFSET instruction
    mov ah,9
    int 21h

    ; Get all inputs (DX points to buffer address; GetInput stores string and terminates with '$')
    mov dx,OFFSET typePrompt
    mov ah,9
    int 21h
    mov dx,OFFSET personnelType
    call GetInput

    mov dx,OFFSET namePrompt
    mov ah,9
    int 21h
    mov dx,OFFSET applicantName
    call GetInput

    mov dx,OFFSET contactPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET contactNumber
    call GetInput

    mov dx,OFFSET brandPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET vehicleBrand
    call GetInput

    mov dx,OFFSET colorPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET vehicleColor
    call GetInput

    mov dx,OFFSET parkPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET parkingArea
    call GetInput

    mov dx,OFFSET idPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET employeeID
    call GetInput

    mov dx,OFFSET addrPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET address
    call GetInput

    mov dx,OFFSET platePrompt
    mov ah,9
    int 21h
    mov dx,OFFSET plateNumber
    call GetInput

    mov dx,OFFSET wheelPrompt
    mov ah,9
    int 21h
    mov dx,OFFSET wheelCount
    call GetInput

    ; Clear screen for colored form display (use BIOS scroll whole window with attribute 07)
    mov ax,0600h
    mov bh,07h
    mov cx,0
    mov dx,184Fh
    int 10h

    ; Draw colored form (border, red header, white body, footer)
    call DrawColoredForm

    ; Wait for a key press before exit (so user can see form)
    mov ah,0
    int 16h

    ; Exit program
    mov ah,4Ch
    int 21h

; -------------------------
; DrawColoredForm - orchestrate parts
; -------------------------
DrawColoredForm:
    call DrawBlackBorder
    call DrawRedHeader
    call DrawWhiteSection
    call DrawFooter
    ret

; -------------------------
; DrawBlackBorder - top, bottom and side borders
; -------------------------
DrawBlackBorder:
    ; top border: position DH=6 DL=5
    mov ah,02h
    mov bh,0
    mov dh,6
    mov dl,5
    int 10h

    ; draw top horizontal (70 chars) using solid block (219) with attribute 70h (gray bg)
    mov cx,70
    mov al,219
    mov ah,09h
    mov bh,0
    mov bl,70h
    int 10h

    ; bottom border: position DH=22 DL=5
    mov ah,02h
    mov bh,0
    mov dh,22
    mov dl,5
    int 10h

    mov cx,70
    mov al,219
    mov ah,09h
    mov bh,0
    mov bl,70h
    int 10h

    ; vertical sides (rows 7..21) - draw left and right single block per row
    mov dh,7
SideLoop:
    ; left side at column 5
    mov ah,02h
    mov bh,0
    mov dl,5
    int 10h
    mov al,219
    mov ah,09h
    mov bh,0
    mov bl,70h
    mov cx,1
    int 10h

    ; right side at column 74
    mov ah,02h
    mov bh,0
    mov dl,74
    int 10h
    mov al,219
    mov ah,09h
    mov bh,0
    mov bl,70h
    mov cx,1
    int 10h

    inc dh
    cmp dh,22
    jle SideLoop

    ret

; -------------------------
; DrawRedHeader - fills header rows with red, prints headerText1/2/3 in white on red
; -------------------------
DrawRedHeader:
    ; Fill rows 8..11 with spaces with attribute 4Fh (red background, bright white text)
    mov dh,8
RedFillLoop:
    mov ah,02h
    mov bh,0
    mov dl,6
    int 10h
    mov al,32
    mov ah,09h
    mov bh,0
    mov bl,4Fh
    mov cx,68
    int 10h
    inc dh
    cmp dh,12
    jle RedFillLoop

    ; print headerText1 at (row 9, col 20)
    mov ah,02h
    mov bh,0
    mov dh,9
    mov dl,20
    int 10h
    mov si,OFFSET headerText1
    mov bl,4Fh
    call DisplayColoredString

    ; headerText2 at (row 10, col 25)
    mov ah,02h
    mov bh,0
    mov dh,10
    mov dl,25
    int 10h
    mov si,OFFSET headerText2
    mov bl,4Fh
    call DisplayColoredString

    ; headerText3 at (row 11, col 28)
    mov ah,02h
    mov bh,0
    mov dh,11
    mov dl,28
    int 10h
    mov si,OFFSET headerText3
    mov bl,4Fh
    call DisplayColoredString

    ret

; -------------------------
; DrawWhiteSection - fills body rows with white and then displays form fields
; -------------------------
DrawWhiteSection:
    mov dh,13
WhiteFillLoop:
    mov ah,02h
    mov bh,0
    mov dl,6
    int 10h
    mov al,32
    mov ah,09h
    mov bh,0
    mov bl, 70h    ; white background, black text (attribute 0Fh)
    mov cx,68
    int 10h
    inc dh
    cmp dh,20
    jle WhiteFillLoop

    ; Display fields inside white section
    call DisplayFormFields
    ret

; -------------------------
; DisplayFormFields - print labels and user inputs with colored attributes
; -------------------------
DisplayFormFields:
    ; Row 1: Personnel Type (label) and its value, Vehicle Sticker Type (label) and value
    mov ah,02h
    mov bh,0
    mov dh,14
    mov dl,8
    int 10h
    mov si,OFFSET labelPersonnel
    mov bl,70h        ; label: white on black
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,28
    int 10h
    mov si,OFFSET personnelType
    mov bl,70h        ; data: red background, white text (attribute 47h)
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,42
    int 10h
    mov si,OFFSET labelSticker
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,65
    int 10h
    mov si,OFFSET parkingArea
    mov bl,70h
    call DisplayColoredString

    ; Row 2: Name and ID
    mov ah,02h
    mov bh,0
    mov dh,15
    mov dl,8
    int 10h
    mov si,OFFSET labelName
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,28
    int 10h
    mov si,OFFSET applicantName
    mov bl,70h   ; gray background data
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,42
    int 10h
    mov si,OFFSET labelID
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,65
    int 10h
    mov si,OFFSET employeeID
    mov bl,70h
    call DisplayColoredString

    ; Row 3: Mobile Number and Address
    mov ah,02h
    mov bh,0
    mov dh,16
    mov dl,8
    int 10h
    mov si,OFFSET labelMobile
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,28
    int 10h
    mov si,OFFSET contactNumber
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dh,17
    mov dl,42
    int 10h
    mov si,OFFSET labelAddress
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,65
    int 10h
    mov si,OFFSET address
    mov bl,70h
    call DisplayColoredString

    ; Row 4: Vehicle Brand and Plate Number
    mov ah,02h
    mov bh,0
    mov dh,18
    mov dl,8
    int 10h
    mov si,OFFSET labelVehicle
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,28
    int 10h
    mov si,OFFSET vehicleBrand
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,50
    int 10h
    mov si,OFFSET labelPlate
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,65
    int 10h
    mov si,OFFSET plateNumber
    mov bl,70h
    call DisplayColoredString

    ; Row 5: Vehicle Color and Vehicle Type
    mov ah,02h
    mov bh,0
    mov dh,19
    mov dl,8
    int 10h
    mov si,OFFSET labelColor
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,28
    int 10h
    mov si,OFFSET vehicleColor
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,50
    int 10h
    mov si,OFFSET labelType
    mov bl,70h
    call DisplayColoredString

    mov ah,02h
    mov bh,0
    mov dl,65
    int 10h
    mov si,OFFSET wheelCount
    mov bl,70h
    call DisplayColoredString

    ret

; -------------------------
; DrawFooter - submit button and footer text
; -------------------------
DrawFooter:
    ; Draw red submit block and label
    mov ah,02h
    mov bh,0
    mov dh,21
    mov dl,35
    int 10h
    mov al,32      ; space fill
    mov ah,09h
    mov bh,0
    mov bl,4Fh     ; red background / white text
    mov cx,10
    int 10h

    mov ah,02h
    mov bh,0
    mov dh,21
    mov dl,38
    int 10h
    mov si,OFFSET submitText
    mov bl,4Fh
    call DisplayColoredString

    ; Yellow thank you at bottom
    mov ah,02h
    mov bh,0
    mov dh,24
    mov dl,35
    int 10h
    mov si,OFFSET thankYouText
    mov bl,0Eh
    call DisplayColoredString

    ret

; -------------------------
; DisplayColoredString - prints string at SI until '$' using BL attribute
; Uses BIOS int 10h AH=09 (AL=char BL=attr, CX=count)
; After printing a char, manually advances cursor to next column.
; -------------------------
DisplayColoredString:
    push ax
    push bx
    push cx
    push dx

ColorLoop:
    lodsb                ; AL = [SI], SI++
    cmp al,'$'
    je ColorDone
    cmp al,0
    je ColorDone

    ; print single char with attribute in BL
    mov ah,09h
    mov bh,0
    mov cx,1
    int 10h

    ; advance cursor: get pos then set with DL+1
    mov ah,03h
    mov bh,0
    int 10h
    inc dl
    mov ah,02h
    mov bh,0
    int 10h

    jmp ColorLoop

ColorDone:
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; -------------------------
; GetInput - reads characters into buffer at DS:DX
;   - Uses DOS int 21h AH=01 to read characters (echoed)
;   - Supports backspace
;   - Stops on Enter (CR) or when buffer full (MAX_INPUT-1 chars)
;   - Appends '$' terminator for DisplayColoredString
; -------------------------
GetInput:
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov si,dx        ; SI points to destination buffer
    xor bx,bx        ; BX = character count

ReadLoop:
    mov ah,01h
    int 21h          ; returns AL = char (echoed)
    cmp al,13        ; Enter?
    je FinishInput
    cmp al,8         ; Backspace?
    jne StoreChar

    ; Backspace handling:
    cmp bx,0
    je ReadLoop
    dec bx
    ; erase last char on screen: BS, space, BS
    mov dl,8
    mov ah,2
    int 21h
    mov dl,' '
    mov ah,2
    int 21h
    mov dl,8
    mov ah,2
    int 21h
    jmp ReadLoop

StoreChar:
    ; store only if not at limit
    mov cx, MAX_INPUT - 1
    cmp bx, cx
    jae ReadLoop     ; reached capacity, ignore additional input
    mov [si+bx], al  ; store char at buffer + bx
    inc bx
    jmp ReadLoop

FinishInput:
    ; write terminator '$' at buffer + bx (safe because we stored up to MAX_INPUT-1)
    mov byte ptr [si+bx],'$'

    ; newline (CR+LF) so next prompt prints on new line
    mov dl,13
    mov ah,02h
    int 21h
    mov dl,10
    mov ah,02h
    int 21h

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

END ProgramStart