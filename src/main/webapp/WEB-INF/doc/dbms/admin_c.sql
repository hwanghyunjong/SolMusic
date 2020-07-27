DROP TABLE admin
CREATE TABLE admin(
		adminno                       		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		adminID                       		VARCHAR2(300)		 NOT NULL,
		adminpw                       		VARCHAR2(300)		 NOT NULL,
		admin_name                    		VARCHAR2(150)		 NOT NULL,
		admin_tel                     		VARCHAR2(150)		 NOT NULL,
		admin_tel2                    		VARCHAR2(150)		 NOT NULL,
		admin_tel3                    		VARCHAR2(150)		 NOT NULL,
		admin_email                   		VARCHAR2(300)		 NOT NULL,
		admin_email2                  		VARCHAR2(300)		 NOT NULL,
		admin_role                    		VARCHAR2(300)		 NOT NULL,
		admin_power                   		VARCHAR2(300)		 NOT NULL,
		admin_date                    		DATE		 NOT NULL
);

COMMENT ON TABLE admin is '������';
COMMENT ON COLUMN admin.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN admin.adminID is '�����ھ��̵�';
COMMENT ON COLUMN admin.adminpw is '�������н�����';
COMMENT ON COLUMN admin.admin_name is '�������̸�';
COMMENT ON COLUMN admin.admin_tel is '�����ڹ�ȣ';
COMMENT ON COLUMN admin.admin_tel2 is '�����ڹ�ȣ2';
COMMENT ON COLUMN admin.admin_tel3 is '�����ڹ�ȣ3';
COMMENT ON COLUMN admin.admin_email is '�������̸���';
COMMENT ON COLUMN admin.admin_email2 is '�������̸���2';
COMMENT ON COLUMN admin.admin_role is '�����ڿ���';
COMMENT ON COLUMN admin.admin_power is '�����ڱ���';
COMMENT ON COLUMN admin.admin_date is '�����ڻ�����';

drop sequence admin_seq
create SEQUENCE admin_seq
  start with 1 -- ���� ��ȣ
   increment by 1 -- ������
   maxvalue 9999999999  --  �ִ밪: 9999999 -- number(7) 9999999999 -- number(10)
   cache 2  -- 2���� �޸𸮿����� ���
   nocycle   -- �ٽ� 1���� �����Ǵ� ���� ����
   
   
   
INSERT INTO admin(adminno, adminID, adminpw, admin_name, admin_tel, admin_tel2, admin_tel3, admin_email, admin_email2, admin_role, admin_power, 
                           admin_date)
VALUES (admin_seq.nextval, 'admin2', '1234', '�Ʒι�', '010', '1111', '2222', 'dsa', 'naver', 'QNA' ,'2', sysdate);




SELECT * FROM admin

commit

SELECT adminno, adminID, adminpw, admin_name, admin_tel, admin_tel2, admin_tel3, admin_email, admin_email2, 
        admin_role, admin_power, admin_date
FROM admin
ORDER BY adminno ASC;

SELECT adminno, adminID, adminpw, admin_name, admin_tel, admin_tel2, admin_tel3, admin_email, admin_email2, 
        admin_role, admin_power, admin_date
FROM admin
WHERE adminno = 1

UPDATE admin 
SET admin_name='�Ʒ�', admin_tel='111', admin_tel2='2222', admin_tel3='3333', admin_email='asd', admin_email2='asd', admin_role='oo���', admin_power='1'
WHERE adminno=1

DELETE FROM admin
WHERE adminno = 2
