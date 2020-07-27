package dev.mvc.faq;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE faq(
    faqno                  NUMBER(10) NOT NULL primary key,
    cateno                  NUMBER(10)         NOT NULL ,
    faq_categrp            VARCHAR2(100) NOT NULL,
    faq_word               VARCHAR2(300)    NULL , 
    faq_title                 VARCHAR2(300)    NOT NULL,
    faq_content            CLOB    NOT NULL,
    FOREIGN KEY (cateno) REFERENCES fcate (cateno)
);
*/

public class FaqVO {

  /** 질문번호 */
  private int faqno;
  private int cateno;
  /** 카테고리 */
  private String faq_categrp;
  /** 질문키워드 */
  private String faq_word;
  /** 질문제목 */
  private String faq_title;
  /** 질문내용 */
  private String faq_content;

  /** 이미지 */
  private String file1;
  /** preview 이미지 preview */
  private String thumb1;
  /** 저장된 파일 사이즈 */
  private long size1;
  /** 이미지 MultipartFile */
  private MultipartFile file1MF;

  public int getFaqno() {
    return faqno;
  }

  public void setFaqno(int faqno) {
    this.faqno = faqno;
  }

  public String getFaq_categrp() {
    return faq_categrp;
  }

  public void setFaq_categrp(String faq_categrp) {
    this.faq_categrp = faq_categrp;
  }

  public String getFaq_word() {
    return faq_word;
  }

  public void setFaq_word(String faq_word) {
    this.faq_word = faq_word;
  }

  public String getFaq_title() {
    return faq_title;
  }

  public void setFaq_title(String faq_title) {
    this.faq_title = faq_title;
  }

  public String getFaq_content() {
    return faq_content;
  }

  public void setFaq_content(String faq_content) {
    this.faq_content = faq_content;
  }

  public int getCateno() {
    return cateno;
  }

  public void setCateno(int cateno) {
    this.cateno = cateno;
  }

  public String getFile1() {
    return file1;
  }

  public void setFile1(String file1) {
    this.file1 = file1;
  }

  public String getThumb1() {
    return thumb1;
  }

  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }

  public long getSize1() {
    return size1;
  }

  public void setSize1(long size1) {
    this.size1 = size1;
  }

  public MultipartFile getFile1MF() {
    return file1MF;
  }

  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  
  

}
