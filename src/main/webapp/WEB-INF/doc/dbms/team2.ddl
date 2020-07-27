/**********************************/
/* Table Name: ��Ƽ��Ʈ */
/**********************************/
CREATE TABLE Artist(
		artistno                      		NUMBER(8)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(200)		 NOT NULL,
		like                          		NUMBER(8)		 DEFAULT 0		 NULL ,
		debut                         		NUMBER(5)		 NOT NULL,
		seqno                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		genre                         		VARCHAR2(50)		 NOT NULL,
		nation                        		VARCHAR2(50)		 NOT NULL,
		type                          		VARCHAR2(50)		 NOT NULL,
		fname                         		VARCHAR2(100)		 NULL ,
		fupname                       		VARCHAR2(100)		 NOT NULL,
		thumbnail                     		VARCHAR2(200)		 NULL ,
		fsize                         		NUMBER(10)		 DEFAULT 0		 NOT NULL
);

COMMENT ON TABLE Artist is '��Ƽ��Ʈ';
COMMENT ON COLUMN Artist.artistno is '��Ƽ��Ʈ ��ȣ';
COMMENT ON COLUMN Artist.name is '�̸�';
COMMENT ON COLUMN Artist.like is '���ƿ�';
COMMENT ON COLUMN Artist.debut is '����';
COMMENT ON COLUMN Artist.seqno is '��¼���';
COMMENT ON COLUMN Artist.genre is '�帣';
COMMENT ON COLUMN Artist.nation is '����';
COMMENT ON COLUMN Artist.type is '����';
COMMENT ON COLUMN Artist.fname is '�̹���';
COMMENT ON COLUMN Artist.fupname is '���ε��̹���';
COMMENT ON COLUMN Artist.thumbnail is '�����';
COMMENT ON COLUMN Artist.fsize is '����ũ��';


/**********************************/
/* Table Name: �ٹ� */
/**********************************/
CREATE TABLE Album(
		albumno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(50)		 NOT NULL,
		kind                          		VARCHAR2(20)		 NOT NULL,
		release                       		VARCHAR2(10)		 NOT NULL,
		genre                         		VARCHAR2(10)		 NOT NULL,
		enter                         		VARCHAR2(10)		 NOT NULL,
		likey                         		NUMBER(10)		 DEFAULT 0		 NULL ,
		artistno                      		NUMBER(10)		 NULL ,
		intro                         		VARCHAR2(1000)		 NULL ,
		detail                        		VARCHAR2(4000)		 NULL ,
		fname                         		VARCHAR2(100)		 NOT NULL,
		thumbnail                     		VARCHAR2(200)		 NULL ,
		fupname                       		VARCHAR2(100)		 NOT NULL,
		fsize                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (artistno) REFERENCES Artist (artistno)
);

COMMENT ON TABLE Album is '�ٹ�';
COMMENT ON COLUMN Album.albumno is '�ٹ� ��ȣ';
COMMENT ON COLUMN Album.title is '�ٹ� ����';
COMMENT ON COLUMN Album.kind is '�ٹ�����';
COMMENT ON COLUMN Album.release is '�߸���';
COMMENT ON COLUMN Album.genre is '�帣';
COMMENT ON COLUMN Album.enter is '��ȹ��';
COMMENT ON COLUMN Album.likey is '���ƿ�';
COMMENT ON COLUMN Album.artistno is '��Ƽ��Ʈ ��ȣ';
COMMENT ON COLUMN Album.intro is '�ٹ� �Ұ�';
COMMENT ON COLUMN Album.detail is '�Ұ�(�ڼ���)';
COMMENT ON COLUMN Album.fname is '�ٹ��̹���';
COMMENT ON COLUMN Album.thumbnail is '�����';
COMMENT ON COLUMN Album.fupname is '�̹��� ���ε�';
COMMENT ON COLUMN Album.fsize is '����ũ��';


/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE user(
		userno                        		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		userID                        		VARCHAR2(300)		 NOT NULL,
		userpw                        		VARCHAR2(300)		 NOT NULL,
		user_name                     		VARCHAR2(300)		 NOT NULL,
		nickname                      		VARCHAR2(300)		 NOT NULL,
		user_identify                 		NUMBER(7)		 NOT NULL,
		user_identify                 		NUMBER(7)		 NOT NULL,
		user_tel                      		VARCHAR2(150)		 NOT NULL,
		user_email                    		VARCHAR2(1000)		 NOT NULL,
		user_zipcode                  		VARCHAR2(150)		 NULL ,
		user_address1                 		VARCHAR2(1500)		 NULL ,
		user_address2                 		VARCHAR2(1500)		 NULL ,
		user_point                    		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		coupon                        		VARCHAR2(250)		 NULL ,
		user_date                     		DATE		 NOT NULL
);

COMMENT ON TABLE user is 'ȸ��';
COMMENT ON COLUMN user.userno is 'ȸ����ȣ';
COMMENT ON COLUMN user.userID is '���̵�';
COMMENT ON COLUMN user.userpw is '��й�ȣ';
COMMENT ON COLUMN user.user_name is 'ȸ���̸�';
COMMENT ON COLUMN user.nickname is '����';
COMMENT ON COLUMN user.user_identify is '������ȣ';
COMMENT ON COLUMN user.user_identify is '������ȣ2';
COMMENT ON COLUMN user.user_tel is '��ȭ��ȣ';
COMMENT ON COLUMN user.user_email is '�̸���';
COMMENT ON COLUMN user.user_zipcode is '�����ȣ';
COMMENT ON COLUMN user.user_address1 is '�ּ�1';
COMMENT ON COLUMN user.user_address2 is '�ּ�2';
COMMENT ON COLUMN user.user_point is '����Ʈ';
COMMENT ON COLUMN user.coupon is '����';
COMMENT ON COLUMN user.user_date is '��������';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE Music(
		songno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(100)		 NOT NULL,
		albumno                       		NUMBER(10)		 NULL ,
		lyricist                      		VARCHAR2(100)		 NULL ,
		composer                      		VARCHAR2(100)		 NULL ,
		cnt                           		NUMBER(100)		 DEFAULT 0		 NULL ,
		mp3                           		VARCHAR2(1000)		 NOT NULL,
		seqno                         		NUMBER(10)		 NULL ,
		lyrics                        		VARCHAR2(1000)		 NOT NULL,
		artistno                      		NUMBER(10)		 NULL ,
		playlistno                    		NUMBER(10)		 NULL ,
		userno                        		NUMBER(7)		 NULL ,
		likey                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (albumno) REFERENCES Album (albumno),
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE Music is '����';
COMMENT ON COLUMN Music.songno is '���ǹ�ȣ';
COMMENT ON COLUMN Music.title is '�� �̸�';
COMMENT ON COLUMN Music.albumno is '�ٹ� ��ȣ';
COMMENT ON COLUMN Music.lyricist is '�ۻ簡';
COMMENT ON COLUMN Music.composer is '�۰';
COMMENT ON COLUMN Music.cnt is '��ȸ��';
COMMENT ON COLUMN Music.mp3 is '���� ����';
COMMENT ON COLUMN Music.seqno is '��¼���';
COMMENT ON COLUMN Music.lyrics is '����';
COMMENT ON COLUMN Music.artistno is '��Ƽ��Ʈ ��ȣ';
COMMENT ON COLUMN Music.playlistno is '�÷��̸���Ʈ ��ȣ';
COMMENT ON COLUMN Music.userno is 'ȸ����ȣ';
COMMENT ON COLUMN Music.likey is '���ƿ�';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE video(
		videono                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(100)		 NOT NULL,
		artist                        		VARCHAR2(100)		 NULL ,
		release                       		VARCHAR2(100)		 NOT NULL,
		youtube                       		VARCHAR2(1000)		 NULL ,
		songno                        		NUMBER(10)		 NULL ,
		albumno                       		NUMBER(10)		 NULL ,
		artistno                      		NUMBER(10)		 NULL ,
		seqno                         		NUMBER(10)		 NULL ,
		fname                         		VARCHAR2(100)		 NOT NULL,
		fupname                       		VARCHAR2(100)		 NOT NULL,
		thumbnail                     		VARCHAR2(200)		 NULL ,
		fsize                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (songno) REFERENCES Music (songno)
);

COMMENT ON TABLE video is '��������';
COMMENT ON COLUMN video.videono is '����������ȣ';
COMMENT ON COLUMN video.title is '����';
COMMENT ON COLUMN video.artist is '��Ƽ��Ʈ';
COMMENT ON COLUMN video.release is '�������';
COMMENT ON COLUMN video.youtube is '��Ʃ��';
COMMENT ON COLUMN video.songno is '�뷡��ȣ';
COMMENT ON COLUMN video.albumno is '�ٹ���ȣ';
COMMENT ON COLUMN video.artistno is '��Ƽ��Ʈ ��ȣ';
COMMENT ON COLUMN video.seqno is '��¼���';
COMMENT ON COLUMN video.fname is '�º��̹���';
COMMENT ON COLUMN video.fupname is '���ε� �̹���';
COMMENT ON COLUMN video.thumbnail is '�����';
COMMENT ON COLUMN video.fsize is '����ũ��';


/**********************************/
/* Table Name: Table6 */
/**********************************/
CREATE TABLE TABLE_6(

);

COMMENT ON TABLE TABLE_6 is 'Table6';


/**********************************/
/* Table Name: Table7 */
/**********************************/
CREATE TABLE TABLE_7(

);

COMMENT ON TABLE TABLE_7 is 'Table7';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE admin(
		adminno                       		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		adminID                       		VARCHAR2(300)		 NOT NULL,
		adminpw                       		VARCHAR2(300)		 NOT NULL,
		admin_name                    		VARCHAR2(150)		 NOT NULL,
		admin_tel                     		VARCHAR2(150)		 NOT NULL,
		admin_email                   		VARCHAR2(300)		 NOT NULL,
		admin_role                    		VARCHAR2(300)		 NOT NULL,
		admin_date                    		DATE		 NOT NULL
);

COMMENT ON TABLE admin is '������';
COMMENT ON COLUMN admin.adminno is '�����ڹ�ȣ';
COMMENT ON COLUMN admin.adminID is '���̵�';
COMMENT ON COLUMN admin.adminpw is '��й�ȣ';
COMMENT ON COLUMN admin.admin_name is '�������̸�';
COMMENT ON COLUMN admin.admin_tel is '��ȭ��ȣ';
COMMENT ON COLUMN admin.admin_email is '�̸���';
COMMENT ON COLUMN admin.admin_role is '��Ȱ';
COMMENT ON COLUMN admin.admin_date is '��������';


/**********************************/
/* Table Name: �α��γ��� */
/**********************************/
CREATE TABLE LOG(
		loginno                       		NUMBER(5)		 NOT NULL		 PRIMARY KEY,
		LOGIN_DATE                    		DATE		 NOT NULL,
		userno                        		NUMBER(7)		 NULL ,
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE LOG is '�α��γ���';
COMMENT ON COLUMN LOG.loginno is '�α��ι�ȣ';
COMMENT ON COLUMN LOG.LOGIN_DATE is '�α��� ����';
COMMENT ON COLUMN LOG.userno is '������ȣ';


/**********************************/
/* Table Name: ���� �׷� */
/**********************************/
CREATE TABLE paygroup(
		paygrpno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		userID                        		VARCHAR2(100)		 NOT NULL,
		tel                           		VARCHAR2(50)		 NULL ,
		type                          		VARCHAR2(100)		 NOT NULL,
		price                         		NUMBER(100)		 NOT NULL,
		date                          		DATE		 NOT NULL
);

COMMENT ON TABLE paygroup is '���� �׷�';
COMMENT ON COLUMN paygroup.paygrpno is '���� �׷� ��ȣ';
COMMENT ON COLUMN paygroup.userID is 'ȸ�� ���̵�';
COMMENT ON COLUMN paygroup.tel is '��ȭ��ȣ';
COMMENT ON COLUMN paygroup.type is '���� ���';
COMMENT ON COLUMN paygroup.price is '����';
COMMENT ON COLUMN paygroup.date is '��������';


/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE paygroup;
DROP TABLE payment;

CREATE TABLE payment(
		payno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		paygrpno                      		NUMBER(10)		 NULL ,
		goodsno                       		NUMBER(10)		 NULL ,
		price                         		NUMBER(100)		 NOT NULL,
		userno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (paygrpno) REFERENCES paygroup (paygrpno),
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE payment is '����';
COMMENT ON COLUMN payment.payno is '���� ��ȣ';
COMMENT ON COLUMN payment.paygrpno is '���� �׷� ��ȣ';
COMMENT ON COLUMN payment.goodsno is '��ǰ ��ȣ';
COMMENT ON COLUMN payment.price is '����';
COMMENT ON COLUMN payment.userno is '���� ��ȣ';


/**********************************/
/* Table Name: ���� ī�װ� */
/**********************************/
CREATE TABLE fcate(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL
);

COMMENT ON TABLE fcate is '���� ī�װ�';
COMMENT ON COLUMN fcate.cateno is 'ī�װ� ��ȣ';
COMMENT ON COLUMN fcate.name is '�̸�';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE faq(
		faqno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cateno                        		NUMBER(10)		 NOT NULL,
		faq_categrp                   		VARCHAR2(100)		 NOT NULL,
		faq_word                      		VARCHAR2(300)		 NULL ,
		faq_title                     		VARCHAR2(300)		 NOT NULL,
		faq_content                   		CLOB(10)		 NOT NULL,
		adminno                       		NUMBER(7)		 NULL ,
  FOREIGN KEY (cateno) REFERENCES fcate (cateno),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE faq is '����';
COMMENT ON COLUMN faq.faqno is '������ȣ';
COMMENT ON COLUMN faq.cateno is 'ī�װ���ȣ';
COMMENT ON COLUMN faq.faq_categrp is 'ī�װ� �׷�';
COMMENT ON COLUMN faq.faq_word is '�˻���';
COMMENT ON COLUMN faq.faq_title is '���� ����';
COMMENT ON COLUMN faq.faq_content is '���� ����';
COMMENT ON COLUMN faq.adminno is '�����ڹ�ȣ';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE qna(
		qnano                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		userno                        		NUMBER(10)		 NOT NULL,
		qna_seqno                     		NUMBER(5)		 DEFAULT 1		 NOT NULL,
		qna_state                     		VARCHAR2(50)		 DEFAULT �̴亯		 NOT NULL,
		qna_categrpname               		VARCHAR2(100)		 NOT NULL,
		qna_title                     		VARCHAR2(300)		 NOT NULL,
		qna_content                   		VARCHAR2(2000)		 NOT NULL,
		word                          		VARCHAR2(300)		 NULL ,
		grpno                         		NUMBER(8)		 DEFAULT 0		 NULL ,
		indent                        		NUMBER(2)		 DEFAULT 0		 NULL ,
		ansnum                        		NUMBER(3)		 DEFAULT 0		 NULL ,
		qna_fname                     		VARCHAR2(100)		 NULL ,
		qna_fupname                   		VARCHAR2(100)		 NULL ,
		qna_thumb                     		VARCHAR2(100)		 NULL ,
		qna_fsize                     		NUMBER(10)		 DEFAULT 0		 NULL ,
		qna_rdate                     		DATE		 NOT NULL,
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE qna is '����';
COMMENT ON COLUMN qna.qnano is '���� ��ȣ';
COMMENT ON COLUMN qna.userno is 'ȸ����ȣ';
COMMENT ON COLUMN qna.qna_seqno is '��¹�ȣ';
COMMENT ON COLUMN qna.qna_state is '�亯����';
COMMENT ON COLUMN qna.qna_categrpname is 'ī�װ� �׷� �̸�';
COMMENT ON COLUMN qna.qna_title is '����';
COMMENT ON COLUMN qna.qna_content is '����';
COMMENT ON COLUMN qna.word is '�˻���';
COMMENT ON COLUMN qna.grpno is '�׷��ȣ';
COMMENT ON COLUMN qna.indent is '�ֹ�';
COMMENT ON COLUMN qna.ansnum is '�亯';
COMMENT ON COLUMN qna.qna_fname is '�̹���';
COMMENT ON COLUMN qna.qna_fupname is '���ε� �̹���';
COMMENT ON COLUMN qna.qna_thumb is '�����';
COMMENT ON COLUMN qna.qna_fsize is '����ũ��';
COMMENT ON COLUMN qna.qna_rdate is '�������';


/**********************************/
/* Table Name: �̺�Ʈ */
/**********************************/
CREATE TABLE event(
		eventno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		etype                         		VARCHAR2(50)		 NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
		eventday                      		VARCHAR2(50)		 NULL ,
		endday                        		VARCHAR2(50)		 NULL ,
		fname                         		VARCHAR2(200)		 NULL ,
		fupname                       		VARCHAR2(200)		 NULL ,
		thumbnail                     		VARCHAR2(100)		 NULL ,
		fsize                         		NUMBER(10)		 NULL ,
		adminno                       		NUMBER(7)		 NULL ,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE event is '�̺�Ʈ';
COMMENT ON COLUMN event.eventno is '�̺�Ʈ ��ȣ';
COMMENT ON COLUMN event.etype is '�̺�Ʈ Ÿ��';
COMMENT ON COLUMN event.title is '����';
COMMENT ON COLUMN event.content is '����';
COMMENT ON COLUMN event.eventday is '�̺�Ʈ ��¥';
COMMENT ON COLUMN event.endday is '���� ��¥';
COMMENT ON COLUMN event.fname is '�̹���';
COMMENT ON COLUMN event.fupname is '���ε� �̹���';
COMMENT ON COLUMN event.thumbnail is '�����';
COMMENT ON COLUMN event.fsize is '����ũ��';
COMMENT ON COLUMN event.adminno is '�����ڹ�ȣ';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE coupon(
		couponno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(20)		 NOT NULL,
		price                         		NUMBER(10)		 NOT NULL,
		expirydate                    		VARCHAR2(50)		 NULL ,
		eventno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (eventno) REFERENCES event (eventno)
);

COMMENT ON TABLE coupon is '����';
COMMENT ON COLUMN coupon.couponno is '���� ��ȣ';
COMMENT ON COLUMN coupon.title is '���� ����';
COMMENT ON COLUMN coupon.price is '����';
COMMENT ON COLUMN coupon.expirydate is '�������';
COMMENT ON COLUMN coupon.eventno is '�̺�Ʈ ��ȣ';


/**********************************/
/* Table Name: �̺�Ʈ ���� */
/**********************************/
CREATE TABLE Event_sub(
		eventsubno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		userno                        		NUMBER(7)		 NULL ,
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE Event_sub is '�̺�Ʈ ����';
COMMENT ON COLUMN Event_sub.eventsubno is '�̺�Ʈ ���� ��ȣ';
COMMENT ON COLUMN Event_sub.userno is 'ȸ����ȣ';


/**********************************/
/* Table Name: �̺�Ʈ ��÷ */
/**********************************/
CREATE TABLE event_win(
		eventwinno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		eventsubno                    		NUMBER(10)		 NULL ,
		eventno                       		NUMBER(10)		 NULL ,
		couponno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (eventno) REFERENCES event (eventno),
  FOREIGN KEY (couponno) REFERENCES coupon (couponno),
  FOREIGN KEY (eventsubno) REFERENCES Event_sub (eventsubno)
);

COMMENT ON TABLE event_win is '�̺�Ʈ ��÷';
COMMENT ON COLUMN event_win.eventwinno is '�̺�Ʈ ��÷ ��ȣ';
COMMENT ON COLUMN event_win.eventsubno is '�̺�Ʈ ���� ��ȣ';
COMMENT ON COLUMN event_win.eventno is '�̺�Ʈ��ȣ';
COMMENT ON COLUMN event_win.couponno is '���� ��ȣ';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE Notice(
		noticeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(100)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NULL ,
		admin_name                    		VARCHAR2(20)		 NULL ,
		rdate                         		DATE		 NOT NULL,
		adminno                       		NUMBER(7)		 NULL ,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE Notice is '��������';
COMMENT ON COLUMN Notice.noticeno is '�������� ��ȣ';
COMMENT ON COLUMN Notice.title is '����';
COMMENT ON COLUMN Notice.content is '����';
COMMENT ON COLUMN Notice.admin_name is '�����';
COMMENT ON COLUMN Notice.rdate is '�����';
COMMENT ON COLUMN Notice.adminno is '�����ڹ�ȣ';


/**********************************/
/* Table Name: �÷��̸���Ʈ */
/**********************************/
CREATE TABLE playlist(
		playlist                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(100)		 NOT NULL,
		userno                        		NUMBER(7)		 NULL ,
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE playlist is '�÷��̸���Ʈ';
COMMENT ON COLUMN playlist.playlist is '���� ��ȣ';
COMMENT ON COLUMN playlist.title is '����';
COMMENT ON COLUMN playlist.userno is 'ȸ����ȣ';


