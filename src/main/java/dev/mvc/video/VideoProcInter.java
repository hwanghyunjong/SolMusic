package dev.mvc.video;

import java.util.List;

public interface VideoProcInter {
  /**
   * ����
   * <xmp>
   *    <insert id="create" parameterType="VideoVO">
   * </xmp>
   * @param videoVO
   * @return
   */
  public int create(VideoVO videoVO);
  
  /**
   * ��ȸ
   * <xmp>
   *    <select id="read" resultType="VideoVO" parameterType="int">    
   * </xmp>
   * @param videono
   * @return
   */
  public VideoVO read(int videono);
  
  /**
   * �뷡 ��ȣ�� ��ȸ
   * <xmp>
   *    <select id="read_songno" resultType="VideoVO" parameterType="int">
   * </xmp>
   * @param songno
   * @return
   */
  public VideoVO read_songno(int songno);
  
  /**
   * �ٹ� ��ȣ�� ��ȸ
   * <xmp>
   *    <select id="read_albumno" resultType="VideoVO" parameterType="int">
   * </xmp>
   * @param albumno
   * @return
   */
  public List<VideoVO> read_albumno(int albumno);
  
  /**
   * ��Ƽ��Ʈ ��ȣ�� ��ȸ
   * <xmp>
   *    <select id="read_artistno" resultType="VideoVO" parameterType="int">
   * </xmp>
   * @param artistno
   * @return
   */
  public List<VideoVO> read_artistno(int artistno);
  

}
