      $ SET SOURCEFORMAT "FREE"
IDENTIFICATION DIVISION.
PROGRAM-ID.  IndexPopulate.
AUTHOR.  Michael Coughlan.
* Creates an indexed file  from a sequential file.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
   SELECT VideoFile ASSIGN TO "IDXVIDEO.DAT"
          ORGANIZATION IS SEQUENTIAL.

   SELECT SeqVideoFile ASSIGN TO "SEQVIDEO.DAT"
         ORGANIZATION IS SEQUENTIAL.
      

DATA DIVISION.
FILE SECTION.
FD VideoFile.
01 VideoRecord.
   02 VideoCode               PIC 9(5).
   02 VideoTitle              PIC X(40).
   02 VideoSupplierCode       PIC 99.


FD SeqVideoFile.
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
   OPEN OUTPUT SeqVideoFile.
   OPEN OUTPUT VideoFile.
   MOVE 1 TO VIDEOKEY. 
	PERFORM 100 TIMES
	MOVE VIDEOKEY  TO VIDEOCODE SeqVideoCode
	MOVE "RES Generated tile " TO  VIDEOTITLE SeqVideoTitle
	DIVIDE VIDEOKEY BY 27 GIVING VIDEOKEY2
	MOVE VIDEOKEY2 TO  VideoSupplierCode SeqVideoSupplierCode
   	WRITE SeqVideoRecord 
      WRITE VideoRecord 
    ADD 1 to videokey
   END-PERFORM.

   CLOSE VideoFile, SeqVideoFile.
   STOP RUN.
