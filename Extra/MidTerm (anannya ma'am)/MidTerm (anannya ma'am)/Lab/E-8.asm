.MODEL SMALL
.STACK 100H
.DATA
A DB "The Sum is: $"                      
B DB "The Sum is greater than 10$"        

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX  
    
    MOV AH,2
    MOV DL,'?'     
    INT 21H     
                         
    MOV AH,1
    INT 21H
    SUB AL, '0'                         
    MOV BH,AL                           

  
    MOV AH,1
    INT 21H
    SUB AL,'0'                         
    MOV DH,AL                           

   
    ADD BH, DH                         
    CMP BH, 10                           
    JAE GREATER    
    
    MOV AH,2
    MOV DL,13     
    INT 21H
    MOV DL,10     
    INT 21H                        

    MOV AH,9
    LEA DX,A                            
    INT 21H                             
   
   
    ADD BH,'0'                         
    MOV DL,BH                           
    MOV AH, 2
    INT 21H                              
    JMP EXIT 
    
                                   

GREATER:
    MOV AH,2
    MOV DL,13     
    INT 21H
    MOV DL,10     
    INT 21H 
    
    MOV AH, 9
    LEA DX, B                           
    INT 21H                             

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
