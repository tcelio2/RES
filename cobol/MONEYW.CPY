      ******************************************************************
      *                                                                *
      *                  M O N E Y   W O R K   A R E A                 *
      *                                                                *
      ******************************************************************
      *
       01  MONEY-WORK-AREA.
           88  MW-GLIM                 VALUE 5.
           03  MW-AMOUNT               PIC  9(15)V9(02).
           03  MW-AMOUNT-R             REDEFINES MW-AMOUNT.
               05  MW-AMOUNT-DOLLARS       PIC  9(15).
               05  MW-AMOUNT-DOLLARS-R     REDEFINES MW-AMOUNT-DOLLARS.
                   07  MW-AMOUNT-GROUP     OCCURS MW-GLIM TIMES
                                               PIC  9(03).
               05  MW-AMOUNT-CENTS         PIC  9(02).
      *
           03  MW-WORK                 PIC  9(03).
           03  MW-WORK-R1              REDEFINES MW-WORK.
               05  MW-WORK-HUNDREDS        PIC  9(01).
               05  MW-WORK-TENS            PIC  9(01).
               05  MW-WORK-ONES            PIC  9(01).
           03  MW-WORK-R2              REDEFINES MW-WORK.
               05      FILLER              PIC  9(01).
               05  MW-WORK-TEENS           PIC  9(02).
      *
           88  MW-MCLIM                VALUE 50.
           03  MW-MONEY.
               05  MW-MONEY-CHAR       OCCURS MW-MCLIM TIMES
                                           PIC  X(01).
           03  MW-MCX                  PIC  9(02)       COMP VALUE 0.
      *
           88  MW-MLLIM                VALUE 6.
           03  MW-MONEY-LINES.
               05  MW-MONEY-LINE       OCCURS MW-MLLIM TIMES
                                           PIC  X(MW-MCLIM).
           03  MW-MLX                  PIC  9(02)       COMP VALUE 0.
      *
           03  MW-WORD-TEXT.
               05  MW-WORD-SIZE        PIC  9(01).
               05  MW-WORD.
                   07  MW-WORD-CHAR    OCCURS 9 TIMES
                                           PIC  X(01).
           03  MW-WCX                  PIC  9(02)       COMP VALUE 0.
      *
           03  MW-GX                   PIC  9(02)       COMP VALUE 0.
           03  MW-IX1                  PIC  9(02)       COMP VALUE 0.
           03  MW-IX2                  PIC  9(02)       COMP VALUE 0.
      *
      *
           03  MW-GROUP-WORDS.
               05      FILLER  PIC  X(09)      VALUE "8TRILLION".
               05      FILLER  PIC  X(09)      VALUE "7BILLION ".
               05      FILLER  PIC  X(09)      VALUE "7MILLION ".
               05      FILLER  PIC  X(09)      VALUE "8THOUSAND".
               05      FILLER  PIC  X(09)      VALUE "         ".
      *
           03  MW-GROUP-WORD           REDEFINES MW-GROUP-WORDS
                                       OCCURS  5 TIMES
                                           PIC  X(09).
      *
      *
           03  MW-TENS-WORDS.
               05      FILLER  PIC  X(08)      VALUE "3TEN    ".
               05      FILLER  PIC  X(08)      VALUE "6TWENTY ".
               05      FILLER  PIC  X(08)      VALUE "6THIRTY ".
               05      FILLER  PIC  X(08)      VALUE "5FORTY  ".
               05      FILLER  PIC  X(08)      VALUE "5FIFTY  ".
               05      FILLER  PIC  X(08)      VALUE "5SIXTY  ".
               05      FILLER  PIC  X(08)      VALUE "7SEVENTY".
               05      FILLER  PIC  X(08)      VALUE "6EIGHTY ".
               05      FILLER  PIC  X(08)      VALUE "6NINETY ".
      *
           03  MW-TENS-WORD            REDEFINES MW-TENS-WORDS
                                       OCCURS  9 TIMES
                                           PIC  X(08).
      *
      *
           03  MW-ONES-WORDS.
               05      FILLER  PIC  X(10)      VALUE "3ONE      ".
               05      FILLER  PIC  X(10)      VALUE "3TWO      ".
               05      FILLER  PIC  X(10)      VALUE "5THREE    ".
               05      FILLER  PIC  X(10)      VALUE "4FOUR     ".
               05      FILLER  PIC  X(10)      VALUE "4FIVE     ".
               05      FILLER  PIC  X(10)      VALUE "3SIX      ".
               05      FILLER  PIC  X(10)      VALUE "5SEVEN    ".
               05      FILLER  PIC  X(10)      VALUE "5EIGHT    ".
               05      FILLER  PIC  X(10)      VALUE "4NINE     ".
               05      FILLER  PIC  X(10)      VALUE "3TEN      ".
               05      FILLER  PIC  X(10)      VALUE "6ELEVEN   ".
               05      FILLER  PIC  X(10)      VALUE "6TWELVE   ".
               05      FILLER  PIC  X(10)      VALUE "8THIRTEEN ".
               05      FILLER  PIC  X(10)      VALUE "8FOURTEEN ".
               05      FILLER  PIC  X(10)      VALUE "7FIFTEEN  ".
               05      FILLER  PIC  X(10)      VALUE "7SIXTEEN  ".
               05      FILLER  PIC  X(10)      VALUE "9SEVENTEEN".
               05      FILLER  PIC  X(10)      VALUE "8EIGHTEEN ".
               05      FILLER  PIC  X(10)      VALUE "8NINETEEN ".
      *
           03  MW-ONES-WORD            REDEFINES MW-ONES-WORDS
                                       OCCURS 19 TIMES
                                           PIC  X(10).
