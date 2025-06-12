.MODEL SMALL
.STACK 100H
.DATA

INPUT DB "ENTER A BINARY VALUE: $"
OUTPUT DB 0AH, 0DH, "HEX OUTPUT: $" 
M3 DB 0AH, 0DH,"INVALID $"

.CODE  

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9
    LEA DX,INPUT
    INT 21H
    MOV BX,BX
    

INPUT_VALUE:
    MOV AH,1
    INT 21H
    CMP AL,0DH           
    JE SHOW_OUTPUT  

    CMP AL,'0'
    JL INVALID_INPUT  
    CMP AL,'1'
    JG INVALID_INPUT      

    
    SHL BX,1
    SUB AL,'0'
    OR BL,AL
    LOOP INPUT_VALUE
  
  
INVALID_INPUT:
    MOV AH,9   
    LEA DX,M3
    INT 21H 
    
    JMP END
 
 
SHOW_OUTPUT:
    MOV AH,9   
    LEA DX,OUTPUT
    INT 21H  
 
    MOV CX,4             
    MOV AH,2
     
     
HEX_LOOP:
    MOV DL,BL           
    AND DL,0FH            
    CMP DL,10             
    JL DIGIT_OUTPUT
    ADD DL,37H          
    JMP OUTPUT_CHAR
 
    
DIGIT_OUTPUT:
    ADD DL,30H        
 
 
OUTPUT_CHAR:
    INT 21H          
    SHR BX,4            
    LOOP HEX_LOOP

END:  
    MOV AH,4CH
    INT 21H

MAIN ENDP
END
