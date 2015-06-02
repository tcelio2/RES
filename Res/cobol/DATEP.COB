      ******************************************************************
      *                                                                *
      *                       D A T E   E D I T                        *
      *                                                                *
      *                      Judson D. McClendon                       *
      *                      Sun Valley Systems                        *
      *                      329 37th Court NE                         *
      *                      Birmingham, AL 35215                      *
      *                         205/853-8440                           *
      *                                                                *
      *    USAGE:  MOVE <MMDDYYYY DATE> TO DW-WORK-DATE-ALPHA.         *
      *            PERFORM 001000-DATE-EDIT                            *
      *               THRU 001000-EXIT.                                *
      *                                                                *
      *    RESULT: DW-DATE-ERROR-FLAG = 0 IF DATE IS VALID             *
      *            DW-DATE-ERROR-FLAG = 1 IF DATE IS NOT VALID         *
      *                                                                *
      *            DW-WORK-YYYYMMDD = GIVEN DATE IN YYYYMMDD FORMAT    *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       001000-DATE-EDIT.
      *
      *  ** ERROR FLAG WILL BE RESET TO 0 ON GOOD EXIT **
      *
           MOVE 1 TO DW-DATE-ERROR-FLAG.
      *
           IF (DW-WORK-DATE-ALPHA NOT NUMERIC)
               GO TO 001000-EXIT.
      *
           MOVE DW-WORK-YEAR   TO DW-WORK-YYYY.
           MOVE DW-WORK-MONTH  TO DW-WORK-MM.
           MOVE DW-WORK-DAY    TO DW-WORK-DD.
      *
           IF (DW-WORK-MM < 01 OR > 12)
               GO TO 001000-EXIT.
      *
      *  ** SET DAYS IN FEBRUARY **
      *
           MOVE 28 TO DW-DAYS-IN-MONTH(2).
           DIVIDE 400 INTO DW-WORK-YYYY GIVING DW-WORK1
                                     REMAINDER DW-WORK2.
           IF (DW-WORK2 = 0)
               MOVE 29 TO DW-DAYS-IN-MONTH(2)
           ELSE
               DIVIDE 100 INTO DW-WORK-YYYY GIVING DW-WORK1
                                         REMAINDER DW-WORK2
               IF (DW-WORK2 NOT = 0)
                   DIVIDE 4 INTO DW-WORK-YYYY GIVING DW-WORK1
                                           REMAINDER DW-WORK2
                   IF (DW-WORK2 = 0)
                       MOVE 29 TO DW-DAYS-IN-MONTH(2).
      *
           IF (DW-WORK-DD < 01)
               OR
              (DW-WORK-DD > DW-DAYS-IN-MONTH(DW-WORK-MM))
               GO TO 001000-EXIT.
      *
      *  ** GOOD DATE **
      *
           MOVE 0 TO DW-DATE-ERROR-FLAG.
      *
       001000-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *        C A L C U L A T E   D A T E   D A Y   N U M B E R       *
      *                                                                *
      *                                                                *
      *    RETURNS A NUMBER WHICH IS ONE GREATER FOR EACH SUCCESSIVE   *
      *    DATE.                                                       *
      *                                                                *
      *    USAGE:  MOVE <FIRST DATE>  TO DW-WORK-YYYYMMDD.             *
      *            PERFORM 001100-DATE-DAYS                            *
      *               THRU 001100-EXIT.                                *
      *                                                                *
      *    RESULT: DW-DAYS = DATE DAY NUMBER                           *
      *                                                                *
      *                                                                *
      *    THIS ROUTINE USES A VARIATION OF ZELLER'S CONGRUENCE.       *
      *    THE FORMULA IS:                                             *
      *                                                                *
      *        <DATE DAY NBR> = (     (YEAR * 365)                     *
      *                          + INT(YEAR / 4)                       *
      *                          - INT(YEAR / 100)                     *
      *                          + INT(YEAR / 400)                     *
      *                          + INT(MONTH * 30.6001)                *
      *                          +     DAY) )                          *
      *                                                                *
      *    WHERE: DAY     = DAY OF THE MONTH                           *
      *                                                                *
      *           MONTH   = MONTH + 13  (JAN & FEB)                    *
      *                     MONTH + 1   (MAR - DEC)                    *
      *                                                                *
      *           YEAR    = YEAR - 1    (JAN & FEB)                    *
      *                     YEAR        (MAR - DEC)                    *
      *                                                                *
      *           INT(...) MEANS TAKE THE INTEGER PART (NO ROUNDING)   *
      *                                                                *
      *                                                                *
      *    THE DATE-DAY-NUMBER CAN BE USED TO DETERMINE THE NUMBER OF  *
      *    DAYS BETWEEN TWO DATES BY COMPUTING THE DAY NUMBER OF EACH  *
      *    DATE AND SUBTRACTING, LIKE THIS:                            *
      *                                                                *
      *        MOVE <FIRST DATE>  TO DW-WORK-YYYYMMDD.                 *
      *        PERFORM 001100-DATE-DAYS                                *
      *           THRU 001100-EXIT.                                    *
      *        MOVE DW-DAYS TO <HOLD DAY>.                             *
      *        MOVE <SECOND DATE> TO DW-WORK-YYYYMMDD.                 *
      *        PERFORM 001100-DATE-DAYS                                *
      *           THRU 001100-EXIT.                                    *
      *        SUBTRACT DW-DAYS FROM <HOLD DAY>                        *
      *            GIVING <DAYS BETWEEN DATES>.                        *
      *                                                                *
      ******************************************************************
      *
       001100-DATE-DAYS.
      *
      *  ** ADJUST YEAR AND MONTH **
      *
           MOVE DW-WORK-YYYY TO DW-TEMP-YYYY.
           MOVE DW-WORK-MM   TO DW-TEMP-MM.
           IF (DW-WORK-MM < 03)
               ADD 13 TO DW-TEMP-MM
               SUBTRACT 1 FROM DW-TEMP-YYYY
           ELSE
               ADD 1 TO DW-TEMP-MM.
      *
           MULTIPLY DW-TEMP-YYYY BY 365 GIVING DW-DAYS.
      *
           DIVIDE DW-TEMP-YYYY BY 4 GIVING DW-WORK1.
           ADD DW-WORK1 TO DW-DAYS.
      *
           DIVIDE DW-TEMP-YYYY BY 100 GIVING DW-WORK1.
           SUBTRACT DW-WORK1 FROM DW-DAYS.
      *
           DIVIDE DW-TEMP-YYYY BY 400 GIVING DW-WORK1.
           ADD DW-WORK1 TO DW-DAYS.
      *
           MULTIPLY DW-TEMP-MM BY 30.6001 GIVING DW-WORK1.
           ADD DW-WORK1 TO DW-DAYS.
      *
           ADD DW-WORK-DD TO DW-DAYS.
      *
       001100-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *            C A L C U L A T E   D A Y   O F   W E E K           *
      *                                                                *
      *                                                                *
      *    WHEN GIVEN ANY DATE THIS ROUTINE RETURNS A NUMBER FROM      *
      *    1 TO 7 INDICATING THE DAY OF WEEK ON WHICH THE DATE FALLS.  *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <DATE> TO DW-WORK-YYYYMMDD.                    *
      *            PERFORM 001200-WEEKDAY                              *
      *               THRU 001200-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WEEKDAY = DAY OF WEEK                            *
      *                                                                *
      *                                                                *
      *    THIS ROUTINE USES ZELLER'S CONGRUENCE, EXPRESSED BY THE     *
      *    FOLLOWING FORMULA:                                          *
      *                                                                *
      *        <WEEKDAY> = (INT((13 * MONTH + 3) / 5)                  *
      *                   + DAY                                        *
      *                   + YEAR                                       *
      *                   + INT(YEAR / 4)                              *
      *                   - INT(YEAR / 100)                            *
      *                   + INT(YEAR / 400)                            *
      *                   + 1) MOD 7) + 1                              *
      *                                                                *
      *    WHERE: WEEKDAY = 1 TO 7 WITH  1 = SUNDAY     5 = THURSDAY   *
      *                                  2 = MONDAY     6 = FRIDAY     *
      *                                  3 = TUESDAY    7 = SATURDAY   *
      *                                  4 = WEDNESDAY                 *
      *                                                                *
      *           DAY     = DAY OF THE MONTH                           *
      *                                                                *
      *           MONTH   = MONTH OF THE YEAR (JAN AND FEB COUNT AS    *
      *                      MONTHS 13 AND 14 OF THE PREVIOUS YEAR)    *
      *                                                                *
      *           YEAR    = FOUR DIGIT YEAR (YEAR - 1 IF MONTH IS      *
      *                      JAN OR FEB)                               *
      *                                                                *
      *           INT(...) MEANS TAKE THE INTEGER PART (NO ROUNDING)   *
      *                                                                *
      *           X MOD Y  MEANS THE REMAINDER AFTER DIVIDING Y        *
      *                      INTO X                                    *
      *                                                                *
      ******************************************************************
      *
       001200-WEEKDAY.
      *
      *  ** ADJUST YEAR AND MONTH IF MONTH = JAN OR FEB **
      *
           MOVE DW-WORK-YYYY TO DW-TEMP-YYYY.
           MOVE DW-WORK-MM   TO DW-TEMP-MM.
           IF (DW-WORK-MM < 03)
               ADD 12 TO DW-TEMP-MM
               SUBTRACT 1 FROM DW-TEMP-YYYY.
      *
      *  ** CALCULATE INTO DW-WORK1 **
      *
           COMPUTE DW-WORK1 = (13 * DW-TEMP-MM + 3) / 5.
      *
           ADD DW-WORK-DD
               DW-TEMP-YYYY TO DW-WORK1.
      *
           DIVIDE DW-TEMP-YYYY BY 4 GIVING DW-WORK2.
           ADD DW-WORK2 TO DW-WORK1.
      *
           DIVIDE DW-TEMP-YYYY BY 100 GIVING DW-WORK2.
           SUBTRACT DW-WORK2 FROM DW-WORK1.
      *
           DIVIDE DW-TEMP-YYYY BY 400 GIVING DW-WORK2.
           ADD DW-WORK2 TO DW-WORK1.
      *
           ADD 1 TO DW-WORK1.
      *
           DIVIDE DW-WORK1 BY 7 GIVING DW-WORK2 REMAINDER DW-WEEKDAY.
           ADD 1 TO DW-WEEKDAY.
      *
       001200-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *               A D D   D A Y S   T O   A   D A T E              *
      *                                                                *
      *                                                                *
      *    WHEN GIVEN ANY DATE AND A NUMBER OF DAYS THIS ROUTINE WILL  *
      *    ADD THE NUMBER OF DAYS TO THE DATE.                         *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <DATE> TO DW-WORK-YYYYMMDD.                    *
      *            MOVE <DAYS> TO DW-DAYS.                             *
      *            PERFORM 001300-ADD-DAYS                             *
      *               THRU 001300-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WORK-YYYYMMDD = DATE AFTER DAYS ADDED            *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       001300-ADD-DAYS.
      *
      *  ** SET DAYS IN FEBRUARY **
      *
           MOVE 28 TO DW-DAYS-IN-MONTH(2).
           DIVIDE 400 INTO DW-WORK-YYYY GIVING DW-WORK1
                                     REMAINDER DW-WORK2.
           IF (DW-WORK2 = 0)
               MOVE 29 TO DW-DAYS-IN-MONTH(2)
           ELSE
               DIVIDE 100 INTO DW-WORK-YYYY GIVING DW-WORK1
                                         REMAINDER DW-WORK2
               IF (DW-WORK2 NOT = 0)
                   DIVIDE 4 INTO DW-WORK-YYYY GIVING DW-WORK1
                                           REMAINDER DW-WORK2
                   IF (DW-WORK2 = 0)
                       MOVE 29 TO DW-DAYS-IN-MONTH(2).
      *
           ADD DW-WORK-DD TO DW-DAYS.
      *
           PERFORM 001320-LOOP-MONTH
              THRU 001320-EXIT
              UNTIL (DW-DAYS NOT > DW-DAYS-IN-MONTH(DW-WORK-MM)).
      *
           MOVE DW-DAYS TO DW-WORK-DD.
      *
       001300-EXIT.
           EXIT.
      *
      *
      *
       001320-LOOP-MONTH.
      *
           SUBTRACT DW-DAYS-IN-MONTH(DW-WORK-MM) FROM DW-DAYS.
      *
           ADD 1 TO DW-WORK-MM.
           IF (DW-WORK-MM > 12)
               ADD 1 TO DW-WORK-YYYY
               SUBTRACT 12 FROM DW-WORK-MM.
      *
           MOVE 28 TO DW-DAYS-IN-MONTH(2).
           DIVIDE 400 INTO DW-WORK-YYYY GIVING DW-WORK1
                                     REMAINDER DW-WORK2.
           IF (DW-WORK2 = 0)
               MOVE 29 TO DW-DAYS-IN-MONTH(2)
           ELSE
               DIVIDE 100 INTO DW-WORK-YYYY GIVING DW-WORK1
                                         REMAINDER DW-WORK2
               IF (DW-WORK2 NOT = 0)
                   DIVIDE 4 INTO DW-WORK-YYYY GIVING DW-WORK1
                                           REMAINDER DW-WORK2
                   IF (DW-WORK2 = 0)
                       MOVE 29 TO DW-DAYS-IN-MONTH(2).
      *
       001320-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *        S U B T R A C T   D A Y S   F R O M   A   D A T E       *
      *                                                                *
      *                                                                *
      *    WHEN GIVEN ANY DATE AND A NUMBER OF DAYS THIS ROUTINE WILL  *
      *    SUBTRACT THE NUMBER OF DAYS FROM THE DATE.                  *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <DATE> TO DW-WORK-YYYYMMDD.                    *
      *            MOVE <DAYS> TO DW-DAYS.                             *
      *            PERFORM 001400-SUBTRACT-DAYS                        *
      *               THRU 001400-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WORK-YYYYMMDD = DATE AFTER DAYS SUBTRACTED       *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       001400-SUBTRACT-DAYS.
      *
           SUBTRACT DW-DAYS FROM DW-WORK-DD GIVING DW-DAYS.
      *
           PERFORM 001420-LOOP-MONTH
              THRU 001420-EXIT
               UNTIL (DW-DAYS > 0).
      *
           MOVE DW-DAYS TO DW-WORK-DD.
      *
       001400-EXIT.
           EXIT.
      *
      *
      *
       001420-LOOP-MONTH.
      *
           SUBTRACT 1 FROM DW-WORK-MM.
           IF (DW-WORK-MM < 01)
               SUBTRACT 1 FROM DW-WORK-YYYY
               ADD 12 TO DW-WORK-MM.
      *
           MOVE 28 TO DW-DAYS-IN-MONTH(2).
           DIVIDE 400 INTO DW-WORK-YYYY GIVING DW-WORK1
                                     REMAINDER DW-WORK2.
           IF (DW-WORK2 = 0)
               MOVE 29 TO DW-DAYS-IN-MONTH(2)
           ELSE
               DIVIDE 100 INTO DW-WORK-YYYY GIVING DW-WORK1
                                         REMAINDER DW-WORK2
               IF (DW-WORK2 NOT = 0)
                   DIVIDE 4 INTO DW-WORK-YYYY GIVING DW-WORK1
                                           REMAINDER DW-WORK2
                   IF (DW-WORK2 = 0)
                       MOVE 29 TO DW-DAYS-IN-MONTH(2).
      *
           ADD DW-DAYS-IN-MONTH(DW-WORK-MM) TO DW-DAYS.
      *
       001420-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *             A D D   M O N T H S   T O   A   D A T E            *
      *                                                                *
      *                                                                *
      *    WHEN GIVEN ANY DATE AND A NUMBER OF MONTHS THIS ROUTINE     *
      *    WILL ADD THE NUMBER OF MONTHS TO THE DATE.                  *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <DATE>   TO DW-WORK-YYYYMMDD.                  *
      *            MOVE <MONTHS> TO DW-MONTHS.                         *
      *            PERFORM 001500-ADD-MONTHS                           *
      *               THRU 001500-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WORK-YYYYMMDD = DATE AFTER MONTHS ADDED          *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       001500-ADD-MONTHS.
      *
           ADD DW-WORK-MM TO DW-MONTHS.
      *
           PERFORM 001520-LOOP-YEAR
              THRU 001520-EXIT
              UNTIL (DW-MONTHS NOT > 12).
      *
           MOVE DW-MONTHS TO DW-WORK-MM.
      *
           MOVE 28 TO DW-DAYS-IN-MONTH(2).
           DIVIDE 400 INTO DW-WORK-YYYY GIVING DW-WORK1
                                     REMAINDER DW-WORK2.
           IF (DW-WORK2 = 0)
               MOVE 29 TO DW-DAYS-IN-MONTH(2)
           ELSE
               DIVIDE 100 INTO DW-WORK-YYYY GIVING DW-WORK1
                                         REMAINDER DW-WORK2
               IF (DW-WORK2 NOT = 0)
                   DIVIDE 4 INTO DW-WORK-YYYY GIVING DW-WORK1
                                           REMAINDER DW-WORK2
                   IF (DW-WORK2 = 0)
                       MOVE 29 TO DW-DAYS-IN-MONTH(2).
      *
           IF (DW-WORK-DD > DW-DAYS-IN-MONTH(DW-WORK-MM))
               MOVE DW-DAYS-IN-MONTH(DW-WORK-MM) TO DW-WORK-DD.
      *
       001500-EXIT.
           EXIT.
      *
      *
      *
       001520-LOOP-YEAR.
      *
           SUBTRACT 12 FROM DW-MONTHS.
           ADD 1 TO DW-WORK-YYYY.
      *
       001520-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *      S U B T R A C T   M O N T H S   F R O M   A   D A T E     *
      *                                                                *
      *                                                                *
      *    WHEN GIVEN ANY DATE AND A NUMBER OF MONTHS THIS ROUTINE     *
      *    WILL SUBTRACT THE NUMBER OF MONTHS FROM THE DATE.           *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <DATE>   TO DW-WORK-YYYYMMDD.                  *
      *            MOVE <MONTHS> TO DW-MONTHS.                         *
      *            PERFORM 001600-SUBTRACT-MONTHS                      *
      *               THRU 001600-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WORK-YYYYMMDD = DATE AFTER MONTHS SUBTRACTED     *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       001600-SUBTRACT-MONTHS.
      *
           SUBTRACT DW-MONTHS FROM DW-WORK-MM GIVING DW-MONTHS.
      *
           PERFORM 001620-LOOP-YEAR
              THRU 001620-EXIT
               UNTIL (DW-MONTHS > 0).
      *
           MOVE DW-MONTHS TO DW-WORK-MM.
      *
           MOVE 28 TO DW-DAYS-IN-MONTH(2).
           DIVIDE 400 INTO DW-WORK-YYYY GIVING DW-WORK1
                                     REMAINDER DW-WORK2.
           IF (DW-WORK2 = 0)
               MOVE 29 TO DW-DAYS-IN-MONTH(2)
           ELSE
               DIVIDE 100 INTO DW-WORK-YYYY GIVING DW-WORK1
                                         REMAINDER DW-WORK2
               IF (DW-WORK2 NOT = 0)
                   DIVIDE 4 INTO DW-WORK-YYYY GIVING DW-WORK1
                                           REMAINDER DW-WORK2
                   IF (DW-WORK2 = 0)
                       MOVE 29 TO DW-DAYS-IN-MONTH(2).
      *
           IF (DW-WORK-DD > DW-DAYS-IN-MONTH(DW-WORK-MM))
               MOVE DW-DAYS-IN-MONTH(DW-WORK-MM) TO DW-WORK-DD.
      *
       001600-EXIT.
           EXIT.
      *
      *
      *
       001620-LOOP-YEAR.
      *
           ADD 12 TO DW-MONTHS.
           SUBTRACT 1 FROM DW-WORK-YYYY.
      *
       001620-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *              A D D   Y E A R S   T O   A   D A T E             *
      *                                                                *
      *                                                                *
      *    WHEN GIVEN ANY DATE AND A NUMBER OF YEARS THIS ROUTINE      *
      *    WILL ADD THE NUMBER OF YEARS TO THE DATE.                   *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <DATE>  TO DW-WORK-YYYYMMDD.                   *
      *            MOVE <YEARS> TO DW-YEARS.                           *
      *            PERFORM 001700-ADD-YEARS                            *
      *               THRU 001700-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WORK-YYYYMMDD = DATE AFTER YEARS ADDED           *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       001700-ADD-YEARS.
      *
           ADD DW-YEARS TO DW-WORK-YYYY.
      *
           MOVE 28 TO DW-DAYS-IN-MONTH(2).
           DIVIDE 400 INTO DW-WORK-YYYY GIVING DW-WORK1
                                     REMAINDER DW-WORK2.
           IF (DW-WORK2 = 0)
               MOVE 29 TO DW-DAYS-IN-MONTH(2)
           ELSE
               DIVIDE 100 INTO DW-WORK-YYYY GIVING DW-WORK1
                                         REMAINDER DW-WORK2
               IF (DW-WORK2 NOT = 0)
                   DIVIDE 4 INTO DW-WORK-YYYY GIVING DW-WORK1
                                           REMAINDER DW-WORK2
                   IF (DW-WORK2 = 0)
                       MOVE 29 TO DW-DAYS-IN-MONTH(2).
      *
           IF (DW-WORK-DD > DW-DAYS-IN-MONTH(DW-WORK-MM))
               MOVE DW-DAYS-IN-MONTH(DW-WORK-MM) TO DW-WORK-DD.
      *
       001700-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *       S U B T R A C T   Y E A R S   F R O M   A   D A T E      *
      *                                                                *
      *                                                                *
      *    WHEN GIVEN ANY DATE AND A NUMBER OF YEARS THIS ROUTINE      *
      *    WILL SUBTRACT THE NUMBER OF YEARS FROM THE DATE.            *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <DATE>  TO DW-WORK-YYYYMMDD.                   *
      *            MOVE <YEARS> TO DW-YEARS.                           *
      *            PERFORM 001800-SUBTRACT-YEARS                       *
      *               THRU 001800-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WORK-YYYYMMDD = DATE AFTER YEARS SUBTRACTED      *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       001800-SUBTRACT-YEARS.
      *
           SUBTRACT DW-YEARS FROM DW-WORK-YYYY.
      *
           MOVE 28 TO DW-DAYS-IN-MONTH(2).
           DIVIDE 400 INTO DW-WORK-YYYY GIVING DW-WORK1
                                     REMAINDER DW-WORK2.
           IF (DW-WORK2 = 0)
               MOVE 29 TO DW-DAYS-IN-MONTH(2)
           ELSE
               DIVIDE 100 INTO DW-WORK-YYYY GIVING DW-WORK1
                                         REMAINDER DW-WORK2
               IF (DW-WORK2 NOT = 0)
                   DIVIDE 4 INTO DW-WORK-YYYY GIVING DW-WORK1
                                           REMAINDER DW-WORK2
                   IF (DW-WORK2 = 0)
                       MOVE 29 TO DW-DAYS-IN-MONTH(2).
      *
           IF (DW-WORK-DD > DW-DAYS-IN-MONTH(DW-WORK-MM))
               MOVE DW-DAYS-IN-MONTH(DW-WORK-MM) TO DW-WORK-DD.
      *
       001800-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *            C A L C U L A T E   D A T E   O F F S E T           *
      *                                                                *
      *                                                                *
      *    ADDS A SIGNED OFFSET IN THE FORM +-YYYYMMDD TO A DATE       *
      *    IN YYYYMMDD FORM.                                           *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <DATE>   TO DW-WORK-YYYYMMDD.                  *
      *            MOVE <OFFSET> TO DW-OFFSET.                         *
      *            PERFORM 001900-CALC-OFFSET                          *
      *               THRU 001900-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WORK-YYYYMMDD DATE AFTER OFFSET APPLIED          *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       001900-CALC-OFFSET.
      *
           MOVE DW-OFFSET TO DW-OFFSET-UNSIGNED.
      *
           IF (DW-OFFSET POSITIVE)
               ADD DW-OFFSET-YYYY TO DW-WORK-YYYY
               MOVE DW-OFFSET-MM TO DW-MONTHS
               PERFORM 001500-ADD-MONTHS
                  THRU 001500-EXIT
               MOVE DW-OFFSET-DD TO DW-DAYS
               PERFORM 001300-ADD-DAYS
                  THRU 001300-EXIT
           ELSE
           IF (DW-OFFSET NEGATIVE)
               SUBTRACT DW-OFFSET-YYYY FROM DW-WORK-YYYY
               PERFORM 001920-SUBTRACT-MONTH
                  THRU 001920-EXIT
                   DW-OFFSET-MM TIMES
               MOVE DW-OFFSET-DD TO DW-DAYS
               PERFORM 001400-SUBTRACT-DAYS
                  THRU 001400-EXIT.
      *
       001900-EXIT.
           EXIT.
      *
      *
      *
       001920-SUBTRACT-MONTH.
      *
           SUBTRACT 1 FROM DW-WORK-MM.
           IF (DW-WORK-MM < 01)
               SUBTRACT 1 FROM DW-WORK-YYYY
               ADD 12 TO DW-WORK-MM.
      *
       001920-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *                   C O M P U T E   A G E                        *
      *                                                                *
      *                                                                *
      *    WHEN GIVEN THE BEGIN DATE AND END DATE THIS ROUTINE         *
      *    CALCULATES THE AGE IN YEARS, MONTHS, DAYS AND TOTAL DAYS.   *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <BEGIN DATE> TO DW-BEG-YYYYMMDD.               *
      *            MOVE <END DATE>   TO DW-END-YYYYMMDD.               *
      *            PERFORM 002000-COMPUTE-AGE                          *
      *               THRU 002000-EXIT.                                *
      *                                                                *
      *    RESULT: DW-AGE-YEARS   = WHOLE YEARS                        *
      *            DW-AGE-MONTHS  = MONTHS OVER WHOLE YEAR             *
      *            DW-AGE-DAYS    = DAYS OVER WHOLE MONTH              *
      *                                                                *
      *        (IE: AGE = YEARS + MONTHS + DAYS)                       *
      *                                                                *
      *            DW-AGE-TOTDAYS = TOTAL AGE IN DAYS                  *
      *                                                                *
      *            DW-BEG-YYYYMMDD = HAS BEEN MODIFIED                 *
      *            DW-END-YYYYMMDD = HAS BEEN MODIFIED                 *
      *                                                                *
      ******************************************************************
      *
       002000-COMPUTE-AGE.
      *
      *  ** CALCULATE AGE IN DAYS **
      *
           MOVE DW-END-YYYYMMDD TO DW-WORK-YYYYMMDD.
           PERFORM 001100-DATE-DAYS
              THRU 001100-EXIT.
           MOVE DW-DAYS TO DW-AGE-TOTDAYS.
      *
           MOVE DW-BEG-YYYYMMDD TO DW-WORK-YYYYMMDD.
           PERFORM 001100-DATE-DAYS
              THRU 001100-EXIT.
           SUBTRACT DW-DAYS FROM DW-AGE-TOTDAYS.
      *
      *  ** CALCULATE AGE IN YEARS, MONTHS & DAYS **
      *
           IF (DW-END-DD < DW-BEG-DD)
               PERFORM 002020-ROLL-DAY
                  THRU 002020-EXIT.
           COMPUTE DW-AGE-DAYS = DW-END-DD - DW-BEG-DD.
      *
           IF (DW-END-MM < DW-BEG-MM)
               PERFORM 002040-ROLL-MONTH
                  THRU 002040-EXIT.
           COMPUTE DW-AGE-MONTHS = DW-END-MM - DW-BEG-MM.
      *
           COMPUTE DW-AGE-YEARS = DW-END-YYYY - DW-BEG-YYYY.
      *
       002000-EXIT.
           EXIT.
      *
      *
      *
       002020-ROLL-DAY.
      *
           SUBTRACT 1 FROM DW-END-MM.
      *
           IF (DW-END-MM < 01)
               PERFORM 002040-ROLL-MONTH
                  THRU 002040-EXIT.
      *
           IF (DW-END-MM = 02)
               MOVE 28 TO DW-DAYS-IN-MONTH(2)
               DIVIDE 400 INTO DW-END-YYYY GIVING DW-WORK1
                                          REMAINDER DW-WORK2
               IF (DW-WORK2 = 0)
                   MOVE 29 TO DW-DAYS-IN-MONTH(2)
               ELSE
                   DIVIDE 100 INTO DW-END-YYYY GIVING DW-WORK1
                                              REMAINDER DW-WORK2
                   IF (DW-WORK2 NOT = 0)
                       DIVIDE 4 INTO DW-END-YYYY GIVING DW-WORK1
                                               REMAINDER DW-WORK2
                       IF (DW-WORK2 = 0)
                           MOVE 29 TO DW-DAYS-IN-MONTH(2).
      *
           ADD DW-DAYS-IN-MONTH(DW-END-MM) TO DW-END-DD.
      *
       002020-EXIT.
           EXIT.
      *
      *
      *
       002040-ROLL-MONTH.
      *
           SUBTRACT 1 FROM DW-END-YYYY.
      *
           ADD 12 TO DW-END-MM.
      *
       002040-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *              G R E G O R I A N   T O   J U L I A N             *
      *                                                                *
      *                                                                *
      *    CONVERTS A DATE IN GREGORIAN DATE FORM (YYYYMMDD) INTO      *
      *    JULIAN DATE FORM (YYYYDDD).                                 *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <GREGORIAN DATE> TO DW-WORK-YYYYMMDD           *
      *            PERFORM 002100-GREG-JUL                             *
      *               THRU 002100-EXIT.                                *
      *                                                                *
      *    RESULT: DW-JUL-DATE = DATE IN JULIAN DATE FORM (YYYYDDD)    *
      *                                                                *
      *            DW-WORK-YYYYMMDD = HAS BEEN MODIFIED                *
      *                                                                *
      ******************************************************************
      *
       002100-GREG-JUL.
      *
           MOVE DW-WORK-YYYY TO DW-JUL-YYYY.
      *
           PERFORM 001100-DATE-DAYS
              THRU 001100-EXIT.
      *
           MOVE DW-DAYS TO DW-WORK3.
      *
           SUBTRACT 1 FROM DW-JUL-YYYY GIVING DW-WORK-YYYY.
      *
           MOVE 12 TO DW-WORK-MM.
      *
           MOVE 31 TO DW-WORK-DD.
      *
           PERFORM 001100-DATE-DAYS
              THRU 001100-EXIT.
      *
           SUBTRACT DW-DAYS FROM DW-WORK3
               GIVING DW-JUL-DDD.
      *
       002100-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *              J U L I A N   T O   G R E G O R I A N             *
      *                                                                *
      *                                                                *
      *    CONVERTS A DATE IN JULIAN DATE FORM (YYYYDDD) INTO          *
      *    GREGORIAN DATE FORM (YYYYMMDD).                             *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <JUILAN DATE> TO DW-JUL-DATE.                  *
      *            PERFORM 002200-JUL-GREG                             *
      *               THRU 002200-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WORK-YYYYMMDD = DATE IN GREGORIAN FORM           *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       002200-JUL-GREG.
      *
           SUBTRACT 1 FROM DW-JUL-YYYY GIVING DW-WORK-YYYY.
      *
           MOVE 12 TO DW-WORK-MM.
      *
           MOVE 31 TO DW-WORK-DD.
      *
           MOVE DW-JUL-DDD TO DW-DAYS.
      *
           PERFORM 001300-ADD-DAYS
              THRU 001300-EXIT.
      *
       002200-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *     A D D   D A Y S   T O   A   D A T E,  B U S I N E S S      *
      *                                                                *
      *                                                                *
      *    WHEN GIVEN ANY DATE AND A NUMBER OF DAYS THIS ROUTINE WILL  *
      *    ADD THE NUMBER OF DAYS TO THE DATE AND RETURN THE FIRST     *
      *    BUSINESS DAY ON OR AFTER THE RESULTANT DATE.                *
      *                                                                *
      *    USAGE:  MOVE <DATE> TO DW-WORK-YYYYMMDD.                    *
      *            MOVE <DAYS> TO DW-DAYS.                             *
      *            PERFORM 002300-ADD-DAYS-BUSINESS                    *
      *               THRU 002300-EXIT.                                *
      *                                                                *
      *    RESULT: DW-WORK-YYYYMMDD = DATE AFTER DAYS ADDED            *
      *            DW-DAYS-IN-MONTH = CORRECT FOR YEAR OF THIS DATE    *
      *                                                                *
      ******************************************************************
      *
       002300-ADD-DAYS-BUSINESS.
      *
           PERFORM 001300-ADD-DAYS
              THRU 001300-EXIT.
      *
           PERFORM 001200-WEEKDAY
              THRU 001200-EXIT.
      *
           IF (DW-WEEKDAY = 7)
               MOVE 2 TO DW-DAYS
               PERFORM 001300-ADD-DAYS
                  THRU 001300-EXIT
           ELSE
           IF (DW-WEEKDAY = 1)
               MOVE 1 TO DW-DAYS
               PERFORM 001300-ADD-DAYS
                  THRU 001300-EXIT.
      *
      *  ** IF DATE IS A HOLIDAY, ADD NBR DAYS TO NEXT BUSINESS DAY **
      *
           SET DW-HT-HX TO 1.
           SEARCH DW-HT-HOLIDAYS
               WHEN (DW-HT-DATE(DW-HT-HX) = DW-WORK-YYYYMMDD)
                   MOVE DW-HT-DAYS(DW-HT-HX) TO DW-DAYS
                   PERFORM 001300-ADD-DAYS
                      THRU 001300-EXIT.
      *
       002300-EXIT.
           EXIT.
