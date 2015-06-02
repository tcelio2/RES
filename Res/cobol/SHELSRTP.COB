      ******************************************************************
      *                                                                *
      *             S H E L L   S O R T   R O U T I N E                *
      *                                                                *
      *                      Judson D. McClendon                       *
      *                      Sun Valley Systems                        *
      *                      329 37th Court NE                         *
      *                      Birmingham, AL 35215                      *
      *                         205/853-8440                           *
      *                                                                *
      *    SORTS TABLE ST-ELEMENTS BY KEY ST-ELEMENT-KEY.              *
      *    PLACE ANY FIELDS TO BE USED AS KEYS UNDER ST-ELEMENT-KEY.   *
      *    SIGNED NUMERIC FIELDS MUST BE IN A FORMAT IN WHICH THE      *
      *    BINARY CODE IS ACCORDING TO SORT SEQUENCE, OR USE THEM      *
      *    AS THE ONLY KEY.  (E.G. IF KEY FIELD IS S9(6), ADD          *
      *    1000000 TO THE VALUE AND STORE IT AS A PIC 9(7) FIELD.)     *
      *    FOR DESCENDING FIELDS, STORE THEM WITH INVERTED COLLATING   *
      *    ORDER (E.G. FOR ALPHA FIELDS, XOR THEM WITH X"FF").         *
      *    AVOID USAGE WHERE BYTE ORDER IS REVERSED.  DISPLAY IS       *
      *    USUALLY SAFEST FOR KEY FIELDS.                              *
      *                                                                *
      *    USAGE:  <POPULATE ST-ELEMENT(1) THRU ST-ELEMENT(N)>         *
      *            MOVE <N> TO ST-EMAX.                                *
      *            PERFORM 007000-SHELLSORT                            *
      *               THRU 007000-EXIT.                                *
      *                                                                *
      *    RESULT: ST-ELEMENT(1) TO ST-ELEMENT(N) IN ASCENDING ORDER.  *
      *                                                                *
      ******************************************************************
      *
       007000-SHELLSORT.
      *
           MOVE ST-EMAX TO ST-N
                           ST-M.
      *
           PERFORM 007010-LOOPER
              THRU 007010-EXIT.
      *
       007000-EXIT.
           EXIT.
      *
      *
      *                       L O O P E R
      *
       007010-LOOPER.
      *
           IF (ST-M > 1)
               DIVIDE 2 INTO ST-M
               COMPUTE ST-K = ST-N - ST-M
               MOVE 1 TO ST-J
               PERFORM 007020-MAKE-PASS
                  THRU 007020-EXIT
               GO TO 007010-LOOPER.
      *
       007010-EXIT.
           EXIT.
      *
      *
      *                    M A K E   P A S S
      *
       007020-MAKE-PASS.
      *
           IF (ST-J NOT > ST-K)
               COMPUTE ST-L = ST-J + ST-M
               MOVE ST-ELEMENT(ST-L) TO ST-SAVE
               MOVE ST-J TO ST-I
               PERFORM 007030-SCAN
                  THRU 007030-EXIT
               MOVE ST-SAVE TO ST-ELEMENT(ST-L)
               ADD 1 TO ST-J
               GO TO 007020-MAKE-PASS.
      *
       007020-EXIT.
           EXIT.
      *
      *
      *                         S C A N
      *
       007030-SCAN.
      *
           IF (ST-ELEMENT-KEY(ST-I) > ST-SAVE-KEY)
               MOVE ST-ELEMENT(ST-I) TO ST-ELEMENT(ST-L)
               MOVE ST-I TO ST-L
               IF (ST-I > ST-M)
                   SUBTRACT ST-M FROM ST-I
                   GO TO 007030-SCAN.
      *
       007030-EXIT.
           EXIT.
