      ******************************************************************
      *                                                                *
      *                 N A M E   W O R K   A R E A                    *
      *                                                                *
      ******************************************************************
      *
       01  NAME-WORK-AREA.
           03  NAW-NAME-WORK           PIC  X(34).
      *
           03  NAW-NAME-SPLIT.
               05  NAW-SPLIT-LAST      PIC  X(34).
               05  NAW-SPLIT-FIRST     PIC  X(34).
               05  NAW-SPLIT-PRE       PIC  X(34).
               05  NAW-SPLIT-POST      PIC  X(34).
      *
           03  NAW-NAME-CHARS.
               05  NAW-NAME-CHAR       OCCURS 34 TIMES
                                       INDEXED BY NAW-NCX 
                                           PIC  X(01).
      *
           03  NAW-TALLY               PIC  9(02)  COMP.
           03  NAW-COMMA-COUNT         PIC  9(02)  COMP.
           03  NAW-NAME-ERROR-FLAG     PIC  9(01)  COMP.
