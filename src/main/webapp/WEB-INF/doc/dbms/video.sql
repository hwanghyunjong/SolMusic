DROP TABLE Video;
CREATE TABLE Video(
        videono                          NUMBER(10)           NOT NULL     PRIMARY KEY,
        title                               VARCHAR2(100)	    NOT NULL,
        artist                              VARCHAR2(100)      NULL,
        release                           VARCHAR2(100)      NOT NULL,
        youtube                       	VARCHAR2(1000)	    NULL,
        songno                           NUMBER(10)           NULL,
        albumno                         NUMBER(10)           NULL,
        artistno                           NUMBER(10)           NULL,
        seqno                             NUMBER(10)           NOT NULL,
        
        thumbnail                       VARCHAR2(200)        NULL,
        fname                            VARCHAR2(100)        NOT NULL,
        fupname                        VARCHAR2(100)         NOT NULL,
        fsize                              NUMBER(10)             DEFAULT 0         NOT NULL,
  FOREIGN KEY (songno) REFERENCES music (songno),        
  FOREIGN KEY (albumno) REFERENCES Album (albumno),
  FOREIGN KEY (artistno) REFERENCES artist(artistno)
);

DROP SEQUENCE video_seq;
CREATE SEQUENCE video_seq
  START WITH 1               -- ���� ��ȣ
  INCREMENT BY 1           -- ������
  MAXVALUE 9999999999   -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  
INSERT INTO Video(videono, title, artist, release, youtube, songno, albumno, artistno, seqno, thumbnail, fname, fupname, fsize)
VALUES(video_seq.nextval, 'just', 'just', 'just', 'just', 2, 2, 4, 1, '123.jpg', '123.jpg', '123.jpg', 1000);

SELECT videono, title, artist, release, youtube, songno, albumno, artistno, seqno, thumbnail, fname, fupname, fsize
FROM video;

SELECT videono, title, artist, release, youtube, songno, albumno, artistno, seqno, thumbnail, fname, fupname, fsize
FROM video
WHERE videono = 3;

DELETE FROM video
WHERE videono = 3;

UPDATE video
SET title = 'REMEDY (Feat. û�� (CHUNG HA))'
WHERE videono = 6;

commit;  
  
  



