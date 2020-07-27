package dev.mvc.artist;

import java.util.List;


public interface ArtistDAOInter {
  /**
   * ����
   * <xmp>
   *  <insert id="create" parameterType="ArtistVO"> 
   * </xmp>
   * @param artistVO
   * @return ������ ���ڵ� ����
   */
  public int create(ArtistVO artistVO);
  
  /**
   * ��ü �̹��� ���
   * <xmp>
   *   <select id="list" resultType="ArtistVO">
   * </xmp>
   * @return ����Ʈ ���
   */
  public List<ArtistVO> list();
  
  /**
   * ��ȸ
   * <xmp>
   *    <select id="read" resultType="ArtistVO" parameterType="int">
   * </xmp>
   * @param artistno
   * @return ��ȸ�� ���ڵ�
   */
  public ArtistVO read(int artistno);
  
  /**
   * ����
   * <xmp>
   *    <update id="update" parameterType="ArtistVO">
   * </xmp>
   * @param artistVO
   * @return ������ ���ڵ�
   */
  public int update(ArtistVO artistVO);
  
  /**
   * ����
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp>
   * @param artistno
   * @return
   */
  public int delete(int artistno);

}
