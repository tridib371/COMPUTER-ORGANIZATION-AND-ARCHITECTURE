ORG 100H
.DATA

M1 DB "ENTER THE VALUE OF AL: $"
M2 DB 0AH, 0DH, "AH IS:FFH $"
M3 DB 0AH, 0DH, "AH IS:0 $"

.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    MOV AH,9
    LEA DX,M1
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    CBW 
    
    
CASE_AX:
    CMP AL,0
    JL DISPLAY_OUTPUT 
    JG INVALID
    
    
DISPLAY_OUTPUT:
    MOV AH,0FFH
    MOV AH,9
    LEA DX,M2
    INT 21H
    JMP END
        
        
INVALID: 
    MOV AH,0
    MOV AH,9
    LEA DX,M3
    INT 21H 
   
    
END:
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN



