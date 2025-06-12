.MODEL SMALL
.STACK 100H
.DATA
PROMPT DB "Enter Characters: $"
OUTPUT DB 0AH, 0DH, "Output is: $"
VAR DB 3 DUP('$')  ; Reserve 3 bytes: 2 for characters, 1 for the end-of-string marker '$'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    MOV AH, 9
    LEA DX, PROMPT
    INT 21H

    ; Read first character and store in VAR
    MOV AH, 1
    INT 21H
    MOV VAR, AL  ; Store first character in the first byte of VAR

    ; Read second character and store in VAR+1
    MOV AH, 1
    INT 21H
    MOV VAR + 1, AL  ; Store second character in the second byte of VAR

    ; Add string terminator ('$') to VAR+2
    MOV BYTE PTR VAR + 2, '$'

    ; Display output message
    MOV AH, 9
    LEA DX, OUTPUT
    INT 21H

    ; Display the stored characters
    MOV AH, 9
    LEA DX, VAR
    INT 21H

    ; End program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
