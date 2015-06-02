      *****************************************************************
      * Execution Test for SQL translation of Apache James James Mail *
      * Server Inbox simple display.                                  *
      * Does Declare/Open Cursor, Fetch into elementary field*
      * of Inbox Structure and a simple one row display.              * 
      *****************************************************************
       IDENTIFICATION DIVISION.

       PROGRAM-ID.  INBOX-DISPLAY.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-AS400.
       OBJECT-COMPUTER. IBM-AS400.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       EXEC SQL INCLUDE SQLCA END-EXEC.
       01  input-string pic x(20).
       01  Inbox.
           02 Message-name Pic x(200).
           02 Repository-Name Pic X(100).
           02 Message-State Pic X(30).
           02 Error-Message Pic X(200).
           02 Sender Pic X(255).
      *    02 Last-Updated Pic X(200).
       01  DYN-SQL PIC X(200) Value 
              "SELECT message_name,repository_name, message_state,Error_
      -              "Message,sender FROM Inbox where repository_name=". 
       PROCEDURE DIVISION.
       A000-MAIN.
	             EXEC SQL WHENEVER SQLERROR 
	              GO TO EXIT-PROGRAM
		          END-EXEC.
	          EXEC SQL WHENEVER SQLWARNING 
	             DISPLAY "WARNING Encountered."
	          END-EXEC.
	          EXEC SQL WHENEVER NOT FOUND 
	             DISPLAY "NOT FOUND Encountered."
	          END-EXEC.
   
                 EXEC SQL
                 DECLARE C1 CURSOR FOR
                  SELECT message_name,repository_name,
                         message_state,Error_Message,sender
                  FROM Inbox
                  END-EXEC.

                  EXEC SQL
                      OPEN C1 END-EXEC.

                  EXEC SQL
                      FETCH C1
                      INTO :Message-Name,:Repository-Name,
                           :Message-State,:Error-Message,
                           :Sender
                      END-EXEC.
           

                  Display "Message-Name=" Message-Name
                          "Repository-Name=" Repository-Name
                          "Message-State=" Message-State
                          "Error-Message=" Error-Message
                          "Sender=" Sender. 
                  ACCEPT input-string.  
                  STRING dyn-sql '"' input-string '"'
                  DELIMITED BY SIZE
                  INTO dyn-sql
                  END-STRING.
                  EXEC SQL
                  PREPARE  DYN from :DYN-SQL
                  END-EXEC.
                  
                  EXEC SQL                                                     
                       DECLARE DFT3 CURSOR FOR DYN      
                  END-EXEC.
                       
                  EXEC SQL
                      OPEN DFT3                     
                  END-EXEC  
                  
                  EXEC SQL
                      FETCH DFT3
                      INTO :Message-Name,:Repository-Name,
                           :Message-State,:Error-Message,
                           :Sender
                      END-EXEC.
           
   
                  Display "Message-Name=" Message-Name
                          "Repository-Name=" Repository-Name
                          "Message-State=" Message-State
                          "Error-Message=" Error-Message
                          "Sender=" Sender.   
           EXIT-PROGRAM.
              		EXIT PROGRAM. 
 