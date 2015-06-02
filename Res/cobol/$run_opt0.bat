REM cd C:\Documents and Settings\Venkat\My Documents\My Programs\RES-TEST\test

del $run_save.log
del $err_save.log
rename  $run.log $run_save.log
rename $err.log $err_save.log
rd /S /Q save
mkdir save
move cobolprogramclasses save/
move coboldataclasses save/

java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free ACCEPT.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite Addition.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite Bubble-Sort.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite  Bubble-Sort2.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free conditions.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite DATET.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite EXEC-SQL-RUN1.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite EXEC-SQL1.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite EXEC-SQL1TEMP.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite GETNUMT.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite HelloWorld.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite HelloWorld1.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite INSPECT1.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free IterIf.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite LOANT.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite MONEYT.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite Move-Test1.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free MULTIPLIER.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite NAMET.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Perform1.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free REFMODIFICATION.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite SHELSRTT.COB >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Shortest.cob >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Acme99.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free AROMA96.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free AromaSalesRpt.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free BestSellers.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free BookshopRpt91.Cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free CSISEmailDomain.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free DateDriver.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free DayDiffDriver.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free DirectReadIdx.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free DriverProg.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free DueSubsRpt.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Fickle.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free FileConv.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free FlyByNight.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free InputSort.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free LibRoyaltyRpt.Cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free MaleSort.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Merge.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free MileageCount.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite MONEY.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free MultiplyNums.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Perform2.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Perform3.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Perform4.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free ReadRel.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free RepWriteA.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free RepWriteB.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free RepWriteFull.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free RepWriteSumm.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Seq2Index.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Seq2Rel.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free SeqInsert.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free SeqRead.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free SeqReadIdx.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free SeqReadno88.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free SeqRpt.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free SeqWrite.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free sfbymail.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Steadfast.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free STUDFEES.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free TopSupplierRpt.Cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free UnstringFileEg.cbl >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free USSRSHIP.CBL >> $run.log 2>> $err.log
java -jar ..\RES.jar -c3 -v  -opt0 -dp1 -overwrite -free Validate.cbl >> $run.log 2>> $err.log
