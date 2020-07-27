package dev.mvc.music;


public class Music_Album_Artist_VO {
  //----------------------------------------------------------------------
  // Artist table
  // ----------------------------------------------------------------------
  /** 아티스트 번호 */
  private int r_artistno;
  /** 아티스트 이름 */
  private String r_name;
  
  //----------------------------------------------------------------------
  // Album table
  // ----------------------------------------------------------------------
  /** 앨범 번호 */
  private int l_albumno;
  /** 앨범 이름 */
  private String l_title;
  /** 앨범 파일 이름 */
  private String l_fname;
  /** 앨범 출시일 */
  private String l_release;
  /** 앨범 아티스트 번호 */
  private int l_artistno;
  
  // ----------------------------------------------------------------------
  // Music table
  // ----------------------------------------------------------------------
  /** 노래 번호 */
  private int s_songno;
  /** 노래 이름 */
  private String s_title;
  /** 작사가 */
  private String s_lyricist;
  /** 작곡가 */
  private String s_composer;
  /** 노래 */
  private String s_mp3;
  /** 노래 앨범 번호 */
  private int s_albumno;
  /** 노래 가수 번호*/
  private int s_artistno;
  /** 노래 가사 */
  private String s_lyrics;
  /** 좋아요 */
  private int s_likey;
  
  
  public int getR_artistno() {
    return r_artistno;
  }
  public void setR_artistno(int r_artistno) {
    this.r_artistno = r_artistno;
  }
  public String getR_name() {
    return r_name;
  }
  public void setR_name(String r_name) {
    this.r_name = r_name;
  }
  public int getL_albumno() {
    return l_albumno;
  }
  public void setL_albumno(int l_albumno) {
    this.l_albumno = l_albumno;
  }
  public String getL_title() {
    return l_title;
  }
  public void setL_title(String l_title) {
    this.l_title = l_title;
  }
  public String getL_fname() {
    return l_fname;
  }
  public void setL_fname(String l_fname) {
    this.l_fname = l_fname;
  }
  public String getL_release() {
    return l_release;
  }
  public void setL_release(String l_release) {
    this.l_release = l_release;
  }
  public int getL_artistno() {
    return l_artistno;
  }
  public void setL_artistno(int l_artistno) {
    this.l_artistno = l_artistno;
  }
  public int getS_songno() {
    return s_songno;
  }
  public void setS_songno(int s_songno) {
    this.s_songno = s_songno;
  }
  public String getS_title() {
    return s_title;
  }
  public void setS_title(String s_title) {
    this.s_title = s_title;
  }
  public String getS_lyricist() {
    return s_lyricist;
  }
  public void setS_lyricist(String s_lyricist) {
    this.s_lyricist = s_lyricist;
  }
  public String getS_composer() {
    return s_composer;
  }
  public void setS_composer(String s_composer) {
    this.s_composer = s_composer;
  }
  public String getS_mp3() {
    return s_mp3;
  }
  public void setS_mp3(String s_mp3) {
    this.s_mp3 = s_mp3;
  }
  public int getS_albumno() {
    return s_albumno;
  }
  public void setS_albumno(int s_albumno) {
    this.s_albumno = s_albumno;
  }
  public String getS_lyrics() {
    return s_lyrics;
  }
  public void setS_lyrics(String s_lyrics) {
    this.s_lyrics = s_lyrics;
  }
  public int getS_artistno() {
    return s_artistno;
  }
  public void setS_artistno(int s_artistno) {
    this.s_artistno = s_artistno;
  }
  public int getS_likey() {
    return s_likey;
  }
  public void setS_likey(int s_likey) {
    this.s_likey = s_likey;
  }
  
  
  
  
  
  
  

}
