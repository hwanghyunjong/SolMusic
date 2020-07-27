package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class QnaCont {
  @Autowired
  @Qualifier("dev.mvc.qna.QnaProc")
  private QnaProcInter qnaProc;
  
  public QnaCont() {
    System.out.println("-->QnaCon created.");
  }
  
  /**
   * �޽���
   * @param url �̵��� jsp �ּ�
   * @return
   */
  @RequestMapping(value="/qna/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();    

    mav.setViewName("/qna/" + url); 
    return mav; // forward
  }
   
//http://localhost:9090/team2/qna/qna_reg.do
  /**
   * ��� ��
   * @return
  */
  @RequestMapping(value="/qna/qna_reg.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/qna_reg"); //webapp/qna/qna_reg.do.jsp
    return mav;
  }
  
  //http://localhost:9090/resort/qna/qna_reg.do
  /**
  * ���ó��
  * @param contentsVO
  * @return
  */
 @RequestMapping(value = "/qna/qna_reg.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
  
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String qna_fname = ""; // ���� ���ϸ�
    String qna_fupname = ""; // ���ε�� ���ϸ�
    long qna_fsize = 0;  // ���� ������
    String qna_thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����

    String upDir = Tool.getRealPath(request, "/qna/storage"); //������
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = qnaVO.getFnamesMF(); //���� ���
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) { //���� �� ������ �ִٸ�
      for (MultipartFile multipartFile:fnamesMF) { // ���� ����
        qna_fsize = multipartFile.getSize();  // ���� ũ��
        if (qna_fsize > 0) { // ���� ũ�� üũ
          qna_fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
          qna_fupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ���� ��, ���ε� ���ϸ��� ���ϵ�. spring.jpg , spring_1.jsp...
          
          if (Tool.isImage(qna_fname)) { // �̹������� �˻�
            //thumb �̹��� ���� �� ���ϸ� ���ϵ�, width 120, height 80
            qna_thumb = Tool.preview(upDir, qna_fupname, 572, 300); // thumb �̹��� ����
          }
        }
        QnaVO vo = new QnaVO();
        vo.setQnano(qnaVO.getQnano());
        vo.setUserno(qnaVO.getUserno());
        vo.setQna_categrpname(qnaVO.getQna_categrpname());
        vo.setQna_content(qnaVO.getQna_content());
        vo.setQna_title(qnaVO.getQna_title());
        vo.setQna_rdate(qnaVO.getQna_rdate());
        vo.setQna_fname(qna_fname);
        vo.setQna_fupname(qna_fupname);
        vo.setQna_thumb(qna_thumb);
        vo.setQna_fsize(qna_fsize);
      
        upload_count = upload_count + this.qnaProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    /* //PK return
    int cnt = this.qnaProc.create(qnaVO); //Call by Reference�� ����
    mav.addObject("cnt", cnt);
    System.out.println("cnt" + cnt);*/
    mav.addObject("upload_count", upload_count);
    mav.addObject("qnano", qnaVO.getQnano()); 
    
    mav.addObject("url", "qna_reg_msg");
    
    mav.setViewName("redirect:/qna/msg.do");
    return mav; //forward
  }
 
 //http://localhost:9090/team2/qna/qna_list.do
/**
 * ��ü ���
 * @return
 */
 @RequestMapping(value="/qna/qna_list.do", method=RequestMethod.GET )
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();

   List<QnaVO> list = this.qnaProc.list();
   mav.addObject("list", list); // request.setAttribute("list", list);

   mav.setViewName("/qna/qna_list"); // /webapp/contents/list_all.jsp
   return mav;
 }
  
  //http://localhost:9090/team2/qna/qna_read.do
  /**
   * 1ȸ ��ȸ
   * @return
   */
  @RequestMapping(value="/qna/qna_read.do", method=RequestMethod.GET )
  public ModelAndView read(int qnano) {
    ModelAndView mav = new ModelAndView();
    
    QnaVO qnaVO = this.qnaProc.read(qnano);
    mav.addObject("qnaVO",qnaVO);
    
    List<QnaVO> list = this.qnaProc.list();
    mav.addObject("list", list); 

    mav.setViewName("/qna/qna_read"); 
    return mav;
  }
  
  //http://localhost:9090/team2/qna/qna_delete.do
  /**
  * ����ó��
  * @param qnano ������ ī�װ� ��ȣ 
  * @return
  */
  @RequestMapping(value="/qna/qna_delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int qnano) {
    ModelAndView mav = new ModelAndView();

    QnaVO qnaVO = this.qnaProc.read(qnano); //��������
    mav.addObject("qnaVO", qnaVO);
    
    int cnt = this.qnaProc.delete(qnano); //����ó��
    mav.addObject("cnt", cnt);
      
    if(cnt==1) { //��� ����   
      mav.setViewName("redirect:/qna/qna_list.do");
    }else { //��� ����
      mav.setViewName("/qna/qna_delete"); 
    } 
    return mav;
  }
  
  // http://localhost:9090/team2/qna/qna_update.do
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value="/qna/qna_update.do", method=RequestMethod.GET )
  public ModelAndView update(int qnano) {
    ModelAndView mav = new ModelAndView();
    
    QnaVO qnaVO = this.qnaProc.update(qnano);
    mav.addObject("qnaVO", qnaVO); 
    
    mav.setViewName("/qna/qna_update"); 
    
    return mav;
  }
  
  //http://localhost:9090/team2/qna/qna_update.do
  /**
  * ����ó��
  * @param qnaVO
  * @return
  */
  @RequestMapping(value="/qna/qna_update.do", method = RequestMethod.POST)
  public ModelAndView update(QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    int cnt=0;
    cnt = this.qnaProc.update(qnaVO);
    mav.addObject("cnt", cnt);  //request�� ����

    if(cnt==1) { //���� ����   
      mav.addObject("url", "qna_updatemsg");
      
      mav.setViewName("redirect:/qna/msg.do");
    }else { //���� ����
      mav.setViewName("/qna/qna_updatemsg"); 
    } 
    return mav;
  }
  
  /**
   * ��� + �˻� + ����¡ ����
   * http://localhost:9090/team2/qna/list.do
   * http://localhost:9090/team2/qna/list.do?qnano=1&word=�÷��̾�&nowPage=1
   * @param qnano
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/qna/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_search_paging(
      int userno,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("userno", userno);
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���     
    
    // �˻� ���
    List<QnaVO> list = this.qnaProc.list_by_search_paging(map);
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
    int search_count = qnaProc.search_count(map);
    mav.addObject("search_count", search_count);
  
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
     */ 
    String paging = qnaProc.pagingBox("list.do", search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    // /contents/list_by_cateno_search_paging.jsp
    mav.setViewName("/qna/list_by_search_paging2");   
    
    return mav;
  } 
  
  // http://localhost:9090/team2/qna/reply.do?qnano=1
  /**
   * �亯 ��
   * @return
   */
  @RequestMapping(value="/qna/reply.do", method=RequestMethod.GET )
  public ModelAndView reply(int qnano) {
    ModelAndView mav = new ModelAndView();
    System.out.println("�亯 ���: " + qnano);
    
    QnaVO qnaVO = this.qnaProc.read(qnano);
    mav.addObject("qnaVO", qnaVO);
    
    mav.setViewName("/qna/reply"); // webapp/contents/reply.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team2/qna/reply.do
  /**
   * �亯 ��� ó��
   * @return
   */
  @RequestMapping(value="/qna/reply.do", method=RequestMethod.POST )
  public ModelAndView reply(HttpServletRequest request, QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    
     // --------------------------- �亯 ���� �ڵ� ���� --------------------------
     // System.out.println("����� ���� �θ�� ��ȣ: " + contentsVO.getContentsno());
     QnaVO parentVO = qnaProc.read(qnaVO.getQnano()); // �θ�� ���� ����
     
     HashMap<String, Object> map = new HashMap<String, Object>();
     map.put("grpno", parentVO.getGrpno());
     map.put("ansnum",  parentVO.getAnsnum());
     qnaProc.increaseAnsnum(map); // ���� ��ϵ� �亯 �ڷ� +1 ó����.

     qnaVO.setGrpno(parentVO.getGrpno()); // �θ��� �׷��ȣ �Ҵ�
     qnaVO.setIndent(parentVO.getIndent() + 1); // �亯 ���� ����
     qnaVO.setAnsnum(parentVO.getAnsnum() + 1); // �θ� �ٷ� �Ʒ� ���
     // --------------------------- �亯 ���� �ڵ� ���� --------------------------
     int cnt = this.qnaProc.reply(qnaVO); // Call By Reference�� ����
     
     System.out.println("cnt: " + cnt);
     mav.addObject("cnt", cnt);
    
    // ---------------------------------------------------------------------------------------
    // cnt, contentsno return 
    // ---------------------------------------------------------------------------------------
    // Spring <-----> contentsVO <-----> MyBATIS
    // Spring�� MyBATIS�� ContentsVO�� �����ϰ� ����.
    // MyBATIS�� insert�� PK �÷��� contentsno������ ���� ������ PK�� �Ҵ���.
    int qnano = qnaVO.getQnano();  // MyBATIS ���ϵ� PK
    System.out.println("qnano: " + qnano);
    mav.addObject("qnano", qnano); // request�� ����
    // ---------------------------------------------------------------------------------------
    
    if (cnt == 1) {
      mav.addObject("url", "reply_msg");
      mav.setViewName("redirect:/qna/msg.do");
    } else {
      mav.setViewName("/qna/reply_msg");
    }
    return mav;
  }
  
  
}
