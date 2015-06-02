       IDENTIFICATION DIVISION.
       PROGRAM-ID.    SIMOEXEC.
       AUTHOR.        SIMOTIME ENTERPRISES.
      *****************************************************************
      * Copyright (C) 1987-2009 SimoTime Enterprises, LLC.            *
      *                                                               *
      * All rights reserved.  Unpublished, all rights reserved under  *
      * copyright law and international treaty.  Use of a copyright   *
      * notice is precautionary only and does not imply publication   *
      * or disclosure.                                                *
      *                                                               *
      * Permission to use, copy, modify and distribute this software  *
      * for any non-commercial purpose and without fee is hereby      *
      * granted, provided the SimoTime copyright notice appear on all *
      * copies of the software. The SimoTime name or Logo may not be  *
      * used in any advertising or publicity pertaining to the use    *
      * of the software without the written permission of SimoTime    *
      * Enterprises.                                                  *
      *                                                               *
      * Permission to use, copy, modify and distribute this software  *
      * for any commercial purpose requires a fee to be paid to       *
      * SimoTime Enterprises. Once the fee is received by SimoTime    *
      * the latest version of the software will be delivered and a    *
      * license will be granted for use within an enterprise,         *
      * provided the SimoTime copyright notice appear on all copies   *
      * of the software. The SimoTime name or Logo may not be used    *
      * in any advertising or publicity pertaining to the use of the  *
      * software without the written permission of SimoTime           *
      * Enterprises.                                                  *
      *                                                               *
      * SimoTime Enterprises makes no warranty or representations     *
      * about the suitability of the software for any purpose. It is  *
      * provided "AS IS" without any express or implied warranty,     *
      * including the implied warranties of merchantability, fitness  *
      * for a particular purpose and non-infringement. SimoTime       *
      * Enterprises shall not be liable for any direct, indirect,     *
      * special or consequential damages resulting from the loss of   *
      * use, data or projects, whether in an action of contract or    *
      * tort, arising out of or in connection with the use or         *
      * performance of this software                                  *
      *                                                               *
      * SimoTime Enterprises                                          *
      * 15 Carnoustie Drive                                           *
      * Novato, CA 94949-5849                                         *
      * 415.883.6565                                                  *
      *                                                               *
      * RESTRICTED RIGHTS LEGEND                                      *
      * Use, duplication, or disclosure by the Government is subject  *
      * to restrictions as set forth in subparagraph (c)(1)(ii) of    *
      * the Rights in Technical Data and Computer Software clause at  *
      * DFARS 52.227-7013 or subparagraphs (c)(1) and (2) of          *
      * Commercial  Computer Software - Restricted Rights  at 48      *
      * CFR 52.227-19, as applicable.  Contact SimoTime Enterprises,  *
      * 15 Carnoustie Drive, Novato, CA 94949-5849.                   *
      *                                                               *
      *****************************************************************
      *      This program is provided by SimoTime Enterprises         *
      *        Our e-mail address is: helpdesk@simotime.com           *
      *     Also, visit our Web Site at http://www.simotime.com       *
      *                                                               *
      *****************************************************************
      *
      *****************************************************************
      * Source Member: SIMOEXEC.CBL
      * Copy Files:    PASSLOGS.CPY
      * Calls to:      SIMOLOGS
      *****************************************************************
      *
      *   SIMOEXEC - Reads command line, calls as follows.
      *
      *   ************
      *   * SIMOEXEC *
      *   ********cbl*
      *        *
      *        *          ************
      *        *--call----* SIMOLOGS *      For NOTE Function
      *        *          ********cbl*
      *        *
      *        *          ************
      *        *--call----* SIMOUX01 *      For USER exit.
      *        *          ********cbl*
      *        *
      *        *
      *        *          ************
      *        *--call----* USERPROG *      For EXEC Function
      *        *          ********cbl*
      *        *
      *        *          ************
      *        *--X91-----*  MFSORT  *      For SORT Program
      *        *          ********utl*
      *        *
      *        *
      *   ************
      *   *   EOJ    *
      *   ************
      *
      * CALLING PROTOCOL
      * ----------------
      * Use standard Micro Focus procedure to RUN or ANIMATE.
      *
      * DESCRIPTION
      * -----------
      * This program will access the command line and process the
      * following requests.
      *
      * SIMOEXEC EXEC program-name     - Call the specified program,
      *                                  write to log file. Please note
      *                                  that programs with a STOP RUN
      *                                  will terminate the process
      *                                  without logging.
      * SIMOEXEC EXEC SORT             - Use X91 function to MFSORT.
      * SIMOEXEC NOTE message text     - display and write to log file.
      *
      *****************************************************************
      *
      * MAINTENANCE
      * -----------
      * 2003/03/04 Simmons, Created program.
      * 2003/03/04 Simmons, No changes to date.
      *
      *****************************************************************
      *
       ENVIRONMENT DIVISION.
      *****************************************************************
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *****************************************************************
      *    Data-structure for Title and Copyright...
      *****************************************************************
       01  SIM-TITLE.
           05  T1 pic X(11) value '* SIMOEXEC '.
           05  T2 pic X(34) value 'Command Line Execution Driver     '.
           05  T3 pic X(10) value ' v08.01.23'.
           05  T4 pic X(24) value ' http://www.simotime.com'.
       01  SIM-COPYRIGHT.
           05  C1 pic X(11) value '* SIMOEXEC '.
           05  C2 pic X(20) value 'Copyright 1987-2009 '.
           05  C3 pic X(28) value '  SimoTime Enterprises, LLC '.
           05  C4 pic X(20) value ' All Rights Reserved'.

      *****************************************************************
      *    Buffer used for posting messages to the console.
      *****************************************************************
       01  MESSAGE-BUFFER.
           05  MESSAGE-HEADER      pic X(11)   value '* SIMOEXEC '.
           05  MESSAGE-TEXT.
               10  MESSAGE-TEXT-1  pic X(68)   value SPACES.
               10  MESSAGE-TEXT-2  pic X(188)  value SPACES.

       COPY PASSLOGS.

      *****************************************************************
      * Data structure for calling the buffer-parsing program...      *
      *****************************************************************
       01  RMP-PARAMETERS.
           05  RMP-REQUEST         pic X       value SPACE.
           05  RMP-STATUS          pic 9(4)    value 0.
           05  RMP-DELIMITER       pic X       value SPACE.
           05  RMP-TERMINATOR      pic X       value SPACE.
           05  RMP-TERMINATOR-BYTE pic X       value SPACE.
           05  RMP-TABLE-MAX       pic 9(4)    value 16.
           05  RMP-BUFFER-SIZE     pic 9(4)    value 512.
           05  RMP-NUMBER-OF-ITEMS pic 9(4)    value 0.
           05  RMP-LAST-NON-SPACE  pic 9(4)    value 0.
           05  RMP-BUFFER          pic X(512).
           05  RMP-OFFSET          occurs 16 times
                                   pic 9(4)    value 0.
           05  RMP-LENGTH          occurs 16 times
                                   pic 9(4)    value 0.

       01  RMP-I-PTR           pic 9(4)    value 0.
       01  RMP-O-PTR           pic 9(4)    value 0.
       01  RMP-B-COUNT         pic 9(4)    value 0.

      *****************************************************************
      *    Data-structure for CALL X"91"...
      *****************************************************************
       01  X91-PSS-AREA.
           05  X91-RESULT      pic 99  comp-x value 0.
           05  X91-FUNCTION    pic 99  comp-x value 35.
           05  X91-PARAMETER.
               10  X91-LENGTH  pic 99  comp-x value 0.
               10  X91-NAME    pic X(80).

       01  SORT-COMMAND.
           05  SORT-PROG-NAME  pic X(09) value 'MFSORT   '.
           05  SORT-TAKE       pic X(13) value 'take %SYSIN% '.
           05  SORT-USE        pic X(13) value 'use %SORTIN% '.
           05  SORT-GIVE       pic X(16) value 'give %SORTOUT% '.
      *    05  SORT-GIVE-ORG   pic X(06) value 'ORG SQ'.

       01  CBL-COMMAND-LINE     pic x(256).
       01  CBL-COMMAND-LINE-LEN pic x(4)   comp-5 value 256.
       01  CBL-RUN-UNIT-ID      pic x(8)   comp-5.
       01  CBL-STACK-SIZE       pic x(4)   comp-5.
       01  CBL-FLAGS            pic x(4)   comp-5 value 128.
       01  CBL-TTY-CMD          pic x(1).
       01  CBL-TTY-CMD-LEN      pic x(4)   comp-5.
       01  CBL-STATUS-CODE      pic 9(2)   comp-5.

      *****************************************************************
       01  CMD-LINE-ACCEPT     pic X(512).
       01  CALL-STATUS         pic X       value '0'.
       01  USER-RETURN-CODE    pic 9(4)    value 0.

       01  COMMAND-REQUEST     pic X(8)    value SPACES.
       01  PROG-NAME           pic X(8)    value SPACES.
       01  PARM-BUFFER.
           05  PARM-LENGTH     pic S9(4)   comp  value 0.
           05  PARM-CONTENT    pic X(256)  value SPACES.
       01  NOTE-BUFFER         pic X(132)  value SPACES.

       01  TEMP-STRING         pic X(256)  value SPACES.
       01  TEMP-OFFSET         pic 9(5)    value 0.
       01  TEMP-LENGTH         pic 9(5)    value 0.
       01  WORK-05             pic X(5)    value SPACES.
       01  UX01-FLAG           pic X       value 'N'.
       01  SINGLE-QUOTE        pic X       value "'".

       01  PROGRAM-BEHAVIOR-FLAGS.
           05  PBF-COPYRIGHT   pic X       value 'N'.
           05  PBF-DEBUG-01    pic X       value 'N'.


       01  LOWER-CASE  pic X(26) value "abcdefghijklmnopqrstuvwxyz".
       01  UPPER-CASE  pic X(26) value "ABCDEFGHIJKLMNOPQRSTUVWXYZ".

       COPY PASSUX01.
      *****************************************************************
       PROCEDURE DIVISION.
           if  PBF-COPYRIGHT = 'Y'
               perform Z-POST-COPYRIGHT
           end-if

           perform GET-COMMAND-LINE-FUNCTION

           evaluate COMMAND-REQUEST
               when 'EXEC    ' perform EXECUTE-THE-PROGRAM
               when 'NOTE    ' perform EXECUTE-A-NOTE-REQUEST
               when other      add 16 to ZERO giving USER-RETURN-CODE
           end-evaluate

           if  COMMAND-REQUEST = 'EXEC    '
               perform END-OF-JOB
           end-if

           add USER-RETURN-CODE to ZERO giving USER-RETURN-CODE
           move ZERO to USER-RETURN-CODE

           GOBACK.

      *****************************************************************
       END-OF-JOB.
           move 'SimoEXEC' to MESSAGE-TEXT(1:8)
           if  USER-RETURN-CODE not = 0
               move 'ABENDING Program ' to SIMOLOGS-MESSAGE
               move 'SimoEXEC'             to SIMOLOGS-MESSAGE(18:8)
               move ', RC='                to SIMOLOGS-MESSAGE(26:5)
               move USER-RETURN-CODE       to SIMOLOGS-MESSAGE(31:4)
               call 'SIMOLOGS' using SIMOLOGS-PASS-AREA
           end-if
           add USER-RETURN-CODE to ZERO giving USER-RETURN-CODE
           exit.

      *****************************************************************
       ERROR-COMMAND-REQUEST.
           move 'The 1st parameter must be a Function.' to MESSAGE-TEXT
           perform Z-ABEND-PROGRAM
           exit.
      *---------------------------------------------------------------*
       ERROR-PROG-NAME.
           move 'The 2nd parameter must be Prog Name.' to MESSAGE-TEXT
           perform Z-ABEND-PROGRAM
           exit.
      *---------------------------------------------------------------*
       ERROR-PARM-STRING.
           move SPACES to PARM-CONTENT
           subtract PARM-LENGTH from PARM-LENGTH
           exit.

      *****************************************************************
       EXECUTE-A-NOTE-REQUEST.
           perform GET-COMMAND-LINE-NOTE-PARMS
           move 'NOTE'      to SIMOLOGS-REQUEST
           move SPACES      to SIMOLOGS-MESSAGE
           move NOTE-BUFFER to SIMOLOGS-MESSAGE
           call 'SIMOLOGS' using SIMOLOGS-PASS-AREA
           move '0' to CALL-STATUS
           subtract USER-RETURN-CODE from USER-RETURN-CODE
           exit.

      *****************************************************************
       EXECUTE-THE-PROGRAM.
           perform GET-COMMAND-LINE-EXEC-PARMS
           evaluate PROG-NAME
               when 'SORT    ' perform EXECUTE-THE-PROGRAM-SORT
               when OTHER      perform EXECUTE-THE-PROGRAM-100
           end-evaluate
           exit.
      *---------------------------------------------------------------*
       EXECUTE-THE-PROGRAM-100.

           move 'SIMOEXEC' to PASSUX01-REQUEST
           move ZERO       to PASSUX01-RETURN
           move PROG-NAME  to PASSUX01-PROG-NAME
           add  PARM-LENGTH to ZERO giving PASSUX01-PARM-SIZE
           move PARM-CONTENT to PASSUX01-PARM-DATA
           move 'Y' to UX01-FLAG
           call 'SIMOUX01' using PASSUX01-PASS-AREA
             on exception
                move 'N' to UX01-FLAG
           end-call

           if  UX01-FLAG = 'Y'
               move PASSUX01-PROG-NAME to PROG-NAME
               add  PASSUX01-PARM-SIZE to ZERO giving PARM-LENGTH
               move PASSUX01-PARM-DATA to  PARM-CONTENT
           end-if

           move 'NOTE'              to SIMOLOGS-REQUEST
           move T1 to SIMOLOGS-MESSAGE
           move 'Starting Program ' to SIMOLOGS-MESSAGE(12:17)
           move PROG-NAME           to SIMOLOGS-MESSAGE(29:8)
           if  PARM-LENGTH > 0
               move ', ' to SIMOLOGS-MESSAGE(37:2)
               move 'PARM=' to SIMOLOGS-MESSAGE(39:5)
               move PARM-CONTENT to SIMOLOGS-MESSAGE(44:PARM-LENGTH)
           end-if
           call 'SIMOLOGS' using SIMOLOGS-PASS-AREA

           if  PBF-DEBUG-01 = 'Y'
               move 'Return from call to SimoLOGS' to MESSAGE-TEXT
               perform Z-DISPLAY-CONSOLE-MESSAGE
           end-if

           move '0' to CALL-STATUS
           call PROG-NAME using PARM-BUFFER
                on exception move '1' to CALL-STATUS
           end-call

           if  PBF-DEBUG-01 = 'Y'
               move 'Return from call to PROG-NAME' to MESSAGE-TEXT
               perform Z-DISPLAY-CONSOLE-MESSAGE
           end-if

           if  USER-RETURN-CODE not = 0
               add USER-RETURN-CODE to ZERO giving USER-RETURN-CODE
               move 'ABENDING Program ' to SIMOLOGS-MESSAGE
               move ', non-Zero return...' to SIMOLOGS-MESSAGE(35:20)
           end-if

           if  CALL-STATUS not = '0'
               add 12 to ZERO giving USER-RETURN-CODE
               move 'ABENDING Program ' to SIMOLOGS-MESSAGE
               move ', program not found.' to SIMOLOGS-MESSAGE(35:20)
           end-if

           if  USER-RETURN-CODE = 0
           and CALL-STATUS = '0'
               move ZERO to USER-RETURN-CODE
           end-if

           if  USER-RETURN-CODE = 0
               move 'NOTE'              to SIMOLOGS-REQUEST
               move T1                     to SIMOLOGS-MESSAGE
               move 'Finished Program '    to SIMOLOGS-MESSAGE(12:17)
               move PROG-NAME              to SIMOLOGS-MESSAGE(29:8)
               move ', RC='                to SIMOLOGS-MESSAGE(37:5)
               move USER-RETURN-CODE       to SIMOLOGS-MESSAGE(42:4)
               call 'SIMOLOGS' using SIMOLOGS-PASS-AREA
           end-if
           exit.

      *---------------------------------------------------------------*
       EXECUTE-THE-PROGRAM-SORT.
           move 'NOTE'              to SIMOLOGS-REQUEST
           move 'Starting Program ' to SIMOLOGS-MESSAGE
           move 'SORT    '          to SIMOLOGS-MESSAGE(18:8)
           call 'SIMOLOGS' using SIMOLOGS-PASS-AREA

           perform EXECUTE-THE-PROGRAM-SORT-100
      *    perform EXECUTE-THE-PROGRAM-SORT-200

           if  USER-RETURN-CODE not = 0
               add USER-RETURN-CODE to ZERO giving USER-RETURN-CODE
               move 'ABENDING Program ' to SIMOLOGS-MESSAGE
               move ', non-Zero return...' to SIMOLOGS-MESSAGE(35:20)
           end-if
           exit.

      *---------------------------------------------------------------*
       EXECUTE-THE-PROGRAM-SORT-100.
           move SORT-COMMAND to X91-NAME
           display SORT-COMMAND upon COMMAND-LINE
           CALL X'91' using X91-RESULT
                            X91-FUNCTION
                            X91-PARAMETER
           add X91-RESULT to ZERO giving USER-RETURN-CODE
           exit.

      *---------------------------------------------------------------*
       EXECUTE-THE-PROGRAM-SORT-200.
      *    display SORT-COMMAND upon COMMAND-LINE
           move SORT-COMMAND to CBL-COMMAND-LINE
           call 'CBL_EXEC_RUN_UNIT' using        CBL-COMMAND-LINE
                                         CBL-COMMAND-LINE-LEN
                                    by reference CBL-RUN-UNIT-ID
                                        CBL-STACK-SIZE
                                                 CBL-FLAGS
                                    by reference CBL-TTY-CMD
                                        CBL-TTY-CMD-LEN
                                    returning    CBL-STATUS-CODE
           add CBL-STATUS-CODE to ZERO giving USER-RETURN-CODE
           exit.

      *****************************************************************
       GET-COMMAND-LINE-FUNCTION.
           accept  CMD-LINE-ACCEPT       from COMMAND-LINE
           move SPACES to PROG-NAME
                          TEMP-STRING

           move CMD-LINE-ACCEPT to RMP-BUFFER
           perform PARSE-BUFFER

           if  RMP-OFFSET(1) > 0
           and RMP-LENGTH(1) > 0
           and RMP-LENGTH(1) < 9
               move RMP-BUFFER(RMP-OFFSET(1):RMP-LENGTH(1))
                 to COMMAND-REQUEST
               inspect COMMAND-REQUEST
                       converting LOWER-CASE to UPPER-CASE
           else
               perform ERROR-COMMAND-REQUEST
           end-if
           exit.

      *****************************************************************
       GET-COMMAND-LINE-EXEC-PARMS.
           if  RMP-OFFSET(2) > 0
           and RMP-LENGTH(2) > 0
           and RMP-LENGTH(2) < 9
               move RMP-BUFFER(RMP-OFFSET(2):RMP-LENGTH(2))
                 to PROG-NAME
           else
               perform ERROR-PROG-NAME
           end-if

           if  RMP-OFFSET(3) > 0
           and RMP-LENGTH(3) > 0
           and RMP-LENGTH(3) < 256
      *!       recalculate lentgh to end-of-buffer
               subtract RMP-OFFSET(3) from RMP-BUFFER-SIZE
                 giving RMP-LENGTH(3)
               add 1 to RMP-LENGTH(3)
               move SPACES to TEMP-STRING
               move RMP-BUFFER(RMP-OFFSET(3):RMP-LENGTH(3))
                 to TEMP-STRING
               move TEMP-STRING(1:5) to WORK-05
               inspect WORK-05 converting LOWER-CASE to UPPER-CASE
               if  WORK-05 = 'PARM='
                   perform PARM-STRING-PROCESS
               else
                   perform ERROR-PARM-STRING
               end-if
           else
               perform ERROR-PARM-STRING
           end-if
           exit.

      *****************************************************************
       GET-COMMAND-LINE-NOTE-PARMS.
           move SPACES to NOTE-BUFFER
           if  RMP-OFFSET(2) > 0
           and RMP-LENGTH(2) > 0
           and RMP-LENGTH(2) < 256
      *!       recalculate lentgh to end-of-buffer
               subtract RMP-OFFSET(2) from RMP-BUFFER-SIZE
                 giving RMP-LENGTH(2)
               add 1 to RMP-LENGTH(2)
               if  RMP-LENGTH(2) > 132
                   add 132 to ZERO giving RMP-LENGTH(2)
               end-if
               move RMP-BUFFER(RMP-OFFSET(2):RMP-LENGTH(2))
                 to NOTE-BUFFER
           end-if
           exit.

      *****************************************************************
       PARM-STRING-PROCESS.
           if  TEMP-STRING(6:1) = SINGLE-QUOTE
           and TEMP-STRING(7:1) = SINGLE-QUOTE
               move SPACES to PARM-CONTENT
               subtract PARM-LENGTH from PARM-LENGTH
           else
               perform PARM-STRING-PROCESS-100
           end-if
           exit.

      *****************************************************************
       PARM-STRING-PROCESS-100.
           add 1 to ZERO giving TEMP-OFFSET
           subtract RMP-OFFSET(3) from RMP-LAST-NON-SPACE
             giving TEMP-LENGTH
           subtract 4 from TEMP-LENGTH
           if  TEMP-STRING(6:1) = SINGLE-QUOTE
               subtract 2 from TEMP-LENGTH
               add 6 to TEMP-OFFSET
           else
               add 5 to TEMP-OFFSET
           end-if
           add TEMP-LENGTH to ZERO giving PARM-LENGTH
           move TEMP-STRING(TEMP-OFFSET:TEMP-LENGTH) to PARM-CONTENT
           exit.

      *****************************************************************
       INITIALIZE-TABLE-ELEMENTS.
           move 1 to RMP-I-PTR
           move 1 to RMP-O-PTR
           perform until RMP-O-PTR > RMP-TABLE-MAX
               move 0 to RMP-OFFSET(RMP-O-PTR)
               move 0 to RMP-LENGTH(RMP-O-PTR)
               add  1 to RMP-O-PTR
           end-perform
           exit.

      *****************************************************************
       PARSE-BUFFER.
      *    Initialize Offset/Length tables to zero (0).
           perform INITIALIZE-TABLE-ELEMENTS
      *    Parse the Buffer.
           move 1 to RMP-O-PTR
           subtract RMP-NUMBER-OF-ITEMS from RMP-NUMBER-OF-ITEMS
           perform until RMP-I-PTR > RMP-BUFFER-SIZE
               if  RMP-BUFFER(RMP-I-PTR:1) not = SPACE
                   add RMP-I-PTR to ZERO giving RMP-LAST-NON-SPACE
               end-if
               if  RMP-BUFFER(RMP-I-PTR:1) = RMP-DELIMITER
                   add 1 to RMP-B-COUNT
                   if  RMP-B-COUNT = 1
                   and RMP-LENGTH(RMP-O-PTR) > 0
                       if  RMP-O-PTR < RMP-TABLE-MAX
                           add 1 to RMP-O-PTR
                           add 1 to RMP-NUMBER-OF-ITEMS
                       else
                           move RMP-BUFFER-SIZE to RMP-I-PTR
                       end-if
                   end-if
               else
                   subtract RMP-B-COUNT from RMP-B-COUNT
                   add 1 to RMP-LENGTH(RMP-O-PTR)
                   if  RMP-LENGTH(RMP-O-PTR) = 1
                       move RMP-I-PTR to RMP-OFFSET(RMP-O-PTR)
                   end-if
               end-if
               add 1 to RMP-I-PTR
               if  RMP-TERMINATOR = 'Y'
               and RMP-I-PTR  not > RMP-BUFFER-SIZE
               and RMP-BUFFER(RMP-I-PTR:1) = RMP-TERMINATOR-BYTE
                   add RMP-BUFFER-SIZE to 1 giving RMP-I-PTR
               end-if
           end-perform
           if  RMP-OFFSET(RMP-O-PTR) = 0
               subtract 1 from RMP-O-PTR
           end-if
           subtract USER-RETURN-CODE from USER-RETURN-CODE
           exit.

      *****************************************************************
      * The following Z-Routines perform administrative tasks
      *****************************************************************

      *****************************************************************
      * ABEND the program, post a message to the console and issue    *
      * a STOP RUN.                                                   *
      *****************************************************************
       Z-ABEND-PROGRAM.
           if  MESSAGE-TEXT not = SPACES
               perform Z-DISPLAY-CONSOLE-MESSAGE
           end-if
           move 'PROGRAM-IS-ABENDING...'  to MESSAGE-TEXT
           perform Z-DISPLAY-CONSOLE-MESSAGE
           add 12 to ZERO giving USER-RETURN-CODE
           STOP RUN
           exit.

      *****************************************************************
      * Display CONSOLE messages...                                   *
      *****************************************************************
       Z-DISPLAY-CONSOLE-MESSAGE.
           if MESSAGE-TEXT-2 = SPACES
               display MESSAGE-BUFFER(1:79) upon console
           else
               display MESSAGE-BUFFER upon console
           end-if
           move all SPACES to MESSAGE-TEXT
           exit.

      *****************************************************************
       Z-POST-COPYRIGHT.
           display SIM-TITLE     upon console
           display SIM-COPYRIGHT upon console
           exit.

      *****************************************************************
      *      This example is provided by SimoTime Enterprises         *
      *        Our e-mail address is: helpdesk@simotime.com           *
      *     Also, visit our Web Site at http://www.simotime.com       *
      *****************************************************************
