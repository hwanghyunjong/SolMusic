package dev.mvc.album;

public class Artist_Album_VO {
 //----------------------------------------------------------------------
 // Artist table
 // ----------------------------------------------------------------------
  /** �θ� ���̺� ��Ƽ��Ʈ ��ȣ */  
  private int r_artistno;
  /** �θ� ���̺� ��Ƽ��Ʈ �̸� */  
  private String r_name;
  
 //----------------------------------------------------------------------
 // Album table
 // ----------------------------------------------------------------------
  /** �ٹ� ��ȣ */
  private int l_albumno;
  /** �ٹ� �̸� */
  private String l_title;
  /** �ٹ� ���� �̸� */
  private String l_fname;
  
  
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
  
  


}
