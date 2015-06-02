       IDENTIFICATION DIVISION.
       PROGRAM-ID.    SIMOSUB1.
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
      * Source Member: SIMOSUB1.CBL
      *****************************************************************
      *
      * SIMOSUB1 - String replacement of varying lengths.
      *
      * CALLING PROTOCOL
      * ----------------
      * Use standard procedure to RUN or ANIMATE.
      *
      * DESCRIPTION
      * -----------
      * This program provides an example of how to replace a text
      * string with is field with a text string of a different length.
      *
      *          ************
      *          * CBLREPJ1 *
      *          ********jcl*
      *               *
      *               *
      *          ************     ************
      *          * CBLREPC1 *-----* CONSOLE  *
      *          ********cbl*     ******dsply*
      *               *
      *               *
      *          ************
      *          * SIMOSUB1 *
      *          ********cbl*
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
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  I-1            pic 9(5) value 0.
       01  I-2            pic 9(5) value 0.
       01  SUB-PTR        pic 9(5) value 0.

       01  SOURCE-SIZE    pic 9(5) value 0.
       01  TARGET-SIZE    pic 9(5) value 0.

      *****************************************************************
       LINKAGE SECTION.
       COPY PASSSUB1.

      *****************************************************************
       PROCEDURE DIVISION using SUBSTITUTE-PARAMETERS .

           if  SUB-SEARCH-LENGTH = SUB-REPLACE-LENGTH
               move SUB-BUFFER-SOURCE to SUB-BUFFER-TARGET
               inspect SUB-BUFFER-TARGET replacing
                       all SUB-SEARCH-STRING(1:SUB-SEARCH-LENGTH)
                        by SUB-REPLACE-STRING(1:SUB-REPLACE-LENGTH)
           else
               perform INSPECT-AND-REPLACE-EXTENDED
           end-if

           GOBACK.

      *****************************************************************
       INSPECT-AND-REPLACE-EXTENDED.
           add length of SUB-BUFFER-SOURCE to ZERO giving SOURCE-SIZE
           add length of SUB-BUFFER-TARGET to ZERO giving TARGET-SIZE
           move SPACES to SUB-BUFFER-TARGET
           subtract SUB-PTR from SUB-PTR
           inspect SUB-BUFFER-SOURCE
               tallying    SUB-PTR
               for CHARACTERS
               before initial SUB-SEARCH-STRING(1:SUB-SEARCH-LENGTH)
           if  SUB-PTR < SOURCE-SIZE - 1
               add  1 to SUB-PTR giving I-1
               add  1 to SUB-PTR giving I-2
               move SPACES to SUB-BUFFER-TARGET
               move SUB-BUFFER-SOURCE(1:SUB-PTR) to SUB-BUFFER-TARGET
               move SUB-REPLACE-STRING(1:SUB-REPLACE-LENGTH)
                 to SUB-BUFFER-TARGET(I-2:SUB-REPLACE-LENGTH)
               add  SUB-SEARCH-LENGTH to I-1
               add  SUB-REPLACE-LENGTH to I-2
               move SUB-BUFFER-SOURCE(I-1:SOURCE-SIZE - I-1)
                 to SUB-BUFFER-TARGET(I-2:TARGET-SIZE - I-2)
           else
               move SUB-BUFFER-SOURCE to SUB-BUFFER-TARGET
           end-if
           exit.
      *****************************************************************
      *      This example is provided by SimoTime Enterprises         *
      *        Our e-mail address is: helpdesk@simotime.com           *
      *     Also, visit our Web Site at http://www.simotime.com       *
      *****************************************************************
