      *****************************************************************
      *     Data Structure or Pass Area used for calling SIMOSUB1.    *
      *****************************************************************
      *         Copyright (C) 1987-2005 SimoTime Enterprises          *
      *                     All Rights Reserved                       *
      *****************************************************************
      *              Provided by SimoTime Enterprises                 *
      *        Our e-mail address is: helpdesk@simotime.com           *
      *     Also, visit our Web Site at http://www.simotime.com       *
      *****************************************************************
      * SUB-BUFFER-SOURCE  - This field contains the text with data   *
      *                      to be replaced. This field is not        *
      *                      modified by the SimoSUB1 routine.        *
      * SUB-BUFFER-TARGET  - This field contains the text with data   *
      *                      that will be modified by the SimoSUB1    *
      *                      routine.                                 *
      * SUB-SEARCH-STRING  - This field contains the text string for  *
      *                      the search value.                        *
      * SUB-REPLACE-STRING - This field contains the text string for  *
      *                      the replace value.                       *
      * SUB-SEARCH-LENGTH  - This field defines the length of the     *
      *                      search string.                           *
      * SUB-REPLACE-LENGTH - This field defines the length of the     *
      *                      replace value.                           *
      *****************************************************************
       01  SUBSTITUTE-PARAMETERS.
           05  SUB-BUFFER-SOURCE    pic X(1024).
           05  SUB-BUFFER-TARGET    pic X(1024).
           05  SUB-SEARCH-STRING    pic X(128).
           05  SUB-REPLACE-STRING   pic X(128).
           05  SUB-SEARCH-LENGTH    pic 9(3).
           05  SUB-REPLACE-LENGTH   pic 9(3).
      *!   PASSSUB1 - End-of-Copy File...
