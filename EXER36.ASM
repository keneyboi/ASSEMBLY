; Filename: EXER36.ASM
; Programmer Name: Horigome, Ken N.
; Date: October 9, 2025
; Description: This program functions as a basic calculator that performs
; addition, subtraction, multiplication, and division on single-digit inputs.
; It also uses BIOS interrupts to clear the screen and apply text formatting.

.model small
.stack 100h

.data
    msg_title      db "THE CALCULATOR", 13,10, "$"
    msg_author     db "Created by: HORIGOME, KEN N.", 13,10, "$"
    msg_date       db "Date: 10/09/25", 13,10,"$"

    menu_title     db 13,10,10,"Main Menu", "$"
    menu_add       db 13,10,10," a - Addition", "$"
    menu_sub       db 13,10,10," s - Subtraction", "$"
    menu_mul       db 13,10,10," m - Multiplication", "$"
    menu_div       db 13,10,10," d - Division", "$"
    menu_exit      db 13,10,10," e - Exit", "$"
    menu_choice    db 13,10,"Enter your choice: $"
    newline        db 13,10,"$"

    title_add      db 13,10,10, "Addition","$"
    title_sub      db 13,10,10,"Subtraction","$"
    title_mul      db 13,10,10,"Multiplication","$"
    title_div      db 13,10,10,"Division","$"
    title_exit     db 13,10,10,"Exit Program","$"

    add_prompt1    db 13,10,"Enter first addend: $"
    add_prompt2    db 13,10,"Enter second addend: $"
    add_label1     db 13,10,"First addend is: $"
    add_label2     db 13,10,"Second addend is: $"
    add_result     db 13,10,"Sum: $"

    sub_prompt1    db 13,10,"Enter minuend: $"
    sub_prompt2    db 13,10,"Enter subtrahend: $"
    sub_label1     db 13,10,"Minuend is: $"
    sub_label2     db 13,10,"Subtrahend is: $"
    sub_result     db 13,10,"Difference: $"

    mul_prompt1    db 13,10,"Enter multiplicand: $"
    mul_prompt2    db 13,10,"Enter multiplier: $"
    mul_label1     db 13,10,"Multiplicand is: $"
    mul_label2     db 13,10,"Multiplier is: $"
    mul_result     db 13,10,"Product: $"

    div_prompt1    db 13,10,"Enter dividend: $"
    div_prompt2    db 13,10,"Enter divisor: $"
    div_label1     db 13,10,"Dividend is: $"
    div_label2     db 13,10,"Divisor is: $"
    div_result     db 13,10,"Quotient: $"

    msg_continue   db 13,10,13,10,"Press Enter to continue.$"

    num_first      db ?
    num_second     db ?
    num_result     db ?

.code
main proc
                   mov   ax, @data
                   mov   ds, ax

menu:              
                   call  clear_screen

                   mov   ah, 9
                   lea   dx, msg_title
                   int   21h
                   mov   ah, 9
                   lea   dx, msg_author
                   int   21h
                   mov   ah, 9
                   lea   dx, msg_date
                   int   21h

                   mov   ah, 9
                   lea   dx, menu_title
                   int   21h

                   mov   dx, offset menu_add
                   mov   cl, 60h
                   call  print_attr

                   mov   dx, offset menu_sub
                   mov   cl, 20h
                   call  print_attr

                   mov   dx, offset menu_mul
                   mov   cl, 10h
                   call  print_attr

                   mov   dx, offset menu_div
                   mov   cl, 50h
                   call  print_attr

                   mov   dx, offset menu_exit
                   mov   cl, 70h
                   call  print_attr

                   mov   ah, 9
                   lea   dx, menu_choice
                   int   21h

                   mov   ah, 1
                   int   21h
                   mov   bl, al

                   mov   ah, 9
                   lea   dx, newline
                   int   21h

                   cmp   bl, 'a'
                   je    addition
                   cmp   bl, 's'
                   je    subtraction
                   cmp   bl, 'm'
                   jne   check_div
                   jmp   multiplication

check_div:         
                   cmp   bl, 'd'
                   jne   check_exit
                   jmp   division

check_exit:        
                   cmp   bl, 'e'
                   jne   menu
                   jmp   exit_program

addition:          
                   mov   dx, offset title_add
                   mov   cl, 60h
                   call  print_attr

                   lea   dx, add_prompt1
                   call  input_num
                   mov   num_first, al

                   lea   dx, add_prompt2
                   call  input_num
                   mov   num_second, al

                   mov   ah, 9
                   lea   dx, add_label1
                   int   21h
                   mov   dl, num_first
                   add   dl, '0'
                   mov   ah, 2
                   int   21h

                   mov   ah, 9
                   lea   dx, add_label2
                   int   21h
                   mov   dl, num_second
                   add   dl, '0'
                   mov   ah, 2
                   int   21h

                   mov   al, num_first
                   add   al, num_second
                   mov   num_result, al

                   mov   ah, 9
                   lea   dx, add_result
                   int   21h
                   call  display_result
                   jmp   wait_key

subtraction:       
                   mov   dx, offset title_sub
                   mov   cl, 20h
                   call  print_attr

                   lea   dx, sub_prompt1
                   call  input_num
                   mov   num_first, al

                   lea   dx, sub_prompt2
                   call  input_num
                   mov   num_second, al

                   mov   ah, 9
                   lea   dx, sub_label1
                   int   21h
                   mov   dl, num_first
                   add   dl, '0'
                   mov   ah, 2
                   int   21h

                   mov   ah, 9
                   lea   dx, sub_label2
                   int   21h
                   mov   dl, num_second
                   add   dl, '0'
                   mov   ah, 2
                   int   21h

                   mov   al, num_first
                   sub   al, num_second
                   mov   num_result, al

                   mov   ah, 9
                   lea   dx, sub_result
                   int   21h
                   call  display_result
                   jmp   wait_key

multiplication:    
                   mov   dx, offset title_mul
                   mov   cl, 10h
                   call  print_attr

                   lea   dx, mul_prompt1
                   call  input_num
                   mov   num_first, al

                   lea   dx, mul_prompt2
                   call  input_num
                   mov   num_second, al

                   mov   ah, 9
                   lea   dx, mul_label1
                   int   21h
                   mov   dl, num_first
                   add   dl, '0'
                   mov   ah, 2
                   int   21h

                   mov   ah, 9
                   lea   dx, mul_label2
                   int   21h
                   mov   dl, num_second
                   add   dl, '0'
                   mov   ah, 2
                   int   21h

                   mov   al, num_first
                   mov   bl, num_second
                   mul   bl
                   mov   num_result, al

                   mov   ah, 9
                   lea   dx, mul_result
                   int   21h
                   call  display_result
                   jmp   wait_key

division:          
                   mov   dx, offset title_div
                   mov   cl, 50h
                   call  print_attr

                   lea   dx, div_prompt1
                   call  input_num
                   mov   num_first, al

                   lea   dx, div_prompt2
                   call  input_num
                   mov   num_second, al

                   mov   ah, 9
                   lea   dx, div_label1
                   int   21h
                   mov   dl, num_first
                   add   dl, '0'
                   mov   ah, 2
                   int   21h

                   mov   ah, 9
                   lea   dx, div_label2
                   int   21h
                   mov   dl, num_second
                   add   dl, '0'
                   mov   ah, 2
                   int   21h

                   mov   al, num_first
                   mov   ah, 0
                   mov   bl, num_second
                   div   bl
                   mov   num_result, al

                   mov   ah, 9
                   lea   dx, div_result
                   int   21h
                   call  display_result
                   jmp   wait_key

exit_program:      
                   mov   dx, offset title_exit
                   mov   cl, 70h
                   call  print_attr
                   mov   ah, 4Ch
                   int   21h

clear_screen proc
                   mov   ax, 0600h
                   mov   bh, 07
                   mov   cx, 0
                   mov   dx, 184Fh
                   int   10h
                   mov   ah, 02h
                   mov   bh, 0
                   mov   dx, 0
                   int   10h
                   ret
clear_screen endp

input_num proc
                   mov   ah, 9
                   int   21h
                   mov   ah, 1
                   int   21h
                   sub   al, '0'
                   ret
input_num endp

display_result proc
                   mov   al, num_result
                   mov   ah, 0
                   mov   bl, 10
                   div   bl

                   cmp   al, 0
                   je    skip_tens
                   add   al, '0'
                   mov   dl, al
                   mov   ah, 2
                   int   21h

skip_tens:         
                   mov   al, ah
                   add   al, '0'
                   mov   dl, al
                   mov   ah, 2
                   int   21h
                   ret
display_result endp

wait_key proc
                   mov   ah, 9
                   lea   dx, msg_continue
                   int   21h
                   mov   ah, 1
                   int   21h
                   call  clear_screen
                   jmp   menu
wait_key endp

print_attr proc
                   push  ax
                   push  bx
                   push  cx
                   push  dx
                   push  si

                   mov   si, dx
                   mov   bl, cl
                   xor   bh, bh

print_attr_loop:   
                   lodsb
                   cmp   al, '$'
                   je    print_attr_done
                   cmp   al, 13
                   je    handle_newline
                   cmp   al, 10
                   je    handle_newline

                   mov   ah, 09h
                   mov   cx, 1
                   int   10h

                   mov   ah, 03h
                   xor   bh, bh
                   int   10h
                   inc   dl
                   mov   ah, 02h
                   int   10h
                   jmp   print_attr_loop

handle_newline:    
                   mov   ah, 03h
                   xor   bh, bh
                   int   10h
                   inc   dh
                   mov   dl, 0
                   mov   ah, 02h
                   int   10h
                   lodsb
                   cmp   al, 10
                   jne   not_lf
                   lodsb
not_lf:            
                   cmp   al, '$'
                   je    print_attr_done
                   jmp   print_attr_loop

print_attr_done:   
                   pop   si
                   pop   dx
                   pop   cx
                   pop   bx
                   pop   ax
                   ret
print_attr endp

main endp
end main