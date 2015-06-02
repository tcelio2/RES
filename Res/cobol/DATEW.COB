      ******************************************************************
      *                                                                *
      *                 D A T E   W O R K   A R E A                    *
      *                                                                *
      ******************************************************************
      *
       01  DATE-WORK-AREA.
           03  DW-DATE-ERROR-FLAG          PIC  9(01).
      *
      *
      *  ** TODAYS DATE **
      *
           03  DW-TODAYS-DATE              PIC  9(08).
           03  DW-TODAYS-DATE-ALPHA        REDEFINES DW-TODAYS-DATE.
               05  DW-TODAYS-MONTH             PIC  9(02).
               05  DW-TODAYS-DAY               PIC  9(02).
               05  DW-TODAYS-YEAR              PIC  9(04).
      *
           03  DW-TODAYS-YYYYMMDD          PIC  9(08).
           03  DW-TODAYS-YYYYMMDD-ALPHA    REDEFINES DW-TODAYS-YYYYMMDD.
               05  DW-TODAYS-YYYY              PIC  9(04).
               05  DW-TODAYS-YYYY-R            REDEFINES DW-TODAYS-YYYY.
                   07  DW-TODAYS-CC                PIC  9(02).
                   07  DW-TODAYS-YY                PIC  9(02).
               05  DW-TODAYS-MM                PIC  9(02).
               05  DW-TODAYS-DD                PIC  9(02).
      *
      *
      *  ** DATE WORK AREA **
      *
           03  DW-WORK-DATE                PIC  9(08).
           03  DW-WORK-DATE-ALPHA          REDEFINES DW-WORK-DATE.
               05  DW-WORK-MONTH               PIC  9(02).
               05  DW-WORK-DAY                 PIC  9(02).
               05  DW-WORK-YEAR                PIC  9(04).
      *
           03  DW-WORK-YYYYMMDD            PIC  9(08).
           03  DW-WORK-YYYYMMDD-ALPHA      REDEFINES DW-WORK-YYYYMMDD.
               05  DW-WORK-YYYY                PIC  9(04).
               05  DW-WORK-YYYY-R              REDEFINES DW-WORK-YYYY.
                   07  DW-WORK-CC                  PIC  9(02).
                   07  DW-WORK-YY                  PIC  9(02).
               05  DW-WORK-MM                  PIC  9(02).
               05  DW-WORK-DD                  PIC  9(02).
      *
      *
      *  ** SHORT MMDDYY DATE **
      *
           03  DW-SHORT-DATE               PIC  9(06).
           03  DW-SHORT-DATE-ALPHA         REDEFINES DW-SHORT-DATE.
               05  DW-SHORT-MONTH              PIC  9(02).
               05  DW-SHORT-DAY                PIC  9(02).
               05  DW-SHORT-YEAR               PIC  9(02).
      *
      *
      *  ** OFFSET DATE AREAS **
      *
           03  DW-OFFSET                   PIC S9(08).
      *
           03  DW-OFFSET-UNSIGNED          PIC  9(08).
           03  DW-OFFSET-UNSIGNED-ALPHA    REDEFINES DW-OFFSET-UNSIGNED.
               05  DW-OFFSET-YYYY              PIC  9(04).
               05  DW-OFFSET-MM                PIC  9(02).
               05  DW-OFFSET-DD                PIC  9(02).
      *
      *
      *  ** JULIAN DATE **
      *
           03  DW-JUL-DATE                 PIC  9(07).
           03  DW-JUL-DATE-ALPHA           REDEFINES DW-JUL-DATE.
               05  DW-JUL-YYYY                 PIC  9(04).
               05  DW-JUL-YYYY-R               REDEFINES DW-JUL-YYYY.
                   07  DW-JUL-CC                   PIC  9(02).
                   07  DW-JUL-YY                   PIC  9(02).
               05  DW-JUL-DDD                  PIC  9(03).
      *
      *
      *  ** BEGIN DATE **
      *
           03  DW-BEG-YYYYMMDD             PIC  9(08).
           03  DW-BEG-YYYYMMDD-ALPHA       REDEFINES DW-BEG-YYYYMMDD.
               05  DW-BEG-YYYY                 PIC  9(04).
               05  DW-BEG-YYYY-R               REDEFINES DW-BEG-YYYY.
                   07  DW-BEG-CC                   PIC  9(02).
                   07  DW-BEG-YY                   PIC  9(02).
               05  DW-BEG-MM                   PIC  9(02).
               05  DW-BEG-DD                   PIC  9(02).
      *
      *
      *  ** END DATE **
      *
           03  DW-END-YYYYMMDD             PIC  9(08).
           03  DW-END-YYYYMMDD-ALPHA       REDEFINES DW-END-YYYYMMDD.
               05  DW-END-YYYY                 PIC  9(04).
               05  DW-END-YYYY-R               REDEFINES DW-END-YYYY.
                   07  DW-END-CC                   PIC  9(02).
                   07  DW-END-YY                   PIC  9(02).
               05  DW-END-MM                   PIC  9(02).
               05  DW-END-DD                   PIC  9(02).
      *
      *
      *  ** RESULTS OF AGE COMPUTATION **
      *
           03  DW-AGE-YEARS                PIC  9(04).
           03  DW-AGE-MONTHS               PIC  9(02).
           03  DW-AGE-DAYS                 PIC  9(02).
           03  DW-AGE-TOTDAYS              PIC  9(08).
      *
      *
      *  ** INPUT/OUTPUT VARIABLES **
      *
           03  DW-YEARS                    PIC S9(07).
           03  DW-MONTHS                   PIC S9(07).
           03  DW-DAYS                     PIC S9(07).
           03  DW-WEEKDAY                  PIC  9(01).
      *
      *
      *  ** SCRATCH WORK AREAS FOR DATE ROUTINES   **
      *  ** (ASSUME MODIFIED BY ALL DATE ROUTINES) **
      *
           03  DW-WORK1                    PIC S9(09).
           03  DW-WORK2                    PIC S9(09).
           03  DW-WORK3                    PIC S9(09).
           03  DW-TEMP-YYYY                PIC S9(09).
           03  DW-TEMP-MM                  PIC S9(09).
      *
      *
      *  ** NUMBER OF DAYS IN EACH MONTH                     **
      *  ** (DAYS IN FEBRUARY ARE ADJUSTED BY DATE ROUTINES) **
      *
           03  DW-DAYS-IN-MONTHS   VALUE "312831303130313130313031".
               05  DW-DAYS-IN-MONTH        OCCURS 12 TIMES
                                               PIC  9(02).
      *
      *
      *  ** HOLIDAY TABLE **
      *
      *  ** THIS TABLE CONTAINS EVERY HOLIDAY ON WHICH THE BUSINESS **
      *  ** OFFICE IS CLOSED.  IT SHOULD BE UPDATED EVERY YEAR TO   **
      *  ** INCLUDE ALL THE DATES OVER WHICH BUSINESS DAYS MIGHT    **
      *  ** NEED TO BE CALCULATED.  NO NEED TO ADD WEEKEND DATES.   **
      *
      *  ** THE ENTRIES IN THIS TABLE CONSIST OF AN 8-DIGIT DATE    **
      *  ** (YYYYMMDD), FOLLOWED BY A 2-DIGIT COUNT OF DAYS WHICH   **
      *  ** MUST BE ADDED TO THE DATE TO GET THE NEXT BUSINESS DAY. **
      *
      *  ** EXAMPLE: THANKSGIVING, 1997, OFF THURSDAY 11/27 AND     **
      *  ** FRIDAY 11/28 UNTIL THE NEXT MONDAY 11/31.  THE ENTRIES  **
      *  ** IN THE TABLE WOULD BE: 1997 11 27 04 AND 1997 11 28 03  **
      *
      *  ** EXAMPLE: CHRISTMAS, 1998, OFF FRIDAY 12/25 THROUGH      **
      *  ** MONDAY 12/28 UNTIL TUESDAY 12/29.  THE ENTRIES IN THE   **
      *  ** TABLE WOULD BE: 1998 12 25 04 AND 1998 12 28 01         **
      *
           03  DW-HOLIDAY-TABLE.
               05  DW-HT-VALUES.
      *                                                     YYYYMMDDCC
                   07  FILLER              PIC  9(10) VALUE 1997112704.
                   07  FILLER              PIC  9(10) VALUE 1997112803.
                   07  FILLER              PIC  9(10) VALUE 1998122504.
                   07  FILLER              PIC  9(10) VALUE 1998122801.
      *
               05  DW-HT-HOLIDAYS          REDEFINES DW-HT-VALUES
                                           OCCURS 4 TIMES
                                           INDEXED BY DW-HT-HX.
                   07  DW-HT-DATE.
                       09  DW-HT-YYYY          PIC  9(04).
                       09  DW-HT-YYYY-R        REDEFINES DW-HT-YYYY.
                           11  DW-HT-CC            PIC  9(02).
                           11  DW-HT-YY            PIC  9(02).
                       09  DW-HT-MM            PIC  9(02).
                       09  DW-HT-DD            PIC  9(02).
                   07  DW-HT-DAYS              PIC  9(02).
