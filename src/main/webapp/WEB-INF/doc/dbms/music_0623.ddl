/**********************************/
/* Table Name: ��Ƽ��Ʈ */
/**********************************/
CREATE TABLE Artist(
		artistno                      		NUMBER(8)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(200)		 NOT NULL,
		like                          		NUMBER(8)		 DEFAULT 0		 NULL 
);

COMMENT ON TABLE Artist is '��Ƽ��Ʈ';
COMMENT ON COLUMN Artist.artistno is '��Ƽ��Ʈ ��ȣ';
COMMENT ON COLUMN Artist.name is '�̸�';
COMMENT ON COLUMN Artist.like is '���ƿ�';


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


/**********************************/
/* Table Name: ���� */
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

COMMENT ON TABLE Music is '����';
COMMENT ON COLUMN Music.songno is '���ǹ�ȣ';
COMMENT ON COLUMN Music.title is '�� �̸�';
COMMENT ON COLUMN Music.albumno is '�ٹ� ��ȣ';
COMMENT ON COLUMN Music.Muvieno is '�º� ��ȣ';
COMMENT ON COLUMN Music.lyricist is '�ۻ簡';
COMMENT ON COLUMN Music.composer is '�۰';
COMMENT ON COLUMN Music.genre is '�帣';
COMMENT ON COLUMN Music.reldate is '�߸�����';
COMMENT ON COLUMN Music.cnt is '��ȸ��';
COMMENT ON COLUMN Music.lyrics is '����';
COMMENT ON COLUMN Music.artistno is '��Ƽ��Ʈ ��ȣ';
COMMENT ON COLUMN Music.youtube is '��������';


/**********************************/
/* Table Name: Į�� */
/**********************************/
CREATE TABLE Column(
		columno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		songno                        		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (songno) REFERENCES Music (songno)
);

COMMENT ON TABLE Column is 'Į��';
COMMENT ON COLUMN Column.columno is 'Į�� ��ȣ';
COMMENT ON COLUMN Column.songno is '���ǹ�ȣ';
COMMENT ON COLUMN Column.title is '����';


/**********************************/
/* Table Name: �ְ� ��Ʈ */
/**********************************/
CREATE TABLE Top100_weekly(
		weeklyno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rank                          		NUMBER(3)		 NOT NULL,
		title                         		VARCHAR2(100)		 NOT NULL,
		artist                        		VARCHAR2(100)		 NOT NULL,
		songno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (songno) REFERENCES Music (songno)
);

COMMENT ON TABLE Top100_weekly is '�ְ� ��Ʈ';
COMMENT ON COLUMN Top100_weekly.weeklyno is '��Ʈ ��ȣ';
COMMENT ON COLUMN Top100_weekly.rank is '����';
COMMENT ON COLUMN Top100_weekly.title is '����';
COMMENT ON COLUMN Top100_weekly.artist is '����';
COMMENT ON COLUMN Top100_weekly.songno is '���ǹ�ȣ';


/**********************************/
/* Table Name: ÷������ */
/**********************************/
CREATE TABLE Attached_file(
		attachedno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		songno                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (songno) REFERENCES Music (songno)
);

COMMENT ON TABLE Attached_file is '÷������';
COMMENT ON COLUMN Attached_file.attachedno is '÷������ ��ȣ';
COMMENT ON COLUMN Attached_file.songno is '���ǹ�ȣ';


