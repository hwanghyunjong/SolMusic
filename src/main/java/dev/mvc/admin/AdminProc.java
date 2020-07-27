package dev.mvc.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import dev.mvc.users.UsersVO;

@Component("dev.mvc.admin.AdminProc")
public class AdminProc implements AdminProcInter {
  @Value("${admin1}")  // properties ����
  private String admin1;

  @Value("${admin2}")
  private String admin2;
  
  @Value("${admin3}")
  private String admin3;
  
  @Autowired
  private AdminDAOInter adminDAO;
  
  @Override
  public int checkID(String adminID) {
    int cnt = this.adminDAO.checkID(adminID);
    return cnt;
  }

  @Override
  public int create(AdminVO adminVO) {
    int cnt = this.adminDAO.create(adminVO);
    return cnt;
  }
  
  @Override
  public List<AdminVO> list() {
    List<AdminVO> list = this.adminDAO.list();
    return list;
  }
  
  @Override
  public AdminVO read(int adminno) {
    AdminVO adminVO = this.adminDAO.read(adminno);
    return adminVO;
  }
  
  @Override
  public int update(AdminVO adminVO) {
    int cnt = this.adminDAO.update(adminVO);
    return cnt;
  }
  
  @Override
  public int delete(int adminno) {
    int cnt = this.adminDAO.delete(adminno);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int cnt = this.adminDAO.passwd_check(map);
    return cnt;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int cnt = this.adminDAO.passwd_update(map);
    return cnt;
  }
  
  /**
   * ������ ���� �˻�
   * @param info
   * @param id
   * @return
   */
  public boolean admin_check(String id_admin, String passwd_admin) {
    boolean sw = false;
    String[] admins = {admin1, admin2, admin3};
    // "admin1/1234/������1", "admin2/1234/������2", "admin3/1234/������3"
    
    for (String admin:admins) {
      // "admin1/1234/������1"
      String[] tokens = admin.split("/");    // {"admin1","1234","������1"} 
      if (tokens[0].equals(id_admin) && tokens[1].equals(passwd_admin)) {
        sw = true;
      }
    }
    
    return sw;
  }
  
  /**
   * ������ �α��� ó��
   */
  @Override
  public boolean login(String id_admin, String passwd_admin){
    System.out.println(admin1);
    System.out.println(admin2);
    System.out.println(admin3);
   
    // ������ ���̵�, �н����� �˻�
    boolean sw = admin_check(id_admin, passwd_admin); 
    
    return sw;
  }
  
  /**
   * ���� �α��ε� �������� üũ
   */
  @Override
  public boolean isAdmin(HttpSession session){
    boolean sw = false;
    
    String id_admin = (String)session.getAttribute("id_admin");
    
    if (id_admin != null){
      sw = true;
    }
    return sw;
  }
  
    
  /**
   * ������ ���
   */
  @Override
  public String adminlist() {
    String admins = "";
    admins = admin1 + "\n" + admin2 + "\n" + admin3;  
    
    return admins;
  }
  
  @Override
  public int login1(Map<Object, Object> map) {
    int cnt = this.adminDAO.login1(map);
    return cnt;
  }

  @Override
  public AdminVO readByid(String adminID) {
    AdminVO adminVO = this.adminDAO.readByid(adminID);
    return adminVO;
  }








}
