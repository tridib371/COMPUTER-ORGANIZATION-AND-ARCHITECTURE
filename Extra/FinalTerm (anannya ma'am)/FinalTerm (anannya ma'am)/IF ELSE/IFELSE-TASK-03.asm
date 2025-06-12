ORG 100H
.DATA
    M1 DB 'ENTER AN ALPHABET: $'
    M2 DB 0AH, 0DH, 'THE ENTERED ALPHABET IS: $'
    M3 DB 0AH, 0DH, 'INVALID INPUT!$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    
    MOV AH,9
    LEA DX,M1
    INT 21H

    MOV AH,1
    INT 21H

    
    CMP AL,'A'
    JL INVALID
    CMP AL,'Z' 
    JG INVALID 
    JMP RESULT
    

RESULT:
    MOV AH,9
    LEA DX,M2
    INT 21H 
          
    MOV DL,AL 
    MOV AH,2
    INT 21H
    JMP END
     
     
INVALID:
    MOV AH,9
    LEA DX,M3
    INT 21H
    
    
END:
    MOV AH,4CH 
    INT 21H

MAIN ENDP
END MAIN