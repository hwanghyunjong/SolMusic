package dev.mvc.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Qualifier;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminCont {
  @Autowired
  private AdminProc adminProc = null;
  //@Qualifier("dev.mvc.admin.AdminProc")
  
  public AdminCont(){
    System.out.println("--> AdminCont created.");
  }
  
  /**
   * ��� ��
   * @return
   */
  // http://localhost:9090/team2/admin/create.do  
  @RequestMapping(value="/admin/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/admin/create");  // webapp/admin/create.jsp
    return mav;
  }
  
  /**
   * ��� ó��
   * @param adminVO
   * @return
   */
 @RequestMapping(value="/admin/create.do", method=RequestMethod.POST )
 public ModelAndView create(AdminVO adminVO) {
   ModelAndView mav = new ModelAndView();
   
   // System.out.println("id: " + memberVO.getId());
   
   int cnt = this.adminProc.create(adminVO);
   mav.addObject("cnt", cnt);   // request�� ����
   mav.addObject("url", "create_msg");   // create_msg.jsp redirect parameter ����
   
   mav.setViewName("redirect:/admin/msg.do"); 
   
   return mav;
 }
  
  /**
   * ID �ߺ� üũ
   * @return
   */
  // http://localhost:9090/team2/admin/checkID.do?adminID=user1
  @ResponseBody
  @RequestMapping(value="/admin/checkID.do", method=RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  
    public String checkID(String adminID) {
    int cnt =this.adminProc.checkID(adminID);
      
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
      
    return json.toString();
  }
  
  /**
   * ��ü ���
   * @return
   */

   @RequestMapping(value="/admin/list.do", method=RequestMethod.GET )
   public ModelAndView list() {
     ModelAndView mav = new ModelAndView();
     
     List<AdminVO> list = this.adminProc.list();
     mav.addObject("list", list); // request.setAttribute("list", list);
     
     mav.setViewName("/admin/list");  // webapp/users/list.jsp
     return mav;
   }
   
   /**
    * ��ȸ + ������
    * @param  adminno ��ȸ�� ī�װ� ��ȣ
    * @return
    */
   @RequestMapping(value="/admin/read.do", method=RequestMethod.GET )
   public ModelAndView read(int adminno) {
     ModelAndView mav = new ModelAndView();
     
     AdminVO adminVO = this.adminProc.read(adminno);
     mav.addObject("adminVO", adminVO);   // request ��ü�� ����
     
     List<AdminVO> list = this.adminProc.list();
     mav.addObject("list", list); // request ��ü�� ����
     
     mav.setViewName("/admin/read");  // webapp/member/read.jsp
     return mav;  // forward
   }
   
   //http://localhost:9090/team2/admin/update.do  
   /**
    * ȸ������ ���� ó��
    * @param usersVO
    * @return
    */
  @RequestMapping(value="/admin/update.do", method=RequestMethod.POST )
  public ModelAndView update(AdminVO adminVO) {
    //  CategrpVO", categrpVO <FORM> �±��� ������ �ڵ� ������.
    //  request.setAttribute("CategrpVO", categrpVO);  �ڵ�����
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.adminProc.update(adminVO);
    mav.addObject("cnt", cnt);   // request�� ����
    mav.addObject("adminno", adminVO.getAdminno());   // redirect parameter ����
    mav.addObject("url", "update_msg");   // create_msg.jsp redirect parameter ����
    
    mav.setViewName("redirect:/admin/msg.do");
      
    return mav;
  }
  
  /**
   * ȸ�� ������
   * @param  adminno ������ ȸ�� ��ȣ
   * @return
   */
  @RequestMapping(value="/admin/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int adminno) {
    ModelAndView mav = new ModelAndView();
    
    AdminVO adminVO = this.adminProc.read(adminno);
    mav.addObject("adminVO", adminVO);   // request ��ü�� ����
           
    mav.setViewName("/admin/delete");  // 
    return mav;
  }
  
  /**
   * ���� ó��
   * @param 
   * @return
   */
  @RequestMapping(value="/admin/delete.do", method=RequestMethod.POST )
  public ModelAndView delete_proc(int adminno) {
    ModelAndView mav = new ModelAndView();
    
    AdminVO adminVO = this.adminProc.read(adminno);
    mav.addObject("adminVO", adminVO);   // request ��ü�� ����
    mav.addObject("admin_name", adminVO.getAdmin_name());  // request ��ü�� ����
    
    int cnt = this.adminProc.delete(adminno); // ���� ó��
    mav.addObject("cnt", cnt);  // request ��ü�� ����
    mav.addObject("url", "delete_msg");   // create_msg.jsp redirect parameter ����
    
    mav.setViewName("redirect:/admin/msg.do");
                                         
    return mav;
  }
  
  /**
   * �޽���
   * @param memberno
   * @return
   */
  @RequestMapping(value="/admin/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // ��� ó�� �޽���: create_msg -> /users/create_msg.jsp
    // ���� ó�� �޽���: update_msg ->/users/update_msg.jsp
    // ���� ó�� �޽���: delete_msg ->/users/delete_msg.jsp
    mav.setViewName("/admin/" + url);  
    
    return mav; // forward
  }
  
  /**
   * �н����带 �����մϴ�.
   * @param memberno
   * @return
   */
  @RequestMapping(value="/admin/passwd_update.do", method=RequestMethod.GET)
  public ModelAndView passwd_update(int adminno){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/admin/passwd_update");
    
    return mav;
  }
  
  /**
   * �н����� ����
   * @param memberno  ȸ�� ��ȣ
   * @param current_passwd ���� �н�����
   * @param new_passwd ���ο� �н�����
   * @return
   */
  @RequestMapping(value="/admin/passwd_update.do", method=RequestMethod.POST)
  public ModelAndView passwd_update(int adminno, String current_passwd, String new_passwd){
    ModelAndView mav = new ModelAndView();
    
    // ���� �н����� �˻�
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("adminno", adminno);
    map.put("adminpw", current_passwd);
    
    int cnt = adminProc.passwd_check(map);
    int update_cnt = 0; // ����� �н����� ��
    
    if (cnt == 1) { // ���� �н����尡 ��ġ���� �ʴ� ���
      map.put("adminpw", new_passwd);
      update_cnt = adminProc.passwd_update(map);  // �н����� ����
      mav.addObject("update_cnt", update_cnt);    
    }
    
    mav.addObject("cnt", cnt);  
    mav.addObject("url", "passwd_update_msg");
    
    mav.setViewName("redirect:/admin/msg.do");
    
    return mav;
  }
  
  /**
   * ������ ���
   * @return
   */
  // http://localhost:9090/ojt/admin/list.do
  @ResponseBody
  @RequestMapping(value = "/admin/list.do", 
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
  public String adminlist(String id, String passwd) {
    return adminProc.adminlist();
  }
  
//  /**
//   * ������ �α��� ��
//   * @return
//   */
//  // http://localhost:9090/ojt/admin/login.do 
//  @RequestMapping(value = "/admin/login.do", 
//                             method = RequestMethod.GET)
//  public ModelAndView login(HttpServletRequest request) {
//    ModelAndView mav = new ModelAndView();
//    
//    mav.setViewName("/admin/login_form");
//    return mav;
//  }
//  
//  /**
//   * ������ �α��� ó��
//   * @return
//   */
//  // http://localhost:9090/ojt/admin/login.do 
//  @RequestMapping(value = "/admin/login.do", 
//                             method = RequestMethod.POST)
//  public ModelAndView login_proc(HttpServletRequest request,
//                                                 HttpServletResponse response,
//                                                 HttpSession session,
//                                                 String id_admin, String passwd_admin) {
//    ModelAndView mav = new ModelAndView();
//    
//    boolean sw = adminProc.login(id_admin, passwd_admin);
//    if (sw == true) { // �α��� ����
//      session.setAttribute("id_admin", id_admin);
//      session.setAttribute("passwd_admin", passwd_admin);
//      
//      mav.setViewName("redirect:/index.do");  
//    } else {
//      mav.setViewName("redirect:/admin/login_fail_msg.jsp");
//    }
//        
//    return mav;
//  }
  
  
  /**
   * ������ �α��� ��
   * @return
   */
  // http://localhost:9090/ojt/admin/login.do 
  @RequestMapping(value = "/admin/login1.do", 
                             method = RequestMethod.GET)
  public ModelAndView login1(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();

    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id ���� 
    String ck_id_save = ""; // id ���� ���θ� üũ
    String ck_passwd = ""; // passwd ���� 
    String ck_passwd_save = ""; // passwd ���� ���θ� üũ

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // ��Ű ��ü ����
        
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_passwd")){
          ck_passwd = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_passwd_save")){
          ck_passwd_save = cookie.getValue();  // Y, N
        }
      }
    }
    
    mav.addObject("ck_id", ck_id);
    mav.addObject("ck_id_save", ck_id_save);
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);
    
    mav.setViewName("/admin/login_ck_form");
    return mav;
  }
  
  /**
   * ������ �α��� ó��
   * @return
   */
  // http://localhost:9090/ojt/admin/login.do 
  @RequestMapping(value = "/admin/login1.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request,
                                                 HttpServletResponse response,
                                                 HttpSession session,
                                                 String adminID, String adminpw,
                                                 @RequestParam(value="id_save", defaultValue="") String id_save,
                                                 @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
    
    ModelAndView mav = new ModelAndView();
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("adminID", adminID);
    map.put("adminpw", adminpw);
    
    int count = adminProc.login1(map);
    if (count == 1) { // �α��� ����
      // System.out.println(id + " �α��� ����");
      AdminVO adminVO = adminProc.readByid(adminID);
      session.setAttribute("adminno", adminVO.getAdminno());
      session.setAttribute("adminID", adminID);
      session.setAttribute("admin_name", adminVO.getAdminno());
      
      // -------------------------------------------------------------------
      // id ���� ��� ����
      // -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id�� ������ ���
        Cookie ck_id = new Cookie("ck_id", adminID);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, �ʴ���
        response.addCookie(ck_id);
      } else { // N, id�� �������� �ʴ� ���
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id);
      }
      // id�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
      // -------------------------------------------------------------------

      // -------------------------------------------------------------------
      // Password ���� ��� ����
      // -------------------------------------------------------------------
      if (passwd_save.equals("Y")) { // �н����� ������ ���
        Cookie ck_passwd = new Cookie("ck_passwd", adminpw);
        ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd);
      } else { // N, �н����带 �������� ���� ���
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(0);
        response.addCookie(ck_passwd);
      }
      // passwd�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
      ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_passwd_save);
      // -------------------------------------------------------------------
    
      
      mav.setViewName("redirect:/index.do");  
    } else {
      mav.setViewName("redirect:/admin/login_fail_msg.jsp");
    }
        
    return mav;
  }
  
  /**
   * ������ �α׾ƿ� ó��
   * @param session
   * @return
   */
  @RequestMapping(value="/admin/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // ��� session ���� ����
    
    mav.setViewName("redirect:/admin/logout_msg.jsp");
    
    return mav;
  }
  
  
  
  

}
