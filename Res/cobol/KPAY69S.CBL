       IDENTIFICATION DIVISION.
       PROGRAM-ID. KPAY69S.
       AUTHOR.			   K.C.S. LTD.
      *
      * 		   ***************************
      *                    * K-PAYE 90 VERSION # 9.0 *
      * 		   ***************************
      *
      *                        END OF YEAR STARTERS
      *
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01  CHAIN-AREA.
           03  CHAIN-LOG-INFO      PIC X(10).
           03  CHAIN-ITEM          PIC X(50)     JUST.
           03  CHAIN-KEM-USER      PIC X(4).
           03  CHAIN-USER-ID       PIC XXX.
           03  CHAIN-CO-NO         PIC XX.
           03  CHAIN-SUPP-RUN      PIC X.
           03  CHAIN-PROGRAM       PIC X(8).
           03  CHAIN-PRT-NAME      PIC X(8).
           03  CHAIN-PRT2-NAME     PIC X(8).
           03  CHAIN-PRT3-NAME     PIC X(8).
           03  CHAIN-ERROR         PIC X.
           03  CHAIN-RETURN        PIC X.
           03  CHAIN-CC-LEN        PIC 9.
           03  CHAIN-DP-LEN        PIC 9.
           03  CHAIN-EM-LEN        PIC 9.
           03  CHAIN-COUNTRY       PIC XXX.
           03  CHAIN-LOG-IND       PIC X.
           03  CHAIN-OP-SYS        PIC X.
           03  CHAIN-ATTRIBUTE     PIC X.
           03  CHAIN-PROFILE       PIC X.
           03  CHAIN-CC-LEVEL      PIC 9.
           03  CHAIN-DP-LEVEL      PIC 9.
           03  CHAIN-SECTION       PIC X.
           03  CHAIN-UNIX-PRT      PIC X.
           03  CHAIN-MODIFIER      PIC X.
           03  CHAIN-PNT-SEC       PIC X.
           03  CHAIN-ITEMR         PIC X.
           03  CHAIN-MENU          PIC X.
           03  CHAIN-SCREENS.
               05  CHAIN-SCREEN    PIC X     OCCURS 10.
           03  CHAIN-COMPANIES.
               05  CHAIN-COMPANY   PIC XX    OCCURS 10.
           03  CHAIN-SCREEN-CHARS.
               05  CHAIN-TOP-RIGHT PIC X.
               05  CHAIN-TOP-LEFT  PIC X.
               05  CHAIN-BOT-RIGHT PIC X.
               05  CHAIN-BOT-LEFT  PIC X.
               05  CHAIN-UPDOWN    PIC X.
               05  CHAIN-ACROSS    PIC X.

       COPY KPCHAIN.
       PROCEDURE DIVISION USING CHAIN-AREA.
       A-MAINLINE SECTION.
       A100.
           CALL "KPAY50S" USING CHAIN-AREA.
           CANCEL "KPAY50S".
       A999.
	   EXIT PROGRAM.
