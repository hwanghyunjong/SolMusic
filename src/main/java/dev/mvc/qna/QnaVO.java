package dev.mvc.qna;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/*

CREATE TABLE qna(
    qnano             NUMBER(10) NOT NULL primary key,
    //userID             VARCHAR2(100)  NOT NULL,
    qna_seqno             NUMBER(5)    DEFAULT 1     NOT NULL,
    qna_state               VARCHAR2(50) DEFAULT '�̴亯' NOT NULL,
    qna_categrpname     VARCHAR2(100) NOT NULL,
    qna_email               VARCHAR2(200) NOT NULL,
    qna_title                 VARCHAR2(300)    NOT NULL,
    qna_content            VARCHAR2(2000)    NOT NULL,
    word                                  VARCHAR2(300)         NULL ,
    grpno                    NUMBER(8)         DEFAULT 0         NOT NULL,
    indent                   NUMBER(2)         DEFAULT 0         NOT NULL,
    ansnum                  NUMBER(3)         DEFAULT 0         NOT NULL,
    qna_fname              VARCHAR2(100)    NULL ,
    qna_fupname           VARCHAR2(100)    NULL ,
    qna_thumb              VARCHAR2(100)    NULL ,
    qna_fsize                NUMBER(10)     DEFAULT 0  NULL,
    qna_rdate               DATE     NOT NULL
    
*/


public class QnaVO {
  /**���� ��ȣ*/
  private int qnano;
  /**ȸ�� ��ȣ*/
  private int userno;
  /**��� ����*/
  private int qna_seqno;     
  /**�亯����*/
  private String qna_state;
  /**ī�װ� �̸�*/
  private String qna_categrpname;
  /**�̸���*/
  private String qna_email;
  /**����*/
  private String qna_title;
  /**����*/
  private String qna_content;
  private int grpno;
  private int indent;
  private int ansnum;
  public int getGrpno() {
    return grpno;
  }
  public void setGrpno(int grpno) {
    this.grpno = grpno;
  }
  public int getIndent() {
    return indent;
  }
  public void setIndent(int indent) {
    this.indent = indent;
  }
  public int getAnsnum() {
    return ansnum;
  }
  public void setAnsnum(int ansnum) {
    this.ansnum = ansnum;
  }
  /**���� ���ϸ�*/
  private String qna_fname;
  /** ���ε�� ���ϸ� */
  private String qna_fupname;
  /** Thumb �̹��� */
  private String qna_thumb;
  /**���� ������*/
  private long qna_fsize;
  /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� List�� ����  */
  private List<MultipartFile>fnamesMF;
  /**�����*/
  private String qna_rdate;
  
  public int getQnano() {
    return qnano;
  }
  public void setQnano(int qnano) {
    this.qnano = qnano;
  }
  public int getUserno() {
    return userno;
  }
  public void setUserno(int userno) {
    this.userno = userno;
  }
  public int getQna_seqno() {
    return qna_seqno;
  }
  public void setQna_seqno(int qna_seqno) {
    this.qna_seqno = qna_seqno;
  }
  public String getQna_categrpname() {
    return qna_categrpname;
  }
  public void setQna_categrpname(String qna_categrpname) {
    this.qna_categrpname = qna_categrpname;
  }
  public String getQna_email() {
    return qna_email;
  }
  public void setQna_email(String qna_email) {
    this.qna_email = qna_email;
  }
  public String getQna_title() {
    return qna_title;
  }
  public void setQna_title(String qna_title) {
    this.qna_title = qna_title;
  }
  public String getQna_content() {
    return qna_content;
  }
  public void setQna_content(String qna_content) {
    this.qna_content = qna_content;
  }
  public String getQna_fname() {
    return qna_fname;
  }
  public void setQna_fname(String qna_fname) {
    this.qna_fname = qna_fname;
  }
  public String getQna_rdate() {
    return qna_rdate;
  }
  public void setQna_rdate(String qna_rdate) {
    this.qna_rdate = qna_rdate;
  }

  public String getQna_state() {
    return qna_state;
  }
  public void setQna_state(String qna_state) {
    this.qna_state = qna_state;
  }
  public String getQna_fupname() {
    return qna_fupname;
  }
  public void setQna_fupname(String qna_fupname) {
    this.qna_fupname = qna_fupname;
  }
  public String getQna_thumb() {
    return qna_thumb;
  }
  public void setQna_thumb(String qna_thumb) {
    this.qna_thumb = qna_thumb;
  }
  public long getQna_fsize() {
    return qna_fsize;
  }
  public void setQna_fsize(long qna_fsize) {
    this.qna_fsize = qna_fsize;
  }
  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }
  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }


  
}