package dev.mvc.qna;

public class Qna_user_VO {
 //----------------------------------------------------------------------
 // QNA table
 // ----------------------------------------------------------------------
  /** ���� ��ȣ*/
  private int q_qnano;
  /** ȸ�� ��ȣ*/
  private int q_userno;
  /** ��� ����*/
  private int q_qna_seqno;     
  /** �亯����*/
  private String q_qna_state;
  /** ī�װ� �̸�*/
  private String q_qna_categrpname;
  /** ����*/
  private String q_qna_title;
  /** ����*/
  private String q_qna_content;
  /** ���� �̸�*/
  private String q_qna_fname;
 
 //----------------------------------------------------------------------
 // User table
 // ----------------------------------------------------------------------
  /** ȸ�� ��ȣ*/
  private int u_userno;
  /** ȸ�� ���̵�*/
  private String u_userID;
  
 
  public int getQ_qnano() {
    return q_qnano;
  }
  public void setQ_qnano(int q_qnano) {
    this.q_qnano = q_qnano;
  }
  public int getQ_userno() {
    return q_userno;
  }
  public void setQ_userno(int q_userno) {
    this.q_userno = q_userno;
  }
  public int getQ_qna_seqno() {
    return q_qna_seqno;
  }
  public void setQ_qna_seqno(int q_qna_seqno) {
    this.q_qna_seqno = q_qna_seqno;
  }
  public String getQ_qna_state() {
    return q_qna_state;
  }
  public void setQ_qna_state(String q_qna_state) {
    this.q_qna_state = q_qna_state;
  }
  public String getQ_qna_categrpname() {
    return q_qna_categrpname;
  }
  public void setQ_qna_categrpname(String q_qna_categrpname) {
    this.q_qna_categrpname = q_qna_categrpname;
  }
  public String getQ_qna_title() {
    return q_qna_title;
  }
  public void setQ_qna_title(String q_qna_title) {
    this.q_qna_title = q_qna_title;
  }
  public String getQ_qna_content() {
    return q_qna_content;
  }
  public void setQ_qna_content(String q_qna_content) {
    this.q_qna_content = q_qna_content;
  }
  public String getQ_qna_fname() {
    return q_qna_fname;
  }
  public void setQ_qna_fname(String q_qna_fname) {
    this.q_qna_fname = q_qna_fname;
  }
  public int getU_userno() {
    return u_userno;
  }
  public void setU_userno(int u_userno) {
    this.u_userno = u_userno;
  }
  public String getU_userID() {
    return u_userID;
  }
  public void setU_userID(String u_userID) {
    this.u_userID = u_userID;
  }
  
  
  
  
  


  
}