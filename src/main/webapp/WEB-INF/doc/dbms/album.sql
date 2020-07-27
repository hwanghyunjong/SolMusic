DROP TABLE Album;
CREATE TABLE Album(
		albumno                       	NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(50)		 NOT NULL,
		kind                          		VARCHAR2(20)		 NOT NULL,
		release                       	VARCHAR2(10)		 NOT NULL,
		genre                         	VARCHAR2(10)		 NOT NULL,
		enter                         		VARCHAR2(50)		 NOT NULL,
		likey                         		NUMBER(10)		 DEFAULT 0		 NULL,
        intro                              VARCHAR2(1000)     NULL,
        detail                             VARCHAR2(4000)  NULL,
		artistno                      		NUMBER(10)		 NULL,
        
         -- 아티스트 이미지 부분
        thumbnail               VARCHAR2(200)        NULL,
        fname                    VARCHAR2(100)        NOT NULL,
        fupname                VARCHAR2(100)         NOT NULL,
        fsize                      NUMBER(10)             DEFAULT 0         NOT NULL,
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
COMMENT ON COLUMN Album.intro is '앨범소개문(간략)';
COMMENT ON COLUMN Album.detail is '앨범소개문(자세히)';
COMMENT ON COLUMN Album.artistno is '아티스트 번호';
COMMENT ON COLUMN Album.thumbnail is '썸네일';
COMMENT ON COLUMN Album.fname is '파일 제목';
COMMENT ON COLUMN Album.fupname is '파일 제목2';
COMMENT ON COLUMN Album.fsize is '파일 크기';

SELECT * FROM book;

DROP SEQUENCE album_seq;
CREATE SEQUENCE album_seq
    START WITH 1              -- 시작 번호
    INCREMENT BY 1          -- 증가값
    MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7)
    CACHE 2                     -- 2번은 메모리에서 계산
    NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

INSERT INTO Album(albumno, title, kind, release, genre, enter, artistno, thumbnail, fname, fupname, fsize)
VALUES(album_seq.nextval, 'NONSTOP', 'EP(미니)', '2020.04.27', '아이돌', 'WM Entertainment', 1, 'changmo.jpg', 'changmo.jpg',  '123.jpg', 1000);    

SELECT albumno, title, kind, release, genre, enter, intro, detail, artistno, thumbnail, fname, fupname, fsize
FROM album
ORDER BY albumno;


SELECT albumno, title, kind, release, genre, enter, intro, detail, artistno, thumbnail, fname, fupname, fsize
FROM album
ORDER BY albumno;

SELECT albumno, title, kind, release, genre, enter, intro, detail, artistno, likey, thumbnail, fname, fupname, fsize
FROM album
WHERE albumno = 16;

SELECT albumno, title, kind, release, genre, enter, intro, detail, artistno, likey, thumbnail, fname, fupname, fsize
FROM album
WHERE artistno = 4;

SELECT * FROM Album;

UPDATE album
SET title = 'I-LAND Part.1', kind='', release='', genre='', enter='', intro='', detail='', artistno='', thumnail='', fupname='', fsize=1
where albumno = 14;

commit;

SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
           t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno = #{memberno}
ORDER BY c.cateno ASC, t.contentsno DESC

SELECT r.artistno as r_artistno, r.name as r_name,
           l.albumno as l_albumno, l.title as l_title, l.fname as l_fname
FROM artist r, album l
WHERE r.artistno = l.artistno
ORDER BY l_albumno;



