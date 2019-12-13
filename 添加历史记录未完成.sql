# 1 修改单号 加入历史记录。

START TRANSACTION; 
UPDATE es_video_main SET businessno='13b3a69b-0d77-4099-bb30-d885717a87ed' WHERE businessno='4b4a8e55-e397-4f54-a105-ce3b80d7f13e'; 
COMMIT;

START TRANSACTION; 
UPDATE es_video_pages SET businessno='13b3a69b-0d77-4099-bb30-d885717a87ed' WHERE businessno='4b4a8e55-e397-4f54-a105-ce3b80d7f13e'; 
COMMIT;

START TRANSACTION; 
UPDATE es_qc_main SET doccode='1132431010406717,1132431010406718，1132431010406719' WHERE businessno='13b3a69b-0d77-4099-bb30-d885717a87ed'; 
COMMIT;

START TRANSACTION; 
INSERT INTO es_video_main_his (UUID,docid, doccode, businessno, beforebusinessno, channel, busstype, "SUBTYPE","TYPE", numpages, 
    agentid, agentname, company, risktypecode, appntname, appntidtype, appntidno, appntbirthday, 
    appntadress, appntsex, appntage, insuredname, insuredtype, insuredno, insuredbirthday, 
    insuredadress, insuredsex, insuredage, polapplydate, STATUS, verdict, qcoperator, 
    create_date, modify_date,"OPERATOR", mangcode, requestid,appntidimg,insuredimg,
    isrequired,uploaddate,uploadtime,recdate, rectime,uploadcount,qcrecordcount,
    "RESOURCE",datatype)
SELECT 'TEST2121212212',a.* FROM (
SELECT docid, doccode, businessno, beforebusinessno, channel, busstype, "SUBTYPE", "TYPE", numpages, 
    agentid, agentname, company, risktypecode, appntname, appntidtype, appntidno, appntbirthday, 
    appntadress, appntsex, appntage, insuredname, insuredtype, insuredno, insuredbirthday, 
    insuredadress, insuredsex, insuredage, polapplydate, STATUS, verdict, qcoperator, 
    create_date, modify_date, "OPERATOR", mangcode, requestid,appntidimg,insuredimg,
    isrequired,uploaddate,uploadtime,recdate, rectime,uploadcount,qcrecordcount,
    "RESOURCE",datatype FROM es_video_main WHERE businessno='13b3a69b-0d77-4099-bb30-d885717a87ed'
) a; 
COMMIT;

START TRANSACTION;
INSERT INTO es_video_pages_his (UUID,pageid, docid, hostname, businessno, busstype, "SUBTYPE", filetype, url, pagename, 
    pagesuffix, imgtimepoint, describeid, recdate, rectime, recduration, create_date, 
    modify_date, "OPERATOR", picpathftp, picftp,requestid,viocetext,filesize)
SELECT 'TEST1313131313',a.* FROM (
SELECT pageid, docid, hostname, businessno, busstype, "SUBTYPE", filetype, url, pagename, 
    pagesuffix, imgtimepoint, describeid, recdate, rectime, recduration, create_date, 
    modify_date, "OPERATOR", picpathftp, picftp,requestid,viocetext,filesize 
    FROM es_video_pages WHERE businessno='13b3a69b-0d77-4099-bb30-d885717a87ed'
) a;
COMMIT;

# 如果状态是已经通过的需要修改此表，如果未质检，则不需要修改此表。
START TRANSACTION;
UPDATE es_message_sink SET qcConclusion='2',isupload='0' WHERE prtno='1132431010406717';
COMMIT;

#删除main表中的数据
START TRANSACTION;
 DELETE FROM es_video_main WHERE businessno='13b3a69b-0d77-4099-bb30-d885717a87ed';
  COMMIT;

START TRANSACTION;
 DELETE FROM es_video_pages WHERE businessno='13b3a69b-0d77-4099-bb30-d885717a87ed'; 
 COMMIT;

# 删除质检表记录
START TRANSACTION; 
DELETE FROM es_qc_point WHERE businessno='4b4a8e55-e397-4f54-a105-ce3b80d7f13e';
 COMMIT;

START TRANSACTION; 
DELETE FROM es_qc_main WHERE businessno='4b4a8e55-e397-4f54-a105-ce3b80d7f13e';
 COMMIT;
 
 