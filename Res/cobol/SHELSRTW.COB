      /*****************************************************************
      *                                                                *
      *               S H E L L   S O R T   T A B L E                  *
      *                                                                *
      ******************************************************************
      *
       01  SORT-TABLE.
           78  ST-ELIM                 VALUE 10000.
           03  ST-ELEMENTS             VALUE SPACES.
               05  ST-ELEMENT          OCCURS ST-ELIM TIMES.
                   07  ST-ELEMENT-KEY.
                       09  ST-ENT-FLD1     PIC  9(06).
      ****             09  ST-ENT-FLD?     PIC  ?(??).
      ****         07  ST-ELEMENT-OTHER    PIC  ?(??).
      *
           03  ST-SAVE                 VALUE SPACES.
               07  ST-SAVE-KEY.
                   09  ST-SAVE-FLD1    PIC  9(06).
      ****         09  ST-SAVE-FLD?    PIC  ?(??).
      ****     07  ST-SAVE-OTHER       PIC  ?(??).
      *
           03  ST-EMAX                 PIC  9(05) BINARY VALUE 0.
           03  ST-I                    PIC  9(05) BINARY VALUE 0.
           03  ST-J                    PIC  9(05) BINARY VALUE 0.
           03  ST-K                    PIC  9(05) BINARY VALUE 0.
           03  ST-L                    PIC  9(05) BINARY VALUE 0.
           03  ST-M                    PIC  9(05) BINARY VALUE 0.
           03  ST-N                    PIC  9(05) BINARY VALUE 0.
