      $ SET SOURCEFORMAT "FREE"
IDENTIFICATION DIVISION.
PROGRAM-ID.  IndexTest.
AUTHOR.  Michael Coughlan.
* Creates an indexed file  from a sequential file.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
   SELECT VideoFile ASSIGN TO "IDXVIDEO.DAT"
          ORGANIZATION IS INDEXED.

*   SELECT SeqVideoFile ASSIGN TO "SEQVIDEO.DAT"
*         ORGANIZATION IS SEQUENTIAL.
      

DATA DIVISION.
FILE SECTION.
FD VideoFile.
01 VideoRecord.
   02 VideoCode               PIC 9(5).
   02 VideoTitle              PIC X(40).
   02 VideoSupplierCode       PIC 99.


*FD SeqVideoFile.
01 SeqVideoRecord.
   02 SeqVideoCode            PIC 9(5).
   02 SeqVideoTitle           PIC X(40).
   02 SeqVideoSupplierCode    PIC 99.



WORKING-STORAGE SECTION.
01   VideoKEY                 PIC 9(3).
01   VideoKEY2                 PIC 9(3).
01   VideoStatus              PIC X(2).

PROCEDURE DIVISION.
Begin.
   OPEN INPUT VideoFile.
   PERFORM 100 TIMES
        READ VIDEOFILE AT END GO TO CLOSE-FILES END-READ
        DISPLAY 'videocode =' videocode
        DISPLAY 'videotitle=' videotitle
        DISPLAY 'Supplier #=' videosuppliercode
   END-PERFORM.
CLOSE-FILES.
   CLOSE VideoFile.
   STOP RUN.
