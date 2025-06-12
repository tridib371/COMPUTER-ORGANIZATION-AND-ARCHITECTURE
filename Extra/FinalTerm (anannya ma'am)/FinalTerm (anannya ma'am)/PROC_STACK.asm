.MODEL SMALL
.STACK 100H
.CODE
.DATA

;Single Input and Single Output 
   
INPUT PROC
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    RET
    
    INPUT ENDP

OUTPUT PROC
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    RET 
    OUTPUT ENDP

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    CALL INPUT
    CALL OUTPUT
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN