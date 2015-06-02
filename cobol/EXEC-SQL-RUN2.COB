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
       01  DYN-SQL0 PIC X(100) Value 
              "Create Table Test_table (message_name char(200),                   
      -       "repository_name char(100), message_state char(30),
      -       "last_updated char(100))".
       01  DYN-SQL1 PIC X(100) Value 
              "insert into Test_table (message_name,                   
      -       "repository_name, message_state ,
      -       "last_updated ) values ('test1', 'test_repository','root',
      -              "'02/05/2010')". 
       01  DYN-SQL2 PIC X(100) Value 
              "SELECT message_name,                   
      -        " repository_name, message_state ,
      -        " last_updated from test_table
      -        " where message_name='test1'". 
       PROCEDURE DIVISION.
       A000-MAIN.
                  EXEC SQL EXECUTE 
                  Create Table Test_table (message_name char(200),                   
      -        repository_name char(100), message_state char(30),
      -        last_updated char(100))
                  END-EXEC.                  
                  EXEC SQL EXECUTE 
              insert into Test_table (message_name,                   
      -        repository_name, message_state ,
      -        last_updated ) values ('test1', 'test_repository','root'
      -         ,  '02/05/2010')
                  END-EXEC.                  
                  EXEC SQL
                  PREPARE  DYN from :DYN-SQL2
                  END-EXEC.
                  
                  EXEC SQL                                                     
                       DECLARE DFT3 CURSOR FOR DYN      
                  END-EXEC.
                       
                  EXEC SQL
                      OPEN DFT3                     
                  END-EXEC  
                  perform until sqlcode NOT = 0
                  EXEC SQL
                      FETCH DFT3
                      INTO :Message-Name,:Repository-Name,
                           :Message-State,:Error-Message
      *                    :Sender
                      END-EXEC
           
   
                  Display "Message-Name=" Message-Name
                          "Repository-Name=" Repository-Name
                          "Message-State=" Message-State
                          "Error-Message=" Error-Message
                          "Sender=" Sender 
                  end-perform.   
                  EXEC SQL EXECUTE 
                  DROP Table Test_table END-EXEC.  
                  EXEC SQL
                   DECLARE SQL1 CURSOR FOR
                   SELECT REPLYTOQUEUE,
                   LASTMSGTIMESTAMP
                   FROM USERSESSION
                   WHERE USERSESSIONID = :Message-Name
                   FOR UPDATE
                   END-EXEC.           
 