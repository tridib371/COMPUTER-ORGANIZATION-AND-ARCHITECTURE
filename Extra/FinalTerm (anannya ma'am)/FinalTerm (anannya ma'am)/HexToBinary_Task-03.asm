.MODEL SMALL
.STACK 100H
.DATA

INPUT DB "ENTER A 4 Bit HEX VALUE: $"
OUTPUT DB "OUTPUT : $ "

.CODE  

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX  
    
    
    MOV AH,9
    LEA DX,INPUT
    INT 21H
    
    
    MOV BX,0 
    MOV CL,4

INPUT_VALUE:
    MOV AH,1
    INT 21H
    CMP AL,13
   
    JE SHOW_OUTPUT 
    
    CMP AL,41H 
    JGE LETTER
    
    AND AL,0FH      
    JMP SHIFT
    
   
LETTER:
    SUB AL,37H  
       
       
SHIFT:   
    SHL BX,CL
    OR BL,AL
    JMP INPUT_VALUE 
    
     
SHOW_OUTPUT:
    MOV AH,2
    MOV DL,10
    INT 21H  
    MOV DL,13 
    INT 21H 

    MOV AH,9   
    LEA DX,OUTPUT
    INT 21H  
            
    MOV CX,16
   
            
IF:
    SHL BX,1
    JNC THEN 
        
    MOV AH,2
    MOV DL,31H
    INT 21H  
        
    JMP OUTPUT_LOOP
   
   
THEN:
    MOV AH,2
    MOV DL,30H
    INT 21H   
         
         
OUTPUT_LOOP:
    LOOP IF

    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END
