.MODEL SMALL
.STACK 100H
.DATA
M1 DB "Enter Any Number: $"
M2 DB 0AH,0DH, "The ENTERED Number is LESS than 5$"
M3 DB 0AH,0DH, "The ENTERED Number is GREATER than 5$"
M4 DB 0AH,0DH, "The ENTERED Number is EQUAL to 5$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    MOV AH,9                    ; 9 is string output and AH is the higher byte
    LEA DX,M1
    INT 21H

    ; User input
    MOV AH,1                    ; Take input where AH is the higher bytes
    INT 21H
    SUB AL,'0'                  ; Convert ASCII to integer

    ; Compare the input with the value in CL
    MOV BL,5                    ; Set CL to 5
    CMP AL,BL                   ; Compare AL with L
    JL LESS                     ; Jump if input < 5
    JG GREATER                  ; Jump if input > 5
    JE EQUAL                    ; Jump if input == 5

LESS:
    MOV AH,9
    LEA DX,M2
    INT 21H
    JMP END                     ; Exit after displaying message

GREATER:
    MOV AH,9                    ; 9 is string output and AH is the higher byte
    LEA DX,M3
    INT 21H
    JMP END                     ; Exit after displaying message

EQUAL:
    MOV AH,9                    ; 9 is string output and AH is the higher byte
    LEA DX,M4
    INT 21H

END:
    ; End the program
    MOV AH,4CH                  ; Hexa decimal value to start exit
    INT 21H

MAIN ENDP                       ; Endp is the end procedure
END MAIN
