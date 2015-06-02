      ******************************************************************
      *                                                                *
      *               N U M B E R   W O R K   A R E A                  *
      *                                                                *
      ******************************************************************
      *
       01  NUMBER-WORK-AREA.
           03  NW-NBR-ERROR-FLAG       PIC  9(01).
           03  NW-WORK-NBR.
               05  NW-WORK-CHAR        OCCURS 25 TIMES
                                       INDEXED BY NW-WX
                                                  NW-WLIM.
                   07  NW-WORK-DIGIT       PIC  9(01).
           03  NW-DEC-PLACES           PIC  9(02).
           03  NW-BLD-SIGN             PIC S9(01).
           03  NW-BLD-NBR              PIC  9(12)V9(06).
           03  NW-BLD-NBR-SPLIT        REDEFINES NW-BLD-NBR.
               05  NW-BLD-INTEGER          PIC  9(12).
               05  NW-BLD-DECIMAL          PIC V9(06).
                   88  NW-RESULT-INTEGER               VALUE ZERO.
               05  NW-BLD-DEC-DIGITS       REDEFINES NW-BLD-DECIMAL.
                   07  NW-BLD-DEC-DIGIT        OCCURS 6 TIMES
                                               INDEXED BY NW-BDX
                                                          NW-BDLIM
                                                   PIC  9(01).
           03  NW-EXTRACTED-NBR        PIC S9(12)V9(06).
