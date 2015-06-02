000700 Identification division.
000710*>=======================
000720 Program-id. Bubble-Sort is initial.
000740 Data division.
       WORKING-STORAGE SECTION.
       01  DATA1.
           02 DUMMY-ELEMENT PIC X(100).
           02 FILLER OCCURS 10240 TIMES.
              COPY SORT-ELEMENT3.
       77  COUNT1 PIC 9(12) COMP VALUE 1.
       77  TEMP1 PIC 9(12) COMP VALUE 2.
       77  TEMP2 PIC 9(12) COMP VALUE 3.
       77  TEMP3 PIC 9(12) COMP VALUE 4.
       77  BEGIN PIC 9(12) COMP VALUE 4.
       77  FINISH PIC 9(12) COMP VALUE 4.
       01  TEMP-ELEMENT.
           COPY SORT-ELEMENT3.
000770 Linkage section.
000820 Procedure division .
       Mainline.
            Accept BEGIN from Time.
            DISPLAY "Enter number of elements to Sort(less than 20)"
                    WITH NO ADVANCING.
            compute count1=10240.
            IF count1 <= 0 THEN
               next sentence
            else
               if count1 > 10240 then
                   go to Mainline
               else
                   Perform Input-Elements
                   Perform Sort-Elements
                end-if
             end-if.
             Accept finish from Time.
             compute finish=finish - BEGIN.
             Display "Time Taken: ", finish, "ms".
            Stop run.
       Input-Elements.
           COMPUTE TEMP1 = 1
           Perform count1 times
                   compute ELEMENT1 of data1(temp1)=-temp1
                   Move zeros to element2 of data1(temp1)
                   Move spaces to element3 of  data1(temp1)
                   ADD 1 TO TEMP1
                   DISPLAY " " 
           END-PERFORM.

           COMPUTE TEMP1=1
           Display "You Entered the following " count1 
                    "number of elements".
           Display '(' with no advancing
           Perform count1 times 
                   Display "(", ELEMENT1 of data1 (temp1)
                       with no advancing
                   Display ",", ELEMENT2 of data1 (temp1)
                       with no advancing
                   Display ",", ELEMENT3 of data1 (temp1)
                       with no advancing
                   if temp1 not = count1  
                      display '),' 
                   ADD 1 TO TEMP1
           END-PERFORM.
           Display ')'.
       Sort-Elements.
           Perform varying temp1 from 1 by 1 until temp1 > count1
               COMPUTE temp3=temp1 + 1
               perform varying temp2 from temp3 by 1 
                  until temp2>count1
	               if ELEMENT1 of data1 (temp2) less than 
	                   ELEMENT1 of data1 (temp1) then
	                   MOVE ELEMENT of data1 (temp2) TO ELEMENT 
	                      of temp-element
	                   MOVE ELEMENT of data1 (temp1) TO 
	                      ELEMENT of data1 (temp2) 
	                   MOVE ELEMENT of temp-element TO 
	                      ELEMENT of data1 (temp1) 
	               end-if
               end-perform
           end-perform
           COMPUTE TEMP1=1
           Display "The sorted data is " count1 
                    "number of elements".
           Display '(' with no advancing
           Perform count1 times 
                   Display "(", ELEMENT1 of data1 (temp1)
                       with no advancing
                   Display ",", ELEMENT2 of data1 (temp1)
                       with no advancing
                   Display ",", ELEMENT3 of data1 (temp1)
                       with no advancing
                   if temp1 not = count1  
                      display '),' 
                   ADD 1 TO TEMP1
           END-PERFORM.
           Display '))'.
           