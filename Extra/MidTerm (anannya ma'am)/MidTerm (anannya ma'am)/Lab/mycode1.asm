.MODEL SMALL
.STACK 100H

.DATA
    MSG_HELLO DB 0AH, 0DH, "Hello World $"   ; Message to print

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

PRINT_HELLO:
    ; Display "Hello World"
    MOV AH, 9                ; DOS function to display string
    LEA DX, MSG_HELLO        ; Load address of MSG_HELLO
    INT 21H                  ; Print the string

    ; Unconditional Jump to Repeat the Printing
    JMP PRINT_HELLO          ; Jump back to the label PRINT_HELLO

    ; End Program (This code will never be reached)
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
