ORG 100H

.DATA
    M1 DB "Enter 3-character PASS (0-9, A-F): $"
    EM DB 0AH, 0DH, "Invalid PASS! Try again.$"
    SM DB 0AH, 0DH, "PASS encrypted: $"
    PASS DB ?  

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX


START:
    MOV AH,9
    LEA DX,M1
    INT 21H

    
    LEA DI,PASS
    MOV CX,3
 
 
VALIDATE_LOOP:
    MOV AH,1
    INT 21H
    MOV [DI],AL             ; Store the input
    CMP AL,'0'
    JL INVALID              ; Check if below '0'
    CMP AL,'9'
    JLE VALID_CHAR          ; Check if within '0'-'9'
    CMP AL,'A'
    JL INVALID              ; Check if below 'A'
    CMP AL,'F'
    JG INVALID              ; Check if above 'F'
 
 
VALID_CHAR:
    INC DI
    LOOP VALIDATE_LOOP
    JMP ENCRYPT
    
    
INVALID:
    MOV AH,9
    LEA DX,EM
    INT 21H
    JMP START
    

ENCRYPT:
    LEA DI,PASS
    MOV CX,3

ENCRYPT_LOOP:
    MOV AL,[DI]
    SHL AL,2                
    AND AL,0FH             
    MOV [DI],AL            
    INC DI
    LOOP ENCRYPT_LOOP


    MOV AH,9
    LEA DX,SM
    INT 21H

    
    LEA DI,PASS
    MOV CX,3

DISPLAY_LOOP:
    MOV DL,[DI]
    ADD DL,'0' 
               
    MOV AH,2
    INT 21H
    INC DI 
    
    LOOP DISPLAY_LOOP

 
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
