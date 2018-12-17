INSERT INTO VIOLATION SELECT ID_SEQ.NEXTVAL,REPORTID_SEQ.NEXTVAL, OBJECT_NAME ,'' FROM DBA_OBJECTS

DECLARE
  l_blob BLOB; 
  v_src_loc  BFILE := BFILENAME('IMAGE_FILES', 'test.mp4');
  v_amount   INTEGER;
BEGIN
  INSERT INTO violation (name,content )
  VALUES ('test_blob', empty_blob()) RETURN content INTO l_blob; 
  DBMS_LOB.OPEN(v_src_loc, DBMS_LOB.LOB_READONLY);
  v_amount := DBMS_LOB.GETLENGTH(v_src_loc);
  DBMS_LOB.LOADFROMFILE(l_blob, v_src_loc, v_amount);
  DBMS_LOB.CLOSE(v_src_loc);
  COMMIT;
END;
/

  INSERT INTO violation (name,content )
  VALUES ('test_blob', empty_blob())
  
  delete violation where name='test_blob'
  
  select * from violation where name='test_blob'
  
  update violation set content=(select content from violation where name='test_blob') where rownum<2000
  drop table new_seq ;
  create table newOLD_IDOLD_ID_seq as select rownum as new_id, report_id as old_id from (select report_id  from violation order by report_id)
  
  select * from new_seq
  drop table violation
  
  DROP TABLE "SEQ_SHIFT"."VIOLATION" CASCADE CONSTRAINTS PURGE;

Truncate table SEQ_SHIFT.VIOLATION purge materialized view log drop all storage Cascade;


create table violation_2 as  select id, new_id,  name,content from violation a, new_seq b where a.report_id=b.old_id order by new_id

update (select id, new_id , report_id , name,content from violation a, new_seq b where a.report_id=b.old_id) set report_id=new_id;

latch: cache buffers chains