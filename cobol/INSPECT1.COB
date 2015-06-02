000700 Identification division.
000710*>=======================
000720 Program-id. INSPECT1 is initial.
000740 Data division.
       WORKING-STORAGE SECTION.
       77  COUNTR                PIC   9   VALUE ZERO.
       01  DATA-1                PIC X(16).
000770 Linkage section.
000820 Procedure division .
       Mainline.
			DISPLAY "Input Source:" WITH NO ADVANCING
            ACCEPT DATA-1 FROM CONSOLE
           INSPECT DATA-1 CONVERTING 
           "abcdefghijklmnopqrstuvwxyz" TO
           "ABCDEFGHIJKLMNOPQRSTUVWXYZ" BEFORE "JAVA" AFTER "COBOL".
           Display "Result is ", DATA-1
           DISPLAY "Counter is ", Countr
           Display "Result is ", DATA-1
           DISPLAY "Input Source:" WITH NO ADVANCING

           ACCEPT DATA-1 FROM CONSOLE
           COMPUTE Countr=0
           INSPECT DATA-1 TALLYING COUNTR FOR 
            ALL "S" BEFORE  "A"
            REPLACING ALL "S" BY "O" BEFORE  "A"
           DISPLAY "Counter is ", Countr
           Display "Result is ", DATA-1
           DISPLAY "Input Source:" WITH NO ADVANCING
           ACCEPT DATA-1 FROM CONSOLE
           COMPUTE Countr=0
			INSPECT DATA-1 TALLYING COUNTR FOR 
			ALL "S" BEFORE INITIAL "A"
			REPLACING ALL "S" BY "O" BEFORE INITIAL "A"
           DISPLAY "Counter is ", Countr
           Display "Result is ", DATA-1
           DISPLAY "Input Source:" WITH NO ADVANCING
           ACCEPT DATA-1 FROM CONSOLE
           COMPUTE Countr=0
           INSPECT DATA-1
             TALLYING COUNTR FOR CHARACTERS AFTER INITIAL "S"
             REPLACING ALL "A" BY "O"
           DISPLAY "Counter is ", Countr
           Display "Result is ", DATA-1
           DISPLAY "Input Source:" WITH NO ADVANCING
           ACCEPT DATA-1 FROM CONSOLE
           COMPUTE Countr=0
           INSPECT DATA-1
             TALLYING COUNTR FOR CHARACTERS AFTER "S"
             REPLACING ALL "A" BY "O"
           DISPLAY "Counter is ", Countr
           Display "Result is ", DATA-1

           DISPLAY "Input Source:" WITH NO ADVANCING
           ACCEPT DATA-1 FROM CONSOLE
           COMPUTE Countr=0
           INSPECT DATA-1
             TALLYING COUNTR FOR CHARACTERS AFTER INITIAL "S"
             REPLACING ALL "A" BY "O"
           DISPLAY "Counter is ", Countr
           Display "Result is ", DATA-1
           DISPLAY "Input Source:" WITH NO ADVANCING
           ACCEPT DATA-1 FROM CONSOLE
           COMPUTE Countr=0
           INSPECT DATA-1
             TALLYING COUNTR FOR CHARACTERS AFTER "S"
             REPLACING ALL "A" BY "O"
           DISPLAY "Counter is ", Countr
           Display "Result is ", DATA-1
 
           DISPLAY "Input Source:" WITH NO ADVANCING
           ACCEPT DATA-1 FROM CONSOLE
           COMPUTE Countr=0
            INSPECT DATA-1
             TALLYING COUNTR FOR LEADING "0"
             REPLACING FIRST "A" BY
             "2" AFTER INITIAL "C"
		   DISPLAY "Counter is ", Countr
           Display "Result is ", DATA-1
           DISPLAY "Input Source:" WITH NO ADVANCING
           ACCEPT DATA-1 FROM CONSOLE
           COMPUTE Countr=0
            INSPECT DATA-1
             TALLYING COUNTR FOR LEADING "0"
             REPLACING FIRST "A" BY
             "2" AFTER "C"
		   DISPLAY "Counter is ", Countr
           Display "Result is ", DATA-1
		   Stop Run.
