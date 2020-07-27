package dev.mvc.users;

public class UsersVO {
  /*
    userno                            NUMBER(7)    NOT NULL    PRIMARY KEY,
    userID                            VARCHAR2(300)    NOT NULL,
    userpw                            VARCHAR2(300)    NOT NULL,
    user_name                          VARCHAR2(300)       NOT NULL,   
    nickname                           VARCHAR2(300)       NOT NULL,   
    user_identify                     NUMBER(7)    NOT NULL,
    user_identify2                    NUMBER(7)    NOT NULL,
    user_tel                            VARCHAR2(150)      NOT NULL,        
    user_tel2                           VARCHAR2(150)      NOT NULL,
    user_tel3                           VARCHAR2(150)      NOT NULL,
    user_email                        VARCHAR2(1000)     NOT NULL,
    user_email2                       VARCHAR2(1000)     NOT NULL,   -- ���� �߰��ȵ� 
    user_zipcode                      VARCHAR2(150)    NULL,
    user_address1                     VARCHAR2(1500)     NULL,
    user_address2                     VARCHAR2(1500)     NULL,
    user_point                        NUMBER(7)    DEFAULT 0     NULL ,
    coupon                            VARCHAR2(250)    NULL ,
    user_date                         DATE     NOT NULL
  */
  
  
  /** ȸ����ȣ */
  private int userno;
  /** ȸ�� ���̵� */
  private String userID;
  /** ȸ�� �н����� */
  private String userpw;
  /** ȸ�� �̸� */
  private String user_name;
  /** �г��� */
  private String nickname;
  /** �ֹε�Ϲ�ȣ */
  private String user_identify;
  /** �ֹε�Ϲ�ȣ */
  private String user_identify2;
  /** ��ȭ��ȣ */
  private String user_tel;
  /** ��ȭ��ȣ2 */
  private String user_tel2;
  /** ��ȭ��ȣ3 */
  private String user_tel3;  
  /** �̸��� */
  private String user_email;
  /** �̸���2 */
  private String user_email2;  
  /** �����ȣ */
  private String user_zipcode;
  /** �ּ� */
  private String user_address1;
  /** ���ּ� */
  private String user_address2;
  /** ����Ʈ */
  private int user_point;
  /** ���� */
  private String coupon;
  /** ������ */
  private String user_date;
  
  /** ��ϵ� �н����� */
  private String old_passwd = "";
  /** id ���� ���� */
  private String id_save = "";
  /** passwd ���� ���� */
  private String passwd_save = "";
  /** �̵��� �ּ� ���� */
  private String url_address = "";
  
  
  public int getUserno() {
    return userno;
  }
  public String getUserID() {
    return userID;
  }
  public String getUserpw() {
    return userpw;
  }
  public String getUser_name() {
    return user_name;
  }
  public String getUser_identify() {
    return user_identify;
  }
  public String getUser_tel() {
    return user_tel;
  }
  public String getUser_email() {
    return user_email;
  }
  public String getUser_zipcode() {
    return user_zipcode;
  }
  public String getUser_address1() {
    return user_address1;
  }
  public String getUser_address2() {
    return user_address2;
  }
  public int getUser_point() {
    return user_point;
  }
  public String getCoupon() {
    return coupon;
  }
  public String getUser_date() {
    return user_date;
  }
  public void setUserno(int userno) {
    this.userno = userno;
  }
  public void setUserID(String userID) {
    this.userID = userID;
  }
  public void setUserpw(String userpw) {
    this.userpw = userpw;
  }
  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }
  public void setUser_identify(String user_identify) {
    this.user_identify = user_identify;
  }
  public String getUser_identify2() {
    return user_identify2;
  }
  public void setUser_identify2(String user_identify2) {
    this.user_identify2 = user_identify2;
  }
  public void setUser_tel(String user_tel) {
    this.user_tel = user_tel;
  }
  public void setUser_email(String user_email) {
    this.user_email = user_email;
  }
  public void setUser_zipcode(String user_zipcode) {
    this.user_zipcode = user_zipcode;
  }
  public void setUser_address1(String user_address1) {
    this.user_address1 = user_address1;
  }
  public void setUser_address2(String user_address2) {
    this.user_address2 = user_address2;
  }
  public void setUser_point(int user_point) {
    this.user_point = user_point;
  }
  public void setCoupon(String coupon) {
    this.coupon = coupon;
  }
  public void setUser_date(String user_date) {
    this.user_date = user_date;
  }
  public String getOld_passwd() {
    return old_passwd;
  }
  public String getId_save() {
    return id_save;
  }
  public String getPasswd_save() {
    return passwd_save;
  }
  public String getUrl_address() {
    return url_address;
  }
  public void setOld_passwd(String old_passwd) {
    this.old_passwd = old_passwd;
  }
  public void setId_save(String id_save) {
    this.id_save = id_save;
  }
  public void setPasswd_save(String passwd_save) {
    this.passwd_save = passwd_save;
  }
  public void setUrl_address(String url_address) {
    this.url_address = url_address;
  }
  public String getNickname() {
    return nickname;
  }
  public String getUser_tel2() {
    return user_tel2;
  }
  public String getUser_tel3() {
    return user_tel3;
  }
  public String getUser_email2() {
    return user_email2;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public void setUser_tel2(String user_tel2) {
    this.user_tel2 = user_tel2;
  }
  public void setUser_tel3(String user_tel3) {
    this.user_tel3 = user_tel3;
  }
  public void setUser_email2(String user_email2) {
    this.user_email2 = user_email2;
  }
  
  
  
  
  
  
  
  
  

}
