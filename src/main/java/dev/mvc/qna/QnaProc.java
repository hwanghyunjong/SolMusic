package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.qna.QnaProc")
public class QnaProc implements QnaProcInter{
  @Autowired
  private QnaDAOInter qnaDAO;

  @Override
  public int create(QnaVO qnaVO) {
    int cnt =0;
    cnt = this.qnaDAO.create(qnaVO);
    return cnt;
  }

  @Override
  public List<QnaVO> list() {
    List<QnaVO> list = null;
    list = this.qnaDAO.list();
    return list;
  }

  @Override
  public QnaVO read(int qnano) {
    QnaVO qnaVO = null;
    qnaVO = this.qnaDAO.read(qnano);
    String qna_title = qnaVO.getQna_title();
    qna_title = Tool.convertChar(qna_title);
    qnaVO.setQna_title(qna_title);
    return qnaVO;
  }

  @Override
  public int delete(int qnano) {
    int cnt=0;
    cnt = this.qnaDAO.delete(qnano);
    return cnt;
  }

  @Override
  public QnaVO update(int qnano) {
    QnaVO qnaVO = this.qnaDAO.read(qnano);
    return qnaVO;
  }

  @Override
  public int update(QnaVO qnaVO) {
    int cnt=0;
    cnt=this.qnaDAO.update(qnaVO);
    return cnt;
  }

  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, String word) {
    int totalPage = (int)(Math.ceil((double)search_count/Qna.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Qna.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Qna.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Qna.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Qna.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
    str.append("    background-color: #ff4865;"); 
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
    int _nowPage = (nowGrp-1) * Qna.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+_nowPage+"'>����</A></span>"); 
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
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Qna.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  @Override
  public List<QnaVO> list_by_search_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Qna.RECORD_PER_PAGE;
   
    // ���� rownum
    // 1 ������ = 0 + 1, 2 ������ = 10 + 1, 3 ������ = 20 + 1 
    int startNum = beginOfPage + 1; 
    //  ���� rownum
    // 1 ������ = 0 + 10, 2 ������ = 0 + 20, 3 ������ = 0 + 30
    int endNum = beginOfPage + Qna.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<QnaVO> list = this.qnaDAO.list_by_search_paging(map);
   
    // --------------------------------------------------------------
    // ����, ���� ���ڼ� ����
    // --------------------------------------------------------------
    String title = "";
    String content = "";
    for (QnaVO qnaVO: list) {
      title = qnaVO.getQna_title();
      if (title.length() >= 30) {
        title = Tool.textLength(title, 30);
        qnaVO.setQna_title(title);
      }
      content = qnaVO.getQna_content();
      if (content.length() >= 500) {
        content = Tool.textLength(content, 500);
        qnaVO.setQna_content(content);
      }
    }
    // --------------------------------------------------------------    
    return list;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
      int count = qnaDAO.search_count(hashMap);
      return count;
  }

  @Override
  public int total_count() {
    int cnt=0;
    cnt = this.qnaDAO.total_count();
    return cnt;
  }

  @Override
  public int increaseAnsnum(HashMap<String, Object> map) {
    int count = qnaDAO.increaseAnsnum(map);
    return count;
  }

  @Override
  public int reply(QnaVO qnaVO) {
    int count = qnaDAO.reply(qnaVO);
    return count;
  }

  @Override
  public int increaseReplycnt(int qnano) {
    int count = qnaDAO.increaseReplycnt(qnano);
    return count;
  }

  @Override
  public int decreaseReplycnt(int qnano) {
    int count = qnaDAO.decreaseReplycnt(qnano);
    return count;
  }

  @Override
  public List<Qna_user_VO> list_user() {
    List<Qna_user_VO> list = this.qnaDAO.list_user();
    return list;
  }
 
}
