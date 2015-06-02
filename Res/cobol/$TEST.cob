       Identification	division.
       Program-id.	HelloWorld	is	initial.
       ENVIRONMENT DIVISION.
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.
		01  WS-ANUM            PICTURE X(10) VALUE LOW-VALUE.
		01 I PIC X(2).
       Procedure division.
       		MOVE FUNCTION MAX("R", I, "I", "a") TO WS-ANUM
           DISPLAY "Hello World???",WS-ANUM.
           