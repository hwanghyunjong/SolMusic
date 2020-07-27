/**********************************/
/* Table Name: ��Ƽ��Ʈ */
/**********************************/
1) Artist ���̺� ����
DROP TABLE Artist;
CREATE TABLE Artist(
        -- ��Ƽ��Ʈ ����
		artistno                   NUMBER(10)		     NOT NULL		 PRIMARY KEY,
		name                     VARCHAR2(200)		 NOT NULL,
		likey                       NUMBER(10)		     DEFAULT 0		 NULL,
		debut                     NUMBER(5)		         NOT NULL,
        seqno                     NUMBER(7)		     DEFAULT 0		 NOT NULL,                       
		genre                     VARCHAR2(50)		 NOT NULL,
		nation                     VARCHAR2(50)		 NOT NULL,
		type                       VARCHAR2(50)		 NOT NULL,
        
        -- ��Ƽ��Ʈ �̹��� �κ�
        thumbnail               VARCHAR2(200)        NULL,
        fname                    VARCHAR2(100)        NOT NULL,
        fupname                VARCHAR2(100)         NOT NULL,
        fsize                      NUMBER(10)             DEFAULT 0         NOT NULL
);

COMMENT ON TABLE Artist is '��Ƽ��Ʈ';
COMMENT ON COLUMN Artist.artistno is '��Ƽ��Ʈ ��ȣ';
COMMENT ON COLUMN Artist.name is '�̸�';
COMMENT ON COLUMN Artist.likey is '���ƿ�';
COMMENT ON COLUMN Artist.debut is '���߳⵵';
COMMENT ON COLUMN Artist.genre is '�帣';
COMMENT ON COLUMN Artist.nation is '����';
COMMENT ON COLUMN Artist.type is '����';
COMMENT ON COLUMN Artist.thumbnail is '�����';

commit;

2) ������ ����
DROP SEQUENCE artist_seq;
CREATE SEQUENCE artist_seq
    START WITH 1              -- ���� ��ȣ
    INCREMENT BY 1          -- ������
    MAXVALUE 9999999999  -- �ִ밪: 9999999 --> NUMBER(7)
    CACHE 2                     -- 2���� �޸𸮿��� ���
    NOCYCLE;                   -- �ٽ� 1���� �����Ǵ� ���� ����
    
3) ������ �Է�
INSERT INTO Artist(artistno, name, likey, debut, genre, nation, type, fname, fupname, fsize)
VALUES(artist_seq.nextval, 'â��', 0, 2014, '����', '���ѹα�', '�ַ�', 'changmo.jpg', 'changmo.jpg', 1000);    

INSERT INTO Artist(artistno, name, likey, debut, genre, nation, type)
VALUES(artist_seq.nextval, 'û��', 0, 2017, '��', '���ѹα�', '�ַ�');    

INSERT INTO Artist(artistno, name, debut, genre, nation, type, thumbnail, fname, fupname, fsize)
VALUES(artist_seq.nextval, 'û��', 2017, '��/��', '���ѹα�', '�ַ�', '123.jpg', '123.jpg', '123.jpg', 2000)

INSERT INTO Artist(artistno, name, likey, debut, genre, nation, type)
VALUES(artist_seq.nextval, '�����������', 0, 2016, 'K-POP', '���ѹα�', '�ַ�');    
    
commit;

4) ������ ��ü ��ȸ
SELECT artistno, name, debut, genre, nation, type, thumbnail, fname, fupname, fsize
FROM artist
ORDER BY artistno DESC;
    
5) Ư�� ������ ��ȸ
SELECT artistno, name, debut, genre, nation, likey, type, thumbnail, fname, fupname, fsize
FROM artist
WHERE artistno = 3;
    
SELECT * FROM artist;   
    
6) ����
UPDATE artist 
SET name='�Ʒι�', debut=2020, seqno=5, genre='����', nation='���ѹα�', type='�ַ�', thumbnail='123.jpg', fname='123.jpg', fupname='123.jpg', fsize=0
WHERE artistno=9;   

7) ����
DELETE FROM artist
WHERE artistno=9;

commit;

    
    
    
    