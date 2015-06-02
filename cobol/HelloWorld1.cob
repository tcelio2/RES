000700 Identification division.
000710*>=======================
000720 Program-id. HelloWorld is initial.
		Environment Division.
		input-output section.
		file-control.
		       SELECT MYFILE-2
				ASSIGN TO DISK "D:\DATADIR\MYFILE2.TXT"
				ORGANIZATION IS LINE SEQUENTIAL.
000740 Data division.
		File Section.
		FD MYFILE-2.
		 01   CL-ID PIC 9(12).
       WORKING-STORAGE SECTION.
       77   WZ-END-OF-POPFILE pic X VALUE 'Y'.
       77   WZ-PROGRAM-SELECTED pic X(80).
       77   WZ-NUMBER pic 99 VALUE 0.
       EXEC SQL INCLUDE SQLCA END-EXEC.
       01   CL-ID PIC 9(12).
       01   TEST-88.
            02 A OCCURS 100 TIMES.
               88 A1 VALUE " ".
               05 B PIC X  OCCURS 100 TIMES.
                  88 B1 VALUE "B".
               05 C PIC X  OCCURS 100 TIMES.
                  88 C1 VALUE "B".
             02 CBG030U-REC OCCURS 10000 TIMES.
             05 F-ACTION PIC X(1).
                88 F-INSERT VALUE 'I'.
       01   F-NAME PIC X(32).
       01  L-NAME PIC X(32).
       01  SV-INVENTORYID PIC 9999.
       01  WS-SQL-VARIABLES.
            03 SV-SQL-LEN PIC S9(9) COMP SYNC.
            03 SV-SQL-FC PIC S9(9) COMP SYNC.
            03 SV-SQL-STMT PIC X(4000) SYNC.
            03 SV-TABLENAME PIC X(30). 
       01   ARRAY-SQL-TEST.
      *     The variable definition for the receiving items are as below
            03 SV-ARR-MAX PIC S9(9) COMP VALUE 50.
            03 SV-ARR-CODE PIC X(30)
            OCCURS 50.
            03 SV-ARR-DESCR PIC X(250)
            OCCURS 50.
            03 SV-ARR-ROWVERSION PIC X(1)
            OCCURS 50.
            03 SV-ARR-ROWID PIC X(18)
            OCCURS 50. 
       01   SQL-RETURN-CODE PIC S9(8).
            88 SQL-NOT-FOUND Value -1.
       77   GV-FETCH-NUM PIC 9(8).
       01 I-LINEA.
            03 PIC X(145) VALUE ALL 'ABCD'.
       01 WS-DIGIT PIC S9(14)v99999.
		01 WS-DIGIT-2 PIC S9(14)v9(5).
		01 EMP-ID-DIGIT 
			PIC 9(7).
		01  EMP-ID-ALPHA REDEFINES EMP-ID-DIGIT PIC X(7).
		01  EMP-NAME PIC X(30).
		01  EMP-NAME-DETAILS REDEFINES EMP-NAME.
		    03 EMP-FNAME PIC X(10).
		    03 EMP-MNAME PIC X(10).
		    03 EMP-LNAME PIC X(10). 
		01 WS-EMP-RECORD.
			05 WS-NAME PIC X(20).
			05 WS-DOB PIC 9(8).
			05 WS-RATE PIC 9(4)V99.
000770 Linkage section.
000820 Procedure division .
       Mainline.
			EXEC SQL
			FETCH SQL1
			INTO
			EMP-FNAME : WS-DOB
			
			,WS-NAME :WS-DOB
			
			,WS-NAME : GV-FETCH-NUM
			
			,WS-NAME :WS-DOB
			
			,WS-NAME :WS-DOB
			
			,WS-NAME :WS-DOB
			
			,WS-NAME :WS-DOB
			
			END-EXEC. 
       		INITIALIZE WS-EMP-RECORD. 
			INITIALIZE WS-NAME, WS-DOB, WS-RATE.
			MOVE 1234567 TO EMP-ID-DIGIT.
			DISPLAY EMP-ID-ALPHA, EMP-ID-DIGIT. 
			MOVE 'JOHN THOMAS PAUL ' TO EMP-NAME.
			Display 'EMP-FNAME =' EMP-FNAME 'EMP-MNAME =' 
			EMP-MNAME 'EMP-LNAME = ' EMP-LNAME.   
			MOVE -2134.91021 TO WS-DIGIT.
			DISPLAY 'WS-DIGIT: ' WS-DIGIT
			MOVE -9812.3478 TO WS-DIGIT-2.
			DISPLAY 'WS-DIGIT-2: ' WS-DIGIT-2
            EXEC SQL
            DELETE 
      * DELETE FROM SIMON_CLIENT WHERE FIRST_NM = 'first name'
            FROM SIMON_CLIENT WHERE CLIENT_ID = 123
            END-EXEC.
            EXEC SQL
      * DELETE FROM SIMON_CLIENT WHERE FIRST_NM = 'first name'
            DELETE FROM SIMON_CLIENT WHERE CLIENT_ID = 123
            END-EXEC.
            DISPLAY I-LINEA.
            EXEC SQL DECLARE WSCURSOR CURSOR  FOR
            SELECT VIDEOCODE, VIDEOTITLE, VIDEOSUPPLIERCODE
            from VIDEOFILE WHERE VIDEOCODE > 50
            END-EXEC
            EXEC SQL OPEN WSCURSOR END-EXEC.
            EXEC SQL 
            FOR :SV-ARR-MAX 
            FETCH WSCURSOR 
            INTO 
            SV-ARR-CODE 
            ,SV-ARR-DESCR 
            ,SV-ARR-ROWVERSION 
            ,SV-ARR-ROWID 
            END-EXEC. 

            MOVE SQLCODE TO SQL-RETURN-CODE.

            IF SQL-NOT-FOUND 
            MOVE ZERO TO SQLCODE
            MOVE SPACES TO SQLERRMC
            COMPUTE GV-FETCH-NUM = SQLERRD(3)
            - GV-FETCH-NUM
            END-COMPUTE
            ELSE
            MOVE SQLERRD(3) TO GV-FETCH-NUM 
            END-IF.
                EVALUATE TRUE 
              WHEN (WZ-NUMBER > 0) 
              MOVE 1 TO WZ-NUMBER
              END-EVALUATE.
            EVALUATE TRUE 
            WHEN WZ-NUMBER > 0 
            MOVE 1 TO WZ-NUMBER
            END-EVALUATE.
            INSPECT WZ-END-OF-POPFILE REPLACING 
            LEADING ZEROES BY SPACE.
                   EXEC SQL
            INSERT INTO NOTETEXT 
            (
            NOTETEXTID 
            ,NOTEID 
            ,USERID 
            ,TIMESTAMP
            ,TEXT 
            ,STATUS
            ,CATEGORY1 
            ,CATEGORY2 
            ,DUEDATE
            ,ACTIONUSERID
            ) 
            VALUES 
            ( 
            :WZ-END-OF-POPFILE 
            ,:WZ-END-OF-POPFILE 
            ,:WZ-END-OF-POPFILE 
            ,:WZ-END-OF-POPFILE
            ,:WZ-END-OF-POPFILE 
            ,:WZ-END-OF-POPFILE
            ,:WZ-END-OF-POPFILE :WZ-NUMBER 
            ,:WZ-END-OF-POPFILE :WZ-NUMBER 
            ,:WZ-END-OF-POPFILE :WZ-NUMBER
            ,:WZ-END-OF-POPFILE :WZ-NUMBER
             ) end-exec.
	          EVALUATE TRUE		
	            WHEN WZ-END-OF-POPFILE NOT NUMERIC	
	            DISPLAY "Hello World2"		
	            WHEN WZ-NUMBER EQUAL TO ZEROS
	            	            DISPLAY "Hello World"	
	            WHEN WZ-NUMBER EQUAL TO ZEROS
	            DISPLAY "Hello World"		
	            WHEN WZ-NUMBER EQUAL TO ZEROS		
	            DISPLAY "Hello World2"	
	            WHEN WZ-END-OF-POPFILE NOT NUMERIC	
	            DISPLAY "Hello World2"		
	            WHEN OTHER	
	            DISPLAY "Hello World1"	
	          END-EVALUATE	.	