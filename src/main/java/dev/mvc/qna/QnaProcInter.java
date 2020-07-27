package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

public interface QnaProcInter {

  /**
   * ���
   * <insert id="create" parameterType="QnaVO">
   * @param qnaVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create(QnaVO qnaVO);
  
  /**
   * ��� ������ ���
   * <xmp>
   * <select id="list_all" resultType="QnaVO">
   * </xmp>
   * return ���ڵ� ���
   */
  public List<QnaVO> list();
  
  /**
   * ���� ���� ���
   * <xmp>
   *    <select id="list_users" resultType="Qna_user_VO">
   * </xmp>
   * @return
   */
  public List<Qna_user_VO> list_user();
  
  /**
   * ��ȸ
   * @param qnano
   * @return
   */
  public QnaVO read(int qnano);

  /**
   * ���� ��
   * @param qnano
   * @return
   */
  public int delete(int qnano);
  
  
  /**
   * ���� ��
   * @param qnano
   * @return
   */
  public QnaVO update(int qnano);
  
  /**
   * ���� ó��
   * <xmp>
   *   <update id="update" parameterType="QnaVO"> 
   * </xmp>
   * @param qnaVO
   * @return ó���� ���ڵ� ����
   */
  public int update(QnaVO qnaVO);
  
  /**
   * ��ü �Խñ� ����
   * @return
   */
  public int total_count();
  
  /**
   * �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param qnano ī�װ�����ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage, String word);
   
  
  /**
   * �˻� + ����¡ ���
   * @param map
   * @return
   */
  public List<QnaVO> list_by_search_paging(HashMap<String, Object> map);

  /**
   * �亯 ���� ����
   * <update id="increaseAnsnum" parameterType="HashMap"> 
   * @param map
   * @return
   */
  public int increaseAnsnum(HashMap<String, Object> map);

  /**
   * <xmp>
   * �亯
   * <insert id="reply" parameterType="QnaVO">
   * </xmp>
   * @param qnaVO
   * @return
   */
  public int reply(QnaVO qnaVO);

  /**
   * �� �� ����
   * @param 
   * @return
   */ 
  public int increaseReplycnt(int qnano);
 
  /**
   * �� �� ����
   * @param 
   * @return
   */   
  public int decreaseReplycnt(int qnano);

}