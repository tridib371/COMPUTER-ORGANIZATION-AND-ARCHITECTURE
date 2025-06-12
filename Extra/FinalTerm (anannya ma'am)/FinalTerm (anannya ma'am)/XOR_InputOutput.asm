.DATA
INPUT DB " ENTER HEX INPUT: $"
OUTPUT DB 0AH, 0DH, " HEX OUTPUT: $" 

.CODE

INPUT1 PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH,9
    LEA DX,INPUT
    INT 21H
    RET
ENDP

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    CALL INPUT1
    XOR BX,BX
    MOV CX,4 
 
    
FOR_START:  
    MOV AH,1
    INT 21H
    
    CMP AL,0DH
    JE DISPLAY_OUTPUT
    CMP AL,41H
    JGE DISPLAY_LETTER
    AND AL,0FH              ; SUB AL 30H
    JMP NOT_LETTER

DISPLAY_LETTER:
    SUB AL,37H              ; 41H-37H = 10 (A)
 
NOT_LETTER:                 ; BX=ABO7 BH=AB DL=AB
    SHL BX,CL               ; DL=A/10
    OR BL,AL                ; BX=
    JMP FOR_START           ; LETTER OUTPUT
     
  
DISPLAY_OUTPUT:
    MOV AH,9
    LEA DX,OUTPUT
    INT 21H
    
    MOV CX,4
    MOV AH,2               ; SINGLE OUTPUT
    
    
AGAIN:
    MOV DL,BH
    SHR DL,4
    ROL BX,4
    CMP DL,10
    JGE LETTER_OUTPUT 
    
    ADD DL,48               ; 30H BOTH ARE SAME
    INT 21H
    JMP EXIT

    
LETTER_OUTPUT:
    ADD DL,55               ; 37H BOTH ARE SAME
    INT 21H 
    
EXIT:
    LOOP AGAIN
 
    
WHILE_END:
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN