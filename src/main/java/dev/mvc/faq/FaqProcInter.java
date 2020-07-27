package dev.mvc.faq;

import java.util.HashMap;
import java.util.List;

public interface FaqProcInter {

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
   * 수정 처리 <xmp> <update id="update" parameterType="FaqVO"> </xmp>
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
   * </xmp>
   * @return
   */
  public List<FaqVO> list(int cateno);
  
  /**
   * 검색 + 페이징 목록
   * <select id="list_by_cateno_search_paging" resultType="FaqVO" parameterType="HashMap">
   * @param map
   * @return
   */
  public List<FaqVO> list_by_cateno_search_paging(HashMap<String, Object> map);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명
   * @param faqno 질문번호
   * @param search_count 검색 갯수
   * @param nowPage 현재패이지, 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int faqno, int search_count, int nowPage, String faq_word);

  public int search_count(HashMap<String, Object> map);
  
}
