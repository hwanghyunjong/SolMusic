package dev.mvc.faq;

import java.util.HashMap;
import java.util.List;

public interface FaqProcInter {

  /**
   * ���ó��
   * @param faqVO
   * @return
   */
  public int create(FaqVO faqVO);

  /**
   * ��ü ���
   * @return
   */
  public List<FaqVO> list_all();

  /**
   * ��ȸ
   * @param faqno
   * @return
   */
  public FaqVO read_all(int faqno);

  /**
   * cate��ȸ
   * @param cateno
   * @return
   */
  public FaqVO read(int cateno);

  /**
   * ���� ��
   * @param faqno
   * @return
   */
  public FaqVO update(int faqno);

  /**
   * ���� ó�� <xmp> <update id="update" parameterType="FaqVO"> </xmp>
   * @param faqVO
   * @return ó���� ���ڵ� ����
   */
  public int update(FaqVO faqVO);

  /**
   * ���� ��
   * @param faqno
   * @return
   */
  public FaqVO delete(int faqVO);

  /**
   * ����ó��
   * @param faqVO
   * @return
   */
  public int delete(FaqVO faqVO);

  /**
   * <xmp> cateno�� ��� <select id="list" resultType="FaqVO" parameterType="int">
   * </xmp>
   * @return
   */
  public List<FaqVO> list(int cateno);
  
  /**
   * �˻� + ����¡ ���
   * <select id="list_by_cateno_search_paging" resultType="FaqVO" parameterType="HashMap">
   * @param map
   * @return
   */
  public List<FaqVO> list_by_cateno_search_paging(HashMap<String, Object> map);
  
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ�
   * @param faqno ������ȣ
   * @param search_count �˻� ����
   * @param nowPage ����������, 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int faqno, int search_count, int nowPage, String faq_word);

  public int search_count(HashMap<String, Object> map);
  
}
