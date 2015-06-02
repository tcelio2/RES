      *****************************************************************
      * Execution Test for SQL translation of Apache James James Mail *
      * Server Database-Row simple display.                                  *
      * Does Declare/Open Cursor, Fetch into elementary field*
      * of Database-Row Structure and a simple one row display.              * 
      *****************************************************************
       IDENTIFICATION DIVISION.

       PROGRAM-ID.  VALIDATE-EXEC-SQL.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-AS400.
       OBJECT-COMPUTER. IBM-AS400.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT DATAFILE ASSIGN TO "VALIDATE-SQL.DAT"
              ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD DATAFILE.
       01  data-file-rec.
            02  Name pic x(30).
            02  Mailing-Address pic x(40).
            02  Employment pic x(20).
            02  Email pic x(40).
            02  DOB pic 9(12).
       WORKING-STORAGE SECTION.
       EXEC SQL INCLUDE SQLCA END-EXEC.
       01  header-line1 pic x(132) value
           "You Should See Data Lines after two Header Line.".
       01  header-line2.
            02  header-line21 pic x(30) value  "Name".
            02  header-line22 pic x(40) value  "Address".
            02  header-line23 pic x(20) value  "Employment".
            02  header-line24 pic x(40) value  "Email".
            02  header-line24 pic x(20) value  "Last Updated".
        01  header-line3.
            02  header-line21 pic x(30) value  "------------".
            02  header-line22 pic x(40) value  "------------".
            02  header-line23 pic x(20) value  "------------".
            02  header-line24 pic x(40) value  "------------".
            02  header-line24 pic x(20) value  "------------".
       01  detail-line.
            02  detail-Name pic x(29).
            02  filler pic x value "|".
            02  detail-Address pic x(39).
            02  filler pic x value "|".
            02  detail-Employment pic x(19).
            02  filler pic x value "|".
            02  detail-Email pic x(39).
            02  filler pic x value "|".
            02  detail-Updated pic x(20).
       01   RESPONSE PIC X.    
       01  DYN-SQL0 PIC X(200) Value 
              "Create Table TEST_TABLE (Name char(200),                   
      -       "Mailing_Address char(100), Employment char(30),
      -       "Email char(100),DOB int)".
       01  DYN-SQL2 PIC X(200) Value 
              "SELECT Name,                   
      -        " Mailing_Address, Employment ,Email,
      -        " DOB from test_table".
       PROCEDURE DIVISION.
       A000-MAIN.
                  DISPLAY "This program Creates a Table
      -    "with Name test_table. Proceed(Y/N)? ".
                  Accept Response
                  if response not = 'Y' then
                     Display "exiting"
                     Stop run
                  end-if.
                  DISPLAY "Drop OR Keep table on completion(D/K)? ".
                  Accept Response
                  if response not = 'D' and response not = 'K' then
                     Display "Unknown response. Dropping the table"
                     Stop run
                  end-if.
                  EXEC SQL
                  PREPARE  DYN0 from :DYN-SQL0
                  END-EXEC.
                  if sqlcode not = 0
                      display sqlerrmc goback.
                  open input datafile
                  perform 100 times                                            
                  READ DATAFILE AT END GO TO SELECT-TABLE END-READ
                  EXEC SQL
                  EXECUTE
                   insert into Test_table (Name,                   
      -       Mailing_Address, Employment , Email,
      -       DOB ) values (:Name,:Mailing-address,:Employment,
      -        :EMail,:DOB)
                  END-EXEC
                  if sqlcode not = 0
                      display sqlerrmc go to drop-table
                  end-perform.
         SELECT-TABLE.  
                  EXEC SQL COMMIT END-EXEC.                                   
                  EXEC SQL
                  PREPARE  DYN from :DYN-SQL2
                  END-EXEC.
                                                                                         
                  EXEC SQL                                                     
                       DECLARE DFT3 CURSOR FOR DYN      
                  END-EXEC.
                       
                  EXEC SQL
                      OPEN DFT3                     
                  END-EXEC
                  Display header-line1.  
                  Display header-line2.  
                  Display header-line3.  
                  perform until sqlcode NOT = 0
                  EXEC SQL
                      FETCH DFT3
                      INTO :Name,:Mailing-Address,
                           :Employment,
                           :Email, :DOB
                      END-EXEC
           
                  if sqlcode NOT=0 then
                       go to DROP-Table end-if 
                  move name to detail-name
                  move mailing-address to detail-address
                  move employment to detail-employment
                  move email to detail-email
                  move dob to detail-updated
                  Display detail-line
                  end-perform.   
           DROP-Table.
                  if response not = 'K' then
                  EXEC SQL EXECUTE 
                  DROP Table Test_table END-EXEC.
                  close datafile.             
 