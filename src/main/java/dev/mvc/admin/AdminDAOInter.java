package dev.mvc.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;





public interface AdminDAOInter {
  
  /**
   * ���̵� �ߺ� üũ
   * @param id
   * @return 0 �ߺ��ƴ� 1 �ߺ�
   */
  public int checkID(String adminID);
  
  
  /**
   * ������ ����
   * <insert id="create" parameterType="AdminVO">
   * @param adminVO
   * @return 
   */
  public int create(AdminVO adminVO);
  
  /**
   * ȸ�� ��ü ���
   * @return
   */
  public List<AdminVO> list();
  
  /**
   * ��ȸ
   * @param adminno
   * @return
   */
  public AdminVO read(int adminno);
  
  /**
   * ���� ó��
   * @param adminVO
   * @return
   */
  public int update(AdminVO adminVO);
  
  /**
   * ���ڵ� 1�� ����
   * @param adminno ������ ȸ�� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int adminno);
  
  /**
   * ��й�ȣ �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * ��й�ȣ ����
   * @param hashMap
   * @return
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * �α��� ó��
   * <xmp>
   *  <select id="login" resultType="int" parameterType="Map"> 
   *  </xmp>
   * @param map
   * @return
   */
  public int login1(Map<Object, Object> map);
  
  /**
   *   <select id="readByid" resultType="AdminVO" parameterType="String">
   * @param id
   * @return
   */
  public AdminVO readByid(String adminID);  

}
