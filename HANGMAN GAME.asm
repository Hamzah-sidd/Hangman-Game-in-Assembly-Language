.MODEL small
.STACK 100h

.DATA
   V1 DB 'H'
   V2 DB 'A'
   V3 DB 'N'
   V4 DB 'G'
   V5 DB 'M'
   V6 DB 'A'
   V7 DB 'N'
   
   HINT DB ' HINT:(_ A _ _ M _ _) $ '
   MESSAGE DB 0AH,0DH, ' ENTER YOUR WORD. BEWARE!!!, YOU HAVE MAXIMUM OF THREE LIVES!! $'
   LOSE DB 0AH,0DH, 'YOU LOSE $'
   WIN DB 0AH,0DH, 'YOU WIN!!!! CONGRATS! $'    
   COUNTER DB 52
   WRONG DB ' WRONG GUESS $'   
   LIFE1 DB 0AH,0DH, 'YOU HAVE $'
   LIFE2 DB ' LIVES LEFT $'
   
.CODE
main proc
    MOV AX, @DATA
    MOV DS, AX 
    START:
     LEA DX,HINT
     MOV AH,9
     INT 21H  
     LEA DX,MESSAGE
     MOV AH,9
     INT 21H
    
    MOV AH,1 
    INT 21H
    CMP V1,AL 
    JE CONT
    JNE LOSEMESSAGE
    
CONT:   
  MOV AH,1 
    INT 21H
    CMP V2,AL
     JE CONT1 
     JNE LOSEMESSAGE
     
CONT1:   
  MOV AH,1 
    INT 21H
    CMP V3,AL
     JE CONT2       
     JNE LOSEMESSAGE
CONT2:   
  MOV AH,1 
    INT 21H
    CMP V4,AL
     JE CONT3       
     JNE LOSEMESSAGE
CONT3:   
  MOV AH,1 
    INT 21H
    CMP V5,AL
     JE CONT4       
     JNE LOSEMESSAGE
CONT4:   
  MOV AH,1 
    INT 21H
    CMP V6,AL
     JE CONT5       
     JNE LOSEMESSAGE
CONT5:   
  MOV AH,1 
    INT 21H
    CMP V7,AL
     JE WINMESSAGE       
     JNE LOSEMESSAGE
     
LOSEMESSAGE: 
DEC [COUNTER] 
CMP [COUNTER],48
JNE LIVES


LEA DX,LOSE
MOV AH,9   
INT 21H 
JMP EXIT 

   
WINMESSAGE:
LEA DX,WIN
MOV AH,9
INT 21H  
JMP EXIT 


LIVES:
LEA DX,WRONG
MOV AH,9
INT 21H
LEA DX,LIFE1
MOV AH,9
INT 21H 

MOV DL,COUNTER
MOV AH,2
INT 21H  

LEA DX,LIFE2
MOV AH,9
INT 21H
JMP START




EXIT:


main endp
end main
