       01 GV-COMMON-AREA.                                               
          03 SQL-RETURN-CODE                 PIC S9(09) COMP-5.         
             88 SQL-OK                       VALUE 0.                   
             88 SQL-WARNING                  VALUES 1 THRU +310100.     
             88 SQL-ERROR                    VALUES -310000 THRU -1.
             88 SQL-NOT-FOUND                VALUES +100 +1403.               
             88 SQL-DEADLOCK                 VALUES -911 -913.          
             88 SQL-NULLX                    VALUE -301.
             88 SQL-DUP-KEY                  VALUES -803 -1.                
             88 SQL-KEY-CONSTRAINT           VALUES -532 -2292.
             88 SQL-KEY-CONSTRAINT-PARENT    VALUES -2291.
             88 SQL-MORE-ROWS                VALUES -811 +1422.
                                                                        
           03  ERROR-PARAM.                                             
               05 ERROR-TABLE-NAME           PIC X(18).                 
               05 ERROR-KEY                  PIC X(50).                 
               05 ERROR-ACTIVITY-TYPE        PIC X(10).                 
               05 ERROR-RECORD-TYPE          PIC X(04).                 
               05 ERROR-SQL-ERROR-IND        PIC X(01).                 
                  88 SQL-ERROR-IND           VALUE 'Y'.                 
                  88 NONSQL-ERROR-IND        VALUE 'N'.                 
               05 ERROR-NONSQL-CODE          PIC X(04).                 
                                                                        
          03 AUDIT-PARAM.                                               
             05 AUDIT-PROGRAM-ID             PIC X(08).                 
             05 AUDIT-PLAN-ID                PIC X(08).                 
             05 AUDIT-TRANS-TYPE             PIC X(02).                 
             05 AUDIT-IMAGE-TYPE             PIC X(01).                 
             05 AUDIT-REC-TYPE               PIC X(04).                 
             05 AUDIT-IMAGE-VAR.                                        
                49 AUDIT-IMAGE-LENGTH        PIC S9(4) COMP.            
                49 AUDIT-IMAGE               PIC X(1000).               
             05 AUDIT-IMAGE-VAR-X REDEFINES  AUDIT-IMAGE-VAR.           
                49 FILLER1                   PIC X(02).                 
                49 AUDIT-IMAGE-CHAR          OCCURS 1000 TIMES          
                                             PIC X(01).                 
                                                                        
          03  LOGON-ID                       PIC X(08).                 
                                                                        
          03  PROGRAM-NAME                   PIC X(08).                 
                                                                        
          03  WRITE-AUDIT-FLAG               PIC X(01).                 
              88 WRITE-AUDIT-LOG             VALUE 'Y'.                 
                                                                        
          03  WRITE-ERROR-FLAG               PIC X(01).                 
              88 WRITE-ERROR-LOG             VALUE 'Y'.                 
                                                                        
          03  GV-NO-OF-ACCOUNTS              PIC S9(07) VALUE 0.        
                                                                        
          03  GV-NO-OF-ERRORS                PIC S9(07) VALUE 0.        
                                                                        
