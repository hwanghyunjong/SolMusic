/**********************************/
/* Table Name: faq */
/**********************************/

drop table  faq;

CREATE TABLE faq(
    faqno                  NUMBER(10) NOT NULL primary key,
    cateno                  NUMBER(10)         NOT NULL ,
    faq_categrp            VARCHAR2(100) NOT NULL,
    faq_word               VARCHAR2(300)    NULL , 
    faq_title                 VARCHAR2(300)    NOT NULL,
    faq_content            CLOB    NOT NULL,
    FOREIGN KEY (cateno) REFERENCES fcate (cateno)
);

COMMENT ON TABLE faq is '���� �ϴ� ����';
COMMENT ON COLUMN faq.faqno is '���� ��ȣ';
COMMENT ON COLUMN faq.faq_categrp is '��������';
COMMENT ON COLUMN faq.faq_word is '�˻���';
COMMENT ON COLUMN faq.faq_title is '��������';
COMMENT ON COLUMN faq.faq_content is '��������';

DROP SEQUENCE faq_seq;
CREATE SEQUENCE faq_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
--���
INSERT INTO faq(faqno, cateno, faq_categrp, faq_word, faq_title, faq_content)
VALUES(faq_seq.nextval, 1, '�̿��/���', '���', 'SOLMUSIC���� ���� ������ �̿���� ������ �˰� �;��.',
        'SOLMUSIC���� ���� ������ �̿���� �Ʒ��� �����ϴ�. 1.����� �̿��, 2.���ο� �̿��');

INSERT INTO faq(faqno, cateno, faq_categrp, faq_word, faq_title, faq_content)
VALUES(faq_seq.nextval, 2, 'ȸ������/�α���', 'Ż��', '������ Ż���ϰ� �;��',
        'Ȩȭ�� > ������ư > �������� > ȸ��Ż�� �������ּ���.');
        
INSERT INTO faq(faqno, cateno, faq_categrp, faq_word, faq_title, faq_content)
VALUES(faq_seq.nextval, 1, '�̿��/���', '���', 'SOLMUSIC���� ���� ������ �̿���� ������ �˰� �;��.',
        'SOLMUSIC�� �̿�� ������ �Ʒ��� �����ϴ�. 1.����� �̿�� 1��, 2.���ο� �̿�� 2��');    

commit;
   
-- ��ü���
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq 
ORDER BY faqno DESC;

-- ������ ���
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq 
WHERE cateno = 1
ORDER BY faqno DESC;

-- ������ �˻� ���
-- title, content, word column search
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq
WHERE cateno = 1 AND (faq_title LIKE '%���%' OR faq_content LIKE '%���%' OR faq_word LIKE '%���%')
ORDER BY faqno DESC;

--�˻� ���ڵ� ����
-- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM faq
WHERE faq_categrp='ȸ������/�α���';

SELECT COUNT(*) as cnt
FROM faq
WHERE faq_categrp='ȸ������/�α���' AND (faq_title LIKE '%Ż��%' OR faq_content LIKE '%Ż��%' OR faq_word LIKE '%Ż��%')

-- 1�� ��ȸ
SELECT faqno, faq_categrp, faq_word, faq_title, faq_content
FROM faq
WHERE faqno = 1;


-- ������ ��ȸ
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq 
WHERE cateno = 2;

--join
select c.cateno as c_cateno, c.name as c_name,
         f.faqno, f.cateno, f.faq_categrp, f.faq_word, f.faq_title, f.faq_content
from fcate c, faq f
where (c.cateno=f.cateno) AND c.cateno=1
order by c.cateno ASC;

-- ����
UPDATE faq 
SET faq_title='����', faq_content='����', faq_word='http://'
WHERE faqno = 1;

--����
DELETE FROM faq
WHERE faqno=1;

--�˻�����¡

-- step 1
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
FROM faq
WHERE cateno=1  AND faq_word LIKE '%���%'
ORDER BY faqno DESC;

-- step 2
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, rownum as r
FROM (
            SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
            FROM faq
            WHERE cateno=1  AND faq_word LIKE '%���%'
            ORDER BY faqno DESC
);

-- step 3, 1 page
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, r
FROM (
            SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, rownum as r
            FROM (
                         SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
                         FROM faq
                         WHERE faqno=1 AND faq_word LIKE '%���%'
                         ORDER BY faqno DESC
            )   
)
WHERE r >= 1 AND r <= 10;

--step 3,2 page
SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, r
FROM (
            SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content, rownum as r
            FROM (
                         SELECT faqno, cateno, faq_categrp, faq_word, faq_title, faq_content
                         FROM faq
                         WHERE cateno=1 AND faq_word LIKE '%Ż��%'
                         ORDER BY faqno DESC
            )   
)
WHERE r >= 11 AND r <= 20;

commit;