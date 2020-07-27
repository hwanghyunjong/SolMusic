package dev.mvc.album;

import java.util.List;

public interface AlbumProcInter {
  /**
   * �ٹ� ���
   * <xmp>
   *  <insert id="create" parameterType="AlbumVO">
   * </xmp>
   * @param albumVO
   * @return
   */
  public int create(AlbumVO albumVO);
  
  /**
   * ��ü ���
   * <xmp>
   *   <select id="list" resultType="AlbumVO">
   * </xmp>
   * @return ����Ʈ ���
   */
  public List<AlbumVO> list();
  
  /**
   * ���� VO ��� join
   * <xmp>
   *  <select id="list_join" resultType="Artist_Album_VO">
   * </xmp>
   * @return
   */
  public List<Artist_Album_VO> list_join();
  
  /**
   * ��ȸ
   * <xmp>
   *  <select id="read" resultType="AlbumVO" parameterType="int">  
   * </xmp>
   * @param albumno
   * @return ��ȸ�� ���ڵ�
   */
  public AlbumVO read(int albumno);
  
  /**
   * ���� �� ��ȸ
   * <xmp>
   *  <select id="read" resultType="AlbumVO" parameterType="int">  
   * </xmp>
   * @param albumno
   * @return ��ȸ�� ���ڵ�
   */
  public AlbumVO read_update(int albumno);
  
  /**
   * ��Ƽ��Ʈ ��ȣ�� ��ȸ
   * <xmp>
   *   <select id="read_artist" resultType="AlbumVO" parameterType="int">
   * </xmp>
   * @param artistno
   * @return
   */
  public List<AlbumVO> read_artist(int artistno);
  
  /**
   * ����
   * <xmp>
   *    <update id="update" parameterType="AlbumVO">
   * </xmp>
   * @param albumVO
   * @return
   */
  public int update(AlbumVO albumVO);
  
  /**
   * ����
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp>
   * @param artistno
   * @return
   */
  public int delete(int albumno);

}
