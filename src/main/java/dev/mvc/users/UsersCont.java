package dev.mvc.users;

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
public class UsersCont {
  @Autowired
  // @Qualifier("dev.mvc.users.UsersProc")
  private UsersProc usersProc = null;
  
  public UsersCont(){
    System.out.println("--> UsersCont created.");
  }
  
  /**
   * ��� ��
   * @return
   */
  // http://localhost:9090/team2/users/create.do  
  @RequestMapping(value="/users/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/users/create");  // webapp/users/create.jsp
    return mav;
  }
  
  /**
   * ��� ó��
   * @param cateVO
   * @return
   */
 @RequestMapping(value="/users/create.do", method=RequestMethod.POST )
 public ModelAndView create(UsersVO usersVO) {
   ModelAndView mav = new ModelAndView();
   
   // System.out.println("id: " + memberVO.getId());
   
   int cnt = this.usersProc.create(usersVO);
   mav.addObject("cnt", cnt);   // request�� ����
   mav.addObject("url", "create_msg");   // create_msg.jsp redirect parameter ����
   
   mav.setViewName("redirect:/users/msg.do"); 
   
   return mav;
 }
 
 
 /**
  * ID �ߺ� üũ
  * @return
  */
 // http://localhost:9090/team2/users/checkID.do?userID=user1
 @ResponseBody
 @RequestMapping(value="/users/checkID.do", method=RequestMethod.GET,
                           produces = "text/plain;charset=UTF-8")
 
 public String checkID(String userID) {
   int cnt =this.usersProc.checkID(userID);
     
   JSONObject json = new JSONObject();
   json.put("cnt", cnt);
     
   return json.toString();
 }
 
 /**
  * ��ü ���
  * @return
  */

  @RequestMapping(value="/users/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<UsersVO> list = this.usersProc.list();
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    mav.setViewName("/users/list");  // webapp/users/list.jsp
    return mav;
  }
  

  /**
   * ��ȸ + ������
   * @param  userno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/users/a_read.do", method=RequestMethod.GET )
  public ModelAndView read1(int userno) {
   // request.setAttribute("categrpno", int categrpno) �۵� �ȵ�.
    ModelAndView mav = new ModelAndView();
    
    UsersVO usersVO = this.usersProc.read(userno);
    mav.addObject("usersVO", usersVO);   // request ��ü�� ����
    
    List<UsersVO> list = this.usersProc.list();
    mav.addObject("list", list); // request ��ü�� ����
    
    mav.setViewName("/users/read");  // webapp/member/read.jsp
    return mav;  // forward
  }
  
  /**
   * ��ȸ + ������
   * @param  userno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/users/read.do", method=RequestMethod.GET )
  public ModelAndView read(int userno) {
   // request.setAttribute("categrpno", int categrpno) �۵� �ȵ�.
    ModelAndView mav = new ModelAndView();
    
    UsersVO usersVO = this.usersProc.read(userno);
    mav.addObject("usersVO", usersVO);   // request ��ü�� ����
    
    List<UsersVO> list = this.usersProc.list();
    mav.addObject("list", list); // request ��ü�� ����
    
    mav.setViewName("/users/mypage");  // webapp/member/read.jsp
    return mav;  // forward
  }
  
  //http://localhost:9090/team2/users/update.do  
  /**
   * ȸ������ ���� ó��
   * @param usersVO
   * @return
   */
 @RequestMapping(value="/users/update.do", method=RequestMethod.POST )
 public ModelAndView update(UsersVO usersVO) {
   //  CategrpVO", categrpVO <FORM> �±��� ������ �ڵ� ������.
   //  request.setAttribute("CategrpVO", categrpVO);  �ڵ�����
   
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.usersProc.update(usersVO);
   mav.addObject("cnt", cnt);   // request�� ����
   mav.addObject("userno", usersVO.getUserno());   // redirect parameter ����
   mav.addObject("url", "update_msg");   // create_msg.jsp redirect parameter ����
   
   mav.setViewName("redirect:/users/msg.do");
     
   return mav;
 }
 
 /**
  * ȸ�� ������
  * @param  userno ������ ȸ�� ��ȣ
  * @return
  */
 @RequestMapping(value="/users/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int userno) {
   ModelAndView mav = new ModelAndView();
   
   UsersVO usersVO = this.usersProc.read(userno);
   mav.addObject("usersVO", usersVO);   // request ��ü�� ����
          
   mav.setViewName("/users/delete");  // 
   return mav;
 }
 
 /**
  * ���� ó��
  * @param 
  * @return
  */
 @RequestMapping(value="/users/delete.do", method=RequestMethod.POST )
 public ModelAndView delete_proc(int userno) {
   ModelAndView mav = new ModelAndView();
   
   UsersVO usersVO = this.usersProc.read(userno);
   mav.addObject("usersVO", usersVO);   // request ��ü�� ����
   mav.addObject("user_name", usersVO.getUser_name());  // request ��ü�� ����
   
   int cnt = this.usersProc.delete(userno); // ���� ó��
   mav.addObject("cnt", cnt);  // request ��ü�� ����
   mav.addObject("url", "delete_msg");   // create_msg.jsp redirect parameter ����
   
   mav.setViewName("redirect:/users/msg.do");
                                        
   return mav;
 }
 
 /**
  * �н����带 �����մϴ�.
  * @param memberno
  * @return
  */
 @RequestMapping(value="/users/passwd_update.do", method=RequestMethod.GET)
 public ModelAndView passwd_update(int userno){
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/users/passwd_update");
   
   return mav;
 }
 
 /**
  * �н����� ����
  * @param memberno  ȸ�� ��ȣ
  * @param current_passwd ���� �н�����
  * @param new_passwd ���ο� �н�����
  * @return
  */
 @RequestMapping(value="/users/passwd_update.do", method=RequestMethod.POST)
 public ModelAndView passwd_update(int userno, String current_passwd, String new_passwd){
   ModelAndView mav = new ModelAndView();
   
   // ���� �н����� �˻�
   HashMap<Object, Object> map = new HashMap<Object, Object>();
   map.put("userno", userno);
   map.put("userpw", current_passwd);
   
   int cnt = usersProc.passwd_check(map);
   int update_cnt = 0; // ����� �н����� ��
   
   if (cnt == 1) { // ���� �н����尡 ��ġ���� �ʴ� ���
     map.put("userpw", new_passwd);
     update_cnt = usersProc.passwd_update(map);  // �н����� ����
     mav.addObject("update_cnt", update_cnt);    
   }
   
   mav.addObject("cnt", cnt);  
   mav.addObject("url", "passwd_update_msg");
   
   mav.setViewName("redirect:/users/msg.do");
   
   return mav;
 }
 
 /**
  * �޽���
  * @param memberno
  * @return
  */
 @RequestMapping(value="/users/msg.do", method=RequestMethod.GET)
 public ModelAndView msg(String url){
   ModelAndView mav = new ModelAndView();
   
   // ��� ó�� �޽���: create_msg -> /users/create_msg.jsp
   // ���� ó�� �޽���: update_msg ->/users/update_msg.jsp
   // ���� ó�� �޽���: delete_msg ->/users/delete_msg.jsp
   mav.setViewName("/users/" + url);  
   
   return mav; // forward
 }
 
 /**
  * ��� + �˻� + ����¡ ����  //  * ���� �������� test�ؾߵ� *
  * http://localhost:9090/resort/contents/list.do
  * http://localhost:9090/resort/contents/list.do?cateno=1&word=������&nowPage=1
  * @param cateno
  * @param word
  * @param nowPage
  * @return
  */
 @RequestMapping(value = "/users/list1.do", 
                                      method = RequestMethod.GET)
 public ModelAndView list_by_userno_search(
     @RequestParam(value="userno", defaultValue="1") int userno,
     @RequestParam(value="nickname", defaultValue="") String nickname,
     @RequestParam(value="nowPage", defaultValue="1") int nowPage
     ) { 
   System.out.println("--> nowPage: " + nowPage);
   
   ModelAndView mav = new ModelAndView();
   
   // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("userno", userno); // #{userno}
   map.put("nickname", nickname);     // #{nickname}
   map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���     
   
   // �˻� ���
   List<UsersVO> list = usersProc.list_by_userno_search(map);
   mav.addObject("list", list);
   
   // �˻��� ���ڵ� ����
     int search_count = usersProc.search_count(map);
     mav.addObject("search_count", search_count);
   
     UsersVO usersVO = usersProc.read(userno);
     mav.addObject("usersVO", usersVO);
     
  /*
    * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
    * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
    * 
    * @param listFile ��� ���ϸ� 
    * @param cateno ī�װ���ȣ 
    * @param search_count �˻�(��ü) ���ڵ�� 
    * @param nowPage     ���� ������
    * @param word �˻���
    * @return ����¡ ���� ���ڿ�
    * 
    * */
     
   String paging = usersProc.pagingBox("list.do", userno, search_count, nowPage, nickname);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);

   // /contents/list_by_cateno_search_paging.jsp
   mav.setViewName("/users/list_by_userno_search");   
   
   return mav;
 }  
 
 
 /**
  * �α��� ��
  * @return
  */
 // http://localhost:9090/resort/users/login.do 
 @RequestMapping(value = "/users/login.do", 
                            method = RequestMethod.GET)
 public ModelAndView login(HttpServletRequest request) {
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
   
   mav.setViewName("/users/login_ck_form");
   
   return mav;
 }
 
 /**
  * �α��� ó��
  * @param request   Cookie�� �б����� �ʿ�
  * @param response  Cookie�� �������� �ʿ�
  * @param session    �α��������� �޸𸮿� ���
  * @param id ȸ�� ���̵�
  * @param passwd  ȸ�� �н�����
  * @param id_save  ȸ�� ���̵� ���� ����
  * @param passwd_save ȸ�� �н����� ���� ����
  * @return
  */
 // http://localhost:9090/resort/users/login.do 
 @RequestMapping(value = "/users/login.do", 
                            method = RequestMethod.POST)
 public ModelAndView login_proc(HttpServletRequest request,
                                                HttpServletResponse response,
                                                HttpSession session,
                                                String userID, String userpw,
                                                @RequestParam(value="id_save", defaultValue="") String id_save,
                                                @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
   ModelAndView mav = new ModelAndView();
   Map<Object, Object> map = new HashMap<Object, Object>();
   map.put("userID", userID);
   map.put("userpw", userpw);
   
   int count = usersProc.login(map);
   if (count == 1) { // �α��� ����
     // System.out.println(id + " �α��� ����");
     UsersVO usersVO = usersProc.readByid(userID);
     session.setAttribute("userno", usersVO.getUserno());
     session.setAttribute("userID", userID);
     session.setAttribute("user_name", usersVO.getUser_name());
     
     // -------------------------------------------------------------------
     // id ���� ��� ����
     // -------------------------------------------------------------------
     if (id_save.equals("Y")) { // id�� ������ ���
       Cookie ck_id = new Cookie("ck_id", userID);
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
       Cookie ck_passwd = new Cookie("ck_passwd", userpw);
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
     mav.setViewName("redirect:/users/login_fail_msg.jsp");
   }
       
   return mav;
 }
 
 /**
  * �α׾ƿ� ó��
  * @param session
  * @return
  */
 @RequestMapping(value="/users/logout.do", 
                            method=RequestMethod.GET)
 public ModelAndView logout(HttpSession session){
   ModelAndView mav = new ModelAndView();
   session.invalidate(); // ��� session ���� ����
   
   mav.setViewName("redirect:/index.jsp");
   
   
//   mav.setViewName("redirect:/users/logout_msg.jsp");
   
   return mav;
 }
  
  
  
  
}
