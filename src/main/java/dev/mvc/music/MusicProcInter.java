package dev.mvc.music;

import java.util.List;

public interface MusicProcInter {
  /**
   * ����
   * <xmp>
   *  <insert id="create" parameterType="MusicVO"> 
   * </xmp>
   * @param musicVO
   * @return ������ ���ڵ� ����
   */
  public int create(MusicVO musicVO);
  
  /**
   * ���
   * <xmp>
   *    <select id="list" resultType="MusicVO">
   * </xmp>
   * @return ���� ����Ʈ
   */
  public List<MusicVO> list();
  
  /**
   * Music, Album, Artist VO JOIN
   * <xmp>
   *   <select id="artist_album_song_list" parameterType="int" resultMap="Music_Album_Artist_VO">
   * </xmp>
   * @return
   */
  public Music_Album_Artist_VO artist_album_song_list(int songno);
  
  /**
   * ��ȸ
   * <xmp>
   *   <select id="read" resultType="MusicVO" parameterType="int">
   * </xmp>
   * @param songno
   * @return
   */
  public MusicVO read(int songno);
  
  /**
   * ��ȸ ����
   * <xmp>
   *    <select id="read_update" resultType="MusicVO" parameterType="int">
   * </xmp>
   * @param musicVO
   * @return
   */
  public MusicVO read_update(int songno);
  
  /**
   * �ٹ� ��ȣ�� �뷡 ��ȸ
   * <xmp>
   *    <select id="read_albumno" resultType="MusicVO" parameterType="int">
   * </xmp>
   * @param albumno
   * @return
   */
  public List<MusicVO> read_albumno(int albumno);
  
  /**
   * ��Ƽ��Ʈ ��ȣ�� �뷡, �ٹ� ��ȸ
   * <xmp>
   *    <select id="artist_read" parameterType="int" resultType="Music_Album_Artist_VO">
   * </xmp>
   * @param artistno
   * @return
   */
  public List<Music_Album_Artist_VO> artist_read(int artistno);
  
  /**
   * ����
   * <xmp>
   *    <update id="update" parameterType="MusicVO">
   * </xmp>
   * @param musicVO
   * @return
   */
  public int update(MusicVO musicVO);
  
  /**
   * ����
   * <xmp>
   *    <delete id="delete" parameterType="int">
   * </xmp>
   * @param songno
   * @return
   */
  public int delete(int songno);
}
