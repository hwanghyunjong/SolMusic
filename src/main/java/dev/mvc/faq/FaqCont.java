package dev.mvc.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.fcate.FcateProcInter;
import dev.mvc.fcate.FcateVO;

@Controller
public class FaqCont {
  @Autowired
  @Qualifier("dev.mvc.faq.FaqProc")
  private FaqProcInter faqProc;

  @Autowired
  @Qualifier("dev.mvc.fcate.FcateProc")
  private FcateProcInter fcateProc;

  public FaqCont() {
    System.out.println("-->FaqCont created");
  }

  /**
   * �޽���
   * @param url
   * �̵��� jsp �ּ�
   * @return
   */
  @RequestMapping(value = "/faq/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/faq/" + url);
    return mav;
  }

  // http://localhost:9090/team2/faq/reg.do
  /**
   * �����
   * 
   * @return
   */
  @RequestMapping(value = "/faq/reg.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/reg"); // webapp/contents/create.jsp
    return mav;
  }

  // http://localhost:9090/team2/faq/reg.do
  /**
   * ��� ó��
   * 
   * @param faqVO
   * @return
   */
  @RequestMapping(value = "/faq/reg.do", method = RequestMethod.POST)
  public ModelAndView create(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = 0;
    cnt = this.faqProc.create(faqVO);
    mav.addObject("cnt", cnt); // request�� ����

    if (cnt == 1) {
      mav.addObject("url", "reg_msg");
      mav.setViewName("redirect:/faq/msg.do");
    } else {
      mav.setViewName("/faq/reg_msg");
    }
    return mav;
  }

  // http://localhost:9090/team2/faq/list.do
  /**
   * ��ü ���
   * 
   * @return
   */
  @RequestMapping(value = "/faq/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();

    List<FaqVO> list = this.faqProc.list_all();
    mav.addObject("list", list);

    mav.setViewName("/faq/list_all");
    return mav;
  }

  // http://localhost:9090/team2/faq/list.do
  /**
   * cate �� ���
   * @param cateno
   * @return
   */
  @RequestMapping(value = "/faq/list.do", method = RequestMethod.GET)
  public ModelAndView list(int cateno) {
    ModelAndView mav = new ModelAndView();

    FcateVO fcateVO = this.fcateProc.read(cateno);
    mav.addObject("fcateVO", fcateVO);

    List<FaqVO> list = this.faqProc.list(cateno);
    mav.addObject("list", list);

    mav.setViewName("/faq/list");
    return mav;
  }

  // http://localhost:9090/team2/faq/update.do
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value = "/faq/update.do", method = RequestMethod.GET)
  public ModelAndView update(int faqno) {
    ModelAndView mav = new ModelAndView();

    FaqVO faqVO = this.faqProc.read_all(faqno);
    mav.addObject("faqVO", faqVO);

    mav.setViewName("/faq/update");
    return mav;
  }

  // http://localhost:9090/team2/faq/update.do
  /**
   * ����ó��
   * @param faqVO
   * @return
   */
  @RequestMapping(value = "/faq/update.do", method = RequestMethod.POST)
  public ModelAndView update(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
    int cnt = 0;
    cnt = this.faqProc.update(faqVO);
    mav.addObject("cnt", cnt); // request�� ����

    if (cnt == 1) { // ���� ����
      mav.addObject("url", "update_msg");

      mav.setViewName("redirect:/faq/msg.do");
    } else { // ���� ����
      mav.setViewName("/faq/update_msg");
    }
    return mav;
  }

  // http://localhost:9090/team2/faq/delete.do
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value = "/faq/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int faqno) {
    ModelAndView mav = new ModelAndView();

    FaqVO faqVO = this.faqProc.read_all(faqno);
    mav.addObject("faqVO", faqVO);

    mav.setViewName("/faq/delete");
    return mav;
  }

  // http://localhost:9090/team2/faq/delete.do
  /**
   * ����ó��
   * @param faqVO
   * @return
   */
  @RequestMapping(value = "/faq/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
    int cnt = 0;
    cnt = this.faqProc.delete(faqVO);
    mav.addObject("cnt", cnt); // request�� ����

    if (cnt == 1) { //���� ����
      mav.addObject("url", "delete_msg");

      mav.setViewName("redirect:/faq/msg.do");
    } else { //���� ����
      mav.setViewName("/faq/delete_msg");
    }
    return mav;
  }
  
  /**
   * ��� + �˻� + ����¡ ����
   * http://localhost:9090/team2/faq/list.do
   * http://localhost:9090/team2/faq/list.do?cateno=1&word=������&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
//  @RequestMapping(value = "/faq/list_all.do", method = RequestMethod.GET)
//  public ModelAndView list_by_cateno_search_paging(
//      @RequestParam(value="faqno", defaultValue="1") int faqno,
//      @RequestParam(value="faq_word", defaultValue="") String faq_word,
//      @RequestParam(value="nowPage", defaultValue="1") int nowPage
//      ) { 
//    System.out.println("--> nowPage: " + nowPage);
//    
//    ModelAndView mav = new ModelAndView();
//    
//    List<FaqVO> list_all = faqProc.list_all();
//    mav.addObject("list_all", list_all);
//    
//    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
//    HashMap<String, Object> map = new HashMap<String, Object>();
//    map.put("faqno", faqno); // #{faqno}
//    map.put("faq_word", faq_word);     // #{faq_word}
//    map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���     
//        
//    // �˻� ���
//    List<FaqVO> list = faqProc.list_by_cateno_search_paging(map);
//    mav.addObject("list", list);
//    
//    // �˻��� ���ڵ� ����
//    int search_count = faqProc.search_count(map);
//    mav.addObject("search_count", search_count);
//
//    /*
//     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
//     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
//     * 
//     * @param listFile ��� ���ϸ� 
//     * @param faqno  faq��ȣ 
//     * @param search_count �˻�(��ü) ���ڵ�� 
//     * @param nowPage     ���� ������
//     * @param word �˻���
//     * @return ����¡ ���� ���ڿ�
//     */ 
//    String paging = faqProc.pagingBox("list_all.do", faqno, search_count, nowPage, faq_word);
//    mav.addObject("paging", paging);
//  
//    mav.addObject("nowPage", nowPage);
//
//    // /contents/list_by_cateno_search_paging.jsp
//    
//    // ���̺� ��� �ؽ�Ʈ ���
//   mav.setViewName("/faq/list_by_cateno_search_paging");
//    
//    // ���̺� ��� �̹��� ���
//    // mav.setViewName("/contents/list_by_cateno_search_paging_img_table2");  
//    
//    // ��������
//    // mav.setViewName("/contents/list_by_cateno_search_paging_img_grid1");
//    
//    return mav;
//  }    
 
}

