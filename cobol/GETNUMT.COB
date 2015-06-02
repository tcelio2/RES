       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID.    GETNUMT.
      *
       DATE-WRITTEN.  04/04/90.
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
       I-O-CONTROL.
      *
       DATA DIVISION.
      *
       FILE SECTION.
      *
      *
       WORKING-STORAGE SECTION.
      *
       77  WS-ESCAPE-FLAG              PIC  9(01)     COMP VALUE 0.
       77  WS-ERR-MSG                  PIC  X(30)          VALUE SPACES.
      *
       COPY GETNUMW.COB.
      *
       SCREEN SECTION.
      *
      *
      *                     I N P U T   S C R E E N
      *
       01  INPUT-SCREEN
               FOREGROUND-COLOR 7
               BACKGROUND-COLOR 0.
           03  BLANK SCREEN
               LINE 01  COLUMN 31  VALUE "G E T   N U M B E R".
      *
           03  LINE 03  COLUMN 01  VALUE "Enter Number: ".
           03  PIC  X(25)          USING NW-WORK-NBR.
      *
      *
      *                    O U T P U T   S C R E E N
      *
       01  OUTPUT-SCREEN
               FOREGROUND-COLOR 7
               BACKGROUND-COLOR 0.
      *
           03  LINE 05  COLUMN 01  VALUE "      Result: ".
           03  PIC  -(13).9(06)    FROM  NW-EXTRACTED-NBR.
           03           COLUMN 41
               PIC  X(30)          FROM  WS-ERR-MSG.
      /
       PROCEDURE DIVISION.
      *
      *
      *             C O N T R O L   S E C T I O N
      *
       000000-CONTROL.
      *
           MOVE SPACES TO NW-WORK-NBR.
           DISPLAY INPUT-SCREEN.
      *
           PERFORM 000100-PROCESS
              THRU 000100-EXIT
               UNTIL (WS-ESCAPE-FLAG = 1).
      *
       000000-EXIT.
           STOP RUN.
      *
      *                    P R O C E S S
      *
       000100-PROCESS.
      *
           ACCEPT INPUT-SCREEN
               ON ESCAPE
                   MOVE 1 TO WS-ESCAPE-FLAG
                   GO TO 000100-EXIT.
      *
           PERFORM 003000-GET-NBR
              THRU 003000-EXIT.
      *
           IF (NW-NBR-ERROR-FLAG = 1)
               MOVE "NUMBER INVALID" TO WS-ERR-MSG
           ELSE
               MOVE SPACES           TO WS-ERR-MSG.
      *
           DISPLAY OUTPUT-SCREEN.
      *
       000100-EXIT.
           EXIT.
      *
       COPY GETNUMP.COB.
