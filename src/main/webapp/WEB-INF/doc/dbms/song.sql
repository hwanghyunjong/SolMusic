DROP TABLE Music;
CREATE TABLE Music(
		songno                        	NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(100)	 NOT NULL,
		lyricist                      		VARCHAR2(100)	 NULL,
        likey                              NUMBER(10)		 DEFAULT 0		 NULL,
		composer                      	VARCHAR2(100)	 NULL,
		cnt                           		NUMBER(38)		 DEFAULT 0		 NULL,
        mp3                              VARCHAR2(1000)   NOT NULL,
		lyrics                        		VARCHAR2(4000)	 NOT NULL,
		albumno                      	NUMBER(10)		 NULL ,
		youtube                       	VARCHAR2(1000)	 NULL ,
        seqno                            NUMBER(10)		 NULL ,
        artistno                          NUMBER(10)		 NULL ,
  FOREIGN KEY (albumno) REFERENCES Album (albumno),
  FOREIGN KEY (artistno) REFERENCES artist(artistno)
);

COMMENT ON TABLE Music is '음악';
COMMENT ON COLUMN Music.songno is '음악번호';
COMMENT ON COLUMN Music.title is '곡 이름';
COMMENT ON COLUMN Music.albumno is '앨범 번호';
COMMENT ON COLUMN Music.lyricist is '작사가';
COMMENT ON COLUMN Music.likey is '좋아요';
COMMENT ON COLUMN Music.composer is '작곡가';
COMMENT ON COLUMN Music.cnt is '조회수';
COMMENT ON COLUMN Music.mp3 is 'mp3';
COMMENT ON COLUMN Music.lyrics is '가사';
COMMENT ON COLUMN Music.youtube is '뮤직비디오';

DROP SEQUENCE music_seq;
CREATE SEQUENCE music_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999   -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


ALTER TABLE Music ADD(seqno NUMBER(10)); 
ALTER TABLE Music ADD(artistno NUMBER(10)); 
ALTER TABLE Music ADD FOREIGN KEY(artistno) REFERENCES artist(artistno);

3) 데이터 입력
INSERT INTO Music(songno, title, lyricist, composer, mp3, albumno, lyrics, youtube)
VALUES(music_seq.nextval, '아름다워', '창모', '창모', 'beautiful.mp3', 8, '123', 'www.werwer.com');    

4) 데이터 전체 조회
SELECT songno, title, lyricist, artistno, composer, likey, mp3, albumno, lyrics, cnt, youtube, seqno, likey
FROM music
ORDER BY songno DESC;

SELECT songno, title, lyricist, artistno, composer, likey, mp3, albumno, lyrics, cnt, youtube, seqno, likey
FROM music
WHERE songno = 2;

SELECT artistno, name
FROM artist
WHERE name = '창모';

UPDATE music
SET artistno=4
WHERE songno=10; 

commit;
    
5) 특정 데이터 조회
SELECT songno, title, lyricist, seqno, composer, likey, mp3, albumno, lyrics, cnt, youtube
FROM music
WHERE artistno = 4
ORDER BY seqno ASC;

SELECT * FROM 

commit;
    
6) 수정
UPDATE music
SET title=#{title}, lyricist=#{lyricist}, seqno=#{seqno}, composer=#{composer}, mp3=#{mp3}, albumno=#{albumno}, lyrics=#{lyrics}
WHERE songno=#{songno};   

UPDATE music
SET mp3='창모 (CHANGMO) - 빌었어 [Boyhood].mp3'
WHERE songno=8;   

commit;

INSERT INTO Music(songno, title, lyricist, composer, mp3, albumno, lyrics, youtube)
VALUES(music_seq.nextval, '#{title}', '#{lyricist}', '#{composer}', '#{mp3}', #{albumno}, '#{lyrics}', '#{youtube}')   

7) 삭제
DELETE FROM music
WHERE songno=1;

SELECT r.artistno as r_artistno, r.name as r_name,
          l.albumno as l_albumno, l.title as l_title, l.fname as l_fname
FROM artist r, album l
WHERE r.artistno = l.artistno
ORDER BY l_albumno
    
SELECT c.cateno as c_cateno, c.name as c_name, c.rdate as c_rdate,
           t.contentsno as t_contentsno, t.title as t_title, t.web as t_web, t.ip as t_ip, t.rdate as t_rdate        
FROM cate c, contents t, member m
WHERE c.cateno = t.cateno AND t.memberno = m.memberno AND m.memberno = #{memberno}
ORDER BY c.cateno ASC, t.contentsno DESC

SELECT  l.albumno as l_albumno, l.title as l_title, l.fname as l_fname, l.artistno as l_artistno,
            s.songno as s_songno, s.title as s_title, s.lyricist as s_lyricist, s.composer as s_composer, s.mp3 as s_mp3, s.albumno as s_albumno, s.lyrics as s_lyrics, 
            r.artistno as r_artistno, r.name as r_name
FROM artist r, album l, music s
WHERE r.artistno = l.artistno AND l.albumno = s.albumno AND s.songno = #{songno}
ORDER BY r.artistno ASC, s.songno DESC

SELECT  l.albumno as l_albumno, l.title as l_title, l.fname as l_fname, l.artistno as l_artistno,
            s.songno as s_songno, s.title as s_title, s.lyricist as s_lyricist, s.composer as s_composer, s.mp3 as s_mp3, s.albumno as s_albumno, s.lyrics as s_lyrics, 
            r.artistno as r_artistno, r.name as r_name
FROM artist r, album l, music s
WHERE r.artistno = l.artistno AND l.albumno = s.albumno AND s.albumno = 3
ORDER BY r.artistno ASC, s.songno DESC

SELECT l.albumno as l_albumno, l.fname as l_fname, l.artistno as l_artistno, l.title as l_title,
           s.songno as s_songno, s.title as s_title, s.artistno as s_artistno, s.albumno as s_albumno, s.likey as s_likey,
           r.artistno as r_artistno, r.name as r_name
FROM artist r, album l, music s
WHERE (s.artistno = 4 AND l.artistno = 4 AND r.artistno = 4) AND (l.albumno = s.albumno)
ORDER BY s.likey DESC;

commit;
          
SELECT * FROM music;

UPDATE music
SET likey = 150
WHERE songno=7;


