.MODEL SMALL
.STACK 100H

.DATA
    MSG_INPUT  DB "Enter a number: $"
    MSG_POS    DB 0AH, 0DH, "Positive $"
    MSG_NEG    DB 0AH, 0DH, "Negative $"
    MSG_ZERO   DB 0AH, 0DH, "Zero $"
    NUM        DB ?
    NUM1        DB ?         ; Variable to store the input number

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display Input Prompt
    MOV AH, 9
    LEA DX, MSG_INPUT
    INT 21H

    ; Read Single Character Input
    MOV AH, 1       ; DOS function to take input
    INT 21H
    MOV NUM, AL     ; Store the input number 
    
    MOV AH, 1       ; DOS function to take input
    INT 21H
    MOV NUM1, AL     ; Store the input number

    ; Check for Negative Sign
    CMP NUM, '0'    ; Compare the input with ASCII value of '0'
    JL NEGATIVE     ; Jump if less (negative)

    ; Check for Positive Sign
    CMP NUM, '0'    ; Compare the input with '0' again
    JG POSITIVE     ; Jump if greater (positive)



POSITIVE:
    ; Output Positive Message
    MOV AH, 9
    LEA DX, MSG_POS
    INT 21H
    JMP END_PROGRAM

NEGATIVE:
    ; Output Negative Message
    MOV AH, 9
    LEA DX, MSG_NEG
    INT 21H

END_PROGRAM:
    ; Terminate Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
