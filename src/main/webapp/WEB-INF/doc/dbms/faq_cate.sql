1) ���̺� ����: �ڽ� -> �θ�
�� �ڽ� ���̺� ����: DROP TABLE faq;
�� �θ� ���̺� ����: DROP TABLE fcate;
  
2) ���̺� ����: �θ� -> �ڽ�
�� �θ� ���̺� ���� ����: fcate
�� �ڽ� ���̺� ����: faq


drop table fcate;
CREATE TABLE fcate(
		cateno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR(50)		 NOT NULL
);

DROP SEQUENCE fcate_seq;
CREATE SEQUENCE fcate_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
--1 
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '��ü');

--2
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '�̿��/���');

--3
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '����/����/ȯ��');

--4
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, 'ȸ������/�α���');

--5
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '�÷��̾�/������');

--6
INSERT INTO fcate(cateno, name)
VALUES(fcate_seq.nextval, '���񽺹���/����');

SELECT * FROM fcate;

--��ü���
SELECT cateno,name
FROM fcate 
ORDER BY cateno DESC;



SELECT cateno, name
FROM faq_cate
WHERE cateno=1;

commit;


--����
DELETE FROM fcate
WHERE cateno = 11;
commit;

--����
UPDATE faq_cate
SET cateno=1, name='�Ĵ�'
WHERE cateno = 5;
