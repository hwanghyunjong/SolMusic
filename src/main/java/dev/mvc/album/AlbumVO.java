package dev.mvc.album;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AlbumVO {
  /*
  CREATE TABLE Album(
    albumno                       NUMBER(10)        NOT NULL    PRIMARY KEY,
    title                             VARCHAR2(50)     NOT NULL,
    kind                             VARCHAR2(20)     NOT NULL,
    release                         VARCHAR2(10)     NOT NULL,
    genre                           VARCHAR2(10)     NOT NULL,
    enter                            VARCHAR2(10)     NOT NULL,
    likey                             NUMBER(10)        DEFAULT 0     NULL,
    intro                             VARCHAR2(25)     NULL,
    detail                           VARCHAR2(1000)      NULL,
    artistno                          NUMBER(10)        NULL,
        
    -- 아티스트 이미지 부분
    thumbnail               VARCHAR2(200)        NULL,
    fname                    VARCHAR2(100)        NOT NULL,
    fupname                VARCHAR2(100)         NOT NULL,
    fsize                      NUMBER(10)             DEFAULT 0         NOT NULL,
  FOREIGN KEY (artistno) REFERENCES Artist (artistno)
);
  */
  
  /** 아티스트 번호 */
  private int albumno;
  /** 아티스트 이름 */
  private String title;
  /** 아티스트 이름 */
  private String kind;
  /** 아티스트 이름 */
  private String release;
  /** 아티스트 이름 */
  private String genre;
  /** 아티스트 이름 */
  private String enter;
  /** 좋아요 갯수 */
  private int likey;
  /** 아티스트 이름 */
  private String intro;
  /** 아티스트 이름 */
  private String detail;
  /** 좋아요 갯수 */
  private int artistno;

  /** 썸네일 */
  private String thumbnail;
  /** 파일 이름 */
  private String fname;
  /** 파일 업로드 이름 */
  private String fupname;
  /** 파일 크기 */
  private long fsize;
  
  private List<MultipartFile> fnamesMF;

  public int getAlbumno() {
    return albumno;
  }

  public void setAlbumno(int albumno) {
    this.albumno = albumno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getKind() {
    return kind;
  }

  public void setKind(String kind) {
    this.kind = kind;
  }

  public String getRelease() {
    return release;
  }

  public void setRelease(String release) {
    this.release = release;
  }

  public String getGenre() {
    return genre;
  }

  public void setGenre(String genre) {
    this.genre = genre;
  }

  public String getEnter() {
    return enter;
  }

  public void setEnter(String enter) {
    this.enter = enter;
  }

  public int getLikey() {
    return likey;
  }

  public void setLikey(int likey) {
    this.likey = likey;
  }

  public String getIntro() {
    return intro;
  }

  public void setIntro(String intro) {
    this.intro = intro;
  }

  public String getDetail() {
    return detail;
  }

  public void setDetail(String detail) {
    this.detail = detail;
  }

  public int getArtistno() {
    return artistno;
  }

  public void setArtistno(int artistno) {
    this.artistno = artistno;
  }

  public String getThumbnail() {
    return thumbnail;
  }

  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }

  public String getFname() {
    return fname;
  }

  public void setFname(String fname) {
    this.fname = fname;
  }

  public String getFupname() {
    return fupname;
  }

  public void setFupname(String fupname) {
    this.fupname = fupname;
  }

  public long getFsize() {
    return fsize;
  }

  public void setFsize(long fsize) {
    this.fsize = fsize;
  }

  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }

  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  
  
  



}
