package dev.mvc.artist;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ArtistVO {
  /*
  CREATE TABLE Artist(
      artistno                   NUMBER(10)        NOT NULL    PRIMARY KEY,
      name                     VARCHAR2(200)     NOT NULL,
      likey                       NUMBER(10)         DEFAULT 0     NULL ,
      debut                     NUMBER(5)            NOT NULL,
      genre                     VARCHAR2(50)     NOT NULL,
      nation                     VARCHAR2(50)    NOT NULL,
      type                       VARCHAR2(50)    NOT NULL
  );
  */
  
  /** 아티스트 번호 */
  private int artistno;
  /** 아티스트 이름 */
  private String name;
  /** 좋아요 갯수 */
  private int likey;
  /** 데뷔 년도 */
  private int debut;
  /** 출력 순서*/
  private int seqno;
  /** 장르 */
  private String genre;
  /** 국적 */
  private String nation;
  /** 음악 유형 */
  private String type;
  /** 썸네일 */
  private String thumbnail;
  /** 파일 이름 */
  private String fname;
  /** 파일 업로드 이름 */
  private String fupname;
  /** 파일 크기 */
  private long fsize;
  
  private List<MultipartFile> fnamesMF;
  
  public int getArtistno() {
    return artistno;
  }
  
  public void setArtistno(int artistno) {
    this.artistno = artistno;
  }
  
  public String getName() {
    return name;
  }
  
  public void setName(String name) {
    this.name = name;
  }
  
  public int getLikey() {
    return likey;
  }
  
  public void setLikey(int likey) {
    this.likey = likey;
  }
  
  public int getDebut() {
    return debut;
  }
  
  public void setDebut(int debut) {
    this.debut = debut;
  }
  
  public int getSeqno() {
    return seqno;
  }

  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }

  public String getGenre() {
    return genre;
  }
  
  public void setGenre(String genre) {
    this.genre = genre;
  }
  
  public String getNation() {
    return nation;
  }
  
  public void setNation(String nation) {
    this.nation = nation;
  }
  
  public String getType() {
    return type;
  }
  
  public void setType(String type) {
    this.type = type;
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
