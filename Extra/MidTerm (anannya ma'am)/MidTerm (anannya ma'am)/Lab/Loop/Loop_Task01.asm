.MODEL SMALL
.STACK 100H
.DATA
    M1 DB "Enter a character: $"                               
    M2 DB 0AH, 0DH, "OUTPUT IS: $"             
    M3 DB 0AH, 0DH, "THANK YOU. $" 
    M4 DB ?  

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, M1
    INT 21H

    MOV AH, 1
    INT 21H
    MOV M4, AL        

    MOV AH, 9
    LEA DX, M2          
    INT 21H

    MOV CX, 50          

SHOW_LOOP:
    MOV AH, 2           
    MOV DL, M4        
    INT 21H            
    LOOP SHOW_LOOP     

    MOV AH, 9
    LEA DX, M3
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
