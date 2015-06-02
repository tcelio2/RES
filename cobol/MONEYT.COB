       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID.    MONEYT.
      *
       DATE-WRITTEN.  05/27/96.
      *
      *    MODIFIED   10/18/97.
      *
      *        *******************************
      *        *                             *
      *        *     Judson D. McClendon     *
      *        *     Sun Valley Systems      *
      *        *     329 37th Court N.E.     *
      *        *     Birmingham, AL 35215    *
      *        *        205-853-8440         *
      *        *                             *
      *        *******************************
      *
       ENVIRONMENT DIVISION.
      *
       CONFIGURATION SECTION.
      *
       INPUT-OUTPUT SECTION.
      *
       FILE-CONTROL.
      *
      *
       I-O-CONTROL.
      *
       DATA DIVISION.
      *
       FILE SECTION.
      *
      *
       WORKING-STORAGE SECTION.
      *
       77  WS-AMOUNT                   PIC  9(15)V9(02) COMP VALUE 1.
      *
       COPY "MONEYW.COB".
      *
       PROCEDURE DIVISION.
      *
       000000-CONTROL.
      *
           DISPLAY  " ".
      *
           PERFORM 000100-PROCESS
              THRU 000100-EXIT
               UNTIL (WS-AMOUNT ZERO).
      *
       000000-EXIT.
           STOP RUN.
      *
      *
      *                          P R O C E S S
      *
       000100-PROCESS.
      *
           DISPLAY "C O N V E R T E D   D O L L A R   A M O U N T"
               AT LINE 1 COL 1
               WITH ERASE EOS.
           DISPLAY MW-MONEY-LINE(1)
               AT LINE 3 COL 1.
           DISPLAY MW-MONEY-LINE(2)
               AT LINE 4 COL 1.
           DISPLAY MW-MONEY-LINE(3)
               AT LINE 5 COL 1.
           DISPLAY MW-MONEY-LINE(4)
               AT LINE 6 COL 1.
           DISPLAY MW-MONEY-LINE(5)
               AT LINE 7 COL 1.
           DISPLAY MW-MONEY-LINE(6)
               AT LINE 8 COL 1.
      *
           DISPLAY "Enter up to tttbbbmmmtttooo.cc (0 to exit): "
               AT LINE 10 COL 1.
      *
           MOVE ZERO TO WS-AMOUNT.
           ACCEPT WS-AMOUNT.
      *
           MOVE WS-AMOUNT TO MW-AMOUNT.
           PERFORM 005000-MONEY
              THRU 005000-EXIT.
      *
       000100-EXIT.
           EXIT.
      *
       COPY MONEYP.COB.
