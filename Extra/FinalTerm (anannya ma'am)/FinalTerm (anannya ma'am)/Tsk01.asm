ORG 100H
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "Enter a character: $" 
    MSG2 DB 0
    RESULT DB 0AH, 0DH, "Converted character: $"
    ERROR_MSG DB 0AH, 0DH, "Invalid input! Not a letter. $"

.CODE
MAIN PROC
    
    MOV AH,9
    LEA DX,MSG
    INT 21H

    
    MOV AH,1
    INT 21H
    MOV MSG2,AL 

    
    CMP AL, 'A'
    JL NOT_LETTER  
    CMP AL, 'Z'
    JG CHECK_LOWER
    JMP RESULTS  

CHECK_LOWER: 
    CMP AL, 'a'
    JL NOT_LETTER  
    CMP AL, 'z'
    JG NOT_LETTER 
    JMP RESULTS 

 
RESULTS:

    XOR AL,20H 
    MOV MSG2,AL
 
     
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV DL,AL
    MOV AH,2
    INT 21H
    JMP DONE


NOT_LETTER:
    MOV AH,9
    LEA DX,ERROR_MSG
    INT 21H
    MOV AL,'?'  
    

DONE:
    MOV AH, 4CH
    INT 21H  
    
MAIN ENDP
END MAIN
