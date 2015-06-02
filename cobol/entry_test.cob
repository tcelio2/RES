       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENTRY-TEST.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SW-CLEAR-YTD-TOTALS    PIC X    VALUE "F".
       PROCEDURE DIVISION.
       0000-BEGIN.
      *    Enter here for routine processing.
          GO TO 1000-MAIN.
       ENTRY "YEAREND".
      *    Enter here for year-end processing.
          MOVE "T" TO SW-CLEAR-YTD-TOTALS.
       1000-MAIN.
      *    Update master file, optionally resetting
      *    year-to-date totals, etc.
          DISPLAY "Begin UPDATE-MASTER:  SW-CLEAR-YTD-TOTALS = ",
                  QUOTE, SW-CLEAR-YTD-TOTALS, QUOTE
      *    ...
          STOP RUN.
       END PROGRAM ENTRY-TEST.