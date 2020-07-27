/**********************************/
/* Table Name: 아티스트 */
/**********************************/
1) Artist 테이블 생성
DROP TABLE Artist;
CREATE TABLE Artist(
        -- 아티스트 정보
		artistno                   NUMBER(10)		     NOT NULL		 PRIMARY KEY,
		name                     VARCHAR2(200)		 NOT NULL,
		likey                       NUMBER(10)		     DEFAULT 0		 NULL,
		debut                     NUMBER(5)		         NOT NULL,
        seqno                     NUMBER(7)		     DEFAULT 0		 NOT NULL,                       
		genre                     VARCHAR2(50)		 NOT NULL,
		nation                     VARCHAR2(50)		 NOT NULL,
		type                       VARCHAR2(50)		 NOT NULL,
        
        -- 아티스트 이미지 부분
        thumbnail               VARCHAR2(200)        NULL,
        fname                    VARCHAR2(100)        NOT NULL,
        fupname                VARCHAR2(100)         NOT NULL,
        fsize                      NUMBER(10)             DEFAULT 0         NOT NULL
);

COMMENT ON TABLE Artist is '아티스트';
COMMENT ON COLUMN Artist.artistno is '아티스트 번호';
COMMENT ON COLUMN Artist.name is '이름';
COMMENT ON COLUMN Artist.likey is '좋아요';
COMMENT ON COLUMN Artist.debut is '데뷔년도';
COMMENT ON COLUMN Artist.genre is '장르';
COMMENT ON COLUMN Artist.nation is '국적';
COMMENT ON COLUMN Artist.type is '유형';
COMMENT ON COLUMN Artist.thumbnail is '썸네일';

commit;

2) 시퀀스 생성
DROP SEQUENCE artist_seq;
CREATE SEQUENCE artist_seq
    START WITH 1              -- 시작 번호
    INCREMENT BY 1          -- 증가값
    MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7)
    CACHE 2                     -- 2번은 메모리에서 계산
    NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
    
3) 데이터 입력
INSERT INTO Artist(artistno, name, likey, debut, genre, nation, type, fname, fupname, fsize)
VALUES(artist_seq.nextval, '창모', 0, 2014, '힙합', '대한민국', '솔로', 'changmo.jpg', 'changmo.jpg', 1000);    

INSERT INTO Artist(artistno, name, likey, debut, genre, nation, type)
VALUES(artist_seq.nextval, '청하', 0, 2017, '댄스', '대한민국', '솔로');    

INSERT INTO Artist(artistno, name, debut, genre, nation, type, thumbnail, fname, fupname, fsize)
VALUES(artist_seq.nextval, '청하', 2017, '댄스/팝', '대한민국', '솔로', '123.jpg', '123.jpg', '123.jpg', 2000)

INSERT INTO Artist(artistno, name, likey, debut, genre, nation, type)
VALUES(artist_seq.nextval, '볼빨간사춘기', 0, 2016, 'K-POP', '대한민국', '솔로');    
    
commit;

4) 데이터 전체 조회
SELECT artistno, name, debut, genre, nation, type, thumbnail, fname, fupname, fsize
FROM artist
ORDER BY artistno DESC;
    
5) 특정 데이터 조회
SELECT artistno, name, debut, genre, nation, likey, type, thumbnail, fname, fupname, fsize
FROM artist
WHERE artistno = 3;
    
SELECT * FROM artist;   
    
6) 수정
UPDATE artist 
SET name='아로미', debut=2020, seqno=5, genre='힙합', nation='대한민국', type='솔로', thumbnail='123.jpg', fname='123.jpg', fupname='123.jpg', fsize=0
WHERE artistno=9;   

7) 삭제
DELETE FROM artist
WHERE artistno=9;

commit;

    
    
    
    