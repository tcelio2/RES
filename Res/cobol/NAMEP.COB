      ******************************************************************
      *                                                                *
      *                      N A M E   E D I T                         *
      *                                                                *
      *                      Judson D. McClendon                       *
      *                      Sun Valley Systems                        *
      *                      329 37th Court NE                         *
      *                      Birmingham, AL 35215                      *
      *                         205/853-8440                           *
      *                                                                *
      *    EDITS A NAME TO BE IN THE FORMAT:                           *
      *                                                                *
      *        LAST [, FIRST M [, PRE-TITLE [, POST-TITLE ] ] ]        *
      *                                                                *
      *    REQUIRING NO SPACE BEFORE THE COMMAS AND AT LEAST ONE       *
      *    SPACE AFTER THE COMMAS.                                     *
      *                                                                *
      *    USAGE:  MOVE <NAME> TO NAW-NAME-WORK.                       *
      *            PERFORM 006000-NAME-EDIT                            *
      *               THRU 006000-EXIT.                                *
      *                                                                *
      *    RESULT: NAW-NAME-ERROR-FLAG = 0 IF NAME IS VALID            *
      *            NAW-NAME-ERROR-FLAG = 1 IF NAME IS NOT VALID        *
      *                                                                *
      ******************************************************************
      *
       006000-NAME-EDIT.
      *
      *  ** ERROR FLAG WILL BE RESET ON GOOD EXIT **
      *
           MOVE 1 TO NAW-NAME-ERROR-FLAG.
      *
           MOVE NAW-NAME-WORK TO NAW-NAME-CHARS.
           MOVE 0 TO NAW-COMMA-COUNT.
           INSPECT NAW-NAME-CHARS
               TALLYING NAW-COMMA-COUNT FOR ALL ",".
           IF (NAW-COMMA-COUNT < 1 OR > 3)
               GO TO 006000-EXIT.
      *
           IF (NAW-COMMA-COUNT > 0)
               MOVE 1 TO NAW-TALLY
               INSPECT NAW-NAME-CHARS
                   TALLYING NAW-TALLY FOR CHARACTERS
                       BEFORE INITIAL ","
               IF (NAW-TALLY < 30)
                   SET  NAW-NCX TO NAW-TALLY
                   MOVE SPACE TO NAW-NAME-CHAR(NAW-NCX)
                   IF (NAW-NAME-CHAR(NAW-NCX + 1) NOT = SPACE)
                       OR
                      ( (NAW-NAME-CHAR(NAW-NCX + 2) = SPACE)
                         AND
                        ( (NAW-NAME-CHAR(NAW-NCX + 3) NOT = SPACE)
                           OR
                          (NAW-NAME-CHAR(NAW-NCX + 4) NOT = SPACE)
                           OR
                          (NAW-NAME-CHAR(NAW-NCX + 5) NOT = SPACE) ) )
                       GO TO 006000-EXIT.
      *
           IF (NAW-COMMA-COUNT > 1)
               MOVE 1 TO NAW-TALLY
               INSPECT NAW-NAME-CHARS
                   TALLYING NAW-TALLY FOR CHARACTERS
                       BEFORE INITIAL ","
               IF (NAW-TALLY < 30)
                   SET NAW-NCX TO NAW-TALLY
                   MOVE SPACE TO NAW-NAME-CHAR(NAW-NCX)
                   IF (NAW-NAME-CHAR(NAW-NCX + 1) NOT = SPACE)
                       OR
                      ( (NAW-NAME-CHAR(NAW-NCX + 2) = SPACE)
                         AND
                        ( (NAW-NAME-CHAR(NAW-NCX + 3) NOT = SPACE)
                           OR
                          (NAW-NAME-CHAR(NAW-NCX + 4) NOT = SPACE)
                           OR
                          (NAW-NAME-CHAR(NAW-NCX + 5) NOT = SPACE) ) )
                       GO TO 006000-EXIT.
      *
           IF (NAW-COMMA-COUNT > 2)
               MOVE 1 TO NAW-TALLY
               INSPECT NAW-NAME-CHARS
                   TALLYING NAW-TALLY FOR CHARACTERS
                       BEFORE INITIAL ","
               IF (NAW-TALLY < 30)
                   SET NAW-NCX TO NAW-TALLY
                   MOVE SPACE TO NAW-NAME-CHAR(NAW-NCX)
                   IF (NAW-NAME-CHAR(NAW-NCX + 1) NOT = SPACE)
                       OR
                      ( (NAW-NAME-CHAR(NAW-NCX + 2) = SPACE)
                         AND
                        ( (NAW-NAME-CHAR(NAW-NCX + 3) NOT = SPACE)
                           OR
                          (NAW-NAME-CHAR(NAW-NCX + 4) NOT = SPACE)
                           OR
                          (NAW-NAME-CHAR(NAW-NCX + 5) NOT = SPACE) ) )
                       GO TO 006000-EXIT.
      *
      *  ** GOOD NAME **
      *
           MOVE 0 TO NAW-NAME-ERROR-FLAG.
      *
       006000-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *                   N A M E   R E V E R S E                      *
      *                                                                *
      *                                                                *
      *    ACCEPTS A NAME IN THE FORMAT:                               *
      *                                                                *
      *        LAST [, FIRST M [, PRE-TITLE [, POST-TITLE ] ] ]        *
      *                                                                *
      *    REQUIRING NO SPACE BEFORE THE COMMAS AND AT LEAST ONE       *
      *    SPACE AFTER THE COMMAS, AND REVERSES THE NAME INTO          *
      *    NORMAL PRINTING FORM:                                       *
      *                                                                *
      *        [ PRE-TITLE ] [ FIRST M ] LAST [ POST-TITLE ]           *
      *                                                                *
      *    USAGE:  MOVE <NAME> TO NAW-NAME-WORK.                       *
      *            PERFORM 006100-NAME-REVERSE                         *
      *               THRU 006100-EXIT.                                *
      *                                                                *
      *    RESULT: NAW-NAME-WORK   = REVERSED NAME                     *
      *            NAW-SPLIT-LAST  = LAST NAME                         *
      *            NAW-SPLIT-FIRST = FIRST NAME MI                     *
      *            NAW-SPLIT-PRE   = PREFIX TITLE                      *
      *            NAW-SPLIT-POST  = SUFFIX TITLE                      *
      *                                                                *
      ******************************************************************
      *
       006100-NAME-REVERSE.
      *
           MOVE SPACES TO NAW-NAME-SPLIT.
           UNSTRING NAW-NAME-WORK
               DELIMITED BY ", "
               INTO NAW-SPLIT-LAST
                    NAW-SPLIT-FIRST
                    NAW-SPLIT-PRE
                    NAW-SPLIT-POST.
      *
           MOVE SPACES TO NAW-NAME-WORK.
           MOVE 1      TO NAW-TALLY.
      *
           IF (NAW-SPLIT-PRE NOT = SPACES)
               STRING NAW-SPLIT-PRE
                   DELIMITED BY "   "
                   INTO NAW-NAME-WORK
                       WITH POINTER NAW-TALLY
               ADD 1 TO NAW-TALLY.
      *
           IF (NAW-SPLIT-FIRST NOT = SPACES)
               STRING NAW-SPLIT-FIRST
                   DELIMITED BY "   "
                   INTO NAW-NAME-WORK
                       WITH POINTER NAW-TALLY
               ADD 1 TO NAW-TALLY.
      *
           IF (NAW-SPLIT-LAST NOT = SPACES)
               STRING NAW-SPLIT-LAST
                   DELIMITED BY "   "
                   INTO NAW-NAME-WORK
                       WITH POINTER NAW-TALLY
               ADD 1 TO NAW-TALLY.
      *
           IF (NAW-SPLIT-POST NOT = SPACES)
               IF (NAW-TALLY < 2)
                   STRING NAW-SPLIT-POST
                       DELIMITED BY "   "
                       INTO NAW-NAME-WORK
                           WITH POINTER NAW-TALLY
               ELSE
                   SUBTRACT 1 FROM NAW-TALLY
                   STRING ", " DELIMITED BY SIZE
                          NAW-SPLIT-POST
                               DELIMITED BY "   "
                       INTO NAW-NAME-WORK
                           WITH POINTER NAW-TALLY.
      *
       006100-EXIT.
           EXIT.
