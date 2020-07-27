package dev.mvc.faq;

import java.util.HashMap;
import java.util.List;

public interface FaqDAOInter {

  /**
   * 등록처리
   * @param faqVO
   * @return
   */
  public int create(FaqVO faqVO);

  /**
   * 전체 목록
   * @return
   */
  public List<FaqVO> list_all();

  /**
   * 조회
   * @param faqno
   * @return
   */
  public FaqVO read_all(int faqno);

  /**
   * cate조회
   * @param cateno
   * @return
   */
  public FaqVO read(int cateno);

  /**
   * 수정 폼
   * @param faqno
   * @return
   */
  public FaqVO update(int faqno);

  /**
   * 수정 처리 
   * <xmp> <update id="update" parameterType="FaqVO"> </xmp>
   * @param faqVO
   * @return 처리된 레코드 갯수
   */
  public int update(FaqVO faqVO);

  /**
   * 삭제 폼
   * @param faqno
   * @return
   */
  public FaqVO delete(int faqVO);

  /**
   * 삭제처리
   * @param faqVO
   * @return
   */
  public int delete(FaqVO faqVO);

  /**
   * <xmp> cateno별 목록 <select id="list" resultType="FaqVO" parameterType="int">
   * @return
   */
  public List<FaqVO> list(int cateno);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param map
   * @return
   */
  public int search_count(HashMap<String,Object>map);
  
  /**
   * 검색 + 페이징 목록
   * <select id="list_by_cateno_search_paging" resultType="FaqVO" parameterType="HashMap">
   * @param map
   * @return
   */
  public List<FaqVO> list_by_cateno_search_paging(HashMap<String, Object> map);

}
