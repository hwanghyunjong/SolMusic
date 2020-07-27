/**********************************/
/* Table Name: 아티스트 */
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

COMMENT ON TABLE Artist is '아티스트';
COMMENT ON COLUMN Artist.artistno is '아티스트 번호';
COMMENT ON COLUMN Artist.name is '이름';
COMMENT ON COLUMN Artist.like is '좋아요';
COMMENT ON COLUMN Artist.debut is '데뷔';
COMMENT ON COLUMN Artist.seqno is '출력순서';
COMMENT ON COLUMN Artist.genre is '장르';
COMMENT ON COLUMN Artist.nation is '국가';
COMMENT ON COLUMN Artist.type is '유형';
COMMENT ON COLUMN Artist.fname is '이미지';
COMMENT ON COLUMN Artist.fupname is '업로드이미지';
COMMENT ON COLUMN Artist.thumbnail is '썸네일';
COMMENT ON COLUMN Artist.fsize is '파일크기';


/**********************************/
/* Table Name: 앨범 */
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

COMMENT ON TABLE Album is '앨범';
COMMENT ON COLUMN Album.albumno is '앨범 번호';
COMMENT ON COLUMN Album.title is '앨범 제목';
COMMENT ON COLUMN Album.kind is '앨범종류';
COMMENT ON COLUMN Album.release is '발매일';
COMMENT ON COLUMN Album.genre is '장르';
COMMENT ON COLUMN Album.enter is '기획사';
COMMENT ON COLUMN Album.likey is '좋아요';
COMMENT ON COLUMN Album.artistno is '아티스트 번호';
COMMENT ON COLUMN Album.intro is '앨범 소개';
COMMENT ON COLUMN Album.detail is '소개(자세히)';
COMMENT ON COLUMN Album.fname is '앨범이미지';
COMMENT ON COLUMN Album.thumbnail is '썸네일';
COMMENT ON COLUMN Album.fupname is '이미지 업로드';
COMMENT ON COLUMN Album.fsize is '파일크기';


/**********************************/
/* Table Name: 회원 */
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

COMMENT ON TABLE user is '회원';
COMMENT ON COLUMN user.userno is '회원번호';
COMMENT ON COLUMN user.userID is '아이디';
COMMENT ON COLUMN user.userpw is '비밀번호';
COMMENT ON COLUMN user.user_name is '회원이름';
COMMENT ON COLUMN user.nickname is '별명';
COMMENT ON COLUMN user.user_identify is '고유번호';
COMMENT ON COLUMN user.user_identify is '고유번호2';
COMMENT ON COLUMN user.user_tel is '전화번호';
COMMENT ON COLUMN user.user_email is '이메일';
COMMENT ON COLUMN user.user_zipcode is '우편번호';
COMMENT ON COLUMN user.user_address1 is '주소1';
COMMENT ON COLUMN user.user_address2 is '주소2';
COMMENT ON COLUMN user.user_point is '포인트';
COMMENT ON COLUMN user.coupon is '쿠폰';
COMMENT ON COLUMN user.user_date is '가입일자';


/**********************************/
/* Table Name: 음악 */
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

COMMENT ON TABLE Music is '음악';
COMMENT ON COLUMN Music.songno is '음악번호';
COMMENT ON COLUMN Music.title is '곡 이름';
COMMENT ON COLUMN Music.albumno is '앨범 번호';
COMMENT ON COLUMN Music.lyricist is '작사가';
COMMENT ON COLUMN Music.composer is '작곡가';
COMMENT ON COLUMN Music.cnt is '조회수';
COMMENT ON COLUMN Music.mp3 is '음악 파일';
COMMENT ON COLUMN Music.seqno is '출력순서';
COMMENT ON COLUMN Music.lyrics is '가사';
COMMENT ON COLUMN Music.artistno is '아티스트 번호';
COMMENT ON COLUMN Music.playlistno is '플레이리스트 번호';
COMMENT ON COLUMN Music.userno is '회원번호';
COMMENT ON COLUMN Music.likey is '좋아요';


/**********************************/
/* Table Name: 뮤직비디오 */
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

COMMENT ON TABLE video is '뮤직비디오';
COMMENT ON COLUMN video.videono is '뮤직비디오번호';
COMMENT ON COLUMN video.title is '제목';
COMMENT ON COLUMN video.artist is '아티스트';
COMMENT ON COLUMN video.release is '출시일자';
COMMENT ON COLUMN video.youtube is '유튜브';
COMMENT ON COLUMN video.songno is '노래번호';
COMMENT ON COLUMN video.albumno is '앨범번호';
COMMENT ON COLUMN video.artistno is '아티스트 번호';
COMMENT ON COLUMN video.seqno is '출력순서';
COMMENT ON COLUMN video.fname is '뮤비이미지';
COMMENT ON COLUMN video.fupname is '업로드 이미지';
COMMENT ON COLUMN video.thumbnail is '썸네일';
COMMENT ON COLUMN video.fsize is '파일크기';


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
/* Table Name: 관리자 */
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

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자번호';
COMMENT ON COLUMN admin.adminID is '아이디';
COMMENT ON COLUMN admin.adminpw is '비밀번호';
COMMENT ON COLUMN admin.admin_name is '관리자이름';
COMMENT ON COLUMN admin.admin_tel is '전화번호';
COMMENT ON COLUMN admin.admin_email is '이메일';
COMMENT ON COLUMN admin.admin_role is '역활';
COMMENT ON COLUMN admin.admin_date is '가입일자';


/**********************************/
/* Table Name: 로그인내역 */
/**********************************/
CREATE TABLE LOG(
		loginno                       		NUMBER(5)		 NOT NULL		 PRIMARY KEY,
		LOGIN_DATE                    		DATE		 NOT NULL,
		userno                        		NUMBER(7)		 NULL ,
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE LOG is '로그인내역';
COMMENT ON COLUMN LOG.loginno is '로그인번호';
COMMENT ON COLUMN LOG.LOGIN_DATE is '로그인 일자';
COMMENT ON COLUMN LOG.userno is '유저번호';


/**********************************/
/* Table Name: 결제 그룹 */
/**********************************/
CREATE TABLE paygroup(
		paygrpno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		userID                        		VARCHAR2(100)		 NOT NULL,
		tel                           		VARCHAR2(50)		 NULL ,
		type                          		VARCHAR2(100)		 NOT NULL,
		price                         		NUMBER(100)		 NOT NULL,
		date                          		DATE		 NOT NULL
);

COMMENT ON TABLE paygroup is '결제 그룹';
COMMENT ON COLUMN paygroup.paygrpno is '결제 그룹 번호';
COMMENT ON COLUMN paygroup.userID is '회원 아이디';
COMMENT ON COLUMN paygroup.tel is '전화번호';
COMMENT ON COLUMN paygroup.type is '결제 방법';
COMMENT ON COLUMN paygroup.price is '가격';
COMMENT ON COLUMN paygroup.date is '결제일자';


/**********************************/
/* Table Name: 결제 */
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

COMMENT ON TABLE payment is '결제';
COMMENT ON COLUMN payment.payno is '결제 번호';
COMMENT ON COLUMN payment.paygrpno is '결제 그룹 번호';
COMMENT ON COLUMN payment.goodsno is '상품 번호';
COMMENT ON COLUMN payment.price is '가격';
COMMENT ON COLUMN payment.userno is '유저 번호';


/**********************************/
/* Table Name: 질문 카테고리 */
/**********************************/
CREATE TABLE fcate(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL
);

COMMENT ON TABLE fcate is '질문 카테고리';
COMMENT ON COLUMN fcate.cateno is '카테고리 번호';
COMMENT ON COLUMN fcate.name is '이름';


/**********************************/
/* Table Name: 질문 */
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

COMMENT ON TABLE faq is '질문';
COMMENT ON COLUMN faq.faqno is '질문번호';
COMMENT ON COLUMN faq.cateno is '카테고리번호';
COMMENT ON COLUMN faq.faq_categrp is '카테고리 그룹';
COMMENT ON COLUMN faq.faq_word is '검색어';
COMMENT ON COLUMN faq.faq_title is '질문 제목';
COMMENT ON COLUMN faq.faq_content is '질문 내용';
COMMENT ON COLUMN faq.adminno is '관리자번호';


/**********************************/
/* Table Name: 문의 */
/**********************************/
CREATE TABLE qna(
		qnano                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		userno                        		NUMBER(10)		 NOT NULL,
		qna_seqno                     		NUMBER(5)		 DEFAULT 1		 NOT NULL,
		qna_state                     		VARCHAR2(50)		 DEFAULT 미답변		 NOT NULL,
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

COMMENT ON TABLE qna is '문의';
COMMENT ON COLUMN qna.qnano is '문의 번호';
COMMENT ON COLUMN qna.userno is '회원번호';
COMMENT ON COLUMN qna.qna_seqno is '출력번호';
COMMENT ON COLUMN qna.qna_state is '답변상태';
COMMENT ON COLUMN qna.qna_categrpname is '카테고리 그룹 이름';
COMMENT ON COLUMN qna.qna_title is '제목';
COMMENT ON COLUMN qna.qna_content is '내용';
COMMENT ON COLUMN qna.word is '검색어';
COMMENT ON COLUMN qna.grpno is '그룹번호';
COMMENT ON COLUMN qna.indent is '주문';
COMMENT ON COLUMN qna.ansnum is '답변';
COMMENT ON COLUMN qna.qna_fname is '이미지';
COMMENT ON COLUMN qna.qna_fupname is '업로드 이미지';
COMMENT ON COLUMN qna.qna_thumb is '썸네일';
COMMENT ON COLUMN qna.qna_fsize is '파일크기';
COMMENT ON COLUMN qna.qna_rdate is '등록일자';


/**********************************/
/* Table Name: 이벤트 */
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

COMMENT ON TABLE event is '이벤트';
COMMENT ON COLUMN event.eventno is '이벤트 번호';
COMMENT ON COLUMN event.etype is '이벤트 타입';
COMMENT ON COLUMN event.title is '제목';
COMMENT ON COLUMN event.content is '내용';
COMMENT ON COLUMN event.eventday is '이벤트 날짜';
COMMENT ON COLUMN event.endday is '종료 날짜';
COMMENT ON COLUMN event.fname is '이미지';
COMMENT ON COLUMN event.fupname is '업로드 이미지';
COMMENT ON COLUMN event.thumbnail is '썸네일';
COMMENT ON COLUMN event.fsize is '파일크기';
COMMENT ON COLUMN event.adminno is '관리자번호';


/**********************************/
/* Table Name: 쿠폰 */
/**********************************/
CREATE TABLE coupon(
		couponno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(20)		 NOT NULL,
		price                         		NUMBER(10)		 NOT NULL,
		expirydate                    		VARCHAR2(50)		 NULL ,
		eventno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (eventno) REFERENCES event (eventno)
);

COMMENT ON TABLE coupon is '쿠폰';
COMMENT ON COLUMN coupon.couponno is '쿠폰 번호';
COMMENT ON COLUMN coupon.title is '쿠폰 제목';
COMMENT ON COLUMN coupon.price is '가격';
COMMENT ON COLUMN coupon.expirydate is '유통기한';
COMMENT ON COLUMN coupon.eventno is '이벤트 번호';


/**********************************/
/* Table Name: 이벤트 지원 */
/**********************************/
CREATE TABLE Event_sub(
		eventsubno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		userno                        		NUMBER(7)		 NULL ,
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE Event_sub is '이벤트 지원';
COMMENT ON COLUMN Event_sub.eventsubno is '이벤트 지원 번호';
COMMENT ON COLUMN Event_sub.userno is '회원번호';


/**********************************/
/* Table Name: 이벤트 당첨 */
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

COMMENT ON TABLE event_win is '이벤트 당첨';
COMMENT ON COLUMN event_win.eventwinno is '이벤트 당첨 번호';
COMMENT ON COLUMN event_win.eventsubno is '이벤트 지원 번호';
COMMENT ON COLUMN event_win.eventno is '이벤트번호';
COMMENT ON COLUMN event_win.couponno is '쿠폰 번호';


/**********************************/
/* Table Name: 공지사항 */
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

COMMENT ON TABLE Notice is '공지사항';
COMMENT ON COLUMN Notice.noticeno is '공지사항 번호';
COMMENT ON COLUMN Notice.title is '제목';
COMMENT ON COLUMN Notice.content is '내용';
COMMENT ON COLUMN Notice.admin_name is '등록자';
COMMENT ON COLUMN Notice.rdate is '등록일';
COMMENT ON COLUMN Notice.adminno is '관리자번호';


/**********************************/
/* Table Name: 플레이리스트 */
/**********************************/
CREATE TABLE playlist(
		playlist                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(100)		 NOT NULL,
		userno                        		NUMBER(7)		 NULL ,
  FOREIGN KEY (userno) REFERENCES user (userno)
);

COMMENT ON TABLE playlist is '플레이리스트';
COMMENT ON COLUMN playlist.playlist is '음원 번호';
COMMENT ON COLUMN playlist.title is '제목';
COMMENT ON COLUMN playlist.userno is '회원번호';


