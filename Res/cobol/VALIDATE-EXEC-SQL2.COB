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
           SELECT DATAFILE ASSIGN TO "VALIDATE-SQL.DAT".

       DATA DIVISION.
       FILE SECTION.
       FD DATAFILE.
       01  data-file-rec.
            02  detail-Name pic x(29).
            02  filler pic x.
            02  detail-Address pic x(39).
            02  filler pic x .
            02  detail-Employment pic x(19).
            02  filler pic x .
            02  detail-Email pic x(39).
            02  filler pic x .
            02  detail-Updated pic x(20).
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
           
       01  Database-Row.
           02 Name Pic x(200).                                                                                  
           02 Mailing-Address Pic X(100).
           02 Employment Pic X(30).
           02 Employer Pic X(200).
           02 Email Pic X(255).
           02 DOB Pic 9(12).
           
       01  DYN-SQL0 PIC X(200) Value 
              "Create Table Test_table (Name char(200),                   
      -       "Mailing_Address char(100), Employment char(30),
      -       "Employer char(200), Email char(100),DOB int(12))".
       01  DYN-SQL2 PIC X(200) Value 
              "SELECT Name,                   
      -        " Mailing_Address, Employment ,employer, Email,
      -        " DOB from test_table
      -        " where Name LIke '%RES%' ". 
       PROCEDURE DIVISION.
       A000-MAIN.
                  EXEC SQL
                  PREPARE  DYN0 from :DYN-SQL0
                  END-EXEC.
                  open input datafile.
                  perform 100 times                                            
                  Display "name=" with no advancing
                  Accept Name
                  if name = spaces go to select-table end-if
                  Display "Address=" with no advancing
                  Accept Mailing-address
                  if Mailing-address = spaces go to select-table end-if
                  Display "Employment Notes=" with no advancing
                  Accept Employment
                  if Employment = spaces go to select-table end-if
                  Display "Employer=" with no advancing
                  Accept Employer
                  if Employer = spaces go to select-table  end-if
                  Display "Email=" with no advancing
                  Accept EMail
                  if EMail = spaces go to select-table  end-if
                  Display "Date Of Birth=" with no advancing
                  Accept DOB
                  if DOB = ZEROS go to select-table end-if
                  EXEC SQL
                   insert into Test_table (Name,                   
      -       Mailing_Address, Employment ,employer, Email,
      -       DOB ) values (:Name,:Mailing-address,:Employment,
      -        :Employer,:EMail,:DOB)
                  END-EXEC
                  end-perform.
         SELECT-TABLE.                                     
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
                  perform until sqlcode NOT = 0
                  EXEC SQL
                      FETCH DFT3
                      INTO :Name,:Mailing-Address,
                           :Employment,:Employer,
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
                  EXEC SQL EXECUTE 
                  DROP Table Test_table END-EXEC.             
 