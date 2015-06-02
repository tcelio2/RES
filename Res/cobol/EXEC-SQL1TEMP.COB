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
       PROCEDURE DIVISION.

       A000-MAIN.
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

              STOP RUN.