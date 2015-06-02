       IDENTIFICATION DIVISION.
      *
       PROGRAM-ID.    DOLLARS.
      *
       DATE-WRITTEN.  05/27/96.
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
       77  WS-AMOUNT                   PIC S9(15)V9(02) COMP VALUE 0.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *                  M O N E Y   W O R K   A R E A                 *
      *                                                                *
      ******************************************************************
      *
       01  MONEY-WORK-AREA.
           03  MW-AMOUNT               PIC  9(15)V9(02).
           03  MW-AMOUNT-R             REDEFINES MW-AMOUNT.
               05  MW-AMOUNT-DOLLARS       PIC  9(15).
               05  MW-AMOUNT-DOLLARS-R     REDEFINES MW-AMOUNT-DOLLARS.
                   07  MW-AMOUNT-TRILLIONS     PIC  9(03).
                   07  MW-AMOUNT-BILLIONS      PIC  9(03).
                   07  MW-AMOUNT-MILLIONS      PIC  9(03).
                   07  MW-AMOUNT-THOUSANDS     PIC  9(03).
                   07  MW-AMOUNT-ONES          PIC  9(03).
               05  MW-AMOUNT-CENTS         PIC  9(02).
      *
           03  MW-WORK                 PIC  9(03).
           03  MW-WORK-R1              REDEFINES MW-WORK.
               05  MW-WORK-HUNDREDS        PIC  9(01).
               05  MW-WORK-TENS            PIC  9(01).
               05  MW-WORK-ONES            PIC  9(01).
           03  MW-WORK-R2              REDEFINES MW-WORK.
               05      FILLER              PIC  9(01).
               05  MW-WORK-TEENS           PIC  9(02).
      *
           78  MW-MCLIM                VALUE 50.
           03  MW-MONEY.
               05  MW-MONEY-CHAR       PIC  X(01)
                                           OCCURS MW-MCLIM TIMES.
           03  MW-MCX                  PIC  9(02)       COMP VALUE 0.
      *
           78  MW-MLLIM                VALUE 6.
           03  MW-MONEY-LINES.
               05  MW-MONEY-LINE       PIC  X(MW-MCLIM)
                                           OCCURS MW-MLLIM TIMES.
           03  MW-MLX                  PIC  9(02)       COMP VALUE 0.
      *
           03  MW-WORD-TEXT.
               05  MW-WORD-SIZE        PIC  9(01).
               05  MW-WORD.
                   07  MW-WORD-CHAR    PIC  X(01)
                                           OCCURS 9 TIMES.
           03  MW-WCX                  PIC  9(02)       COMP VALUE 0.
      *
           03  MW-IX1                  PIC  9(02)       COMP VALUE 0.
           03  MW-IX2                  PIC  9(02)       COMP VALUE 0.
      *
      *
           03  MW-ONES-VALUES.
               05      FILLER  PIC  X(10)      VALUE "3ONE      ".
               05      FILLER  PIC  X(10)      VALUE "3TWO      ".
               05      FILLER  PIC  X(10)      VALUE "5THREE    ".
               05      FILLER  PIC  X(10)      VALUE "4FOUR     ".
               05      FILLER  PIC  X(10)      VALUE "4FIVE     ".
               05      FILLER  PIC  X(10)      VALUE "3SIX      ".
               05      FILLER  PIC  X(10)      VALUE "5SEVEN    ".
               05      FILLER  PIC  X(10)      VALUE "5EIGHT    ".
               05      FILLER  PIC  X(10)      VALUE "4NINE     ".
               05      FILLER  PIC  X(10)      VALUE "3TEN      ".
               05      FILLER  PIC  X(10)      VALUE "6ELEVEN   ".
               05      FILLER  PIC  X(10)      VALUE "6TWELVE   ".
               05      FILLER  PIC  X(10)      VALUE "8THIRTEEN ".
               05      FILLER  PIC  X(10)      VALUE "8FOURTEEN ".
               05      FILLER  PIC  X(10)      VALUE "7FIFTEEN  ".
               05      FILLER  PIC  X(10)      VALUE "7SIXTEEN  ".
               05      FILLER  PIC  X(10)      VALUE "9SEVENTEEN".
               05      FILLER  PIC  X(10)      VALUE "8EIGHTEEN ".
               05      FILLER  PIC  X(10)      VALUE "8NINETEEN ".
      *
           03  MW-ONES-VALUE           REDEFINES MW-ONES-VALUES
                                           PIC  X(10)
                                           OCCURS 19 TIMES.
      *
      *
           03  MW-TENS-VALUES.
               05      FILLER  PIC  X(08)      VALUE "3TEN    ".
               05      FILLER  PIC  X(08)      VALUE "6TWENTY ".
               05      FILLER  PIC  X(08)      VALUE "6THIRTY ".
               05      FILLER  PIC  X(08)      VALUE "5FORTY  ".
               05      FILLER  PIC  X(08)      VALUE "5FIFTY  ".
               05      FILLER  PIC  X(08)      VALUE "5SIXTY  ".
               05      FILLER  PIC  X(08)      VALUE "7SEVENTY".
               05      FILLER  PIC  X(08)      VALUE "6EIGHTY ".
               05      FILLER  PIC  X(08)      VALUE "6NINETY ".
      *
           03  MW-TENS-VALUE           REDEFINES MW-TENS-VALUES
                                           PIC  X(08)
                                           OCCURS  9 TIMES.
      *
       PROCEDURE DIVISION.
      *
       000000-CONTROL.
      *
           DISPLAY  " ".
      *
           PERFORM 000100-PROCESS
              THRU 000100-EXIT.
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
           DISPLAY "Enter up to tttbbbmmmtttooo.cc (< 0 to exit): "
               AT LINE 10 COL 1.
      *
           MOVE ZERO TO WS-AMOUNT.
           ACCEPT WS-AMOUNT.
           IF (WS-AMOUNT < 0)
               GO TO 000100-EXIT.
      *
           MOVE WS-AMOUNT TO MW-AMOUNT.
           PERFORM 001000-MONEY
              THRU 001000-EXIT.
      *
           GO TO 000100-PROCESS.
      *
       000100-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *                          M O N E Y                             *
      *                                                                *
      *                                                                *
      *    CONVERTS A NUMERIC MONEY AMOUNT INTO ONE OR MORE TEXT       *
      *    LINES FOR PRINTING ON CHECKS FOR SECURITY.  AMOUNTS UP      *
      *    TO $999,999,999,999,999.99 CAN BE CONVERTED.                *
      *                                                                *
      *    USAGE:  MOVE <AMOUNT> TO MW-AMOUNT.                         *
      *            PERFORM 001000-MONEY                                *
      *               THRU 001000-EXIT.                                *
      *                                                                *
      *    RESULT: MW-MONEY-LINES = TEXT AMOUNT CENTERED ON EACH LINE  *
      *                                                                *
      ******************************************************************
      *
       001000-MONEY.
      *
           MOVE SPACES TO MW-MONEY.
           MOVE 1      TO MW-MCX.
           MOVE SPACES TO MW-MONEY-LINES.
           MOVE 1      TO MW-MLX.
      *
           IF (MW-AMOUNT-TRILLIONS NOT ZERO)
               MOVE MW-AMOUNT-TRILLIONS TO MW-WORK
               PERFORM 001100-THREE-DIGITS
                  THRU 001100-EXIT
               MOVE "8TRILLION" TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT.
      *
           IF (MW-AMOUNT-BILLIONS NOT ZERO)
               MOVE MW-AMOUNT-BILLIONS TO MW-WORK
               PERFORM 001100-THREE-DIGITS
                  THRU 001100-EXIT
               MOVE "7BILLION"  TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT.
      *
           IF (MW-AMOUNT-MILLIONS NOT ZERO)
               MOVE MW-AMOUNT-MILLIONS TO MW-WORK
               PERFORM 001100-THREE-DIGITS
                  THRU 001100-EXIT
               MOVE "7MILLION"  TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT.
      *
           IF (MW-AMOUNT-THOUSANDS NOT ZERO)
               MOVE MW-AMOUNT-THOUSANDS TO MW-WORK
               PERFORM 001100-THREE-DIGITS
                  THRU 001100-EXIT
               MOVE "8THOUSAND" TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT.
      *
           IF (MW-AMOUNT-ONES NOT ZERO)
               MOVE MW-AMOUNT-ONES  TO MW-WORK
               PERFORM 001100-THREE-DIGITS
                  THRU 001100-EXIT.
      *
           IF (MW-AMOUNT-DOLLARS ZERO)
               MOVE "2NO"           TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT.
      *
           IF (MW-AMOUNT-DOLLARS = 1)
               MOVE "6DOLLAR"  TO MW-WORD-TEXT
           ELSE
               MOVE "7DOLLARS" TO MW-WORD-TEXT.
           PERFORM 001400-MOVE-WORD
              THRU 001400-EXIT.
      *
           MOVE "3AND"         TO MW-WORD-TEXT.
           PERFORM 001400-MOVE-WORD
              THRU 001400-EXIT.
      *
           IF (MW-AMOUNT-CENTS = 0)
               MOVE "2NO"           TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT
           ELSE
               MOVE MW-AMOUNT-CENTS TO MW-WORK
               PERFORM 001200-TWO-DIGITS
                  THRU 001200-EXIT.
      *
           IF (MW-AMOUNT-CENTS = 1)
               MOVE "6CENT**"  TO MW-WORD-TEXT
           ELSE
               MOVE "7CENTS**" TO MW-WORD-TEXT.
           PERFORM 001400-MOVE-WORD
              THRU 001400-EXIT.
      *
           COMPUTE MW-IX1 = (MW-MCLIM - MW-MCX) / 2 + 1 .
           STRING MW-MONEY DELIMITED BY SIZE
               INTO MW-MONEY-LINE(MW-MLX)
                   WITH POINTER MW-IX1.
      *
       001000-EXIT.
           EXIT.
      *
      *
      *             C O N V E R T   T H R E E   D I G I T S
      *
       001100-THREE-DIGITS.
      *
           IF (MW-WORK-HUNDREDS > 0)
               MOVE MW-ONES-VALUE(MW-WORK-HUNDREDS) TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT
               MOVE "7HUNDRED" TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT.
      *
           PERFORM 001200-TWO-DIGITS
              THRU 001200-EXIT.
      *
       001100-EXIT.
           EXIT.
      *
      *
      *               C O N V E R T   T W O   D I G I T S
      *
       001200-TWO-DIGITS.
      *
           IF (MW-WORK-TEENS > 0)
               IF (MW-WORK-TEENS < 20)
                   MOVE MW-ONES-VALUE(MW-WORK-TEENS) TO MW-WORD-TEXT
                   PERFORM 001400-MOVE-WORD
                      THRU 001400-EXIT
               ELSE
                   PERFORM 001300-TENS-ONES
                      THRU 001300-EXIT.
      *
       001200-EXIT.
           EXIT.
      *
      *
      *                C O N V E R T   T E N S / O N E S
      *
       001300-TENS-ONES.
      *
           IF (MW-WORK-TENS > 0)
               MOVE MW-TENS-VALUE(MW-WORK-TENS) TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT.
      *
           IF (MW-WORK-ONES > 0)
               MOVE MW-ONES-VALUE(MW-WORK-ONES) TO MW-WORD-TEXT
               PERFORM 001400-MOVE-WORD
                  THRU 001400-EXIT.
      *
       001300-EXIT.
           EXIT.
      *
      *
      *                 M O V E   I N   N E W   W O R D
      *
       001400-MOVE-WORD.
      *
           COMPUTE MW-IX2 = MW-MCX + MW-WORD-SIZE + 3 .
           IF (MW-IX2 > MW-MCLIM)
               STRING "**" DELIMITED BY SIZE
                   INTO MW-MONEY
                       WITH POINTER MW-MCX
               COMPUTE MW-IX1 = (MW-MCLIM - MW-MCX) / 2 + 1
               STRING MW-MONEY DELIMITED BY SIZE
                   INTO MW-MONEY-LINE(MW-MLX)
                       WITH POINTER MW-IX1
               ADD  1      TO MW-MLX
               MOVE SPACES TO MW-MONEY
               MOVE 1      TO MW-MCX.
      *
           IF (MW-MCX = 1)
               STRING "**" DELIMITED BY SIZE
                   INTO MW-MONEY POINTER MW-MCX
           ELSE
               ADD  1      TO MW-MCX.
      *
           STRING MW-WORD DELIMITED BY SPACE
               INTO MW-MONEY
                   WITH POINTER MW-MCX.
      *
       001400-EXIT.
           EXIT.