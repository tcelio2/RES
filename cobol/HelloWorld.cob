       Identification	division.
       Program-id.	HelloWorld	is	initial.
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.
007200 01  ITEM-1.                                                      DB2014.2
007300     02  KEY-1 PIC 99   VALUE ZERO.                               DB2014.2
007400     02  LINE-1 PIC X(6).                                         DB2014.2
007500     02  NAME-1 PIC X(30).                                        DB2014.2
007600     02  UNQUAL-NAME-1 PIC X(30).                                 DB2014.2
007700     02  SUB-1-1 PIC X(5).                                        DB2014.2
007800     02  SUB-2-1 PIC X(5).                                        DB2014.2
007900     02  SUB-3-1 PIC X(5).                                        DB2014.2
008000     02  CONTENTS-1 PIC X(30).                                    DB2014.2
008100 01  ITEM-2.                                                      DB2014.2
008200     02  KEY-2 PIC 99.                                            DB2014.2
008300     02  LINE-2 PIC X(6).                                         DB2014.2
008400     02  NAME-2 PIC X(30).                                        DB2014.2
008500     02  UNQUAL-NAME-2 PIC X(30).                                 DB2014.2
008600     02  CONTENTS-2 PIC X(30).                                    DB2014.2
       01  WS-NUM              PIC S9(6)V9(6).
       01  B                   PIC S9(10)          VALUE 7.
       01  E                   PIC S9(5)V9(5)      VALUE 34.26.
	   01    COMPUT1 USAGE COMPUTATIONAL-1.
	   01    COMPUT2 USAGE COMPUTATIONAL-2.
	   01    COMPUT11 USAGE COMPUTATIONAL-1.
	   01    COMPUT22 USAGE COMPUTATIONAL-2.
	   01    DEC1 PIC S99999V999999 VALUE 1024.1024.
	   01    DEC2 PIC S99999V999999 VALUE 1024.1024.
	   01    CHAR1. 02 CHAR12 PIC X(1).
	   01    CHAR2. 02 CHAR22 PIC X(2).
	   01    CHARN PIC X(99).
       Procedure division .
           DISPLAY "Hello World???".
           COMPUTE KEY-2 = FUNCTION LENGTH("A")	
           COMPUTE WS-NUM = FUNCTION ACOS(.999)	
           COMPUTE WS-NUM = FUNCTION MAX(4, B, E, 6.3, -2.0)		
           COMPUTE WS-NUM = FUNCTION ACOS(1 / DEC1)	
           COMPUTE WS-NUM = FUNCTION MOD(35, FUNCTION 
           INTEGER(KEY-2 * KEY-2))		
           MOVE FUNCTION MAX("A", CHARN, "J") TO CHAR12	
           MOVE X"C0" TO UNQUAL-NAME-2(KEY-2:1)   
           EXEC SQL DECLARE SQL1 CURSOR FOR
            SELECT HM.HMBRID,
            HM.BUID,
            B.NAME,
            HM.PARENTBUID,
            HM.HMBRTYPE,
            H.HID,
            H.DESCR,
            H.HTYPE,
            H.VERSIONNUM
            FROM HIERARCHYMBR HM,
            HIERARCHY H,
            BUSINESSUNIT B,
            (SELECT DISTINCT HMBRID,  LVL
            FROM HIERARCHYMBR
            CONNECT
            BY PRIOR PARENTBUID = BUID
            AND PRIOR HID = HID
            START WITH HMBRID IN (
            SELECT HM.HMBRID
            FROM HIERARCHYMBR HM,
            HMBRINVENTORY HI,
            HIERARCHY H
            WHERE HI.INVENTORYID IN (
            SELECT INVENTORYID
            FROM INVENTORY
            CONNECT BY
            PARENTINVENTORYID =
            PRIOR INVENTORYID
            START WITH
            INVENTORYID = :SV-Q-INVENTORYID)
            AND HI.HMBRID = HM.HMBRID
            AND HM.HID = H.HID
            AND H.HTYPE <> 'C')
            ) X
            WHERE HM.HID = H.HID
            AND HM.BUID = B.BUID
            AND HM.HMBRID = X.HMBRID
            ORDER BY HM.HID, X.LVL DESC
            END-EXEC
           EXEC SQL
			 SELECT SupplyPointID
			 into :CHAR2
			 FROM SupplyPointParent
			 CONNECT BY SupplyPointID = PRIOR ParentSupplyPointID
			 START WITH ParentSupplyPointID = 3910834
			END-EXEC 
           MOVE FUNCTION MAX("A", CHARN, "J") TO CHAR12.		
           COMPUTE WS-NUM = FUNCTION MAX(4, B, E, 6.3, -2.0).
           COMPUTE WS-NUM = FUNCTION MAX(4, B, E) + 2.
			EXEC SQL FOO1 1111 SSEEE END-EXEC.
           if DEC1 is = to comput22 then display 'Equual 2'.
           DISPLAY "COMpuatational1 = " COMPUT1.
           DISPLAY "COMpuatational2 = " COMPUT2.
           DISPLAY "Dec1 = " Dec1.
           DISPLAY "Dec2 = " Dec2.
           DISPLAY "Char1 = " Char1.
           DISPLAY "Char2 = " Char2.
           DISPLAY "Charn = " Charn.                                 