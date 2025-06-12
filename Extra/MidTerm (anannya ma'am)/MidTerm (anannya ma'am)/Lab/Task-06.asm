.MODEL SMALL
.STACK 100H

.DATA
    MSG_HELLO DB 0AH, 0DH, "Hello World $"
    MSG_BYE   DB 0AH, 0DH, "Bye World $"
    M3     DB 5            ; Loop counter initialized to 5

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Set the Loop Counter
    MOV CX, 5                 ; CX = 5 (Number of times to print "Hello World")

PRINT_HELLO:
    ; Display "Hello World"
    MOV AH, 9                 ; DOS function to print a string
    LEA DX, MSG_HELLO
    INT 21H

    ; Decrement Counter and Check
    DEC CX                    ; Decrease the counter
    CMP CX, 0                 ; Compare counter with 0
    JNE PRINT_HELLO           ; If not equal to 0, jump to PRINT_HELLO

    ; Print "Bye World" after loop
    MOV AH, 9                 ; DOS function to print a string
    LEA DX, MSG_BYE
    INT 21H

    ; End Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
