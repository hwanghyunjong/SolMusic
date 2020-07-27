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
        
    -- ��Ƽ��Ʈ �̹��� �κ�
    thumbnail               VARCHAR2(200)        NULL,
    fname                    VARCHAR2(100)        NOT NULL,
    fupname                VARCHAR2(100)         NOT NULL,
    fsize                      NUMBER(10)             DEFAULT 0         NOT NULL,
  FOREIGN KEY (artistno) REFERENCES Artist (artistno)
);
  */
  
  /** ��Ƽ��Ʈ ��ȣ */
  private int albumno;
  /** ��Ƽ��Ʈ �̸� */
  private String title;
  /** ��Ƽ��Ʈ �̸� */
  private String kind;
  /** ��Ƽ��Ʈ �̸� */
  private String release;
  /** ��Ƽ��Ʈ �̸� */
  private String genre;
  /** ��Ƽ��Ʈ �̸� */
  private String enter;
  /** ���ƿ� ���� */
  private int likey;
  /** ��Ƽ��Ʈ �̸� */
  private String intro;
  /** ��Ƽ��Ʈ �̸� */
  private String detail;
  /** ���ƿ� ���� */
  private int artistno;

  /** ����� */
  private String thumbnail;
  /** ���� �̸� */
  private String fname;
  /** ���� ���ε� �̸� */
  private String fupname;
  /** ���� ũ�� */
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
