package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

public interface QnaDAOInter {

  /**
   * 등록
   * <insert id="create" parameterType="QnaVO">
   * @param qnaVO
   * @return 등록된 레코드 갯수
   */
  public int create(QnaVO qnaVO);
  
  /**
   * 출력 순서별 목록
   * <xmp>
   * <select id="list" resultType="QnaVO">
   * </xmp>
   * return 레코드 목록
   */
  public List<QnaVO> list();
  
  /**
   * 유저 조인 목록
   * <xmp>
   *    <select id="list_users" resultType="Qna_user_VO">
   * </xmp>
   * @return
   */
  public List<Qna_user_VO> list_user();
  
  /**
   * 조회
   * @param qnano
   * @return
   */
  public QnaVO read(int qnano);
  
  /**
   * 삭제 폼
   * @param qnano
   * @return
   */
  public int delete(int qnano);
  
  /**
   * 수정 폼
   * @param qnano
   * @return
   */
  public QnaVO update(int qnano);
  
  /**
   * 수정 처리
   * <xmp>
   *   <update id="update" parameterType="QnaVO"> 
   * </xmp>
   * @param qnaVO
   * @return 처리된 레코드 갯수
   */
  public int update(QnaVO qnaVO);
 
  /**
   * 전체 게시글 갯수
   * @return
   */
  public int total_count();
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public List<QnaVO> list_by_search_paging(HashMap<String, Object> map);
  
  /**
   * 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * 답변
   * <insert id="reply" parameterType="QnaVO">
   * </xmp>
   * @param qnaVO
   * @return
   */
  public int reply(QnaVO qnaVO);

  /**
   * 글 수 증가
   * @param 
   * @return
   */ 
  public int increaseReplycnt(int qnano);
 
  /**
   * 글 수 감소
   * @param 
   * @return
   */   
  public int decreaseReplycnt(int qnano);

  /**
   * 답변 순서 증가
   * <update id="increaseAnsnum" parameterType="HashMap"> 
   * @param map
   * @return
   */
  public int increaseAnsnum(HashMap<String, Object> map);
  
}
