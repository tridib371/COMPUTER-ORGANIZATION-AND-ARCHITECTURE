.MODEL SMALL
.STACK 100H
.DATA
    M1 DB 0AH, 0DH, "Entered Numbers from 1 to 5: $"
    M2 DB 0AH, 0DH, "Output is: $"
    M3 DB 0AH, 0DH, "The sum is: $"
    M4 DB 5 DUP(?) 
    M5 DB 0            

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX


    MOV AH,9
    LEA DX,M1
    INT 21H

   
    MOV CX, 5          
    LEA SI, M4     
    
START_LOOP:
    MOV AH, 1           
    INT 21H
    SUB AL, '0'         
    MOV [SI], AL        
    INC SI              
    LOOP START_LOOP      

 
    MOV CX, 5         
    LEA SI, M4     
    XOR AL, AL 
           
SUM_LOOP:
    ADD AL, [SI]        
    INC SI              
    LOOP SUM_LOOP       
    MOV M5, AL         

  
    MOV AH, 9
    LEA DX, M2
    INT 21H


    MOV CX, 5          
    LEA SI, M4 
       
DISPLAY_LOOP:
    MOV DL, [SI]        
    ADD DL, '0'         
    MOV AH, 2           
    INT 21H
    INC SI              
    LOOP DISPLAY_LOOP   


    MOV AH, 9
    LEA DX, M3
    INT 21H

    MOV AL, M5
    ADD AL, '0'        
    MOV DL, AL
    MOV AH, 2
    INT 21H


    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN