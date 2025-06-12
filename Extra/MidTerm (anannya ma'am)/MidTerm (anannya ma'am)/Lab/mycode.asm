.MODEL SMALL
.STACK 100H
.DATA
A DB "Enter Any Value: $" 
B DB "Wrong Input; Decimal digits only. $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
           
    MOV AH,9
    LEA DX,A 
    INT 21H  
     
    MOV AH,1
    INT 21H
    MOV DH,AL 
     
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H 
    
    
    CMP DH,'0'
    JP ERROR
    CMP DH,'9'
    
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
   
              
ERROR:
    MOV AH,9      
    LEA DX,B 
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H 

   

END:
    MOV AH,4CH                  
    INT 21H

MAIN ENDP                       
END MAIN  





