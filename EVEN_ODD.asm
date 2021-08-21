DATA SEGMENT
	NUMS DW 2357H,0A56H,0322H,0C91H,0000H,0953H
	COUNT DB 06H
COUNT1 DB 03H
ODD DW 3 DUP (0)
EVEN1 DW 3 DUP (0)
DATA ENDS

CODE SEGMENT
ASSUME CS: CODE, DS: DATA, ES: DATA
START: MOV AX, DATA
	   MOV DS, AX
	   MOV ES, AX
	   MOV CL, COUNT
	   LEA SI, NUMS
	   LEA DI, EVEN1
	
	AGAIN: MOV AX, [SI]
		   ROR AX, 01
		   JC ODD1
		  ROL AX, 01
	    	  MOV [DI], AX
		  ADD DI, 02
	         JMP NEXT
           ODD1:   ROL AX, 01
                        MOV [BX], AX
                        ADD BX, 02
           NEXT:   ADD SI, 02
                       DEC CL
	           JNZ AGAIN
	           MOV CL, COUNT1
             	          MOV AX, 0000H
	           MOV DX, 0000H            
	           LEA SI, EVEN1
                       LEA BX, ODD
           BACK:  ADD AX, [SI]
	           INC SI
   	           INC SI
	           ADD DX, [BX]
	           INC BX
	           INC BX
	          DEC CL
	          JNZ BACK
	
	          MOV [SI], AX
	         MOV [BX], DX
	         MOV AH, 4CH
	         INT 21H
CODE ENDS
END START
