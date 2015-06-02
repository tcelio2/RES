      ****************************************************************
      * A sample program which updates the salaries for those        *
      * employees whose current commission total is greater than or  *
      * equal to the value of COMMISSION. The salaries of those who  *
      * qualify are increased by the value of PERCENTAGE retroactive *
      * to RAISE-DATE. A report is generated showing the projects    *
      * which these employees have contributed to ordered by the     *
      * project number and employee ID. A second report shows each   *
      * project having an end date occurring  after RAISE-DATE       *
      * (i.e. potentially affected by the retroactive raises ) with  *
      * its total salary expenses and a count of employees who       *
      * contributed to the project.                                  *
      ****************************************************************


       IDENTIFICATION DIVISION.

       PROGRAM-ID.  CBLEX.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-AS400.
       OBJECT-COMPUTER. IBM-AS400.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT PRINTFILE ASSIGN TO PRINTER-QPRINT
              ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  PRINTFILE
           BLOCK CONTAINS 1 RECORDS
           LABEL RECORDS ARE OMITTED.
       01  PRINT-RECORD PIC X(132).

       WORKING-STORAGE SECTION.
       77  WORK-DAYS PIC S9(4) BINARY VALUE 253.
       77  RAISE-DATE PIC X(11) VALUE "1982-06-01".
       77  PERCENTAGE PIC S999V99 PACKED-DECIMAL.
       77  COMMISSION PIC S99999V99 PACKED-DECIMAL VALUE 2000.00.

      ***************************************************************
      *  Structure for report 1.                                    *
      ***************************************************************

       01  RPT1.
           COPY DDS-PROJECT OF CORPDATA-PROJECT.
           05  EMPNO     PIC X(6).
           05  NAME      PIC X(30).
           05  SALARY    PIC S9(6)V99 PACKED-DECIMAL.


      ***************************************************************
      *  Structure for report 2.                                    *
      ***************************************************************

       01  RPT2.
           15  PROJNO PIC X(6).
           15  PROJECT-NAME PIC X(36).
           15  EMPLOYEE-COUNT PIC S9(4) BINARY.
           15  TOTAL-PROJ-COST PIC S9(10)V99 PACKED-DECIMAL.
      *      EXEC SQL
      *          INCLUDE SQLCA
      *     END-EXEC.
       01 SQLCA.
           05 SQLCAID        PIC X(8).
           05 SQLCABC        PIC S9(9) BINARY.
           05 SQLCODE        PIC S9(9) BINARY.
           05 SQLERRM.
              49 SQLERRML    PIC S9(4) BINARY.
              49 SQLERRMC    PIC X(70).
           05 SQLERRP        PIC X(8).
           05 SQLERRD        OCCURS 6 TIMES
                     PIC S9(9) BINARY.
           05 SQLWARN.
              10 SQLWARN0    PIC X.
              10 SQLWARN1    PIC X.
              10 SQLWARN2    PIC X.
              10 SQLWARN3    PIC X.
              10 SQLWARN4    PIC X.
              10 SQLWARN5    PIC X.
              10 SQLWARN6    PIC X.
              10 SQLWARN7    PIC X.
              10 SQLWARN8    PIC X.
              10 SQLWARN9    PIC X.
              10 SQLWARNA    PIC X.
            05 SQLSTATE       PIC X(5).
        01 SQLDA.
           05 SQLDAID     PIC X(8).
           05 SQLDABC     PIC S9(9) BINARY.
           05 SQLN        PIC S9(4) BINARY.
           05 SQLD        PIC S9(4) BINARY.
           05 SQLVAR OCCURS 0 TO 409 TIMES DEPENDING ON SQLD.
              10 SQLTYPE   PIC S9(4) BINARY.
              10 SQLLEN    PIC S9(4) BINARY.
              10 FILLER  REDEFINES SQLLEN.
                 15 SQLPRECISION PIC X.
                 15 SQLSCALE     PIC X.
              10 SQLRES    PIC X(12).
              10 SQLDATA   POINTER.
              10 SQLIND    POINTER.
              10 SQLNAME.
                 49 SQLNAMEL PIC S9(4) BINARY.
                 49 SQLNAMEC PIC X(30).       
        77  CODE-EDIT PIC ---99.

      ***************************************************************
      *  Headers for reports.                                       *
      ***************************************************************

       01  RPT1-HEADERS.
           05  RPT1-HEADER1.
               10  FILLER PIC X(21) VALUE SPACES.
               10  FILLER PIC X(111)
                     VALUE "REPORT OF PROJECTS AFFECTED BY RAISES".
           05  RPT1-HEADER2.
               10  FILLER PIC X(9) VALUE "PROJECT".
               10  FILLER PIC X(10) VALUE "EMPID".
               10  FILLER PIC X(35) VALUE "EMPLOYEE NAME".
               10  FILLER PIC X(40) VALUE "SALARY".
       01  RPT2-HEADERS.
           05  RPT2-HEADER1.
               10  FILLER PIC X(21) VALUE SPACES.
               10  FILLER PIC X(111)
                       VALUE "ACCUMULATED STATISTICS BY PROJECT".
           05  RPT2-HEADER2.
               10  FILLER PIC X(9) VALUE "PROJECT".
               10  FILLER PIC X(38) VALUE SPACES.
               10  FILLER PIC X(16) VALUE "NUMBER OF".
               10  FILLER PIC X(10) VALUE "TOTAL".
           05  RPT2-HEADER3.
               10  FILLER PIC X(9) VALUE "NUMBER".
               10  FILLER PIC X(38) VALUE "PROJECT NAME".
               10  FILLER PIC X(16) VALUE "EMPLOYEES".
               10  FILLER PIC X(65) VALUE "COST".
       01  RPT1-DATA.
           05  PROJNO    PIC X(6).
           05  FILLER    PIC XXX VALUE SPACES.
           05  EMPNO     PIC X(6).
           05  FILLER    PIC X(4) VALUE SPACES.
           05  NAME      PIC X(30).
           05  FILLER    PIC X(3) VALUE SPACES.
           05  SALARY    PIC ZZZZZ9.99.
           05  FILLER    PIC X(96) VALUE SPACES.
       01  RPT2-DATA.
           05  PROJNO PIC X(6).
           05  FILLER PIC XXX VALUE SPACES.
           05  PROJECT-NAME PIC X(36).
           05  FILLER PIC X(4) VALUE SPACES.
           05  EMPLOYEE-COUNT PIC ZZZ9.
           05  FILLER PIC X(5) VALUE SPACES.
           05  TOTAL-PROJ-COST PIC ZZZZZZZZ9.99.
           05  FILLER PIC X(56) VALUE SPACES.

       PROCEDURE DIVISION.

       A000-MAIN.
           MOVE 1.04 TO PERCENTAGE.
           OPEN OUTPUT PRINTFILE.

      ***************************************************************
      * Update the selected employees by the new percentage. If an  *
      * error occurs during the update, ROLLBACK the changes,       *
      ***************************************************************

            EXEC SQL  
                WHENEVER SQLERROR GO TO E010-UPDATE-ERROR
           END-EXEC.
            EXEC SQL
                UPDATE CORPDATA/EMPLOYEE
                  SET SALARY = SALARY * :PERCENTAGE
                  WHERE COMM >= :COMMISSION
           END-EXEC.

      ***************************************************************
      *  Commit changes.                                            *
      ***************************************************************

            EXEC SQL
                COMMIT
           END-EXEC.

           EXEC SQL
                WHENEVER SQLERROR GO TO E020-REPORT-ERROR
           END-EXEC.

      ***************************************************************
      *  Report the updated statistics for each employee receiving  *
      *  a raise and the projects that s/he participates in         *
      ***************************************************************

      ***************************************************************
      *  Write out the header for Report 1.                         *
      ***************************************************************

           write print-record from rpt1-header1
                 before advancing 2 lines.
           write print-record from rpt1-header2
                 before advancing 1 line.
            exec sql
                declare c1 cursor for
                  SELECT DISTINCT projno, empprojact.empno,
                          lastname||", "||firstnme ,salary
                  from corpdata/empprojact, corpdata/employee
                  where empprojact.empno =employee.empno and
                        comm >= :commission
                  order by projno, empno
           end-exec.
            EXEC SQL
                OPEN C1
           END-EXEC.

           PERFORM B000-GENERATE-REPORT1 THRU B010-GENERATE-REPORT1-EXIT
               UNTIL SQLCODE NOT EQUAL TO ZERO.
   10  A100-DONE1.
           EXEC SQL
                CLOSE C1
           END-EXEC.

      *************************************************************
      *  For all projects ending at a date later than the RAISE-  *
      *  DATE ( i.e. those projects potentially affected by the   *
      *  salary raises generate a report containing the project   *
      *  project number, project name, the count of employees     *
      *  participating in the project and the total salary cost   *
      *  for the project                                          *
      *************************************************************


      ***************************************************************
      *  Write out the header for Report 2.                         *
      ***************************************************************

           MOVE SPACES TO PRINT-RECORD.
           WRITE PRINT-RECORD BEFORE ADVANCING 2 LINES.
           WRITE PRINT-RECORD FROM RPT2-HEADER1
                 BEFORE ADVANCING 2 LINES.
           WRITE PRINT-RECORD FROM RPT2-HEADER2
                 BEFORE ADVANCING 1 LINE.
           WRITE PRINT-RECORD FROM RPT2-HEADER3
                 BEFORE ADVANCING 2 LINES.

           EXEC SQL
                 DECLARE C2 CURSOR FOR
                  SELECT EMPPROJACT.PROJNO, PROJNAME, COUNT(*),
                         SUM ( (DAYS(EMENDATE)-DAYS(EMSTDATE)) *
                         EMPTIME * DECIMAL((SALARY / :WORK-DAYS),8,2))
                  FROM CORPDATA/EMPPROJACT, CORPDATA/PROJECT,
                       CORPDATA/EMPLOYEE
                  WHERE EMPPROJACT.PROJNO=PROJECT.PROJNO AND
                        EMPPROJACT.EMPNO =EMPLOYEE.EMPNO AND
                        PRENDATE > :RAISE-DATE
                  GROUP BY EMPPROJACT.PROJNO, PROJNAME
                  ORDER BY 1
           END-EXEC.
           EXEC SQL
                OPEN C2
           END-EXEC.

           PERFORM C000-GENERATE-REPORT2 THRU C010-GENERATE-REPORT2-EXIT
                UNTIL SQLCODE NOT EQUAL TO ZERO.

       A200-DONE2.
           EXEC SQL
                CLOSE C2
           END-EXEC.

      ***************************************************************
      *  All done.                                                  *
      ***************************************************************

       A900-MAIN-EXIT.
           CLOSE PRINTFILE.
           STOP RUN.
      ***************************************************************
      *  Fetch and write the rows to PRINTFILE.                     *
      ***************************************************************

       B000-GENERATE-REPORT1.
            EXEC SQL
                WHENEVER NOT FOUND GO TO A100-DONE1
           END-EXEC.
            EXEC SQL
                FETCH C1 INTO :RPT2.PROJNO, :RPT1.EMPNO,
                              :RPT1.NAME, :RPT1.SALARY
           END-EXEC.
           MOVE CORRESPONDING RPT1 TO RPT1-DATA.
      *    MOVE PROJNO OF RPT1 TO PROJNO OF RPT1-DATA.
           WRITE PRINT-RECORD FROM RPT1-DATA
                 BEFORE ADVANCING 1 LINE.

       B010-GENERATE-REPORT1-EXIT.
           EXIT.

      ***************************************************************
      *  Fetch and write the rows to PRINTFILE.                     *
      ***************************************************************

       C000-GENERATE-REPORT2.
           EXEC SQL
                WHENEVER NOT FOUND GO TO A200-DONE2
           END-EXEC.
            EXEC SQL
                FETCH C2 INTO :RPT2
           END-EXEC.
           MOVE CORRESPONDING RPT2 TO RPT2-DATA.
           WRITE PRINT-RECORD FROM RPT2-DATA
                 BEFORE ADVANCING 1 LINE.

       C010-GENERATE-REPORT2-EXIT.
           EXIT.

      ***************************************************************
      *  Error occured while updating table.  Inform user and       *
      *  rollback changes.                                          *
      ***************************************************************

       E010-UPDATE-ERROR.
            EXEC SQL
                WHENEVER SQLERROR CONTINUE
           END-EXEC.
           MOVE SQLCODE TO CODE-EDIT.
           STRING "*** ERROR Occurred while updating table.  SQLCODE="
                 CODE-EDIT DELIMITED BY SIZE INTO PRINT-RECORD.
           WRITE PRINT-RECORD.
            EXEC SQL
                ROLLBACK
           END-EXEC.
           STOP RUN.

      ***************************************************************
      *  Error occured while generating reports.  Inform user and   *
      *  exit.                                                      *
      ***************************************************************

       E020-REPORT-ERROR.
           MOVE SQLCODE TO CODE-EDIT.
           STRING "*** ERROR Occurred while generating reports.  SQLCODE
      -           "=" CODE-EDIT DELIMITED BY SIZE INTO PRINT-RECORD.
           WRITE PRINT-RECORD.
           STOP RUN.