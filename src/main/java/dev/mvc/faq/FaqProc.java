package dev.mvc.faq;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;


@Component("dev.mvc.faq.FaqProc")
public class FaqProc implements FaqProcInter{
  @Autowired
  private FaqDAOInter faqDAO;
  
  @Override
  public int create(FaqVO faqVO) {
    int cnt = 0;
    cnt = this.faqDAO.create(faqVO);
    return cnt;
  }

  @Override
  public List<FaqVO> list_all() {
    List<FaqVO> list = this.faqDAO.list_all();
    return list;
  }
  @Override
  public List<FaqVO> list(int cateno) {
    List<FaqVO> list = this.faqDAO.list(cateno);
    return list;
  }

  @Override
  public FaqVO read_all(int faqno) {
    FaqVO faqVO = null;
    faqVO = this.faqDAO.read_all(faqno);
    return faqVO;
  }
  
  @Override
  public FaqVO read(int cateno) {
    FaqVO faqVO = null;
    faqVO = this.faqDAO.read(cateno);
    return faqVO;
  }
  
  @Override
  public FaqVO update(int faqno) {
    FaqVO faqVO = this.faqDAO.read_all(faqno);
    return faqVO;
  }

  @Override
  public int update(FaqVO faqVO) {
    int cnt=0;
    cnt=this.faqDAO.update(faqVO);
    return cnt;
  }

  @Override
  public FaqVO delete(int faqno) {
    FaqVO faqVO = this.faqDAO.read_all(faqno);
    return faqVO;
  }
  
  @Override
  public int delete(FaqVO faqVO) {
    int cnt=0;
    cnt = this.faqDAO.delete(faqVO);
    return cnt;
  }

  @Override
  public List<FaqVO> list_by_cateno_search_paging(HashMap<String, Object> map) {
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Faq.RECORD_PER_PAGE;
    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + Faq.RECORD_PER_PAGE;   
    
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<FaqVO> list = this.faqDAO.list_by_cateno_search_paging(map);
    // --------------------------------------------------------------
    // ����, ���� ���ڼ� ����
    // --------------------------------------------------------------
    String title = "";
    String content = "";
    for (FaqVO faqVO: list) {
      title = faqVO.getFaq_title();
      if (title.length() >= 50) {
        title = Tool.textLength(title, 25);
        faqVO.setFaq_title(title);
      }
      content = faqVO.getFaq_content();
      if (content.length() >= 100) {
        content = Tool.textLength(content, 100);
        faqVO.setFaq_content(content);
      }
    }
    // --------------------------------------------------------------    
    
    return list;
  }
  
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox(String listFile, int faqno, int search_count, int nowPage, String faq_word){ 
    int totalPage = (int)(Math.ceil((double)search_count/Faq.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Faq.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Faq.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Faq.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Faq.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������ 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ 20
    int _nowPage = (nowGrp-1) * Faq.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?faq_word="+faq_word+"&nowPage="+_nowPage+"&faqno="+faqno+"'>����</A></span>"); 
    } 
 
    // �߾��� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // ������ �������� �Ѿ�ٸ� ���� ��� ����
        break; 
      } 
  
      if (nowPage == i){ // �������� ������������ ���ٸ� CSS ����(������ ��)
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
        str.append("<span class='span_box_1'><A href='"+listFile+"?faq_word="+faq_word+"&nowPage="+i+"&faqno="+faqno+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Faq.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?faq_word="+faq_word+"&nowPage="+_nowPage+"&faqno="+faqno+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  @Override
  public int search_count(HashMap<String, Object> map) {
    int count = faqDAO.search_count(map);
    return count;
  }



}
