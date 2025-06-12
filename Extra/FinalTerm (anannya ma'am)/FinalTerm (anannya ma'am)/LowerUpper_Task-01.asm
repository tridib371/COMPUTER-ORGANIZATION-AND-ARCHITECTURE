ORG 100H
.MODEL SMALL
.STACK 100h
.DATA    

M1 DB "Enter a Character: $"
V1 DB 0 
M2 DB 0AH, 0DH, 'Converted Character: $'
M3 DB 0DH, 0AH, "The Input is not a Letter $"
    
.CODE
MAIN PROC
       
    MOV AH,9               
    LEA DX,M1              
    INT 21H  
    
    MOV AH,1
    INT 21H
    MOV V1,AL 

    
    CMP AL,'A'
    JL INVALID 
    CMP AL,'Z'
    JG LOWER
    JMP CONVERT
     
     
LOWER:
    CMP AL, 'a'
    JL INVALID 
    CMP AL, 'z'
    JG INVALID 
    JMP CONVERT
    
    
CONVERT:
    XOR AL,20H 
    MOV V1,AL 

    MOV AH,9
    LEA DX,M2
    INT 21H

   
    MOV AH,2 
    MOV DL,V1
    INT 21H
    JMP END

INVALID:
    MOV AH,9
    LEA DX,M3
    INT 21H
   
   
END:
    MOV AH, 4Ch
    INT 21H 
    
MAIN ENDP
END MAIN