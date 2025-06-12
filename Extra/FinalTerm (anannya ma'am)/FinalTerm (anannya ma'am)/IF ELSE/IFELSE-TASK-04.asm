ORG 100H
.DATA
    M1 DB "FIRST INPUT: $"
    M2 DB 0AH, 0DH,"SECOND INPUT: $"
    M3 DB 0AH, 0DH, "THIRD INPUT: $"
    
    M4 DB 0AH, 0DH, "AX=0 $" 
    M5 DB 0AH, 0DH, "BX=0 $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    
    MOV AH,9
    LEA DX,M1
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,'0'
    MOV AX,AX
    
    
    MOV AH,9
    LEA DX,M2
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,'0'
    MOV BX,AX 
        
        
    MOV AH,9
    LEA DX,M3
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,'0'
    MOV CX,AX

    
    CMP AX,BX
    JGE AX_ZERO
    CMP BX,CX 
    JGE BX_ZERO 
    

AX_ZERO:
    MOV AX,0
    MOV AH,9
    LEA DX,M4
    INT 21H 
    JMP END
    
    
BX_ZERO:
    MOV BX,0
    MOV AH,9
    LEA DX,M5
    INT 21H
    
    
END:
    MOV AH,4CH 
    INT 21H

MAIN ENDP
END MAIN