package dev.mvc.music;

import org.springframework.web.multipart.MultipartFile;

public class MusicVO {
  /*
  CREATE TABLE Music(
    songno                         NUMBER(10)         NOT NULL    PRIMARY KEY,
    title                             VARCHAR2(100)     NOT NULL,
    lyricist                          VARCHAR2(100)     NULL,
    likey                             NUMBER(10)         DEFAULT 0     NULL,
    composer                      VARCHAR2(100)     NULL,
    cnt                               NUMBER(38)         DEFAULT 0     NULL,
    mp3                             VARCHAR2(1000)   NOT NULL,
    lyrics                             VARCHAR2(4000)   NOT NULL,
    albumno                        NUMBER(10)         NULL ,
    youtube                         VARCHAR2(1000)   NULL ,
    FOREIGN KEY (albumno) REFERENCES Album (albumno)
  );
  */
  
  /** 노래 번호 */
  private int songno;
  /** 노래 제목 */
  private String title;
  /** 작사가 */
  private String lyricist;
  /** 좋아요 */
  private int likey;
  /** 작곡가*/
  private String composer;
  /** 조회수 */
  private int cnt;
  /** 출력 순서 */
  private int seqno;
  /** mp3 */
  private String mp3;
  /** MP3 Spring */
  private MultipartFile mp3MF;
  /** 가사 */
  private String lyrics;
  /** 앨범 번호 */
  private int albumno;
  /** 아티스트 번호 */
  private int artistno;
  /** 유튜브 */
  private String youtube;
  
  public int getSongno() {
    return songno;
  }
  
  public void setSongno(int songno) {
    this.songno = songno;
  }
  
  public String getTitle() {
    return title;
  }
  
  public void setTitle(String title) {
    this.title = title;
  }
  
  public String getLyricist() {
    return lyricist;
  }
  
  public void setLyricist(String lyricist) {
    this.lyricist = lyricist;
  }
  
  public int getLikey() {
    return likey;
  }
  
  public void setLikey(int likey) {
    this.likey = likey;
  }
  
  public int getSeqno() {
    return seqno;
  }

  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }

  public String getComposer() {
    return composer;
  }
  
  public void setComposer(String composer) {
    this.composer = composer;
  }
  
  public MultipartFile getMp3MF() {
    return mp3MF;
  }
  
  public void setMp3MF(MultipartFile mp3mf) {
    mp3MF = mp3mf;
  }
  
  public int getCnt() {
    return cnt;
  }
  
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  public String getMp3() {
    return mp3;
  }
  
  public void setMp3(String mp3) {
    this.mp3 = mp3;
  }
  
  public String getLyrics() {
    return lyrics;
  }
  
  public void setLyrics(String lyrics) {
    this.lyrics = lyrics;
  }
  
  public int getAlbumno() {
    return albumno;
  }
  
  public void setAlbumno(int albumno) {
    this.albumno = albumno;
  }
  
  public int getArtistno() {
    return artistno;
  }

  public void setArtistno(int artistno) {
    this.artistno = artistno;
  }

  public String getYoutube() {
    return youtube;
  }
  
  public void setYoutube(String youtube) {
    this.youtube = youtube;
  }
  
  
  
  
  

}
