package dev.mvc.admin;

public class AdminVO { 
  /*
  adminno                           NUMBER(7)    NOT NULL    PRIMARY KEY,
  adminID                           VARCHAR2(300)    NOT NULL,
  adminpw                           VARCHAR2(300)    NOT NULL,
  admin_name                        VARCHAR2(150)    NOT NULL,
  admin_tel                         VARCHAR2(150)    NOT NULL,
  admin_tel2                        VARCHAR2(150)    NOT NULL,
  admin_tel3                        VARCHAR2(150)    NOT NULL,
  admin_email                       VARCHAR2(300)    NOT NULL,
  admin_email2                      VARCHAR2(300)    NOT NULL,
  admin_role                        VARCHAR2(300)    NOT NULL,
  admin_power                       VARCHAR2(300)    NOT NULL,
  admin_date                        DATE     NOT NULL
  */

  /** ������ ��ȣ */
  private int adminno;
  /** ������ ���̵� */
  private String adminID;
  /** ������ �н����� */
  private String adminpw;
  /** ������ �̸� */
  private String admin_name;
  /** ������ ��ȭ��ȣ */
  private String admin_tel;
  /** ������ ��ȭ��ȣ2 */
  private String admin_tel2;
  /** ������ ��ȭ��ȣ3 */
  private String admin_tel3;  
  /** ������ �̸��� */
  private String admin_email;
  /** ������ �̸���2 */
  private String admin_email2;  
  /** ������ ���� */
  private String admin_role;
  /** ������ ���� */
  private String admin_power;
  /** ������ ������ */
  private String admin_date;
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  public String getAdminID() {
    return adminID;
  }
  public void setAdminID(String adminID) {
    this.adminID = adminID;
  }
  public String getAdminpw() {
    return adminpw;
  }
  public void setAdminpw(String adminpw) {
    this.adminpw = adminpw;
  }
  public String getAdmin_name() {
    return admin_name;
  }
  public void setAdmin_name(String admin_name) {
    this.admin_name = admin_name;
  }
  public String getAdmin_tel() {
    return admin_tel;
  }
  public void setAdmin_tel(String admin_tel) {
    this.admin_tel = admin_tel;
  }
  public String getAdmin_tel2() {
    return admin_tel2;
  }
  public void setAdmin_tel2(String admin_tel2) {
    this.admin_tel2 = admin_tel2;
  }
  public String getAdmin_tel3() {
    return admin_tel3;
  }
  public void setAdmin_tel3(String admin_tel3) {
    this.admin_tel3 = admin_tel3;
  }
  public String getAdmin_email() {
    return admin_email;
  }
  public void setAdmin_email(String admin_email) {
    this.admin_email = admin_email;
  }
  public String getAdmin_email2() {
    return admin_email2;
  }
  public void setAdmin_email2(String admin_email2) {
    this.admin_email2 = admin_email2;
  }
  public String getAdmin_role() {
    return admin_role;
  }
  public void setAdmin_role(String admin_role) {
    this.admin_role = admin_role;
  }
  public String getAdmin_power() {
    return admin_power;
  }
  public void setAdmin_power(String admin_power) {
    this.admin_power = admin_power;
  }
  public String getAdmin_date() {
    return admin_date;
  }
  public void setAdmin_date(String admin_date) {
    this.admin_date = admin_date;
  }
  
  
  
  
}
