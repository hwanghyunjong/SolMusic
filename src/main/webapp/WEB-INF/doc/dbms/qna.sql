/**********************************/
/* Table Name: qna */
/**********************************/

drop table  qna;

CREATE TABLE qna(
        qnano                  NUMBER(10)   NOT NULL    primary key,
        /*userID                VARCHAR2(100)  NOT NULL,*/
        userno                  NUMBER(10)      NOT NULL,
        qna_seqno             NUMBER(5)    DEFAULT 1     NOT NULL,
        qna_state               VARCHAR2(50) DEFAULT '�̴亯' NOT NULL,
        qna_categrpname     VARCHAR2(100) NOT NULL,
        qna_title                 VARCHAR2(300)    NOT NULL,
        qna_content            VARCHAR2(2000)    NOT NULL,
        word                                  VARCHAR2(300)         NULL ,
        grpno                    NUMBER(8)         DEFAULT 0         NOT NULL,
        indent                   NUMBER(2)         DEFAULT 0         NOT NULL,
        ansnum                  NUMBER(3)         DEFAULT 0         NOT NULL,
        qna_fname              VARCHAR2(100)    NULL ,
        qna_fupname           VARCHAR2(100)    NULL ,
        qna_thumb              VARCHAR2(100)    NULL ,
        qna_fsize                NUMBER(10)     DEFAULT 0  NULL,
        qna_rdate               DATE     NOT NULL,
     FOREIGN KEY (userno) REFERENCES users (userno)    
);

DROP SEQUENCE qna_seq;

CREATE SEQUENCE qna_seq
    START WITH 1          --���� ��ȣ
    INCREMENT BY 1      --������
    MAXVALUE 9999999999  --�ִ밪:9999999 --> NUMBER(7) ����
    CACHE 2                  --2���� �޸𸮿����� ���
    NOCYCLE;                 --�ٽ� 1���� �����Ǵ� ���� ����
    
commit;

--���
INSERT INTO qna(qnano, userno, qna_categrpname, qna_title, qna_content, qna_rdate, grpno, indent, ansnum)
VALUES(qna_seq.nextval, 1, 'pc' , 'ó�� ��', 'PC���� ����� �ȵ˴ϴ�', sysdate, (SELECT NVL(MAX(grpno), 0) + 1 FROM contents), 0, 0);

INSERT INTO qna(qnano,qna_seqno, qna_categrpname, qna_title, qna_content, qna_rdate)
VALUES(qna_seq.nextval, 2, '��Ÿ', 'ó�� ��', '��ư �۵��� �ȵ�', sysdate);

INSERT INTO qna(qnano,qna_seqno, qna_categrpname, qna_title, qna_content, qna_rdate)
VALUES(qna_seq.nextval, 3, 'pc', '�ι�° ��', 'PC���� ����� �ȵ˴ϴ�', sysdate);

commit;


-- ���
select q.qnano as q_qnano, q.userno as q_userno, q.qna_seqno as q_qna_seqno, q.qna_categrpname as q_qna_categrpname, q.qna_title as q_qna_title, q.qna_content as q_qna_content, q.qna_rdate as q_qna_rdate, q.qna_state as q_qna_state, q.qna_fname as q_qna_fname,
        u.userno as u_userno, u.userID as u_userID
from qna q, users u
WHERE q.userno = u.userno
order by qnano DESC;
   
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
           t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate        
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno = #{memberno}
ORDER BY c.cateno ASC, t.contentsno DESC


--1����ȸ
select qnano, qna_categrpname, qna_title, qna_content, qna_thumb, qna_rdate, qna_fname
from qna
where qnano = 1;

--����
UPDATE qna 
SET qna_title='��������',qna_content='���뺯��'
WHERE qnano=7;

--����
DELETE FROM qna
where qnano=1;

----------------------------------------------------------------------------------------------
�亯 ���� ����
----------------------------------------------------------------------------------------------
-- 1���� ���� �亯 ��Ͽ�: grpno: 1, indent: 1, ansnum: 1
SELECT * FROM member;
SELECT * FROM categrp;
SELECT * FROM cateno;
 
�� ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
-- ��� ���� �켱 ������ 1�� ������, 1�� -> 2��
UPDATE qna
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 0;
 
-- 2����� �켱 ������ 1�� ������, 2�� -> 3��
UPDATE qna
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 1;
 
-- 3����� �켱 ������ 1�� ������, 3�� -> 4��
UPDATE qna
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 2;
 
-- 6����� �켱 ������ 1�� ������, 6�� -> 7��
UPDATE qna
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 5;
 
 qna(qnano,qna_seqno, qna_categrpname,qna_email, qna_title, qna_content, qna_rdate, grpno, indent, ansnum)
 
�� �亯 ���
- catenono: FK, mno: FK
 
INSERT INTO qna(qnano, qna_categrpname, qna_title, qna_content, qna_rdate, grpno, indent, ansnum) 
VALUES((SELECT NVL(MAX(qnano), 0) + 1 as qnano FROM qna),
            pc, '����', '����' ,sysdate, 1, 1, 1);
 
 
�� �亯�� ���� ���� ���� ����    
-- ORDER BY grpno DESC, ansnum ASC
SELECT qnano, qna_categrpname, qna_title, title, content, recom, cnt, replycnt, rdate, word, r
FROM (
           SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, rownum as r
           FROM (
                     SELECT contentsno, memberno, cateno, title, content, recom, cnt, replycnt, rdate, word, file1, thumb1, size1
                     FROM contents
                     WHERE cateno=29 AND word LIKE '%������%'
                     ORDER BY grpno DESC, ansnum ASC
           )          
)
WHERE r >= 1 AND r <= 10;      

SELECT qnano, qna_state, qna_categrpname, qna_email, qna_title, qna_content, word, qna_rdate,r
FROM (
          SELECT qnano, qna_state, qna_categrpname, qna_email, qna_title, qna_content, word, qna_rdate, rownum as r
          FROM (
                    SELECT qnano, qna_state, qna_categrpname, qna_email, qna_title, qna_content, word, qna_rdate
                    FROM qna
                    ORDER BY qnano DESC
            )
 )
WHERE r >= 1 AND r <= 10; 
   
----------------------------------------------------------------------------------------------
�亯 ���� ����
----------------------------------------------------------------------------------------------

1) ��ۼ� ����
UPDATE contents
SET replycnt = replycnt + 1
WHERE contentsno = 1;

2) ��ۼ� ����
UPDATE contents
SET replycnt = replycnt - 1
WHERE contentsno = 1;
 

commit;
-------------------------------------------------------------------------------------
-- �˻� + ����¡
-- step 1
SELECT qnano, qna_seqno, qna_categrpname, qna_email, qna_title, qna_content, qna_rdate
FROM qna
WHERE qna_title LIKE '%���%'
ORDER BY qnano DESC;

SELECT qnano, userno, qna_seqno, qna_categrpname, qna_title, qna_content, qna_rdate
FROM qna
WHERE userno = 1
ORDER BY qnano DESC;

-- step 2
SELECT qnano, qna_seqno, qna_categrpname, qna_email, qna_title, qna_content, qna_rdate, rownum as r
FROM (
    SELECT qnano, qna_seqno, qna_categrpname, qna_email, qna_title, qna_content, qna_rdate
    FROM qna
    WHERE qna_title LIKE '%���%'
    ORDER BY qnano DESC
);

-- step 3, 1 page
SELECT qnano, qna_seqno, qna_categrpname, qna_title, qna_content, qna_rdate,r
FROM (
            SELECT qnano, qna_seqno, qna_categrpname, qna_title, qna_content, qna_rdate, rownum as r
                FROM (
                             SELECT qnano, qna_seqno, qna_categrpname, qna_title, qna_content, qna_rdate
                             FROM qna
                             WHERE qna_title LIKE '%���%'
                             ORDER BY qnano DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT qnano, qna_seqno, qna_categrpname, qna_email, qna_title, qna_content, qna_rdate
FROM (
            SELECT qnano, qna_seqno, qna_categrpname, qna_email, qna_title, qna_content, qna_rdate, rownum as r
                FROM (
                             SELECT qnano, qna_seqno, qna_categrpname, qna_email, qna_title, qna_content, qna_rdate
                             FROM qna
                             WHERE qna_title LIKE '%ó��%'
                             ORDER BY qnano DESC
           )          
)
WHERE r >= 11 AND r <= 20;

SELECT qnano, qna_seqno, qna_categrpname, qna_title, qna_content, qna_rdate
FROM (
            SELECT qnano, qna_seqno, qna_categrpname, qna_title, qna_content, qna_rdate, rownum as r
                FROM (
                             SELECT qnano, qna_seqno, qna_categrpname, qna_title, qna_content, qna_rdate
                             FROM qna
                             WHERE qna_title LIKE '%ó��%' AND userno=1
                             ORDER BY qnano DESC
           )          
)
WHERE r >= 11 AND r <= 20;
 
-------------------------------------------------------------------------------------

