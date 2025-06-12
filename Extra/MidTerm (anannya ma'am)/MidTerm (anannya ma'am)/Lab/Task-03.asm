.MODEL SMALL
.STACK 100H
.DATA
A DB "Enter The Characters: $"
B DB 0AH, 0DH, "The Output is - $" 
C DB ?
D DB ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
         
    
    MOV AH,9                ; 9 is string output and AH is the higher byte
    LEA DX,A                ; LEA used for load effective address
    INT 21H 
        
            
    ; Input first character
    MOV AH,1                ; 1 take input
    INT 21H
    MOV C,AL                ; Store the first input in C
    
    ; Input second character
    MOV AH,1                ; take input where ah is the higher bytes
    INT 21H
    MOV D,AL                ; Store the second input in D   
    
            
    MOV AH,9                ; 9 is string output and AH is the higher byte
    LEA DX,B                ; LEA used for load effective address
    INT 21H 
    
    
    ; Output first character
    MOV AH,2
    MOV DL,C                ; Output the first character
    INT 21H 
    
    ; Display the second character
    MOV AH,2
    MOV DL,D                ; Second character in DH
    INT 21H
    
    
       
    ; End the program
    MOV AH,4CH              ; Hexa decimal value to start exit
    INT 21H   
    
MAIN ENDP                   ; Endp is the end procedure
END MAIN