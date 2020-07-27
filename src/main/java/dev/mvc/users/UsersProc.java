package dev.mvc.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.users.UsersProc")
public class UsersProc implements UsersProcInter{
  @Autowired
  private UsersDAOInter usersDAO;
  
  public UsersProc() {
    System.out.println(" --> UsersProc created.");
  }
  
  @Override
  public int checkID(String userID) {
    int cnt = this.usersDAO.checkID(userID);
    return cnt;
  }

  @Override
  public int create(UsersVO usersVO) {
    int cnt = this.usersDAO.create(usersVO);
    return cnt;
  }
  
  @Override
  public List<UsersVO> list() {
    List<UsersVO> list = this.usersDAO.list();
    return list;
  }
  
  @Override
  public UsersVO read(int userno) {
    UsersVO usersVO = this.usersDAO.read(userno);
    return usersVO;
  }
  
  @Override
  public int update(UsersVO usersVO) {
    int cnt = this.usersDAO.update(usersVO);
    return cnt;
  }
  
  @Override
  public int delete(int userno) {
    int cnt = this.usersDAO.delete(userno);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int cnt = this.usersDAO.passwd_check(map);
    return cnt;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int cnt = this.usersDAO.passwd_update(map);
    return cnt;
  }
  
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = this.usersDAO.search_count(hashMap);
    return count;
  }
  
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param cateno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox(String listFile, int userno, int search_count, int nowPage, String nickname){ 
     int totalPage = (int)(Math.ceil((double)search_count/Users.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Users.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Users.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Users.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Users.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
    // str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������ 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ 20
    int _nowPage = (nowGrp-1) * Users.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&nickname="+nickname+"&nowPage="+_nowPage+"&userno="+userno+"'>����</A></span>"); 
    } 
 
    // �߾��� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){   // ������ �������� �Ѿ�ٸ� ������ ��� ����
        break; 
      } 
  
      if (nowPage == i){    // �������� ������������ ���ٸ� CSS ����(������ ��)
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{       
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
        str.append("<span class='span_box_1'><A href='"+listFile+"?nickname="+nickname+"&nowPage="+i+"&userno="+userno+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Users.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&nickname="+nickname+"&nowPage="+_nowPage+"&userno="+userno+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 
 
  @Override
  public List<UsersVO> list_by_userno_search(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Users.RECORD_PER_PAGE;
   
    // ���� rownum
    // 1 ������: 0 + 1,  2 ������: 10 + 1,  3 ������: 20 + 1 
    int startNum = beginOfPage + 1; 
    //  ���� rownum
    // 1 ������: 0 + 10, 2 ������: 0 + 20,  3 ������: 0 + 30
    int endNum = beginOfPage + Users.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<UsersVO> list = this.usersDAO.list_by_userno_search(map);
    
    return list;
  }

  @Override
  public int login(Map<Object, Object> map) {
    int cnt = this.usersDAO.login(map);
    return cnt;
  }

  @Override
  public UsersVO readByid(String userID) {
    UsersVO usersVO = this.usersDAO.readByid(userID);
    return usersVO;
  }
  
  @Override
  public boolean isUsers(HttpSession session){
    boolean sw = false; // �α������� ���� ������ �ʱ�ȭ
    
    String userID = (String)session.getAttribute("userID");
    
    if (userID != null){
      sw = true; // �α��� �� ���
    }
    return sw;
  }  











}
