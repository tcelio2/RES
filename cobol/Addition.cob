000800 Identification division.
000810*>=============================
000820 Program-id. Addition is initial.
000840 Data division.
       WORKING-STORAGE SECTION.    
       77  SUMA PIC 9(12).    
       77  NUMA PIC 9(12).    
       77  NUMB PIC 9(12).   
       77  NUMTMP PIC 9(12).    
000870 Linkage section.
000920 Procedure division.
       Mainline.
             DISPLAY "Enter NUmber a" WITH NO ADVANCING.
             ACCEPT NUMA.
 	       DISPLAY "Enter NUmber b" WITH NO ADVANCING.
 	       ACCEPT NUMB.
	       COMPUTE SUMA=0
	       COMPUTE NUMTMP=0
	       ADD NUMA TO NUMTMP
	       ADD NUMB TO NUMTMP
	       COMPUTE SUMA=NUMTMP
	       DISPLAY "SUM OF NUMBERS : " SUMA.
