       Identification	division.
       Program-id.	HelloWorld	is	initial.
       ENVIRONMENT DIVISION.
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.
       01 GV-ACTION PIC X(10).
       01 WRK-DS-06V06 PIC 99999V999.
       01 WRK-DS-05V00 PIC 99999V999.
       01 WRK-DS-02V00 PIC 99999.
       Procedure division.
           DISPLAY "Hello World???".

     		PERFORM 2100-PROCESS-RECORD THRU 2199-EXIT.
 		2100-PROCESS-RECORD. 
     		GO TO.
      *
 		2110-PROCESS-HEADER.
      * code to process a file header
       	ALTER 2100-PROCESS-RECORD TO 2120-PROCESS-DETAIL.
     	GO TO 2199-EXIT.
      *
 		2120-PROCESS-DETAIL.
      * code to process a detail record 
      	DISPLAY "Hello World222".
     	GO TO 2199-EXIT.
      *
        2199-EXIT.
             EXIT.
