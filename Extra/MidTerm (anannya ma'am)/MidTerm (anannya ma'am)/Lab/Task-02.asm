.MODEL SMALL
.STACK 100H
.DATA
M1 DB "Enter a character: $"                  
CHAR DB ?                                       
M3 DB 0AH,0DH, "THANK YOU. $"                  
M2 DB 0AH,0DH, "OUTPUT IS: $"              

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message                  
    MOV AH, 9                                   ; 9 is string output and AH is the higher byte
    LEA DX, M1                                  ; Load the address msg
    INT 21H                                     ; For Display call
    
    
    ; Read a character from the user
    MOV AH, 1
    INT 21H
    MOV CHAR, AL                                ; Store the entered character 
    
    ; Create a new line (Line Gap) 
    MOV AH,2
    MOV DL,13                                   ; Carry  at the first of the line
    INT 21H
    MOV DL,10                                   ; Start a new line
    INT 21H 
     
        
    ; Print a newline
    MOV AH, 9                                   ; 9 is string output and AH is the higher byte
    LEA DX, M2                                  ; Load the address msg
    INT 21H 
      
    ; Print the character 50 times
    MOV CX, 50                                  ; Set counter to 50 
    
    
LOOP_START:  
    MOV AH, 2                                   ; Interrupt  character 
    MOV DL, CHAR                                ; Load the character to print
    INT 21H
    DEC CX                                      ; Decrement counter
    JNZ LOOP_START                              ; Repeat until CX == 0
    


    ; Display message
    MOV AH, 9
    LEA DX, M3
    INT 21H

    ; End the program
    MOV AH, 4CH                                 ; Hexa decimal value to start exit
    INT 21H

MAIN ENDP                                       ; Endp is the end procedure
END MAIN
