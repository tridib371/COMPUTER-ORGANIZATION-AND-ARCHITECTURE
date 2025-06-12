.MODEL SMALL
.STACK 100H
.DATA  

M1 DB "Enter a Number: $"
M2 DB 0DH, 0AH, "The Input is not a Number $"
M4_E DB 0DH, 0AH, "The Number is EVEN $"
M5_O DB 0DH, 0AH, "The Number is ODD $"  

.CODE
MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
   
    MOV AH,9
    LEA DX,M1
    INT 21H

    MOV AH,1
    INT 21H
    MOV BL,AL  

    CMP AL,'0'
    JL NAN
    CMP AL,'9'
    JG NAN

    SUB AL,'0'
  
    TEST AL,1 
    JZ EVEN 
    JMP ODD
   
   
NAN: 
    MOV AH,9
    LEA DX,M2
    INT 21H
    JMP EXIT
 
 
EVEN:
    MOV AH,9
    LEA DX,M4_E
    INT 21H
    JMP EXIT
    
    
ODD:
    MOV AH,9
    LEA DX,M5_O
    INT 21H
   
   
EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
