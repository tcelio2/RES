      ******************************************************************
      *                                                                *
      *                      G E T   N U M B E R                       *
      *                                                                *
      *                      Judson D. McClendon                       *
      *                      Sun Valley Systems                        *
      *                      329 37th Court NE                         *
      *                      Birmingham, AL 35215                      *
      *                         205/853-8440                           *
      *                                                                *
      *    CONVERTS A NUMBER IN FREE FORMAT DISPLAY FORM:              *
      *        FOR EXAMPLE:                                            *
      *                                                                *
      *            "999,999,999,999.999999 "                           *
      *            "-999,999,999,999.999999"                           *
      *            "              -23.61   "                           *
      *            "                      4"                           *
      *            "0                      "                           *
      *            "    .000001            "                           *
      *            "0000000000123456789.10-"                           *
      *            "                       "  BLANK IS VALID = 0       *
      *                                                                *
      *    INTO FIXED NUMERIC FORM:                                    *
      *                                                                *
      *        PIC S9(12)V9(06)                                        *
      *                                                                *
      *                                                                *
      *    USAGE:  MOVE <FREE FORM NUMBER> TO NW-WORK-NBR.             *
      *            PERFORM 003000-GET-NBR                              *
      *               THRU 003000-EXIT.                                *
      *                                                                *
      *    RESULT: NW-NBR-ERROR-FLAG = 0 INPUT IS A VALID NUMBER       *
      *                                1 INPUT NOT A VALID NUMBER      *
      *                                                                *
      *       IF NW-NBR-ERROR-FLAG = 0 THEN:                           *
      *                                                                *
      *            NW-EXTRACTED-NBR  = NUMBER AS:  PIC S9(12)V9(06)    *
      *                                                                *
      *            NW-DEC-PLACES     = NUMBER OF DIGITS TO THE RIGHT   *
      *                                OF THE DECIMAL POINT (0=NONE)   *
      *                                                                *
      *            NW-BLD-SIGN       = +1 OR -1 AS:  PIC S9(01)        *
      *                                                                *
      *            NW-BLD-INTEGER    = INTEGER DIGITS AS:  PIC  9(12)  *
      *                                                                *
      *            NW-BLD-DECIMAL    = DECIMAL DIGITS AS:  PIC V9(06)  *
      *                                                                *
      ******************************************************************
      *
       003000-GET-NBR.
      *
           MOVE 0      TO NW-NBR-ERROR-FLAG.
           MOVE ZERO   TO NW-EXTRACTED-NBR.
      *
           MOVE 0      TO NW-DEC-PLACES.
           MOVE ZERO   TO NW-BLD-NBR.
           MOVE +1     TO NW-BLD-SIGN.
           SET NW-BDX  TO 1.
           SET NW-WLIM TO 25.
      *
      *  ** LOCATE LEFTMOST DIGIT OF NUMBER **
      *
           SET NW-WX  TO 1.
           SEARCH NW-WORK-CHAR
               WHEN NW-WORK-CHAR(NW-WX) NOT = SPACE
                   PERFORM 003010-DECODE-NBR
                      THRU 003010-EXIT.
      *
           IF (NW-WORK-NBR NOT = SPACES)
               MOVE 1 TO NW-NBR-ERROR-FLAG
           ELSE
               COMPUTE NW-EXTRACTED-NBR = NW-BLD-NBR * NW-BLD-SIGN.
      *
       003000-EXIT.
           EXIT.
      *
      *
      *                     DECODE NUMBER
      *
       003010-DECODE-NBR.
      *
           IF (NW-WORK-CHAR(NW-WX) = "-")
               MOVE -1    TO NW-BLD-SIGN
               MOVE SPACE TO NW-WORK-CHAR(NW-WX)
               SET NW-WX UP BY 1.
      *
           PERFORM 003020-GET-INT-PART
              THRU 003020-EXIT
               UNTIL (NW-WX > NW-WLIM).
      *
           SET NW-DEC-PLACES TO NW-BDX.
           SUBTRACT 1 FROM NW-DEC-PLACES.
      *
       003010-EXIT.
           EXIT.
      *
      *
      *               GET INTEGER PART OF NUMBER
      *
       003020-GET-INT-PART.
      *
           IF (NW-WORK-CHAR(NW-WX) NUMERIC)
               IF (NW-BLD-INTEGER > 99999999999)
                   SET NW-WX TO NW-WLIM
               ELSE
                   COMPUTE NW-BLD-INTEGER =
                       NW-BLD-INTEGER * 10 + NW-WORK-DIGIT(NW-WX)
                   MOVE SPACE TO NW-WORK-CHAR(NW-WX)
           ELSE
               IF (NW-WORK-CHAR(NW-WX) = ".")
                   MOVE SPACES TO NW-WORK-CHAR(NW-WX)
                   SET NW-WX UP BY 1
                   PERFORM 003030-GET-DEC-PART
                      THRU 003030-EXIT
                       UNTIL (NW-WX > NW-WLIM)
               ELSE
                   IF (NW-WORK-CHAR(NW-WX) = ",")
                       MOVE SPACE TO NW-WORK-CHAR(NW-WX)
                   ELSE
                       SET NW-WX TO NW-WLIM.
      *
           SET NW-WX UP BY 1.
      *
       003020-EXIT.
           EXIT.
      *
      *
      *               GET DECIMAL PART OF NUMBER
      *
       003030-GET-DEC-PART.
      *
           IF (NW-WORK-CHAR(NW-WX) NUMERIC)
               IF (NW-BDX > 6)
                   SET NW-WX  TO NW-WLIM
               ELSE
                   MOVE NW-WORK-DIGIT(NW-WX) TO NW-BLD-DEC-DIGIT(NW-BDX)
                   MOVE SPACES TO NW-WORK-CHAR(NW-WX)
                   SET NW-BDX UP BY 1
           ELSE
               IF (NW-WORK-CHAR(NW-WX) = "-")
                   MOVE -1    TO NW-BLD-SIGN
                   MOVE SPACE TO NW-WORK-CHAR(NW-WX)
                   SET NW-WX  TO NW-WLIM
               ELSE
                   SET NW-WX  TO NW-WLIM.
      *
           SET NW-WX UP BY 1.
      *
       003030-EXIT.
           EXIT.
