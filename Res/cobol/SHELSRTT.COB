       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID.    SHELSRTT.
      *
       DATE-WRITTEN.  05/03/90.
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
       DATA DIVISION.
      *
       FILE SECTION.
      *
       WORKING-STORAGE SECTION.
      *
      *                             77'S
      *
       77  WS-ANSWER                   PIC  X(01)        VALUE SPACE.
       77  WS-ELEMENTS                 PIC S9(05) BINARY VALUE 0.
       77  WS-ELEMENTS-DISP            PIC  ZZZZ9        VALUE 0.
      *
      *
      *              R A N D O M   N U M B E R   W O R K
      *
       01  RANDOM-NUMBER-WORK.
           03  RNG-SEED                PIC  9(10) BINARY VALUE 0.
           03  RNG-TEMP                PIC  9(10) BINARY VALUE 0.
      *
      *
      *                     S C R E E N   L I N E
      *
       01  SCREEN-LINE-WORK.
           03  SL-ELIM                 PIC  9(02)       VALUE 10.
           03  SL-SCREEN-LINE-E.
               05  SL-ELEMENTS         OCCURS 10 TIMES.
                   07  SL-ELEMENT          PIC  Z(06).
                   07      FILLER          PIC  X(02).
           03  SL-SCREEN-LINE-R        REDEFINES SL-SCREEN-LINE-E.
               05  SL-SCREEN-LINE          PIC  X(78).
               05      FILLER              PIC  X(02).

           03  SL-EX                   PIC  9(02)       VALUE 0.
      *
      *
      *                  T I M E   W O R K   A R E A
      *
       01  TIME-WORK-AREA.
           03  TW-BEG-HHMMSSTH         PIC  9(08)       VALUE 0.
           03  TW-BEG-HHMMSSTH-R       REDEFINES TW-BEG-HHMMSSTH.
               05  TW-BEG-HH               PIC  9(02).
               05  TW-BEG-MM               PIC  9(02).
               05  TW-BEG-SS               PIC  9(02).
               05  TW-BEG-TH               PIC  9(02).
           03  TW-BEG-TIME             PIC  9(08)       VALUE 0.
      *
           03  TW-END-HHMMSSTH         PIC  9(08)       VALUE 0.
           03  TW-END-HHMMSSTH-R       REDEFINES TW-END-HHMMSSTH.
               05  TW-END-HH               PIC  9(02).
               05  TW-END-MM               PIC  9(02).
               05  TW-END-SS               PIC  9(02).
               05  TW-END-TH               PIC  9(02).
           03  TW-END-TIME             PIC  9(08)       VALUE 0.
      *
           03  TW-ET-HHMMSSTH.
               05  TW-ET-HH            PIC  9(02)       VALUE 0.
               05      FILLER          PIC  X(01)       VALUE ":".
               05  TW-ET-MM            PIC  9(02)       VALUE 0.
               05      FILLER          PIC  X(01)       VALUE ":".
               05  TW-ET-SS            PIC  9(02)       VALUE 0.
               05      FILLER          PIC  X(01)       VALUE ".".
               05  TW-ET-TH            PIC  9(02)       VALUE 0.
           03  TW-ET-TIME              PIC  9(08)       VALUE 0.
      *
       COPY SHELSRTW.COB.
      *
       PROCEDURE DIVISION.
      *
      ******************************************************************
      *                                                                *
      *                         C O N T R O L                          *
      *                                                                *
      ******************************************************************
      *
       000000-CONTROL.
      *
           PERFORM 000200-PROCESS
              THRU 000200-EXIT
               UNTIL (WS-ELEMENTS > ST-ELIM).
      *
       000000-EXIT.
           STOP RUN.
      *
      *
      *                        P R O C E S S
      *
       000200-PROCESS.
      *
      *  ** GET NUMBER OF KEYS TO SORT **
      *
           PERFORM 000210-GET-NBR-KEYS
              THRU 000210-EXIT.
      *
      *  **  GENERATE KEYS **
      *
           PERFORM 000220-GENERATE-KEYS
              THRU 000220-EXIT.
      *
      *  ** DISPLAY UNSORTED KEYS **
      *
      **** PERFORM 000260-DISPLAY-KEYS
      ****    THRU 000260-EXIT.
      *
      *  **  SORT KEYS **
      *
           PERFORM 000240-SORT-KEYS
              THRU 000240-EXIT.
      *
      *  ** DISPLAY SORTED KEYS **
      *
      **** PERFORM 000260-DISPLAY-KEYS
      ****    THRU 000260-EXIT.
      *
      *  ** DISPLAY ELAPSED TIME **
      *
           PERFORM 000280-DISPLAY-ET
              THRU 000280-EXIT.
      *
       000200-EXIT.
           EXIT.
      *
      *
      *           G E T   N U M B E R   O F   K E Y S
      *
       000210-GET-NBR-KEYS.
      *
           MOVE ST-ELIM TO WS-ELEMENTS-DISP.
           DISPLAY " ".
           DISPLAY "ENTER NUMBER OF ELEMENTS (0 TO "
                   WS-ELEMENTS-DISP
                   ")".
           DISPLAY "ENTER NEGATIVE NUMBER TO STOP".
      *
           MOVE ZERO TO WS-ELEMENTS.
           ACCEPT WS-ELEMENTS.
      *
           IF (WS-ELEMENTS > ST-ELIM)
               GO TO 000210-GET-NBR-KEYS.
      *
           IF (WS-ELEMENTS NEGATIVE)
               STOP RUN.
      *
           MOVE WS-ELEMENTS TO WS-ELEMENTS-DISP.
      *
       000210-EXIT.
           EXIT.
      *
      *
      *         G E N E R A T E   R A N D O M   K E Y S
      *
       000220-GENERATE-KEYS.
      *
           DISPLAY "GENERATING " WS-ELEMENTS-DISP " RANDOM KEYS...".
      *
           MOVE SPACES TO SL-SCREEN-LINE.
           MOVE 0      TO SL-EX.
      *
           PERFORM 000230-GENERATE-KEY
              THRU 000230-EXIT
               VARYING ST-I
                   FROM 1  BY 1
               UNTIL (ST-I > WS-ELEMENTS).
      *
       000220-EXIT.
           EXIT.
      *
      *
      *
       000230-GENERATE-KEY.
      *
      *  ** NUMBERS 214031, 2531017 AND 999999937 ARE PRIME **
      *
           COMPUTE RNG-SEED = RNG-SEED * 214031 + 2531017.
           DIVIDE RNG-SEED BY 999999937 GIVING RNG-TEMP
                       REMAINDER RNG-SEED.
      *
           MOVE RNG-SEED TO ST-ENT-FLD1(ST-I).
      *
       000230-EXIT.
           EXIT.
      *
      *
      *                    S O R T   K E Y S
      *
       000240-SORT-KEYS.
      *
           DISPLAY "SORTING " WS-ELEMENTS-DISP " KEYS...".
      *
           ACCEPT TW-BEG-HHMMSSTH FROM TIME.
      *
           MOVE WS-ELEMENTS TO ST-EMAX.
           PERFORM 007000-SHELLSORT
              THRU 007000-EXIT.
      *
           ACCEPT TW-END-HHMMSSTH FROM TIME.
      *
       000240-EXIT.
           EXIT.
      *
      *
      *                 D I S P L A Y   K E Y S
      *
       000260-DISPLAY-KEYS.
      *
           MOVE SPACES TO SL-SCREEN-LINE.
           MOVE 0      TO SL-EX.
      *
           PERFORM 000270-DISPLAY-KEY
              THRU 000270-EXIT
               VARYING ST-I
                   FROM 1  BY 1
               UNTIL (ST-I > WS-ELEMENTS).
           IF (SL-EX > 0)
               DISPLAY SL-SCREEN-LINE.
      *
       000260-EXIT.
           EXIT.
      *
      *
      *
       000270-DISPLAY-KEY.
      *
           ADD 1 TO SL-EX.
           IF (SL-EX > SL-ELIM)
               DISPLAY SL-SCREEN-LINE
               MOVE SPACES TO SL-SCREEN-LINE
               MOVE 1      TO SL-EX.
           MOVE ST-ENT-FLD1(ST-I) TO SL-ELEMENT(SL-EX).
      *
       000270-EXIT.
           EXIT.
      *
      *
      *         D I S P L A Y   E L A P S E D   T I M E
      *
       000280-DISPLAY-ET.
      *
           COMPUTE TW-BEG-TIME = TW-BEG-HH * 360000
                               + TW-BEG-MM * 6000
                               + TW-BEG-SS * 100
                               + TW-BEG-TH.
      *
           COMPUTE TW-END-TIME = TW-END-HH * 360000
                               + TW-END-MM * 6000
                               + TW-END-SS * 100
                               + TW-END-TH.
      *
           COMPUTE TW-ET-TIME = TW-END-TIME - TW-BEG-TIME.
      *
           DIVIDE TW-ET-TIME BY 360000
                       GIVING TW-ET-HH
                                       REMAINDER TW-ET-TIME.
           DIVIDE TW-ET-TIME BY 6000
                       GIVING TW-ET-MM
                                       REMAINDER TW-ET-TIME.
           DIVIDE TW-ET-TIME BY 100
                       GIVING TW-ET-SS
                                       REMAINDER TW-ET-TH.
      *
           DISPLAY WS-ELEMENTS-DISP " KEYS SORTED".
           DISPLAY "ELAPSED TIME: " TW-ET-HHMMSSTH.
      *
       000280-EXIT.
           EXIT.
      *
       COPY SHELSRTP.COB.
