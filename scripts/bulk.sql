/* Formatted on 2018/12/15 21:11:21 (QP5 v5.318) */
DECLARE
    CURSOR c1
    IS
          SELECT NEW_ID, OLD_ID
            FROM NEW_SEQ
        ORDER BY OLD_ID;
    --int limit_in :=1000;
    TYPE t1 IS TABLE OF INT;

    new_c   t1;
    old_c   t1;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 BULK COLLECT INTO new_c, old_c LIMIT 1000;
        FORALL indx IN new_c.FIRST .. new_c.LAST
            UPDATE violation
               SET report_id = new_c (indx)
             WHERE report_id = old_c (indx);
        COMMIT;
    END LOOP;
    CLOSE c1;
END;
/