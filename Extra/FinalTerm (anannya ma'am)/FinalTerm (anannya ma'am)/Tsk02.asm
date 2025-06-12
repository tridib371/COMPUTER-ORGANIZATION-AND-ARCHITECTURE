.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "Enter a character: $"
    NOT_NUMBER DB 0DH, 0AH, "The input is not a number.$"
    EVEN_MSG DB 0DH, 0AH, "The number is even.$"
    ODD_MSG DB 0DH, 0AH, "The number is odd.$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 9
    LEA DX, MSG
    INT 21H
    MOV AH, 1
    INT 21H
    MOV BL, AL
    CMP AL, '0'
    JL NOT_A_NUMBER
    CMP AL, '9'
    JG NOT_A_NUMBER
    SUB AL, '0'
    MOV CL, AL
    MOV CH, 0

EVEN_ODD_LOOP:
    CMP CL, 0
    JE IS_EVEN
    CMP CL, 1
    JE IS_ODD
    SUB CL, 2
    JMP EVEN_ODD_LOOP

NOT_A_NUMBER:
    MOV AH, 9
    LEA DX, NOT_NUMBER
    INT 21H
    JMP EXIT_PROGRAM

IS_EVEN:
    MOV AH, 9
    LEA DX, EVEN_MSG
    INT 21H
    JMP EXIT_PROGRAM

IS_ODD:
    MOV AH, 9
    LEA DX, ODD_MSG
    INT 21H

EXIT_PROGRAM:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
