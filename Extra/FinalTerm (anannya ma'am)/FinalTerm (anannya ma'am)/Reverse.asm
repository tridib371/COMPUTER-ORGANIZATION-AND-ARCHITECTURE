.MODEL SMALL
.STACK 100H
.CODE
.DATA

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AL,0B7H
    XOR BL,BL
    MOV CX,8
    
    REVERSE:
    SHL AL,1
    RCR BL,1
    
    LOOP REVERSE
    
    MOV AL,BL
    
    
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN