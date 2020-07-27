package dev.mvc.fcate;

import java.util.List;

public interface FcateDAOInter {

  /**
   * ���
   * @param fcateVO
   * @return
   */
  public int create(FcateVO fcateVO);
  
  /**
   * ���
   * @return
   */
  public List<FcateVO> list();
  
  /**
   * ��ȸ
   * @param cateno
   * @return
   */
  public FcateVO read(int cateno);
  
  /**
   * ������
   * @param cateno
   * @return
   */
  public FcateVO update(int cateno);
  
  /**
   * ����
   * @param fcateVO
   * @return
   */
  public int update(FcateVO fcateVO);
  
  /**
   * ����
   * @param cateno
   * @return
   */
   public int delete(int cateno);
}
