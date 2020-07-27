/**********************************/
/* Table Name: 아티스트 */
/**********************************/
CREATE TABLE Artist(
		artistno                      		NUMBER(8)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(200)		 NOT NULL,
		like                          		NUMBER(8)		 DEFAULT 0		 NULL 
);

COMMENT ON TABLE Artist is '아티스트';
COMMENT ON COLUMN Artist.artistno is '아티스트 번호';
COMMENT ON COLUMN Artist.name is '이름';
COMMENT ON COLUMN Artist.like is '좋아요';


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


/**********************************/
/* Table Name: 음악 */
/**********************************/
CREATE TABLE Music(
		songno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(100)		 NOT NULL,
		albumno                       		NUMBER(10)		 NULL ,
		Muvieno                       		NUMBER(10)		 NULL ,
		lyricist                      		VARCHAR2(100)		 NULL ,
		composer                      		VARCHAR2(100)		 NULL ,
		genre                         		VARCHAR2(50)		 NOT NULL,
		reldate                       		DATE		 NOT NULL,
		cnt                           		NUMBER(100)		 DEFAULT 0		 NULL ,
		lyrics                        		VARCHAR2(1000)		 NOT NULL,
		artistno                      		NUMBER(10)		 NULL ,
		youtube                       		VARCHAR2(1000)		 NULL ,
  FOREIGN KEY (artistno) REFERENCES Artist (artistno),
  FOREIGN KEY (albumno) REFERENCES Album (albumno)
);

COMMENT ON TABLE Music is '음악';
COMMENT ON COLUMN Music.songno is '음악번호';
COMMENT ON COLUMN Music.title is '곡 이름';
COMMENT ON COLUMN Music.albumno is '앨범 번호';
COMMENT ON COLUMN Music.Muvieno is '뮤비 번호';
COMMENT ON COLUMN Music.lyricist is '작사가';
COMMENT ON COLUMN Music.composer is '작곡가';
COMMENT ON COLUMN Music.genre is '장르';
COMMENT ON COLUMN Music.reldate is '발매일자';
COMMENT ON COLUMN Music.cnt is '조회수';
COMMENT ON COLUMN Music.lyrics is '가사';
COMMENT ON COLUMN Music.artistno is '아티스트 번호';
COMMENT ON COLUMN Music.youtube is '뮤직비디오';


/**********************************/
/* Table Name: 칼럼 */
/**********************************/
CREATE TABLE Column(
		columno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		songno                        		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (songno) REFERENCES Music (songno)
);

COMMENT ON TABLE Column is '칼럼';
COMMENT ON COLUMN Column.columno is '칼럼 번호';
COMMENT ON COLUMN Column.songno is '음악번호';
COMMENT ON COLUMN Column.title is '제목';


/**********************************/
/* Table Name: 주간 차트 */
/**********************************/
CREATE TABLE Top100_weekly(
		weeklyno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rank                          		NUMBER(3)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		artist                        		VARCHAR2(100)		 NOT NULL,
		songno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (songno) REFERENCES Music (songno)
);

COMMENT ON TABLE Top100_weekly is '주간 차트';
COMMENT ON COLUMN Top100_weekly.weeklyno is '차트 번호';
COMMENT ON COLUMN Top100_weekly.rank is '순위';
COMMENT ON COLUMN Top100_weekly.title is '제목';
COMMENT ON COLUMN Top100_weekly.artist is '가수';
COMMENT ON COLUMN Top100_weekly.songno is '음악번호';


/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
CREATE TABLE Attached_file(
		attachedno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		songno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (songno) REFERENCES Music (songno)
);

COMMENT ON TABLE Attached_file is '첨부파일';
COMMENT ON COLUMN Attached_file.attachedno is '첨부파일 번호';
COMMENT ON COLUMN Attached_file.songno is '음악번호';


