.MODEL SMALL
.STACK 100H
.DATA 

.CODE
MAIN PROC
    MOV CX, 256         
    MOV BX, 0           
 
ASCII:
    MOV DL, BL         
    MOV AH, 2           
    INT 21H             
 
    INC BL              
    DEC CX             
    JNZ ASCII     
 
    MOV AH, 4CH         
    INT 21H             
MAIN ENDP
END MAIN