       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID.    NAMET.
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
       77  WS-NAME-ERROR-FLAG          PIC  9(01)     COMP VALUE 0.
       77  WS-NAME                     PIC  X(30)          VALUE SPACES.
      *
       COPY NAMEW.COB.
      /
       PROCEDURE DIVISION.
      *
      *
      *             C O N T R O L   S E C T I O N
      *
       000000-CONTROL.
      *
           PERFORM 000100-PROCESS-NAME
              THRU 000100-EXIT
               UNTIL (WS-NAME = "END").
      *
       000000-EXIT.
           STOP RUN.
      *
      *                    P R O C E S S   N A M E
      *
       000100-PROCESS-NAME.
      *
           DISPLAY " ".
           DISPLAY "ENTER NAME (UP TO 30 CHARACTERS)".
           DISPLAY "123456789012345678901234567890 ('END' TO STOP)".
      *
           MOVE SPACES TO WS-NAME.
           ACCEPT WS-NAME.
      *
           IF  WS-NAME = "END"
               GO TO 000100-EXIT.
      *
      *
           MOVE WS-NAME TO NAW-NAME-WORK.
           PERFORM 006000-NAME-EDIT
              THRU 006000-EXIT
      *
           IF (WS-NAME-ERROR-FLAG = 1)
               DISPLAY "NAME INVALID"
               GO TO 000100-EXIT.
      *
      *
           MOVE WS-NAME TO NAW-NAME-WORK.
           PERFORM 006100-NAME-REVERSE
              THRU 006100-EXIT
      *
           DISPLAY NAW-NAME-WORK.
           DISPLAY "LAST:  " NAW-SPLIT-LAST.
           DISPLAY "FIRST: " NAW-SPLIT-FIRST.
           DISPLAY "PRE:   " NAW-SPLIT-PRE.
           DISPLAY "POST:  " NAW-SPLIT-POST.
      *
       000100-EXIT.
           EXIT.
      *
       COPY NAMEP.COB.
