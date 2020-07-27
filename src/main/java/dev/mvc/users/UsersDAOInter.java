package dev.mvc.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



public interface UsersDAOInter {
  
  
  /**
   * ���̵� �ߺ� üũ
   * @param id
   * @return 0 �ߺ��ƴ� 1 �ߺ�
   */
  public int checkID(String userID);
  
  /**
   * ȸ�� ����
   * <insert id="create" parameterType="UsersVO">
   * @param usersVO
   * @return ��ϵ� ȸ���� 1 or 0
   */
  public int create(UsersVO usersVO);
 
  /**
   * ȸ�� ��ü ���
   * @return
   */
  public List<UsersVO> list();
  
  /**
   * ��ȸ
   * @param userno
   * @return
   */
  public UsersVO read(int userno);
  
  /**
   * ���� ó��
   * @param usersVO
   * @return
   */
  public int update(UsersVO usersVO);
  
  /**
   * ���ڵ� 1�� ����
   * @param userno ������ ȸ�� ��ȣ
   * @return ������ ���ڵ� ����
   */
  public int delete(int userno);
  
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
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
 
  
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list_by_userno_search" resultType="UsersVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<UsersVO> list_by_userno_search(HashMap<String, Object> map);
  
  /**
   * �α��� ó��
   * <xmp>
   *  <select id="login" resultType="int" parameterType="Map"> 
   *  </xmp>
   * @param map
   * @return
   */
  public int login(Map<Object, Object> map);
  
  /**
   *   <select id="readByid" resultType="UsersVO" parameterType="String">
   * @param id
   * @return
   */
  public UsersVO readByid(String userID);
  
  
}


