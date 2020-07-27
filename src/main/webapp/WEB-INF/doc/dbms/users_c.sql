/**********************************/
/* Table Name: ȸ�� */
/**********************************/
DROP TABLE users
CREATE TABLE users(
		userno                        		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		userID                        		VARCHAR2(300)		 NOT NULL,
		userpw                        		VARCHAR2(300)		 NOT NULL,
        user_name                          VARCHAR2(300)       NOT NULL,   
        nickname                           VARCHAR2(300)       NOT NULL,   
		user_identify                 		NUMBER(7)		 NOT NULL,
        user_identify2                		NUMBER(7)		 NOT NULL,
		user_tel                     		    VARCHAR2(150)			 NOT NULL,        
        user_tel2                   		    VARCHAR2(150)			 NOT NULL,
		user_tel3                    		    VARCHAR2(150)			 NOT NULL,
		user_email                    		VARCHAR2(1000)		 NOT NULL,
        user_email2                    		VARCHAR2(1000)		 NOT NULL,   -- ���� �߰��ȵ� 
		user_zipcode                  		VARCHAR2(150)		 NULL,
		user_address1                 		VARCHAR2(1500)		 NULL,
		user_address2                 		VARCHAR2(1500)		 NULL,
		user_point                    		NUMBER(7)		 DEFAULT 0		 NULL ,
		coupon                        		VARCHAR2(250)		 NULL ,
		user_date                     		DATE		 NOT NULL
);

COMMENT ON TABLE users is 'ȸ��';
COMMENT ON COLUMN users.userno is 'ȸ����ȣ';
COMMENT ON COLUMN users.userID is 'ȸ�����̵�';
COMMENT ON COLUMN users.userpw is 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN users.user_name is 'ȸ�� �̸�';
COMMENT ON COLUMN users.user_identify is '���ֹε�Ϲ�ȣ';
COMMENT ON COLUMN users.user_identify2 is '���ֹε�Ϲ�ȣ';
COMMENT ON COLUMN users.user_tel is '��ȭ��ȣ';
COMMENT ON COLUMN users.user_tel is '��ȭ��ȣ1';
COMMENT ON COLUMN users.user_tel is '��ȭ��ȣ2';
COMMENT ON COLUMN users.user_email is '�̸���';
COMMENT ON COLUMN users.user_email is '�̸���2';
COMMENT ON COLUMN users.user_zipcode is '�����ȣ';
COMMENT ON COLUMN users.user_address1 is '�ּ�';
COMMENT ON COLUMN users.user_address2 is '���ּ�';
COMMENT ON COLUMN users.user_point is '����Ʈ';
COMMENT ON COLUMN users.coupon is '����';
COMMENT ON COLUMN users.user_date is 'ȸ�� ������';

drop sequence users_seq
create SEQUENCE users_seq
  start with 1 -- ���� ��ȣ
   increment by 1 -- ������
   maxvalue 9999999999  --  �ִ밪: 9999999 -- number(7) 9999999999 -- number(10)
   cache 2  -- 2���� �޸𸮿����� ���
   nocycle   -- �ٽ� 1���� �����Ǵ� ���� ����



1) id �ߺ� Ȯ��
SELECT COUNT(userID) as cnt
FROM users
WHERE userID='user15';

2) �н����� üũ
SELECT COUNT(userno) as cnt
FROM users
WHERE userno=1 AND userpw= 1234

select *
from users

-- ���
INSERT INTO users(userno, userID, userpw, user_name, nickname, user_identify, user_identify2, user_tel,user_tel2,user_tel3, user_email,user_email2, user_zipcode,
                       user_address1, user_address2, user_point, coupon, user_date)
VALUES (users_seq.nextval, 'user1', '1234', '�մ���','������', 111111, 2222222, '010','1111','2222','dsa','naver', '23134','����','����', 0,'����', sysdate);

INSERT INTO users(userno, userID, userpw, user_name, user_identify, user_identify2, user_tel, user_email, user_zipcode,
                       user_address1, user_address2, user_date)
VALUES (users_seq.nextval, 'user2', '1234', '������2', 111111, 2222222, '010-1111-2222','dsa@naver', '23134','����','����', sysdate);

INSERT INTO users(userno, userID, userpw, user_name, user_identify, user_identify2, user_tel, user_email, user_zipcode,
                       user_address1, user_address2, user_date)
VALUES (users_seq.nextval, 'user3', '1234', '������3', 111111, 2222222 , '010-1111-2222','dsa@naver', '23134','����','����', sysdate);



-- ���
SELECT userno, userID, userpw, user_name, nickname, user_identify, user_identify2, user_tel,user_tel2,user_tel3, user_email,
           user_email2, user_zipcode, user_address1, user_address2, user_point, coupon, user_date
FROM users
ORDER BY userno ASC;

-- ����Ʈ üũȮ��
update users 
set user_point = 70
where userno =1

commit

-- 1�� �˻�
SELECT userno, userID, userpw, user_name, user_identify, user_identify2, user_tel, user_email, user_zipcode,
           user_address1, user_address2, user_point, coupon, user_date
FROM users
WHERE userno = 1;

-- ���� ������Ʈ
UPDATE users
SET user_name='������10', nickname='�մ���2', user_tel='123', user_tel2='456', user_tel3='789', user_email='test', user_email2='naver.com', user_zipcode='111111',  
          user_address1='���α� ������',  user_address2='1���� ������'
WHERE userno= 1;

-- ����
DELETE FROM users
WHERE userno = 1;


-- 
     SELECT userno, userID, userpw, user_name, nickname, user_identify, user_identify2, user_tel,user_tel2,user_tel3, user_email,
           user_email2, user_zipcode, user_address1, user_address2, user_point, coupon, user_date, r
     FROM (
              SELECT userno, userID, userpw, user_name, nickname, user_identify, user_identify2, user_tel,user_tel2,user_tel3, user_email,
              user_email2, user_zipcode, user_address1, user_address2, user_point, coupon, user_date, rownum as r
              FROM users
              )
              where userno= 1 AND nickname ='������';

