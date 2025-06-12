.MODEL SMALL
.STACK 100H
.DATA
A DB "The Sum is: $"
B DB "The Difference is: $"  
C DB "  For Addition - $" 
D DB "  For Subtraction - $"
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    ; Print "HELLO WORLD!"
    ; MOV AH,9      ;9 is string output and AH is the higher byte
    ; LEA DX,A      ; LEA used for load effective address
    ; INT 21H       ;to sbow output 

  
  
    MOV AH,9      ;9 is string output and AH is the higher byte
    LEA DX,C      ; LEA used for load effective address
    INT 21H       
    
    ; Create a new line
    MOV AH,2      ; 2 take decimal input
    MOV DL,13     ; Carry  at the first of the line
    INT 21H
    MOV DL,10     ; start a new line
    INT 21H  
    
       
            
    ; Input first character
    MOV AH,1      ;1 take input
    INT 21H
    MOV BH,AL     ; Store the first input in BH 
    ; Create a new line (Line Gap)
    MOV AH,2      ; 2 take decimal input
    MOV DL,13     ; Carry  at the first of the line
    INT 21H
    MOV DL,10     ; start a new line
    INT 21H 
    
     
     
    ; Input second character
    MOV AH,1      ;take input where ah is the higher bytes
    INT 21H
    MOV DH,AL     ; Store the second input in DH   
    ; Create a new line (Line Gap) 
    MOV AH,2
    MOV DL,13     ; Carry  at the first of the line
    INT 21H
    MOV DL,10     ;start a new line
    INT 21H   
           
    ; Additon 
    ADD BH,DH
    SUB BH,30H   
    
    MOV AH,9      ;9 is string output and AH is the higher byte
    LEA DX,A      ; LEA used for load effective address
    INT 21H 
     
    ; Output first character
    MOV AH,2
    MOV DL,BH     ; Output the first character
    INT 21H 
     
    ;--------------------------------------------------------------;
    
    ; Create a new line
    MOV AH,2      ; 2 take decimal input
    MOV DL,13     ; Carry  at the first of the line
    INT 21H
    MOV DL,10     ; start a new line
    INT 21H 
    ; Create a new line <Line Gap>
    MOV AH,2      ; 2 take decimal input
    MOV DL,13     ; Carry  at the first of the line
    INT 21H
    MOV DL,10     ; start a new line
    INT 21H
    
    MOV AH,9      ;9 is string output and AH is the higher byte
    LEA DX,D      ; LEA used for load effective address
    INT 21H
    
    ; Create a new line (Line Gap)
    MOV AH,2      ; 2 take decimal input
    MOV DL,13     ; Carry  at the first of the line
    INT 21H
    MOV DL,10     ; start a new line
    INT 21H  
      
      
      
    ; Input first character
    MOV AH,1      ;1 take input
    INT 21H
    MOV BH,AL     ; Store the first input in BH  
    ; Create a new line
    MOV AH,2      ; 2 take decimal input
    MOV DL,13     ; Carry  at the first of the line
    INT 21H
    MOV DL,10     ; start a new line
    INT 21H 
    
     
     
    ; Input second character
    MOV AH,1      ;take input where AH is the higher bytes
    INT 21H
    MOV DH,AL     ; Store the second input in DH   
    ; Create a new line 
    MOV AH,2
    MOV DL,13     ; Carry  at the first of the line
    INT 21H
    MOV DL,10     ;start a new line
    INT 21H  
     
   
    ; Subtraction 
    SUB BH,DH
    ADD BH,30H
    
    MOV AH,9      ;9 is string output and AH is the higher byte
    LEA DX,B      ; LEA used for load effective address
    INT 21H        
                
    ; Output first character
    MOV AH,2
    MOV DL,BH     ; Output the first character
    INT 21H  

    
    ; End the program
    MOV AH,4CH    ;hexa decimal value to start exit
    INT 21H   
    
MAIN ENDP         ; endp is the end procedure
END MAIN