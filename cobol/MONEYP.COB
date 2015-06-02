      ******************************************************************
      *                                                                *
      *                          M O N E Y                             *
      *                                                                *
      *                      Judson D. McClendon                       *
      *                      Sun Valley Systems                        *
      *                      329 37th Court NE                         *
      *                      Birmingham, AL 35215                      *
      *                         205/853-8440                           *
      *                                                                *
      *    CONVERTS A NUMERIC MONEY AMOUNT INTO ONE OR MORE TEXT       *
      *    LINES FOR PRINTING ON CHECKS FOR SECURITY.  AMOUNTS UP      *
      *    TO $999,999,999,999,999.99 CAN BE CONVERTED.                *
      *                                                                *
      *    USAGE:  MOVE <AMOUNT> TO MW-AMOUNT.                         *
      *            PERFORM 005000-MONEY                                *
      *               THRU 005000-EXIT.                                *
      *                                                                *
      *    RESULT: MW-MONEY-LINES = TEXT AMOUNT CENTERED ON EACH LINE  *
      *                             WITH "**" ON EACH SIDE AS PROTECT. *
      *                                                                *
      ******************************************************************
      *
       005000-MONEY.
      *
           MOVE SPACES TO MW-MONEY.
           MOVE 1      TO MW-MCX.
           MOVE SPACES TO MW-MONEY-LINES.
           MOVE 1      TO MW-MLX.
      *
           PERFORM 005010-GROUP
              THRU 005010-EXIT
               VARYING MW-GX
                   FROM 1  BY 1
               UNTIL (MW-GX > MW-GLIM).
      *
           IF (MW-AMOUNT-DOLLARS ZERO)
               MOVE "2NO"           TO MW-WORD-TEXT
               PERFORM 005050-MOVE-WORD
                  THRU 005050-EXIT.
      *
           IF (MW-AMOUNT-DOLLARS = 1)
               MOVE "6DOLLAR"  TO MW-WORD-TEXT
           ELSE
               MOVE "7DOLLARS" TO MW-WORD-TEXT.
           PERFORM 005050-MOVE-WORD
              THRU 005050-EXIT.
      *
           MOVE "3AND"         TO MW-WORD-TEXT.
           PERFORM 005050-MOVE-WORD
              THRU 005050-EXIT.
      *
           IF (MW-AMOUNT-CENTS = 0)
               MOVE "2NO"           TO MW-WORD-TEXT
               PERFORM 005050-MOVE-WORD
                  THRU 005050-EXIT
           ELSE
               MOVE MW-AMOUNT-CENTS TO MW-WORK
               PERFORM 005030-TWO-DIGITS
                  THRU 005030-EXIT.
      *
           IF (MW-AMOUNT-CENTS = 1)
               MOVE "6CENT**"  TO MW-WORD-TEXT
           ELSE
               MOVE "7CENTS**" TO MW-WORD-TEXT.
           PERFORM 005050-MOVE-WORD
              THRU 005050-EXIT.
      *
           COMPUTE MW-IX1 = (MW-MCLIM - MW-MCX) / 2 + 1 .
           STRING MW-MONEY DELIMITED BY SIZE
               INTO MW-MONEY-LINE(MW-MLX)
                   WITH POINTER MW-IX1.
      *
       005000-EXIT.
           EXIT.
      *
      *
      *                    C O N V E R T   G R O U P
      *
       005010-GROUP.
      *
           IF (MW-AMOUNT-GROUP(MW-GX) NOT ZERO)
               MOVE MW-AMOUNT-GROUP(MW-GX) TO MW-WORK
               PERFORM 005020-THREE-DIGITS
                  THRU 005020-EXIT
               IF (MW-GROUP-WORD(MW-GX) NOT = SPACES)
                   MOVE MW-GROUP-WORD(MW-GX) TO MW-WORD-TEXT
                   PERFORM 005050-MOVE-WORD
                      THRU 005050-EXIT.
      *
       005010-EXIT.
           EXIT.
      *
      *
      *             C O N V E R T   T H R E E   D I G I T S
      *
       005020-THREE-DIGITS.
      *
           IF (MW-WORK-HUNDREDS > 0)
               MOVE MW-ONES-WORD(MW-WORK-HUNDREDS) TO MW-WORD-TEXT
               PERFORM 005050-MOVE-WORD
                  THRU 005050-EXIT
               MOVE "7HUNDRED" TO MW-WORD-TEXT
               PERFORM 005050-MOVE-WORD
                  THRU 005050-EXIT.
      *
           PERFORM 005030-TWO-DIGITS
              THRU 005030-EXIT.
      *
       005020-EXIT.
           EXIT.
      *
      *
      *               C O N V E R T   T W O   D I G I T S
      *
       005030-TWO-DIGITS.
      *
           IF (MW-WORK-TEENS > 0)
               IF (MW-WORK-TEENS < 20)
                   MOVE MW-ONES-WORD(MW-WORK-TEENS) TO MW-WORD-TEXT
                   PERFORM 005050-MOVE-WORD
                      THRU 005050-EXIT
               ELSE
                   PERFORM 005040-TENS-ONES
                      THRU 005040-EXIT.
      *
       005030-EXIT.
           EXIT.
      *
      *
      *                C O N V E R T   T E N S / O N E S
      *
       005040-TENS-ONES.
      *
           IF (MW-WORK-TENS > 0)
               MOVE MW-TENS-WORD(MW-WORK-TENS) TO MW-WORD-TEXT
               PERFORM 005050-MOVE-WORD
                  THRU 005050-EXIT.
      *
           IF (MW-WORK-ONES > 0)
               MOVE MW-ONES-WORD(MW-WORK-ONES) TO MW-WORD-TEXT
               PERFORM 005050-MOVE-WORD
                  THRU 005050-EXIT.
      *
       005040-EXIT.
           EXIT.
      *
      *
      *                 M O V E   I N   N E W   W O R D
      *
       005050-MOVE-WORD.
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
       005050-EXIT.
           EXIT.
