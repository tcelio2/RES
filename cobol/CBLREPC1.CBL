       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CBLREPC1.
       AUTHOR.        SIMOTIME ENTERPRISES.
      *****************************************************************
      * Copyright (C) 1987-2010 SimoTime Enterprises, LLC.            *
      *                                                               *
      * All rights reserved.  Unpublished, all rights reserved under  *
      * copyright law and international treaty.  Use of a copyright   *
      * notice is precautionary only and does not imply publication   *
      * or disclosure.                                                *
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
      * Permission to use, copy and modify this software for any      *
      * non-commercial purpose and without fee is hereby granted,     *
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
      * Source Member: CBLREPC1.CBL
      * Copy Files:    PASSSUB1.CPY
      * Calls to:      SIMOSUB1
      *****************************************************************
      *
      * CBLREPC1 - String replacement of varying lengths.
      *
      * CALLING PROTOCOL
      * ----------------
      * Use standard procedure to RUN or ANIMATE.
      *
      * DESCRIPTION
      * -----------
      * This program provides an example of how to replace a text
      * string within a field with a text string of a different length.
      *
      *          ************
      *          * CBLREPJ1 *
      *          ********jcl*
      *               *
      *               *
      *          ************     ************
      *          * CBLREPC1 *-----* CONSOLE  *
      *          ********cbl*     ******dsply*
      *               *  *
      *               *  *
      *               *  *        ************
      *               *  ***call*** SIMOSUB1 *
      *               *           ********cbl*
      *               *
      *               *
      *          ************
      *          *   EOJ    *
      *          ************
      *
      *****************************************************************
      *
      * MAINTENANCE
      * -----------
      * 1987/05/22 Simmons, Created program.
      * 1994/04/17 Simmons, Updated for PC.
      *
      *****************************************************************
      *
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *****************************************************************
      *    Data-structure for Title and Copyright...
      *    ------------------------------------------------------------
       01  SIM-TITLE.
           05  T1 pic X(11) value '* CBLREPC1 '.
           05  T2 pic X(34) value 'Text String Replacement           '.
           05  T3 pic X(10) value ' v06.12.04'.
           05  T4 pic X(24) value ' http://www.simotime.com'.
       01  SIM-COPYRIGHT.
           05  C1 pic X(11) value '* CBLREPC1 '.
           05  C2 pic X(20) value 'Copyright 1987-2010 '.
           05  C3 pic X(28) value '  SimoTime Enterprises, LLC '.
           05  C4 pic X(20) value ' All Rights Reserved'.

       01  SIM-THANKS-01.
           05  C1 pic X(11) value '* CBLREPC1 '.
           05  C2 pic X(32) value 'Thank you for using this sample '.
           05  C3 pic X(32) value 'by SimoTime Enterprises, LLC    '.
           05  C4 pic X(04) value '    '.

       01  SIM-THANKS-02.
           05  C1 pic X(11) value '* CBLREPC1 '.
           05  C2 pic X(32) value 'Please send comments or suggesti'.
           05  C3 pic X(32) value 'ons to helpdesk@simotime.com    '.
           05  C4 pic X(04) value '    '.

      *****************************************************************
      * Message Buffer used by the Z-DISPLAY-MESSAGE-TEXT routine.    *
      *****************************************************************
       01  MESSAGE-BUFFER.
           05  MESSAGE-HEADER      pic X(11)   value '* CBLREPC1 '.
           05  MESSAGE-TEXT.
               10  MESSAGE-TEXT-1  pic X(68)   value SPACES.
               10  MESSAGE-TEXT-2  pic X(188)  value SPACES.

       COPY PASSSUB1.

      *****************************************************************
       PROCEDURE DIVISION.
           perform Z-POST-COPYRIGHT

           perform EXAMPLE-001

           perform EXAMPLE-002

           perform EXAMPLE-003

           perform EXAMPLE-004

           perform Z-THANK-YOU.

           GOBACK.

      *****************************************************************
      *    Example 1, Replace a text string with a text string
      *    of equal size.
       EXAMPLE-001.
           move '1-Before, replace >abc< with xyz'
             to SUB-BUFFER-SOURCE
           move 'abc' to SUB-SEARCH-STRING
           move 'xyz' to SUB-REPLACE-STRING
           add 3 to ZERO giving SUB-SEARCH-LENGTH
           add 3 to ZERO giving SUB-REPLACE-LENGTH
           call 'SIMOSUB1' using SUBSTITUTE-PARAMETERS
      *    Display the contents of the Source and Target Buffers.
           move SUB-BUFFER-SOURCE(1:71) to MESSAGE-TEXT
           perform Z-DISPLAY-MESSAGE-TEXT
           inspect SUB-BUFFER-TARGET
                   replacing first 'Before, ' by 'After,  '
           move SUB-BUFFER-TARGET(1:71) to MESSAGE-TEXT
           perform Z-DISPLAY-MESSAGE-TEXT
           exit.

      *****************************************************************
      *    Example 2, Replace a text string with a text string
      *    of greater size.
       EXAMPLE-002.
           move '2-Before, replace >abc< with uvwxyz'
             to SUB-BUFFER-SOURCE
           move 'abc' to SUB-SEARCH-STRING
           move 'uvwxyz' to SUB-REPLACE-STRING
           add 3 to ZERO giving SUB-SEARCH-LENGTH
           add 6 to ZERO giving SUB-REPLACE-LENGTH
           call 'SIMOSUB1' using SUBSTITUTE-PARAMETERS
      *    Display the contents of the Source and Target Buffers.
           move SUB-BUFFER-SOURCE(1:71) to MESSAGE-TEXT
           perform Z-DISPLAY-MESSAGE-TEXT
           inspect SUB-BUFFER-TARGET
                   replacing first 'Before, ' by 'After,  '
           move SUB-BUFFER-TARGET(1:71) to MESSAGE-TEXT
           perform Z-DISPLAY-MESSAGE-TEXT
           exit.

      *****************************************************************
      *    Example 3, Replace a text string with a text string
      *    of smaller size.
       EXAMPLE-003.
           move '3-Before, replace >abc< with M' to SUB-BUFFER-SOURCE
           move 'abc' to SUB-SEARCH-STRING
           move 'M' to SUB-REPLACE-STRING
           add 3 to ZERO giving SUB-SEARCH-LENGTH
           add 1 to ZERO giving SUB-REPLACE-LENGTH
           call 'SIMOSUB1' using SUBSTITUTE-PARAMETERS
      *    Display the contents of the Source and Target Buffers.
           move SUB-BUFFER-SOURCE(1:71) to MESSAGE-TEXT
           perform Z-DISPLAY-MESSAGE-TEXT
           inspect SUB-BUFFER-TARGET
                   replacing first 'Before, ' by 'After,  '
           move SUB-BUFFER-TARGET(1:71) to MESSAGE-TEXT
           perform Z-DISPLAY-MESSAGE-TEXT
           exit.

      *****************************************************************
      *    Example 4, Replace a text string with a text string
      *    of equal size.
       EXAMPLE-004.
           move 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' to SUB-BUFFER-SOURCE
           move 'DEF' to SUB-SEARCH-STRING
           move '123' to SUB-REPLACE-STRING
           add 3 to ZERO giving SUB-SEARCH-LENGTH
           add 3 to ZERO giving SUB-REPLACE-LENGTH
           call 'SIMOSUB1' using SUBSTITUTE-PARAMETERS
      *    Display the contents of the Source and Target Buffers.
           move SUB-BUFFER-SOURCE(1:71) to MESSAGE-TEXT
           perform Z-DISPLAY-MESSAGE-TEXT
           inspect SUB-BUFFER-TARGET
                   replacing first 'Before, ' by 'After,  '
           move SUB-BUFFER-TARGET(1:71) to MESSAGE-TEXT
           perform Z-DISPLAY-MESSAGE-TEXT
           exit.

      *****************************************************************
      * The following Z-Routines perform administrative tasks         *
      * for this program.                                             *
      *****************************************************************
       Z-POST-COPYRIGHT.
           move SIM-TITLE to MESSAGE-BUFFER
           perform Z-DISPLAY-MESSAGE-TEXT
           move SIM-COPYRIGHT to MESSAGE-BUFFER
           perform Z-DISPLAY-MESSAGE-TEXT
           exit.

      *****************************************************************
      * Display CONSOLE messages...                                   *
      *****************************************************************
       Z-DISPLAY-MESSAGE-TEXT.
           if  MESSAGE-TEXT-2 = SPACES
               display MESSAGE-BUFFER(1:79) upon console
           else
               display MESSAGE-BUFFER       upon console
           end-if
           move all SPACES to MESSAGE-TEXT
           exit.

      *****************************************************************
       Z-THANK-YOU.
           move SIM-THANKS-01 to MESSAGE-BUFFER
           perform Z-DISPLAY-MESSAGE-TEXT
           move SIM-THANKS-02 to MESSAGE-BUFFER
           perform Z-DISPLAY-MESSAGE-TEXT
           exit.

      *****************************************************************
      *      This example is provided by SimoTime Enterprises         *
      *        Our e-mail address is: helpdesk@simotime.com           *
      *     Also, visit our Web Site at http://www.simotime.com       *
      *****************************************************************
