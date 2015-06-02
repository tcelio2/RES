       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID.    DATET.
      *
       DATE-WRITTEN.  04/10/89.
      *
      *    MODIFIED   12/26/95.
      *               07/31/97.
      *               10/18/97.
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
       WORKING-STORAGE SECTION.
      *
      ******************************************************************
      *                                                                *
      *                             7 7 ' S                            *
      *                                                                *
      ******************************************************************
      *
       77  WS-ANSWER                   PIC  X(01)           VALUE SPACE.
       77  WS-ESCAPE-FLAG              PIC  9(01)           VALUE 0.
      *
      ******************************************************************
      *                                                                *
      *                 S C R E E N   H O L D   A R E A                *
      *                                                                *
      ******************************************************************
      *
       01  SCREEN-HOLD-AREA.
           03  SH-EDIT-DATE            PIC  X(08)  VALUE SPACES.
      *
           03  SH-WORK-MMDDYYYY        PIC  9(08)  VALUE 0.
           03  SH-WORK-MMDDYYYY-ALPHA  REDEFINES SH-WORK-MMDDYYYY.
               05  SH-WORK-MONTH           PIC  9(02).
               05  SH-WORK-DAY             PIC  9(02).
               05  SH-WORK-YEAR            PIC  9(04).
      *
           03  SH-WORK-YYYYMMDD        PIC  9(08)  VALUE 0.
           03  SH-WORK-YYYYMMDD-ALPHA  REDEFINES SH-WORK-YYYYMMDD.
               05  SH-WORK-YYYY            PIC  9(04).
               05  SH-WORK-MM              PIC  9(02).
               05  SH-WORK-DD              PIC  9(02).
      *
           03  SH-JUL-DATE             PIC  9(07)  VALUE 0.
           03  SH-JUL-DATE-ALPHA       REDEFINES SH-JUL-DATE.
               05  SH-JUL-YYYY             PIC  9(04).
               05  SH-JUL-DDD              PIC  9(03).
      *
           03  SH-BEG-YYYYMMDD         PIC  9(08)  VALUE 0.
           03  SH-BEG-YYYYMMDD-ALPHA   REDEFINES SH-BEG-YYYYMMDD.
               05  SH-BEG-YYYY             PIC  9(04).
               05  SH-BEG-MM               PIC  9(02).
               05  SH-BEG-DD               PIC  9(02).
      *
           03  SH-END-YYYYMMDD         PIC  9(08)  VALUE 0.
           03  SH-END-YYYYMMDD-ALPHA   REDEFINES SH-END-YYYYMMDD.
               05  SH-END-YYYY             PIC  9(04).
               05  SH-END-MM               PIC  9(02).
               05  SH-END-DD               PIC  9(02).
      *
           03  SH-OFFSET               PIC S9(08)  VALUE 0.
           03  SH-AGE-YEARS            PIC  9(04)  VALUE 0.
           03  SH-AGE-MONTHS           PIC  9(02)  VALUE 0.
           03  SH-AGE-DAYS             PIC  9(02)  VALUE 0.
           03  SH-AGE-TOTDAYS          PIC  9(08)  VALUE 0.
      *
           03  SH-YEARS                PIC S9(07)  VALUE 0.
           03  SH-MONTHS               PIC S9(07)  VALUE 0.
           03  SH-DAYS                 PIC S9(07)  VALUE 0.
      *
           03  SH-RESULT               PIC  X(20)  VALUE SPACES.
      *
       COPY DATEW.COB.
      *
      *
      *  ** WEEKDAY NAMES **
      *
           03  DW-DAY-NAMES        VALUE "SUNMONTUEWEDTHUFRISAT".
               05  DW-DAY-NAME             OCCURS 7 TIMES
                                               PIC  X(03).
      *
       SCREEN SECTION.
      *
      *
      *                      M E N U   S C R E E N
      *
       01  MENU-SCREEN.
           03  BLANK SCREEN.
           03  LINE 01  COLUMN 21  VALUE
               "D A T E   R O U T I N E    T E S T".
      *
           03  LINE 03  COLUMN 10  VALUE "Press: A =  Date Edit".
           03  LINE 04  COLUMN 17  VALUE "B =  Date days".
           03  LINE 05  COLUMN 17  VALUE "C =  Weekday".
           03  LINE 06  COLUMN 17  VALUE "D =  Add Days".
           03  LINE 07  COLUMN 17  VALUE "E =  Sub Days".
           03  LINE 08  COLUMN 17  VALUE "F =  Add Months".
           03  LINE 09  COLUMN 17  VALUE "G =  Sub Months".
           03  LINE 10  COLUMN 17  VALUE "H =  Add Years".
           03  LINE 11  COLUMN 17  VALUE "I =  Sub Years".
           03  LINE 03  COLUMN 37  VALUE "J =  Calc Offset".
           03  LINE 04  COLUMN 37  VALUE "K =  Compute Age".
           03  LINE 05  COLUMN 37  VALUE "L =  Greg to Jul".
           03  LINE 06  COLUMN 37  VALUE "M =  Jul to Greg".
           03  LINE 07  COLUMN 37  VALUE "N =  Add Days, Business".
           03  LINE 12  COLUMN 25  VALUE "Esc =  Exit: ".
           03  PIC  X              TO WS-ANSWER  AUTO.
      *
      *
      *                  I N P U T   S C R E E N S
      *
      *
      *                  G E T   E D I T   D A T E
      *
       01  GET-EDIT-DATE-SCREEN.
           03  LINE 14  COLUMN 10  VALUE "Date (MMDDYYYY): ".
           03  PIC  X(08)          USING SH-EDIT-DATE.
      *
      *
      *              G E T   W O R K   M M D D Y Y Y Y
      *
       01  GET-WORK-MMDDYYYY-SCREEN.
           03  LINE 14  COLUMN 10  VALUE "Date (MM/DD/YYYY): ".
           03  PIC  99/99/9999     USING SH-WORK-MMDDYYYY.
      *
      *
      *              G E T   W O R K   Y Y Y Y M M D D
      *
       01  GET-WORK-YYYYMMDD-SCREEN.
           03  LINE 14  COLUMN 10  VALUE "Date (YYYY/MM/DD): ".
           03  PIC  9999/99/99     USING SH-WORK-YYYYMMDD.
      *
      *
      *                G E T   J U L   Y Y Y Y D D D
      *
       01  GET-JUL-YYYYDDD-SCREEN.
           03  LINE 14  COLUMN 10  VALUE "Julian Date (YYYY/DDD): ".
           03  PIC  9999/999       USING SH-JUL-DATE.
      *
      *
      *                  G E T   D A T E   D A Y S
      *
       01  GET-DATE-DAYS-SCREEN.
           03  LINE 14  COLUMN 10  VALUE "Date (YYYY/MM/DD): ".
           03  PIC  9999/99/99     USING SH-WORK-YYYYMMDD.
           03  LINE 16  COLUMN 10  VALUE "Days: ".
           03  PIC  ZZZZZZ         USING SH-DAYS.
      *
      *
      *                G E T   D A T E   M O N T H S
      *
       01  GET-DATE-MONTHS-SCREEN.
           03  LINE 14  COLUMN 10  VALUE "Date (YYYY/MM/DD): ".
           03  PIC  9999/99/99     USING SH-WORK-YYYYMMDD.
           03  LINE 16  COLUMN 10  VALUE "Months: ".
           03  PIC  ZZZZZZ         USING SH-MONTHS.
      *
      *
      *                 G E T   D A T E   Y E A R S
      *
       01  GET-DATE-YEARS-SCREEN.
           03  LINE 14  COLUMN 10  VALUE "Date (YYYY/MM/DD): ".
           03  PIC  9999/99/99     USING SH-WORK-YYYYMMDD.
           03  LINE 16  COLUMN 10  VALUE "Years: ".
           03  PIC  ZZZZ           USING SH-YEARS.
      *
      *
      *                G E T   D A T E   O F F S E T
      *
       01  GET-DATE-OFFSET-SCREEN.
           03  LINE 14  COLUMN 10  VALUE "Date (YYYY/MM/DD): ".
           03  PIC  9999/99/99     USING SH-WORK-YYYYMMDD.
           03  LINE 16  COLUMN 10  VALUE "Offset (ÒYYYY/MM/DD): ".
           03  PIC -9999/99/99     USING SH-OFFSET.
      *
      *
      *              G E T   B E G / E N D   D A T E S
      *
       01  GET-BEG-END-YYYYMMDD-SCREEN.
           03  LINE 14  COLUMN 10  VALUE "Begin Date (YYYY/MM/DD): ".
           03  PIC  9999/99/99     USING SH-BEG-YYYYMMDD.
           03  LINE 16  COLUMN 10  VALUE "End Date (YYYY/MM/DD): ".
           03  PIC  9999/99/99     USING SH-END-YYYYMMDD.
      *
      *
      *                 O U T P U T   S C R E E N S
      *
      *
      *                    S H O W   R E S U L T
      *
       01  SHOW-RESULT-SCREEN.
           03  LINE 18  COLUMN 20
               PIC  X(20)          FROM  SH-RESULT.
      *
      *
      *                 S H O W   D A T E   D A Y S
      *
       01  SHOW-DATE-DAYS-SCREEN.
           03  LINE 18  COLUMN 20  VALUE "Date Day: ".
           03  PIC  Z,ZZZ,ZZ9      FROM  SH-DAYS.
      *
      *
      *                  S H O W   N E W   D A T E
      *
       01  SHOW-NEW-DATE-SCREEN.
           03  LINE 18  COLUMN 20  VALUE "New Date: ".
           03  PIC  9999/99/99     FROM  SH-WORK-YYYYMMDD.
      *
      *
      *                       S H O W   A G E
      *
       01  SHOW-AGE-SCREEN.
           03  LINE 18  COLUMN 20  VALUE "Years:  ".
           03  PIC  Z,ZZZ,ZZZ      FROM  SH-AGE-YEARS.
           03  LINE 19  COLUMN 20  VALUE "Months: ".
           03  PIC  Z,ZZZ,ZZZ      FROM  SH-AGE-MONTHS.
           03  LINE 20  COLUMN 20  VALUE "Days:   ".
           03  PIC  Z,ZZZ,ZZZ      FROM  SH-AGE-DAYS.
           03  LINE 22  COLUMN 20  VALUE "Days Only: ".
           03  PIC  ZZ,ZZZ,ZZZ     FROM  SH-AGE-TOTDAYS.
      *
      *
      *               S H O W   J U L   Y Y Y Y D D D
      *
       01  SHOW-JUL-YYYYDDD-SCREEN.
           03  LINE 18  COLUMN 10  VALUE "Julian Date: ".
           03  PIC  9999/999       FROM  SH-JUL-DATE.
      *
      *
      *                  S H O W   Y Y Y Y M M D D
      *
       01  SHOW-YYYYMMDD-SCREEN.
           03  LINE 18  COLUMN 10  VALUE "Date (YYYY/MM/DD): ".
           03  PIC  9999/99/99     FROM  SH-WORK-YYYYMMDD.
      *
      *
      *                  S H O W   M M D D Y Y Y Y
      *
       01  SHOW-MMDDYYYY-SCREEN.
           03  LINE 18  COLUMN 10  VALUE "Date (MM/DD/YYYY): ".
           03  PIC  99/99/9999     FROM  SH-WORK-MMDDYYYY.
      *
       PROCEDURE DIVISION.
      *
      *
      *                        C O N T R O L
      *
       000000-CONTROL.
      *
           PERFORM 000100-PROCESS
              THRU 000100-EXIT
               UNTIL (WS-ESCAPE-FLAG = 1).
      *
       000000-EXIT.
           STOP RUN.
      *
      *
      *                        P R O C E S S
      *
       000100-PROCESS.
      *
           MOVE SPACE TO WS-ANSWER.
           DISPLAY MENU-SCREEN.
           ACCEPT MENU-SCREEN
               ON ESCAPE
                   MOVE 1 TO WS-ESCAPE-FLAG
                   GO TO 000100-EXIT.
           INSPECT WS-ANSWER
               CONVERTING "abcdefghijklmnopqrstuvwxyz"
                       TO "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
      *
           INITIALIZE SCREEN-HOLD-AREA.
      *
           IF (WS-ANSWER = "A")
               PERFORM 010000-DATE-EDIT
                  THRU 010000-EXIT
           ELSE
           IF (WS-ANSWER = "B")
               PERFORM 020000-DATE-DAYS
                  THRU 020000-EXIT
           ELSE
           IF (WS-ANSWER = "C")
               PERFORM 030000-WEEKDAY
                  THRU 030000-EXIT
           ELSE
           IF (WS-ANSWER = "D")
               PERFORM 040000-ADD-DAYS
                  THRU 040000-EXIT
           ELSE
           IF (WS-ANSWER = "E")
               PERFORM 050000-SUBTRACT-DAYS
                  THRU 050000-EXIT
           ELSE
           IF (WS-ANSWER = "F")
               PERFORM 060000-ADD-MONTHS
                  THRU 060000-EXIT
           ELSE
           IF (WS-ANSWER = "G")
               PERFORM 070000-SUBTRACT-MONTHS
                  THRU 070000-EXIT
           ELSE
           IF (WS-ANSWER = "H")
               PERFORM 080000-ADD-YEARS
                  THRU 080000-EXIT
           ELSE
           IF (WS-ANSWER = "I")
               PERFORM 090000-SUBTRACT-YEARS
                  THRU 090000-EXIT
           ELSE
           IF (WS-ANSWER = "J")
               PERFORM 100000-CALC-OFFSET
                  THRU 100000-EXIT
           ELSE
           IF (WS-ANSWER = "K")
               PERFORM 110000-COMPUTE-AGE
                  THRU 110000-EXIT
           ELSE
           IF (WS-ANSWER = "L")
               PERFORM 120000-GREG-JUL
                  THRU 120000-EXIT
           ELSE
           IF (WS-ANSWER = "M")
               PERFORM 130000-JUL-GREG
                  THRU 130000-EXIT
           ELSE
           IF (WS-ANSWER = "N")
               PERFORM 140000-ADD-DAYS-BUSINESS
                  THRU 140000-EXIT.
      *
           MOVE 0 TO WS-ESCAPE-FLAG.
      *
       000100-EXIT.
           EXIT.
      *
       COPY DATEP.COB.
      *
      *
      *                 T E S T   D A T E   E D I T
      *
       010000-DATE-EDIT.
      *
           DISPLAY GET-EDIT-DATE-SCREEN.
           ACCEPT GET-EDIT-DATE-SCREEN
               ON ESCAPE
                   GO TO 010000-EXIT.
      *
           MOVE SH-EDIT-DATE TO DW-WORK-DATE-ALPHA.
      *
           PERFORM 001000-DATE-EDIT
              THRU 001000-EXIT.
      *
           IF (DW-DATE-ERROR-FLAG = 0)
               MOVE "DATE VALID"   TO SH-RESULT
           ELSE
               MOVE "DATE INVALID" TO SH-RESULT.
           DISPLAY SHOW-RESULT-SCREEN.
      *
           GO TO 010000-DATE-EDIT.
      *
       010000-EXIT.
           EXIT.
      *
      *
      *                 T E S T   D A T E   D A Y S
      *
       020000-DATE-DAYS.
      *
           DISPLAY GET-WORK-YYYYMMDD-SCREEN.
           ACCEPT GET-WORK-YYYYMMDD-SCREEN
               ON ESCAPE
                   GO TO 020000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
      *
           PERFORM 001100-DATE-DAYS
              THRU 001100-EXIT.
      *
           MOVE DW-DAYS TO SH-DAYS.
           DISPLAY SHOW-DATE-DAYS-SCREEN.
      *
           GO TO 020000-DATE-DAYS.
      *
       020000-EXIT.
           EXIT.
      *
      *
      *                   T E S T   W E E K D A Y
      *
       030000-WEEKDAY.
      *
           DISPLAY GET-WORK-YYYYMMDD-SCREEN.
           ACCEPT GET-WORK-YYYYMMDD-SCREEN
               ON ESCAPE
                   GO TO 030000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
      *
           PERFORM 001200-WEEKDAY
              THRU 001200-EXIT.
      *
           MOVE DW-DAY-NAME(DW-WEEKDAY) TO SH-RESULT.
           DISPLAY SHOW-RESULT-SCREEN.
      *
           GO TO 030000-WEEKDAY.
      *
       030000-EXIT.
           EXIT.
      *
      *
      *                  T E S T   A D D   D A Y S
      *
       040000-ADD-DAYS.
      *
           DISPLAY GET-DATE-DAYS-SCREEN.
           ACCEPT GET-DATE-DAYS-SCREEN
               ON ESCAPE
                   GO TO 040000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
           MOVE SH-DAYS      TO DW-DAYS.
      *
           PERFORM 001300-ADD-DAYS
              THRU 001300-EXIT.
      *
           MOVE DW-WORK-YYYY TO SH-WORK-YYYY.
           MOVE DW-WORK-MM   TO SH-WORK-MM.
           MOVE DW-WORK-DD   TO SH-WORK-DD.
           DISPLAY SHOW-NEW-DATE-SCREEN.
      *
           GO TO 040000-ADD-DAYS.
      *
       040000-EXIT.
           EXIT.
      *
      *
      *             T E S T   S U B T R A C T   D A Y S
      *
       050000-SUBTRACT-DAYS.
      *
           MOVE 0 TO DW-DAYS.
           DISPLAY GET-DATE-DAYS-SCREEN.
           ACCEPT GET-DATE-DAYS-SCREEN
               ON ESCAPE
                   GO TO 050000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
           MOVE SH-DAYS      TO DW-DAYS.
      *
           PERFORM 001400-SUBTRACT-DAYS
              THRU 001400-EXIT.
      *
           MOVE DW-WORK-YYYY TO SH-WORK-YYYY.
           MOVE DW-WORK-MM   TO SH-WORK-MM.
           MOVE DW-WORK-DD   TO SH-WORK-DD.
           DISPLAY SHOW-NEW-DATE-SCREEN.
      *
           GO TO 050000-SUBTRACT-DAYS.
      *
       050000-EXIT.
           EXIT.
      *
      *
      *                  T E S T   A D D   M O N T H S
      *
       060000-ADD-MONTHS.
      *
           DISPLAY GET-DATE-MONTHS-SCREEN.
           ACCEPT GET-DATE-MONTHS-SCREEN
               ON ESCAPE
                   GO TO 060000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
           MOVE SH-MONTHS    TO DW-MONTHS.
      *
           PERFORM 001500-ADD-MONTHS
              THRU 001500-EXIT.
      *
           MOVE DW-WORK-YYYY TO SH-WORK-YYYY.
           MOVE DW-WORK-MM   TO SH-WORK-MM.
           MOVE DW-WORK-DD   TO SH-WORK-DD.
           DISPLAY SHOW-NEW-DATE-SCREEN.
      *
           GO TO 060000-ADD-MONTHS.
      *
       060000-EXIT.
           EXIT.
      *
      *
      *             T E S T   S U B T R A C T   M O N T H S
      *
       070000-SUBTRACT-MONTHS.
      *
           MOVE 0 TO DW-MONTHS.
           DISPLAY GET-DATE-MONTHS-SCREEN.
           ACCEPT GET-DATE-MONTHS-SCREEN
               ON ESCAPE
                   GO TO 070000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
           MOVE SH-MONTHS    TO DW-MONTHS.
      *
           PERFORM 001600-SUBTRACT-MONTHS
              THRU 001600-EXIT.
      *
           MOVE DW-WORK-YYYY TO SH-WORK-YYYY.
           MOVE DW-WORK-MM   TO SH-WORK-MM.
           MOVE DW-WORK-DD   TO SH-WORK-DD.
           DISPLAY SHOW-NEW-DATE-SCREEN.
      *
           GO TO 070000-SUBTRACT-MONTHS.
      *
       070000-EXIT.
           EXIT.
      *
      *
      *                 T E S T   A D D   Y E A R S
      *
       080000-ADD-YEARS.
      *
           DISPLAY GET-DATE-YEARS-SCREEN.
           ACCEPT GET-DATE-YEARS-SCREEN
               ON ESCAPE
                   GO TO 080000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
           MOVE SH-YEARS     TO DW-YEARS.
      *
           PERFORM 001700-ADD-YEARS
              THRU 001700-EXIT.
      *
           MOVE DW-WORK-YYYY TO SH-WORK-YYYY.
           MOVE DW-WORK-MM   TO SH-WORK-MM.
           MOVE DW-WORK-DD   TO SH-WORK-DD.
           DISPLAY SHOW-NEW-DATE-SCREEN.
      *
           GO TO 080000-ADD-YEARS.
      *
       080000-EXIT.
           EXIT.
      *
      *
      *            T E S T   S U B T R A C T   Y E A R S
      *
       090000-SUBTRACT-YEARS.
      *
           MOVE 0 TO DW-YEARS.
           DISPLAY GET-DATE-YEARS-SCREEN.
           ACCEPT GET-DATE-YEARS-SCREEN
               ON ESCAPE
                   GO TO 090000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
           MOVE SH-YEARS     TO DW-YEARS.
      *
           PERFORM 001800-SUBTRACT-YEARS
              THRU 001800-EXIT.
      *
           MOVE DW-WORK-YYYY TO SH-WORK-YYYY.
           MOVE DW-WORK-MM   TO SH-WORK-MM.
           MOVE DW-WORK-DD   TO SH-WORK-DD.
           DISPLAY SHOW-NEW-DATE-SCREEN.
      *
           GO TO 090000-SUBTRACT-YEARS.
      *
       090000-EXIT.
           EXIT.
      *
      *
      *                    C A L C   O F F S E T
      *
       100000-CALC-OFFSET.
      *
           DISPLAY GET-DATE-OFFSET-SCREEN.
           ACCEPT GET-DATE-OFFSET-SCREEN
               ON ESCAPE
                   GO TO 100000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
           MOVE SH-OFFSET    TO DW-OFFSET.
      *
           PERFORM 001900-CALC-OFFSET
              THRU 001900-EXIT.
      *
           MOVE DW-WORK-YYYY TO SH-WORK-YYYY.
           MOVE DW-WORK-MM   TO SH-WORK-MM.
           MOVE DW-WORK-DD   TO SH-WORK-DD.
           DISPLAY SHOW-NEW-DATE-SCREEN.
      *
           GO TO 100000-CALC-OFFSET.
      *
       100000-EXIT.
           EXIT.
      *
      *
      *               T E S T   C O M P U T E   A G E
      *
       110000-COMPUTE-AGE.
      *
           DISPLAY GET-BEG-END-YYYYMMDD-SCREEN.
           ACCEPT GET-BEG-END-YYYYMMDD-SCREEN
               ON ESCAPE
                   GO TO 110000-EXIT.
      *
           MOVE SH-BEG-YYYY TO DW-BEG-YYYY.
           MOVE SH-BEG-MM   TO DW-BEG-MM.
           MOVE SH-BEG-DD   TO DW-BEG-DD.
      *
           MOVE SH-END-YYYY TO DW-END-YYYY.
           MOVE SH-END-MM   TO DW-END-MM.
           MOVE SH-END-DD   TO DW-END-DD.
      *
           PERFORM 002000-COMPUTE-AGE
              THRU 002000-EXIT.
      *
           MOVE DW-AGE-YEARS   TO SH-AGE-YEARS.
           MOVE DW-AGE-MONTHS  TO SH-AGE-MONTHS.
           MOVE DW-AGE-DAYS    TO SH-AGE-DAYS.
           MOVE DW-AGE-TOTDAYS TO SH-AGE-TOTDAYS.
           DISPLAY SHOW-AGE-SCREEN.
      *
           GO TO 110000-COMPUTE-AGE.
      *
       110000-EXIT.
           EXIT.
      *
      *
      *                    G R E G   T O   J U L
      *
       120000-GREG-JUL.
      *
           DISPLAY GET-WORK-YYYYMMDD-SCREEN.
           ACCEPT GET-WORK-YYYYMMDD-SCREEN
               ON ESCAPE
                   GO TO 120000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
      *
           PERFORM 002100-GREG-JUL
              THRU 002100-EXIT.
      *
           MOVE DW-JUL-DATE TO SH-JUL-DATE.
           DISPLAY SHOW-JUL-YYYYDDD-SCREEN.
      *
           GO TO 120000-GREG-JUL.
      *
       120000-EXIT.
           EXIT.
      *
      *
      *                    J U L   T O   G R E G
      *
       130000-JUL-GREG.
      *
           DISPLAY GET-JUL-YYYYDDD-SCREEN.
           ACCEPT GET-JUL-YYYYDDD-SCREEN
               ON ESCAPE
                   GO TO 130000-EXIT.
      *
           MOVE SH-JUL-DATE TO DW-JUL-DATE.
      *
           PERFORM 002200-JUL-GREG
              THRU 002200-EXIT.
      *
           MOVE DW-WORK-YYYY TO SH-WORK-YYYY.
           MOVE DW-WORK-MM   TO SH-WORK-MM.
           MOVE DW-WORK-DD   TO SH-WORK-DD.
           DISPLAY SHOW-YYYYMMDD-SCREEN.
      *
           GO TO 130000-JUL-GREG.
      *
       130000-EXIT.
           EXIT.
      *
      *
      *         T E S T   A D D   D A Y S   B U S I N E S S
      *
       140000-ADD-DAYS-BUSINESS.
      *
           DISPLAY GET-DATE-DAYS-SCREEN.
           ACCEPT GET-DATE-DAYS-SCREEN
               ON ESCAPE
                   GO TO 140000-EXIT.
      *
           MOVE SH-WORK-YYYY TO DW-WORK-YYYY.
           MOVE SH-WORK-MM   TO DW-WORK-MM.
           MOVE SH-WORK-DD   TO DW-WORK-DD.
           MOVE SH-DAYS      TO DW-DAYS.
      *
           PERFORM 002300-ADD-DAYS-BUSINESS
              THRU 002300-EXIT.
      *
           MOVE DW-WORK-YYYY TO SH-WORK-YYYY.
           MOVE DW-WORK-MM   TO SH-WORK-MM.
           MOVE DW-WORK-DD   TO SH-WORK-DD.
           DISPLAY SHOW-NEW-DATE-SCREEN.
      *
           GO TO 140000-ADD-DAYS-BUSINESS.
      *
       140000-EXIT.
           EXIT.
