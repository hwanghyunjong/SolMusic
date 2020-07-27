package dev.mvc.video;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class VideoVO {
  /*
  CREATE TABLE Video(
        videono                          NUMBER(10)           NOT NULL     PRIMARY KEY,
        title                               VARCHAR2(100)     NOT NULL,
        artist                              VARCHAR2(100)      NULL,
        release                           VARCHAR2(100)      NOT NULL,
        youtube                         VARCHAR2(1000)      NULL,
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
  */
  
  /** ���� ��ȣ */
  private int videono;
  /** ���� */
  private String title;
  /** ��Ƽ��Ʈ */
  private String artist;
  /** �Խ����� */
  private String release;
  /** ��Ʃ�� */
  private String youtube;
  /** �뷡 ��ȣ */
  private int songno;
  /** �ٹ� ��ȣ */
  private int albumno;
  /** ��Ƽ��Ʈ ��ȣ */
  private int artistno;
  /** ��� ���� */
  private int seqno;
  /** ����� */
  private String thumbnail;
  /** ���� �̸� */
  private String fname;
  /** ���� ���ε� �̸� */
  private String fupname;
  /** ���� ũ�� */
  private long fsize;
  
  private List<MultipartFile> fnamesMF;
  
  public int getVideono() {
    return videono;
  }
  public void setVideono(int videono) {
    this.videono = videono;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getArtist() {
    return artist;
  }
  public void setArtist(String artist) {
    this.artist = artist;
  }
  public String getRelease() {
    return release;
  }
  public void setRelease(String release) {
    this.release = release;
  }
  public String getYoutube() {
    return youtube;
  }
  public void setYoutube(String youtube) {
    this.youtube = youtube;
  }
  public int getSongno() {
    return songno;
  }
  public void setSongno(int songno) {
    this.songno = songno;
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
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
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
