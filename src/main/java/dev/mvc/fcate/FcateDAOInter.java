package dev.mvc.fcate;

import java.util.List;

public interface FcateDAOInter {

  /**
   * 등록
   * @param fcateVO
   * @return
   */
  public int create(FcateVO fcateVO);
  
  /**
   * 목록
   * @return
   */
  public List<FcateVO> list();
  
  /**
   * 조회
   * @param cateno
   * @return
   */
  public FcateVO read(int cateno);
  
  /**
   * 수정폼
   * @param cateno
   * @return
   */
  public FcateVO update(int cateno);
  
  /**
   * 수정
   * @param fcateVO
   * @return
   */
  public int update(FcateVO fcateVO);
  
  /**
   * 삭제
   * @param cateno
   * @return
   */
   public int delete(int cateno);
}
